SET TERM ^ ;

CREATE OR ALTER PROCEDURE HAS_IDMANAGER_PC (
    id_manager integer)
returns (
    has_manager smallint)
as
  declare variable poid integer;
  declare variable oid integer;
  declare variable tree_oid integer;
  declare variable classid integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ ÏÎËÜÇÎÂÀÒÅËÈ',-100)
    into :classid;
  select oid
    from GET_OID_OBJECTS_PC('ÑÂßÇÈ',-100)
    into :tree_oid;    
  select oid
    from GET_OID_OBJECTS_PC('ÑÂßÇÈ ÌÅÆÄÓ ÌÅÍÅÄÆÅĞÀÌÈ È ÏÎËÜÇÎÂÀÒÅËßÌÈ',:tree_oid)
    into :tree_oid;
  has_manager = 0;
  poid=:id_manager;
  select o.oid
    from objects o
    where o.name=user and o.classid=:classid
    into :oid;
  if (exists (
    select t.oid
      from trees t
      where t.tree_oid=:tree_oid and t.poid=:poid and t.oid=:oid
    )) then begin
    has_manager = 1;
  end /*if found*/

  suspend;
end
^

SET TERM ; ^


