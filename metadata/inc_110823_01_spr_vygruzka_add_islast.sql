/*-------------------------------------------------------------------------*/
/* First procedures with empty bodies */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS
AS
BEGIN
  EXIT;
END^

/*-------------------------------------------------------------------------*/

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Dropping old views */
/*-------------------------------------------------------------------------*/

DROP VIEW SPR_VYGRUZKA_VW;

/*-------------------------------------------------------------------------*/
/* Creating new views */
/*-------------------------------------------------------------------------*/

CREATE VIEW SPR_VYGRUZKA_VW(
    ID_VYGRUZKA,
    ID_REYS,
    PUNKT_VYGRUZKI,
    DELMARKED,
    IS_LAST)
AS
select
  om.id_nakl,
  om.parent_id_nakl,
  om.lico,
  om.delmarked,
  om.kurs_indirect
from naklo om , rdb$database
where om.tip= -107  /*—œ–¿¬Œ◊Õ»  ¬€√–”«Œ */
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

CREATE TRIGGER SPR_VYGRUZKA_VW_AI FOR SPR_VYGRUZKA_VW
ACTIVE AFTER INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER SPR_VYGRUZKA_VW_AU FOR SPR_VYGRUZKA_VW
ACTIVE AFTER UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER SPR_VYGRUZKA_VW_BI FOR SPR_VYGRUZKA_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

ALTER TRIGGER SPR_VYGRUZKA_VW_AI
as
  declare variable classid integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('—œ–¿¬Œ◊Õ»  ¬€√–”«Œ ',-100)
    into :classid;   
  insert into naklo (
    id_nakl,
    parent_id_nakl,
    lico,
    kurs_indirect,
    delmarked,
    tip
  )
  values (
    new.id_vygruzka,
    new.id_reys,
    new.punkt_vygruzki,
    new.is_last,
    new.delmarked,
    :classid);
  if (new.is_last=1) then begin
    update spr_vygruzka_vw
    set is_last=0
    where id_reys=NEW.ID_REYS
      and id_vygruzka<>new.id_vygruzka
      and delmarked=0;
  end
end^

ALTER TRIGGER SPR_VYGRUZKA_VW_AU
as
  declare variable classid integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('—œ–¿¬Œ◊Õ»  ¬€√–”«Œ ',-100)
    into :classid;   
  update naklo
  set parent_id_nakl=new.id_reys,
      lico=new.punkt_vygruzki,
      kurs_indirect=new.is_last,
      delmarked=new.delmarked
  where
      id_nakl=old.id_vygruzka and
      tip=:classid;
  if (new.is_last=1) then begin
    update spr_vygruzka_vw
    set is_last=0
    where id_reys=NEW.ID_REYS
      and id_vygruzka<>new.id_vygruzka
      and delmarked=0;
  end
end^

ALTER TRIGGER SPR_VYGRUZKA_VW_BI
as
begin
  if (new.id_vygruzka is null) then begin
    NEW.id_vygruzka = GEN_ID(NAKLO_GEN,1);
  end
end^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring bodies of procedures */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS
AS
declare variable NOMER_PRITSEPA varchar(50);
declare variable PUNKT_VYGRUZKI varchar(50);
declare variable ID_REYS integer;
declare variable id_vygruzka integer;
begin
  for select(select A.VALUE1 
      from ATTRIBUTES A 
      where A.OID = S.ID_REYS and A.ATTRIBUTE_ID = 8) as NOMER_PRITSEPA, 
          S.NOMER_PRITSEPA as PUNKT_VYGRUZKI, S.ID_REYS as ID_REYS 
      from SPR_REYS_VW S order by S.ID_REYS 
      into :NOMER_PRITSEPA, :PUNKT_VYGRUZKI, :ID_REYS 
  do
  begin
    id_vygruzka = gen_id(naklo_gen, 1);
    insert into SPR_VYGRUZKA_VW(ID_REYS, PUNKT_VYGRUZKI, ID_VYGRUZKA)
    values(:ID_REYS, :PUNKT_VYGRUZKI, :id_vygruzka);

    update SPR_REYS_VW S 
    set S.NOMER_PRITSEPA = :NOMER_PRITSEPA,
      s.pokupatel_platit=0,
      s.cena_reysa=0
    where S.ID_REYS = :ID_REYS;

    update naklo
    set parent_id_nakl=:id_vygruzka
    where parent_id_nakl=:id_reys and tip=3047;
  end
end
^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring privileges */
/*-------------------------------------------------------------------------*/

GRANT INSERT ON SPR_VYGRUZKA_VW TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;
GRANT SELECT, REFERENCES ON SPR_VYGRUZKA_VW TO BOSSES;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON SPR_VYGRUZKA_VW TO BUXG;
GRANT SELECT, REFERENCES ON SPR_VYGRUZKA_VW TO MANAGER;
GRANT SELECT, REFERENCES ON SPR_VYGRUZKA_VW TO OFFICEMANAGER;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON SPR_VYGRUZKA_VW TO POWER_USER;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON SPR_VYGRUZKA_VW TO SKLAD;
GRANT SELECT, REFERENCES ON SPR_VYGRUZKA_VW TO SNAB;


GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER SPR_VYGRUZKA_VW_AI;
GRANT INSERT ON NAKLO TO TRIGGER SPR_VYGRUZKA_VW_AI;
GRANT SELECT,UPDATE ON SPR_VYGRUZKA_VW TO TRIGGER SPR_VYGRUZKA_VW_AI;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER SPR_VYGRUZKA_VW_AU;
GRANT SELECT,UPDATE ON NAKLO TO TRIGGER SPR_VYGRUZKA_VW_AU;
GRANT SELECT,UPDATE ON SPR_VYGRUZKA_VW TO TRIGGER SPR_VYGRUZKA_VW_AU;
GRANT SELECT ON ATTRIBUTES TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;
GRANT SELECT,UPDATE ON SPR_REYS_VW TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;
GRANT INSERT ON SPR_VYGRUZKA_VW TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;
GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;

