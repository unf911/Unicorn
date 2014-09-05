SET TERM ^ ;

CREATE OR ALTER PROCEDURE PROVODKI_CHECK_SEBEST_BUX_PC (
    dat_from_in timestamp,
    dat_to_in timestamp,
    fix integer)
returns (
    id_prov integer,
    id_schet integer,
    dat timestamp,
    id_nakl integer,
    attr1 integer,
    attr2 integer,
    tip integer,
    reason varchar(50))
as
declare variable id_schet_tip integer;
declare variable id_schet_sebest_bux_tara integer;
declare variable id_schet_sebest_bux_tovar integer;
declare variable tip_rasx integer;
declare variable tip_perem integer;
declare variable id_izg integer;
declare variable id_sklad integer;
begin
  if (fix is null) then begin
    fix=0;/*не исправлять*/
  end
  if (dat_from_in is null) then begin
    /*Начало предыдущего месяца*/
    dat_from_in =firstdaymonth(incdate(current_timestamp,0,-1,0));
  end
  if (dat_to_in is null) then begin
    /*Конец текущего месяца*/
    dat_to_in=lastdaymonth(current_timestamp);
  end
  select oid from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100) into :id_schet_tip;
  select oid from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ БУХ ТАРА',:id_schet_tip)
    into :id_schet_sebest_bux_tara;
  select oid from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ БУХ',:id_schet_tip)
    into :id_schet_sebest_bux_tovar;
  select oid
    from GET_OID_OBJECTS_PC('РАСХОДНЫЕ НАКЛАДНЫЕ',-100)
    into :tip_rasx;
  select oid
    from GET_OID_OBJECTS_PC('БУХГАЛТЕРСКОЕ ПЕРЕМЕЩЕНИЕ',-100)
    into :tip_perem;
  /*в расходных удалили тару с нулевой ценой, поэтому
  сумма не изменилась и накладная не перепровелась,
  следовательно остались устаревшие ошибочные проводки
  о расходе тары. Их надо удалить*/    
  for
    select pr.id_prov,pr.id_schet,pr.dat,pr.id_nakl,pr.attr1,pr.attr2,pr.tip
    from naklo om inner join provodki pr
      on om.id_nakl=pr.id_nakl left join naklot ot
      on ot.id_nakld=pr.attr1
    where om.dat between :dat_from_in and :dat_to_in and
      om.tip=:tip_rasx and
      pr.id_schet=:id_schet_sebest_bux_tara and
      ot.id_nakld is null
    into :id_prov,:id_schet,:dat, :id_nakl,:attr1,:attr2 ,:tip
  do begin
    reason='id_nakld deleted for tara';
    if (fix=1) then begin
      delete from provodki pr where pr.id_prov=:id_prov;
    end
    suspend;
  end

  for
    select pr.id_prov,pr.id_schet,pr.dat,pr.id_nakl,pr.attr1,pr.attr2,pr.tip
    from naklo om inner join provodki pr
      on om.id_nakl=pr.id_nakl left join naklot ot
      on ot.id_nakld=pr.attr1
    where om.dat between :dat_from_in and :dat_to_in and
      om.tip=:tip_rasx and
      pr.id_schet=:id_schet_sebest_bux_tovar and
      ot.id_nakld is null
    into :id_prov,:id_schet,:dat, :id_nakl,:attr1,:attr2,:tip
  do begin
    reason='id_nakld deleted for tovar';
    if (fix=1) then begin
      delete from provodki pr where pr.id_prov=:id_prov;
    end
    suspend;
  end


  for
    select pr.id_prov,pr.id_schet,pr.dat,pr.id_nakl,pr.attr1,pr.attr2,pr.tip
    from provodki pr inner join naklo om on om.id_nakl=pr.id_nakl
    where om.dat between :dat_from_in and :dat_to_in and
      om.delmarked=1 and
      om.tip=:tip_rasx and
      pr.id_schet=:id_schet_sebest_bux_tovar
    into :id_prov,:id_schet,:dat, :id_nakl,:attr1,:attr2,:tip         
  do begin
    reason='om.delmarked=1';
    if (fix=1) then begin
      delete from provodki pr where pr.id_prov=:id_prov;
    end
    suspend;
  end


  for
    select pr.id_prov,pr.id_schet,pr.dat,pr.id_nakl,pr.attr1,pr.attr2,pr.tip,
      om.id_izg
    from naklo om inner join provodki pr
      on om.id_nakl=pr.id_nakl inner join naklot ot
      on ot.id_nakld=pr.attr1
    where om.dat between :dat_from_in and :dat_to_in and
      om.tip=:tip_rasx and
      pr.id_schet=:id_schet_sebest_bux_tovar and
      ot.id_tovar<>pr.sub1
    into :id_prov,:id_schet,:dat, :id_nakl,:attr1,:attr2,:tip, :id_izg
  do begin
    reason='sub1<>id_tovar id_izg='|| cast(:id_izg as varchar(20));
    if (fix=1) then begin
      if (id_izg=1264) then begin
        /*неверные товары пересчитывать только для Укк, иначе не
        для всех складов есть учётные политики*/
      /*нужно тестировать*/
      execute procedure naklp_sebest_recount_pc(null,:attr1,
        null, :id_schet_sebest_bux_tovar,null,
        :dat_from_in,1);
      end  /*if (id_izg=1264)*/
    end /* if (fix=1)*/
    suspend;
  end /*for */
  
  for
    select pr.id_prov,pr.id_schet,om.dat,om.id_nakl,ot.id_nakld,pr.attr2,om.tip,
      om.id_izg,om.id_sklad
    from naklo om  inner join naklot ot
      on ot.id_nakl=om.id_nakl inner join tovar t on t.oid=ot.id_tovar
      left join provodki pr
      on om.id_nakl=pr.id_nakl and pr.id_schet=:id_schet_sebest_bux_tovar/*11352*/
        and ot.id_nakld=pr.attr1
    where om.dat between :dat_from_in and :dat_to_in and
      om.tip in (:tip_rasx,:tip_perem) and
      ot.id_tovar=6056 and om.id_nakl=574714 and
      pr.id_nakl is null
      and om.id_sklad=0
      and om.id_izg=1264
      and om.posted=1 and t.tara=2
    into :id_prov,:id_schet,:dat, :id_nakl,:attr1,:attr2,:tip, :id_izg,:id_sklad
  do begin
    id_schet=id_schet_sebest_bux_tovar;
    reason='no id_prov id_izg='|| cast(:id_izg as varchar(20));
    if (fix=1) then begin
      if (id_izg=1264) then begin
        /*неверные товары пересчитывать только для Укк, иначе не
        для всех складов есть учётные политики*/
      /*нужно тестировать*/

      execute procedure naklp_sebest_recount_pc(null,:attr1,
        :id_sklad, :id_schet_sebest_bux_tovar,null,
        :dat_from_in,1);

      end  else begin  /*if (id_izg=1264)*/ 
        if (tip=tip_rasx) then begin
          execute procedure naklr_post_pc(:id_nakl,:id_schet_sebest_bux_tovar/*11352*/);
        end
      end  /*if (id_izg=1264)*/ 
    end /* if (fix=1)*/
    suspend;
  end /*for */

  

  for
    select pr.id_prov,pr.id_schet,om.dat,om.id_nakl,ot.id_nakld,pr.attr2,om.tip,
      om.id_izg,om.id_sklad
    from naklo om  inner join naklot ot
      on ot.id_nakl=om.id_nakl inner join tovar t on t.oid=ot.id_tovar
      left join provodki pr
      on om.id_nakl=pr.id_nakl and pr.id_schet=:id_schet_sebest_bux_tara/*11513*/ and
        ot.id_nakld=pr.attr1
    where om.dat between :dat_from_in and :dat_to_in and
      om.tip in (:tip_rasx,:tip_perem) and
      pr.id_nakl is null
      and om.posted=1 and t.tara=1
    into :id_prov,:id_schet,:dat, :id_nakl,:attr1,:attr2,:tip, :id_izg,:id_sklad
  do begin
    id_schet=:id_schet_sebest_bux_tara;
    reason='no id_provt id_izg='|| cast(:id_izg as varchar(20));
    if (fix=1) then begin
      if (id_izg=1264) then begin
        /*неверные товары пересчитывать только для Укк, иначе не
        для всех складов есть учётные политики*/
      /*нужно тестировать*/
      execute procedure naklp_sebest_recount_pc(null,:attr1,
        :id_sklad, :id_schet_sebest_bux_tovar,null,
        :dat_from_in,1);
      end     else begin  /*if (id_izg=1264)*/
        if (tip=tip_rasx) then begin
          execute procedure naklr_post_pc(:id_nakl,:id_schet_sebest_bux_tara);
        end
      end  /*if (id_izg=1264)*/ 
    end /* if (fix=1)*/
    suspend;
  end /*for */

  

