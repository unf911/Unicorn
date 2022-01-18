SET TERM ^ ;

CREATE OR ALTER PROCEDURE TEST_NAKLP_SEBEST4_PART_PC 
as
declare variable id_nakld integer;
declare variable id_sklad integer;
declare variable id_partiya bigint;
declare variable tip integer;
declare variable id_prov integer;
declare variable id_schet_tip integer;
declare variable id_schet_sebest_sklad integer;
begin
  execute procedure NAKLP_SEBEST4_PART_RECOUNT_PC('01.01.07',6011,0,806030413);

  id_nakld=1703697;
  id_sklad=0;
  id_partiya=1112023697;
  tip=1;
  select oid
    from GET_OID_OBJECTS_PC('рхо яверю',-100)
    into :id_schet_tip;
  select oid
    from GET_OID_OBJECTS_PC('яеаеярнхлнярэ яйкюд',:id_schet_tip)
    into :id_schet_sebest_sklad;
  /* id_nakl =1185150;*/
  execute procedure naklp_sebest4_recount_pc(:id_nakld, :id_sklad, :id_partiya,:tip,  4);

  for
    select pr.id_prov
      from provodki pr
      where pr.id_schet=:id_schet_sebest_sklad and
        pr.sub3=:id_partiya and
        pr.debet_kolotp is null and pr.kredit_kolotp is null
      into :id_prov
  do begin
    execute procedure error('TEST_NAKLP_SEBEST4_PART_PC '
      || 'missing documents exist: ' || trim(:id_prov));
  end
end
^

SET TERM ; ^


