/*-------------------------------------------------------------------------*/
/* First procedures with empty bodies */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE MAKE_TRANSH_PROVODKI(
    TYPE1 INTEGER,
    ID1 INTEGER,
    TYPE2 INTEGER,
    ID2 INTEGER,
    WHAT_ID INTEGER,
    SUMA NUMERIC(15,2))
RETURNS (
    RESULT DOUBLE PRECISION)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE OPLATY_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
BEGIN
  EXIT;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE PEREVOD_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
BEGIN
  EXIT;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE PLATEGY_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
BEGIN
  EXIT;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE PROVODKI_CHECK_FINREZ_PC(
    ID_SCHET_IN INTEGER,
    DAT_FROM_IN TIMESTAMP,
    DAT_TO_IN TIMESTAMP,
    FIX INTEGER)
RETURNS (
    ID_PROV INTEGER,
    ID_SCHET INTEGER,
    DAT TIMESTAMP,
    ID_NAKL INTEGER,
    ATTR1 INTEGER,
    ATTR2 INTEGER,
    TIP INTEGER,
    REASON VARCHAR(50))
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE RASXOD_NAL_OSTATOK_RECOUNT_PC(
    ID_NAKL INTEGER)
AS
BEGIN
  EXIT;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE RASXOD_NAL_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
BEGIN
  EXIT;
END^

/*-------------------------------------------------------------------------*/

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Dropping old views */
/*-------------------------------------------------------------------------*/

DROP VIEW BANK_VW;

/*-------------------------------------------------------------------------*/
/* Creating new views */
/*-------------------------------------------------------------------------*/

CREATE VIEW BANK_VW(
    BANK_NAME,
    RASCH,
    MFO,
    ID_KLIENT,
    ID_CURRENCY,
    OID,
    DELMARKED,
    FULLNAME,
    IS_NAL,
    ID_MANAGER)
AS
select
    o.name,
    b.RASCH_IBAN,
    b.MFO,
    b.ID_KLIENT,
    b.id_currency,
    o.OID,
    o.DELMARKED,
    o.fullname,
    b.is_nal,
    b.id_manager
from BANK b inner join objects o
  on b.oid=o.oid
where o.classid=9066
/*ÁÀÍÊÎÂÑÊÈÅ Ñ×ÅÒÀ*/
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

CREATE TRIGGER BANK_VW_BD FOR BANK_VW
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER BANK_VW_BI FOR BANK_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER BANK_VW_BU FOR BANK_VW
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

ALTER TRIGGER BANK_VW_BD
as
begin
  delete from objects o where o.oid=old.oid;
  delete from bank b where b.oid=old.oid;
end^

ALTER TRIGGER BANK_VW_BI
AS
  declare variable classid integer;
begin
  if (NEW.oid is null) then begin
    NEW.oid = GEN_ID(oid_GEN,1);
  end
  select oid
    from GET_OID_OBJECTS_PC('ÁÀÍÊÎÂÑÊÈÅ Ñ×ÅÒÀ',-100)
    into :classid;
  insert into objects (
    oid,
    name,
    fullname,
    classid,
    delmarked)
  values (
    new.oid,
    new.bank_name,
    new.fullname,
    :classid,
    new.delmarked
  );    
  INSERT INTO BANK (
    BANK_NAME,
    RASCH_IBAN,
    MFO,
    ID_KLIENT,
    OID,
    id_currency,
    is_nal,
    id_manager)
  VALUES (
    NEW.BANK_NAME,
    NEW.RASCH,
    NEW.MFO,
    NEW.ID_KLIENT,
    NEW.OID,
    new.id_currency,
    new.is_nal,
    new.id_manager);

END^

ALTER TRIGGER BANK_VW_BU
AS
  declare variable classid integer;
BEGIN
  select oid
    from GET_OID_OBJECTS_PC('ÁÀÍÊÎÂÑÊÈÅ Ñ×ÅÒÀ',-100)
    into :classid;
  if (z(new.id_manager) <> z(old.id_manager)) then begin
    /*İêîíîìèñòû, Äèìà è ÿ ìîæåì ìåíÿòü îòâåòñâåííîãî çà ñ÷¸ò â áàíêå*/
    if ((current_role<>'POWER_USER') and (current_user<>'SYSDBA')) then begin
      execute procedure error('Çàïğåùåíî ìåíÿòü îòâåòñòâåííîãî çà ñ÷¸ò');
    end
  end
  UPDATE BANK
  SET 
      oid = new.oid,
      BANK_NAME = NEW.BANK_NAME,
      RASCH_IBAN = NEW.RASCH,
      MFO = NEW.MFO,
      is_nal= new.is_nal, 
      ID_KLIENT = NEW.ID_KLIENT,
      id_manager=new.id_manager
      /*$$IBEC$$ ,
      id_currency = new.id_currency $$IBEC$$*/
  WHERE (OID = OLD.OID);
  update objects o
  set
    o.oid=new.oid,
    o.name=new.bank_name,
    o.fullname=new.fullname,
    o.delmarked=new.delmarked
  where
    o.oid=old.oid and
    o.classid=:classid;
END^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring bodies of procedures */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE MAKE_TRANSH_PROVODKI(
    TYPE1 INTEGER,
    ID1 INTEGER,
    TYPE2 INTEGER,
    ID2 INTEGER,
    WHAT_ID INTEGER,
    SUMA NUMERIC(15,2))
RETURNS (
    RESULT DOUBLE PRECISION)
AS
declare variable tip_name_1 varchar(50);
declare variable tip_name_2 varchar(50);
declare variable id_schet integer;
declare variable ostatok2 double precision;
declare variable ostatok1 double precision;
declare variable dat date;
declare variable tip integer;
declare variable id_izg integer;
declare variable id_zak integer;
declare variable id_manager integer;
declare variable transh double precision;
declare variable id_bank integer;
declare variable id_currency_bank integer;
begin
  select name from get_name_objects_pc(:type1, -100) into :tip_name_1;
  select name from get_name_objects_pc(:type2, -100) into :tip_name_2;
  if ((tip_name_1='ĞÀÑÕÎÄ ÏÎ ÊÀÑÑÅ') and (tip_name_2='ĞÀÑÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ')) then begin
    if (what_id=1) then begin  
      select oid
        from GET_OID_OBJECTS_PC('ÒÈÏ Ñ×ÅÒÀ',-100)
        into :id_schet;
      select oid
        from GET_OID_OBJECTS_PC('ÍÀËÈ×ÍÛÅ ÄÎËÃÈ',:id_schet)
        into :id_schet;
  
      select r.debetafter-r.kreditafter,r.sub3
        from rep_ostatki_pc(:id_schet,current_timestamp,
          null, null,
          null,:ID2,
          null,null,
          null,null,
          null,null) r
        into :ostatok2,:id_manager;
      select kredit
        from provodki pr
        where pr.id_nakl=:id1
          and pr.id_schet=:id_schet
          and pr.sub4=:id1
        into ostatok1;
      if ((:ostatok1<0) and (ostatok2<0)) then begin
        transh=Round(maxnum(:ostatok1,:ostatok2),2);
      end else begin
        transh=Round(minnum(:ostatok1,:ostatok2),2);
      end
      select om.tip,om.id_izg,om.id_zak,
          om.dat, om.id_sklad
        from naklo om
        where om.id_nakl=:id1
        into :tip,:id_izg, :id_zak,
          :dat, :id_bank;
      select b.id_currency
        from bank_vw b
        where b.oid=:id_bank
        into :id_currency_bank;          
      if (transh>0 ) then begin
        insert into provodki (id_schet,dat,tip,
            kredit,id_nakl,
            sub1,sub2,sub3,sub4,sub5)
          values(:id_schet,:dat,:tip,
            :transh, :id1,
            :id_izg,:id_zak,:id_manager,:id2,:id_currency_bank);
        result = transh;
        execute procedure rasxod_nal_ostatok_recount_pc(:id1);
      end
      if (transh<0 ) then begin
        insert into provodki (id_schet,dat,tip,
            kredit,id_nakl,
            sub1,sub2,sub3,sub4,sub5)
          values(:id_schet,:dat,:tip,
            :transh, :id1,
            :id_izg,:id_zak,:id_manager,:id2,:id_currency_bank);
        result = transh;
        execute procedure rasxod_nal_ostatok_recount_pc(:id1);
      end
    end  /*if (what_id=1) then begin*/
  end

END
^

ALTER PROCEDURE OPLATY_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_manager integer;
  declare variable dat date;
  declare variable tip integer;
  declare variable id_schet_dolg integer;
  declare variable id_schet_tip integer;
  declare variable classid integer;
  declare variable nds numeric(15,4);
  declare variable posted integer;
  declare variable id_schet_dengi integer;
  declare variable id_bank integer;
  declare variable id_currency_bank integer;
  declare variable schet_name varchar(50);
  declare variable parent_id_nakl integer;
  declare variable id_izg_ukk integer;
  declare variable delmarked integer;
  declare variable id_xoz_oper_tip integer;
  declare variable id_xoz_oper integer;
  declare variable xoz_oper_name varchar(50);
  declare variable id_schet_post integer;
  declare variable id_schet_agent integer;
  declare variable id_agent integer;
  declare variable nds_from double precision;
  declare variable id_schet_dolg_usl integer;
  declare variable id_schet_finrez integer;
  declare variable id_project integer;
  declare variable id_statya_dr_tip integer;
  declare variable id_statya_dox integer;
  declare variable id_statya_ras integer;
  declare variable id_schet_post_usl integer;
  declare variable tip_transh integer;
  declare variable id_schet_dolg_finusl integer;
