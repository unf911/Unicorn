SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_REESTR_VYDAN_NNAKL2_PC(
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
declare variable klient_tip varchar(255);
declare variable nds numeric(15,4);
declare variable vsego numeric(15,4);
declare variable nalog_nds numeric(15,2);
declare variable ipn varchar(12);
begin
  /* SET GENERATOR TMP_GEN TO 0;*/
  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;


  for
    select
      gen_id(tmp_gen,1),o.name as zak,
      k.ipn,sum(f.nds),ab.value1,
      sum(f.vsego),max(f.nalog_nds),count(*)/*$$IBEC$$ ,f.tip $$IBEC$$*/
    from
      frmnnakl_1 f
        inner join klient k on f.id_zak=k.id
        inner join objects o on o.oid=f.id_zak
        left join attributes ab on ab.oid=f.id_zak
    where
      f.dat between :date_from and :date_to and
      f.id_izg=:id_izg and
      (ab.attribute_id=1 or ab.attribute_id is null)
      and ((trim(ab.value1)<>'Неплательщик НДС') or (trim(ab.value1)<>'Экспортёр') or(ab.value1 is null))
      and (f.tip=3002 or f.tip=0 or f.tip=-11 or f.tip=-10 or f.tip=-9)
    group by f.id_zak,k.ipn,k.id, o.oid,o.name,ab.oid, ab.value1
    order by
      k.ipn desc
    into :f1_npp,:f4_zak,
      :ipn,:nds,:klient_tip,
      :vsego,:nalog_nds,rowcount /*$$IBEC$$ :tip, $$IBEC$$*/

   do begin
     /*обработка исключений, добавление полей*/
     f5_ipn=ipn;
     f6_nds=nds;
     f7_nds=vsego;
     f8_nds=Round(vsego*nalog_nds,2);

     /*обычная налоговая*/
/*$$IBEC$$      if ((klient_tip is null) and (tip=3002 or tip=0)) then begin
       f5_ipn=ipn;
       f6_nds=nds;
       f7_nds=vsego;
       f8_nds=Round(vsego*nalog_nds,2);
     end $$IBEC$$*/

/*$$IBEC$$      if (klient_tip='Экспортёр') then begin
       f6_nds=nds;
       f7_nds=nds;
     end $$IBEC$$*/
     if (trim(klient_tip)<>'Неплательщик НДС') then begin
/*$$IBEC$$        f5_ipn='X';
       f6_nds=nds;
       f7_nds=vsego;
       f8_nds=Round(vsego*nalog_nds,2); $$IBEC$$*/
       suspend;       
     end
     f5_ipn=null;
/*oid корректировки*//*$$IBEC$$ 
     if (tip=3003) then begin
       f5_ipn=ipn;
       f6_nds=nds;
       f7_nds=vsego;
       f8_nds=Round(vsego*nalog_nds,2);       
     end $$IBEC$$*/

   end

  for
    select
      gen_id(tmp_gen,1),sum(f.nds),
      sum(f.vsego),max(f.nalog_nds),count(*)
    from
      frmnnakl_1 f
        inner join klient k on f.id_zak=k.id
        inner join objects o on o.oid=f.id_zak
        left join attributes ab on ab.oid=f.id_zak
    where
      f.dat between :date_from and :date_to and
      f.id_izg=:id_izg and
      (ab.attribute_id=1 or ab.attribute_id is null)
      and ab.value1='Неплательщик НДС'
      and f.tip<>-35 /*Услуги от нерезидента, даже неплательщик*/
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
END^

SET TERM ; ^

DESCRIBE PROCEDURE REP_REESTR_VYDAN_NNAKL2_PC
'Приложение к декларации по ндс
mode=0 все
mode=1 без корректировок и экспорта
mode=2 корректировки и экспорт';

GRANT SELECT ON FRMNNAKL_1 TO PROCEDURE REP_REESTR_VYDAN_NNAKL2_PC;

GRANT SELECT ON KLIENT TO PROCEDURE REP_REESTR_VYDAN_NNAKL2_PC;

GRANT SELECT ON OBJECTS TO PROCEDURE REP_REESTR_VYDAN_NNAKL2_PC;

GRANT SELECT ON ATTRIBUTES TO PROCEDURE REP_REESTR_VYDAN_NNAKL2_PC;

GRANT EXECUTE ON PROCEDURE REP_REESTR_VYDAN_NNAKL2_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE REP_REESTR_VYDAN_NNAKL2_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE REP_REESTR_VYDAN_NNAKL2_PC TO POWER_USER;

