SET TERM ^ ;

CREATE PROCEDURE undelete_naklo_pc(id_nakl integer)
as
begin
  update naklo
  set delmarked=0
  where delmarked=1 and id_nakl=:id_nakl;
end^

SET TERM ; ^

GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE UNDELETE_NAKLO_PC;

GRANT EXECUTE ON PROCEDURE UNDELETE_NAKLO_PC TO "PUBLIC";
GRANT EXECUTE ON PROCEDURE UNDELETE_NAKLO_PC TO SYSDBA;

