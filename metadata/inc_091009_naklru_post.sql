SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLRU_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
/*declare variable id_schet integer;*/
  declare variable schet_name varchar(50);
  declare variable id_schet_dolg integer;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_manager integer;
  declare variable dat date;
  declare variable tip integer;
  declare variable classid integer;
  declare variable nds numeric(15,4);
  declare variable id_nakl2 integer;
  declare variable id_schet_tip integer;
  declare variable id_schet_dolg_nal integer;
  declare variable id_currency_uah integer;
  declare variable max_dat_depend_nakl date;
  declare variable id_nakl_depend integer;
  declare variable id_xoz_oper integer;
  declare variable id_xoz_oper_fact integer;
  declare variable id_xoz_oper_tip integer;
  declare variable id_xoz_oper_bux integer;
  declare variable parent_id_nakl integer;
  declare variable id_currency integer;
  declare variable id_schet_finrez integer;
  declare variable id_project integer;
  declare variable id_statya_dox integer;
begin
  /* Procedure Text */
  select om.tip,
      om.id_izg,om.id_zak,om.id_manager,
      om.nds,om.dat,om.id_nakl,om.id_sklad_to,om.parent_id_nakl,
      om.id_currency,om.id_sklad, om.id_currency_to
    from naklo om
    where om.id_nakl=:id_nakl and om.delmarked=0
    into :tip,
      :id_izg,:id_zak,:id_manager,
      :nds,:dat,:id_nakl2,:id_xoz_oper,:parent_id_nakl,
      :id_currency,:id_project,:id_statya_dox;
   /**/


  /*проверки*/
  if (id_nakl2 is null) then begin
    execute procedure error('Документ не найден');
  end
  select oid
    from GET_OID_OBJECTS_PC('РАСХОДНЫЕ НАКЛАДНЫЕ НА УСЛУГИ',-100)
    into :classid;
  if (tip<>classid) then begin
    execute procedure error('Нельзя провести не расходную накладную по аренде');
  end


  select oid
    from get_oid_objects_pc('ХОЗЯЙСТВЕННЫЕ ОПЕРАЦИИ',-100)
    into :id_xoz_oper_tip;
  select oid
    from get_oid_objects_pc('РАСХОДНАЯ НА УСЛУГИ ФАКТ ЧАСТЬ',:id_xoz_oper_tip)
    into :id_xoz_oper_fact;
  select oid
    from get_oid_objects_pc('РАСХОДНАЯ НА УСЛУГИ С КОМИССИЕЙ',:id_xoz_oper_tip)
    into :id_xoz_oper_bux;

  if (id_xoz_oper=:id_xoz_oper_fact) then begin
    if (:parent_id_nakl is null) then begin
      execute procedure error('Нельзя провести без указания родительской накладной');
    end
  end
  select max(dat)
    from naklo om
    where om.tip=:classid and om.delmarked=0 and om.posted=1 and
      om.parent_id_nakl=:id_nakl
    into :max_dat_depend_nakl;
  if (max_dat_depend_nakl is not null) then begin
    if (:dat>incdate(firstdaymonth(max_dat_depend_nakl),0,2,0)) then begin
      execute procedure error('Дата факт части '||
        datetostr(:max_dat_depend_nakl, '%d.%m.%y') ||
        ', поэтому дата должна быть <='||
        datetostr(incdate(firstdaymonth(max_dat_depend_nakl),0,2,0), '%d.%m.%y'));
    end
  end
  execute procedure naklo_can_modify_common_pc(:dat,:id_manager);


  /*идентификаторы объектов*/
  if (id_schet =0 ) then begin
    id_schet = null;
  end

  if (/*$$IBEC$$ (:posted = 1) and $$IBEC$$*/ (id_schet is null)) then begin
    execute procedure naklru_unpost_pc(:id_nakl);
  end


  select oid
    from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
    into :id_schet_tip;
  if (id_schet is not null) then begin
    select name
      from get_name_objects_pc(:id_schet,:id_schet_tip)
      into schet_name;
  end  
  select oid
    from GET_OID_OBJECTS_PC('ДОЛГИ ЗА УСЛУГИ',:id_schet_tip)
    into :id_schet_dolg;
  select oid
    from GET_OID_OBJECTS_PC('ФИНАНСОВЫЙ РЕЗУЛЬТАТ',:id_schet_tip)
    into :id_schet_finrez;
  select oid from GET_OID_OBJECTS_PC('НАЛИЧНЫЕ ДОЛГИ',:id_schet_tip) into :id_schet_dolg_nal;
  select oid from get_oid_objects_pc('ТИП ВАЛЮТ',-100) into :id_currency_uah;
  select oid from get_oid_objects_pc('UAH',:id_currency_uah) into :id_currency_uah;    

  /*Удаление проводок по документу только по одному счёту. Для перепроведения*/
  if (id_schet is not null) then begin
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.tip=:tip
        and pr.id_schet=:id_schet;
  end     

  /*проводки*/
  if ((id_schet is null) or (schet_name='ДОЛГИ ЗА УСЛУГИ') ) then begin
    if (id_xoz_oper<>id_xoz_oper_fact) then begin
      /*Для "Без комиссии" и "С комиссией" сумма попадает в долги по услугам*/
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet_dolg,:dat,:classid,
          :nds,:id_nakl,
          :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency);
    end
  end /*ДОЛГИ ЗА КАБЕЛЬ*/


  if ((id_schet is null) or (schet_name='ФИНАНСОВЫЙ РЕЗУЛЬТАТ')) then begin
    /*С комиссией не влияет на стоимость фирмы, только реальная услуга влияет*/
    if (id_xoz_oper<>id_xoz_oper_bux) then begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(:nds,2),:id_nakl,
          :id_project,:id_statya_dox,:id_currency,:id_izg,:id_zak,:id_manager);
    end
  end /*'ФИНАНСОВЫЙ РЕЗУЛЬТАТ'*/

  if ((id_schet is null) or (schet_name='НАЛИЧНЫЕ ДОЛГИ') ) then begin
    if (id_xoz_oper=id_xoz_oper_bux) then begin
      insert into provodki (id_schet,dat,tip,
        debet,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_dolg_nal,:dat,:tip,
        :nds, :id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency);
      for
        select id_nakl
          from naklo om
          where om.parent_id_nakl=:id_nakl and
            om.posted=1 and
            om.tip=:classid
          into :id_nakl_depend
      do begin
        execute procedure naklru_post_pc(:id_nakl_depend,:id_schet_dolg_nal);
      end  /*for id_nakl_depend*/
    end /*if (id_xoz_oper=id_xoz_oper_bux)*/
    /*Фактическая часть, как отгрузка к расходной*/
    if (id_xoz_oper=id_xoz_oper_fact) then begin
      insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_dolg_nal,:dat,:tip,
        :nds, :id_nakl,
        :id_izg,:id_zak,:id_manager,:parent_id_nakl,:id_currency);
    end /*if (id_xoz_oper=id_xoz_oper_fact)*/
  end /*'НАЛИЧНЫЕ ДОЛГИ'*/
  
  update naklo om
    set om.posted =1
    where om.id_nakl=:id_nakl;
end^

SET TERM ; ^

DESCRIBE PROCEDURE NAKLRU_POST_PC
'Проведение расходной накладной на услуги.
Формы ввода-Расходные накладные на услуги.';

GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE NAKLRU_POST_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE NAKLRU_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLRU_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLO_CAN_MODIFY_COMMON_PC TO PROCEDURE NAKLRU_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLRU_UNPOST_PC TO PROCEDURE NAKLRU_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE NAKLRU_POST_PC;

GRANT SELECT,INSERT,DELETE ON PROVODKI TO PROCEDURE NAKLRU_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLRU_POST_PC TO PROCEDURE NAKLRU_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLRU_POST_PC TO PROCEDURE NAKLRU_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLRU_POST_PC TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT EXECUTE ON PROCEDURE NAKLRU_POST_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE NAKLRU_POST_PC TO BOSSES;
GRANT EXECUTE ON PROCEDURE NAKLRU_POST_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE NAKLRU_POST_PC TO MANAGER;
GRANT EXECUTE ON PROCEDURE NAKLRU_POST_PC TO POWER_USER;

