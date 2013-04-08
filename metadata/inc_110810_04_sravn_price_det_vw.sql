/*-------------------------------------------------------------------------*/
/* Dropping old views */
/*-------------------------------------------------------------------------*/

DROP VIEW SRAVN_PRICE_DET_VW;

/*-------------------------------------------------------------------------*/
/* Creating new views */
/*-------------------------------------------------------------------------*/

CREATE VIEW SRAVN_PRICE_DET_VW(
    ID_NAKLD,
    ID_NAKL,
    ID_POS,
    ID_TOVAR,
    KOLOTP,
    KOLOTP_PROGNOZ,
    KOEF,
    IN_LIST,
    CENA,
    CENA_FROM,
    PROCENT,
    ID_POST,
    ID_POST_BEST)
AS
select
    ID_NAKLD,
    ID_NAKL,
    ID_POS,
    ID_TOVAR,
    kolotp, 
    cena,
    (select a.value_num15_4
      from attrib_naklot a
      where a.oid=ot.id_nakld and a.attribute_id=1) as koef,
    ID_SEBEST as IN_LIST,
    (select a.value_num15_4
      from attrib_naklot a
      where a.oid=ot.id_nakld and a.attribute_id=2) as cena,
    (select a.value_num15_4
      from attrib_naklot a
      where a.oid=ot.id_nakld and a.attribute_id=6) as cena_from,
    (select a.value_num15_4
      from attrib_naklot a
      where a.oid=ot.id_nakld and a.attribute_id=3) as procent,
    (select a.value_int
      from attrib_naklot a
      where a.oid=ot.id_nakld and a.attribute_id=4) as id_post,
    (select a.value_int
      from attrib_naklot a
      where a.oid=ot.id_nakld and a.attribute_id=5) as id_post_best
from NAKLOT ot, rdb$database
where
  ot.tip in (-89) /*СРАВНЕНИЕ ПРАЙСОВ*/
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

CREATE TRIGGER SRAVN_PRICE_DET_VW_BD FOR SRAVN_PRICE_DET_VW
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER SRAVN_PRICE_DET_VW_BI FOR SRAVN_PRICE_DET_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER SRAVN_PRICE_DET_VW_BU FOR SRAVN_PRICE_DET_VW
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

