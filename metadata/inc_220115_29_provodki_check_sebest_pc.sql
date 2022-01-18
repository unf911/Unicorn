SET TERM ^ ;

CREATE OR ALTER PROCEDURE PROVODKI_CHECK_SEBEST_PC (
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
declare variable id_schet_sebest integer;
declare variable tip_naklo integer;
declare variable id_sklad integer;
declare variable id_partiya bigint;
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
  select oid from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ СКЛАД',:id_schet_tip)
    into :id_schet_sebest;
  select oid from GET_OID_OBJECTS_PC('ТИП НАКЛАДНЫХ ДЛЯ СКЛАДА',-100) into :tip_naklo;
  select oid from GET_OID_OBJECTS_PC('Отгрузка',:tip_naklo) into :tip_naklo;
  /*в расходных удалили тару с нулевой ценой, поэтому
  сумма не изменилась и накладная не перепровелась,
  следовательно остались устаревшие ошибочные проводки
  о расходе тары. Их надо удалить*/
  for
    select pr.id_prov,pr.id_schet,pr.dat,pr.id_nakl,pr.attr1,pr.attr2,pr.tip,
        pr.sub2,pr.sub3
      from provodki pr
    where pr.id_schet=:id_schet_sebest/*11607*/
      and tip=:tip_naklo/*5*/ and pr.debet_kolotp>0
      and pr.dat between :dat_from_in and :dat_to_in

    into :id_prov,:id_schet,:dat, :id_nakl,:attr1,:attr2 ,:tip,
      :id_sklad,:id_partiya
  do begin
    reason='otgr kak prixod';
    if (fix=1) then begin
      execute procedure naklp_sebest4_recount_pc(:attr1,
        :id_sklad,:id_partiya,:tip,6);
      execute procedure naklo_post_pc(:id_nakl,:id_schet_sebest);

    end
    suspend;
  end
  
  for
    select pr.id_prov,pr.id_schet,pr.dat,pr.id_nakl,pr.attr1,pr.attr2,pr.tip,
        pr.sub2,pr.sub3
      from provodki pr 
      where
        pr.id_schet=:id_schet_sebest and
        pr.tip<>1 and
        pr.sub3 is null and
        pr.dat between :dat_from_in and :dat_to_in
    into :id_prov,:id_schet,:dat, :id_nakl,:attr1,:attr2 ,:tip,
      :id_sklad,:id_partiya
  do begin
    reason='partiya is null';
    if (fix=1) then begin
      execute procedure naklp_sebest4_recount_pc(:attr1,
        :id_sklad,null,:tip,6);
     /*$$IBEC$$  execute procedure naklo_post_pc(:id_nakl,:id_schet_sebest); $$IBEC$$*/

    end
    suspend;
  end  

  for
    select pr.id_prov,pr.id_schet,pr.dat,pr.id_nakl,pr.attr1,pr.attr2,pr.tip,
        pr.sub2,pr.sub3
    from provodki pr
    where   pr.id_schet=11607 and pr.tip not in (5,103,2,30,10907) and
      pr.dat between :dat_from_in and :dat_to_in
    into :id_prov,:id_schet,:dat, :id_nakl,:attr1,:attr2 ,:tip,
      :id_sklad,:id_partiya
  do begin
    reason='tip not in (5,103,2,30,10907)';
    if (fix=1) then begin
      delete from provodki pr where pr.id_prov=:id_prov;
    end
    suspend;
  end
end
^

SET TERM ; ^


