SET TERM ^ ;

ALTER PROCEDURE REP_REESTR_VYDAN_NNAKL_PC(
    ID_IZG INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    F2_DAT TIMESTAMP,
    F3_ID VARCHAR(20),
    F4_VIDDOC VARCHAR(20),
    F42_VIDDOC VARCHAR(2),
    F43_VIDDOC VARCHAR(2),
    F5_ZAK VARCHAR(250),
    F6_IPN VARCHAR(12),
    F7_SUMWITHNDS NUMERIC(15,4),
    F8_BAZANDS NUMERIC(15,4),
    F9_NDS NUMERIC(15,4),
    F11_BEZOBLOGENIYA NUMERIC(15,4),
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
     f42_viddoc = null;
     f43_viddoc = null;
     f6_ipn = null;
     F7_SUMWITHNDS = null;
     F8_BAZANDS = null; /*for export*/
     F9_NDS = null;
     f11_bezoblogeniya = null;
     f12_BAZANDSEXPORT = null;

     /*обычная налоговая*/
     if ((lgoty=0) and
       ((tip_name<>'НАЛОГОВАЯ ЭКСПОРТНАЯ') and
       (tip_name<>'УСЛУГИ ОТ НЕРЕЗИДЕНТА') and
       (tip_name<>'ПОСТАВКА НЕПЛАТЕЛЬЩИКУ НДС') and
       (tip_name<>'НЕ ОБЪЕКТ ОБЛОЖЕНИЯ'))
       )
     then begin
       f6_ipn=ipn;
       F7_SUMWITHNDS=nds;
       F8_BAZANDS=vsego;
       F9_NDS=Round(vsego*nalog_nds,2);
     end

     if ((lgoty=1) or (tip_name='НАЛОГОВАЯ ЭКСПОРТНАЯ')) then begin
       f6_ipn='0';   /*В реестре выданных накладных в гр.6 должен стоять "Х" для экспорта.*/
       F7_SUMWITHNDS = nds;
       f12_BAZANDSEXPORT = nds;
       f4_viddoc='МДП';/*Вместо ПН07*/
     end
     /*Услуги от нерезидента*/
     if (((lgoty=2) or
       (tip_name='УСЛУГИ ОТ НЕРЕЗИДЕНТА') or
       (tip_name='ПОСТАВКА НЕПЛАТЕЛЬЩИКУ НДС'))
       and (tip_name<>'НЕ ОБЪЕКТ ОБЛОЖЕНИЯ'))  /*Иначе попадает в 8 колонку для НеОбъектаОбложения*/
     then begin
       f6_ipn='0';
       F7_SUMWITHNDS = nds;
       F8_BAZANDS = vsego;
       F9_NDS=Round(vsego*nalog_nds,2);       
     end
     
     if (tip_name='НЕ ОБЪЕКТ ОБЛОЖЕНИЯ') then begin
       if (lgoty=2) then begin
         f6_ipn='0';
       end else begin
         f6_ipn=ipn;
       end
       F7_SUMWITHNDS = nds;
       f11_bezoblogeniya = nds;
     end
     
     /*oid корректировки*/
     if (tip_name='КОРРЕКТИРОВКА') then begin
       f6_ipn=ipn;
       F7_SUMWITHNDS=nds;
       F8_BAZANDS=vsego;
       F9_NDS=Round(vsego*nalog_nds,2);       
     end

     if (tip_name='НАЛОГОВАЯ УТОЧНЯЮЩАЯ') then begin
       f4_viddoc = 'ПНП';
       f43_viddoc = 'У';
     end else begin
       if ((f4_viddoc starting 'ПНП') and strlen(f4_viddoc)>4)  then begin
         f42_viddoc = substr(f4_viddoc,4,2);
         f4_viddoc = substr(f4_viddoc,1,3);
       end
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


