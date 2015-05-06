SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLO_POLUCHIT_PC (
    id_nakl integer)
as
declare variable tip smallint;
declare variable posted smallint;
declare variable delmarked smallint;
declare variable polucheno smallint;
begin

  select
      n.posted,n.delmarked,n.tip,
      n.polucheno
    from
      naklo n
    where
      n.id_nakl = :id_nakl
    into
      :posted,:delmarked,:tip,
      :polucheno;
      
    if ((tip<>5) and (tip<>6) and  (tip<>103) and (tip<>30)) then begin
      execute procedure error ('Нельзя получить не складскую накладную');
    end  
    if (delmarked<>0) then begin
      execute procedure error ('Нельзя получить удалённую накладную');
    end
    if ((posted=0)) then begin
      execute procedure error ('Нельзя получить ещё непроведенный документ');
    end
    if ((polucheno<>0)) then begin
      execute procedure error ('Нельзя получить уже полученный документ');
    end           

    update naklo n
      set n.polucheno=1
      where n.id_nakl=:id_nakl and n.polucheno=0;
END^

SET TERM ; ^