begin
  select om.tip,
      om.id_izg,om.id_zak,om.id_manager,
      om.nds,om.dat,om.posted,om.id_sklad,
      om.parent_id_nakl,om.delmarked,om.id_sklad_to,
      om.id_currency_to,om.nds_from
    from naklo om
    where om.id_nakl=:id_nakl and om.delmarked=0
    into :tip,
      :id_izg,:id_zak,:id_manager,
      :nds,:dat,:posted,:id_bank,:parent_id_nakl,:delmarked,:id_xoz_oper,
      :id_agent,:nds_from;
  if ((:posted = 1) and (id_schet is null)) then begin
    execute procedure oplaty_unpost_pc(:id_nakl);
  end
  select oid
    from GET_OID_OBJECTS_PC('ÎÏËÀÒÛ',-100)
    into :classid;
  if (tip<>classid) then begin
    execute procedure error('Íåëüçÿ ïğîâåñòè äğóãèå äîêóìåíòû êğîìå ïëàòåæåé');
  end
  if (delmarked<>0) then begin
    execute procedure error ('Íåëüçÿ ïğîâåñòè óäàë¸ííûé äîêóìåíò');
  end  
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ Ñ×ÅÒÀ',-100)
    into :id_schet_tip;
  if (id_schet is not null) then begin
    select name
      from get_name_objects_pc(:id_schet,:id_schet_tip)
      into schet_name;
  end    
  select oid
    from GET_OID_OBJECTS_PC('ÄÎËÃÈ ÇÀ ÊÀÁÅËÜ',:id_schet_tip)
    into :id_schet_dolg;
  select oid
    from GET_OID_OBJECTS_PC('ÄÎËÃÈ ÇÀ ÀĞÅÍÄÓ',:id_schet_tip)
    into :id_schet_dolg_usl;
  select oid
    from GET_OID_OBJECTS_PC('ÄÎËÃÈ ÇÀ ÔÈÍÓÑËÓÃÈ',:id_schet_tip)
    into :id_schet_dolg_finusl;    
  select oid
    from GET_OID_OBJECTS_PC('ÄÅÍÜÃÈ ÍÀ Ñ×ÅÒÀÕ',:id_schet_tip)
    into :id_schet_dengi;
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑ×¨ÒÛ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ',:id_schet_tip)
    into :id_schet_post;
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑ×¨ÒÛ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ ÓÑËÓÃ',:id_schet_tip)
    into :id_schet_post_usl;
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑ×ÅÒÛ Ñ ÀÃÅÍÒÀÌÈ',:id_schet_tip)
    into :id_schet_agent;
  select oid
    from GET_OID_OBJECTS_PC('ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ',:id_schet_tip)
    into :id_schet_finrez;
  select oid
    from GET_OID_OBJECTS_PC('ÕÎÇßÉÑÒÂÅÍÍÛÅ ÎÏÅĞÀÖÈÈ',-100)
    into :id_xoz_oper_tip;
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ ÏĞÎÅÊÒÛ',-100)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('ÔÈĞÌÀ',:id_project)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ ÑÒÀÒÜÈ ÄÎÕÎÄÎÂ È ĞÀÑÕÎÄÎÂ',-100)
    into :id_statya_dr_tip;
  select oid
    from GET_OID_OBJECTS_PC('ÄÎÕÎÄ ÎÒ ÊÎÌÈÑÑÈÉ ÀÃÅÍÒÀÌ',:id_statya_dr_tip)
    into :id_statya_dox;
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑÕÎÄ ÍÀ ÊÎÌÈÑÑÈÈ ÀÃÅÍÒÀÌ',:id_statya_dr_tip)
    into :id_statya_ras;

  if (:id_xoz_oper is not null) then begin
    select name
      from get_name_objects_pc(:id_xoz_oper, :id_xoz_oper_tip)
      into :xoz_oper_name;
  end else begin
    xoz_oper_name='ÎÏËÀÒÀ ÏÎÊÓÏÀÒÅËÅÌ ÒÎÂÀĞÎÂ';
  end        
  /*Óäàëåíèå ïğîâîäîê ïî äîêóìåíòó òîëüêî ïî îäíîìó ñ÷¸òó. Äëÿ ïåğåïğîâåäåíèÿ*/
  if (id_schet is not null) then begin
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.tip=:tip
        and pr.id_schet=:id_schet;
  end
  if (:parent_id_nakl is null and id_schet is null) then begin
    select v.id
      from vlad_vw v
      where v.isdefault=1
      into :id_izg_ukk;
    if (:id_izg =:id_izg_ukk) then begin
      parent_id_nakl=gen_id(naklras_id_gen,1);
      update naklo om
        set om.parent_id_nakl =:parent_id_nakl
        where om.id_nakl=:id_nakl;
    end
  end
  if (((id_schet is null) or (schet_name='ÄÎËÃÈ ÇÀ ÊÀÁÅËÜ'))
    and (xoz_oper_name='ÎÏËÀÒÀ ÏÎÊÓÏÀÒÅËÅÌ ÒÎÂÀĞÎÂ'))
  then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4)
      values(:id_schet_dolg,:dat,:classid,
        :nds,:id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl);
  end  /*if 'ÄÎËÃÈ ÇÀ ÊÀÁÅËÜ'*/
  select b.id_currency
    from bank_vw b
    where b.oid=:id_bank
    into :id_currency_bank; 

  if (((id_schet is null) or (schet_name='ÄÎËÃÈ ÇÀ ÀĞÅÍÄÓ'))
    and (xoz_oper_name='ÎÏËÀÒÀ ÏÎÊÓÏÀÒÅËÅÌ ÓÑËÓÃ'))
  then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_dolg_usl,:dat,:classid,
        :nds,:id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_bank);
  end  /*if 'ÄÎËÃÈ ÇÀ ÀĞÅÍÄÓ'*/
  
  if (((id_schet is null) or (schet_name='ÄÎËÃÈ ÇÀ ÔÈÍÓÑËÓÃÈ'))
    and (xoz_oper_name='ÎÏËÀÒÀ ÏÎÊÓÏÀÒÅËÅÌ ÔÈÍÓÑËÓÃ'))
  then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_dolg_finusl,:dat,:classid,
        :nds,:id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_bank);
  end  /*if 'ÄÎËÃÈ ÇÀ ÔÈÍÓÑËÓÃÈ'*/

  if (((id_schet is null) or (schet_name='ĞÀÑ×¨ÒÛ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ'))
    and (xoz_oper_name='ÂÎÇÂĞÀÒ ÎÒ ÏÎÑÒÀÂÙÈÊÀ'))
  then begin
    /*Ñòàğûå òğàíøè ïğè ïåğåïğîâåäåíèè óäàëÿşòñÿ*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip in (1,3);
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip in (1,3);
    insert into provodki (id_schet,dat,tip,
      debet,id_nakl,
      sub1,sub2,sub3,sub4,sub5)
    values(:id_schet_post,:dat,:tip,
      (-1*:nds), :id_nakl,
      :id_zak,:id_izg,:id_manager,:id_nakl,:id_currency_bank);
    execute procedure naklo_auto_spend_pc(:id_schet_post,:id_nakl,:dat, :id_zak,:id_izg, :id_currency_bank, 3);
  end

  if (((id_schet is null) or (schet_name='ĞÀÑ×¨ÒÛ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ ÓÑËÓÃ'))
    and (xoz_oper_name='ÂÎÇÂĞÀÒ ÎÒ ÏÎÑÒÀÂÙÈÊÀ ÓÑËÓÃ'))
  then begin
    select oid
      from get_oid_objects_pc('ÕÎÇßÉÑÒÂÅÍÍÛÅ ÎÏÅĞÀÖÈÈ',-100)
      into :tip_transh;
    select oid
      from get_oid_objects_pc('ÒĞÀÍØ Â ĞÀÑ×ÅÒÀÕ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ ÓÑËÓÃ ÂÎÇÂĞÀÒ',:tip_transh)
      into :tip_transh;
    /*Ñòàğûå òğàíøè ïğè ïåğåïğîâåäåíèè óäàëÿşòñÿ*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip=:tip_transh;
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=:tip_transh;
    insert into provodki (id_schet,dat,tip,
      debet,id_nakl,
      sub1,sub2,sub3,sub4,sub5)
    values(:id_schet_post_usl,:dat,:tip,
      (-1*:nds), :id_nakl,
      :id_zak,:id_izg,:id_manager,:id_nakl,:id_currency_bank);
  end
  
  if (((id_schet is null) or (schet_name='ĞÀÑ×ÅÒÛ Ñ ÀÃÅÍÒÀÌÈ'))
    and (xoz_oper_name='ÎÏËÀÒÀ ÎÒ ÀÃÅÍÒÀ'))
  then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2)
      values(:id_schet_agent,:dat,:classid,
        :nds,:id_nakl,
        :id_agent,:id_currency_bank);
    /*êîìèññèÿ, êàê óìåíüøåíèå äîëãà àãåíòà*/
    if (:nds_from>0) then begin
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2)
        values(:id_schet_agent,:dat,:tip,
          Round(:nds_from,2),:id_nakl,
          :id_agent,:id_currency_bank);
    end else begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2)
        values(:id_schet_agent,:dat,:tip,
          Round(-:nds_from,2),:id_nakl,
          :id_agent,:id_currency_bank);    
    end        
  end  /*if 'ĞÀÑ×ÅÒÛ Ñ ÀÃÅÍÒÀÌÈ'*/
    
  if ((id_schet is null) or (schet_name='ÄÅÍÜÃÈ ÍÀ Ñ×ÅÒÀÕ')) then begin
    if ((id_bank is not null and id_bank<>0) and (:dat>='31.05.07')) then begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3)
        values(:id_schet_dengi,:dat,:classid,
          Round(:nds,2),:id_nakl,
          :id_izg,:id_bank,:id_currency_bank);
    end /*if (id_bank is not null)*/
  end /*if 'ÄÅÍÜÃÈ ÍÀ Ñ×ÅÒÀÕ'*/

  if (((id_schet is null) or (schet_name='ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ'))
    and (xoz_oper_name='ÎÏËÀÒÀ ÎÒ ÀÃÅÍÒÀ'))
  then begin
    /*êîìèññèÿ, êàê óìåíüøåíèå äîëãà àãåíòà*/
    if (:nds_from>0) then begin
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(:nds_from,2),:id_nakl,
          :id_project,:id_statya_ras,:id_currency_bank,:id_izg,:id_zak,:id_manager);
    end else begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(-:nds_from,2),:id_nakl,
          :id_project,:id_statya_dox,:id_currency_bank,:id_izg,:id_zak,:id_manager);
    end        
  end  /*if 'ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ'*/

  update naklo om
    set om.posted =1
    where om.id_nakl=:id_nakl and om.posted=0;

end
^

