/*-------------------------------------------------------------------------*/
/* First procedures with empty bodies */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE DELMARK_OBJECT_PC(
    OID INTEGER,
    CLASSID INTEGER)
AS
BEGIN
  EXIT;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE MAKE_FIN_TRASH(
    ID INTEGER)
RETURNS (
    RESULT DOUBLE PRECISION)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE NAKLO_MAKE_NAKLR_PC(
    ID_NAKL_IN INTEGER)
RETURNS (
    ID_NAKL INTEGER)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE REP_SKLAD_BUX_VYR_RASXOD_PC(
    DAT TIMESTAMP,
    ID_IZG INTEGER,
    ID_SKLAD INTEGER)
RETURNS (
    ID_NAKL INTEGER)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Dropping old views */
/*-------------------------------------------------------------------------*/

DROP VIEW REALPRICE_VW;

DROP VIEW NAKLR_VW;

/*-------------------------------------------------------------------------*/
/* Creating new views */
/*-------------------------------------------------------------------------*/

CREATE VIEW NAKLR_VW(
    ID_NAKL,
    ID,
    KURS,
    NDS,
    DAT,
    ID_IZG,
    ID_ZAK,
    ID_MANAGER,
    NALOG_NDS,
    SCH,
    DOV,
    DDO,
    LICO,
    FR,
    POSTED,
    BLOCKED,
    DELMARKED,
    ID_CURRENCY,
    ID_SKLAD,
    ID_SKLAD_TO,
    COMMENT,
    ID_XOZ_OPER,
    ID_VYGRUZKA)
AS
select 
  om.id_nakl,om.id,om.kurs,
  om.nds,
  om.dat,
  om.id_izg,om.id_zak, om.id_manager,
  om.nalog_nds,
  n.sch, n.dov, n.ddo, n.lico,n.fr,
  om.posted,
  om.blocked,
  om.delmarked,
  om.id_currency,
  om.id_sklad,
  om.id_sklad_to,
  om.comment,
  om.id_currency_to,
  om.parent_id_nakl
from
  naklr n inner join naklo om on om.id_nakl=n.id_nakl
where
  om.tip = 3047
;
CREATE VIEW REALPRICE_VW(
    ID,
    DAT,
    DAT_FACT,
    NDS_FACT,
    ID_IZG,
    ID_ZAK,
    ID_MANAGER,
    ID_NAKL,
    NDS,
    COMMENT)
AS
select om.id, om.dat,
    /*$$IBEC$$ max(om2.dat) as dat_fact, $$IBEC$$*/
    /*$$IBEC$$ sum(om2.nds) as nds_fact, $$IBEC$$*/
    (select max(om2.dat)
      from naklo om2
      where om.id_nakl=om2.parent_id_nakl and
        om2.delmarked=0 and
        om2.tip= (select oid from get_oid_objects_pc('Отгрузка',101))
    ) as dat_fact,
    (select sum(om2.nds)
      from naklo om2
      where om.id_nakl=om2.parent_id_nakl and
        om2.delmarked=0 and
        om2.tip= (select oid from get_oid_objects_pc('Отгрузка',101))
    ) as nds_fact,
    om.id_izg, om.id_zak, om.id_manager,
    om.id_nakl, om.nds, om.comment
  from
    naklr_vw om/*$$IBEC$$  left join naklo om2 on
      om.id_nakl=om2.parent_id_nakl and
      om2.delmarked=0 and
      om2.tip= (select oid from get_oid_objects_pc('Отгрузка',101)) $$IBEC$$*/
      
  where  om.delmarked=0
    /*$$IBEC$$ and om.dat between '01.11.06' and '30.11.06' $$IBEC$$*/
  group by om.id, om.id_nakl, om.dat,
    om.id_izg, om.id_zak, om.id_manager,
    om.nds, om.delmarked, om.dat,
    om.comment
  /*order by om.dat,om.id*/
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

CREATE TRIGGER NAKLR_VW_AU10 FOR NAKLR_VW
ACTIVE AFTER UPDATE POSITION 10
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER NAKLR_VW_BI0 FOR NAKLR_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

