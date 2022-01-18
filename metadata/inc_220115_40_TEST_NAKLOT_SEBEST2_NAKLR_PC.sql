SET TERM ^ ;

CREATE OR ALTER PROCEDURE TEST_NAKLOT_SEBEST2_NAKLR_PC 
as
declare variable id_nakld integer;
declare variable id_schet_tip integer;
declare variable id_schet_bux integer;
declare variable id_uchet_politics_in integer;
declare variable sebest double precision;
declare variable id_partiya bigint;
declare variable id_nakl integer;
declare variable tip integer;
begin
  id_nakld=579109;
  id_nakl = 369746;
  select oid
    from GET_OID_OBJECTS_PC('пюяундмше мюйкюдмше',-100)
    into :tip;
  select oid
    from GET_OID_OBJECTS_PC('рхо яверю',-100)
    into :id_schet_tip;
  select oid
    from GET_OID_OBJECTS_PC('яеаеярнхлнярэ асу',:id_schet_tip)
    into :id_schet_bux;
  select oid
    from GET_OID_OBJECTS_PC('онкхрхйх яохяюмхъ яеаеярнхлнярх',-100)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('асуцюкрепяйхи св╗р',:id_uchet_politics_in)
    into :id_uchet_politics_in;
  delete from provodki pr
    where pr.id_nakl=:id_nakl
      and pr.tip=:tip
      and pr.id_schet=:id_schet_bux
      and pr.attr1=:id_nakld;
  select sebest,id_partiya
    from naklot_sebest2_naklr_pc(:ID_NAKLD,:id_uchet_politics_in,:id_schet_bux)
    into :sebest,:id_partiya;
  if (id_partiya is null) then begin
    execute procedure error('test_naklot_sebest2_naklr_pc. #1');
  end
end
^

SET TERM ; ^


