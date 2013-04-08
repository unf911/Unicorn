SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLP_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
  declare variable schet_name varchar(50);
  DECLARE VARIABLE ID_DET INTEGER;
  DECLARE VARIABLE TIP SMALLINT;
  DECLARE VARIABLE POSTED SMALLINT;
  DECLARE VARIABLE DELMARKED SMALLINT;
  DECLARE VARIABLE ID_TOVAR INTEGER;
  DECLARE VARIABLE ID_NAKLD INTEGER;
  DECLARE VARIABLE ID_SKLAD INTEGER;
  DECLARE VARIABLE ID_uchet_politics INTEGER;
  declare variable str varchar(50);
  declare variable id_pos integer;
  declare variable parent_id_nakl integer;
  declare variable kolotp NUMERIC(15,4);
  declare variable sError varchar(100);
  declare variable sebest double precision;
  declare variable cena double precision;
  declare variable id_schet_tip integer;
  declare variable id_schet_prix integer;
  declare variable dat date;
  declare variable id_currency integer;
  declare variable nalog_nds double precision;
  declare variable parent_id_izg integer;
  declare variable parent_id_zak integer;
  declare variable parent_id_manager integer;
  declare variable tip_prov integer;
  declare variable id_uchet_politics_in integer;
  declare variable id_partiya integer;
  declare variable id_schet_sebest_sklad integer;
  declare variable id_tara integer;
  declare variable kolotp_temp double precision;
  declare variable tip_vozvrat integer;
  declare variable parent_tip integer;
  declare variable has_role integer;
  declare variable naklp_modified integer;
  declare variable parent_id_sklad integer;
  declare variable id_schet_finrez integer;
  declare variable id_statya_dr_tip integer;
  declare variable id_statya_dox integer;
  declare variable id_currency_sebest integer;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_manager integer;
  declare variable id_project integer;
  declare variable sebest_nakl double precision;
  /*$$IBEC$$ declare variable tip_depend integer; $$IBEC$$*/