ALTER TRIGGER NAKLR_VW_AU10
as
  declare variable fk1 integer;
  declare variable data_fields_change integer;
  declare variable posted integer;
  declare variable delmarked integer;
begin
  if ((z(new.id_nakl)<>z(old.id_nakl)) or (trim(new.id)<>trim(old.id)) or
   (z(new.kurs)<>z(old.kurs)) or (z(new.nds)<>z(old.nds)) or
   (z(new.id_izg)<>z(old.id_izg)) or
   (z(new.id_zak)<>z(old.id_zak)) or
   (trim(new.dov)<>trim(old.dov)) or
   (trim(new.lico)<>trim(old.lico)) or
   (trim(new.fr)<>trim(old.fr)) or
   (extractdate(new.ddo)<>extractdate(old.ddo)) or
   (z(new.id_manager)<>z(old.id_manager)) or (z(new.nalog_nds)<>z(old.nalog_nds)) or
   (z(new.id_currency)<>z(old.id_currency)) or (z(new.id_sklad)<>z(old.id_sklad)) or
   (z(new.id_sklad_to)<>z(old.id_sklad_to)) or
   (extractdate(new.dat)<>extractdate(old.dat)) or
   (z(new.id_vygruzka)<>z(old.id_vygruzka))


   ) then begin
    data_fields_change=1;
  end else begin
    data_fields_change=0;
  end

  select om.delmarked,om.posted
    from naklo om
    where om.id_nakl=old.id_nakl
    into :delmarked,:posted;
  if (delmarked<>0 and data_fields_change<>0) then begin
    execute procedure error ('Запрещено менять удалённый документ');
  end
  if (posted<>0 and data_fields_change<>0) then begin
    execute procedure error ('Запрещено менять проведенный документ');
  end
  /*$$IBEC$$ execute procedure CAN_MODIFY_NAKLO (new.id_nakl,:data_fields_change); $$IBEC$$*/

  fk1=0;
  if (trim(new.comment)<>trim(old.comment)) then begin
    fk1=1;
  end

   /*если в расходной изменился комментарий про оплату отката*/
  if ((fk1=1) /*$$IBEC$$ and (is_allowed_to_post=0) $$IBEC$$*/) then begin
    if (not (user in ('MARINASH','SYSDBA','FRASINYUK','KIROVA')))  then begin
      exception otkat_opl;
    end
  end /*если в расходной изменился комментарий про оплату отката*/
  /*если в расходной изменилось поле "Оригинал доверенности получен"*/
  if (trim(new.blocked)<>trim(old.blocked)) then begin
    if (not (current_role in ('BUXG','POWER_USER')) and (not (user='SYSDBA')))  then begin
      execute procedure error('Запрещено менять поле "Оригинал доверенности получен"');
    end    
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
    om.nalog_nds=new.nalog_nds,
    om.posted = new.posted,
    om.blocked = new.blocked,
    om.delmarked = new.delmarked,
    om.id_currency = new.id_currency,
    om.id_sklad = new.id_sklad,
    om.id_sklad_to = new.id_sklad_to,
    om.comment=new.comment,
    om.id_currency_to=new.id_xoz_oper ,
    om.parent_id_nakl=new.id_vygruzka
  where om.id_nakl=old.id_nakl;

  update naklr n
  set n.sch=new.sch,
    n.dov=new.dov,
    n.ddo=new.ddo,
    n.lico=new.lico,
    n.fr=new.fr,
    n.id_nakl=new.id_nakl
  where
    n.id_nakl=old.id_nakl;
end^

ALTER TRIGGER NAKLR_VW_BI0
as
begin
  if (new.id_nakl is null) then begin
    new.id_nakl = gen_id(naklo_gen,1);
  end
  insert into naklo (id_nakl,id,kurs,nds,dat,id_izg,id_zak,
     id_manager,comment, 
     nalog_nds,posted,blocked,delmarked,
     id_currency,id_sklad,id_sklad_to,tip,id_currency_to,
     parent_id_nakl)
    values (new.id_nakl,new.id,new.kurs,new.nds,new.dat,new.id_izg,new.id_zak,
      new.id_manager,new.comment, new.nalog_nds,0/*new.posted*/,new.blocked,new.delmarked,
      new.id_currency,new.id_sklad,new.id_sklad_to,3047,new.id_xoz_oper,
      new.id_vygruzka);
  insert into naklr (id_nakl,sch,dov,ddo,lico,fr) values
   (new.id_nakl,new.sch,new.dov,new.ddo,new.lico,new.fr);
