/*-------------------------------------------------------------------------*/
/* First procedures with empty bodies */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE REP_REESTR_VYDAN_NNAKL2_PC(
    ID_IZG INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    F4_ZAK VARCHAR(250),
    F5_IPN VARCHAR(12),
    F6_NDS NUMERIC(15,4),
    F7_NDS NUMERIC(15,4),
    F8_NDS NUMERIC(15,4),
    ROWCOUNT INTEGER,
    TIP INTEGER)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE REP_REESTR_VYDAN_NNAKL_PC(
    ID_IZG INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    F2_DAT TIMESTAMP,
    F3_ID VARCHAR(20),
    F4_VIDDOC VARCHAR(20),
    F5_ZAK VARCHAR(250),
    F6_IPN VARCHAR(12),
    F7_SUMWITHNDS NUMERIC(15,4),
    F8_BAZANDS NUMERIC(15,4),
    F9_NDS NUMERIC(15,4),
    F12_BAZANDSEXPORT NUMERIC(15,4),
    TIP INTEGER)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE REP_TOVAR_KNIGA(
    ID_IZG INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    F2_DAT TIMESTAMP,
    F3_ID VARCHAR(20),
    F4_ZAK VARCHAR(250),
    F5_IPN VARCHAR(12),
    F6_NDS NUMERIC(15,4),
    F7_NDS NUMERIC(15,4),
    F8_NDS NUMERIC(15,4),
    F11_NDSEXPORT NUMERIC(15,4),
    F14_NDSEXPORT NUMERIC(15,4),
    F15_NDS NUMERIC(15,4),
    F16_VSEGO NUMERIC(15,4),
    F17_NALOGNDS NUMERIC(15,4),
    F18_NEPL_VSEGONDS NUMERIC(15,4),
    F19_NEPL_NALOGNDS NUMERIC(15,4),
    F20_CORR_VSEGO NUMERIC(15,4),
    F21_CORR_NALOGNDS NUMERIC(15,4),
    F24_VIDOPL VARCHAR(50),
    TIP INTEGER)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Dropping old views */
/*-------------------------------------------------------------------------*/

DROP VIEW FRMNNAKL_1;

/*-------------------------------------------------------------------------*/
/* Creating new views */
/*-------------------------------------------------------------------------*/

CREATE VIEW FRMNNAKL_1(
    SCHET,
    ID,
    ID_IZG,
    ID_ZAK,
    ID_MANAGER,
    DAT,
    NDS,
    NAKL,
    KURS,
    VSEGO,
    VIDOPL,
    USL,
    NALOG_NDS,
    TIP)
AS
SELECT
  w.schet,
  w.id2,
  w.id_izg,
  w.id_zak,
  w.id_manager,
  w.dat,
  w.nds,
  w.nakl,
  w.kurs,
  w.vsego,
  w.vidopl,
  w.usl,
  w.nalog_nds,
  w.tip
FROM
  naklras w
;
/*-------------------------------------------------------------------------*/
/* Restoring descriptions for views */
/*-------------------------------------------------------------------------*/

/*-------------------------------------------------------------------------*/
/* Restoring descriptions of view columns */
/*-------------------------------------------------------------------------*/

/*-------------------------------------------------------------------------*/
/* Restoring bodies of procedures */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE REP_REESTR_VYDAN_NNAKL2_PC(
    ID_IZG INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    F4_ZAK VARCHAR(250),
    F5_IPN VARCHAR(12),
    F6_NDS NUMERIC(15,4),
    F7_NDS NUMERIC(15,4),
    F8_NDS NUMERIC(15,4),
    ROWCOUNT INTEGER,
    TIP INTEGER)
