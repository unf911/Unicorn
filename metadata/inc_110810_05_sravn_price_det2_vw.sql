/*-------------------------------------------------------------------------*/
/* Dropping old views */
/*-------------------------------------------------------------------------*/

DROP VIEW SRAVN_PRICE_DET2_VW;

/*-------------------------------------------------------------------------*/
/* Creating new views */
/*-------------------------------------------------------------------------*/

CREATE VIEW SRAVN_PRICE_DET2_VW(
    ID_NAKLD,
    ID_NAKL,
    ID_POS,
    ID_POST,
    DAT,
    KURS,
    IN_LIST)
AS
select
    ID_NAKLD,
    ID_NAKL,
    ID_POS id_selected,
    ID_TOVAR as id_post,
    (select a.value_date
      from attrib_naklot a
      where a.oid=ot.id_nakld) as dat, 
    kolotp as kurs,
    ID_SEBEST as IN_LIST
from NAKLOT ot, rdb$database
where
  ot.tip in (-88) /*СРАВНЕНИЕ ПРАЙСОВ ДЕТ2*/
;
/*-------------------------------------------------------------------------*/
/* Restoring descriptions for views */
/*-------------------------------------------------------------------------*/

DESCRIBE VIEW SRAVN_PRICE_DET2_VW
'id_pos - соответствует полю SravnPrice.mtePost.excluded';

/*-------------------------------------------------------------------------*/
/* Restoring descriptions of view columns */
/*-------------------------------------------------------------------------*/

/*-------------------------------------------------------------------------*/
/* Restoring triggers for views */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

CREATE TRIGGER SRAVN_PRICE_DET2_VW_BD FOR SRAVN_PRICE_DET2_VW
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER SRAVN_PRICE_DET2_VW_BI FOR SRAVN_PRICE_DET2_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER SRAVN_PRICE_DET2_VW_BU FOR SRAVN_PRICE_DET2_VW
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

ALTER TRIGGER SRAVN_PRICE_DET2_VW_BD
as
  declare variable classid integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('СРАВНЕНИЕ ПРАЙСОВ ДЕТ2',-100)
    into :classid;
  execute procedure attrib_naklot_set_pc(
    old.ID_NAKLD,
    :classid,
    'Дата прайса для поставщика',
    cast(null as varchar(50)));
  delete from naklot ot
    where ot.id_nakld=old.id_nakld
      and ot.tip=:classid;
end^

ALTER TRIGGER SRAVN_PRICE_DET2_VW_BI
AS
  declare variable classid integer;
/*$$IBEC$$   declare variable dat date;
  declare variable posted integer;
  declare variable blocked integer;
  declare variable delmarked integer; $$IBEC$$*/
begin
  IF (NEW.ID_NAKLD IS NULL) THEN begin
    NEW.ID_NAKLD = GEN_ID(NAKLOT_GEN,1);
  end
  if (new.id_pos is null) then begin
    new.id_pos=0;
  end
  execute procedure can_modify_naklot(new.id_nakl);
  /*запрос к шапке*/
/*$$IBEC$$   select dat,posted,blocked,delmarked
    from SRAVN_PRICE_vw p
    where p.id_nakl=new.id_nakl
    into :dat,:posted,:blocked,:delmarked;
   $$IBEC$$*//*проверки на корректность действия*//*$$IBEC$$ 
  if (delmarked<>0) then begin
    execute procedure error ('Запрещено менять удалённый документ');
  end
  if (posted<>0) then begin
    execute procedure error ('Запрещено менять проведенный документ');
  end
  if (blocked<>0) then begin
    execute procedure error('Запрещено менять заблокированный документ');
  end $$IBEC$$*/
  /*запросы идентификаторов объектов*/
  select oid
    from GET_OID_OBJECTS_PC('СРАВНЕНИЕ ПРАЙСОВ ДЕТ2',-100)
    into :classid;
  INSERT INTO NAKLOT (
    ID_NAKLD,
    ID_NAKL,
    ID_POS,
    ID_TOVAR,
    kolotp, 
    ID_SEBEST,
    TIP)
  VALUES (
    NEW.ID_NAKLD,
    NEW.ID_NAKL,
    NEW.ID_POS,
    NEW.ID_POST,
    new.kurs,
    new.in_list,
    :classid);
  execute procedure attrib_naklot_set_pc(
    NEW.ID_NAKLD,
    :classid,
    'Дата прайса для поставщика',
    cast(new.dat as varchar(50)));
