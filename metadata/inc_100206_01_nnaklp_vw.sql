/*-------------------------------------------------------------------------*/
/* First procedures with empty bodies */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE NNAKLP_DELMARK_PC(
    ID_NAKL INTEGER)
AS
BEGIN
  EXIT;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE REP_REESTR_POLYCH_NNAKL2_PC(
    ID_ZAK INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    DAT_MONTH INTEGER,
    DAT_YEAR INTEGER,
    F4_ZAK VARCHAR(250),
    F5_IPN VARCHAR(12),
    F6_NDS NUMERIC(15,4),
    F7_NDS NUMERIC(15,4),
    F8_NDS NUMERIC(15,4),
    ROWCOUNT INTEGER)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE REP_REESTR_POLYCH_NNAKL3_PC(
    ID_ZAK INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    DAT_MONTH INTEGER,
    DAT_YEAR INTEGER,
    F4_IZG VARCHAR(250),
    F5_IPN VARCHAR(12),
    F6_NDS NUMERIC(15,4),
    F7_NDS NUMERIC(15,4),
    F8_NDS NUMERIC(15,4),
    ROWCOUNT INTEGER)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE REP_REESTR_POLYCH_NNAKL4_PC(
    ID_ZAK INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    F2_DAT TIMESTAMP,
    F3_DAT_VYPISKI TIMESTAMP,
    F4_ID VARCHAR(20),
    F5_VIDDOC VARCHAR(20),
    F6_IZG VARCHAR(250),
    F7_IPN VARCHAR(12),
    F8_SUMWITHNDS NUMERIC(15,4),
    F9_BAZANDS NUMERIC(15,4),
    F10_NDS NUMERIC(15,4),
    F12_NDS NUMERIC(15,4),
    F13_BAZANDS NUMERIC(15,4),
    F14_NDS NUMERIC(15,4),
    F16_NDS NUMERIC(15,4),
    TIP INTEGER)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE REP_REESTR_POLYCH_NNAKL_PC(
    ID_ZAK INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    F2_DAT TIMESTAMP,
    F3_DAT_VYPISKI TIMESTAMP,
    F4_ID VARCHAR(20),
    F5_VIDDOC VARCHAR(20),
    F6_IZG VARCHAR(250),
    F7_IPN VARCHAR(12),
    F8_SUMWITHNDS NUMERIC(15,4),
    F9_BAZANDS NUMERIC(15,4),
    F10_NDS NUMERIC(15,4),
    F12_NDS NUMERIC(15,4),
    F13_BAZANDS NUMERIC(15,4),
    F14_NDS NUMERIC(15,4),
    F16_NDS NUMERIC(15,4),
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

DROP VIEW NNAKLP_VW;

/*-------------------------------------------------------------------------*/
/* Creating new views */
/*-------------------------------------------------------------------------*/

CREATE VIEW NNAKLP_VW(
    ID_NAKL,
    ID,
    KURS,
    NDS,
    DAT,
    ID_IZG,
    ID_ZAK,
    ID_MANAGER,
    ID_CURRENCY,
    NALOG_NDS,
    ID_OSNOVANIE,
    VIDOPL,
    USL,
    TIP,
    POSTED,
    BLOCKED,
    DELMARKED,
    DAT_VYPISKI,
    VSEGO,
    VSEGONDS)
AS
select 
  om.id_nakl,om.id,om.kurs,
  om.nds, om.dat,
  om.id_izg,om.id_zak, om.id_manager,
  om.id_currency, om.nalog_nds, om.parent_id_nakl,
  n.dov, /*vidopl*/
  om.comment, /*usl*/
  om.tip,
  om.posted,
  om.blocked,
  om.delmarked,
  n.dat,
  n.vsego, /*vsego*/
  n.nds /*vsegonds*/
from 
  naklr n inner join naklo om on om.id_nakl=n.id_nakl
where
  om.tip in (13118,13119,13164,13166,-62,-17,-16,-15,-14,-13,-12)
  /*ПРИХОДНАЯ НАЛОГОВАЯ, ПРИХОДНАЯ КОРРЕКТИРОВКА,
   ПОЛУЧЕННАЯ ГТД,ПОЛУЧЕННАЯ НЕХОЗЯЙСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ
   ТИП-'ТИП ПОЛУЧЕННЫХ НАЛОГОВЫХ НАКЛАДНЫХ'
  */
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

CREATE TRIGGER NNAKLP_VW_BI0 FOR NNAKLP_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER NNAKLP_VW_BU0 FOR NNAKLP_VW
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

ALTER TRIGGER NNAKLP_VW_BI0
as
  declare variable tip_nnaklp_corr integer;
  declare variable tip_nnaklp integer;
  declare variable classid integer;
  declare variable tip_nnaklp_gtd integer;
  declare variable tip_nnaklp_nexoz integer;  
begin
  if (new.id_nakl is null) then begin
    new.id_nakl = gen_id(naklo_gen,1);
  end

  select oid
    from get_oid_objects_pc('ТИП ПОЛУЧЕННЫХ НАЛОГОВЫХ НАКЛАДНЫХ',-100)
    into :classid;
  select oid
    from get_oid_objects_pc('ПРИХОДНАЯ НАЛОГОВАЯ',:classid)
    into :tip_nnaklp;
  select oid
    from get_oid_objects_pc('ПРИХОДНАЯ КОРРЕКТИРОВКА',:classid)
    into :tip_nnaklp_corr;
  select oid
    from get_oid_objects_pc('ПОЛУЧЕННАЯ ГТД',:classid)
    into :tip_nnaklp_gtd;
  select oid
    from get_oid_objects_pc('ПОЛУЧЕННАЯ НЕХОЗЯЙСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ',:classid)
    into :tip_nnaklp_nexoz;
  if ((new.tip is null) or
   ((new.tip<>:tip_nnaklp) and
   (new.tip<>:tip_nnaklp_corr) and
   (new.tip<>:tip_nnaklp_gtd) and
   (new.tip<>:tip_nnaklp_nexoz))) then begin
    new.tip=:tip_nnaklp;
  end  
  /*if (new.tip is null) then begin*/
   /* select oid
      from GET_OID_OBJECTS_PC('ТИП ПОЛУЧЕННЫХ НАЛОГОВЫХ НАКЛАДНЫХ',-100)
      into :classid;
    select oid
      from GET_OID_OBJECTS_PC('ПРИХОДНАЯ НАЛОГОВАЯ',:classid)
      into :classid;
    new.tip=:classid;*/
  /*end*/
  insert into naklo (id_nakl,id,kurs,nds,dat,
      id_izg,id_zak,id_manager,
      id_currency, nalog_nds, parent_id_nakl,
      comment, tip,
      posted,blocked,delmarked)
    values (new.id_nakl,new.id,new.kurs,new.nds,new.dat,
      new.id_izg,new.id_zak,new.id_manager,
      new.id_currency,new.nalog_nds, new.id_osnovanie,
      new.vidopl,new.tip,
      new.posted,new.blocked,new.delmarked);
  insert into naklr (id_nakl,dat,dov,
      vsego,nds)
    values (new.id_nakl,new.dat_vypiski,new.vidopl,
      new.vsego,new.vsegonds);
end^

ALTER TRIGGER NNAKLP_VW_BU0
as
  declare variable tip_nnaklp_corr integer;
  declare variable tip_nnaklp integer;
  declare variable classid integer;
  declare variable tip_nnaklp_gtd integer;
  declare variable tip_nnaklp_nexoz integer;
  declare variable tip_nnaklp_usl_nerez integer;
begin
  select oid
    from get_oid_objects_pc('ТИП ПОЛУЧЕННЫХ НАЛОГОВЫХ НАКЛАДНЫХ',-100)
    into :classid;
  select oid
    from get_oid_objects_pc('ПРИХОДНАЯ НАЛОГОВАЯ',:classid)
    into :tip_nnaklp;
  select oid
    from get_oid_objects_pc('ПРИХОДНАЯ КОРРЕКТИРОВКА',:classid)
    into :tip_nnaklp_corr;
  select oid
    from get_oid_objects_pc('ПОЛУЧЕННАЯ ГТД',:classid)
    into :tip_nnaklp_gtd;
  select oid
    from get_oid_objects_pc('ПОЛУЧЕННАЯ НЕХОЗЯЙСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ',:classid)
    into :tip_nnaklp_nexoz;
  select oid
    from get_oid_objects_pc('ПРИХОДНАЯ НАЛОГОВАЯ НА УСЛУГИ ОТ НЕРЕЗИДЕНТА',:classid)
    into :tip_nnaklp_usl_nerez;
  if ((new.tip is null) or
   ((new.tip<>:tip_nnaklp) and
   (new.tip<>:tip_nnaklp_corr) and
   (new.tip<>:tip_nnaklp_gtd) and
   (new.tip<>:tip_nnaklp_usl_nerez) and
   (new.tip<>:tip_nnaklp_nexoz))) then begin
    new.tip=:tip_nnaklp;
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
      om.id_currency=new.id_currency,
      om.nalog_nds=new.nalog_nds,
      om.parent_id_nakl=new.id_osnovanie,
      om.comment=new.usl,
      om.tip=new.tip,
      om.posted = new.posted,
      om.blocked = new.blocked,
      om.delmarked = new.delmarked
    where om.id_nakl=old.id_nakl;
  update naklr n
    set n.dat=new.dat_vypiski,
      n.dov=new.vidopl,
      n.id_nakl=new.id_nakl,
      n.vsego=new.vsego,
      n.nds=new.vsegonds
    where
      n.id_nakl=old.id_nakl;
end^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring bodies of procedures */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE NNAKLP_DELMARK_PC(
    ID_NAKL INTEGER)
AS
begin
  update nnaklp_vw om
    set om.delmarked =1
    where om.id_nakl=:id_nakl;
end
^

ALTER PROCEDURE REP_REESTR_POLYCH_NNAKL2_PC(
    ID_ZAK INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    DAT_MONTH INTEGER,
    DAT_YEAR INTEGER,
    F4_ZAK VARCHAR(250),
    F5_IPN VARCHAR(12),
    F6_NDS NUMERIC(15,4),
    F7_NDS NUMERIC(15,4),
    F8_NDS NUMERIC(15,4),
    ROWCOUNT INTEGER)
AS
  declare variable vsego_nds numeric(15,4);
  declare variable tmp_gen integer;
/*$$IBEC$$   declare variable klient_tip varchar(255); $$IBEC$$*/
  declare variable nds numeric (15,4);
  declare variable vsego numeric (15,4);
/*$$IBEC$$   declare variable nalog_nds numeric (15,2); $$IBEC$$*/
  declare variable ipn varchar(12);
/*$$IBEC$$   declare variable id_nnaklp_tip integer; $$IBEC$$*/
/*$$IBEC$$   declare variable tip_name varchar(50); $$IBEC$$*/
begin

  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;

  for
    select
      gen_id(tmp_gen,1),extractmonth( f.dat_vypiski),extractyear( f.dat_vypiski),
      o.name as izg,
      k.ipn,sum(f.nds),
      sum(f.vsego),sum(f.vsegonds),
      /*$$IBEC$$ (select ab.value1 from attributes ab where ab.oid=f.id_izg), $$IBEC$$*/
      count(*)
    from
      nnaklp_vw f
        inner join klient k on f.id_izg=k.id 
        inner join objects o on o.oid=f.id_izg 
        /*left join attributes ab on ab.oid=f.id_izg    */
    where
      f.dat between :date_from and :date_to and
      f.id_zak=:id_zak and
      f.delmarked=0 and
      f.nalog_nds>0 and
      ((select name from objects o where o.oid=f.tip) in ('ПРИХОДНАЯ НАЛОГОВАЯ'))
      /*$$IBEC$$ and
      (ab.attribute_id=1 or ab.attribute_id is null) $$IBEC$$*/ 
    group by f.id_izg,extractmonth( f.dat_vypiski),extractyear( f.dat_vypiski),
      o.name,o.oid,k.ipn,k.id
    order by
      k.ipn
    into :f1_npp,:dat_month,:dat_year,:f4_zak,
      :ipn,:nds,
      :vsego,:vsego_nds,/*$$IBEC$$ :klient_tip $$IBEC$$*/:rowcount

   do begin
     f5_ipn=ipn;
     f6_nds=round(nds,2);
     f7_nds=round(vsego,2);
     f8_nds=round(vsego_nds,2);
     suspend;
     f5_ipn=null;
   end

  /* SET GENERATOR TMP_GEN TO 0;*/
  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;
end
^

ALTER PROCEDURE REP_REESTR_POLYCH_NNAKL3_PC(
    ID_ZAK INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    DAT_MONTH INTEGER,
    DAT_YEAR INTEGER,
    F4_IZG VARCHAR(250),
    F5_IPN VARCHAR(12),
    F6_NDS NUMERIC(15,4),
    F7_NDS NUMERIC(15,4),
    F8_NDS NUMERIC(15,4),
    ROWCOUNT INTEGER)
AS
  declare variable vsego_nds numeric(15,4);
  declare variable tmp_gen integer;
/*$$IBEC$$   declare variable klient_tip varchar(255); $$IBEC$$*/
  declare variable nds numeric (15,4);
  declare variable vsego numeric (15,4);
/*$$IBEC$$   declare variable nalog_nds numeric (15,2); $$IBEC$$*/
  declare variable ipn varchar(12);
/*$$IBEC$$   declare variable id_nnaklp_tip integer; $$IBEC$$*/
/*$$IBEC$$   declare variable tip_name varchar(50); $$IBEC$$*/
begin

  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;

  for
    select
      gen_id(tmp_gen,1),extractmonth( f.dat_vypiski),extractyear( f.dat_vypiski),
      o.name as izg,
      k.ipn,sum(f.nds),
      sum(f.vsego),sum(f.vsegonds),
      /*$$IBEC$$ (select ab.value1 from attributes ab where ab.oid=f.id_izg), $$IBEC$$*/
      count(*)
    from
      nnaklp_vw f
        inner join klient k on f.id_izg=k.id 
        inner join objects o on o.oid=f.id_izg 
        /*left join attributes ab on ab.oid=f.id_izg    */
    where
      f.dat between :date_from and :date_to and
      f.id_zak=:id_zak and
      f.delmarked=0 and
      f.nalog_nds>0 and
      ((select name from objects o where o.oid=f.tip) in ('ПОЛУЧЕННАЯ НЕХОЗЯЙСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ'))
      /*$$IBEC$$ and
      (ab.attribute_id=1 or ab.attribute_id is null) $$IBEC$$*/ 
    group by f.id_izg,extractmonth( f.dat_vypiski),extractyear( f.dat_vypiski),
      o.name,o.oid,k.ipn,k.id
    order by
      k.ipn
    into :f1_npp,:dat_month,:dat_year,:f4_izg,
      :ipn,:nds,
      :vsego,:vsego_nds,/*$$IBEC$$ :klient_tip $$IBEC$$*/:rowcount

   do begin
     f5_ipn=ipn;
     f6_nds=Round(nds,2);
     f7_nds=Round(vsego,2);
     f8_nds=Round(vsego_nds,2);
     suspend;
   end

  /* SET GENERATOR TMP_GEN TO 0;*/
  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;
end
^

ALTER PROCEDURE REP_REESTR_POLYCH_NNAKL4_PC(
    ID_ZAK INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    F2_DAT TIMESTAMP,
    F3_DAT_VYPISKI TIMESTAMP,
    F4_ID VARCHAR(20),
    F5_VIDDOC VARCHAR(20),
    F6_IZG VARCHAR(250),
    F7_IPN VARCHAR(12),
    F8_SUMWITHNDS NUMERIC(15,4),
    F9_BAZANDS NUMERIC(15,4),
    F10_NDS NUMERIC(15,4),
    F12_NDS NUMERIC(15,4),
    F13_BAZANDS NUMERIC(15,4),
    F14_NDS NUMERIC(15,4),
    F16_NDS NUMERIC(15,4),
    TIP INTEGER)
AS
  declare variable vsego_nds numeric(15,4);
  declare variable tmp_gen integer;
  declare variable klient_tip varchar(255);
  declare variable nds numeric (15,4);
  declare variable vsego numeric (15,4);
  declare variable nalog_nds numeric (15,2);
  declare variable ipn varchar(12);
  declare variable id_nnaklp_tip integer;
  declare variable tip_name varchar(50);
begin

  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;

  for
    select
      gen_id(tmp_gen,1),f.id,f.dat,f.DAT_VYPISKI,
      o.fullname as izg,
      k.ipn,f.nds,f.tip,
      f.vsego,f.vsegonds, f.nalog_nds,f.tip,
      (select ab.value1 from attributes ab where ab.oid=f.id_izg) /*,ab.value1 */
    from
      nnaklp_vw f
        inner join klient k on f.id_izg=k.id 
        inner join objects o on o.oid=f.id_izg 
        /*left join attributes ab on ab.oid=f.id_izg    */
    where
      f.dat between :date_from and :date_to and
      f.id_zak=:id_zak and
      f.delmarked=0 /*$$IBEC$$ and
      (ab.attribute_id=1 or ab.attribute_id is null) $$IBEC$$*/ 
    order by
      f.dat,f.id
    into :f1_npp,:f4_id,:f2_dat,:f3_dat_vypiski,:f6_izg,
      :ipn,:nds,:tip,
      :vsego,:vsego_nds,:nalog_nds,:tip,:klient_tip

   do begin

     /*обработка исключений, добавление полей*/
     f7_ipn = null;
     f8_sumwithnds = null;
     f9_bazands = null; /*for export*/
     f10_nds = null;
     f12_nds=null;
     f13_bazands = null;
     f14_nds = null;
     f16_nds = null;
     select oid
       from get_oid_objects_pc('ТИП ПОЛУЧЕННЫХ НАЛОГОВЫХ НАКЛАДНЫХ',-100)
       into :id_nnaklp_tip;
     select name
       from get_name_objects_pc(:tip,:id_nnaklp_tip)
       into :tip_name;
       
     if (tip_name='ПРИХОДНАЯ НАЛОГОВАЯ') then begin
       f5_viddoc='ПН';/*Податкова накладна*/
     end
     if  (tip_name='ПРИХОДНАЯ КОРРЕКТИРОВКА') then begin
       f5_viddoc='ПНУ';/*Уточнена Податкова накладна*/
     end
     if (tip_name='ПОЛУЧЕННАЯ ГТД') then begin
       f5_viddoc='ВДМ';/*Вантажна митна декларация*/
     end
        
     if (nalog_nds=0) then begin
       if (klient_tip='Неплательщик НДС') then begin
         /*f5_ipn='X';*/
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f9_bazands=nds;
         f10_nds=0;
         suspend;
       end else begin /*'Неплательщик НДС'*/
         /*Плательщик НДС, но просто
         эти услуги НДС не облагаются*/
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f9_bazands=nds;
         f10_nds=0;
         suspend;
       end /*'Неплательщик НДС'*/
     end else begin /*Неплательщик НДС*/

       /*обычная налоговая*/
       if  ((tip_name='ПРИХОДНАЯ НАЛОГОВАЯ') or
          (tip_name='ПРИХОДНАЯ КОРРЕКТИРОВКА') or
          (tip_name='ПРИХОДНАЯ НАЛОГОВАЯ НА УСЛУГИ ОТ НЕРЕЗИДЕНТА'))  then begin
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f9_bazands=vsego;
         f10_nds=vsego_nds;
         suspend;
       end
       if (tip_name='ПОЛУЧЕННАЯ НЕХОЗЯЙСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ') then begin
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f13_bazands=vsego;
         f14_nds=vsego_nds;
         suspend;
       end
       if (tip_name='ПОЛУЧЕННАЯ ГТД') then begin
         /*импортёры и просто накладные так помеченные*/
         f7_ipn='X';
         f8_sumwithnds=nds;
         f9_bazands=vsego;
         f10_nds=vsego_nds;
         suspend;
       end /*if (tip_name='ПОЛУЧЕННАЯ ГТД')*/
     end /*'Неплательщик НДС'*/
   end

  /* SET GENERATOR TMP_GEN TO 0;*/
  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;
end
^

ALTER PROCEDURE REP_REESTR_POLYCH_NNAKL_PC(
    ID_ZAK INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    F2_DAT TIMESTAMP,
    F3_DAT_VYPISKI TIMESTAMP,
    F4_ID VARCHAR(20),
    F5_VIDDOC VARCHAR(20),
    F6_IZG VARCHAR(250),
    F7_IPN VARCHAR(12),
    F8_SUMWITHNDS NUMERIC(15,4),
    F9_BAZANDS NUMERIC(15,4),
    F10_NDS NUMERIC(15,4),
    F12_NDS NUMERIC(15,4),
    F13_BAZANDS NUMERIC(15,4),
    F14_NDS NUMERIC(15,4),
    F16_NDS NUMERIC(15,4),
    TIP INTEGER)
AS
  declare variable vsego_nds numeric(15,4);
  declare variable tmp_gen integer;
  declare variable klient_tip varchar(255);
  declare variable nds numeric (15,4);
  declare variable vsego numeric (15,4);
  declare variable nalog_nds numeric (15,2);
  declare variable ipn varchar(12);
  declare variable id_nnaklp_tip integer;
  declare variable tip_name varchar(50);
begin

  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;

  for
    select
      gen_id(tmp_gen,1),f.id,f.dat,f.DAT_VYPISKI,
      o.fullname as izg,
      k.ipn,f.nds,f.tip,
      f.vsego,f.vsegonds, f.nalog_nds,f.tip,
      (select ab.value1 from attributes ab where ab.oid=f.id_izg) /*,ab.value1 */
    from
      nnaklp_vw f
        inner join klient k on f.id_izg=k.id 
        inner join objects o on o.oid=f.id_izg 
        /*left join attributes ab on ab.oid=f.id_izg    */
    where
      f.dat between :date_from and :date_to and
      f.id_zak=:id_zak and
      f.delmarked=0 /*$$IBEC$$ and
      (ab.attribute_id=1 or ab.attribute_id is null) $$IBEC$$*/ 
    order by
      f.dat,f.id
    into :f1_npp,:f4_id,:f2_dat,:f3_dat_vypiski,:f6_izg,
      :ipn,:nds,:tip,
      :vsego,:vsego_nds,:nalog_nds,:tip,:klient_tip

   do begin

     /*обработка исключений, добавление полей*/
     f7_ipn = null;
     f8_sumwithnds = null;
     f9_bazands = null; /*for export*/
     f10_nds = null;
     f12_nds=null;
     f13_bazands = null;
     f14_nds = null;
     f16_nds = null;
     select oid
       from get_oid_objects_pc('ТИП ПОЛУЧЕННЫХ НАЛОГОВЫХ НАКЛАДНЫХ',-100)
       into :id_nnaklp_tip;
     select name
       from get_name_objects_pc(:tip,:id_nnaklp_tip)
       into :tip_name;
       
     if (tip_name='ПРИХОДНАЯ НАЛОГОВАЯ') then begin
       f5_viddoc='ПН';/*Податкова накладна*/
     end
     if  (tip_name='ПРИХОДНАЯ КОРРЕКТИРОВКА') then begin
       f5_viddoc='РК';/*Расчёт корректировки*/
     end
     if (tip_name='ПОЛУЧЕННАЯ ГТД') then begin
       f5_viddoc='ВДМ';/*Вантажна митна декларация*/
     end
     if (tip_name='ПРИХОДНАЯ НАЛОГОВАЯ УТОЧНЁННАЯ') then begin
       f5_viddoc='ПНУ';/*Податкова накладна уточнена*/
     end
     if (tip_name='ТОВАРНЫЙ КАССОВЫЙ ЧЕК') then begin
       f5_viddoc='ЧК';/*Товарний (касовий) чек*/
     end     
     if (tip_name='ТРАНСПОРТНЫЙ БИЛЕТ') then begin
       f5_viddoc='ТК';/*Транспортний квиток*/
     end
     if (tip_name='СЧЕТ ЗА УСЛУГИ СВЯЗИ') then begin
       f5_viddoc='ПЗ';/*Рахунок за послуги зв\язку*/
     end
     if (tip_name='СЧЕТ ЗА УСЛУГИ СВЯЗИ') then begin
       f5_viddoc='ПО';/*Рахунок за послуги вартисть яких визначаеться за показниками приладив облику*/
     end     
     if (tip_name='ЗАЯВКА ПЛАТЕЛЬЩИКА') then begin
       f5_viddoc='ЗП';/*Заявка платника*/
     end
         
     if (nalog_nds=0) then begin
       if (klient_tip='Неплательщик НДС') then begin
         /*f5_ipn='X';*/
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f9_bazands=nds;
         f10_nds=0;
         suspend;
       end else begin /*'Неплательщик НДС'*/
         /*Плательщик НДС, но просто
         эти услуги НДС не облагаются*/
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f9_bazands=nds;
         f10_nds=0;
         suspend;
       end /*'Неплательщик НДС'*/
     end else begin /*Неплательщик НДС*/

       /*обычная налоговая*/
       if  ((tip_name='ПРИХОДНАЯ НАЛОГОВАЯ') or
          (tip_name='ПРИХОДНАЯ КОРРЕКТИРОВКА') or
          (tip_name='ПРИХОДНАЯ НАЛОГОВАЯ НА УСЛУГИ ОТ НЕРЕЗИДЕНТА'))  then begin
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f9_bazands=vsego;
         f10_nds=vsego_nds;
         suspend;
       end
       if (tip_name='ПОЛУЧЕННАЯ НЕХОЗЯЙСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ') then begin
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f13_bazands=vsego;
         f14_nds=vsego_nds;
         suspend;
       end
       if (tip_name='ПОЛУЧЕННАЯ ГТД') then begin
         /*импортёры и просто накладные так помеченные*/
         f7_ipn='X';
         f8_sumwithnds=nds;
         f9_bazands=vsego;
         f10_nds=vsego_nds;
         suspend;
       end /*if (tip_name='ПОЛУЧЕННАЯ ГТД')*/
     end /*'Неплательщик НДС'*/
   end

  /* SET GENERATOR TMP_GEN TO 0;*/
  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;
end
^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring privileges */
/*-------------------------------------------------------------------------*/

GRANT SELECT ON NAKLO TO VIEW NNAKLP_VW;
GRANT SELECT ON NAKLR TO VIEW NNAKLP_VW;
GRANT SELECT, UPDATE ON NNAKLP_VW TO PROCEDURE NNAKLP_DELMARK_PC;
GRANT SELECT ON NNAKLP_VW TO PROCEDURE REP_REESTR_POLYCH_NNAKL2_PC;
GRANT SELECT ON NNAKLP_VW TO PROCEDURE REP_REESTR_POLYCH_NNAKL3_PC;
GRANT SELECT ON NNAKLP_VW TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;
GRANT SELECT, REFERENCES ON NNAKLP_VW TO BOSSES;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON NNAKLP_VW TO BUXG;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON NNAKLP_VW TO POWER_USER;


GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER NNAKLP_VW_BI0;
GRANT INSERT ON NAKLO TO TRIGGER NNAKLP_VW_BI0;
GRANT INSERT ON NAKLR TO TRIGGER NNAKLP_VW_BI0;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER NNAKLP_VW_BU0;
GRANT SELECT,UPDATE ON NAKLO TO TRIGGER NNAKLP_VW_BU0;
GRANT SELECT,UPDATE ON NAKLR TO TRIGGER NNAKLP_VW_BU0;
GRANT SELECT,UPDATE ON NNAKLP_VW TO PROCEDURE NNAKLP_DELMARK_PC;
GRANT SELECT ON NNAKLP_VW TO PROCEDURE REP_REESTR_POLYCH_NNAKL2_PC;
GRANT SELECT ON KLIENT TO PROCEDURE REP_REESTR_POLYCH_NNAKL2_PC;
GRANT SELECT ON OBJECTS TO PROCEDURE REP_REESTR_POLYCH_NNAKL2_PC;
GRANT SELECT ON NNAKLP_VW TO PROCEDURE REP_REESTR_POLYCH_NNAKL3_PC;
GRANT SELECT ON KLIENT TO PROCEDURE REP_REESTR_POLYCH_NNAKL3_PC;
GRANT SELECT ON OBJECTS TO PROCEDURE REP_REESTR_POLYCH_NNAKL3_PC;
GRANT SELECT ON ATTRIBUTES TO PROCEDURE REP_REESTR_POLYCH_NNAKL4_PC;
GRANT SELECT ON NNAKLP_VW TO PROCEDURE REP_REESTR_POLYCH_NNAKL4_PC;
GRANT SELECT ON KLIENT TO PROCEDURE REP_REESTR_POLYCH_NNAKL4_PC;
GRANT SELECT ON OBJECTS TO PROCEDURE REP_REESTR_POLYCH_NNAKL4_PC;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_REESTR_POLYCH_NNAKL4_PC;
GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE REP_REESTR_POLYCH_NNAKL4_PC;
GRANT SELECT ON ATTRIBUTES TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;
GRANT SELECT ON NNAKLP_VW TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;
GRANT SELECT ON KLIENT TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;
GRANT SELECT ON OBJECTS TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;
GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;

