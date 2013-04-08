
INSERT INTO CLASS_ATTRIBUTES (OID, ATTRIBUTE_ID, ATTRIBUTE_NAME, ATTRIBUTE_TYPE, CLASSID) VALUES (-106, 1, 'Íîìåð ïðèöåïà', 1, NULL);



/******************************************************************************/



/******************************************************************************/
/***                                 Views                                  ***/
/******************************************************************************/


CREATE GENERATOR NAKLO_GEN;
/* View: SPR_REYS_VW */
CREATE VIEW SPR_REYS_VW(
    ID_REYS,
    ID_PEREVOZCHIK,
    FIO_VODITELYA,
    DAT_REYS,
    PUNKT_ZAGRUZKI,
    PUNKS_VYGRUZKI,
    NOMER_AVTO,
    NOMER_PRITSEPA,
    DELMARKED)
AS
select
  om.id_nakl,
  om.id_izg as id_perevozchik,
  om.comment as fio_voditelya,
  om.dat as dat_reys,
  om.dov as punkt_zagruzki,
  om.lico as punks_vygruzki,
  om.id as nomer_avto,
  (select a.value1
    from attributes a
    where a.oid=om.id_nakl and a.attribute_id=1) as nomer_pritsepa,
  om.delmarked
from naklo om , rdb$database
where om.tip= -106  /*ÑÏÐÀÂÎ×ÍÈÊ ÐÅÉÑÎÂ*/
;




/******************************************************************************/
/***                                Triggers                                ***/
/******************************************************************************/


SET TERM ^ ;



/******************************************************************************/
/***                      Triggers for updatable views                      ***/
/******************************************************************************/



/* Trigger: SPR_REYS_VW_AI */
CREATE TRIGGER SPR_REYS_VW_AI FOR SPR_REYS_VW
ACTIVE AFTER INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


/* Trigger: SPR_REYS_VW_AU */
CREATE TRIGGER SPR_REYS_VW_AU FOR SPR_REYS_VW
ACTIVE AFTER UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


/* Trigger: SPR_REYS_VW_BI */
CREATE TRIGGER SPR_REYS_VW_BI FOR SPR_REYS_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


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
    tip
  )
  values (
    new.id_reys,
    new.id_perevozchik,
    new.fio_voditelya,
    new.dat_reys,
    new.punkt_zagruzki,
    new.punks_vygruzki,
    new.nomer_avto,
    new.delmarked,
    :classid);
  execute procedure attributes_set2_pc(
    new.id_reys,
    :classid,
    'Íîìåð ïðèöåïà',
    cast(new.nomer_pritsepa as varchar(50)));
end
^


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
      lico=new.punks_vygruzki,
      id=new.nomer_avto,
      delmarked=new.delmarked
  where
      id_nakl=old.id_reys and
      tip=:classid;
  execute procedure attributes_set2_pc(
    old.id_reys,
    :classid,
    'Íîìåð ïðèöåïà',
    cast(new.nomer_pritsepa as varchar(50)));
end
^


ALTER TRIGGER SPR_REYS_VW_BI
as
begin
  if (new.id_reys is null) then begin
    NEW.id_reys = GEN_ID(NAKLO_GEN,1);
  end
end
^


SET TERM ; ^



/******************************************************************************/
/***                               Privileges                               ***/
/******************************************************************************/


/* Privileges of roles */
GRANT SELECT ON SPR_REYS_VW TO BUXG;
GRANT SELECT ON SPR_REYS_VW TO MANAGER;
GRANT SELECT ON SPR_REYS_VW TO POWER_USER;
GRANT ALL ON SPR_REYS_VW TO SKLAD;
GRANT SELECT ON SPR_REYS_VW TO SNAB;
