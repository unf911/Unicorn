/*-------------------------------------------------------------------------*/
/* Dropping old views */
/*-------------------------------------------------------------------------*/

DROP VIEW SPR_DOLGNOST_VW;

/*-------------------------------------------------------------------------*/
/* Creating new views */
/*-------------------------------------------------------------------------*/

create view SPR_DOLGNOST_VW (
  id,
  name,
  delmarked
)
as
select o.oid, o.name, o.delmarked
  from objects o , rdb$database r
  where classid=11200; /* 'ÑÏÐÀÂÎ×ÍÈÊ ÄÎËÆÍÎÑÒÅÉ' */

/*-------------------------------------------------------------------------*/
/* Restoring descriptions for views */
/*-------------------------------------------------------------------------*/

/*-------------------------------------------------------------------------*/
/* Restoring descriptions of view columns */
/*-------------------------------------------------------------------------*/

/*-------------------------------------------------------------------------*/
/* Restoring triggers for views */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

CREATE TRIGGER SPR_DOLGNOST_VW_BD FOR SPR_DOLGNOST_VW
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER SPR_DOLGNOST_VW_BI FOR SPR_DOLGNOST_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER SPR_DOLGNOST_VW_BU FOR SPR_DOLGNOST_VW
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

ALTER TRIGGER SPR_DOLGNOST_VW_BD
as
begin
  delete from objects o
    where o.oid=old.id;
end^

ALTER TRIGGER SPR_DOLGNOST_VW_BI
as
  declare variable classid integer;
begin
  if (new.id is null) then begin
    new.id=gen_id(oid_gen,1);
  end
  select oid
    from get_oid_objects_pc('ÑÏÐÀÂÎ×ÍÈÊ ÄÎËÆÍÎÑÒÅÉ',-100)
    into :classid;  
  insert into objects (oid,classid,name,delmarked)
    values(new.id,
       :classid,
       new.name,
       new.delmarked
       );
end^

ALTER TRIGGER SPR_DOLGNOST_VW_BU
as
  declare variable classid integer;
begin
  update objects o
  set
    o.delmarked=new.delmarked,
    o.name=new.name
  where o.oid=old.id;
end^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring privileges */
/*-------------------------------------------------------------------------*/



GRANT SELECT,DELETE ON OBJECTS TO TRIGGER SPR_DOLGNOST_VW_BD;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER SPR_DOLGNOST_VW_BI;
GRANT INSERT ON OBJECTS TO TRIGGER SPR_DOLGNOST_VW_BI;
GRANT SELECT,UPDATE ON OBJECTS TO TRIGGER SPR_DOLGNOST_VW_BU;

