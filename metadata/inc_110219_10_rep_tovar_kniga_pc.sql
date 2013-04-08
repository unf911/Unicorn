SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_TOVAR_KNIGA(
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
END^

SET TERM ; ^

DESCRIBE PROCEDURE REP_TOVAR_KNIGA
'на удаление

Товарная книга в программе переименована
в реестр выданных налоговых накладных
Возвращает товарную книгу,
источник - налоговые накладные,
Входные данные - фирма, период
Выход на распечатку.
Используется в отчёте - товарная книга';

GRANT SELECT ON FRMNNAKL_1 TO PROCEDURE REP_TOVAR_KNIGA;

GRANT SELECT ON KLIENT TO PROCEDURE REP_TOVAR_KNIGA;

GRANT SELECT ON OBJECTS TO PROCEDURE REP_TOVAR_KNIGA;

GRANT EXECUTE ON PROCEDURE REP_TOVAR_KNIGA TO SYSDBA;
GRANT EXECUTE ON PROCEDURE REP_TOVAR_KNIGA TO BOSSES;
GRANT EXECUTE ON PROCEDURE REP_TOVAR_KNIGA TO BUXG;
GRANT EXECUTE ON PROCEDURE REP_TOVAR_KNIGA TO MANAGER;
GRANT EXECUTE ON PROCEDURE REP_TOVAR_KNIGA TO POWER_USER;
