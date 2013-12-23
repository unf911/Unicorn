SET TERM ^ ;

CREATE or alter PROCEDURE NAKLP_UNPOST_PC(
    ID_NAKL INTEGER)
AS
DECLARE VARIABLE TIP SMALLINT;
DECLARE VARIABLE POSTED SMALLINT;
DECLARE VARIABLE DELMARKED SMALLINT;
DECLARE VARIABLE ID_TOVAR INTEGER;
DECLARE VARIABLE ID_NAKLD INTEGER;
DECLARE VARIABLE ID_DET INTEGER;
DECLARE VARIABLE ID_SKLAD INTEGER;
DECLARE VARIABLE ID_SKLAD_seb INTEGER;
DECLARE VARIABLE ID_uchet_politics INTEGER;
declare variable sebest double precision;
DECLARE VARIABLE parent_id_nakl INTEGER;
declare variable tip_prov integer;
declare variable id_uchet_politics_in integer;
declare variable dat date;
declare variable naklp_modified integer;
declare variable id_schet_tip integer;
declare variable id_schet_finrez integer;
begin

  /* добавить проверки на безопасность ( шматков может, а
  остальные не могут возвратить)*/
  for
    select
      n.posted,n.delmarked,n.id_sklad,
      n.tip,n.parent_id_nakl,n.dat
    from
      naklo n
    where
      n.id_nakl = :id_nakl
    into
      :posted,:delmarked,:id_sklad,
      :tip,:parent_id_nakl,:dat
  do begin
    if ((tip<>1) and (tip<>2) and (tip<>-110)) then begin
      execute procedure error ('Нельзя возвратить не приходную накладную');
    end   
    if (delmarked<>0) then begin
      execute procedure error ('Нельзя возвратить удалённую накладную');
    end
    if (posted<>1) then begin
      execute procedure error ('Нельзя возвратить не проведенную накладную');
    end
/*приходы, излишки, хранения нельзя возращать если им больше чем naklp_modified дней*/ 
    if (:tip in(1,2)) then begin
      select cast(p_value as integer)
        from get_param_pc('naklp_modified')
        into :naklp_modified;
      if ((daysbetween(:dat,current_timestamp)>naklp_modified)
        and (current_user<>'SYSDBA'))
      then begin
        execute procedure error('Запрещено возвращать приходы которые были более ' || coalesce(naklp_modified,0) || ' дней назад' );
      end  /*если больше чем naklp_modified (90) дней*/ 
    end  /*приходы, излишки, хранения нельзя возращать*/ 
    
    select oid
      from GET_OID_OBJECTS_PC('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100)
      into :id_uchet_politics_in;
    select oid
      from GET_OID_OBJECTS_PC('УПРАВЛЕНЧЕСКИЙ УЧЁТ',:id_uchet_politics_in)
      into :id_uchet_politics_in;
    select oid
      from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
      into :id_schet_tip;
    select oid
      from GET_OID_OBJECTS_PC('ФИНАНСОВЫЙ РЕЗУЛЬТАТ',:id_schet_tip)
      into :id_schet_finrez;         
    /* first loop  */
    
    for
      select
        t.id_tovar,t.id_nakld
      from
        naklot t
      where
        t.id_nakl = :id_nakl
      into :id_tovar,:id_nakld
    do begin
      /* second loop  */
      for
        select
          d.id_det
        from  naklodet d
        where
          d.id_nakld = :id_nakld
        into
          :id_det
      do begin
        /* third loop  */
        execute procedure naklpdet_unpost_pc(:id_det);
        /* пересчитать общее количество данного кабеля */
      end

      /*Расчёт себестоимости*/
      if (tip in (1,2,-110)/*(parent_id_nakl is not null */) then begin
        /*Расчёт себестоимости*/
        for
          select id_sklad,id_uchet_politics
            from sklad_sebest_settings_pc(:ID_SKLAD, :ID_uchet_politics_in)
            into :id_sklad_seb,:id_uchet_politics
        do begin
          select sebest
            from naklot_sebest2_count_pc(:ID_NAKLD,:id_sklad_seb,:id_uchet_politics,2,1)
            into :sebest;
        end
      end/*if tip=1*/
    end /*for*/
    /*Если излишек то тип останется =2*/
    /*Поэтом себест 2 не работает. Процедура naklot_sebest_count
     записывает в счёт 8416 проводки для излишков с типом как у приходов*/
    tip_prov=tip;
    if (tip=1) then begin
      select oid
        from GET_OID_OBJECTS_PC('ПРИХОДНЫЕ СКЛАДСКИЕ НАКЛАДНЫЕ',-100)
        into :tip_prov;
    end
    delete from provodki pr
      where pr.id_nakl=:id_nakl and
        pr.tip=:tip_prov; /*специальный тип для приходных накладных,
          т.к. тип 1 забит для остатков в проводках */

    delete
      from provodki pr
      where pr.id_nakl=:parent_id_nakl and
        pr.tip=:tip_prov and
        pr.id_schet=:id_schet_finrez and
        ((pr.attr1=:id_nakl) or (pr.attr1 is null));

    update naklo n
    set n.posted=0
    where n.id_nakl=:id_nakl;
/* добавить запись в таблицу log */
  end
   
/* пересчитать остатки и себестоимость*/
END^

SET TERM ; ^

DESCRIBE PROCEDURE NAKLP_UNPOST_PC
'откатить проводку приходной накладной';

GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE NAKLP_UNPOST_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE NAKLP_UNPOST_PC;

GRANT EXECUTE ON PROCEDURE GET_PARAM_PC TO PROCEDURE NAKLP_UNPOST_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLP_UNPOST_PC;

GRANT SELECT ON NAKLOT TO PROCEDURE NAKLP_UNPOST_PC;

GRANT SELECT ON NAKLODET TO PROCEDURE NAKLP_UNPOST_PC;

GRANT EXECUTE ON PROCEDURE NAKLPDET_UNPOST_PC TO PROCEDURE NAKLP_UNPOST_PC;

GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_SETTINGS_PC TO PROCEDURE NAKLP_UNPOST_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLP_UNPOST_PC;

GRANT SELECT,DELETE ON PROVODKI TO PROCEDURE NAKLP_UNPOST_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_UNPOST_PC TO PROCEDURE NAKLPDET_UNPOST_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_UNPOST_PC TO PROCEDURE TEMP83_FIX_IZLISHEK_BAR_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_UNPOST_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE NAKLP_UNPOST_PC TO UNF;

