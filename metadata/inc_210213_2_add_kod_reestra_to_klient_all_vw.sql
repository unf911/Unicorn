/*-------------------------------------------------------------------------*/
/* First procedures with empty bodies */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE REP_KLIENT_LAST_CONTACT_PC(
    ID_MANAGER_IN INTEGER)
RETURNS (
    DAT TIMESTAMP,
    TIP INTEGER,
    ID_NAKL INTEGER,
    ID_KLIENT INTEGER,
    NAME VARCHAR(50),
    ID_MANAGER INTEGER,
    YUR_ADRES VARCHAR(100),
    FIZ_ADRES VARCHAR(100),
    TEL VARCHAR(50),
    FAX VARCHAR(50),
    KONTACT_LICO VARCHAR(50),
    DIRECTOR VARCHAR(50))
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE REP_SEBEST4_REC_PC(
    ID_NAKL INTEGER,
    ID_TOVAR_IN INTEGER)
RETURNS (
    ID_POS INTEGER,
    ID_NAKLD INTEGER,
    ID_TOVAR INTEGER,
    ID_SKLAD INTEGER,
    TARA INTEGER,
    NALOG_NDS NUMERIC(15,4),
    KURS DOUBLE PRECISION,
    KURS2 DOUBLE PRECISION,
    SKIDKA NUMERIC(15,2),
    CENA NUMERIC(15,4),
    CENA_GRN NUMERIC(15,4),
    KOLOTP DOUBLE PRECISION,
    CENA_SEBEST NUMERIC(15,5),
    DAT TIMESTAMP,
    PRICE_MINUS_18_COMPARE DOUBLE PRECISION,
    ID_ANALOG INTEGER)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE SRAVNPRICE_MAKE_SPEC_PC(
    ID_POST INTEGER,
    COMMENT VARCHAR(50),
    MODE INTEGER,
    ID_CURRENCY INTEGER,
    PARENT_ID_NAKL INTEGER)
RETURNS (
    ID_NAKL INTEGER)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE TEMP72_KLIENT_PC
RETURNS (
    OID INTEGER,
    NAME VARCHAR(50),
    DELMARKED SMALLINT)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Dropping old views */
/*-------------------------------------------------------------------------*/

DROP VIEW KLIENT_ALL_VW;

/*-------------------------------------------------------------------------*/
/* Creating new views */
/*-------------------------------------------------------------------------*/

CREATE VIEW KLIENT_ALL_VW(
    NAME,
    ADRP,
    IPN,
    SVREG,
    OKPO,
    INDEXI,
    OBLAST,
    TEL,
    FAX,
    FORIN,
    LICO,
    FIO,
    OTV,
    ADRES,
    GOROD,
    STAN,
    ID,
    TIP,
    DELMARKED,
    FULLNAME,
    DAT_OSNOV,
    OFFICESKLAD,
    SOTRUDNIKOV_OT,
    SOTRUDNIKOV_DO,
    FILIALY,
    ID_ANALOG,
    KTOZAKUPAET,
    KAKOYKABELNUGEN,
    OBJEMZAGOD,
    OBJEMZA6MESYATSEV,
    KTOMOGETPORUCHITSYA,
    VASHIPARTNERY,
    VASHIKONKURENTY,
    FINANSOVOEPOLOGENIE,
    DELOVAYAREPUTACIYA,
    RASPOLAGAETLIKONKURENT,
    ID_SFERADEYATELNOSTI,
    ID_MANAGER,
    ID_RESULT,
    DAT_CONTACT,
    OBLAST2,
    MODIFIED,
    ID_PRICE,
    ID_SKIDKA,
    ID_USL_POSTAVKA,
    ISDEFAULT,
    CREATED,
    LGOTY,
    PLAT_ED_NALOGA,
    IS_FIZLICO,
    NOMER_FILIALA,
    KOD_REESTRA)
