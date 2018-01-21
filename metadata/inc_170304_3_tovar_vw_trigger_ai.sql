SET TERM ^ ;



CREATE OR ALTER TRIGGER TOVAR_ALL_VW_BI0 FOR TOVAR_ALL_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


CREATE OR ALTER TRIGGER TOVAR_ALL_VW_BI0 FOR TOVAR_ALL_VW
ACTIVE BEFORE INSERT POSITION 0
AS
  declare variable classid integer;
begin
  if (new.id is null) then begin
    new.id=gen_id(oid_gen,1);
  end
  select oid
    from GET_OID_OBJECTS_PC('“»œ “Œ¬¿–€',-100)
    into :classid;
  if (new.fullname is null) then begin
    new.fullname=new.name;
  end
  insert into objects (oid,classid,name,fullname,delmarked)
    values(new.id,
       :classid,
       substr(new.name,1,50),
       new.fullname,
       new.delmarked
       );
  insert into tovar (name,delmarked,oid,
      EDIZ,id_ediz, TARA,SKLADSKAYA,ID_ANALOG,weight,
      gruppa1,gruppa2,gruppa3,gruppa4,
      COPPERPERKM, KODVED, IMPORT)
    values (new.name,new.delmarked,new.id,
      new.EDIZ,new.id_ediz, new.TARA,new.SKLADSKAYA,new.ID_ANALOG,new.weight,
      upper(new.gruppa1),new.gruppa2,new.gruppa3,new.gruppa4,
      new.COPPERPERKM, new.kodved, new.import
    );
end
^


SET TERM ; ^


/* Privileges of triggers */
GRANT INSERT ON OBJECTS TO TRIGGER TOVAR_ALL_VW_BI0;
GRANT INSERT ON TOVAR TO TRIGGER TOVAR_ALL_VW_BI0;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER TOVAR_ALL_VW_BI0;