ALTER PROCEDURE PEREVOD_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
declare variable schet_name varchar(50);
  declare variable name varchar(50);
  declare variable id_schet_tip integer;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable dat date;
  declare variable tip integer;
  declare variable nds double precision;
  declare variable kurs double precision;
  declare variable posted integer;
  declare variable sError varchar(100);
  declare variable id_currency_bank_to integer;
  declare variable id_currency_bank_from integer;
  declare variable id_bank_to integer;
  declare variable id_bank_from integer;
  declare variable id_schet_dengi integer;
  declare variable nds_from double precision;
  declare variable delmarked integer;
  declare variable kurs_indirect integer;
  declare variable kurs_fact double precision;
  declare variable id_schet_finrez integer;
  declare variable id_project integer;
  declare variable id_statya_dr_tip integer;
  declare variable id_statya_dox integer;
  declare variable id_statya_ras integer;
  declare variable id_manager integer;
begin
  select om.tip,om.id_izg,om.id_zak,
      om.nds,om.dat,om.kurs,
      om.id_sklad,
      om.posted,om.nds_from,om.id_sklad_to,delmarked,
      om.kurs_indirect,
      om.id_manager
    from naklo om
    where om.id_nakl=:id_nakl
    into :tip,:id_izg, :id_zak,
      :nds,:dat,:kurs,
      :id_bank_from,
      :posted,:nds_from,:id_bank_to,:delmarked,
      :kurs_indirect,
      :id_manager;
    select b.id_currency
      from bank_vw b
      where b.oid=:id_bank_to
      into :id_currency_bank_to;
    select b.id_currency
      from bank_vw b
      where b.oid=:id_bank_from
      into :id_currency_bank_from;
  if (id_schet is null) then begin

    update naklo om
      set om.id_currency_to=:id_currency_bank_to
      where om.id_nakl=:id_nakl and
        om.id_currency_to<>:id_currency_bank_to;

    update naklo om
      set om.id_currency=:id_currency_bank_from
      where om.id_nakl=:id_nakl and
        om.id_currency<>:id_currency_bank_from;
    /*Ïğè ïîëíîé ïğîâîäêå ïğîâåğèòü ïğàâèëüíîñòü ğàñ÷¸òà êóğñîâ*/
    if (z(id_currency_bank_from)=z(id_currency_bank_to)) then begin
      if (z(nds_from)<>z(nds)) then begin
        update naklo om
          set om.nds=om.nds_from
          where om.id_nakl=:id_nakl;
        nds=nds_from;
      end
      if (kurs<>1) then begin
        update naklo om
          set om.kurs=1
          where om.id_nakl=:id_nakl;
        kurs=1;
      end
    end else begin
      if (kurs_indirect=0) then begin
        kurs_fact=dzero(nds,nds_from, 0);
      end else begin
        kurs_fact=dzero(nds_from,nds, 0);    
      end
      if (kurs_fact<>kurs) then begin
        update naklo om
          set om.kurs=:kurs_fact
          where om.id_nakl=:id_nakl;
        kurs=kurs_fact;
      end
      /*
      nds_fact=Round(nds_from*Round(kurs_fact,4),2);
      if (nds_fact<>nds) then begin
        update naklo om
          set om.nds=:nds_fact
          where om.id_nakl=:id_nakl;
        nds=nds_fact;
      end
      */
    end /* if (z(id_currency)=z(id_currency_to))*/
  end /*if (id_schet is null)*/
  /*Ïğîâåğêè*/
  if (id_schet =0 ) then begin
    id_schet = null;
  end   
  select name from get_name_objects_pc(:tip,-100) into :name;
  if (name<>'ÏÅĞÅÂÎÄ ÑĞÅÄÑÒÂ') then begin
    execute procedure error('Íåëüçÿ ïğîâåñòè íå ïåğåâîä');
  end  

  if ((posted<>0) and (id_schet is null)) then begin
    execute procedure error ('Íåëüçÿ ïğîâåñòè óæå ïğîâåäåííûé äîêóìåíò');
  end      
  if ((posted=0) and (id_schet is not null)) then begin
    sError = 'Íåëüçÿ ÷àñòè÷íî ïğîâåñòè íå ïğîâåäåííûé äîêóìåíò' || coalesce(:id_schet,999);
    execute procedure error (sError);
  end  
  if (delmarked<>0) then begin
    execute procedure error ('Íåëüçÿ ïğîâåñòè óäàë¸ííûé äîêóìåíò');
  end    
  /*èäåíòèôèêàòîğû îáúåêòîâ*/
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ Ñ×ÅÒÀ',-100)
    into :id_schet_tip;
  select oid
    from GET_OID_OBJECTS_PC('ÄÅÍÜÃÈ ÍÀ Ñ×ÅÒÀÕ',:id_schet_tip)
    into :id_schet_dengi;
  select oid
    from GET_OID_OBJECTS_PC('ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ',:id_schet_tip)
    into :id_schet_finrez;
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ ÏĞÎÅÊÒÛ',-100)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('ÔÈĞÌÀ',:id_project)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ ÑÒÀÒÜÈ ÄÎÕÎÄÎÂ È ĞÀÑÕÎÄÎÂ',-100)
    into :id_statya_dr_tip;
  select oid
    from GET_OID_OBJECTS_PC('ÄÎÕÎÄ ÎÒ ÏĞÎÄÀÆÈ ÂÀËŞÒÛ',:id_statya_dr_tip)
    into :id_statya_dox;
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑÕÎÄ ÍÀ ÏÎÊÓÏÊÓ ÂÀËŞÒÛ',:id_statya_dr_tip)
    into :id_statya_ras;
     
  if (id_schet is not null) then begin
    select name
      from get_name_objects_pc(:id_schet,:id_schet_tip)
      into schet_name;
  end
  /*Óäàëåíèå ïğîâîäîê ïî äîêóìåíòó òîëüêî ïî îäíîìó ñ÷¸òó. Äëÿ ïåğåïğîâåäåíèÿ*/
  if (id_schet is not null) then begin
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.tip=:tip
        and pr.id_schet=:id_schet;
  end
  
  if ((id_schet is null) or (schet_name='ÄÅÍÜÃÈ ÍÀ Ñ×ÅÒÀÕ') ) then begin
    if (id_bank_to is not null) then begin

      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3)
        values(:id_schet_dengi,:dat,:tip,
          Round(:nds,2),:id_nakl,
          :id_zak,:id_bank_to,:id_currency_bank_to);
    end /*if (id_bank is not null)*/
    if (id_bank_from is not null) then begin
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3)
        values(:id_schet_dengi,:dat,:tip,
          Round(:nds_from,2),:id_nakl,
          :id_izg,:id_bank_from,:id_currency_bank_from);
    end /*if (id_bank is not null)*/    
  end /*if 'ÄÅÍÜÃÈ ÍÀ Ñ×ÅÒÀÕ'*/

  if ((id_schet is null) or (schet_name='ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ')) then begin
    if (id_currency_bank_from<>id_currency_bank_to) then begin
      /*êîìèññèÿ, êàê óìåíüøåíèå äîëãà àãåíòà*/
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(:nds,2),:id_nakl,
          :id_project,:id_statya_dox,:id_currency_bank_to,:id_izg,:id_zak,:id_manager);
  
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(:nds_from,2),:id_nakl,
          :id_project,:id_statya_dox,:id_currency_bank_from,:id_izg,:id_zak,:id_manager);
    end
  end  /*if 'ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ'*/
    
  update naklo om
    set om.posted=1
    where om.posted=0 and
      om.delmarked=0 and
      om.id_nakl=:id_nakl;
end
^

ALTER PROCEDURE PLATEGY_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
declare variable schet_name varchar(50);
  declare variable dat_transh date;
  declare variable dat_report date;
  declare variable id_manager_nakl integer;
  declare variable transh double precision;
  declare variable id_transh integer;
  declare variable id_nakl_nakl integer;
  declare variable name varchar(50);
  declare variable id_schet_tip integer;
  declare variable id_schet_post integer;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_manager integer;
  declare variable dat date;
  declare variable tip integer;
  declare variable nds double precision;
  declare variable id_currency integer;
  declare variable posted integer;
  declare variable sError varchar(100);
  declare variable dat_opl date;
  declare variable nds_neopl double precision;
  declare variable id_bank integer;
  declare variable id_currency_bank integer;
  declare variable id_schet_dengi integer;
  declare variable nds_from double precision;
  declare variable delmarked integer;
  declare variable id_xoz_oper integer;
  declare variable id_xoz_oper_tip integer;
  declare variable xoz_oper_name varchar(50);
  declare variable id_schet_dolg integer;
  declare variable id_agent integer;
  declare variable id_schet_agent integer;
  declare variable id_schet_post_uslug integer;
  declare variable tip_transh integer;
  declare variable id_schet_finrez integer;
  declare variable id_project integer;
  declare variable id_statya_dr_tip integer;
  declare variable id_statya_dox integer;
  declare variable id_statya_ras integer;
  declare variable tip_transh_vovz_pok_usl integer;
  declare variable tip_transh_vovz_pok_arend integer;
  declare variable id_schet_dolg_usl integer;
  declare variable id_schet_dolg_arenda integer;