AS
select 
  o.name,
  k.adrp,k.ipn,k.svreg,
  k.okpo,k.indexi,k.oblast,
  k.tel,k.fax,k.forin,k.lico,k.fio,k.otv,
  k.adres,k.gorod,k.stan,o.oid as id,k.tip,
  o.delmarked,
  o.fullname,
  k.dat_osnov,
  k.officesklad,
  k.sotrudnikov_ot,
  k.sotrudnikov_do,
  k.filialy,
  k.id_analog,
  k.ktozakupaet,
  k.kakoykabelnugen,
  k.objemzagod,
  k.objemza6mesyatsev,
  k.ktomogetporuchitsya,
  k.vashipartnery,
  k.vashikonkurenty,
  k.finansovoepologenie,
  k.delovayareputaciya,
  k.raspolagaetlikonkurent,
  k.id_sferadeyatelnosti,
  k.id_manager,
  k.id_result,
  k.dat_contact,
  k.oblast2,
  k.modified,
  k.id_price,
  k.id_skidka,
  k.id_usl_postavka,
  o.isdefault,
  k.created,
  k.lgoty as lgoty,
  k.PLAT_ED_NALOGA,
  k.IS_FIZLICO,
  k.nomer_filiala,
  k.kod_reestra
from 
  klient k inner join objects o on k.id=o.oid
where
  o.classid=109
;
/*-------------------------------------------------------------------------*/
/* Restoring descriptions for views */
/*-------------------------------------------------------------------------*/

DESCRIBE VIEW KLIENT_ALL_VW
'Все контрагенты выбираются из objects и klient,
  oid "тип фирмы" = 109
Используется в справочнике клиентов 2';

/*-------------------------------------------------------------------------*/
/* Restoring descriptions of view columns */
/*-------------------------------------------------------------------------*/

/*-------------------------------------------------------------------------*/
/* Restoring triggers for views */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

CREATE TRIGGER KLIENT_ALL_VW_AU0 FOR KLIENT_ALL_VW
ACTIVE AFTER UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER KLIENT_ALL_VW_BI0 FOR KLIENT_ALL_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

ALTER TRIGGER KLIENT_ALL_VW_AU0
AS
  declare variable classid integer;
  declare variable id_manager integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('ТИП ФИРМЫ',-100)
    into :classid;
  update objects
    set
      oid = new.id,
      delmarked=new.delmarked,
      name=new.name,
      fullname=new.fullname
    where oid=old.id and classid=:classid;
  update klient
    set
      id=new.id,
      adrp=new.adrp,
      ipn=new.ipn,
      svreg=new.svreg,
      okpo=new.okpo,
      indexi=new.indexi,
      oblast=new.oblast,
      tel=new.tel,
      fax=new.fax,
      forin=new.forin,
      lico=new.lico,
      fio=new.fio,
      otv=new.otv,
      adres=new.adres,
      gorod=new.gorod,
      stan=new.stan,
      tip=new.tip,
      name=new.name,
      DAT_OSNOV = NEW.DAT_OSNOV,
      OFFICESKLAD = NEW.OFFICESKLAD,
      SOTRUDNIKOV_OT = NEW.SOTRUDNIKOV_OT,
      SOTRUDNIKOV_DO = NEW.SOTRUDNIKOV_DO,
      FILIALY = NEW.FILIALY,
      ID_ANALOG = NEW.ID_ANALOG,
      KTOZAKUPAET = NEW.KTOZAKUPAET,
      KAKOYKABELNUGEN = NEW.KAKOYKABELNUGEN,
      OBJEMZAGOD = NEW.OBJEMZAGOD,
      OBJEMZA6MESYATSEV = NEW.OBJEMZA6MESYATSEV,
      KTOMOGETPORUCHITSYA = NEW.KTOMOGETPORUCHITSYA,
      VASHIPARTNERY = NEW.VASHIPARTNERY,
      VASHIKONKURENTY = NEW.VASHIKONKURENTY,
      FINANSOVOEPOLOGENIE = NEW.FINANSOVOEPOLOGENIE,
      DELOVAYAREPUTACIYA = NEW.DELOVAYAREPUTACIYA,
      RASPOLAGAETLIKONKURENT = NEW.RASPOLAGAETLIKONKURENT,
      ID_SFERADEYATELNOSTI = NEW.ID_SFERADEYATELNOSTI,
      ID_RESULT = NEW.ID_RESULT,
      DAT_CONTACT = NEW.DAT_CONTACT,
      id_price=new.id_price,
      id_skidka=new.id_skidka,
      ID_USL_POSTAVKA = new.id_usl_postavka,
      delmarked=new.delmarked,
      lgoty=new.lgoty,
      PLAT_ED_NALOGA=new.PLAT_ED_NALOGA,
      IS_FIZLICO=new.IS_FIZLICO,
      NOMER_FILIALA=new.nomer_filiala
    where
      id=old.id;
  if (z(old.id_manager)<>z(new.id_manager)) then begin
    select g.id_manager
      from get_id_manager_pc g
      into :id_manager;
    if ((current_role='POWER_USER' ) or
      (current_role='MANAGER' and
      (id_manager=old.id_manager)) or
      current_user='SYSDBA')
    then begin
      update klient
        set ID_MANAGER = NEW.ID_MANAGER
        where id=old.id;
    end
  end
