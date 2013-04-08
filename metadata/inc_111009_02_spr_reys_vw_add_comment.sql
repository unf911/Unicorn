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

DROP VIEW SPR_REYS_VW;

/*-------------------------------------------------------------------------*/
/* Creating new views */
/*-------------------------------------------------------------------------*/

CREATE VIEW SPR_REYS_VW(
    ID_REYS,
    ID_PEREVOZCHIK,
    FIO_VODITELYA,
    DAT_REYS,
    PUNKT_ZAGRUZKI,
    NOMER_AVTO,
    NOMER_PRITSEPA,
    POKUPATEL_PLATIT,
    CENA_REYSA,
    DELMARKED,
    COMMENT)
AS
select
  om.id_nakl,
  om.id_izg as id_perevozchik,
  om.comment as fio_voditelya,
  om.dat as dat_reys,
  om.dov as punkt_zagruzki,
  /*om.lico as punkt_vygruzki,*/
  om.id as nomer_avto,
  /*(select a.value1
    from attributes a
    where a.oid=om.id_nakl and a.attribute_id=8) as nomer_pritsepa, */
  om.lico as nomer_pritsepa,
  om.kurs_indirect as pokupatel_platit,
  om.nds as cena_reysa,
  om.delmarked,
  (select a.value1
     from attributes a
     where a.oid=om.id_nakl and a.attribute_id=1) as comment
from naklo om , rdb$database
where om.tip= -106  /*ÑÏÐÀÂÎ×ÍÈÊ ÐÅÉÑÎÂ*/
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

CREATE TRIGGER SPR_REYS_VW_AI FOR SPR_REYS_VW
ACTIVE AFTER INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER SPR_REYS_VW_AU FOR SPR_REYS_VW
ACTIVE AFTER UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER SPR_REYS_VW_BI FOR SPR_REYS_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

ALTER TRIGGER SPR_REYS_VW_AI
as
  declare variable classid integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('ÑÏÐÀÂÎ×ÍÈÊ ÐÅÉÑÎÂ',-100)
    into :classid;   
  insert into naklo (
    id_nakl,
    id_izg,
    comment,
    dat,
    dov,
    lico,
    id,
    delmarked,
    kurs_indirect,
    nds,
    tip
  )
  values (
    new.id_reys,
    new.id_perevozchik,
    new.fio_voditelya,
    new.dat_reys,
    new.punkt_zagruzki,
    new.nomer_pritsepa,
    new.nomer_avto,
    new.delmarked,
    new.pokupatel_platit,
    new.cena_reysa,
    :classid);
    
  execute procedure attributes_set2_pc(
    new.id_reys,
    :classid,
    'Êîììåíòàðèé',
    cast(new.comment as varchar(250)));
end^

ALTER TRIGGER SPR_REYS_VW_AU
as
  declare variable classid integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('ÑÏÐÀÂÎ×ÍÈÊ ÐÅÉÑÎÂ',-100)
    into :classid;   
  update naklo
  set id_izg=new.id_perevozchik,
      comment=new.fio_voditelya,
      dat=new.dat_reys,
      dov=new.punkt_zagruzki,
      lico=new.nomer_pritsepa,
      id=new.nomer_avto,
      delmarked=new.delmarked,
      kurs_indirect=new.pokupatel_platit,
      nds=new.cena_reysa,
      comment=new.comment
  where
      id_nakl=old.id_reys and
      tip=:classid;
      
  execute procedure attributes_set2_pc(
    new.id_reys,
    :classid,
    'Êîììåíòàðèé',
    cast(new.comment as varchar(250)));      
end^

ALTER TRIGGER SPR_REYS_VW_BI
as
begin
  if (new.id_reys is null) then begin
    NEW.id_reys = GEN_ID(NAKLO_GEN,1);
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

GRANT SELECT ON ATTRIBUTES TO VIEW SPR_REYS_VW;
GRANT SELECT ON NAKLO TO VIEW SPR_REYS_VW;
GRANT UPDATE, REFERENCES ON SPR_REYS_VW TO TRIGGER SPR_REYS_VW_AI;
GRANT UPDATE, REFERENCES ON SPR_REYS_VW TO TRIGGER SPR_REYS_VW_AU;
GRANT SELECT, UPDATE ON SPR_REYS_VW TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON SPR_REYS_VW TO BUXG;
GRANT SELECT ON SPR_REYS_VW TO MANAGER;
GRANT SELECT ON SPR_REYS_VW TO POWER_USER;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON SPR_REYS_VW TO SKLAD;
GRANT SELECT ON SPR_REYS_VW TO SNAB;


GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER SPR_REYS_VW_AI;
GRANT INSERT ON NAKLO TO TRIGGER SPR_REYS_VW_AI;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER SPR_REYS_VW_AI;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER SPR_REYS_VW_AU;
GRANT SELECT,UPDATE ON NAKLO TO TRIGGER SPR_REYS_VW_AU;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER SPR_REYS_VW_AU;
GRANT SELECT ON ATTRIBUTES TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;
GRANT SELECT,UPDATE ON SPR_REYS_VW TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;
GRANT INSERT ON SPR_VYGRUZKA_VW TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;
GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;