end^

ALTER TRIGGER SRAVN_PRICE_DET2_VW_BU
AS
  declare variable classid integer;
begin
  execute procedure can_modify_naklot(new.id_nakl);

  /*запросы идентификаторов объектов*/
  select oid
    from GET_OID_OBJECTS_PC('СРАВНЕНИЕ ПРАЙСОВ ДЕТ2',-100)
    into :classid;
  /*записи в таблицы*/
  UPDATE NAKLOT
  SET ID_NAKLD = NEW.ID_NAKLD,
      ID_NAKL = NEW.ID_NAKL,
      ID_POS = NEW.ID_POS,
      ID_TOVAR = NEW.ID_POST,
      kolotp=new.kurs,
      id_sebest=new.in_list
  WHERE (ID_NAKLD = OLD.ID_NAKLD) and
    (TIP = :classid);
  execute procedure attrib_naklot_set_pc(
    NEW.ID_NAKLD,
    :classid,
    'Дата прайса для поставщика',
    cast(new.dat as varchar(50)));  
end^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring privileges */
/*-------------------------------------------------------------------------*/

GRANT SELECT ON ATTRIBUTES TO VIEW SRAVN_PRICE_DET2_VW;
GRANT SELECT ON NAKLOT TO VIEW SRAVN_PRICE_DET2_VW;
GRANT UPDATE, REFERENCES ON SRAVN_PRICE_DET2_VW TO TRIGGER SRAVN_PRICE_DET2_VW_BD;
GRANT UPDATE, REFERENCES ON SRAVN_PRICE_DET2_VW TO TRIGGER SRAVN_PRICE_DET2_VW_BI;
GRANT UPDATE, REFERENCES ON SRAVN_PRICE_DET2_VW TO TRIGGER SRAVN_PRICE_DET2_VW_BU;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON SRAVN_PRICE_DET2_VW TO POWER_USER;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON SRAVN_PRICE_DET2_VW TO SNAB;


GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER SRAVN_PRICE_DET2_VW_BD;
GRANT EXECUTE ON PROCEDURE ATTRIB_NAKLOT_SET_PC TO TRIGGER SRAVN_PRICE_DET2_VW_BD;
GRANT SELECT,DELETE ON NAKLOT TO TRIGGER SRAVN_PRICE_DET2_VW_BD;
GRANT EXECUTE ON PROCEDURE CAN_MODIFY_NAKLOT TO TRIGGER SRAVN_PRICE_DET2_VW_BI;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER SRAVN_PRICE_DET2_VW_BI;
GRANT INSERT ON NAKLOT TO TRIGGER SRAVN_PRICE_DET2_VW_BI;
GRANT EXECUTE ON PROCEDURE ATTRIB_NAKLOT_SET_PC TO TRIGGER SRAVN_PRICE_DET2_VW_BI;
GRANT EXECUTE ON PROCEDURE CAN_MODIFY_NAKLOT TO TRIGGER SRAVN_PRICE_DET2_VW_BU;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER SRAVN_PRICE_DET2_VW_BU;
GRANT SELECT,UPDATE ON NAKLOT TO TRIGGER SRAVN_PRICE_DET2_VW_BU;
GRANT EXECUTE ON PROCEDURE ATTRIB_NAKLOT_SET_PC TO TRIGGER SRAVN_PRICE_DET2_VW_BU;
