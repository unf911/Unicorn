SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLPBUX_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
  declare variable depend_id_nakl integer;
  declare variable name varchar(50);
  declare variable schet_name varchar(50);
  declare variable id_schet_bux integer;
  declare variable id_schet_bux_tara integer;
  declare variable id_schet_spec integer;
  declare variable id_schet_tip integer;
  declare variable id_schet_post integer;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_manager integer;
  declare variable dat date;
  declare variable parent_id_nakl integer;
  declare variable tip integer;
  declare variable nds double precision;
  declare variable nalog_nds double precision;
  declare variable cena double precision;
  declare variable kolotp double precision;
  declare variable id_tovar integer;
  declare variable id_currency integer;
  declare variable id_sklad integer;
  declare variable id_currency_parent integer;
  declare variable id_nakl_zatr integer;
  declare variable zatraty_new double precision;
  declare variable posted integer;
  declare variable delmarked integer;  
  declare variable id_schet_prix integer;
  declare variable tara integer;
  declare variable id_sebest integer;
  declare variable sError varchar(250);
  declare variable id_pos integer;
  declare variable id_uchet_politics_in integer;
  declare variable id_sklad_seb integer;
  declare variable id_uchet_politics integer;
  declare variable id_nakld integer;
  declare variable sebest double precision;
  declare variable id_currency_to integer;
  declare variable kurs_from double precision;
  declare variable kurs_to double precision;  
  declare variable id_currency_uah integer;
  declare variable id_schet_sebest_sklad integer;
  
  declare variable parent_id_izg integer;
  declare variable parent_id_zak integer;
  declare variable parent_id_manager integer;
  declare variable parent_blocked integer;
  declare variable parent_posit_blocked integer;
  declare variable has_role smallint;
  declare variable id_analog integer;
  declare variable id_xoz_oper integer;
  declare variable id_xoz_oper_tip integer;
  declare variable xoz_oper_name varchar(50);
  declare variable id_schet_post_uslug integer;
  declare variable tip_transh integer;
  declare variable zatraty_percent double precision;
begin
  select om.tip,om.id_izg,om.id_zak,om.id_manager,
      om.nds,om.dat,om.parent_id_nakl,
      om.id_currency,om.id_sklad,om.nalog_nds,
      om.posted,om.delmarked,om.id_currency_to,
      om.id_sklad_to
    from naklo om
    where om.id_nakl=:id_nakl
    into :tip,:id_izg, :id_zak,:id_manager,
      :nds,:dat,:parent_id_nakl,
      :id_currency,:id_sklad,:nalog_nds,
      :posted,:delmarked,:id_currency_to,
      :id_xoz_oper;
  select name from get_name_objects_pc(:tip,-100) into :name;
  /*Идентификаторы*/
  select oid
    from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
    into :id_schet_tip;
  if (id_schet is not null) then begin
    select name
      from get_name_objects_pc(:id_schet,:id_schet_tip)
      into schet_name;
  end
  select oid
    from GET_OID_OBJECTS_PC('ХОЗЯЙСТВЕННЫЕ ОПЕРАЦИИ',-100)
    into :id_xoz_oper_tip;
  if (:id_xoz_oper is not null) then begin
    select name
      from get_name_objects_pc(:id_xoz_oper, :id_xoz_oper_tip)
      into :xoz_oper_name;
  end else begin
    xoz_oper_name='ПРИХОДНАЯ БУХ НАКЛАДНАЯ НА ТОВАР';
  end    
  
  if (name='ПРИХОДНЫЕ НАКЛАДНЫЕ') then begin
    select id_currency,
        id_izg, id_zak,id_manager, blocked
      from naklo om2
      where om2.id_nakl=:parent_id_nakl
      into :id_currency_parent,
        :parent_id_izg,:parent_id_zak,:parent_id_manager,parent_blocked;
    /*проверки*/
    if (delmarked<>0) then begin
      execute procedure error ('Нельзя провести удалённый документ');
    end
    if (id_schet =0 ) then begin
      id_schet = null;
    end
    if ((posted<>0) and (id_schet is null)) then begin
      execute procedure error ('Нельзя провести уже проведенный документ');
    end      
    if ((posted=0) and (id_schet is not null)) then begin
      sError = 'Нельзя частично провести не проведенный документ ' || coalesce(:id_schet,999);
      execute procedure error (sError);
    end
    /*Полное проведение снабженцами*/
    if ((posted=0) and (id_schet is null)) then begin
      if (current_timestamp-firstdaymonth(current_timestamp)<=5) then begin
        /*Вплоть до 5 числа можно проводить предыдущий месяц*/
        if (:dat<firstdaymonth (incdate(current_timestamp,0,-1,0))) then begin
          select has_role from get_roles_pc('SNAB') into :has_role;
          if (has_role=1) then begin
            sError ='Снабжению запрещено проведение накладных вплоть до начала предыдущего месяца';
            execute procedure error(sError);
          end
        end
      end else begin
        /*После 5 числа нельзя проводить предыдущий месяц*/
        if (:dat<firstdaymonth(current_timestamp)) then begin
          select has_role from get_roles_pc('SNAB') into :has_role;
          if (has_role=1) then begin
            sError ='Снабжению запрещено проведение накладных до начала этого месяца';
            execute procedure error(sError);
          end
        end /*if (:dat<firstdaymonth(current_timestamp))*/
      end/* if (current_timestamp-firstdaymonth(current_timestamp)<=5)  */
    end/*if ((posted=0) and (id_schet is null))*/
    /*Проверки проводить если только накладная проводиться полностью*/
    if ((id_schet is null) and (xoz_oper_name='ПРИХОДНАЯ БУХ НАКЛАДНАЯ НА ТОВАР')) then begin
      if (:parent_id_nakl is null)  then begin
        execute procedure error('Укажите спецификацию на основании которой создан этот документ');
      end
      if (:id_currency_parent<>:id_currency) then begin
        execute procedure error('Валюта приходной накладной должна совпадать с валютой спецификации');
      end
      /*Цены записываются с НДС, поэтому данная проверка лишняя*/
