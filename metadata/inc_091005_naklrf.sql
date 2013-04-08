/*
todo
--Процедуру проведения фин накл
--Процедуру проведения оплат фин услуг
--Встроить проведение и возврат в форму ввода фин накл
--Детализация из отчёта по фин услугам
--Отчёт по фин долгам проверить
Переименовать расх накл на услуги в базе, хоз опер для платежа, счёт в бд, delphi код
*/


INSERT INTO SPR_SCHET_VW (OID, NAME, DELMARKED, FULLNAME, PREDEFINED, PERIOD_OSTATKOV, DAT_OSTATKOV)
VALUES (-31, 'ДОЛГИ ЗА ФИНУСЛУГИ', 0, 'Долги за услуги', 'ДОЛГИ ЗА ФИНУСЛУГИ', 2, NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-30, -100, 0, 'РАСХОДНЫЕ НАКЛАДНЫЕ НА ФИНУСЛУГИ', 'Расходные накладные на услуги', NULL, NULL);



INSERT INTO SPR_XOZOPER_VW (OID, NAME, DELMARKED, FULLNAME, TIP_DOCUMENT)
VALUES (-29, 'ОПЛАТА ПОКУПАТЕЛЕМ ФИНУСЛУГ', 0, 'Оплата услуг', 8293);

INSERT INTO SPR_XOZOPER_VW (OID, NAME, DELMARKED, FULLNAME, TIP_DOCUMENT)
VALUES (-28, 'ТРАНШ В ДОЛГАХ ЗА ФИНУСЛУГИ', 0, 'ТРАНШ В ДОЛГАХ ЗА ФИНУСЛУГИ', 8294);

UPDATE OBJECTS
SET  FULLNAME = 'Оплата аренды'
WHERE (OID = -74);



/******************************************************************************/



/******************************************************************************/
/***                                 Views                                  ***/
/******************************************************************************/


/* View: NAKLRF_VW */
CREATE VIEW NAKLRF_VW(
    ID_NAKL,
    ID,
    KURS,
    KURS_INDIRECT,
    NDS,
    DAT,
    ID_IZG,
    ID_ZAK,
    ID_MANAGER,
    NALOG_NDS,
    POSTED,
    BLOCKED,
    DELMARKED,
    ID_CURRENCY,
    ID_STATYA,
    ID_PROJECT,
    ID_XOZ_OPER,
    COMMENT,
    PARENT_ID_NAKL,
    ID_DOGOVOR)
AS
select 
  om.id_nakl,om.id,
  om.kurs,
  om.kurs_indirect,
  om.nds,
  om.dat,
  om.id_izg,
  om.id_zak,
  om.id_manager,
  om.nalog_nds,
  om.posted,
  om.blocked,
  om.delmarked,
  om.id_currency,
  om.id_currency_to,
  om.id_sklad,
  om.id_sklad_to,
  om.comment,
  om.parent_id_nakl,
  om.id_dogovor
from
  naklo om,  rdb$database
where
  om.tip = -30   /*РАСХОДНЫЕ НАКЛАДНЫЕ НА ФИНУСЛУГИ*/
;




/******************************************************************************/
/***                                Triggers                                ***/
/******************************************************************************/


SET TERM ^ ;



/******************************************************************************/
/***                      Triggers for updatable views                      ***/
/******************************************************************************/



/* Trigger: NAKLRF_VW_BI */
CREATE TRIGGER NAKLRF_VW_BI FOR NAKLRF_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


/* Trigger: NAKLRF_VW_BU */
CREATE TRIGGER NAKLRF_VW_BU FOR NAKLRF_VW
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


ALTER TRIGGER NAKLRF_VW_BI
as
  declare variable classid integer;
begin
  if (new.id_nakl is null) then begin
    new.id_nakl = gen_id(naklo_gen,1);
  end
  select oid
    from get_oid_objects_pc('РАСХОДНЫЕ НАКЛАДНЫЕ НА ФИНУСЛУГИ',-100)
    into :classid;   
  insert into naklo (id_nakl,id,kurs,nds,dat,id_izg,id_zak,
      id_manager,nalog_nds,posted,blocked,delmarked,
      comment,
      id_currency,parent_id_nakl,
      tip,id_currency_to,kurs_indirect,
      id_sklad,id_sklad_to,id_dogovor)
    values (new.id_nakl,new.id,new.kurs,new.nds,new.dat,new.id_izg,new.id_zak,
      new.id_manager,new.nalog_nds,new.posted,new.blocked,new.delmarked,
      new.comment,
      new.id_currency,new.parent_id_nakl,
      :classid,new.id_statya,new.kurs_indirect,
      new.id_project,new.id_xoz_oper,new.id_dogovor);
end
^


ALTER TRIGGER NAKLRF_VW_BU
as
begin


  if (trim(new.blocked)<>trim(old.blocked)) then begin
    if (not (current_role in ('BUXG','POWER_USER')) and (not (user='SYSDBA')))  then begin
      execute procedure error('Запрещено менять поле "Оригинал""');
    end
  end else begin
    execute procedure can_modify_naklot(new.id_nakl);
  end


  update naklo om
  set om.id_nakl=new.id_nakl,
    om.id=new.id,
    om.kurs=new.kurs,
    om.nds=new.nds,
    om.dat=new.dat,
    om.id_izg=new.id_izg,
    om.id_zak=new.id_zak,
    om.id_manager=new.id_manager,
    om.nalog_nds=new.nalog_nds,
    om.posted = new.posted,
    om.blocked = new.blocked,
    om.delmarked = new.delmarked,
    om.id_currency = new.id_currency,
    om.id_currency_to=new.id_statya,
    om.id_sklad=new.id_project,
    om.id_sklad_to=new.id_xoz_oper,
    om.comment=new.comment,
    om.parent_id_nakl=new.parent_id_nakl,
    om.id_dogovor=new.id_dogovor
  where om.id_nakl=old.id_nakl;
end
^


SET TERM ; ^



/******************************************************************************/
/***                              Descriptions                              ***/
/******************************************************************************/

DESCRIBE VIEW NAKLRF_VW
'id_sklad_to - Хозяйственная операция
id_sklad - проект
id_currency_to-статья затрат';



/******************************************************************************/
/***                               Privileges                               ***/
/******************************************************************************/


/* Privileges of roles */
GRANT SELECT, REFERENCES ON NAKLRF_VW TO BOSSES;
GRANT ALL ON NAKLRF_VW TO BUXG;
GRANT ALL ON NAKLRF_VW TO MANAGER;
GRANT ALL ON NAKLRF_VW TO POWER_USER;

/* Privileges of triggers */
GRANT INSERT ON NAKLO TO TRIGGER NAKLRF_VW_BI;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER NAKLRF_VW_BI;
GRANT SELECT, UPDATE ON NAKLO TO TRIGGER NAKLRF_VW_BU;
GRANT UPDATE, REFERENCES ON NAKLRF_VW TO TRIGGER NAKLRF_VW_BU;
GRANT EXECUTE ON PROCEDURE CAN_MODIFY_NAKLOT TO TRIGGER NAKLRF_VW_BU;

