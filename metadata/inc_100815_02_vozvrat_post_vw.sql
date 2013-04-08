/******************************************************************************/



/******************************************************************************/
/***                                 Views                                  ***/
/******************************************************************************/


CREATE GENERATOR NAKLO_GEN;
/* View: VOZVRAT_VW */
CREATE VIEW VOZVRAT_POST_VW(
    ID_NAKL,
    DAT,
    ID,
    ID_IZG,
    ID_ZAK,
    ID_MANAGER,
    NDS,
    NALOG_NDS,
    BLOCKED,
    POSTED,
    ID_SKLAD,
    COMMENT,
    ID_CURRENCY,
    ID_CURRENCY_TO,
    KURS,
    PARENT_ID_NAKL,
    KURS_INDIRECT,
    DELMARKED,
    NDS_FROM)
AS
select
    ID_NAKL,
    DAT,
    ID,
    ID_IZG,
    ID_ZAK,
    ID_MANAGER,
    NDS,
    NALOG_NDS,
    BLOCKED,
    POSTED,
    ID_SKLAD,
    COMMENT,
    ID_CURRENCY,
    ID_CURRENCY_TO,
    KURS,
    PARENT_ID_NAKL,
    KURS_INDIRECT,
    DELMARKED,
    nds_from
from naklo om,rdb$database
where om.tip=-8 /*¬Œ«¬–¿“ œŒ—“¿¬Ÿ» ”*/
;




/******************************************************************************/
/***                                Triggers                                ***/
/******************************************************************************/


SET TERM ^ ;



/******************************************************************************/
/***                      Triggers for updatable views                      ***/
/******************************************************************************/



/* Trigger: VOZVRAT_VW_AI */
CREATE TRIGGER VOZVRAT_POST_VW_AI FOR VOZVRAT_POST_VW
ACTIVE AFTER INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


/* Trigger: VOZVRAT_VW_AU */
CREATE TRIGGER VOZVRAT_POST_VW_AU FOR VOZVRAT_POST_VW
ACTIVE AFTER UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


/* Trigger: VOZVRAT_VW_BI */
CREATE TRIGGER VOZVRAT_POST_VW_BI FOR VOZVRAT_POST_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


ALTER TRIGGER VOZVRAT_POST_VW_AI
as
  declare variable classid integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('¬Œ«¬–¿“ œŒ—“¿¬Ÿ» ”',-100)
    into :classid;   
  insert into naklo (
      ID_NAKL,
      DAT,
      ID,
      ID_IZG,
      ID_ZAK,
      ID_MANAGER,
      NDS,
      NALOG_NDS,
      BLOCKED,
      POSTED,
      ID_SKLAD,
      COMMENT,
      ID_CURRENCY,
      ID_CURRENCY_TO,
      KURS,
      PARENT_ID_NAKL,
      KURS_INDIRECT,
      DELMARKED,
      nds_from,
      tip)
    values (
      new.ID_NAKL,
      new.DAT,
      new.ID,
      new.ID_IZG,
      new.ID_ZAK,
      new.ID_MANAGER,
      new.NDS,
      new.NALOG_NDS,
      new.BLOCKED,
      new.POSTED,
      new.ID_SKLAD,
      new.COMMENT,
      new.ID_CURRENCY,
      new.ID_CURRENCY_TO,
      new.KURS,
      new.PARENT_ID_NAKL,
      new.KURS_INDIRECT,
      new.DELMARKED,
      new.nds_from,
      :classid);  
end
^


ALTER TRIGGER VOZVRAT_POST_VW_AU
AS
  declare variable classid integer;
begin
  execute procedure can_modify_naklot(new.id_nakl);
  /*◊ÚÓ·˚ ÔÓÎÂ id_zak ÌÂ ·˚ÎÓ ÔÛÒÚ˚Ï*/
  select oid
    from GET_OID_OBJECTS_PC('¬Œ«¬–¿“ œŒ—“¿¬Ÿ» ”',-100)
    into :classid;   
  update naklo
  set
    ID_NAKL=new.id_nakl,
    DAT=new.dat, 
    ID=new.id,
    ID_IZG=new.id_izg, 
    ID_ZAK=new.id_zak,
    ID_MANAGER=new.id_manager,
    NDS=new.nds,
    NALOG_NDS=new.nalog_nds,
    BLOCKED=new.blocked,
    POSTED=new.posted,
    ID_SKLAD=new.id_sklad, 
    COMMENT=new.comment,
    ID_CURRENCY=new.id_currency,
    ID_CURRENCY_TO=new.id_currency_to,
    KURS=new.kurs,
    PARENT_ID_NAKL=new.parent_id_nakl,
    KURS_INDIRECT=new.kurs_indirect,
    DELMARKED=new.delmarked,
    nds_from=new.nds_from
  where
    tip=:classid and id_nakl=old.id_nakl;
end
^


ALTER TRIGGER VOZVRAT_POST_VW_BI
as
begin
  if (new.id_nakl is null) then begin
    NEW.ID_NAKL = GEN_ID(NAKLO_GEN,1);
  end
  if (new.kurs_indirect is null) then begin
    new.kurs_indirect=0;
  end
end
^


SET TERM ; ^



/******************************************************************************/
/***                               Privileges                               ***/
/******************************************************************************/


/* Privileges of roles */
GRANT SELECT, REFERENCES ON VOZVRAT_POST_VW TO BOSSES;
GRANT ALL ON VOZVRAT_POST_VW TO BUXG;
GRANT ALL ON VOZVRAT_POST_VW TO SNAB;
GRANT ALL ON VOZVRAT_POST_VW TO POWER_USER;
GRANT SELECT, REFERENCES ON VOZVRAT_POST_VW TO SKLAD;

/* Privileges of triggers */
GRANT UPDATE, REFERENCES ON VOZVRAT_POST_VW TO TRIGGER VOZVRAT_POST_VW_BI;

