SET TERM ^ ;



CREATE OR ALTER TRIGGER NNAKLP_VW_BI0 FOR NNAKLP_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


CREATE OR ALTER TRIGGER NNAKLP_VW_BI0 FOR NNAKLP_VW
ACTIVE BEFORE INSERT POSITION 0
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
  /*
  select oid
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
  if ((new.tip is null) or
   ((new.tip<>:tip_nnaklp) and
   (new.tip<>:tip_nnaklp_corr) and
   (new.tip<>:tip_nnaklp_gtd) and
   (new.tip<>:tip_nnaklp_nexoz))) then begin
    new.tip=:tip_nnaklp;
  end */
  /*if (new.tip is null) then begin*/
   /* select oid
      from GET_OID_OBJECTS_PC('рхо онксвеммшу мюкнцнбшу мюйкюдмшу',-100)
      into :classid;
    select oid
      from GET_OID_OBJECTS_PC('опхундмюъ мюкнцнбюъ',:classid)
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
end
^


SET TERM ; ^


/* Privileges of triggers */
GRANT INSERT ON NAKLO TO TRIGGER NNAKLP_VW_BI0;
GRANT INSERT ON NAKLR TO TRIGGER NNAKLP_VW_BI0;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER NNAKLP_VW_BI0;
