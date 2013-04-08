SET TERM ^ ;



CREATE OR ALTER TRIGGER POSR_VW_BU FOR POSR_VW
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


CREATE OR ALTER TRIGGER POSR_VW_BU FOR POSR_VW
ACTIVE BEFORE UPDATE POSITION 0
as
  declare variable classid integer;
begin
  select oid
    from get_oid_objects_pc('ТИП МЕНЕДЖЕРЫ',-100)
    into :classid;
  update objects o
  set
    o.delmarked=new.delmarked,
    o.name=new.name,
    o.fullname=new.fullname
  where o.oid=old.id;
  execute procedure attributes_set_pc(new.id,'Область видимости для менеджера',
    cast(new.visible_area as varchar(50)));
  execute procedure attributes_set2_pc(new.id, :classid, 'Подпись',
    cast(new.signature as varchar(50)));    
  if ((old.poid is null) and (new.poid is not null)) then begin
    insert into trees (oid,poid,tree_oid)
      values(new.id,new.poid,:classid);
  end else begin
    update trees t
      set t.poid=new.poid,
        t.oid=new.id
      where t.oid=old.id and
        t.tree_oid=:classid;
  end
end
^


SET TERM ; ^


/* Privileges of triggers */
GRANT SELECT, UPDATE ON OBJECTS TO TRIGGER POSR_VW_BU;
GRANT SELECT, INSERT, UPDATE ON TREES TO TRIGGER POSR_VW_BU;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET_PC TO TRIGGER POSR_VW_BU;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER POSR_VW_BU;

