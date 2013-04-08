/*-------------------------------------------------------------------------*/
/* First procedures with empty bodies */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE TEMP65_SKLOST_NAMOT_PC
RETURNS (
    TOVAR_NAME VARCHAR(50),
    BARABAN VARCHAR(50),
    NOMER_TARY VARCHAR(50),
    KOLOTP DOUBLE PRECISION,
    KOLBUXT INTEGER,
    COMMENT VARCHAR(50),
    IZG VARCHAR(50),
    ID_SKLAD INTEGER,
    ID_TOVAR INTEGER,
    ID_TYPE INTEGER)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Dropping old views */
/*-------------------------------------------------------------------------*/

DROP VIEW TOVAR_ALL_VW;

/*-------------------------------------------------------------------------*/
/* Creating new views */
/*-------------------------------------------------------------------------*/

CREATE VIEW TOVAR_ALL_VW(
    NAME,
    EDIZ,
    CENA,
    CENAVX,
    KOD1,
    KOD2,
    KOD3,
    TARA,
    DELMARKED,
    SKLADSKAYA,
    ID_ANALOG,
    ID,
    WEIGHT,
    NOTHING,
    FULLNAME,
    GRUPPA1,
    GRUPPA2,
    GRUPPA3,
    GRUPPA4,
    COPPERPERKM,
    KODVED)
AS
select
  t.name,
  EDIZ,
  CENA,
  CENAVX,
  KOD1,
  KOD2,
  KOD3,
  TARA,
  o.DELMARKED,
  SKLADSKAYA,
  ID_ANALOG,
  o.OID,
  t.weight,
  t.nothing,
  o.fullname,
  t.GRUPPA1,
  t.GRUPPA2,
  t.GRUPPA3,
  t.GRUPPA4,
  t.COPPERPERKM,
  t.kodved
from
  objects o inner join tovar t on t.oid=o.oid
where
  o.classid=3135
;
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

CREATE TRIGGER TOVAR_ALL_VW_AU0 FOR TOVAR_ALL_VW
ACTIVE AFTER UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER TOVAR_ALL_VW_BI0 FOR TOVAR_ALL_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

ALTER TRIGGER TOVAR_ALL_VW_AU0
AS
  declare variable classid integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('“»œ “Œ¬¿–€',-100)
    into :classid;
  update objects o
    set
      o.name=substr(new.name,1,50),
      o.delmarked=new.delmarked,
      o.oid=new.id,
      o.fullname=new.fullname
    where
      o.oid=old.id and o.classid=:classid;
 
  update tovar t
    set t.ediz = new.ediz,
      t.cena=new.cena,
      t.cenavx=new.cenavx,
      t.kod1=new.kod1,
      t.kod2=new.kod2,
      t.kod3=new.kod3,
      t.tara=new.tara,
      t.name=new.name,
      t.delmarked=new.delmarked,
      t.skladskaya=new.skladskaya,
      t.id_analog=new.id_analog,
      t.oid=new.id,
      t.weight=new.weight,
      t.gruppa1=upper(new.gruppa1),
      t.gruppa2=new.gruppa2,
      t.gruppa3=new.gruppa3,
      t.gruppa4=new.gruppa4,
      t.COPPERPERKM=new.copperperkm,
      t.kodved=new.kodved
    where
      t.oid=old.id;
end^

ALTER TRIGGER TOVAR_ALL_VW_BI0
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
      EDIZ,CENA,CENAVX,KOD1,KOD2,
      KOD3,TARA,SKLADSKAYA,ID_ANALOG,weight,
      gruppa1,gruppa2,gruppa3,gruppa4,
      COPPERPERKM, KODVED)
    values (new.name,new.delmarked,new.id,
      new.EDIZ,new.CENA,new.CENAVX,new.KOD1,new.KOD2,
      new.KOD3,new.TARA,new.SKLADSKAYA,new.ID_ANALOG,new.weight,
      upper(new.gruppa1),new.gruppa2,new.gruppa3,new.gruppa4,
      new.COPPERPERKM, new.kodved
    );
