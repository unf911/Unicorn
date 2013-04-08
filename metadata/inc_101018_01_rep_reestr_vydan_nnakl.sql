SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_REESTR_VYDAN_NNAKL_PC(
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
declare variable klient_tip varchar(255);
declare variable nds numeric(15,4);
declare variable vsego numeric(15,4);
declare variable nalog_nds numeric(15,2);
declare variable ipn varchar(12);
declare variable id_nnaklr_tip integer;
declare variable tip_name varchar(50);
begin

  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;

  /* Procedure Text */
  for
    select
      gen_id(tmp_gen,1),f.id,f.dat,o.fullname as zak,
      k.ipn,f.nds,f.tip,ab.value1,
      f.vsego,f.nalog_nds,f.tip
    from
      frmnnakl_1 f
        inner join klient k on f.id_zak=k.id
        inner join objects o on o.oid=f.id_zak
        left join attributes ab on ab.oid=f.id_zak
    where
      f.dat between :date_from and :date_to and
      f.id_izg=:id_izg and
      (ab.attribute_id=1 or ab.attribute_id is null)
    order by
      f.dat,f.id
    into :f1_npp,:f3_id,:f2_dat,:f5_zak,
      :ipn,:nds,:tip,:klient_tip,
      :vsego,:nalog_nds,:tip

   do begin
   
     select oid
       from get_oid_objects_pc('ТИП НАЛОГОВЫХ НАКЛАДНЫХ',-100)
       into :id_nnaklr_tip;
     select name
       from get_name_objects_pc(:tip,:id_nnaklr_tip)
       into :tip_name;
       
     if (tip_name='НАЛОГОВАЯ') then begin
       f4_viddoc='ПН';/*Податкова накладна*/
     end
     if  (tip_name='КОРРЕКТИРОВКА') then begin
       f4_viddoc='РК';/*Расчётная корректировка*/
     end
     if (tip_name='НАЛОГОВАЯ ЭКСПОРТНАЯ') then begin
       f4_viddoc='ВМД';/*Вантажна митна декларация*/
     end
     if (tip_name='ПП') then begin
       f4_viddoc='ПП';
     end
     if (tip_name='ЗЦ') then begin
       f4_viddoc='ЗЦ';
     end
     if (tip_name='НАЛОГОВАЯ УТОЧНЯЮЩАЯ') then begin
       f4_viddoc='ПНУ';
     end
     if (tip_name='УСЛУГИ ОТ НЕРЕЗИДЕНТА') then begin
       f4_viddoc='ПН';
     end     

               
     
     /*пока нет УСЛУГИ ОТ НЕРЕЗИДЕНТА*/
        
     /*обработка исключений, добавление полей*/
     f6_ipn = null;
     F7_SUMWITHNDS = null;
     F8_BAZANDS = null; /*for export*/
     F9_NDS = null;
     f12_BAZANDSEXPORT = null;

     /*обычная налоговая*/
     if ((klient_tip is null) and
       ((tip_name='НАЛОГОВАЯ') or
       (tip_name='НАЛОГОВАЯ УТОЧНЯЮЩАЯ') or
       (tip_name='ПП') or
       (tip_name='ЗЦ') 
       )) then begin
       f6_ipn=ipn;
       F7_SUMWITHNDS=nds;
       F8_BAZANDS=vsego;
       F9_NDS=Round(vsego*nalog_nds,2);
     end

     if (klient_tip='Экспортёр') then begin
       f6_ipn='X';   /*В реестре выданных накладных в гр.6 должен стоять "Х" для экспорта.*/
       F7_SUMWITHNDS=nds;
       /*Письмо Марины Даниловны от 18/10/10*/
       /*F8_BAZANDS=nds;*/
       f12_BAZANDSEXPORT=nds;
     end
     /*Услуги от нерезидента*/
     if ((klient_tip='Неплательщик НДС') or (tip_name='УСЛУГИ ОТ НЕРЕЗИДЕНТА')) then begin
       f6_ipn='X';
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
END^

SET TERM ; ^

DESCRIBE PROCEDURE REP_REESTR_VYDAN_NNAKL_PC
'в реестр выданных налоговых накладных

источник - налоговые накладные,
Входные данные - фирма, период
Выход на распечатку.
Используется в отчёте - реестр выданных налоговых накладных';

GRANT SELECT ON FRMNNAKL_1 TO PROCEDURE REP_REESTR_VYDAN_NNAKL_PC;

GRANT SELECT ON KLIENT TO PROCEDURE REP_REESTR_VYDAN_NNAKL_PC;

GRANT SELECT ON OBJECTS TO PROCEDURE REP_REESTR_VYDAN_NNAKL_PC;

GRANT SELECT ON ATTRIBUTES TO PROCEDURE REP_REESTR_VYDAN_NNAKL_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_REESTR_VYDAN_NNAKL_PC;

GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE REP_REESTR_VYDAN_NNAKL_PC;

GRANT EXECUTE ON PROCEDURE REP_REESTR_VYDAN_NNAKL_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE REP_REESTR_VYDAN_NNAKL_PC TO BOSSES;
GRANT EXECUTE ON PROCEDURE REP_REESTR_VYDAN_NNAKL_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE REP_REESTR_VYDAN_NNAKL_PC TO POWER_USER;