begin
  select om.tip,om.id_izg,om.id_zak,om.id_manager,
      om.nds,om.dat,
      om.id_currency,om.id_sklad,
      om.posted,om.nds_from,
      om.delmarked,om.id_sklad_to,
      om.id_currency_to
    from naklo om
    where om.id_nakl=:id_nakl
    into :tip,:id_izg, :id_zak,:id_manager,
      :nds,:dat,
      :id_currency,:id_bank,
      :posted,:nds_from,
      :delmarked,:id_xoz_oper,
      :id_agent;
  /*Ïğîâåğêè*/
  if (id_schet =0 ) then begin
    id_schet = null;
  end   
  select name from get_name_objects_pc(:tip,-100) into :name;
  if (name<>'ÎÏËÀÒÛ ÈÑÕÎÄßÙÈÅ') then begin
    execute procedure error('Íåëüçÿ ïğîâåñòè íå èñõîäÿùèé ïëàò¸æ');
  end  

  if ((posted<>0) and (id_schet is null)) then begin
    execute procedure error ('Íåëüçÿ ïğîâåñòè óæå ïğîâåäåííûé äîêóìåíò');
  end      
  if ((posted=0) and (id_schet is not null)) then begin
    sError = 'Íåëüçÿ ÷àñòè÷íî ïğîâåñòè íå ïğîâåäåííûé äîêóìåíò' || coalesce(:id_schet,999);
    execute procedure error (sError);
  end
  if (delmarked<>0) then begin
    execute procedure error ('Íåëüçÿ ïğîâåñòè óäàë¸ííûé äîêóìåíò');
  end
  if (nds<0 ) then begin
    execute procedure error('Íåëüçÿ ïğîâåñòè îòğèöàòåëüíóş ñóììó. Èñïîëüçóéòå âîçâğàòû.');
  end
  /*èäåíòèôèêàòîğû îáúåêòîâ*/
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ Ñ×ÅÒÀ',-100)
    into :id_schet_tip;
  select oid
    from GET_OID_OBJECTS_PC('ÕÎÇßÉÑÒÂÅÍÍÛÅ ÎÏÅĞÀÖÈÈ',-100)
    into :id_xoz_oper_tip;
  if (z(:id_xoz_oper)<>0) then begin
    select name
      from get_name_objects_pc(:id_xoz_oper, :id_xoz_oper_tip)
      into :xoz_oper_name;
  end else begin
    xoz_oper_name='ÎÏËÀÒÀ ÏÎÑÒÀÂÙÈÊÀÌ ÒÎÂÀĞÎÂ';
  end
  if (id_schet is not null) then begin
    select name
      from get_name_objects_pc(:id_schet,:id_schet_tip)
      into schet_name;
  end
    
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑ×¨ÒÛ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ',:id_schet_tip)
    into :id_schet_post;
  select oid
    from GET_OID_OBJECTS_PC('ÄÎËÃÈ ÇÀ ÊÀÁÅËÜ',:id_schet_tip)
    into :id_schet_dolg;
  select oid
    from GET_OID_OBJECTS_PC('ÄÎËÃÈ ÇÀ ÔÈÍÓÑËÓÃÈ',:id_schet_tip)
    into :id_schet_dolg_usl;
  select oid
    from GET_OID_OBJECTS_PC('ÄÎËÃÈ ÇÀ ÀĞÅÍÄÓ',:id_schet_tip)
    into :id_schet_dolg_arenda;
  select oid
    from GET_OID_OBJECTS_PC('ÄÅÍÜÃÈ ÍÀ Ñ×ÅÒÀÕ',:id_schet_tip)
    into :id_schet_dengi;
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑ×ÅÒÛ Ñ ÀÃÅÍÒÀÌÈ',:id_schet_tip)
    into :id_schet_agent;
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑ×¨ÒÛ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ ÓÑËÓÃ',:id_schet_tip)
    into :id_schet_post_uslug;          
  select oid
    from GET_OID_OBJECTS_PC('ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ',:id_schet_tip)
    into :id_schet_finrez;
  select oid
    from GET_OID_OBJECTS_PC('ÕÎÇßÉÑÒÂÅÍÍÛÅ ÎÏÅĞÀÖÈÈ',-100)
    into :id_xoz_oper_tip;
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ ÏĞÎÅÊÒÛ',-100)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('ÔÈĞÌÀ',:id_project)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ ÑÒÀÒÜÈ ÄÎÕÎÄÎÂ È ĞÀÑÕÎÄÎÂ',-100)
    into :id_statya_dr_tip;
  select oid
    from GET_OID_OBJECTS_PC('ÄÎÕÎÄ ÎÒ ÊÎÌÈÑÑÈÉ ÀÃÅÍÒÀÌ',:id_statya_dr_tip)
    into :id_statya_dox;
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑÕÎÄ ÍÀ ÊÎÌÈÑÑÈÈ ÀÃÅÍÒÀÌ',:id_statya_dr_tip)
    into :id_statya_ras;
  select oid
    from GET_OID_OBJECTS_PC('ÒĞÀÍØ Â ÄÎËÃÀÕ ÇÀ ÔÈÍÓÑËÓÃÈ ÂÎÇÂĞÀÒ',:id_xoz_oper_tip)
    into :tip_transh_vovz_pok_usl;
  select oid
    from GET_OID_OBJECTS_PC('ÒĞÀÍØ Â ÄÎËÃÀÕ ÇÀ ÓÑËÓÃÈ ÂÎÇÂĞÀÒ',:id_xoz_oper_tip)
    into :tip_transh_vovz_pok_arend;
    
    
  /*Óäàëåíèå ïğîâîäîê ïî äîêóìåíòó òîëüêî ïî îäíîìó ñ÷¸òó. Äëÿ ïåğåïğîâåäåíèÿ*/
  if (id_schet is not null) then begin
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.tip=:tip
        and pr.id_schet=:id_schet;
  end
  dat_report=:dat; 
  /*ïğîâîäêè*/
  if (((id_schet is null) or (schet_name='ĞÀÑ×¨ÒÛ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ'))
    and (xoz_oper_name='ÎÏËÀÒÀ ÏÎÑÒÀÂÙÈÊÀÌ ÒÎÂÀĞÎÂ'))
  then begin
    /*Ñòàğûå òğàíøè ïğè ïåğåïğîâåäåíèè óäàëÿşòñÿ*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip=1;    
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=1;
      
    
    if (nds>=0) then begin
      /*Íîğìàëüíûå ïëàòåæè, ò.å. ïîëîæèòåëüíûå*/
      insert into provodki (id_schet,dat,tip,
        debet,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_post,:dat,:tip,
        :nds, :id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency);
      execute procedure oplaty_auto_spend_pc(:id_schet_post,:id_nakl,:dat, :id_izg, :id_zak, :id_currency, 1,1);
      
    end else begin /*if (nds>=0)*/
/*Îòğèöàòåëüíûå ïëàòåæè, ò.å. âîçâğàòû*/

      insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_post,:dat,:tip,
        :nds*(-1), :id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency);
      if (dat_report<current_timestamp ) then begin
        dat_report=current_timestamp;
      end
      for
        select om.dat,om.id_manager,
            r.sub4,sum(r.debetafter)-sum(r.kreditafter)
        from rep_ostatki_pc(:id_schet_post,:dat_report,
          :id_izg,:id_zak,
          null,null,
          :id_currency,null,
          null,null,
          null,null) r inner join naklo om
          on om.id_nakl=r.sub4
        where r.debetafter>0
        group by sub4,om.dat,om.id_izg,om.id_zak,om.id_manager
        order by om.dat
        into :dat_opl,
          :id_manager_nakl,:id_nakl_nakl,:transh
      do begin
        select sum(r.kreditafter)-sum(r.debetafter)
        from rep_ostatki_pc(:id_schet_post,:dat_report,
          :id_izg,:id_zak,
          :id_manager,:id_nakl,
          :id_currency, null,
          null,null,
          null,null) r 
        into :nds_neopl;
        if (nds_neopl<=0) then begin
          leave;
        end
        dat_transh=:dat;
        if (dat_transh<:dat_opl) then begin
          dat_transh=:dat_opl;
        end
        id_transh=gen_id(OPLNAKL_GEN, 1);
        insert into oplnakl  (id_from,id_to,transh,
            opl_data,id_manager,tip,id, id_currency)
          values (:id_nakl_nakl,:id_nakl,minnum(:transh,:nds_neopl),
            :dat_transh,:id_manager_nakl,1,:id_transh, :id_currency);
        execute procedure oplnakl_post_pc(:id_transh);
      end /*for naklo*/
    end /*if (nds>=0)*/
  end /*if schet*/
  if (((id_schet is null) or (schet_name='ÄÎËÃÈ ÇÀ ÊÀÁÅËÜ'))
    and (xoz_oper_name='ÂÎÇÂĞÀÒ ÏÎÊÓÏÀÒÅËŞ'))
  then begin
    /*Ñòàğûå òğàíøè ïğè ïåğåïğîâåäåíèè óäàëÿşòñÿ*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip=2;    
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=2;  
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4)
      values(:id_schet_dolg,:dat,:tip,
        (-1*:nds),:id_nakl,
        :id_zak,:id_izg,:id_manager,:id_nakl);
    execute procedure oplaty_auto_spend_pc(:id_schet_dolg, :id_nakl, :dat,
      :id_zak, :id_izg, :id_currency, 2, 1);
  end

  select b.id_currency
    from bank_vw b
    where b.oid=:id_bank
    into :id_currency_bank;

  if (((id_schet is null) or (schet_name='ÄÎËÃÈ ÇÀ ÀĞÅÍÄÓ'))
    and (xoz_oper_name='ÂÎÇÂĞÀÒ ÏÎÊÓÏÀÒÅËŞ ÀĞÅÍÄÛ'))
  then begin

    /*Ñòàğûå òğàíøè ïğè ïåğåïğîâåäåíèè óäàëÿşòñÿ*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip=:tip_transh_vovz_pok_arend;
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=:tip_transh_vovz_pok_arend;
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_dolg_arenda,:dat,:tip,
        (-1*:nds),:id_nakl,
        :id_zak,:id_izg,:id_manager,:id_nakl,:id_currency_bank);
    execute procedure oplaty_auto_spend_pc(:id_schet_dolg_arenda, :id_nakl, :dat,
      :id_zak, :id_izg, :id_currency, :tip_transh_vovz_pok_arend, 1);
  end

  if (((id_schet is null) or (schet_name='ÄÎËÃÈ ÇÀ ÔÈÍÓÑËÓÃÈ'))
    and (xoz_oper_name='ÂÎÇÂĞÀÒ ÏÎÊÓÏÀÒÅËŞ ÓÑËÓÃ'))
  then begin

    /*Ñòàğûå òğàíøè ïğè ïåğåïğîâåäåíèè óäàëÿşòñÿ*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip=:tip_transh_vovz_pok_usl;
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=:tip_transh_vovz_pok_usl;
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_dolg_usl,:dat,:tip,
        (-1*:nds),:id_nakl,
        :id_zak,:id_izg,:id_manager,:id_nakl,:id_currency_bank);
    execute procedure oplaty_auto_spend_pc(:id_schet_dolg_usl,:id_nakl, :dat,
      :id_zak,:id_izg, :id_currency, :tip_transh_vovz_pok_usl, 1);
  end  

  if (((id_schet is null) or (schet_name='ĞÀÑ×ÅÒÛ Ñ ÀÃÅÍÒÀÌÈ'))
    and (xoz_oper_name='ÎÏËÀÒÀ ÀÃÅÍÒÓ'))
  then begin
    insert into provodki (id_schet,dat,tip,
        debet,id_nakl,
        sub1,sub2)
      values(:id_schet_agent,:dat,:tip,
        :nds,:id_nakl,
        :id_agent,:id_currency_bank);
    /*êîìèññèÿ, êàê óâåëè÷åíèå äîëãà àãåíòà*/
    if (:nds_from>0) then begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2)
        values(:id_schet_agent,:dat,:tip,
          Round(:nds_from,2),:id_nakl,
          :id_agent,:id_currency_bank);
    end else begin
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2)
        values(:id_schet_agent,:dat,:tip,
          Round(-:nds_from,2),:id_nakl,
          :id_agent,:id_currency_bank);    
    end
  end  /*if 'ĞÀÑ×ÅÒÛ Ñ ÀÃÅÍÒÀÌÈ'*/
  
  if (((id_schet is null) or (schet_name='ĞÀÑ×¨ÒÛ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ ÓÑËÓÃ'))
    and (xoz_oper_name='ÎÏËÀÒÀ ÏÎÑÒÀÂÙÈÊÀÌ ÓÑËÓÃ'))
  then begin
    /* -65='ÒĞÀÍØ Â ĞÀÑ×ÅÒÀÕ Ñ ÏÎÑÒÀÙÈÊÀÌÈ ÓÑËÓÃ' */
    select oid
      from get_oid_objects_pc('ÒĞÀÍØ Â ĞÀÑ×ÅÒÀÕ Ñ ÏÎÑÒÀÙÈÊÀÌÈ ÓÑËÓÃ',:id_xoz_oper_tip)
      into :tip_transh;
    /*Ñòàğûå òğàíøè ïğè ïåğåïğîâåäåíèè óäàëÿşòñÿ*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip=:tip_transh;
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=:tip_transh;
    insert into provodki (id_schet,dat,tip,
      debet,id_nakl,
      sub1,sub2,sub3,sub4,sub5)
    values(:id_schet_post_uslug,:dat,:tip,
      :nds, :id_nakl,
      :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency);
    
    execute procedure oplaty_auto_spend_pc(:id_schet_post_uslug, :id_nakl,
      :dat, :id_izg,:id_zak, :id_currency, :tip_transh, 1);
  end  /*if 'ĞÀÑ×¨ÒÛ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ ÓÑËÓÃ'*/
        
  if ((id_schet is null) or (schet_name='ÄÅÍÜÃÈ ÍÀ Ñ×ÅÒÀÕ')) then begin
    if ((id_bank is not null) and (:dat>='31.05.07')) then begin
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3)
        values(:id_schet_dengi,:dat,:tip,
          Round(:nds,2),:id_nakl,
          :id_zak,:id_bank,:id_currency_bank);
    end /*if (id_bank is not null)*/
  end /*if 'ÄÅÍÜÃÈ ÍÀ Ñ×ÅÒÀÕ'*/

  if (((id_schet is null) or (schet_name='ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ'))
    and (xoz_oper_name='ÎÏËÀÒÀ ÀÃÅÍÒÓ'))
  then begin
    /*êîìèññèÿ, êàê óìåíüøåíèå äîëãà àãåíòà*/
    if (:nds_from>0) then begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(:nds_from,2),:id_nakl,
          :id_project,:id_statya_dox,:id_currency_bank,:id_zak,:id_izg,:id_manager);
    end else begin
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(-:nds_from,2),:id_nakl,
          :id_project,:id_statya_ras,:id_currency_bank,:id_zak,:id_izg,:id_manager);
    end        
  end  /*if 'ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ'*/
    
  update naklo om
    set om.posted=1
    where om.posted=0 and
      om.delmarked=0 and
      om.id_nakl=:id_nakl;
