/*-------------------------------------------------------------------------*/
/* First procedures with empty bodies */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE ZAKAZ_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
BEGIN
  EXIT;
END^

/*-------------------------------------------------------------------------*/

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Dropping old views */
/*-------------------------------------------------------------------------*/

DROP VIEW ZAKAZ_DET_VW;

/*-------------------------------------------------------------------------*/
/* Creating new views */
/*-------------------------------------------------------------------------*/

CREATE VIEW ZAKAZ_DET_VW(
    ID_NAKL,
    ID_NAKLD,
    ID_TOVAR,
    KOLOTP,
    CENA,
    TOVAR_TEXT,
    ID_TOVAR_SNAB,
    ID_POST_SNAB,
    CENA_SNAB,
    SROK_SNAB,
    COMMENT_SNAB,
    SROK_SNAB_TEXT)
AS
select
  id_nakl,id_nakld,id_tovar, kolotp, cena,
  
  (select a.value1
   from attrib_naklot a
   where a.oid=ot.id_nakld and a.attribute_id=2) as tovar_text,
   
  id_pos as id_tovar_snab,
  id_sebest as id_post_snab,
  skidka as cena_snab,
  kodcn as srok_snab,

  (select a.value1
     from attrib_naklot a
     where a.oid=ot.id_nakld and a.attribute_id=3) as comment_snab,
  (select a.value1
     from attrib_naklot a
     where a.oid=ot.id_nakld and a.attribute_id=4) as comment_snab
     
from naklot ot,rdb$database
where ot.tip=8564 /*ЗАКАЗ*/
;
/*-------------------------------------------------------------------------*/
/* Restoring descriptions for views */
/*-------------------------------------------------------------------------*/

DESCRIBE VIEW ZAKAZ_DET_VW
'srok_snab- удалить';

/*-------------------------------------------------------------------------*/
/* Restoring descriptions of view columns */
/*-------------------------------------------------------------------------*/

/*-------------------------------------------------------------------------*/
/* Restoring triggers for views */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

CREATE TRIGGER ZAKAZ_DET_VW_AI FOR ZAKAZ_DET_VW
ACTIVE AFTER INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER ZAKAZ_DET_VW_BD FOR ZAKAZ_DET_VW
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER ZAKAZ_DET_VW_BI FOR ZAKAZ_DET_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER ZAKAZ_DET_VW_BU1 FOR ZAKAZ_DET_VW
ACTIVE BEFORE UPDATE POSITION 1
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

ALTER TRIGGER ZAKAZ_DET_VW_AI
AS
  declare variable classid integer;