AS
declare variable tmp_gen integer;
declare variable nds numeric(15,4);
declare variable vsego numeric(15,4);
declare variable nalog_nds numeric(15,2);
declare variable ipn varchar(12);
declare variable lgoty integer;
begin
  /* SET GENERATOR TMP_GEN TO 0;*/
  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;


  for
    select
      gen_id(tmp_gen,1),o.name as zak,
      k.ipn,sum(f.nds),k.lgoty,
      sum(f.vsego),max(f.nalog_nds),count(*)/*$$IBEC$$ ,f.tip $$IBEC$$*/
    from
      frmnnakl_1 f
        inner join klient k on f.id_zak=k.id
        inner join objects o on o.oid=f.id_zak
    where
      f.dat between :date_from and :date_to and
      f.id_izg=:id_izg and
      ((k.lgoty<>2) or (k.lgoty<>1)) and
      (f.tip=3002 or f.tip=0 or f.tip=-11 or f.tip=-10 or f.tip=-9)
    group by f.id_zak,k.ipn,k.id, k.lgoty,o.oid,o.name
    order by
      k.ipn desc
    into :f1_npp,:f4_zak,
      :ipn,:nds,:lgoty,
      :vsego,:nalog_nds,rowcount /*$$IBEC$$ :tip, $$IBEC$$*/

   do begin
     /*обработка исключений, добавление полей*/
     f5_ipn=ipn;
     f6_nds=nds;
     f7_nds=vsego;
     f8_nds=Round(vsego*nalog_nds,2);

     /*обычная налоговая*/
     if (lgoty<>2) then begin
       suspend;
     end
     f5_ipn=null;
   end

  for
    select
      gen_id(tmp_gen,1),sum(f.nds),
      sum(f.vsego),max(f.nalog_nds),count(*)
    from
      frmnnakl_1 f
        inner join klient k on f.id_zak=k.id
        inner join objects o on o.oid=f.id_zak
    where
      f.dat between :date_from and :date_to and
      f.id_izg=:id_izg and
      k.lgoty=2 and/*'Неплательщик НДС'*/
      f.tip<>-35 /*Услуги от нерезидента, даже неплательщик*/
    into :f1_npp,:nds,
      :vsego,:nalog_nds,:rowcount

   do begin
     f4_zak=null;
     f5_ipn='X';
     f6_nds=nds;
     f7_nds=vsego;
     f8_nds=Round(vsego*nalog_nds,2);       

     suspend;
   end

  /* SET GENERATOR TMP_GEN TO 0;*/
  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;
END
^

ALTER PROCEDURE REP_REESTR_VYDAN_NNAKL_PC(
    ID_IZG INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    F2_DAT TIMESTAMP,
    F3_ID VARCHAR(20),
    F4_VIDDOC VARCHAR(20),
    F5_ZAK VARCHAR(250),
    F6_IPN VARCHAR(12),
    F7_SUMWITHNDS NUMERIC(15,4),
    F8_BAZANDS NUMERIC(15,4),
    F9_NDS NUMERIC(15,4),
    F12_BAZANDSEXPORT NUMERIC(15,4),
    TIP INTEGER)