begin

  /* добавить проверки на безопасность ( шматков может, а
  остальные не могут провести)*/

  select n.posted,n.delmarked,n.id_sklad,n.tip,
      n.parent_id_nakl,
      n.dat,
      n.id_currency,n.nalog_nds,n.id_izg,n.id_zak,n.id_manager
    from naklo n
    where n.id_nakl = :id_nakl
    into :posted,:delmarked,:id_sklad,:tip,
      :parent_id_nakl,
      :dat,:id_currency,:nalog_nds,:id_izg,:id_zak,:id_manager;

  if ((tip<>1) and (tip<>2)) then begin
    execute procedure error ('Нельзя провести не приходную накладную');
  end  
  if (delmarked<>0) then begin
    execute procedure error ('Нельзя провести удалённую накладную');
  end
  if (id_schet =0 ) then begin
    id_schet = null;
  end
  if ((parent_id_nakl is null) and (tip=1) and (dat>'04.10.04')
   and (id_schet is null)) then begin
    execute procedure error ('Нельзя провести без указания приходной бух. накладной');
  end

  if (:tip in(1,2)) then begin

    
   /*приходы, излишки нельзя проводить если предыдущий месяц закрыт, т.е после 7 числа*/
    if ((posted=0) and (id_schet is null)) then begin
    /*приходы, излишки нельзя проводить ВСЕМ если им больше чем naklp_modified дней*/
      select cast(p_value as integer)
        from get_param_pc('naklp_modified')
        into :naklp_modified;
      if ((daysbetween(:dat,current_timestamp)>naklp_modified)
        and (current_user<>'SYSDBA'))
      then begin
        execute procedure error('Запрещено проводить приходы которые были более ' || coalesce(naklp_modified,0) || ' дней назад' );
      end  /*если больше чем naklp_modified (90) дней*/
      if (current_timestamp-firstdaymonth(current_timestamp)<=7) then begin
        /*Вплоть до 7 числа можно проводить предыдущий месяц*/
        if (:dat<firstdaymonth (incdate(current_timestamp,0,-1,0))) then begin
          select has_role from get_roles_pc('SKLAD') into :has_role;
          if (has_role=1) then begin
            sError ='Складу запрещено проведение накладных вплоть до начала предыдущего месяца';
            execute procedure error(sError);
          end
        end
      end else begin
        /*После 7 числа нельзя проводить предыдущий месяц*/
        if (:dat<firstdaymonth(current_timestamp)) then begin
          select has_role from get_roles_pc('SKLAD') into :has_role;
          if (has_role=1) then begin
            sError ='Складу запрещено проведение накладных до начала этого месяца';
            execute procedure error(sError);
          end
        end /*if (:dat<firstdaymonth(current_timestamp))*/
      end/* if (current_timestamp-firstdaymonth(current_timestamp)<=5)  */
    end/*if ((posted=0) and (id_schet is null))*/ 
  end /*if (:tip in(1,2))*/
  
  if ((posted=0) and (id_schet is not null)) then begin
    sError = 'Нельзя частично провести не проведенный документ' || coalesce(:id_schet,999);
    execute procedure error (sError);
  end
  if (id_schet is null) then begin
    /*Генерация тары*/
    for
      select ID_TARA,KOLOTP,KOLOTP_OLD
        from generate_tara(:id_nakl)
       into :id_tara,:kolotp_temp,:kolotp_temp
    do begin
    end
    
    /*чтобы сработал триггер проверяющий разрешения пораньше*/
    update naklo n
      set n.posted=1
      where n.id_nakl=:id_nakl and n.posted=0;
  end  

  
  /*Если заполнено поле parent_id_nakl,
    то копируются цены и затраты, расчитывается
    себестоимость */
  if (parent_id_nakl is not null ) then begin
    execute procedure naklp_prices_naklpbux_pc(:id_nakl);
    select id_currency ,nalog_nds,
        om.id_currency,
        om.nalog_nds
      from naklo om
      where om.id_nakl=:id_nakl
      into :id_currency,:nalog_nds,
        :id_currency,
        :nalog_nds;
    select id_izg,id_zak,id_manager,tip,
        id_sklad
      from naklo om
      where om.id_nakl=:parent_id_nakl
      into :parent_id_izg,:parent_id_zak,:parent_id_manager,:parent_tip,
        :parent_id_sklad;
        
  end /*if (parent_id_nakl is not null )*/
  /*Подготовка к несоблюдению приходов*/
  select oid
    from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
    into :id_schet_tip;
  if (id_schet is not null) then begin
    select name
      from get_name_objects_pc(:id_schet,:id_schet_tip)
      into schet_name;
  end    
  select oid
    from GET_OID_OBJECTS_PC('НЕСОБЛЮДЕНИЕ ПРИХОДОВ',:id_schet_tip)
    into :id_schet_prix;
  select oid
    from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ СКЛАД',:id_schet_tip)
    into :id_schet_sebest_sklad;
  select oid
    from GET_OID_OBJECTS_PC('ФИНАНСОВЫЙ РЕЗУЛЬТАТ',:id_schet_tip)
    into :id_schet_finrez;
  select oid
    from GET_OID_OBJECTS_PC('ТИП СТАТЬИ ДОХОДОВ И РАСХОДОВ',-100)
    into :id_statya_dr_tip;
  select oid
    from GET_OID_OBJECTS_PC('ДОХОД ОТ ИЗЛИШКОВ',:id_statya_dr_tip)
    into :id_statya_dox;
  select oid
    from GET_OID_OBJECTS_PC('ТИП ПРОЕКТЫ',-100)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('ФИРМА',:id_project)
    into :id_project;


  if (tip=1) then begin
    select oid
      from GET_OID_OBJECTS_PC('ПРИХОДНЫЕ СКЛАДСКИЕ НАКЛАДНЫЕ',-100)
      into :tip_prov;
  end else begin
    tip_prov=tip;
  end
  select oid
    from GET_OID_OBJECTS_PC('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('УПРАВЛЕНЧЕСКИЙ УЧЁТ',:id_uchet_politics_in)
    into :id_uchet_politics_in;
  select id_uchet_politics
    from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
    into :id_uchet_politics;
  select oid from get_oid_objects_pc('ВОЗВРАТ',-100) into :tip_vozvrat;
  /*Удаление проводок по документу только по одному счёту. Для перепроведения*/
  if (id_schet is not null) then begin
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.tip=:tip_prov
        and pr.id_schet=:id_schet;
  end
  if ((id_schet is null) or
    (schet_name='НЕСОБЛЮДЕНИЕ ПРИХОДОВ')  )
  then begin
    /*При повторном проведении прихода по складу, если позиция тары
    была удалена, то раньше не удалялась соотв проводка из-за отсутствия
    записи о старой таре. Теперь удаляются все проводки за один раз,
    а новые уже пишутся в цикле по товару
    */
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.id_schet=:id_schet_prix
        and pr.tip=:tip_prov;
  end
    
  for
    select
      t.id_tovar,t.id_nakld,t.id_pos,t.cena,t.kolotp
    from
      naklot t
    where
      t.id_nakl = :id_nakl
    into :id_tovar,:id_nakld,:id_pos,:cena,:kolotp
  do begin
    
    if (tip=1) then begin
    /*специальный тип 555 для приходных накладных,
        т.к. тип 1 забит для остатков в проводках */
       if ((id_schet is null) or
         (schet_name='НЕСОБЛЮДЕНИЕ ПРИХОДОВ')  )
       then begin
           /*При повторном проведении прихода по складу, если позиция тары
          была удалена, то раньше не удалялась соотв проводка из-за отсутствия
          записи о старой таре. Теперь удаляются все проводки за один раз,
          а новые уже пишутся в цикле по товару
          */
          /*delete from provodki pr
            where pr.id_nakl=:id_nakl
              and pr.id_schet=:id_schet_prix
              and pr.tip=:tip_prov
              and pr.sub5=:id_tovar
              and pr.attr1=:id_nakld; */
          insert into provodki (id_schet,dat,tip,
              kredit,kredit_kolotp,id_nakl,
              sub1,sub2,sub3,sub4,
              sub5,sub6,sub7,attr1)
            values(:id_schet_prix,:dat,:tip_prov,
              Round(Round((:cena*:kolotp),2)*(1+:nalog_nds),2),
              :kolotp, :id_nakl,
              :parent_id_izg,:parent_id_zak,:parent_id_manager,:parent_id_nakl,
              :id_tovar,:id_currency,:parent_id_sklad,:id_nakld);
       end  /*Несоблюдение приходов*/

      if ((id_schet is null) or
        (schet_name='СЕБЕСТОИМОСТЬ СКЛАД') ) then begin
        if (:id_uchet_politics is not null) then begin
          /*пересыпать себестоимость по новому*/
          /*Если приход, то надо оприходовать себестоимость на конечный склад*/
          select sebest
            from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,2,2)
            into :sebest;              
          if (parent_id_nakl is not null )  then begin
            if (parent_tip=:tip_vozvrat) then begin
              select sebest,id_partiya
                from naklot_sebest2_vozvr_skl_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad)
                into :sebest,:id_partiya;
            
            end else begin
              select sebest,id_partiya
                from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,1,2)
                into :sebest,:id_partiya;
            end
          end
          if (parent_id_nakl is null )  then begin
           /*если нет родительская накладная*/
            /*Режим 5 создать. Ищем себестоимость в справочнике*/
            select sebest
              from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,5,2)
              into :sebest;
          end /*if parent_id_nakl is null*/          
          /* Здесь был пересчёт зависимых накл, сейчас перенёс ниже*/
        end /*id_uchet*/
      end /*id_schet*/
    end /*tip=1*/

    /*Излишек */
    if (tip=2) then begin
      /*Расчёт себестоимости*/