BEGIN
  execute procedure can_modify_naklot(new.id_nakl);
  select oid
    from GET_OID_OBJECTS_PC('ЗАКАЗ',-100)
    into :classid;
  INSERT INTO NAKLOT (
    id_nakl,id_nakld,id_tovar, kolotp, cena,
    id_pos,id_sebest,skidka,kodcn,tip)
  VALUES (
    new.id_nakl,new.id_nakld,new.id_tovar,new.kolotp,new.cena,
    new.id_tovar_snab,new.id_post_snab,new.cena_snab,new.srok_snab,:classid);
  execute procedure attrib_naklot_set_pc(
    new.id_nakld,
    :classid,
    'Товар текстом',
    cast(new.tovar_text as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    new.id_nakld,
    :classid,
    'Комментарий снабжения',
    cast(new.comment_snab as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    new.id_nakld,
    :classid,
    'Срок изготовления',
    cast(new.srok_snab_text as varchar(50)));        
END^

ALTER TRIGGER ZAKAZ_DET_VW_BD
as
  declare variable classid integer;
begin
  execute procedure can_modify_naklot(old.id_nakl);
  select oid
    from GET_OID_OBJECTS_PC('ЗАКАЗ',-100)
    into :classid; 
  execute procedure attrib_naklot_set_pc(
    old.id_nakld,
    :classid,
    'Товар текстом',
    cast(null as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    old.id_nakld,
    :classid,
    'Комментарий снабжения',
    cast(null as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    old.id_nakld,
    :classid,
    'Срок изготовления',
    cast(null as varchar(50)));        
  DELETE FROM NAKLOT
  WHERE (ID_NAKLD = OLD.ID_NAKLD) and
    (Tip=:classid);
end^

ALTER TRIGGER ZAKAZ_DET_VW_BI
as
begin
  IF (NEW.ID_NAKLD IS NULL) THEN begin
    NEW.ID_NAKLD = GEN_ID(NAKLOT_GEN,1);
  end
end^

ALTER TRIGGER ZAKAZ_DET_VW_BU1
AS
  declare variable classid integer;
  DECLARE VARIABLE delmarked SMALLINT;
  DECLARE VARIABLE posted SMALLINT;
  DECLARE VARIABLE blocked SMALLINT;
  DECLARE VARIABLE ID_MANAGER INTEGER;
  declare variable data_fields_change SMALLINT;
  declare variable data_fields_change_snab smallint;
BEGIN
  if ((z(new.id_nakl)<>z(old.id_nakl)) or
   (z(new.id_nakld)<>z(old.id_nakld)) or
   (z(new.id_tovar)<>z(old.id_tovar)) or
   (z(new.cena)<>z(old.cena)) or
   (z(new.kolotp)<>z(old.kolotp)) ) then begin
    data_fields_change=1;
  end else begin
    data_fields_change=0;
  end
  if  ((z(new.id_tovar_snab)<>z(old.id_tovar_snab)) or
   (z(new.id_post_snab)<>z(old.id_post_snab)) or
   (trim(new.comment_snab)<>trim(old.comment_snab)) or
   (z(new.cena_snab)<>z(old.cena_snab))) then begin
    data_fields_change_snab=1;
  end else begin
    data_fields_change_snab=0;
  end  
  select om.delmarked,om.blocked,om.posted,om.id_manager
    from naklo om
    where om.id_nakl=new.id_nakl
    into :delmarked,:blocked,:posted,:id_manager;
  if (delmarked<>0) then begin
    execute procedure error ('Запрещено менять удалённый документ');
  end
  if (posted<>0 and data_fields_change_snab<>0) then begin
    execute procedure error ('Запрещено менять проведенный документ');
  end
  if (blocked<>0 and data_fields_change<>0) then begin
    execute procedure error('Запрещено менять заблокированный документ');
  end  
  select oid
    from GET_OID_OBJECTS_PC('ЗАКАЗ',-100)
    into :classid; 
  UPDATE NAKLOT
  SET ID_NAKLD = NEW.ID_NAKLD,
      ID_NAKL = NEW.ID_NAKL,
      ID_POS = NEW.id_tovar_snab,
      ID_TOVAR = NEW.ID_TOVAR,
      CENA = NEW.CENA,
      KOLOTP = NEW.KOLOTP,
      KODCN = NEW.srok_snab,
      SKIDKA = NEW.cena_snab,
      ID_SEBEST = NEW.id_post_snab
  WHERE (ID_NAKLD = OLD.ID_NAKLD) and
    (TIP = :classid);
  execute procedure attrib_naklot_set_pc(
    new.id_nakld,
    :classid,
    'Товар текстом',
    cast(new.tovar_text as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    new.id_nakld,
    :classid,
    'Комментарий снабжения',
    cast(new.comment_snab as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    new.id_nakld,
    :classid,
    'Срок изготовления',
    cast(new.srok_snab_text as varchar(50)));
END^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring bodies of procedures */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE ZAKAZ_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
  declare variable record_count integer;
  declare variable sError varchar(250);
begin
  select z(count(*))
    from zakaz_det_vw od
    where od.id_nakl=:id_nakl
      and z(od.id_tovar_snab)=0
    into :record_count;
  if (:record_count>0) then begin
    sError = 'Нельзя провести без указания товара от снабжения';
    execute procedure error(sError);
  end
  update zakaz_vw om
    set om.posted=1,
      om.dat_otvet=current_timestamp,
      om.id_manager_snab=(select id_manager from get_id_manager_pc)
    where om.id_nakl=:id_nakl
      and om.delmarked=0;
end
^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring privileges */
/*-------------------------------------------------------------------------*/

GRANT UPDATE, REFERENCES ON ZAKAZ_DET_VW TO TRIGGER ZAKAZ_DET_VW_AI;
GRANT UPDATE, REFERENCES ON ZAKAZ_DET_VW TO TRIGGER ZAKAZ_DET_VW_AU;
GRANT UPDATE, REFERENCES ON ZAKAZ_DET_VW TO TRIGGER ZAKAZ_DET_VW_BD;
GRANT SELECT, REFERENCES ON ZAKAZ_DET_VW TO BOSSES;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON ZAKAZ_DET_VW TO MANAGER;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON ZAKAZ_DET_VW TO POWER_USER;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON ZAKAZ_DET_VW TO SNAB;


GRANT EXECUTE ON PROCEDURE CAN_MODIFY_NAKLOT TO TRIGGER ZAKAZ_DET_VW_AI;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER ZAKAZ_DET_VW_AI;
GRANT INSERT ON NAKLOT TO TRIGGER ZAKAZ_DET_VW_AI;
GRANT EXECUTE ON PROCEDURE ATTRIB_NAKLOT_SET_PC TO TRIGGER ZAKAZ_DET_VW_AI;
GRANT EXECUTE ON PROCEDURE CAN_MODIFY_NAKLOT TO TRIGGER ZAKAZ_DET_VW_BD;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER ZAKAZ_DET_VW_BD;
GRANT EXECUTE ON PROCEDURE ATTRIB_NAKLOT_SET_PC TO TRIGGER ZAKAZ_DET_VW_BD;
GRANT SELECT,DELETE ON NAKLOT TO TRIGGER ZAKAZ_DET_VW_BD;
GRANT SELECT ON NAKLO TO TRIGGER ZAKAZ_DET_VW_BU1;
GRANT EXECUTE ON PROCEDURE ERROR TO TRIGGER ZAKAZ_DET_VW_BU1;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER ZAKAZ_DET_VW_BU1;
GRANT SELECT,UPDATE ON NAKLOT TO TRIGGER ZAKAZ_DET_VW_BU1;
GRANT EXECUTE ON PROCEDURE ATTRIB_NAKLOT_SET_PC TO TRIGGER ZAKAZ_DET_VW_BU1;
GRANT SELECT ON ZAKAZ_DET_VW TO PROCEDURE ZAKAZ_POST_PC;
GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE ZAKAZ_POST_PC;
GRANT SELECT,UPDATE ON ZAKAZ_VW TO PROCEDURE ZAKAZ_POST_PC;
GRANT EXECUTE ON PROCEDURE GET_ID_MANAGER_PC TO PROCEDURE ZAKAZ_POST_PC;