end^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring bodies of procedures */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE DELMARK_OBJECT_PC(
    OID INTEGER,
    CLASSID INTEGER)
AS
  declare variable name varchar(50);
begin
  select name from get_name_objects_pc(:classid,-100) into :name;
  if (name='ОТПРАВКА') then begin/*отправки со склада*/
    update otpravki_vw om
      set om.delmarked=1
      where om.id_nakl=:oid;
    exit;
  end /*3042*/
  if (name='РАСХОДНЫЕ НАКЛАДНЫЕ') then begin/*расходные накладные*/
    if (exists (select * from naklr_vw om where om.id_nakl=:oid and om.posted=1)) then begin
      execute procedure error('Запрещено удалять проведенную накладную');
    end
    if (exists (select *
      from naklo om
      where om.parent_id_nakl = :oid and
        om.tip=5)) then begin
      execute procedure error('Запрещено удалять расходную накладную с которой связана хоть одна отгрузочная накладная');
    end
    update naklr_vw om
      set om.delmarked=1
      where om.id_nakl=:oid;
    exit;
  end
  if (name='СПЕЦИФИКАЦИЯ') then begin/*расходные накладные*/
    update spec_vw om
      set om.delmarked=1
      where om.id_nakl=:oid;
    exit;
  end  
  if (name='ПРИХОДНЫЕ НАКЛАДНЫЕ ЗАТРАТЫ') then begin
    update naklp_zatr_vw om
      set om.delmarked=1
      where om.id_nakl=:oid;
    exit;
  end

  /*по умолчанию просто ставиться галочка на поле delmarked*/
  update naklo om
    set om.delmarked=1
    where om.id_nakl=:oid and om.delmarked=0;
end
^

ALTER PROCEDURE MAKE_FIN_TRASH(
    ID INTEGER)
RETURNS (
    RESULT DOUBLE PRECISION)
AS
declare variable dat date;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_nakl integer;
  declare variable id_manager integer;
  declare variable opl numeric(15,4);
  declare variable potracheno numeric (15,4);
  declare variable nakl_id integer;
  declare variable vid_dost_samovyvoz integer;
begin

  select
    dat,id_izg,id_zak,id_manager,nds,
    (select cast(z(sum(t.transh)) as numeric(15,4))
      from oplnakl t
      where t.id_from=o.id_nakl
    ) as potracheno
  from naklo o
  where o.tip=  (select oid
      from get_oid_objects_pc('ОПЛАТЫ',-100)) and
    o.id_nakl=:id
    into :dat,:id_izg,
      :id_zak,:id_manager,:opl,:potracheno;
      
  id_nakl = gen_id(naklo_gen,1);
  nakl_id=gen_id(naklr_gen,1);
  select oid from get_oid_objects_pc('ВИД ДОСТАВКИ',-100) into :vid_dost_samovyvoz;
  select oid from get_oid_predefined_pc('САМОВЫВОЗ',:vid_dost_samovyvoz) into :vid_dost_samovyvoz;
  insert into naklr_vw (
    id_nakl, dat, id_izg, id_zak, id_manager, id,
    nds, fr, kurs,
    nalog_nds,delmarked,id_sklad_to
     )
  values
    (:id_nakl, :dat, :id_izg, :id_zak,:id_manager,:nakl_id,
    round(:opl-:potracheno,2),
      'б/н', '1.000',
     (select nds from get_nds(:dat,null)),
     0,:vid_dost_samovyvoz
    );
   execute procedure naklr_post_pc(:id_nakl,null);
   execute procedure make_transh(1,:id,2,:id_nakl,1,0) returning_values (:result);
end
^

ALTER PROCEDURE NAKLO_MAKE_NAKLR_PC(
    ID_NAKL_IN INTEGER)
RETURNS (
    ID_NAKL INTEGER)