ALTER TRIGGER SRAVN_PRICE_DET_VW_BD
as
  declare variable classid integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('СРАВНЕНИЕ ПРАЙСОВ',-100)
    into :classid;
  delete from naklot ot
    where ot.id_nakld=old.id_nakld
      and ot.tip=:classid;
  execute procedure attrib_naklot_set_pc(
    old.ID_NAKLD,
    :classid,
    'Коэфициент для продаж',
    cast(null as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    old.ID_NAKLD,
    :classid,
    'Цена для закупки',
    cast(null as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    old.ID_NAKLD,
    :classid,
    '% от лучшего',
    cast(null as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    old.ID_NAKLD,
    :classid,
    'Идентификатор поставщика',
    cast(null as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    old.ID_NAKLD,
    :classid,
    'Идентификатор лучшего поставщика',
    cast(null as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    old.ID_NAKLD,
    :classid,
    'Цена поставщка',
    cast(null as varchar(50)));
end^

ALTER TRIGGER SRAVN_PRICE_DET_VW_BI
AS
  declare variable classid integer;
begin
  IF (NEW.ID_NAKLD IS NULL) THEN begin
    NEW.ID_NAKLD = GEN_ID(NAKLOT_GEN,1);
  end
  if (new.id_pos is null) then begin
    new.id_pos=0;
  end
  /*запрос к шапке*/
  execute procedure can_modify_naklot(new.id_nakl);
  /*запросы идентификаторов объектов*/
  select oid
    from GET_OID_OBJECTS_PC('СРАВНЕНИЕ ПРАЙСОВ',-100)
    into :classid;
    
  INSERT INTO NAKLOT (
    ID_NAKLD,
    ID_NAKL,
    ID_POS,
    ID_TOVAR,
    KOLOTP,
    cena,
    ID_SEBEST,
    TIP)
  VALUES (
    NEW.ID_NAKLD,
    NEW.ID_NAKL,
    NEW.ID_POS,
    NEW.ID_TOVAR,
    new.kolotp,
    new.kolotp_prognoz,
    new.in_list,
    :classid);
  execute procedure attrib_naklot_set_pc(
    NEW.ID_NAKLD,
    :classid,
    'Коэфициент для продаж',
    cast(new.koef as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    NEW.ID_NAKLD,
    :classid,
    'Цена для закупки',
    cast(new.cena as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    NEW.ID_NAKLD,
    :classid,
    '% от лучшего',
    cast(new.procent as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    NEW.ID_NAKLD,
    :classid,
    'Идентификатор поставщика',
    cast(new.id_post as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    NEW.ID_NAKLD,
    :classid,
    'Идентификатор лучшего поставщика',
    cast(new.id_post_best as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    NEW.ID_NAKLD,
    :classid,
    'Цена поставщка',
    cast(new.cena_from as varchar(50)));
    
end^

ALTER TRIGGER SRAVN_PRICE_DET_VW_BU
AS
  declare variable classid integer;
begin
  execute procedure can_modify_naklot(new.id_nakl);
  if (new.id_pos is null) then begin
    new.id_pos=0;
  end  
  /*запросы идентификаторов объектов*/
  select oid
    from GET_OID_OBJECTS_PC('СРАВНЕНИЕ ПРАЙСОВ',-100)
    into :classid;
  /*записи в таблицы*/
  UPDATE NAKLOT
  SET ID_NAKLD = NEW.ID_NAKLD,
      ID_NAKL = NEW.ID_NAKL,
      ID_POS = NEW.ID_POS,
      ID_TOVAR = NEW.ID_TOVAR,
      KOLOTP=new.kolotp,
      cena=new.kolotp_prognoz,
      id_sebest=new.in_list
  WHERE (ID_NAKLD = OLD.ID_NAKLD) and
    (TIP = :classid);
  execute procedure attrib_naklot_set_pc(
    NEW.ID_NAKLD,
    :classid,
    'Коэфициент для продаж',
    cast(new.koef as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    NEW.ID_NAKLD,
    :classid,
    'Цена для закупки',
    cast(new.cena as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    NEW.ID_NAKLD,
    :classid,
    '% от лучшего',
    cast(new.procent as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    NEW.ID_NAKLD,
    :classid,
    'Идентификатор поставщика',
    cast(new.id_post as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    NEW.ID_NAKLD,
    :classid,
    'Идентификатор лучшего поставщика',
    cast(new.id_post_best as varchar(50)));
  execute procedure attrib_naklot_set_pc(
    NEW.ID_NAKLD,
    :classid,
    'Цена поставщка',
    cast(new.cena_from as varchar(50)));           

end^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring privileges */
/*-------------------------------------------------------------------------*/

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON SRAVN_PRICE_DET_VW TO POWER_USER;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON SRAVN_PRICE_DET_VW TO SNAB;


GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER SRAVN_PRICE_DET_VW_BD;
GRANT SELECT,DELETE ON NAKLOT TO TRIGGER SRAVN_PRICE_DET_VW_BD;
GRANT EXECUTE ON PROCEDURE ATTRIB_NAKLOT_SET_PC TO TRIGGER SRAVN_PRICE_DET_VW_BD;
GRANT EXECUTE ON PROCEDURE CAN_MODIFY_NAKLOT TO TRIGGER SRAVN_PRICE_DET_VW_BI;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER SRAVN_PRICE_DET_VW_BI;
GRANT INSERT ON NAKLOT TO TRIGGER SRAVN_PRICE_DET_VW_BI;
GRANT EXECUTE ON PROCEDURE ATTRIB_NAKLOT_SET_PC TO TRIGGER SRAVN_PRICE_DET_VW_BI;
GRANT EXECUTE ON PROCEDURE CAN_MODIFY_NAKLOT TO TRIGGER SRAVN_PRICE_DET_VW_BU;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER SRAVN_PRICE_DET_VW_BU;
GRANT SELECT,UPDATE ON NAKLOT TO TRIGGER SRAVN_PRICE_DET_VW_BU;
GRANT EXECUTE ON PROCEDURE ATTRIB_NAKLOT_SET_PC TO TRIGGER SRAVN_PRICE_DET_VW_BU;
