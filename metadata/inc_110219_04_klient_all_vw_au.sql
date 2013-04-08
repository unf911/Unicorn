SET TERM ^ ;



CREATE OR ALTER TRIGGER KLIENT_ALL_VW_AU0 FOR KLIENT_ALL_VW
ACTIVE AFTER UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


CREATE OR ALTER TRIGGER KLIENT_ALL_VW_AU0 FOR KLIENT_ALL_VW
ACTIVE AFTER UPDATE POSITION 0
AS
  declare variable classid integer;
  declare variable id_manager integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('��� �����',-100)
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
      delmarked=new.delmarked
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
end
^


SET TERM ; ^


/* Privileges of triggers */
GRANT SELECT, UPDATE ON KLIENT TO TRIGGER KLIENT_ALL_VW_AU0;
GRANT SELECT, UPDATE ON OBJECTS TO TRIGGER KLIENT_ALL_VW_AU0;
GRANT EXECUTE ON PROCEDURE GET_ID_MANAGER_PC TO TRIGGER KLIENT_ALL_VW_AU0;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER KLIENT_ALL_VW_AU0;
