/******************************************************************************/



/******************************************************************************/
/***                                 Views                                  ***/
/******************************************************************************/


/* View: VOZVRAT_POST_DET_VW */
CREATE VIEW VOZVRAT_POST_DET_VW(
    ID_NAKLD,
    ID_NAKL,
    ID_POS,
    ID_TOVAR,
    CENA,
    KOLOTP,
    KODCN,
    SKIDKA,
    ID_SEBEST)
AS
select
    ID_NAKLD,
    ID_NAKL,
    ID_POS,
    ID_TOVAR,
    CENA,
    KOLOTP,
    KODCN,
    SKIDKA,
    ID_SEBEST
from NAKLOT ot, rdb$database
where
  ot.tip =-8 /*¬Œ«¬–¿“ œŒ—“¿¬Ÿ» ”*/
;




/******************************************************************************/
/***                                Triggers                                ***/
/******************************************************************************/


SET TERM ^ ;



/******************************************************************************/
/***                      Triggers for updatable views                      ***/
/******************************************************************************/



/* Trigger: VOZVRAT_DET_VW_BD0 */
CREATE TRIGGER VOZVRAT_POST_DET_VW_BD0 FOR VOZVRAT_POST_DET_VW
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


/* Trigger: VOZVRAT_DET_VW_BI0 */
CREATE TRIGGER VOZVRAT_POST_DET_VW_BI0 FOR VOZVRAT_POST_DET_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


/* Trigger: VOZVRAT_DET_VW_BU0 */
CREATE TRIGGER VOZVRAT_POST_DET_VW_BU0 FOR VOZVRAT_POST_DET_VW
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


ALTER TRIGGER VOZVRAT_POST_DET_VW_BD0
AS
  declare variable classid integer;
BEGIN
  execute procedure can_modify_naklot(old.id_nakl);
  select oid
    from GET_OID_OBJECTS_PC('¬Œ«¬–¿“ œŒ—“¿¬Ÿ» ”',-100)
    into :classid; 
  DELETE FROM NAKLOT
  WHERE (ID_NAKLD = OLD.ID_NAKLD) and
    (Tip=:classid);
END
^


ALTER TRIGGER VOZVRAT_POST_DET_VW_BI0
AS
  declare variable classid integer;
  declare variable data_fields_change SMALLINT;
  DECLARE VARIABLE delmarked SMALLINT;
  DECLARE VARIABLE posted SMALLINT;
  DECLARE VARIABLE blocked SMALLINT;
BEGIN
  execute procedure can_modify_naklot(new.id_nakl);

  if (new.id_nakld is null) then begin
    new.id_nakld=gen_id(naklot_gen,1);
  end
  select oid
    from GET_OID_OBJECTS_PC('¬Œ«¬–¿“ œŒ—“¿¬Ÿ» ”',-100)
    into :classid;
  INSERT INTO NAKLOT (
    ID_NAKLD,
    ID_NAKL,
    ID_POS,
    ID_TOVAR,
    CENA,
    KOLOTP,
    KODCN,
    SKIDKA,
    ID_SEBEST,
    TIP)
  VALUES (
    NEW.ID_NAKLD,
    NEW.ID_NAKL,
    NEW.ID_POS,
    NEW.ID_TOVAR,
    NEW.CENA,
    NEW.KOLOTP,
    NEW.KODCN,
    NEW.SKIDKA,
    NEW.ID_SEBEST,
    :classid);
END
^


ALTER TRIGGER VOZVRAT_POST_DET_VW_BU0
AS
  declare variable classid integer;
  declare variable data_fields_change SMALLINT;
BEGIN
  if ((z(new.id_nakl)<>z(old.id_nakl)) or
   (z(new.id_nakld)<>z(old.id_nakld)) or (z(new.id_pos)<>z(old.id_pos)) or
   (z(new.id_tovar)<>z(old.id_tovar)) or (z(new.cena)<>z(old.cena)) or
   (z(new.kolotp)<>z(old.kolotp)) or (z(new.id_sebest)<>z(old.id_sebest)) or
   (z(new.skidka)<>z(old.skidka))) then begin
    data_fields_change=1;
  end else begin
    data_fields_change=0;
  end
  execute procedure can_modify_naklot(new.id_nakl);
  select oid
    from GET_OID_OBJECTS_PC('¬Œ«¬–¿“ œŒ—“¿¬Ÿ» ”',-100)
    into :classid; 
  UPDATE NAKLOT
  SET ID_NAKLD = NEW.ID_NAKLD,
      ID_NAKL = NEW.ID_NAKL,
      ID_POS = NEW.ID_POS,
      ID_TOVAR = NEW.ID_TOVAR,
      CENA = NEW.CENA,
      KOLOTP = NEW.KOLOTP,
      KODCN = NEW.KODCN,
      SKIDKA = NEW.SKIDKA,
      ID_SEBEST = NEW.ID_SEBEST
  WHERE (ID_NAKLD = OLD.ID_NAKLD) and
    (TIP = :classid);
END
^


SET TERM ; ^



/******************************************************************************/
/***                               Privileges                               ***/
/******************************************************************************/


/* Privileges of roles */
GRANT SELECT, REFERENCES ON VOZVRAT_POST_DET_VW TO BOSSES;
GRANT ALL ON VOZVRAT_POST_DET_VW TO BUXG;
GRANT ALL ON VOZVRAT_POST_DET_VW TO MANAGER;
GRANT ALL ON VOZVRAT_POST_DET_VW TO POWER_USER;