/*$$IBEC$$       if (Round(:nalog_nds_parent-:nalog_nds,6)<>0) then begin
        execute procedure error('Налог НДС приходной накладной должнен совпадать с Налогом НДС спецификации');
      end $$IBEC$$*/
      /*Известен ли курс ГТД*/
      select oid
        from GET_OID_OBJECTS_PC('ТИП ВАЛЮТ',-100)
        into :id_currency_uah;
      select oid
        from GET_OID_OBJECTS_PC('UAH',:id_currency_uah)
        into :id_currency_uah;
      if (id_currency_uah<>id_currency_to) then begin
        select k.kurs_from, k.usd
          from kurs k
          where k.id_currency_from=:id_currency_uah
            and k.id_currency=:id_currency_to
            and k.dat=:dat
        union all
        select k.usd,k.kurs_from
          from kurs k
          where k.id_currency=:id_currency_uah
            and k.id_currency_from=:id_currency_to
            and k.dat=:dat
        into :kurs_from,:kurs_to;
        if ((kurs_from is null) and (kurs_to is null)) then begin
          execute procedure error('На дату накладной нет курса валюты накладной к гривне');
        end
      end/*Известен ли курс ГТД*/
    end/*if ((id_schet is null) and (xoz_oper_name='ПРИХОДНАЯ БУХ НАКЛАДНАЯ НА ТОВАР'))*/
  
    select oid
      from GET_OID_OBJECTS_PC('НЕСОБЛЮДЕНИЕ СПЕЦИФИКАЦИЙ',:id_schet_tip)
      into :id_schet_spec;
    select oid
      from GET_OID_OBJECTS_PC('НЕСОБЛЮДЕНИЕ ПРИХОДОВ',:id_schet_tip)
      into :id_schet_prix;
    select oid
      from GET_OID_OBJECTS_PC('РАСЧЁТЫ С ПОСТАВЩИКАМИ',:id_schet_tip)
      into :id_schet_post;
    select oid
      from GET_OID_OBJECTS_PC('РАСЧЁТЫ С ПОСТАВЩИКАМИ УСЛУГ',:id_schet_tip)
      into :id_schet_post_uslug;      
    select oid
      from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ БУХ',:id_schet_tip)
      into :id_schet_bux;
    select oid
      from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ БУХ ТАРА',:id_schet_tip)
      into :id_schet_bux_tara;
    select oid
      from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ СКЛАД',:id_schet_tip)
      into :id_schet_sebest_sklad;      
    select oid
      from GET_OID_OBJECTS_PC('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100)
      into :id_uchet_politics_in;
    select oid
      from GET_OID_OBJECTS_PC('БУХГАЛТЕРСКИЙ УЧЁТ',:id_uchet_politics_in)
      into :id_uchet_politics_in;
    /*Удаление проводок по документу только по одному счёту. Для перепроведения*/
    if (id_schet is not null) then begin
      delete from provodki pr
        where pr.id_nakl=:id_nakl
          and pr.tip=:tip
          and pr.id_schet=:id_schet;
    end
    
    if (id_schet is null)  then begin
      for
        select id_nakl
        from naklp_zatr_vw om
        where om.parent_id_nakl=:id_nakl and om.delmarked=0
        into :id_nakl_zatr
      do begin
        execute procedure naklpbux_zatr_post_pc(:id_nakl_zatr,null);
      end /*for zatraty*/
      select sum(nds),sum(zatraty)
        from naklp_zatr_vw om inner join
          spr_statya_vw s on s.oid=om.id_sklad_to
        where om.parent_id_nakl=:id_nakl and om.delmarked=0 and
          s.is_fact=1
        into :zatraty_new,:zatraty_percent;
      /*Если сумма прих бух=0, то для складской затраты будут считаться, как
      сумма процентов, а не делением суммы затрат на сумму бух накл.*/
      zatraty_new=z(Round(dzero(:zatraty_new,:nds,:zatraty_percent/100)*100,2));
        
      update naklp_vw om
        set om.zatraty=:zatraty_new
        where om.id_nakl=:id_nakl and
          Round(z(om.zatraty)-:zatraty_new,2)<>0;
    end /*(id_schet is null)*/    

    update naklo om
      set om.posted=1
      where om.posted=0 and
        om.delmarked=0 and
        om.id_nakl=:id_nakl;     
    if (((id_schet is null) or (schet_name='РАСЧЁТЫ С ПОСТАВЩИКАМИ'))
      and (xoz_oper_name='ПРИХОДНАЯ БУХ НАКЛАДНАЯ НА ТОВАР'))
    then begin
      /*Старые транши при перепроведении удаляются*/
      delete from oplnakl t
        where t.id_to=:id_nakl and t.tip=1;
      /*На всякий случай, а то неверные транши не удалялись*/
      delete from oplnakl t
        where t.id_from=:id_nakl and t.tip=1;
      insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_post,:dat,:tip,
        :nds, :id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_to);
      execute procedure oplaty_auto_spend_pc(:id_schet_post,:id_nakl,:dat, :id_izg,:id_zak, :id_currency_to, 1,0);
    end  /*if РАСЧЁТЫ С ПОСТАВЩИКАМИ*/

    if (((id_schet is null) or (schet_name='РАСЧЁТЫ С ПОСТАВЩИКАМИ'))
      and (xoz_oper_name='ПРИХОДНАЯ БУХ НАКЛАДНАЯ НА ТОВАР АГЕНТСКАЯ'))
    then begin
      /*Старые транши при перепроведении удаляются*/
      delete from oplnakl t
        where t.id_to=:id_nakl and t.tip=1;
      insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_post,:dat,:tip,
        :nds, :id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_to);
      execute procedure oplaty_auto_spend_pc(:id_schet_post,:id_nakl,:dat, :id_izg,:id_zak, :id_currency_to, 1,0);
    end  /*if РАСЧЁТЫ С ПОСТАВЩИКАМИ*/
    
    if (((id_schet is null) or (schet_name='РАСЧЁТЫ С ПОСТАВЩИКАМИ УСЛУГ'))
      and (xoz_oper_name='ПРИХОДНАЯ БУХ НАКЛАДНАЯ НА УСЛУГИ'))
    then begin
      /* -65='ТРАНШ В РАСЧЕТАХ С ПОСТАЩИКАМИ УСЛУГ' */
      select oid
        from get_oid_objects_pc('ТРАНШ В РАСЧЕТАХ С ПОСТАЩИКАМИ УСЛУГ',:id_xoz_oper_tip)
        into :tip_transh;
      /*Старые транши при перепроведении удаляются*/
      delete from oplnakl t
        where t.id_to=:id_nakl and t.tip=:tip_transh;
      insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_post_uslug,:dat,:tip,
        :nds, :id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_to);
      execute procedure oplaty_auto_spend_pc(:id_schet_post_uslug,:id_nakl,
        :dat, :id_izg,:id_zak, :id_currency_to, :tip_transh,0);
    end  /*if РАСЧЁТЫ С ПОСТАВЩИКАМИ*/    
     
    if ((id_schet is null) or
      (schet_name='СЕБЕСТОИМОСТЬ СКЛАД')) then
    begin
       /*если есть уже проведённые складские приходы ссылающиеся
       на данную накладную, то надо пересчитать цены у зависимых
        и перепровести их по себестоимости склада*/ 
      for
        select id_nakl
        from naklo om
        where om.tip=1 and om.posted=1 and om.parent_id_nakl=:id_nakl
        into :depend_id_nakl
      do begin
        execute procedure naklp_post_pc(:depend_id_nakl,:id_schet_sebest_sklad);
        execute procedure naklp_post_pc(:depend_id_nakl,:id_schet_prix);
      end
    end   /*schet_name='СЕБЕСТОИМОСТЬ СКЛАД'*/
    
    
    if ((id_schet is null) or
      (schet_name='СЕБЕСТОИМОСТЬ БУХ') or
      (schet_name='СЕБЕСТОИМОСТЬ БУХ ТАРА')) then
    begin
      select id_sklad,id_uchet_politics
        from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
        into :id_sklad_seb,:id_uchet_politics;
    end
    for
      select ot.id_tovar,ot.cena,ot.kolotp,
          t.tara,ot.id_sebest,ot.id_pos,ot.id_nakld,
          t.id_analog
        from naklot ot inner join tovar t
          on ot.id_tovar=t.oid
        where ot.id_nakl=:id_nakl 
        /*Все товары кроме тары*/
        into :id_tovar,:cena,:kolotp,
          :tara,:id_sebest,:id_pos,:id_nakld,
          :id_analog
    do begin
      if (((id_schet is null) or (schet_name='СЕБЕСТОИМОСТЬ БУХ')) and
        (:tara=2) and
        (:id_uchet_politics is not null) and
        (:dat>='31.05.06')) then
      begin
        select sebest
          from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_bux,8,1)
          into :sebest;
        execute procedure naklp_sebest_recount_pc(:id_nakl, :id_nakld,
          :id_sklad_seb,null,id_schet_bux,:tip,null, 2);
      end
      if (((id_schet is null) or (schet_name='СЕБЕСТОИМОСТЬ БУХ ТАРА')) and
        (:tara=1) and
        (:id_uchet_politics is not null) and
        (:dat>='31.05.06')) then
      begin
        select sebest
          from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_bux_tara,9,1)
          into :sebest;
      end      
      if (tara=2) then begin
        if ((id_schet is null) or (schet_name='НЕСОБЛЮДЕНИЕ СПЕЦИФИКАЦИЙ') ) then begin
          if (id_sebest is null) then begin
            sError = 'Укажите родительскую спецификацию для позиции №' || coalesce(:id_pos,0);
            execute procedure error(sError);
          end
          parent_posit_blocked=null;
          select  blocked
            from naklo om2
            where om2.id_nakl=:id_sebest
            into :parent_blocked;
          select max(kodcn)
          from SPEC_DET_VW ot
          where ot.id_nakl=:id_sebest
            and ot.id_tovar=:id_tovar
          into :parent_posit_blocked;
          if (parent_posit_blocked is null) then begin
            parent_posit_blocked=0;
          end
          if ((parent_posit_blocked=1) or (parent_blocked=1) ) then begin
            parent_posit_blocked=1;
          end
          insert into provodki (id_schet,dat,tip,
              kredit,kredit_kolotp,id_nakl,
              sub1,sub2,sub3,sub4,
              sub5,sub6,sub7,sub8,attr1)
            values(:id_schet_spec,:dat,:tip,
              Round(Round(:cena*:kolotp,2)*(1+:nalog_nds),2),:kolotp, :id_nakl,
              :parent_id_izg,:parent_id_zak,:parent_id_manager,:id_sebest,
              :id_tovar,:id_currency,:parent_posit_blocked,:id_analog,:id_nakld);
        end /*if 'НЕСОБЛЮДЕНИЕ СПЕЦИФИКАЦИЙ'*/
      end /*if tara<>1*/
      if ((id_schet is null) or (schet_name='НЕСОБЛЮДЕНИЕ ПРИХОДОВ') ) then begin
        if (xoz_oper_name<>'ПРИХОДНАЯ БУХ НАКЛАДНАЯ НА ТОВАР АГЕНТСКАЯ') then begin
          if (tara in (1,2)) then begin
            insert into provodki (id_schet,dat,tip,
                debet,debet_kolotp,id_nakl,
                sub1,sub2,sub3,sub4,
                sub5,sub6,sub7)
              values(:id_schet_prix,:dat,:tip,
                Round(Round(:cena*:kolotp,2)*(1+:nalog_nds),2),:kolotp, :id_nakl,
               :id_izg,:id_zak,:id_manager,:id_nakl,
               :id_tovar,:id_currency,:id_sklad);
          end/*if tara in (1,2)*/
        end /*if xoz_oper_name*/
      end /*if 'НЕСОБЛЮДЕНИЕ ПРИХОДОВ'*/
    end/*for naklot*/
  end /*if name='ПРИХОДНЫЕ НАКЛАДНЫЕ'*/
