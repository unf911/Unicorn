SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLO_OTGRUZIT_PC (
    id_nakl integer)
as
declare variable tip smallint;
declare variable posted smallint;
declare variable delmarked smallint;
declare variable otgrugeno smallint;
begin

  /* добавить проверки на безопасность ( шматков может, а
  остальные не могут провести)*/
  select
      n.posted,n.delmarked,n.tip,
      n.otgrugeno
    from
      naklo n
    where
      n.id_nakl = :id_nakl
    into
      :posted,:delmarked,:tip,
      :otgrugeno;
      
    if ((tip<>5) and (tip<>6) and  (tip<>103) and (tip<>30)) then begin
      execute procedure error ('Нельзя отгрузить не складскую накладную');
    end  
    if (delmarked<>0) then begin
      execute procedure error ('Нельзя отгрузить удалённую накладную');
    end
    if ((posted=0)) then begin
      execute procedure error ('Нельзя отгрузить ещё непроведенный документ');
    end
    if ((otgrugeno<>0)) then begin
      execute procedure error ('Нельзя отгрузить уже отгруженный документ');
    end           

    update naklo n
      set n.otgrugeno=1
      where n.id_nakl=:id_nakl and n.otgrugeno=0;
END^

SET TERM ; ^

GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE NAKLO_OTGRUZIT_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE NAKLO_OTGRUZIT_PC;

GRANT EXECUTE ON PROCEDURE NAKLO_OTGRUZIT_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE NAKLO_OTGRUZIT_PC TO POWER_USER;
GRANT EXECUTE ON PROCEDURE NAKLO_OTGRUZIT_PC TO SKLAD;