/*$$IBEC$$       if ((id_schet is null) or
         (schet_name='СЕБЕСТОИМОСТЬ') ) then begin    
        select sebest
          from naklot_sebest_count_pc(:ID_NAKLD,:id_sklad_seb_to,:id_uchet_politics,2,1)
          into :sebest;
        select sebest
          from naklot_sebest_count_pc(:ID_NAKLD,:id_sklad_seb_to,:id_uchet_politics,6,1)
          into :sebest;
      end $$IBEC$$*/
      if ((id_schet is null) or
        (schet_name='СЕБЕСТОИМОСТЬ СКЛАД') ) then begin
        if (:id_uchet_politics is not null) then begin
          /*пересыпать себестоимость по новому*/
          /*Если приход, то надо оприходовать себестоимость на конечный склад*/
          select sebest
            from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,2,2)
            into :sebest;              
          /*Режим 6 создать. Излишки*/
          if (kolotp>0) then begin
            select sebest,id_partiya
              from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,6,2)
              into :sebest,:id_partiya;
          end else begin
            /*Если излишек с отрицательной длиной то он недостача*/
            select sebest,id_partiya
              from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,3,2)
              into :sebest,:id_partiya;
          end
          /* Здесь был пересчёт зависимых накл, сейчас перенёс ниже*/
        end /*id_uchet*/
      end /*id_schet*/      
    end /*if tip=2*/
    /* Пересчёт зависимых накл*/
    /*Чтоб обновление было в одном месте*/
    if ((id_schet is null) or
      (schet_name='СЕБЕСТОИМОСТЬ СКЛАД') ) then begin
      if (:id_uchet_politics is not null) then begin
        /*Пересчитывают после себя только приходы */
        /*Если же необходимо пересчитать излишек,
        то пересчитать родительский приход*/
        if (:tip in (1,2)) then begin
          execute procedure naklp_sebest4_recount_pc(:id_nakld,
            :id_sklad, :id_partiya,:tip,  4);
        end
      end/*if (:id_uchet_politics*/
    end /*if (schet_name='СЕБЕСТОИМОСТЬ СКЛАД')*/ 
    
    /* second loop  */
    if ((id_schet is null)) then begin
      kolotp=null;
      for
        select od.id_det,od.kolotp
        from naklodet od
        where od.id_nakld=:id_nakld
        into :id_det,:kolotp
      do begin
        if ((Round(kolotp*1000,0)-Round(kolotp*1000,3))<>0) then begin
          update naklodet od
          set od.kolotp=Round(od.kolotp,3)
          where od.id_det=:id_det;
        end
        if (kolotp<0) then begin
          str='Ошибка в позиции №' || cast (:id_pos as varchar(3)) ||
            '. Отрицательная длина';
          execute procedure error(str);
        end
        execute procedure naklpdet_post_pc(:id_det);
      end /*for*/
    end /* if id_schet is null */
  end /*for id_nakld*/
      
  if (tip=2) then /*излишек*/
  begin
    if ((id_schet is null) or (schet_name='ФИНАНСОВЫЙ РЕЗУЛЬТАТ') ) then begin
      SELECT u.id_currency_sebest
        FROM spr_uchet_politics_vw u
        WHERE u.oid=:id_uchet_politics AND u.delmarked=0
        INTO :id_currency_sebest;
      select sum(debet)
        from provodki pr
        where pr.id_schet=:id_schet_sebest_sklad and
          pr.tip=:tip and pr.id_nakl=:id_nakl
        into :sebest_nakl;
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(:sebest_nakl,2),:id_nakl,
          :id_project,:id_statya_dox,:id_currency_sebest,:id_izg,:id_zak,:id_manager);
    end /*if id_schet= 'ФИНАНСОВЫЙ РЕЗУЛЬТАТ'*/
  end/*if tip=2*/
