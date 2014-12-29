SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLP_SEBEST_RECOUNT_PC(
    ID_NAKL_IN INTEGER,
    ID_NAKLD_IN INTEGER,
    ID_SKLAD_IN INTEGER,
    ID_SCHET_IN INTEGER,
    TIP_IN INTEGER,
    DAT_FROM_IN TIMESTAMP,
    MODE_IN INTEGER)
AS
declare variable id_tovar integer;
declare variable dat date;
declare variable id_sklad_seb integer;
declare variable id_uchet_politics integer;
declare variable sebest double precision;
declare variable id_sklad_to integer;
declare variable id_partiya integer;
declare variable id_schet_tip integer;
declare variable tip_name varchar(50);
declare variable id_uchet_politics_in integer;
declare variable id_nakld_depend integer;
declare variable tip_depend integer;
declare variable id_nakl_depend integer;
declare variable tip_depend_name varchar(50);
declare variable id_xoz_oper integer;
declare variable id_xoz_oper_tip integer;
declare variable xoz_oper_name varchar(50);
declare variable id_sklad_depend integer;
begin
  if (id_schet_in is null) then begin
    /*Идентификаторы*/
    select oid
      from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
      into :id_schet_tip;
    select oid
      from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ БУХ',:id_schet_tip)
      into :id_schet_in;
  end

  if (dat_from_in is null) then begin
    dat_from_in='01.01.2000';
  end
  select oid
    from GET_OID_OBJECTS_PC('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('БУХГАЛТЕРСКИЙ УЧЁТ',:id_uchet_politics_in)
    into :id_uchet_politics_in;
  select first 1 id_sklad,id_uchet_politics
    from sklad_sebest_settings_pc(:ID_SKLAD_IN, :id_uchet_politics_in)
    into :id_sklad_seb,:id_uchet_politics; 

  if (id_nakl_in is null)  then begin
    select id_nakl
      from naklot ot
      where ot.id_nakld=:id_nakld_in
      into :id_nakl_in;
  end
  /*if (tip_in is null) then begin */
    select tip,id_currency_to
      from naklo om
      where om.id_nakl=:id_nakl_in
      into :tip_in,:id_xoz_oper;
  /*end   */
  select name from get_name_objects_pc(:tip_in,-100) into :tip_name;

  /*Пересчёт одной позиции*/
  if (mode_in in (1,3,4)) then begin
    /*При пересчёте позиции нужно удалить старые проводки по ней*/
    delete from provodki pr
    where pr.id_nakl=:id_nakl_in
      and pr.id_schet=:id_schet_in
      and pr.attr1=:id_nakld_in;
    if (tip_name='ПРИХОДНЫЕ НАКЛАДНЫЕ') then begin
      select sebest
        from naklot_sebest2_count_pc(:ID_NAKLD_IN,:id_uchet_politics,:id_schet_in,8,1)
        into :sebest;      
    end
    if (tip_name='РАСХОДНЫЕ НАКЛАДНЫЕ') then begin
      select oid
        from get_oid_objects_pc('ХОЗЯЙСТВЕННЫЕ ОПЕРАЦИИ',-100)
        into :id_xoz_oper_tip;
      select name
        from get_name_objects_pc(:id_xoz_oper,:id_xoz_oper_tip)
        into :xoz_oper_name;
      if (xoz_oper_name='РАСХОДНАЯ НАКЛАДНАЯ И КАК ПРИХОДНАЯ') then begin
        select sebest
          from NAKLOT_SEBEST2_NAKLR_ASP_PC(:ID_NAKLD_IN,:id_uchet_politics,:id_schet_in)
          into :sebest;
      end
      select sebest
        from naklot_sebest2_naklr_pc(:ID_NAKLD_IN,:id_uchet_politics,:id_schet_in)
        into :sebest;    
    end
    if (tip_name='БУХГАЛТЕРСКОЕ ПЕРЕМЕЩЕНИЕ') then begin
      select sebest
        from naklot_sebest2_naklr_pc(:ID_NAKLD_IN,:id_uchet_politics,:id_schet_in)
        into :sebest;
      select sebest
        from naklot_sebest2_perem_bux_pc(:ID_NAKLD_IN,:id_uchet_politics,:id_schet_in)
        into :sebest;        
    end
                           
  end
  /*Для расходов нет зависимых накладных и после них пересчитывать не надо*/
  if (mode_in in (2,3)
    and tip_name in ('БУХГАЛТЕРСКОЕ ПЕРЕМЕЩЕНИЕ','ПРИХОДНЫЕ НАКЛАДНЫЕ'))
  then begin
    select id_tovar
      from naklot ot
      where ot.id_nakl=:id_nakl_in and
        ot.id_nakld=:id_nakld_in
      into :id_tovar;
    /*Первая партия прихода*/
    if (id_partiya is null) then begin
      select first 1 pr.sub3,pr.dat
        from provodki pr
        where pr.id_schet=:id_schet_in and
          pr.attr1=:id_nakld_in and
          pr.id_nakl=:id_nakl_in and
          pr.debet_kolotp>0 and
          pr.dat>=:dat_from_in
        order by pr.dat,pr.sub3
        into :id_partiya,:dat;
    end
    
    for
      select pr.attr1,pr.tip,pr.id_nakl
        from provodki pr
        where 
          pr.id_schet=:id_schet_in and
          pr.sub1=:id_tovar and
          pr.sub2=:id_sklad_seb and
          pr.tip<>1 and
          pr.dat>=:dat and
          pr.attr1<>:id_nakld_in and
          pr.kredit_kolotp>0
        group by pr.dat,pr.attr1,pr.tip,pr.dat,pr.id_nakl
        order by pr.dat,pr.attr1          
        into :id_nakld_depend,:tip_depend,:id_nakl_depend
    do begin
      select name from get_name_objects_pc(:tip_depend,-100) into :tip_depend_name;
      if (tip_depend_name='РАСХОДНЫЕ НАКЛАДНЫЕ') then begin
        execute procedure naklp_sebest_recount_pc(
          :id_nakl_depend,:id_nakld_depend,:id_sklad_in,
          :id_schet_in,:tip_depend,:dat_from_in,3);
      end
      if (tip_depend_name='БУХГАЛТЕРСКОЕ ПЕРЕМЕЩЕНИЕ') then begin
        select id_sklad_to from naklo om where om.id_nakl=:id_nakl_depend into :id_sklad_to;
        execute procedure naklp_sebest_recount_pc(
          :id_nakl_depend,:id_nakld_depend,:id_sklad_to,
          :id_schet_in,:tip_depend,:dat_from_in,3);
      end
    end
  end
  
  /*Для расходов нет зависимых накладных и после них пересчитывать не надо*/
  if (mode_in in (4)
    and tip_name in ('БУХГАЛТЕРСКОЕ ПЕРЕМЕЩЕНИЕ','ПРИХОДНЫЕ НАКЛАДНЫЕ'))
  then begin
    select id_tovar
      from naklot ot
      where ot.id_nakl=:id_nakl_in and
        ot.id_nakld=:id_nakld_in
      into :id_tovar;
    /*Первая партия прихода.*/
    /*Для бух перемещения нужен склад назначения, а не склад самого бух перем.*/
    if (id_partiya is null) then begin
      select first 1 pr.sub3,pr.dat,pr.sub2
        from provodki pr
        where pr.id_schet=:id_schet_in and
          pr.attr1=:id_nakld_in and
          pr.id_nakl=:id_nakl_in and
          pr.debet_kolotp>0 and
          pr.dat>=:dat_from_in
        order by pr.dat,pr.sub3
        into :id_partiya,:dat,:id_sklad_depend;
    end
    
    for
      select pr.attr1,pr.tip,pr.id_nakl
        from provodki pr
        where 
          pr.id_schet=:id_schet_in and
          pr.sub1=:id_tovar and
          pr.sub2=:id_sklad_depend and
          pr.tip<>1 and
          pr.sub3=:id_partiya and
          pr.attr1<>:id_nakld_in and
          pr.kredit_kolotp>0
        group by pr.dat,pr.attr1,pr.tip,pr.dat,pr.id_nakl
        order by pr.dat,pr.attr1          
        into :id_nakld_depend,:tip_depend,:id_nakl_depend
    do begin
      select name from get_name_objects_pc(:tip_depend,-100) into :tip_depend_name;
      if (tip_depend_name='РАСХОДНЫЕ НАКЛАДНЫЕ') then begin
        execute procedure naklp_sebest_recount_pc(
          :id_nakl_depend,:id_nakld_depend,:id_sklad_in,
          :id_schet_in,:tip_depend,:dat_from_in,1);
      end
      if (tip_depend_name='БУХГАЛТЕРСКОЕ ПЕРЕМЕЩЕНИЕ') then begin
        select id_sklad_to from naklo om where om.id_nakl=:id_nakl_depend into :id_sklad_to;
        execute procedure naklp_sebest_recount_pc(
          :id_nakl_depend,:id_nakld_depend,:id_sklad_to,
          :id_schet_in,:tip_depend,:dat_from_in,4);
      end
    end
  end  

end^

SET TERM ; ^

DESCRIBE PROCEDURE NAKLP_SEBEST_RECOUNT_PC
'Если поменялся приход, на склад, то пересыпать
себестоимость расхода по новому
Используется при повторном проведении складской приходной
накладной


-------------------------------
mode=1 - пересчитать одну позицию
mode=2 - пересчитать зависимые от этой позиции
mode=3 - mode 1+ mode 2.
mode=4 - mode 1+ пересчитать все расходы в этой партии
          + если в партии были перемещения, то пересчитать расходы в партии,
            где перемещение явл приходом

теперь mode=5 это процедура naklp_sebest_part_recount_pc';

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLP_SEBEST_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_SETTINGS_PC TO PROCEDURE NAKLP_SEBEST_RECOUNT_PC;

GRANT SELECT ON NAKLOT TO PROCEDURE NAKLP_SEBEST_RECOUNT_PC;

GRANT SELECT ON NAKLO TO PROCEDURE NAKLP_SEBEST_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE NAKLP_SEBEST_RECOUNT_PC;

GRANT SELECT,DELETE ON PROVODKI TO PROCEDURE NAKLP_SEBEST_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLP_SEBEST_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_NAKLR_ASP_PC TO PROCEDURE NAKLP_SEBEST_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_NAKLR_PC TO PROCEDURE NAKLP_SEBEST_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_PEREM_BUX_PC TO PROCEDURE NAKLP_SEBEST_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO PROCEDURE NAKLP_SEBEST_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO PROCEDURE NAKLPBUX_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO PROCEDURE NAKLP_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO PROCEDURE NAKLP_SEBEST_PART_RECOUNT_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO PROCEDURE NAKLP_SEBEST_RECOUNT_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO PROCEDURE NAKLR_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO PROCEDURE NAKL_PEREM_BUX_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO PROCEDURE PROVODKI_CHECK_SEBEST_BUX_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO POWER_USER;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO SKLAD;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO SNAB;