AS
declare variable tmp_gen integer;
declare variable nds numeric(15,4);
declare variable vsego numeric(15,4);
declare variable nalog_nds numeric(15,2);
declare variable ipn varchar(12);
declare variable id_nnaklr_tip integer;
declare variable tip_name varchar(50);
declare variable lgoty integer;
begin

  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;

  /* Procedure Text */
  for
    select
      gen_id(tmp_gen,1),f.id,f.dat,o.fullname as zak,
      k.ipn,f.nds,f.tip,k.lgoty,
      f.vsego,f.nalog_nds,f.tip
    from
      frmnnakl_1 f
        inner join klient k on f.id_zak=k.id
        inner join objects o on o.oid=f.id_zak
    where
      f.dat between :date_from and :date_to and
      f.id_izg=:id_izg

    order by
      f.dat,f.id
    into :f1_npp,:f3_id,:f2_dat,:f5_zak,
      :ipn,:nds,:tip,:lgoty,
      :vsego,:nalog_nds,:tip

   do begin
   
     select oid
       from get_oid_objects_pc('ТИП НАЛОГОВЫХ НАКЛАДНЫХ',-100)
       into :id_nnaklr_tip;
       
     select o.predefined, o.name
       from objects o
       where o.classid=:id_nnaklr_tip and o.oid=:tip
       into :f4_viddoc, :tip_name;
               
     
     /*пока нет УСЛУГИ ОТ НЕРЕЗИДЕНТА*/
 
     /*обработка исключений, добавление полей*/
     f6_ipn = null;
     F7_SUMWITHNDS = null;
     F8_BAZANDS = null; /*for export*/
     F9_NDS = null;
     f12_BAZANDSEXPORT = null;

     /*обычная налоговая*/
     if ((lgoty=0) and
       ((tip_name<>'НАЛОГОВАЯ ЭКСПОРТНАЯ') and
       (tip_name<>'УСЛУГИ ОТ НЕРЕЗИДЕНТА') or
       (tip_name<>'ПОСТАВКА НЕПЛАТЕЛЬЩИКУ НДС'))
       )
     then begin
       f6_ipn=ipn;
       F7_SUMWITHNDS=nds;
       F8_BAZANDS=vsego;
       F9_NDS=Round(vsego*nalog_nds,2);
     end

     if ((lgoty=1) or (tip_name='НАЛОГОВАЯ ЭКСПОРТНАЯ')) then begin
       f6_ipn='0';   /*В реестре выданных накладных в гр.6 должен стоять "Х" для экспорта.*/
       F7_SUMWITHNDS=nds;
       /*Письмо Марины Даниловны от 18/10/10*/
       /*F8_BAZANDS=nds;*/
       f12_BAZANDSEXPORT=nds;
     end
     /*Услуги от нерезидента*/
     if ((lgoty=2) or (tip_name='УСЛУГИ ОТ НЕРЕЗИДЕНТА') or (tip_name='ПОСТАВКА НЕПЛАТЕЛЬЩИКУ НДС') ) then begin
       f6_ipn='0';
       F7_SUMWITHNDS=nds;
       F8_BAZANDS=vsego;
       F9_NDS=Round(vsego*nalog_nds,2);       
     end

     /*oid корректировки*/
     if (tip_name='КОРРЕКТИРОВКА') then begin
       f6_ipn=ipn;
       F7_SUMWITHNDS=nds;
       F8_BAZANDS=vsego;
       F9_NDS=Round(vsego*nalog_nds,2);       
     end
     suspend;
   end

  /* SET GENERATOR TMP_GEN TO 0;*/
  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;
END
^

ALTER PROCEDURE REP_TOVAR_KNIGA(
    ID_IZG INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    F2_DAT TIMESTAMP,
    F3_ID VARCHAR(20),
    F4_ZAK VARCHAR(250),
    F5_IPN VARCHAR(12),
    F6_NDS NUMERIC(15,4),
    F7_NDS NUMERIC(15,4),
    F8_NDS NUMERIC(15,4),
    F11_NDSEXPORT NUMERIC(15,4),
    F14_NDSEXPORT NUMERIC(15,4),
    F15_NDS NUMERIC(15,4),
    F16_VSEGO NUMERIC(15,4),
    F17_NALOGNDS NUMERIC(15,4),
    F18_NEPL_VSEGONDS NUMERIC(15,4),
    F19_NEPL_NALOGNDS NUMERIC(15,4),
    F20_CORR_VSEGO NUMERIC(15,4),
    F21_CORR_NALOGNDS NUMERIC(15,4),
    F24_VIDOPL VARCHAR(50),
    TIP INTEGER)
AS
  declare variable tmp_gen integer;
  declare variable nds numeric (15,4);
  declare variable vsego numeric (15,4);
  declare variable nalog_nds numeric (15,2);
  declare variable IPN VARCHAR(12);
  declare variable lgoty integer;