AS
declare variable delmarked integer;
  declare variable id_sklad integer;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_currency integer;
  declare variable stemp varchar(250);
  declare variable fr varchar(5);
  declare variable id varchar(20);
  declare variable id_manager integer;
  declare variable tip integer;
  declare variable parent_id_nakl integer;
  declare variable nds double precision;
  declare variable kurs double precision;
  declare variable nalog_nds double precision;
  declare variable dat date;
  declare variable parent_delmarked integer;
  declare variable tip_rasx_nakl integer;
begin
  select
      n.delmarked,n.id_sklad,n.tip,n.dat,
      n.parent_id_nakl,n.nds,n.kurs,n.nalog_nds,
      n.id_izg,n.id_zak,n.id_manager,
      n.id_currency
    from naklo n
    where n.id_nakl = :id_nakl_in
    into
      :delmarked,:id_sklad,:tip,:dat,
      :parent_id_nakl,:nds,:kurs,:nalog_nds,
      :id_izg,:id_zak,:id_manager,
      :id_currency;
  if (tip not in (5,103)) then  begin
    stemp ='Ошибка. Расходную можно создать только из отгрузки или хранения';
    execute procedure error(stemp);
  end
  
  if (parent_id_nakl is not null) then begin
    select delmarked
      from naklo om
      where om.id_nakl=:parent_id_nakl
      into :parent_delmarked;
    if (parent_delmarked=0) then begin
      stemp = 'Ошибка. Родительская расходная накладная уже существует';
      execute procedure error(stemp);
    end
  end
  
  fr='б/н';
  id=gen_id(naklr_gen_id,1);
  id_nakl=gen_id(naklo_gen,1);
  insert into naklr_vw (id_nakl,id,kurs,
      nds,dat,id_izg,id_zak, id_manager,
      nalog_nds,fr,delmarked,id_currency,
      id_sklad)
    values (:id_nakl,:id,:kurs,
      :nds,:dat,:id_izg,:id_zak, :id_manager,
      :nalog_nds,:fr,:delmarked,:id_currency,
      :id_sklad);
  select oid
    from get_oid_objects_pc('РАСХОДНЫЕ НАКЛАДНЫЕ',-100)
    into :tip_rasx_nakl;
  execute procedure naklot_doc_copy_pc(:id_nakl, :id_nakl_in, :tip_rasx_nakl, 2);
  /*привязка исходной отгрузки к созданной расходной накладной*/
  if (tip=5) then begin
    update naklo om
      set om.parent_id_nakl=:id_nakl
      where om.id_nakl=:id_nakl;
  end
  /*execute procedure naklr_post_pc(:id_nakl,null); */
  suspend;
end
^

ALTER PROCEDURE REP_SKLAD_BUX_VYR_RASXOD_PC(
    DAT TIMESTAMP,
    ID_IZG INTEGER,
    ID_SKLAD INTEGER)
RETURNS (
    ID_NAKL INTEGER)
AS
  declare variable id_manager integer;
  declare variable id_currency integer;
  declare variable nalog_nds double precision;
begin
  id_nakl = gen_id(naklo_gen, 1);
  select oid from get_oid_objects_pc('ТИП МЕНЕДЖЕРЫ',-100) into :id_manager;
  select oid from get_oid_objects_pc('ФИН',:id_manager) into :id_manager;
  select oid from get_oid_objects_pc('ТИП ВАЛЮТ',-100) into :id_currency;
  select oid from get_oid_objects_pc('UAH',:id_currency) into :id_currency;
  select nds
    from get_nds(:dat, :id_izg)
    into :nalog_nds;
  insert into naklr_vw
    (id_nakl,
    id,
    kurs,
    nds,
    dat,
    id_izg,
    id_zak,
    id_manager,
    nalog_nds,
    posted,
    blocked,
    delmarked,
    id_currency,
    id_sklad)
  values (
    :id_nakl,
    :id_nakl, 
    1,
    0,
    :dat,
    :id_izg,
    :id_izg,
    :id_manager,
    :nalog_nds,
    0,0,0,:id_currency,
    :id_sklad);
  suspend;
end
^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring privileges */
/*-------------------------------------------------------------------------*/