/*$$IBEC$$   for
    select r.sub1,r.sub2,r.sub3,r.sub4
      from rep_oborotka2_pc(:id_schet_sebest_bux_tovar,:dat_from_in,:dat_to_in,
        null,null,
        null,null,
        null,null,
        null,null,
        null,null) r
      where Round(r.kolotp_after,3)>0
      into :sub1,:sub2,:sub3 ,:sub4
  do begin
    for 
    select first 1  pr.id_prov,pr.id_schet,pr.dat,pr.id_nakl,pr.attr1,pr.attr2,pr.tip
      from provodki pr
        where pr.id_schet=:id_schet_sebest_bux_tovar and
          pr.sub1=:sub1 and pr.sub2=:sub2 and pr.sub3>:sub3 and
          pr.sub4=:sub4 and
          pr.dat between :dat_from_in and :dat_to_in and
          pr.kredit_kolotp>0
      into :id_prov,:id_schet,:dat, :id_nakl,:attr1,:attr2,:tip
    do begin
      reason='RasxSPP sub2='||coalesce(:sub2, 0)|| 'sub3='||coalesce(:sub3, 0);
      if (fix=1) then begin
          $$IBEC$$*//*нужно тестировать*/
         /*
        execute procedure naklp_sebest_recount_pc(null,:attr1,
        null, :id_schet_sebest_bux_tovar,null,
        :dat_from_in,1);
        *//*$$IBEC$$ 
      end
      suspend;
    end
  end $$IBEC$$*/


  for
    select pr.id_prov,pr.id_schet,om.dat,om.id_nakl,ot.id_nakld,pr.attr2,om.tip,
      om.id_izg,om.id_sklad
    from naklo om
    inner join naklot ot
    on ot.id_nakl=om.id_nakl
    inner join provodki pr
    on pr.attr1=ot.id_nakld
    and pr.id_nakl=om.id_nakl
    where
    om.dat between :dat_from_in and :dat_to_in and
      om.tip =:tip_perem and
      pr.id_schet in (:id_schet_sebest_bux_tara,/*11513*/:id_schet_sebest_bux_tovar)
    and om.posted=1
    and pr.sub4<>om.id_izg
    into :id_prov,:id_schet,:dat, :id_nakl,:attr1,:attr2,:tip, :id_izg,:id_sklad
  do begin
    reason='id_izg<>sub4 id_izg='|| cast(:id_izg as varchar(20));
    if (fix=1) then begin
      if (id_izg=1264) then begin
        /*неверные товары пересчитывать только для Укк, иначе не
        для всех складов есть учётные политики*/
      /*нужно тестировать*/
      /*
        execute procedure naklp_sebest_recount_pc(null,:attr1,
          :id_sklad, :id_schet,null,
          :dat_from_in,1);
          */
        execute procedure nakl_perem_bux_post_pc(:id_nakl,:id_schet);
      end
    end /* if (fix=1)*/
    suspend;
  end

  for
  select pr.id_nakl
    from provodki pr inner join naklo om on om.id_nakl=pr.id_nakl
    where pr.id_schet=11352 and pr.debet_kolotp>0 and
      pr.dat between :dat_from_in and :dat_to_in
      and pr.sub2<>om.id_sklad_to and pr.tip =:tip_perem
    group by pr.id_nakl
    into :id_nakl
  do begin
    reason='id_sklad_to<>sub2 for perem id_izg='|| cast(:id_izg as varchar(20));
    if (fix=1) then begin
     execute procedure nakl_perem_bux_post_pc(:id_nakl,:id_schet);
    end
  end