end^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring bodies of procedures */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE TEMP65_SKLOST_NAMOT_PC
RETURNS (
    TOVAR_NAME VARCHAR(50),
    BARABAN VARCHAR(50),
    NOMER_TARY VARCHAR(50),
    KOLOTP DOUBLE PRECISION,
    KOLBUXT INTEGER,
    COMMENT VARCHAR(50),
    IZG VARCHAR(50),
    ID_SKLAD INTEGER,
    ID_TOVAR INTEGER,
    ID_TYPE INTEGER)
AS
begin
  for
    select
      /*s.id_ost,*/
      s.id_sklad,
      t.name as tovar,
      s.id_tovar
    from 
      sklost s 
      inner join objects t 
        on t.oid=s.id_tovar
      inner join tovar t2
        on s.id_tovar=t2.oid
    where
      t2.nothing is null and
      t2.tara=2 and
      s.id_sklad=0
    order by   s.id_sklad,t.name
    into :id_sklad,:tovar_name,:id_tovar
  do begin
    for
    select
      t.name, 
      nomer_tary,
      kolotp,
      kolbuxt,
      comment,
      id_type,
      o.name
    from
      sklostt_notime_short_pc(:id_tovar,:id_sklad) d
        inner join
      tovar_all_vw t on d.id_tara=t.id
        inner join objects o  on o.oid=d.id_izg
    where
       t.delmarked=0 and
       t.tara=1 and
       d.comment containing '+'
    order by
      kolotp desc
    into :baraban,:nomer_tary,:kolotp,:kolbuxt,:comment,:id_type,:izg
     do begin
       suspend;
     end
  end

end
^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring privileges */
/*-------------------------------------------------------------------------*/

GRANT SELECT ON OBJECTS TO VIEW TOVAR_ALL_VW;
GRANT SELECT ON TOVAR TO VIEW TOVAR_ALL_VW;
GRANT SELECT ON TOVAR_ALL_VW TO PROCEDURE NAKLO_POST_PC;
GRANT SELECT ON TOVAR_ALL_VW TO PROCEDURE TEMP65_SKLOST_NAMOT_PC;
GRANT SELECT, REFERENCES ON TOVAR_ALL_VW TO BOSSES;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON TOVAR_ALL_VW TO BUXG;
GRANT SELECT, REFERENCES ON TOVAR_ALL_VW TO MANAGER;
GRANT SELECT, REFERENCES ON TOVAR_ALL_VW TO OFFICEMANAGER;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON TOVAR_ALL_VW TO POWER_USER;
GRANT SELECT, REFERENCES ON TOVAR_ALL_VW TO SKLAD;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON TOVAR_ALL_VW TO SNAB;


GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER TOVAR_ALL_VW_AU0;
GRANT SELECT,UPDATE ON OBJECTS TO TRIGGER TOVAR_ALL_VW_AU0;
GRANT SELECT,UPDATE ON TOVAR TO TRIGGER TOVAR_ALL_VW_AU0;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER TOVAR_ALL_VW_BI0;
GRANT INSERT ON OBJECTS TO TRIGGER TOVAR_ALL_VW_BI0;
GRANT INSERT ON TOVAR TO TRIGGER TOVAR_ALL_VW_BI0;
GRANT SELECT ON SKLOST TO PROCEDURE TEMP65_SKLOST_NAMOT_PC;
GRANT SELECT ON OBJECTS TO PROCEDURE TEMP65_SKLOST_NAMOT_PC;
GRANT SELECT ON TOVAR TO PROCEDURE TEMP65_SKLOST_NAMOT_PC;
GRANT EXECUTE ON PROCEDURE SKLOSTT_NOTIME_SHORT_PC TO PROCEDURE TEMP65_SKLOST_NAMOT_PC;
GRANT SELECT ON TOVAR_ALL_VW TO PROCEDURE TEMP65_SKLOST_NAMOT_PC;