end^

ALTER TRIGGER KLIENT_ALL_VW_BI0
AS
  declare variable classid integer;
begin
  if (new.id is null) then begin
    NEW.id = GEN_ID(oid_gen,1);
  end
  select oid
    from GET_OID_OBJECTS_PC('ТИП ФИРМЫ',-100)
    into :classid;
  insert into objects (classid,oid,delmarked,name,fullname)
    values (:classid,new.id,new.delmarked,new.name,new.fullname);
  INSERT INTO KLIENT (
    ID,
    NAME,
    OKPO,
    INDEXI,
    OBLAST,
    TEL,
    FAX,
    FORIN,
    IPN,
    SVREG,
    LICO,
    FIO,
    OTV,
    ADRES,
    GOROD,
    STAN,
    ADRP,
    DELMARKED,
    TIP,
    MODIFIED,
    DAT_OSNOV,
    OFFICESKLAD,
    SOTRUDNIKOV_OT,
    SOTRUDNIKOV_DO,
    FILIALY,
    ID_ANALOG,
    KTOZAKUPAET,
    KAKOYKABELNUGEN,
    OBJEMZAGOD,
    OBJEMZA6MESYATSEV,
    KTOMOGETPORUCHITSYA,
    VASHIPARTNERY,
    VASHIKONKURENTY,
    FINANSOVOEPOLOGENIE,
    DELOVAYAREPUTACIYA,
    RASPOLAGAETLIKONKURENT,
    ID_SFERADEYATELNOSTI,
    ID_MANAGER,
    ID_RESULT,
    DAT_CONTACT,
    ID_PRICE,
    ID_SKIDKA,
    ID_USL_POSTAVKA,
    LGOTY,
    PLAT_ED_NALOGA,
    IS_FIZLICO,
    NOMER_FILIALA)
  VALUES (
    NEW.ID,
    NEW.NAME,
    NEW.OKPO,
    NEW.INDEXI,
    NEW.OBLAST,
    NEW.TEL,
    NEW.FAX,
    NEW.FORIN,
    NEW.IPN,
    NEW.SVREG,
    NEW.LICO,
    NEW.FIO,
    NEW.OTV,
    NEW.ADRES,
    NEW.GOROD,
    NEW.STAN,
    NEW.ADRP,
    NEW.DELMARKED,
    NEW.TIP,
    NEW.MODIFIED,
    NEW.DAT_OSNOV,
    NEW.OFFICESKLAD,
    NEW.SOTRUDNIKOV_OT,
    NEW.SOTRUDNIKOV_DO,
    NEW.FILIALY,
    NEW.ID_ANALOG,
    NEW.KTOZAKUPAET,
    NEW.KAKOYKABELNUGEN,
    NEW.OBJEMZAGOD,
    NEW.OBJEMZA6MESYATSEV,
    NEW.KTOMOGETPORUCHITSYA,
    NEW.VASHIPARTNERY,
    NEW.VASHIKONKURENTY,
    NEW.FINANSOVOEPOLOGENIE,
    NEW.DELOVAYAREPUTACIYA,
    NEW.RASPOLAGAETLIKONKURENT,
    NEW.ID_SFERADEYATELNOSTI,
    NEW.ID_MANAGER,
    NEW.ID_RESULT,
    NEW.DAT_CONTACT,
    NEW.id_price,
    new.id_skidka,
    NEW.ID_USL_POSTAVKA,
    NEW.lgoty,
    new.PLAT_ED_NALOGA,
    new.IS_FIZLICO,
    NEW.NOMER_FILIALA);
