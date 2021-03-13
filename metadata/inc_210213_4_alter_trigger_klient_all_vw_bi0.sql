SET TERM ^ ;

CREATE OR ALTER trigger klient_all_vw_bi0 for klient_all_vw
active before insert position 0
AS
  declare variable classid integer;
begin
  if (new.id is null) then begin
    NEW.id = GEN_ID(oid_gen,1);
  end
  select oid
    from GET_OID_OBJECTS_PC('��� �����',-100)
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
    NOMER_FILIALA,
    kod_reestra)
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
    NEW.NOMER_FILIALA,
    NEW.kod_reestra);
end
^

SET TERM ; ^