end^

SET TERM ; ^

DESCRIBE PROCEDURE NAKLPBUX_POST_PC
'Снабжение. Приходные накладные. Провести.';

GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE NAKLPBUX_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE NAKLPBUX_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLPBUX_POST_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE NAKLPBUX_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_ROLES_PC TO PROCEDURE NAKLPBUX_POST_PC;

GRANT SELECT ON KURS TO PROCEDURE NAKLPBUX_POST_PC;

GRANT SELECT,INSERT,DELETE ON PROVODKI TO PROCEDURE NAKLPBUX_POST_PC;

GRANT SELECT ON NAKLP_ZATR_VW TO PROCEDURE NAKLPBUX_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLPBUX_ZATR_POST_PC TO PROCEDURE NAKLPBUX_POST_PC;

GRANT SELECT ON SPR_STATYA_VW TO PROCEDURE NAKLPBUX_POST_PC;

GRANT SELECT,UPDATE ON NAKLP_VW TO PROCEDURE NAKLPBUX_POST_PC;

GRANT SELECT,DELETE ON OPLNAKL TO PROCEDURE NAKLPBUX_POST_PC;

GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO PROCEDURE NAKLPBUX_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_POST_PC TO PROCEDURE NAKLPBUX_POST_PC;

GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_SETTINGS_PC TO PROCEDURE NAKLPBUX_POST_PC;

GRANT SELECT ON NAKLOT TO PROCEDURE NAKLPBUX_POST_PC;

GRANT SELECT ON TOVAR TO PROCEDURE NAKLPBUX_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLPBUX_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO PROCEDURE NAKLPBUX_POST_PC;

GRANT SELECT ON SPEC_DET_VW TO PROCEDURE NAKLPBUX_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLPBUX_POST_PC TO PROCEDURE SPEC_BLOCK_PC;
GRANT EXECUTE ON PROCEDURE NAKLPBUX_POST_PC TO PROCEDURE TEMP65_NAKLPBUX_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLPBUX_POST_PC TO PROCEDURE TEMP75_NAKLPBUX_SPECOST_PC;
GRANT EXECUTE ON PROCEDURE NAKLPBUX_POST_PC TO PROCEDURE TEST_OPLATY_AUTO_SPEND_PC;
GRANT EXECUTE ON PROCEDURE NAKLPBUX_POST_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE NAKLPBUX_POST_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE NAKLPBUX_POST_PC TO POWER_USER;
GRANT EXECUTE ON PROCEDURE NAKLPBUX_POST_PC TO SNAB;