end
^

ALTER PROCEDURE PROVODKI_CHECK_FINREZ_PC(
    ID_SCHET_IN INTEGER,
    DAT_FROM_IN TIMESTAMP,
    DAT_TO_IN TIMESTAMP,
    FIX INTEGER)
RETURNS (
    ID_PROV INTEGER,
    ID_SCHET INTEGER,
    DAT TIMESTAMP,
    ID_NAKL INTEGER,
    ATTR1 INTEGER,
    ATTR2 INTEGER,
    TIP INTEGER,
    REASON VARCHAR(50))
AS
declare variable id_schet_tip integer;
  declare variable tip_rasxod_po_kasse integer;
  declare variable id_xoz_oper_zabyt integer;
  declare variable id_xoz_oper_tip integer;
  declare variable id_xoz_oper_minus integer;
  declare variable tip_naklru integer;
  declare variable tip_naklpu integer;
  declare variable tip_naklo integer;
  declare variable id_xoz_oper_otk integer;
  declare variable tip_oplaty integer;
  declare variable id_xoz_oper_opl_agent integer;
  declare variable tip_plategy integer;
  declare variable id_xoz_oper_plat_agent integer;
  declare variable tip_perevod integer;
  declare variable id_xoz_oper_naklru_bux integer;
  declare variable id_bank_from integer;
  declare variable id_bank_to integer;
  declare variable id_currency_bank_from integer;
  declare variable id_currency_bank_to integer;
  declare variable tip_nedostach integer;
  declare variable tip_sklad integer;
  declare variable tip_izlishek integer;
  declare variable tip_naklp integer;
  declare variable tip_naklpbux integer;
  declare variable tip_vozvrat integer;