end^

SET TERM ; ^

DESCRIBE PROCEDURE PROVODKI_CHECK_SEBEST_BUX_PC
'select *
  from naklo om inner join provodki pr
    on om.id_nakl=pr.id_nakl left join naklot ot
    on ot.id_nakld=pr.attr1
  where om.dat>''01.01.07'' and om.tip=3047 and
    (pr.id_schet=11513 /*$$IBEC$$ or pr.id_schet=11352 $$IBEC$$*/)  and
    ot.id_nakld is null
    
    
select *
from provodki_check_sebest_bux_pc(''01.07.07'',''01.12.07'',0)

ОШИБОЧНО Показывает no id_prov id_izg=17896   id_nakl=645443
В этой расходной исп склад на котором нет бух учёта
при случае исправить';

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE PROVODKI_CHECK_SEBEST_BUX_PC;

GRANT SELECT ON NAKLO TO PROCEDURE PROVODKI_CHECK_SEBEST_BUX_PC;

GRANT SELECT,DELETE ON PROVODKI TO PROCEDURE PROVODKI_CHECK_SEBEST_BUX_PC;

GRANT SELECT ON NAKLOT TO PROCEDURE PROVODKI_CHECK_SEBEST_BUX_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO PROCEDURE PROVODKI_CHECK_SEBEST_BUX_PC;

GRANT SELECT ON TOVAR TO PROCEDURE PROVODKI_CHECK_SEBEST_BUX_PC;

GRANT EXECUTE ON PROCEDURE NAKLR_POST_PC TO PROCEDURE PROVODKI_CHECK_SEBEST_BUX_PC;

GRANT EXECUTE ON PROCEDURE NAKL_PEREM_BUX_POST_PC TO PROCEDURE PROVODKI_CHECK_SEBEST_BUX_PC;

GRANT EXECUTE ON PROCEDURE PROVODKI_CHECK_SEBEST_BUX_PC TO PROCEDURE TEST_SEBEST_BUX_PC;
GRANT EXECUTE ON PROCEDURE PROVODKI_CHECK_SEBEST_BUX_PC TO SYSDBA;