end^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring bodies of procedures */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE REP_KLIENT_LAST_CONTACT_PC(
    ID_MANAGER_IN INTEGER)
RETURNS (
    DAT TIMESTAMP,
    TIP INTEGER,
    ID_NAKL INTEGER,
    ID_KLIENT INTEGER,
    NAME VARCHAR(50),
    ID_MANAGER INTEGER,
    YUR_ADRES VARCHAR(100),
    FIZ_ADRES VARCHAR(100),
    TEL VARCHAR(50),
    FAX VARCHAR(50),
    KONTACT_LICO VARCHAR(50),
    DIRECTOR VARCHAR(50))
AS
declare variable tip_rasx integer;
begin
  select oid from get_oid_objects_pc('РАСХОДНЫЕ НАКЛАДНЫЕ',-100) into :tip_rasx;
   
  for
  select max(om.dat), om.tip, om.id_zak,  max(om.id_nakl)
  from naklo om
  where om.delmarked=0 and om.tip in (:tip_rasx)
    and om.dat>incdate(current_date, 0,0,-1)
  group by om.id_zak,om.tip
  into :dat, :tip, :id_klient,:id_nakl
  do begin
    for
    select k.name,k.id_manager,k.adrp,k.adres,k.tel,k.fax,k.lico, k.fio
    from klient_all_vw k
    where k.id=:id_klient and
        k.id_manager between coalesce(:ID_MANAGER_IN,-2147483648)
        and coalesce(:ID_MANAGER_IN, 2147483647) and k.delmarked=0
    into :name, :id_manager,:yur_adres,:fiz_adres,:tel,:fax,:kontact_lico,:director
    do begin
      suspend;
    end
  end
end
^

ALTER PROCEDURE REP_SEBEST4_REC_PC(
    ID_NAKL INTEGER,
    ID_TOVAR_IN INTEGER)
RETURNS (
    ID_POS INTEGER,
    ID_NAKLD INTEGER,
    ID_TOVAR INTEGER,
    ID_SKLAD INTEGER,
    TARA INTEGER,
    NALOG_NDS NUMERIC(15,4),
    KURS DOUBLE PRECISION,
    KURS2 DOUBLE PRECISION,
    SKIDKA NUMERIC(15,2),
    CENA NUMERIC(15,4),
    CENA_GRN NUMERIC(15,4),
    KOLOTP DOUBLE PRECISION,
    CENA_SEBEST NUMERIC(15,5),
    DAT TIMESTAMP,
    PRICE_MINUS_18_COMPARE DOUBLE PRECISION,
    ID_ANALOG INTEGER)
AS
  declare variable id_schet integer;
  declare variable id_schet_sebest integer;
  declare variable id_currency integer;
  declare variable id_currency_from integer;
  declare variable id_currency_tip integer;
  declare variable id_nakl2 integer;
  declare variable id_uchet_politics integer;
  declare variable id_sklad_seb integer;
  declare variable id_registr integer;
  declare variable id_registr_price integer;
  declare variable id_price_post integer;
  declare variable id_currency_price integer;
  declare variable include_nds_price integer;
  declare variable kurs_price double precision;
  declare variable dat_price date;
  declare variable id_nakl_price integer;
  declare variable cena_from_price double precision;
  declare variable cena_with_nds_in_price_currency double precision;
  