begin
  if (fix is null) then begin
    fix=0;/*íå èñïğàâëÿòü*/
  end
  if (dat_from_in is null) then begin
    /*Íà÷àëî ïğåäûäóùåãî ìåñÿöà*/
    dat_from_in =firstdaymonth(incdate(current_timestamp,0,-1,0));
  end
  if (dat_to_in is null) then begin
    /*Êîíåö òåêóùåãî ìåñÿöà*/
    dat_to_in=lastdaymonth(current_timestamp);
  end
  select oid from GET_OID_OBJECTS_PC('ÒÈÏ Ñ×ÅÒÀ',-100) into :id_schet_tip;  
  select oid from GET_OID_OBJECTS_PC('ĞÀÑÕÎÄ ÏÎ ÊÀÑÑÅ',-100) into :tip_rasxod_po_kasse;
  select oid from get_oid_objects_pc('ÕÎÇßÉÑÒÂÅÍÍÛÅ ÎÏÅĞÀÖÈÈ',-100) into :id_xoz_oper_tip;
  select oid from get_oid_objects_pc('ĞÀÑÕÎÄ ÏÎ ÊÀÑÑÅ ÇÀÁÛÒÛÉ',
    :id_xoz_oper_tip) into :id_xoz_oper_zabyt;
  select oid from get_oid_objects_pc('ĞÀÑÕÎÄ ÏÎ ÊÀÑÑÅ ÌÈÍÓÑÎÂÎÉ ÊÀÊ ÓÁÛÒÎÊ ÔÈĞÌÛ',
    :id_xoz_oper_tip) into :id_xoz_oper_minus;
  select oid from get_oid_objects_pc('ĞÀÑÕÎÄ ÏÎ ÊÀÑÑÅ ÎÁÛ×ÍÛÉ',
    :id_xoz_oper_tip) into :id_xoz_oper_otk;
  select oid from get_oid_objects_pc('ÎÏËÀÒÀ ÎÒ ÀÃÅÍÒÀ',
    :id_xoz_oper_tip) into :id_xoz_oper_opl_agent;
  select oid from get_oid_objects_pc('ÎÏËÀÒÀ ÀÃÅÍÒÓ',
    :id_xoz_oper_tip) into :id_xoz_oper_plat_agent;
  select oid
    from get_oid_objects_pc('ĞÀÑÕÎÄÍÀß ÍÀ ÓÑËÓÃÈ Ñ ÊÎÌÈÑÑÈÅÉ',:id_xoz_oper_tip)
    into :id_xoz_oper_naklru_bux;
  select oid from GET_OID_OBJECTS_PC('ĞÀÑÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ ÍÀ ÓÑËÓÃÈ',-100) into :tip_naklru;
  select oid from GET_OID_OBJECTS_PC('ÏĞÈÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ ÍÀ ÓÑËÓÃÈ',-100) into :tip_naklpu;
  select oid from GET_OID_OBJECTS_PC('ÒÈÏ ÍÀÊËÀÄÍÛÕ ÄËß ÑÊËÀÄÀ',-100) into :tip_sklad;
  select oid from GET_OID_OBJECTS_PC('Îòãğóçêà',:tip_sklad) into :tip_naklo;
  select oid from GET_OID_OBJECTS_PC('Íåäîñòà÷à',:tip_sklad) into :tip_nedostach;
  select oid from GET_OID_OBJECTS_PC('Èçëèøåê',:tip_sklad) into :tip_izlishek;
  select oid from GET_OID_OBJECTS_PC('ÎÏËÀÒÛ',-100) into :tip_oplaty;
  select oid from GET_OID_OBJECTS_PC('ÎÏËÀÒÛ ÈÑÕÎÄßÙÈÅ',-100) into :tip_plategy;
  select oid from GET_OID_OBJECTS_PC('ÏÅĞÅÂÎÄ ÑĞÅÄÑÒÂ',-100) into :tip_perevod;
  select oid from GET_OID_OBJECTS_PC('ÂÎÇÂĞÀÒ',-100) into :tip_vozvrat;
  tip_naklp=1;
  select oid from GET_OID_OBJECTS_PC('ÏĞÈÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ',-100) into :tip_naklpbux;



  if (id_schet_in is null ) then begin
    select oid from GET_OID_OBJECTS_PC('ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ',:id_schet_tip) into :id_schet_in;
  end

  /*provodki orphans*/
  for
    select om.id_nakl, om.dat, om.tip
    from naklo om left join provodki pr
      on om.id_nakl=pr.id_nakl and pr.id_schet = :id_schet_in
    where om.posted=1
      and om.dat between :dat_from_in and :dat_to_in
      and om.tip=/*$$IBEC$$ 9050 $$IBEC$$*/:tip_rasxod_po_kasse
      and om.delmarked=0
      and om.id_sklad_to=:id_xoz_oper_zabyt
      and pr.id_nakl is null
    order by om.dat, om.id_nakl
    into :id_nakl,:dat,:tip
  do begin
    reason='pr.id_nakl is null zabyt otkat';
    id_schet=:id_schet_in;
    if (bitand(fix,1)<>0) then begin
      execute procedure rasxod_nal_post_pc(:id_nakl,:id_schet_in);
    end
    suspend;
  end

  for
    select om.id_nakl, om.dat, om.tip
    from naklo om left join provodki pr
      on om.id_nakl=pr.id_nakl and pr.id_schet = :id_schet_in
    where om.posted=1
      and om.dat between :dat_from_in and :dat_to_in
      and om.tip=/*$$IBEC$$ 9050 $$IBEC$$*/:tip_rasxod_po_kasse
      and om.delmarked=0
      and om.id_sklad_to=:id_xoz_oper_minus
      and pr.id_nakl is null
    order by om.dat, om.id_nakl
    into :id_nakl,:dat,:tip
  do begin
    reason='pr.id_nakl is null minus otkat';
    id_schet=:id_schet_in;
    if (bitand(fix,2)<>0) then begin
      execute procedure rasxod_nal_post_pc(:id_nakl,:id_schet_in);
    end
    suspend;
  end

  for
    select om.id_nakl, om.dat, om.tip
    from naklo om left join provodki pr
      on om.id_nakl=pr.id_nakl and pr.id_schet = :id_schet_in
    where om.posted=1
      and om.dat between :dat_from_in and :dat_to_in
      and om.id_sklad_to <> :id_xoz_oper_naklru_bux
      and om.tip=:tip_naklru
      and om.delmarked=0
      and pr.id_nakl is null
    order by om.dat, om.id_nakl
    into :id_nakl,:dat,:tip
  do begin
    reason='pr.id_nakl is null naklru';
    id_schet=:id_schet_in;
    if (bitand(fix,4)<>0) then begin
      execute procedure naklru_post_pc(:id_nakl,:id_schet_in);
    end
    suspend;
  end
  for
    select om.id_nakl, om.dat, om.tip
    from naklo om left join provodki pr
      on om.id_nakl=pr.id_nakl and pr.id_schet = :id_schet_in
    where om.posted=1
      and om.dat between :dat_from_in and :dat_to_in
      and om.tip=:tip_naklpu
      and om.delmarked=0
      and pr.id_nakl is null
    order by om.dat, om.id_nakl
    into :id_nakl,:dat,:tip
  do begin
    reason='pr.id_nakl is null naklpu';
    id_schet=:id_schet_in;
    if (bitand(fix,8)<>0) then begin
      execute procedure naklpu_post_pc(:id_nakl,:id_schet_in);
    end
    suspend;
  end
  for
    select om.id_nakl, om.dat, om.tip
    from naklo om inner join provodki pr
      on om.id_nakl=pr.id_nakl and pr.id_schet = :id_schet_in
    where om.posted=1
      and om.dat between :dat_from_in and :dat_to_in
      and om.tip=:tip_naklpu
      and om.delmarked=0
      and Round(z(pr.kredit)-z(om.nds),2)<>0
    order by om.dat, om.id_nakl
    into :id_nakl,:dat,:tip
  do begin
    reason='pr.kredit-om.nds<>0 naklpu';
    id_schet=:id_schet_in;
    if (bitand(fix,16)<>0) then begin
      execute procedure naklpu_post_pc(:id_nakl,:id_schet_in);
    end
    suspend;
  end
  for
    select om.id_nakl, om.dat, om.tip
    from naklo om left join provodki pr
      on om.id_nakl=pr.id_nakl and pr.id_schet = :id_schet_in
    where om.posted=1
      and om.dat between :dat_from_in and :dat_to_in
      and om.tip in (:tip_naklo,:tip_nedostach)
      and om.delmarked=0
      and pr.id_nakl is null
    order by om.dat, om.id_nakl
    into :id_nakl,:dat,:tip
  do begin
    reason='pr.id_nakl is null naklo';
    id_schet=:id_schet_in;
    if (bitand(fix,32)<>0) then begin
      execute procedure naklo_post_pc(:id_nakl,:id_schet_in);
    end
    suspend;
  end

  for
    select om.id_nakl, om.dat, om.tip
    from naklo om left join provodki pr
      on om.id_nakl=pr.id_nakl and pr.id_schet = :id_schet_in
    where om.posted=1
      and om.dat between :dat_from_in and :dat_to_in
      and om.tip =:tip_izlishek
      and om.delmarked=0
      and pr.id_nakl is null
    order by om.dat, om.id_nakl
    into :id_nakl,:dat,:tip
  do begin
    reason='pr.id_nakl is null naklo';
    id_schet=:id_schet_in;
    if (bitand(fix,32)<>0) then begin
      execute procedure naklp_post_pc(:id_nakl,:id_schet_in);
    end
    suspend;
  end
  /*ôèí ğåç íå ñîâï ñ ñåáåñò*/
  for
    select
      /*$$IBEC$$ sum(pr.kredit)-pr2.kredit,sum(pr.kredit),pr2.kredit , $$IBEC$$*/
      pr2.id_nakl, pr2.dat, pr2.tip
    from provodki pr inner join provodki pr2 on
      pr.id_nakl=pr2.id_nakl
    
    where pr.dat between :dat_from_in and :dat_to_in
    and pr2.dat between :dat_from_in and :dat_to_in
    and pr.id_schet=11607 and pr.tip=5 and pr2.id_schet=-39 and pr2.sub2=22822
    group by pr2.id_nakl,pr2.kredit,pr2.tip,pr2.dat
    having  Round(sum(pr.kredit)-pr2.kredit,2)<>0
    into :id_nakl,:dat,:tip
  do begin
    reason='sum(pr.kredit)-pr2.kredit<>0';
    id_schet=:id_schet_in;
    if (bitand(fix,32)<>0) then begin
      execute procedure naklo_post_pc(:id_nakl,:id_schet_in);
    end
    suspend;
  end

  for
    select om.id_nakl, om.dat, om.tip
    from naklo om inner join provodki pr
      on om.id_nakl=pr.id_nakl
    where om.posted=1
      and pr.dat between :dat_from_in and :dat_to_in
      and pr.tip = :tip_naklo
      and om.delmarked=0
      and pr.sub3 is null
      and pr.id_schet = :id_schet_in
    order by om.dat, om.id_nakl
    into :id_nakl,:dat,:tip
  do begin
    reason='pr.sub3 is null naklo';
    id_schet=:id_schet_in;
    if (bitand(fix,64)<>0) then begin
      execute procedure naklo_post_pc(:id_nakl,:id_schet_in);
    end
    suspend;
  end
  for
    select om.id_nakl, om.dat, om.tip
    from naklo om left join provodki pr
      on om.id_nakl=pr.id_nakl and pr.id_schet = :id_schet_in
    where om.posted=1
      and om.dat between :dat_from_in and :dat_to_in
      and om.tip=/*$$IBEC$$ 9050 $$IBEC$$*/:tip_rasxod_po_kasse
      and om.delmarked=0
      and om.id_sklad_to=:id_xoz_oper_otk
      and pr.id_nakl is null
    order by om.dat, om.id_nakl
    into :id_nakl,:dat,:tip
  do begin
    reason='pr.id_nakl is null otkat obych';
    id_schet=:id_schet_in;
    if (bitand(fix,128)<>0) then begin
      execute procedure rasxod_nal_post_pc(:id_nakl,:id_schet_in);
    end
    suspend;
  end
  for
    select om.id_nakl, om.dat, om.tip
    from naklo om left join provodki pr
      on om.id_nakl=pr.id_nakl and pr.id_schet = :id_schet_in
    where om.posted=1
      and om.dat between :dat_from_in and :dat_to_in
      and om.id_sklad_to=:id_xoz_oper_opl_agent
      and om.tip=:tip_oplaty
      and om.delmarked=0
      and pr.id_nakl is null
    order by om.dat, om.id_nakl
    into :id_nakl,:dat,:tip
  do begin
    reason='pr.id_nakl is null oplaty';
    id_schet=:id_schet_in;
    if (bitand(fix,256)<>0) then begin
      execute procedure oplaty_post_pc(:id_nakl,:id_schet_in);
    end
    suspend;
  end

  for
    select om.id_nakl, om.dat, om.tip
    from naklo om left join provodki pr
      on om.id_nakl=pr.id_nakl and pr.id_schet = :id_schet_in
    where om.posted=1
      and om.dat between :dat_from_in and :dat_to_in
      and om.id_sklad_to=:id_xoz_oper_plat_agent
      and om.tip=:tip_plategy
      and om.delmarked=0
      and pr.id_nakl is null
    order by om.dat, om.id_nakl
    into :id_nakl,:dat,:tip
  do begin
    reason='pr.id_nakl is null plategy';
    id_schet=:id_schet_in;
    if (bitand(fix,512)<>0) then begin
      execute procedure plategy_post_pc(:id_nakl,:id_schet_in);
    end
    suspend;
  end
  for
    select om.id_nakl, om.dat, om.tip,om.id_sklad,om.id_sklad_to
    from naklo om
      left join provodki pr on om.id_nakl=pr.id_nakl and pr.id_schet = :id_schet_in
    where om.posted=1
      and om.dat between :dat_from_in and :dat_to_in
      and om.tip=:tip_perevod
      and om.delmarked=0
      and pr.id_nakl is null
    order by om.dat, om.id_nakl
    into :id_nakl,:dat,:tip,:id_bank_from,:id_bank_to
  do begin
    select b.id_currency
      from bank_vw b
      where b.oid=:id_bank_to
      into :id_currency_bank_to;
    select b.id_currency
      from bank_vw b
      where b.oid=:id_bank_from
      into :id_currency_bank_from;
    if (id_currency_bank_to<>id_currency_bank_from) then begin
      reason='pr.id_nakl is null perevod';
      id_schet=:id_schet_in;
      if (bitand(fix,1024)<>0) then begin
        execute procedure perevod_post_pc(:id_nakl,:id_schet_in);
      end
      suspend;
    end /*if (id_currency_bank_to<>id_currency_bank_from)*/
  end /*for perevod*/

  for
    select om.id_nakl, om.dat, om.tip,om.id_sklad,om.id_sklad_to
    from naklo om
      --left join provodki pr on om.parent_id_nakl=pr.id_nakl and pr.id_schet = :id_schet_in
    where om.posted=1
      and om.dat between :dat_from_in and :dat_to_in
      and om.tip=:tip_naklp
      and om.delmarked=0
      --and pr.id_nakl is null
    order by om.dat, om.id_nakl
    into :id_nakl,:dat,:tip,:id_bank_from,:id_bank_to
  do begin
      reason='pr.id_nakl is null naklp';
      id_schet=:id_schet_in;
      if (bitand(fix,2048)<>0) then begin
        execute procedure naklp_post_pc(:id_nakl,:id_schet_in);
      end
      suspend;
  end /*for naklp*/
  for
    select om.id_nakl, om.dat, om.tip,om.id_sklad,om.id_sklad_to
    from naklo om
      --left join provodki pr on om.id_nakl=pr.id_nakl and pr.id_schet = :id_schet_in
    where om.posted=1
      and om.dat between :dat_from_in and :dat_to_in
      and om.tip=:tip_naklpbux
      and om.delmarked=0
      --and pr.id_nakl is null
    order by om.dat, om.id_nakl
    into :id_nakl,:dat,:tip,:id_bank_from,:id_bank_to
  do begin
      reason='pr.id_nakl is null naklpbux';
      id_schet=:id_schet_in;
      if (bitand(fix,2048)<>0) then begin
        execute procedure naklpbux_post_pc(:id_nakl,:id_schet_in);
      end
      suspend;
  end /*for naklpbux*/
  for
    select om.id_nakl, om.dat, om.tip,om.id_sklad,om.id_sklad_to
    from naklo om
      --left join provodki pr on om.id_nakl=pr.id_nakl and pr.id_schet = :id_schet_in
    where om.posted=1
      and om.dat between :dat_from_in and :dat_to_in
      and om.tip=:tip_vozvrat
      and om.delmarked=0
      --and pr.id_nakl is null
    order by om.dat, om.id_nakl
    into :id_nakl,:dat,:tip,:id_bank_from,:id_bank_to
  do begin
      reason='pr.id_nakl is null vozvrat';
      id_schet=:id_schet_in;
      if (bitand(fix,2048)<>0) then begin
        execute procedure vozvrat_post_pc(:id_nakl,:id_schet_in);
      end
      suspend;
  end /*for vozvrat*/
