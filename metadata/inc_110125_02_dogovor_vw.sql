/*-------------------------------------------------------------------------*/
/* Dropping old views */
/*-------------------------------------------------------------------------*/

DROP VIEW DOGOVOR_VW;

/*-------------------------------------------------------------------------*/
/* Creating new views */
/*-------------------------------------------------------------------------*/

CREATE VIEW DOGOVOR_VW(
    ID_DOGOVOR,
    ID_VLAD,
    ID_KLIENT,
    ID_MANAGER,
    DAT,
    ID,
    IS_DEFAULT,
    DELMARKED,
    PREDMET,
    ADRES,
    ID_CONTACT,
    TIP_DOGOVORA)
AS
select
    id_nakl,
    id_izg,
    id_zak,
    id_manager,
    dat,
    id,
    id_sklad_to,
    delmarked,
    (select a.value1
     from attributes a
     where a.oid=om.id_nakl and a.attribute_id=1) as predmet,
    (select a.value1
     from attributes a
     where a.oid=om.id_nakl and a.attribute_id=2) as adres,
    (select a.value_int
     from attributes a
     where a.oid=om.id_nakl and a.attribute_id=3) as id_contact,
    (select a.value1
     from attributes a
     where a.oid=om.id_nakl and a.attribute_id=4) as tip_dogovora
  from naklo om, rdb$database
  where om.tip=-85
  /*ТИП ДОГОВОРА*/
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

CREATE TRIGGER DOGOVOR_VW_AU FOR DOGOVOR_VW
ACTIVE AFTER UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER DOGOVOR_VW_BI FOR DOGOVOR_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

ALTER TRIGGER DOGOVOR_VW_AU
as
  declare variable classid integer;  
begin
  select oid
    from get_oid_objects_pc('ТИП ДОГОВОРА',-100)
    into :classid;  
  update naklo om
  set
    om.id_nakl=new.id_dogovor,
    om.id=new.id,
    om.dat=extractdate(new.dat),
    om.id_izg=new.id_vlad,
    om.id_zak=new.id_klient,
    om.id_manager=new.id_manager,
    om.id_sklad_to=new.is_default,
    om.delmarked = new.delmarked
  where
    om.id_nakl=old.id_dogovor and
      om.tip=:classid;
  if (new.is_default=1) then begin
    update dogovor_vw d
      set d.is_default=0
      where d.id_klient=new.id_klient and
        d.delmarked=0 and
        d.is_default=1 and
        d.id_dogovor<>new.id_dogovor;
  end
  execute procedure attributes_set2_pc(
    new.id_dogovor,
    :classid,
    'Предмет договора',
    cast(new.predmet as varchar(250)));
  execute procedure attributes_set2_pc(
    new.id_dogovor,
    :classid,
    'Адрес предмета договора',
    cast(new.adres as varchar(250)));
  execute procedure attributes_set2_pc(
    new.id_dogovor,
    :classid,
    'Подписывающий акты',
    cast(new.id_contact as varchar(250)));
  execute procedure attributes_set2_pc(
    new.id_dogovor,
    :classid,
    'Тип договора',
    cast(new.tip_dogovora as varchar(250)));         
end^

ALTER TRIGGER DOGOVOR_VW_BI
as
  declare variable classid integer;
begin
  if (new.id_dogovor is null) then begin
    new.id_dogovor = gen_id(naklo_gen,1);
  end
  select oid
    from get_oid_objects_pc('ТИП ДОГОВОРА',-100)
    into :classid;   
  insert into naklo (id_nakl,id,dat,id_izg,id_zak,
      id_manager,delmarked,
      id_sklad_to,tip)
    values (new.id_dogovor,new.id,extractdate(new.dat),new.id_vlad,new.id_klient,
      new.id_manager,new.delmarked,
      new.is_default,:classid);
  if (new.is_default=1) then begin
    update dogovor_vw d
      set d.is_default=0
      where d.id_klient=new.id_klient and
        d.delmarked=0 and
        d.is_default=1 and
        d.id_dogovor<>new.id_dogovor;
  end
  execute procedure attributes_set2_pc(
    new.id_dogovor,
    :classid,
    'Предмет договора',
    cast(new.predmet as varchar(250)));
  execute procedure attributes_set2_pc(
    new.id_dogovor,
    :classid,
    'Адрес предмета договора',
    cast(new.adres as varchar(250)));
  execute procedure attributes_set2_pc(
    new.id_dogovor,
    :classid,
    'Подписывающий акты',
    cast(new.id_contact as varchar(250)));
  execute procedure attributes_set2_pc(
    new.id_dogovor,
    :classid,
    'Тип договора',
    cast(new.tip_dogovora as varchar(250)));
end^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring privileges */
/*-------------------------------------------------------------------------*/

GRANT SELECT ON NAKLO TO VIEW DOGOVOR_VW;
GRANT SELECT, UPDATE, REFERENCES ON DOGOVOR_VW TO TRIGGER DOGOVOR_VW_AU;
GRANT SELECT, UPDATE, REFERENCES ON DOGOVOR_VW TO TRIGGER DOGOVOR_VW_BI;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON DOGOVOR_VW TO BOSSES;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON DOGOVOR_VW TO BUXG;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON DOGOVOR_VW TO MANAGER;
GRANT SELECT, REFERENCES ON DOGOVOR_VW TO OFFICEMANAGER;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON DOGOVOR_VW TO POWER_USER;
GRANT SELECT, REFERENCES ON DOGOVOR_VW TO SKLAD;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON DOGOVOR_VW TO SNAB;


GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER DOGOVOR_VW_AU;
GRANT SELECT,UPDATE ON NAKLO TO TRIGGER DOGOVOR_VW_AU;
GRANT SELECT,UPDATE ON DOGOVOR_VW TO TRIGGER DOGOVOR_VW_AU;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER DOGOVOR_VW_AU;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER DOGOVOR_VW_BI;
GRANT INSERT ON NAKLO TO TRIGGER DOGOVOR_VW_BI;
GRANT SELECT,UPDATE ON DOGOVOR_VW TO TRIGGER DOGOVOR_VW_BI;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER DOGOVOR_VW_BI;