GRANT SELECT ON NAKLO TO VIEW NAKLR_VW;
GRANT SELECT ON NAKLR TO VIEW NAKLR_VW;
GRANT UPDATE, REFERENCES ON NAKLR_VW TO TRIGGER NAKLR_VW_AI;
GRANT UPDATE, REFERENCES ON NAKLR_VW TO TRIGGER NAKLR_VW_AU10;
GRANT UPDATE, REFERENCES ON NAKLR_VW TO TRIGGER NAKLR_VW_BI0;
GRANT SELECT, UPDATE ON NAKLR_VW TO PROCEDURE DELMARK_OBJECT_PC;
GRANT INSERT ON NAKLR_VW TO PROCEDURE MAKE_FIN_TRASH;
GRANT INSERT ON NAKLR_VW TO PROCEDURE NAKLO_MAKE_NAKLR_PC;
GRANT INSERT ON NAKLR_VW TO PROCEDURE REP_SKLAD_BUX_VYR_RASXOD_PC;
GRANT SELECT, REFERENCES ON NAKLR_VW TO BOSSES;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON NAKLR_VW TO BUXG;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON NAKLR_VW TO MANAGER;
GRANT SELECT ON NAKLR_VW TO OFFICEMANAGER;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON NAKLR_VW TO POWER_USER;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON NAKLR_VW TO SKLAD;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON NAKLR_VW TO SNAB;

GRANT SELECT, REFERENCES ON REALPRICE_VW TO BOSSES;
GRANT SELECT, REFERENCES ON REALPRICE_VW TO MANAGER;
GRANT SELECT, UPDATE, REFERENCES ON REALPRICE_VW TO POWER_USER;
GRANT SELECT, REFERENCES ON REALPRICE_VW TO SNAB;


GRANT SELECT,UPDATE ON NAKLO TO TRIGGER NAKLR_VW_AU10;
GRANT EXECUTE ON PROCEDURE ERROR TO TRIGGER NAKLR_VW_AU10;
GRANT SELECT,UPDATE ON NAKLR TO TRIGGER NAKLR_VW_AU10;
GRANT INSERT ON NAKLO TO TRIGGER NAKLR_VW_BI0;
GRANT INSERT ON NAKLR TO TRIGGER NAKLR_VW_BI0;
GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE DELMARK_OBJECT_PC;
GRANT SELECT,UPDATE ON OTPRAVKI_VW TO PROCEDURE DELMARK_OBJECT_PC;
GRANT SELECT,UPDATE ON NAKLR_VW TO PROCEDURE DELMARK_OBJECT_PC;
GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE DELMARK_OBJECT_PC;
GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE DELMARK_OBJECT_PC;
GRANT SELECT,UPDATE ON SPEC_VW TO PROCEDURE DELMARK_OBJECT_PC;
GRANT SELECT,UPDATE ON NAKLP_ZATR_VW TO PROCEDURE DELMARK_OBJECT_PC;
GRANT SELECT ON OPLNAKL TO PROCEDURE MAKE_FIN_TRASH;
GRANT SELECT ON NAKLO TO PROCEDURE MAKE_FIN_TRASH;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE MAKE_FIN_TRASH;
GRANT EXECUTE ON PROCEDURE GET_OID_PREDEFINED_PC TO PROCEDURE MAKE_FIN_TRASH;
GRANT INSERT ON NAKLR_VW TO PROCEDURE MAKE_FIN_TRASH;
GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE MAKE_FIN_TRASH;
GRANT EXECUTE ON PROCEDURE NAKLR_POST_PC TO PROCEDURE MAKE_FIN_TRASH;
GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO PROCEDURE MAKE_FIN_TRASH;
GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE NAKLO_MAKE_NAKLR_PC;
GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE NAKLO_MAKE_NAKLR_PC;
GRANT INSERT ON NAKLR_VW TO PROCEDURE NAKLO_MAKE_NAKLR_PC;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLO_MAKE_NAKLR_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_DOC_COPY_PC TO PROCEDURE NAKLO_MAKE_NAKLR_PC;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_SKLAD_BUX_VYR_RASXOD_PC;
GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE REP_SKLAD_BUX_VYR_RASXOD_PC;
GRANT INSERT ON NAKLR_VW TO PROCEDURE REP_SKLAD_BUX_VYR_RASXOD_PC;

