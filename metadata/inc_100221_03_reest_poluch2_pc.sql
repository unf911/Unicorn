SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_REESTR_POLYCH_NNAKL2_PC(
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
      ((select name from objects o where o.oid=f.tip) in ('опхундмюъ мюкнцнбюъ',
        'опхундмюъ мюкнцнбюъ срнвм╗ммюъ',
        'явер гю сяксцх ябъгх', 'рнбюпмши йюяянбши вей','рпюмяонпрмши ахкер',
        'явер гю сяксцх он явервхйюл','гюъбйю окюрекэыхйю'))
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
end^

SET TERM ; ^

DESCRIBE PROCEDURE REP_REESTR_POLYCH_NNAKL2_PC
'оПХКНФЕМХЕ 5 Й ДЕЙКЮПЮЖХХ ОН МДЯ. рЮАКХЖЮ 2.';

GRANT SELECT ON NNAKLP_VW TO PROCEDURE REP_REESTR_POLYCH_NNAKL2_PC;

GRANT SELECT ON KLIENT TO PROCEDURE REP_REESTR_POLYCH_NNAKL2_PC;

GRANT SELECT ON OBJECTS TO PROCEDURE REP_REESTR_POLYCH_NNAKL2_PC;

GRANT EXECUTE ON PROCEDURE REP_REESTR_POLYCH_NNAKL2_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE REP_REESTR_POLYCH_NNAKL2_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE REP_REESTR_POLYCH_NNAKL2_PC TO POWER_USER;