/*
добавить запись в таблицу log
*/


   
  /* пересчитать остатки и себестоимость*/
END^

SET TERM ; ^

DESCRIBE PROCEDURE NAKLP_POST_PC
'проводка приходной накладной';

GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE NAKLP_POST_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE NAKLP_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_PARAM_PC TO PROCEDURE NAKLP_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_ROLES_PC TO PROCEDURE NAKLP_POST_PC;

GRANT EXECUTE ON PROCEDURE GENERATE_TARA TO PROCEDURE NAKLP_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_PRICES_NAKLPBUX_PC TO PROCEDURE NAKLP_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLP_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE NAKLP_POST_PC;

GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_SETTINGS_PC TO PROCEDURE NAKLP_POST_PC;

GRANT SELECT,INSERT,DELETE ON PROVODKI TO PROCEDURE NAKLP_POST_PC;

GRANT SELECT ON NAKLOT TO PROCEDURE NAKLP_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLP_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_VOZVR_SKL_PC TO PROCEDURE NAKLP_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO PROCEDURE NAKLP_POST_PC;

GRANT SELECT,UPDATE ON NAKLODET TO PROCEDURE NAKLP_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLPDET_POST_PC TO PROCEDURE NAKLP_POST_PC;

GRANT SELECT ON SPR_UCHET_POLITICS_VW TO PROCEDURE NAKLP_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_POST_PC TO PROCEDURE NAKLO_SEBEST_RECOUNT_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_POST_PC TO PROCEDURE NAKLPBUX_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_POST_PC TO PROCEDURE NAKLP_SEBEST_RECOUNT_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_POST_PC TO PROCEDURE TEMP42_SEBEST_PRIX_RECOUNT;
GRANT EXECUTE ON PROCEDURE NAKLP_POST_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE NAKLP_POST_PC TO UNF;
GRANT EXECUTE ON PROCEDURE NAKLP_POST_PC TO POWER_USER;
GRANT EXECUTE ON PROCEDURE NAKLP_POST_PC TO SKLAD;