end
^

ALTER PROCEDURE RASXOD_NAL_OSTATOK_RECOUNT_PC(
    ID_NAKL INTEGER)
AS
declare variable id_schet integer;
  declare variable tip integer;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_manager integer;
  declare variable dat date;
  declare variable potracheno double precision;
  declare variable nds double precision;
  declare variable ostatok double precision;
  declare variable id_bank integer;
  declare variable id_currency_bank integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ Ñ×ÅÒÀ',-100)
    into :id_schet;
  select oid
    from GET_OID_OBJECTS_PC('ÍÀËÈ×ÍÛÅ ÄÎËÃÈ',:id_schet)
    into :id_schet;
  select om.tip,om.id_izg,om.id_zak,om.id_manager,
      om.dat, om.nds,om.id_sklad
    from naklo om
    where om.id_nakl=:id_nakl
    into :tip,:id_izg, :id_zak,:id_manager,
      :dat, :nds,:id_bank;
  select b.id_currency
    from bank_vw b
    where b.oid=:id_bank
    into :id_currency_bank;
  select sum(kredit)
    from provodki pr
    where pr.id_nakl=:id_nakl
      and pr.id_schet=:id_schet
      and pr.sub4<>:id_nakl
    into :potracheno;
  ostatok=Round(:nds-:potracheno,2);
  delete from provodki pr where pr.id_schet=:id_schet and
    pr.id_nakl=:id_nakl and pr.sub4=:id_nakl;
  if (Round(ostatok,2)<>0 ) then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet,:dat,:tip,
        :ostatok, :id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_bank);
  end

end
^

ALTER PROCEDURE RASXOD_NAL_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
declare variable schet_name varchar(50);
declare variable name varchar(50);
declare variable id_schet_tip integer;
declare variable id_schet_post integer;
declare variable id_izg integer;
declare variable id_zak integer;
declare variable id_manager integer;
declare variable dat date;
declare variable tip integer;
declare variable nds double precision;
declare variable posted integer;
declare variable serror varchar(100);
declare variable id_schet_dengi integer;
declare variable id_currency_bank integer;
declare variable id_bank integer;
declare variable id_vlad_schet integer;
declare variable nds_from double precision;
declare variable id_bank2 integer;
declare variable id_xoz_oper integer;
declare variable id_xoz_oper_tip integer;
declare variable xoz_oper_name varchar(50);
declare variable id_schet_finrez integer;
declare variable id_statya_dr_tip integer;
declare variable id_statya_dox integer;
declare variable id_project integer;
declare variable id_statya_ras integer;
declare variable id_statya_prix_otk integer;
begin
  select om.tip,om.id_izg,om.id_zak,om.id_manager,
      om.nds,om.dat,
      om.posted,om.id_currency_to,om.id_sklad,om.nds_from,
      om.id_sklad_to
    from naklo om
    where om.id_nakl=:id_nakl
    into :tip,:id_izg, :id_zak,:id_manager,
      :nds,:dat,
      :posted,:id_vlad_schet,:id_bank2,:nds_from,
      :id_xoz_oper;
  /*Ïğîâåğêè*/
  if (id_schet =0 ) then begin
    id_schet = null;
  end   
  select name from get_name_objects_pc(:tip,-100) into :name;
  if (name<>'ĞÀÑÕÎÄ ÏÎ ÊÀÑÑÅ') then begin
    execute procedure error('Íåëüçÿ ïğîâåñòè íå èñõîäÿùèé ïëàò¸æ');
  end  

  if ((posted<>0) and (id_schet is null)) then begin
    execute procedure error ('Íåëüçÿ ïğîâåñòè óæå ïğîâåäåííûé äîêóìåíò');
  end      
  if ((posted=0) and (id_schet is not null)) then begin
    sError = 'Íåëüçÿ ÷àñòè÷íî ïğîâåñòè íå ïğîâåäåííûé äîêóìåíò' || coalesce(:id_schet,999);
    execute procedure error (sError);
  end  
  if (id_bank2 is null) then begin
    sError = 'Óêàæèòå áàíêîâñêèé ñ÷¸ò';
    execute procedure error (sError);
  end
  select oid from bank_vw b where b.oid=:id_bank2 and b.delmarked=0 into :id_bank;
  if (id_bank is null) then begin
    sError = 'Íåâåğíûé áàíêîâñêèé ñ÷¸ò';
    execute procedure error (sError);
  end
  /*èäåíòèôèêàòîğû îáúåêòîâ*/
  select oid
    from get_oid_objects_pc('ÕÎÇßÉÑÒÂÅÍÍÛÅ ÎÏÅĞÀÖÈÈ',-100)
    into :id_xoz_oper_tip;
  select name
    from get_name_objects_pc(:id_xoz_oper,:id_xoz_oper_tip)
    into :xoz_oper_name;

  if (xoz_oper_name ='ĞÀÑÕÎÄ ÏÎ ÊÀÑÑÅ ÌÈÍÓÑÎÂÎÉ ÊÀÊ ÓÁÛÒÎÊ ÔÈĞÌÛ') then begin
    if (nds>0 ) then begin
      execute procedure error('Ñóììà îòğèöàòåëüíîãî ğàñõîäà(íà óáûòêè) äîëæíà áûòü < 0');
    end
  end

  if (xoz_oper_name ='ĞÀÑÕÎÄ ÏÎ ÊÀÑÑÅ ÎÁÛ×ÍÛÉ') then begin
    if (nds<0 ) then begin
      execute procedure error('Ñóììà ğàñõîäà ïî êàññå äîëæíà áûòü > 0');
    end
  end

  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ Ñ×ÅÒÀ',-100)
    into :id_schet_tip;
 
  if (id_schet is not null) then begin
    select name
      from get_name_objects_pc(:id_schet,:id_schet_tip)
      into schet_name;
  end
    

  select oid
    from GET_OID_OBJECTS_PC('ÍÀËÈ×ÍÛÅ ÄÎËÃÈ',:id_schet_tip)
    into :id_schet_post;
  select oid
    from GET_OID_OBJECTS_PC('ÄÅÍÜÃÈ ÍÀ Ñ×ÅÒÀÕ',:id_schet_tip)
    into :id_schet_dengi;    
  select oid
    from GET_OID_OBJECTS_PC('ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ',:id_schet_tip)
    into :id_schet_finrez;
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ ÑÒÀÒÜÈ ÄÎÕÎÄÎÂ È ĞÀÑÕÎÄÎÂ',-100)
    into :id_statya_dr_tip;
  select oid
    from GET_OID_OBJECTS_PC('ÄÎÕÎÄ ÎÒ ÇÀÁÛÒÛÕ ÎÒÊÀÒÎÂ',:id_statya_dr_tip)
    into :id_statya_dox;
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑÕÎÄ ÎÒ ÌÈÍÓÑÎÂÛÕ ÎÒÊÀÒÎÂ',:id_statya_dr_tip)
    into :id_statya_ras;
  select oid
    from GET_OID_OBJECTS_PC('ÄÎÕÎÄ ÎÒ ÎÒÊÀÒÎÂ',:id_statya_dr_tip)
    into :id_statya_prix_otk;

  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ ÏĞÎÅÊÒÛ',-100)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('ÔÈĞÌÀ',:id_project)
    into :id_project;

  /*Óäàëåíèå ïğîâîäîê ïî äîêóìåíòó òîëüêî ïî îäíîìó ñ÷¸òó. Äëÿ ïåğåïğîâåäåíèÿ*/
  if (id_schet is not null) then begin
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.tip=:tip
        and pr.id_schet=:id_schet;
  end
  select b.id_currency
    from bank_vw b
    where b.oid=:id_bank
    into :id_currency_bank;   
  /*ïğîâîäêè*/
  if ((id_schet is null) or (schet_name='ÍÀËÈ×ÍÛÅ ÄÎËÃÈ') ) then begin      
    /*Ñòàğûå òğàíøè ïğè ïåğåïğîâåäåíèè óäàëÿşòñÿ*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip=2;    
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=2;
/*$$IBEC$$     if (nds>=0) then begin $$IBEC$$*/
      /*Íîğìàëüíûå ïëàòåæè, ò.å. ïîëîæèòåëüíûå*/
      insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_post,:dat,:tip,
        :nds, :id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_bank);
