INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT) VALUES (-107, -100, 0, 'ÑÏÐÀÂÎ×ÍÈÊ ÂÛÃÐÓÇÎÊ', 'Ñïðàâî÷íèê âûãðóçîê', 'ÑÏÐÀÂÎ×ÍÈÊ ÂÛÃÐÓÇÎÊ', NULL);



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
    DELMARKED)
AS
select
  om.id_nakl,
  om.parent_id_nakl,
  om.lico,
  om.delmarked
from naklo om , rdb$database
where om.tip= -107  /*ÑÏÐÀÂÎ×ÍÈÊ ÂÛÃÐÓÇÎÊ*/
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
    from GET_OID_OBJECTS_PC('ÑÏÐÀÂÎ×ÍÈÊ ÂÛÃÐÓÇÎÊ',-100)
    into :classid;   
  insert into naklo (
    id_nakl,
    parent_id_nakl,
    lico,
    delmarked,
    tip
  )
  values (
    new.id_vygruzka,
    new.id_reys,
    new.punkt_vygruzki,
    new.delmarked,
    :classid);
end^

ALTER TRIGGER SPR_VYGRUZKA_VW_AU
as
  declare variable classid integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('ÑÏÐÀÂÎ×ÍÈÊ ÂÛÃÐÓÇÎÊ',-100)
    into :classid;   
  update naklo
  set parent_id_nakl=new.id_reys,
      lico=new.punkt_vygruzki,
      delmarked=new.delmarked
  where
      id_nakl=old.id_vygruzka and
      tip=:classid;
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
  declare variable nomer_pritsepa varchar(50);
  declare variable punkt_vygruzki varchar(50);
  declare variable id_reys integer;
begin
  for
    select
      (select a.value1
      from attributes a
      where a.oid=s.id_reys and a.attribute_id=8) as nomer_pritsepa,
      s.nomer_pritsepa as punkt_vygruzki,
      s.id_reys as id_reys
    from spr_reys_vw s
    order by s.id_reys
    into :nomer_pritsepa, :punkt_vygruzki, :id_reys
  do begin
    insert into spr_vygruzka_vw (ID_REYS, PUNKT_VYGRUZKI) values (:id_reys, :punkt_vygruzki);
    
    update spr_reys_vw s
    set s.nomer_pritsepa = :nomer_pritsepa
    where s.id_reys=:id_reys;
  end
end
^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring privileges */
/*-------------------------------------------------------------------------*/

GRANT SELECT, REFERENCES ON SPR_VYGRUZKA_VW TO BOSSES;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON SPR_VYGRUZKA_VW TO BUXG;
GRANT SELECT, REFERENCES ON SPR_VYGRUZKA_VW TO MANAGER;
GRANT SELECT, REFERENCES ON SPR_VYGRUZKA_VW TO OFFICEMANAGER;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON SPR_VYGRUZKA_VW TO POWER_USER;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON SPR_VYGRUZKA_VW TO SKLAD;
GRANT SELECT, REFERENCES ON SPR_VYGRUZKA_VW TO SNAB;


GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER SPR_VYGRUZKA_VW_AI;
GRANT INSERT ON NAKLO TO TRIGGER SPR_VYGRUZKA_VW_AI;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER SPR_VYGRUZKA_VW_AU;
GRANT SELECT,UPDATE ON NAKLO TO TRIGGER SPR_VYGRUZKA_VW_AU;
GRANT SELECT ON ATTRIBUTES TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;
GRANT SELECT,UPDATE ON SPR_REYS_VW TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;
GRANT INSERT ON SPR_VYGRUZKA_VW TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;



