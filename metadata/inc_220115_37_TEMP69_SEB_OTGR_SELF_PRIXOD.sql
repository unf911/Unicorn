SET TERM ^ ;

CREATE OR ALTER PROCEDURE TEMP69_SEB_OTGR_SELF_PRIXOD (
    id_sklad_in integer,
    id_tovar_in integer,
    dat_from_in timestamp,
    dat_to_in timestamp)
returns (
    id_tovar integer,
    id_sklad integer,
    id_partiya bigint,
    new_id_partiya bigint,
    kolotp_seb double precision,
    id_nakld integer,
    id_nakl integer,
    dat timestamp,
    tip integer)
as
declare variable id_schet_tip integer;
declare variable id_schet_sebest_sklad integer;
declare variable kolotp_after double precision;
declare variable mode integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ Ñ×ÅÒÀ',-100)
    into :id_schet_tip;
  select oid
    from GET_OID_OBJECTS_PC('ÑÅÁÅÑÒÎÈÌÎÑÒÜ ÑÊËÀÄ',:id_schet_tip)
    into :id_schet_sebest_sklad;   
  for
    select pr.sub1, pr.sub2,pr.sub3,pr.id_nakl,pr.attr1,pr.debet_kolotp,
      pr.tip,pr.dat
    from provodki pr
    where pr.id_schet=11607 and pr.debet_kolotp>0
      and tip=5
      and sub2=:id_sklad_in
      and sub1=:id_tovar_in
      and pr.dat between :dat_from_in and :dat_to_in
    order by pr.dat
    into :id_tovar,:id_sklad, :id_partiya,:id_nakl, :id_nakld, :kolotp_seb,
      :tip,:dat
  do begin
    execute procedure naklp_sebest4_recount_pc(:id_nakld,
      :id_sklad,:id_partiya,:tip,6);
      new_id_partiya=null;
      select first 1 pr.sub3
      from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.attr1=:id_nakld
        and pr.debet_kolotp>0
      into :new_id_partiya;
    suspend;
  end
end
^

SET TERM ; ^