/*$$IBEC$$     end $$IBEC$$*/
/*$$IBEC$$     if ((nds<0) and (xoz_oper_name ='ĞÀÑÕÎÄ ÏÎ ÊÀÑÑÅ ÌÈÍÓÑÎÂÎÉ ÊÀÊ ÓÁÛÒÎÊ ÔÈĞÌÛ')) then begin
       $$IBEC$$*//*Íîğìàëüíûå ïëàòåæè, ò.å. ïîëîæèòåëüíûå*//*$$IBEC$$ 
      insert into provodki (id_schet,dat,tip,
        debet,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_post,:dat,:tip,
        :nds, :id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_bank);
    end   $$IBEC$$*/
  end /*if schet*/
  
  if ((id_schet is null) or (schet_name='ÄÅÍÜÃÈ ÍÀ Ñ×ÅÒÀÕ')) then begin
    if ((xoz_oper_name <>'ĞÀÑÕÎÄ ÏÎ ÊÀÑÑÅ ÌÈÍÓÑÎÂÎÉ ÊÀÊ ÓÁÛÒÎÊ ÔÈĞÌÛ') and
      (xoz_oper_name <>'ĞÀÑÕÎÄ ÏÎ ÊÀÑÑÅ ÇÀÁÛÒÛÉ'))
    then begin
        if ((id_schet_dengi is not null) and (:dat>='31.05.07')) then begin
          insert into provodki (id_schet,dat,tip,
              kredit,id_nakl,
              sub1,sub2,sub3)
            values(:id_schet_dengi,:dat,:tip,
              Round(:nds,2),:id_nakl,
              :id_vlad_schet,:id_bank,:id_currency_bank);
          /*êîìèññèÿ, êàê ïğèõîä ïî êàññå*/
          insert into provodki (id_schet,dat,tip,
              debet,id_nakl,
              sub1,sub2,sub3)
            values(:id_schet_dengi,:dat,:tip,
              Round(:nds_from,2),:id_nakl,
              :id_vlad_schet,:id_bank,:id_currency_bank);          
        end /*if (id_bank is not null)*/
    end  /*if xoz_oper_name <>'ĞÀÑÕÎÄ ÏÎ ÊÀÑÑÅ ÌÈÍÓÑÎÂÎÉ ÊÀÊ ÓÁÛÒÎÊ ÔÈĞÌÛ'*/
  end /*if 'ÄÅÍÜÃÈ ÍÀ Ñ×ÅÒÀÕ'*/  

  if ((id_schet is null) or (schet_name='ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ')) then begin
    if (xoz_oper_name ='ĞÀÑÕÎÄ ÏÎ ÊÀÑÑÅ ÇÀÁÛÒÛÉ') then  begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(:nds,2),:id_nakl,
          :id_project,:id_statya_dox,:id_currency_bank,:id_izg,:id_zak,:id_manager);
    end
    if (xoz_oper_name ='ĞÀÑÕÎÄ ÏÎ ÊÀÑÑÅ ÌÈÍÓÑÎÂÎÉ ÊÀÊ ÓÁÛÒÎÊ ÔÈĞÌÛ') then  begin
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(-:nds,2),:id_nakl,
          :id_project,:id_statya_ras,:id_currency_bank,:id_izg,:id_zak,:id_manager);
    end
    if (xoz_oper_name ='ĞÀÑÕÎÄ ÏÎ ÊÀÑÑÅ ÎÁÛ×ÍÛÉ') then  begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(:nds_from,2),:id_nakl,
          :id_project,:id_statya_prix_otk,:id_currency_bank,:id_izg,:id_zak,:id_manager);
    end
  end /*'ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ'*/
  update naklo om
    set om.posted=1
    where om.posted=0 and
      om.delmarked=0 and
      om.id_nakl=:id_nakl;
end
^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring privileges */
/*-------------------------------------------------------------------------*/

GRANT SELECT ON BANK_VW TO PROCEDURE MAKE_TRANSH_PROVODKI;
GRANT SELECT ON BANK_VW TO PROCEDURE OPLATY_POST_PC;
GRANT SELECT ON BANK_VW TO PROCEDURE OPLNAKL_POST_PC;
GRANT SELECT ON BANK_VW TO PROCEDURE PEREVOD_POST_PC;
GRANT SELECT ON BANK_VW TO PROCEDURE PLATEGY_POST_PC;
GRANT SELECT ON BANK_VW TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT SELECT ON BANK_VW TO PROCEDURE RASXOD_NAL_OSTATOK_RECOUNT_PC;
GRANT SELECT ON BANK_VW TO PROCEDURE RASXOD_NAL_POST_PC;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON BANK_VW TO BOSSES;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON BANK_VW TO BUXG;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON BANK_VW TO MANAGER;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON BANK_VW TO POWER_USER;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON BANK_VW TO SKLAD;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON BANK_VW TO SNAB;


GRANT SELECT,DELETE ON OBJECTS TO TRIGGER BANK_VW_BD;
GRANT SELECT,DELETE ON BANK TO TRIGGER BANK_VW_BD;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER BANK_VW_BI;
GRANT INSERT ON OBJECTS TO TRIGGER BANK_VW_BI;
GRANT INSERT ON BANK TO TRIGGER BANK_VW_BI;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER BANK_VW_BU;
GRANT EXECUTE ON PROCEDURE ERROR TO TRIGGER BANK_VW_BU;
GRANT SELECT,UPDATE ON BANK TO TRIGGER BANK_VW_BU;
GRANT SELECT,UPDATE ON OBJECTS TO TRIGGER BANK_VW_BU;
GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE MAKE_TRANSH_PROVODKI;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE MAKE_TRANSH_PROVODKI;
GRANT EXECUTE ON PROCEDURE REP_OSTATKI_PC TO PROCEDURE MAKE_TRANSH_PROVODKI;
GRANT SELECT,INSERT ON PROVODKI TO PROCEDURE MAKE_TRANSH_PROVODKI;
GRANT SELECT ON NAKLO TO PROCEDURE MAKE_TRANSH_PROVODKI;
GRANT SELECT ON BANK_VW TO PROCEDURE MAKE_TRANSH_PROVODKI;
GRANT EXECUTE ON PROCEDURE RASXOD_NAL_OSTATOK_RECOUNT_PC TO PROCEDURE MAKE_TRANSH_PROVODKI;
GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE OPLATY_POST_PC;
GRANT EXECUTE ON PROCEDURE OPLATY_UNPOST_PC TO PROCEDURE OPLATY_POST_PC;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE OPLATY_POST_PC;
GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE OPLATY_POST_PC;
GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE OPLATY_POST_PC;
GRANT SELECT,INSERT,DELETE ON PROVODKI TO PROCEDURE OPLATY_POST_PC;
GRANT SELECT ON VLAD_VW TO PROCEDURE OPLATY_POST_PC;
GRANT SELECT ON BANK_VW TO PROCEDURE OPLATY_POST_PC;
GRANT SELECT,DELETE ON OPLNAKL TO PROCEDURE OPLATY_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLO_AUTO_SPEND_PC TO PROCEDURE OPLATY_POST_PC;
GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE PEREVOD_POST_PC;
GRANT SELECT ON BANK_VW TO PROCEDURE PEREVOD_POST_PC;
GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE PEREVOD_POST_PC;
GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE PEREVOD_POST_PC;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE PEREVOD_POST_PC;
GRANT SELECT,INSERT,DELETE ON PROVODKI TO PROCEDURE PEREVOD_POST_PC;
GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE PLATEGY_POST_PC;
GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE PLATEGY_POST_PC;
GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE PLATEGY_POST_PC;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE PLATEGY_POST_PC;
GRANT SELECT,INSERT,DELETE ON PROVODKI TO PROCEDURE PLATEGY_POST_PC;
GRANT SELECT,INSERT,DELETE ON OPLNAKL TO PROCEDURE PLATEGY_POST_PC;
GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO PROCEDURE PLATEGY_POST_PC;
GRANT EXECUTE ON PROCEDURE REP_OSTATKI_PC TO PROCEDURE PLATEGY_POST_PC;
GRANT EXECUTE ON PROCEDURE OPLNAKL_POST_PC TO PROCEDURE PLATEGY_POST_PC;
GRANT SELECT ON BANK_VW TO PROCEDURE PLATEGY_POST_PC;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT SELECT ON NAKLO TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT SELECT ON PROVODKI TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT EXECUTE ON PROCEDURE RASXOD_NAL_POST_PC TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT EXECUTE ON PROCEDURE NAKLRU_POST_PC TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT EXECUTE ON PROCEDURE NAKLPU_POST_PC TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT EXECUTE ON PROCEDURE NAKLO_POST_PC TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_POST_PC TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT EXECUTE ON PROCEDURE OPLATY_POST_PC TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT EXECUTE ON PROCEDURE PLATEGY_POST_PC TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT SELECT ON BANK_VW TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT EXECUTE ON PROCEDURE PEREVOD_POST_PC TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT EXECUTE ON PROCEDURE NAKLPBUX_POST_PC TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT EXECUTE ON PROCEDURE VOZVRAT_POST_PC TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE RASXOD_NAL_OSTATOK_RECOUNT_PC;
GRANT SELECT ON NAKLO TO PROCEDURE RASXOD_NAL_OSTATOK_RECOUNT_PC;
GRANT SELECT ON BANK_VW TO PROCEDURE RASXOD_NAL_OSTATOK_RECOUNT_PC;
GRANT SELECT,INSERT,DELETE ON PROVODKI TO PROCEDURE RASXOD_NAL_OSTATOK_RECOUNT_PC;
GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE RASXOD_NAL_POST_PC;
GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE RASXOD_NAL_POST_PC;
GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE RASXOD_NAL_POST_PC;
GRANT SELECT ON BANK_VW TO PROCEDURE RASXOD_NAL_POST_PC;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE RASXOD_NAL_POST_PC;
GRANT SELECT,INSERT,DELETE ON PROVODKI TO PROCEDURE RASXOD_NAL_POST_PC;
GRANT SELECT,DELETE ON OPLNAKL TO PROCEDURE RASXOD_NAL_POST_PC;

