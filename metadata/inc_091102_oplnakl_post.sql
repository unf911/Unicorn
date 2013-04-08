SET TERM ^ ;

CREATE OR ALTER PROCEDURE OPLNAKL_POST_PC(
    ID INTEGER)
AS
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_schet integer;
  declare variable oidTransh integer;
  /*с какого менеджера снята предоплата*/
  declare variable id_manager_predopl integer;
  declare variable id_currency_to integer;
  declare variable id_temp integer;
  declare variable id_schet_tip integer;
  declare variable id_to integer;
  declare variable id_from integer;
  declare variable id_manager integer;
  declare variable transh double precision;
  declare variable tip integer;
  declare variable opl_data date;
  declare variable id_schet_bank_to integer;
  declare variable id_schet_bank_from integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
    into :id_schet_tip;
  /*Перед проведением удалить старые проводки по траншу*/
  select oid
    from GET_OID_OBJECTS_PC('ТИП ТРАНШИ',-100)
    into :oidTransh;  
  delete from provodki p
    where p.id_nakl=:id and
      p.tip=:oidTransh;

  select
      o.id_to,o.id_from,o.transh,o.tip,o.opl_data
    from oplnakl o
    where o.id=:id
    into :id_to, :id_from,  :transh, :tip, :opl_data;
  select id_izg,id_zak,id_manager,id_currency_to,id_sklad
    from naklo om
    where om.id_nakl=:id_to
    into :id_izg,:id_zak,:id_manager,:id_currency_to,:id_schet_bank_to;
  /*Прих бух накл. Из них не бралась валюта*/
  select id_manager,id_sklad
    from naklo om
    where om.id_nakl=:id_from
    into :id_manager_predopl,:id_schet_bank_from;

  /*'ДОЛГИ ЗА КАБЕЛЬ'*/
  /*'ДОЛГИ ЗА КАБЕЛЬ по Возвратам'*/
  if (:tip in (0,2) ) then begin
    select oid
      from GET_OID_OBJECTS_PC('ДОЛГИ ЗА КАБЕЛЬ',:id_schet_tip)
      into :id_schet;
    if (:tip=2) then begin
      /*Исходящие платежи. Возврат покупателю. Фирма записана в id_zak документа*/
      id_temp=id_izg;
      id_izg=id_zak;
      id_zak=id_temp;
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4)
        values(:id_schet,:opl_data,:oidTransh,
          :transh,:id,
          :id_izg,:id_zak,:id_manager,:id_to);
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager_predopl,:id_from);
    end
    if (:tip=0) then  begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager,:id_to);
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager_predopl,:id_from);
    end
  end /*ДОЛГИ ЗА КАБЕЛЬ*/
  /*Убираем проводки чтобы не удваивать обороты
  по расчётам с поставщиками*/
  /*'РАСЧЁТЫ С ПОСТАВЩИКАМИ'*/
  if (:tip in (1,3) ) then begin
    select oid
      from GET_OID_OBJECTS_PC('РАСЧЁТЫ С ПОСТАВЩИКАМИ',:id_schet_tip)
      into :id_schet;  
    if (:tip=1) then begin
      select b.id_currency from bank_vw b where b.oid=:id_schet_bank_from into :id_currency_to;
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager,:id_to,:id_currency_to);
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager_predopl,:id_from,:id_currency_to);
    end
    if (:tip=3) then begin
      /*Исходящие платежи. Возврат покупателю. Фирма записана в id_zak документа*/
      /*Входящие платежи. Возврат от поставщика*/
      id_temp=id_izg;
      id_izg=id_zak;
      id_zak=id_temp;
      select b.id_currency from bank_vw b where b.oid=:id_schet_bank_to into :id_currency_to;
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager,:id_to,:id_currency_to);
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager_predopl,:id_from,:id_currency_to);
    end  /*if (new.tip=3) then begin*/
  end /*if (new.tip in (1,3) )*/
  /* -65='ТРАНШ В РАСЧЕТАХ С ПОСТАЩИКАМИ УСЛУГ' */
  if (:tip=-65) then begin
    select oid
      from GET_OID_OBJECTS_PC('РАСЧЁТЫ С ПОСТАВЩИКАМИ УСЛУГ',:id_schet_tip)
      into :id_schet;
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet,:opl_data,:oidTransh,
        -:transh,:id,
        :id_izg,:id_zak,:id_manager,:id_to,:id_currency_to);
    insert into provodki (id_schet,dat,tip,
        debet,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet,:opl_data,:oidTransh,
        -:transh,:id,
        :id_izg,:id_zak,:id_manager_predopl,:id_from,:id_currency_to);        
  end
  /*  -50='ТРАНШ В ДОЛГАХ ЗА УСЛУГИ'*/
  if (tip=-50) then begin
    select oid
      from GET_OID_OBJECTS_PC('ДОЛГИ ЗА УСЛУГИ',:id_schet_tip)
      into :id_schet;
    /*Валюту берём из поля naklo.id_currency оплачиваемой накладной,
      а не id_currency_to как в приходных бухг, просто в id_currency_to храниться
      проект расходной накладной на услуги*/
    select id_currency
      from naklo om
      where om.id_nakl=:id_to
      into :id_currency_to;
    insert into provodki (id_schet,dat,tip,
        debet,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet,:opl_data,:oidTransh,
        -:transh,:id,
        :id_izg,:id_zak,:id_manager,:id_to,:id_currency_to);
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet,:opl_data,:oidTransh,
        -:transh,:id,
        :id_izg,:id_zak,:id_manager_predopl,:id_from,:id_currency_to);
  end  /*'ТРАНШ В ДОЛГАХ ЗА УСЛУГИ'*/
  /*ТРАНШ В РАСЧЕТАХ С ПОСТАВЩИКАМИ УСЛУГ ВОЗВРАТ*/
  if (tip=-36) then begin
    select oid
      from GET_OID_OBJECTS_PC('ДОЛГИ ЗА УСЛУГИ',:id_schet_tip)
      into :id_schet;
      /*Исходящие платежи. Возврат покупателю. Фирма записана в id_zak документа*/
      /*Входящие платежи. Возврат от поставщика*/

    id_temp=id_izg;
    id_izg=id_zak;
    id_zak=id_temp;
    select b.id_currency from bank_vw b where b.oid=:id_schet_bank_to into :id_currency_to;
    insert into provodki (id_schet,dat,tip,
        debet,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet,:opl_data,:oidTransh,
        -:transh,:id,
        :id_izg,:id_zak,:id_manager,:id_to,:id_currency_to);
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet,:opl_data,:oidTransh,
        -:transh,:id,
        :id_izg,:id_zak,:id_manager_predopl,:id_from,:id_currency_to);
  end  /*'ТРАНШ В ДОЛГАХ ЗА УСЛУГИ'*/


  /*'ТРАНШ В РАСЧЕТАХ С ПОСТАВЩИКАМИ УСЛУГ ВОЗВРАТ' */
  if (tip=-36) then begin
    select oid
      from GET_OID_OBJECTS_PC('РАСЧЁТЫ С ПОСТАВЩИКАМИ УСЛУГ',:id_schet_tip)
      into :id_schet;
    /*Входящие платежи. Возврат от поставщика услуг*/
    id_temp=id_izg;
    id_izg=id_zak;
    id_zak=id_temp;
    select b.id_currency from bank_vw b where b.oid=:id_schet_bank_to into :id_currency_to;
    insert into provodki (id_schet,dat,tip,
        debet,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet,:opl_data,:oidTransh,
        -:transh,:id,
        :id_izg,:id_zak,:id_manager,:id_to,:id_currency_to);
    insert into provodki (id_schet,dat,tip,
        debet,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet,:opl_data,:oidTransh,
        -:transh,:id,
        :id_izg,:id_zak,:id_manager_predopl,:id_from,:id_currency_to);
  end
  
  /*  -50='ТРАНШ В ДОЛГАХ ЗА ФИНУСЛУГИ'*/
  if (tip=-28) then begin
    select oid
      from GET_OID_OBJECTS_PC('ДОЛГИ ЗА ФИНУСЛУГИ',:id_schet_tip)
      into :id_schet;
    /*Валюту берём из поля naklo.id_currency оплачиваемой накладной,
      а не id_currency_to как в приходных бухг, просто в id_currency_to храниться
      проект расходной накладной на услуги*/
    select id_currency
      from naklo om
      where om.id_nakl=:id_to
      into :id_currency_to;
    insert into provodki (id_schet,dat,tip,
        debet,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet,:opl_data,:oidTransh,
        -:transh,:id,
        :id_izg,:id_zak,:id_manager,:id_to,:id_currency_to);
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet,:opl_data,:oidTransh,
        -:transh,:id,
        :id_izg,:id_zak,:id_manager_predopl,:id_from,:id_currency_to);
  end  /*'ТРАНШ В ДОЛГАХ ЗА ФИНУСЛУГИ'*/  
end^

SET TERM ; ^

DESCRIBE PROCEDURE OPLNAKL_POST_PC
'tip =0  /*''ДОЛГИ ЗА КАБЕЛЬ''*/
tip= 2  /*''ДОЛГИ ЗА КАБЕЛЬ по Возвратам''*/
tip = 1  /*''РАСЧЁТЫ С ПОСТАВЩИКАМИ''*/
tip=3  ''РАСЧЁТЫ С ПОСТАВЩИКАМИ'' возврат';

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE OPLNAKL_POST_PC;

GRANT SELECT,INSERT,DELETE ON PROVODKI TO PROCEDURE OPLNAKL_POST_PC;

GRANT SELECT ON OPLNAKL TO PROCEDURE OPLNAKL_POST_PC;

GRANT SELECT ON NAKLO TO PROCEDURE OPLNAKL_POST_PC;

GRANT SELECT ON BANK_VW TO PROCEDURE OPLNAKL_POST_PC;

GRANT EXECUTE ON PROCEDURE OPLNAKL_POST_PC TO TRIGGER OPLNAKL_PROVODKI_AI10;
GRANT EXECUTE ON PROCEDURE OPLNAKL_POST_PC TO SYSDBA;