begin
  select oid
    from get_oid_objects_pc('ТИП СЧЕТА',-100)
    into :id_schet;
  select oid
    from get_oid_objects_pc('СЕБЕСТОИМОСТЬ СКЛАД',:id_schet)
    into :id_schet_sebest;
  select oid
    from get_oid_objects_pc('ТИП ВАЛЮТ',-100)
    into :id_currency_tip;
  select oid
    from get_oid_objects_pc('USD',:id_currency_tip)
    into :id_currency;
  select oid
    from get_oid_objects_pc('UAH',:id_currency_tip)
    into :id_currency_from;
  select oid
    from get_oid_objects_pc('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100)
    into :id_uchet_politics;
  select oid
    from get_oid_objects_pc('УПРАВЛЕНЧЕСКИЙ УЧЁТ',:id_uchet_politics)
    into :id_uchet_politics;
  select oid
    from get_oid_objects_pc('РЕГИСТРЫ СВЕДЕНИЙ',-100)
    into :id_registr;
  select oid
    from get_oid_objects_pc('РЕГИСТР ПРАЙСОВ',:id_registr)
    into :id_registr_price;
  /*Прайс УКК*/
  select k.id_price
    from klient_all_vw k
    where k.isdefault=1 and k.delmarked=0
    into :id_price_post;
  select s.id_currency,s.include_nds
    from spr_price_vw s
    where s.oid=:id_price_post
    into :id_currency_price,:include_nds_price;
  for
    select kurs,dat,nalog_nds,om.id_sklad,om.id_nakl
      from naklo om
      where om.parent_id_nakl=:id_nakl and
        om.posted=1 and om.delmarked=0 and om.tip=5
      order by dat, id_nakl
      into :kurs,:dat,:nalog_nds,:id_sklad,:id_nakl2
  do begin
    select dzero(kurs_from,kurs_to,1)
      from kurs_get_pc (:dat,:id_currency_from ,:id_currency_price,1)
      into :kurs_price;  
    select id_sklad,id_uchet_politics
      from sklad_sebest_settings_pc(:id_sklad, :id_uchet_politics)
      into :id_sklad_seb,:id_uchet_politics;
    /*Марина сказала что курс себестоимости должен браться из
      справочника курсов, а не из курса складской накладной,
      если он был там указан*/
    select dzero(kurs_to,kurs_from,1)
      from kurs_get_pc (:dat, :id_currency_from,:id_currency,1)
      into :kurs2;      
    for
      /*Видно и тару тоже*/
      select t.tara,ot.id_tovar,ot.id_pos,ot.id_nakld,
        ot.cena,ot.skidka,ot.kolotp,t.id_analog
      from naklot ot inner join tovar t
        on ot.id_tovar=t.oid
      where ot.id_nakl=:id_nakl2 and
        (ot.id_tovar between coalesce(:id_tovar_in,-2147483648)
          and coalesce(:id_tovar_in, 2147483647))
        /*$$IBEC$$ and t.tara<>1 $$IBEC$$*/
      order by ot.id_pos
      into :tara, :id_tovar,:id_pos,:id_nakld,
        :cena,:skidka,:kolotp,:id_analog
    do begin
      select Round(dzero(sum(pr.kredit),sum(pr.kredit_kolotp),0),5)
        from provodki pr
        where 
          pr.tip<>1 and
          pr.id_schet=:id_schet_sebest and
          pr.sub1=:id_tovar and
          pr.sub2=:id_sklad_seb and
          pr.id_nakl=:id_nakl2 and
          pr.attr1=:id_nakld and
          pr.kredit_kolotp>0
        into :CENA_SEBEST;
      cena_from_price=null;
      
      select  Round(r.resurs1,2),    r.dat,r.id_nakl
        from rep_registry_last_pc(:id_registr_price,:dat,
          :id_analog, :id_price_post,null) r
        into :cena_from_price, :dat_price,:id_nakl_price;
      if (:include_nds_price=1) then begin
        cena_with_nds_in_price_currency=Round(cena*(1+nalog_nds),2);
      end else begin/*if (include_nds_price=1)*/
        cena_with_nds_in_price_currency=Round(cena,2);
      end/*if (include_nds_price=1)*/
      if (:tara=1 ) then begin
        cena_with_nds_in_price_currency=Round(cena_with_nds_in_price_currency*kurs_price,2);
      end else begin
        cena_with_nds_in_price_currency=Round(cena_with_nds_in_price_currency*kurs*kurs_price,2);
      end
      /*price_minus_18_compare=null;
      if (cena_from_price is not null) then begin*/
        price_minus_18_compare= Round((1-dzero(
          cena_with_nds_in_price_currency,
          cena_from_price,0))*100,2);
      /*end*/

      cena_grn=case when tara=1 then cena else cena*kurs end;
      suspend;
    end /*for tovar*/
  end /*for nakl*/
end
^

ALTER PROCEDURE SRAVNPRICE_MAKE_SPEC_PC(
    ID_POST INTEGER,
    COMMENT VARCHAR(50),
    MODE INTEGER,
    ID_CURRENCY INTEGER,
    PARENT_ID_NAKL INTEGER)
RETURNS (
    ID_NAKL INTEGER)
AS
  declare variable id_price integer;
  declare variable id_currency_temp integer;
  declare variable include_nds integer;
  declare variable dat date;
  declare variable nalog_nds double precision;
  declare variable id_zak integer;
  declare variable attr_nepl_nds varchar(250);
  declare variable id_manager integer;
begin
  select k.id_price
    from klient_all_vw k
    where k.id=:id_post
    into :id_price;
  select p.id_currency,p.include_nds
    from spr_price_vw p
    where p.oid=:id_price
    into :id_currency_temp,:include_nds;    
  if (mode=1) then begin
    id_currency_temp=id_currency;
  end
  dat=extractdate(current_timestamp);
  select nds
    from get_nds(:dat, null)
    into :nalog_nds;
  select v.id
    from vlad_vw v
    where v.isdefault=1
    into :id_zak;
  select a.value1
    from attributes a
    where a.oid=:id_post and a.attribute_id=1
    into :attr_nepl_nds;
  if ('Неплательщик НДС'=attr_nepl_nds) then begin
    nalog_nds=0;
  end
  id_nakl=gen_id(naklo_gen,1);
  select m.id_manager
    from get_id_manager_pc m
    into :id_manager;
  insert into spec_vw(id_nakl,id,dat,
      id_izg,id_zak,id_manager,id_currency,
      nalog_nds,nds,kurs,
      posted,blocked,delmarked,
      comment,parent_id_nakl)
    values (:id_nakl, :id_nakl,:dat, 
      :id_post,:id_zak,:id_manager,:id_currency_temp,
      :nalog_nds,0,1,
      0,0,0,
      :comment,:parent_id_nakl
    );
end
^

ALTER PROCEDURE TEMP72_KLIENT_PC
RETURNS (
    OID INTEGER,
    NAME VARCHAR(50),
    DELMARKED SMALLINT)
AS
  declare variable oid_manager integer;
begin
  for
    SELECT oid
    FROM trees_read_pc(3023,3022,4)
    into :oid_manager
  do begin
    for
      select k.id, k.name,k.delmarked
      from klient_all_vw k
      where k.id_manager=:oid_manager
      into :oid,:name,:delmarked
    do begin
      suspend;
    end/*for*/
  end
end
^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring privileges */
/*-------------------------------------------------------------------------*/

GRANT SELECT ON KLIENT_ALL_VW TO PROCEDURE REP_KLIENT_LAST_CONTACT_PC;
GRANT SELECT ON KLIENT_ALL_VW TO PROCEDURE REP_SEBEST4_REC_PC;
GRANT SELECT ON KLIENT_ALL_VW TO PROCEDURE SRAVNPRICE_MAKE_SPEC_PC;
GRANT SELECT ON KLIENT_ALL_VW TO PROCEDURE TEMP72_KLIENT_PC;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON KLIENT_ALL_VW TO VLASOVA;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON KLIENT_ALL_VW TO BOSSES;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON KLIENT_ALL_VW TO BUXG;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON KLIENT_ALL_VW TO MANAGER;
GRANT SELECT, UPDATE, REFERENCES ON KLIENT_ALL_VW TO OFFICEMANAGER;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON KLIENT_ALL_VW TO POWER_USER;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON KLIENT_ALL_VW TO SKLAD;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON KLIENT_ALL_VW TO SNAB;


GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER KLIENT_ALL_VW_AU0;
GRANT SELECT,UPDATE ON OBJECTS TO TRIGGER KLIENT_ALL_VW_AU0;
GRANT SELECT,UPDATE ON KLIENT TO TRIGGER KLIENT_ALL_VW_AU0;
GRANT EXECUTE ON PROCEDURE GET_ID_MANAGER_PC TO TRIGGER KLIENT_ALL_VW_AU0;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER KLIENT_ALL_VW_BI0;
GRANT INSERT ON OBJECTS TO TRIGGER KLIENT_ALL_VW_BI0;
GRANT INSERT ON KLIENT TO TRIGGER KLIENT_ALL_VW_BI0;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_KLIENT_LAST_CONTACT_PC;
GRANT SELECT ON NAKLO TO PROCEDURE REP_KLIENT_LAST_CONTACT_PC;
GRANT SELECT ON KLIENT_ALL_VW TO PROCEDURE REP_KLIENT_LAST_CONTACT_PC;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_SEBEST4_REC_PC;
GRANT SELECT ON KLIENT_ALL_VW TO PROCEDURE REP_SEBEST4_REC_PC;
GRANT SELECT ON SPR_PRICE_VW TO PROCEDURE REP_SEBEST4_REC_PC;
GRANT SELECT ON NAKLO TO PROCEDURE REP_SEBEST4_REC_PC;
GRANT EXECUTE ON PROCEDURE KURS_GET_PC TO PROCEDURE REP_SEBEST4_REC_PC;
GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_SETTINGS_PC TO PROCEDURE REP_SEBEST4_REC_PC;
GRANT SELECT ON NAKLOT TO PROCEDURE REP_SEBEST4_REC_PC;
GRANT SELECT ON TOVAR TO PROCEDURE REP_SEBEST4_REC_PC;
GRANT SELECT ON PROVODKI TO PROCEDURE REP_SEBEST4_REC_PC;
GRANT EXECUTE ON PROCEDURE REP_REGISTRY_LAST_PC TO PROCEDURE REP_SEBEST4_REC_PC;
GRANT SELECT ON KLIENT_ALL_VW TO PROCEDURE SRAVNPRICE_MAKE_SPEC_PC;
GRANT SELECT ON SPR_PRICE_VW TO PROCEDURE SRAVNPRICE_MAKE_SPEC_PC;
GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE SRAVNPRICE_MAKE_SPEC_PC;
GRANT SELECT ON VLAD_VW TO PROCEDURE SRAVNPRICE_MAKE_SPEC_PC;
GRANT SELECT ON ATTRIBUTES TO PROCEDURE SRAVNPRICE_MAKE_SPEC_PC;
GRANT EXECUTE ON PROCEDURE GET_ID_MANAGER_PC TO PROCEDURE SRAVNPRICE_MAKE_SPEC_PC;
GRANT INSERT ON SPEC_VW TO PROCEDURE SRAVNPRICE_MAKE_SPEC_PC;
GRANT EXECUTE ON PROCEDURE TREES_READ_PC TO PROCEDURE TEMP72_KLIENT_PC;
GRANT SELECT ON KLIENT_ALL_VW TO PROCEDURE TEMP72_KLIENT_PC;
