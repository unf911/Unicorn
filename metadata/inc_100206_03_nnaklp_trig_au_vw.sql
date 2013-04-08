SET TERM ^ ;



CREATE OR ALTER TRIGGER NNAKLP_VW_BU0 FOR NNAKLP_VW
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


CREATE OR ALTER TRIGGER NNAKLP_VW_BU0 FOR NNAKLP_VW
ACTIVE BEFORE UPDATE POSITION 0
as
  declare variable tip_nnaklp_corr integer;
  declare variable tip_nnaklp integer;
  declare variable classid integer;
  declare variable tip_nnaklp_gtd integer;
  declare variable tip_nnaklp_nexoz integer;
  declare variable tip_nnaklp_usl_nerez integer;
begin
/*$$IBEC$$   select oid
    from get_oid_objects_pc('рхо онксвеммшу мюкнцнбшу мюйкюдмшу',-100)
    into :classid;
  select oid
    from get_oid_objects_pc('опхундмюъ мюкнцнбюъ',:classid)
    into :tip_nnaklp;
  select oid
    from get_oid_objects_pc('опхундмюъ йнппейрхпнбйю',:classid)
    into :tip_nnaklp_corr;
  select oid
    from get_oid_objects_pc('онксвеммюъ црд',:classid)
    into :tip_nnaklp_gtd;
  select oid
    from get_oid_objects_pc('онксвеммюъ меунгъиярбеммюъ деърекэмнярэ',:classid)
    into :tip_nnaklp_nexoz;
  select oid
    from get_oid_objects_pc('опхундмюъ мюкнцнбюъ мю сяксцх нр мепегхдемрю',:classid)
    into :tip_nnaklp_usl_nerez;
  if ((new.tip is null) or
   ((new.tip<>:tip_nnaklp) and
   (new.tip<>:tip_nnaklp_corr) and
   (new.tip<>:tip_nnaklp_gtd) and
   (new.tip<>:tip_nnaklp_usl_nerez) and
   (new.tip<>:tip_nnaklp_nexoz))) then begin
    new.tip=:tip_nnaklp;
  end $$IBEC$$*/
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
end
^


SET TERM ; ^


/* Privileges of triggers */
GRANT SELECT, UPDATE ON NAKLO TO TRIGGER NNAKLP_VW_BU0;
GRANT SELECT, UPDATE ON NAKLR TO TRIGGER NNAKLP_VW_BU0;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER NNAKLP_VW_BU0;
