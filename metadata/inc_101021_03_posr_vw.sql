SET TERM ^ ;



CREATE OR ALTER TRIGGER POSR_VW_BI FOR POSR_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


CREATE OR ALTER TRIGGER POSR_VW_BI FOR POSR_VW
ACTIVE BEFORE INSERT POSITION 0
as
  declare variable classid integer;
begin
  if (new.id is null) then begin
    new.id=gen_id(oid_gen,1);
  end
  select oid
    from get_oid_objects_pc('ТИП МЕНЕДЖЕРЫ',-100)
    into :classid;  
  if (new.poid is null or new.poid=0) then begin
    select oid
      from get_oid_objects_pc('Все менеджеры',:classid)
      into new.poid;
  end

  insert into objects (oid,classid,name,fullname,delmarked)
    values(new.id,
       :classid,
       new.name,
       new.fullname,
       new.delmarked
       );
  if (new.visible_area is null) then begin
    new.visible_area=new.id;
  end
  execute procedure attributes_set_pc(new.id,'Область видимости для менеджера',
    cast(new.visible_area as varchar(50)));
  execute procedure attributes_set2_pc(new.id, :classid, 'Подпись',
    cast(new.signature as varchar(50)));
  if (new.poid is not null) then begin
    insert into trees (oid,poid,tree_oid)
      values(new.id,new.poid,:classid);
  end
end
^


SET TERM ; ^


/* Privileges of triggers */
GRANT INSERT ON OBJECTS TO TRIGGER POSR_VW_BI;
GRANT INSERT ON TREES TO TRIGGER POSR_VW_BI;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET_PC TO TRIGGER POSR_VW_BI;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER POSR_VW_BI;