begin

  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;

  /* Procedure Text */
  for
    select
      gen_id(tmp_gen,1),f.id,f.dat,o.fullname as zak,
      k.ipn,f.nds,f.tip,f.vidopl,k.lgoty,
      f.vsego,f.nalog_nds,f.tip
    from
      frmnnakl_1 f
        inner join klient k on f.id_zak=k.id
        inner join objects o on o.oid=f.id_zak
    where
      f.dat between :date_from and :date_to and
      f.id_izg=:id_izg
    order by
      f.dat,f.id
    into :f1_npp,:f3_id,:f2_dat,:f4_zak,
      :ipn,:nds,:tip,:f24_vidopl,:lgoty,
      :vsego,:nalog_nds,:tip

   do begin
     /*обработка исключений, добавление полей*/
     f5_ipn = null;
     f6_nds = null;
     f7_nds = null; /*for export*/
     f8_nds = null;
     f11_ndsexport = null;
     f14_ndsexport = null;
     f15_nds = null;
     f16_vsego = null;
     f17_nalognds = null;
     f18_nepl_vsegonds = null;
     f19_nepl_nalognds = null;
     f20_corr_vsego = null;
     f21_corr_nalognds = null;
/*     f24_vidopl = null;*/

     /*обычная налоговая, не корректировка*/
     if ((lgoty = 0) and not(tip=3003)) then begin
       f5_ipn=ipn;
       f6_nds=nds;
       f7_nds=vsego;
       f8_nds=Round(vsego*nalog_nds,2);
       /*f15_nds=nds;
       f16_vsego = vsego;
       f17_nalognds = vsego*nalog_nds;*/
     end
     /*'Экспортёр'*/
     if (lgoty = 1) then begin
       f6_nds=nds;
       f7_nds=nds;
       f11_ndsexport=nds;
     end
     /* 'Неплательщик НДС' */
     if (lgoty = 2) then begin
       f5_ipn='X';
       f6_nds=nds;
       f7_nds=vsego;
       f8_nds=Round(vsego*nalog_nds,2);       
       /*f15_nds=nds;
       f18_nepl_vsegonds=vsego;
       f19_nepl_nalognds=vsego*nalog_nds;*/
     end

     /*oid корректировки*/
     if (tip=3003) then begin
       f5_ipn=ipn;
       f6_nds=nds;
       f7_nds=vsego;
       f8_nds=Round(vsego*nalog_nds,2);       
       /*f20_corr_vsego=vsego;
       f21_corr_nalognds=vsego*nalog_nds;*/
     end
     suspend;
   end

  /* SET GENERATOR TMP_GEN TO 0;*/
  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;
END
^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring privileges */
/*-------------------------------------------------------------------------*/

GRANT SELECT ON FRMNNAKL_1 TO PROCEDURE REP_REESTR_VYDAN_NNAKL2_PC;
GRANT SELECT ON FRMNNAKL_1 TO PROCEDURE REP_REESTR_VYDAN_NNAKL_PC;
GRANT SELECT ON FRMNNAKL_1 TO PROCEDURE REP_TOVAR_KNIGA;


GRANT SELECT ON FRMNNAKL_1 TO PROCEDURE REP_REESTR_VYDAN_NNAKL2_PC;
GRANT SELECT ON KLIENT TO PROCEDURE REP_REESTR_VYDAN_NNAKL2_PC;
GRANT SELECT ON OBJECTS TO PROCEDURE REP_REESTR_VYDAN_NNAKL2_PC;
GRANT SELECT ON FRMNNAKL_1 TO PROCEDURE REP_REESTR_VYDAN_NNAKL_PC;
GRANT SELECT ON KLIENT TO PROCEDURE REP_REESTR_VYDAN_NNAKL_PC;
GRANT SELECT ON OBJECTS TO PROCEDURE REP_REESTR_VYDAN_NNAKL_PC;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_REESTR_VYDAN_NNAKL_PC;
GRANT SELECT ON FRMNNAKL_1 TO PROCEDURE REP_TOVAR_KNIGA;
GRANT SELECT ON KLIENT TO PROCEDURE REP_TOVAR_KNIGA;
GRANT SELECT ON OBJECTS TO PROCEDURE REP_TOVAR_KNIGA;

