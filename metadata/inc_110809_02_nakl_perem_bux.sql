/*-------------------------------------------------------------------------*/
/* First procedures with empty bodies */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE NAKLO_MAKE_NAKL_PEREM_BUX_PC(
    ID_NAKL_IN INTEGER)
RETURNS (
    ID_NAKL INTEGER)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE REP_NAKL_PEREM_BUX_PC(
    ID_NAKL_IN INTEGER,
    MODE_IN INTEGER)
RETURNS (
    ID_POS INTEGER,
    ID_NAKLD INTEGER,
    ID_NAKL INTEGER,
    ID_TOVAR INTEGER,
    KOLOTP NUMERIC(15,4),
    CENA DOUBLE PRECISION,
    NALOG_NDS DOUBLE PRECISION,
    SUMA DOUBLE PRECISION)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Dropping old views */
/*-------------------------------------------------------------------------*/

DROP VIEW NAKL_PEREM_BUX_VW;

/*-------------------------------------------------------------------------*/
/* Creating new views */
/*-------------------------------------------------------------------------*/

CREATE VIEW NAKL_PEREM_BUX_VW(
    ID_NAKL,
    ID,
    KURS,
    NDS,
    DAT,
    ID_IZG,
    ID_ZAK,
    ID_MANAGER,
    NALOG_NDS,
    POSTED,
    BLOCKED,
    DELMARKED,
    ID_CURRENCY,
    ID_SKLAD,
    ID_SKLAD_TO,
    COMMENT,
    ID_VYGRUZKA,
    ZATRATY,
    KURS_INDIRECT,
    ID_CURRENCY_TO,
    NDS_FROM)
AS
select 
  om.id_nakl,om.id,om.kurs,
  om.nds,
  om.dat,
  om.id_izg,om.id_zak, om.id_manager,
  om.nalog_nds,
  om.posted,
  om.blocked,
  om.delmarked,
  om.id_currency,
  om.id_sklad,
  om.id_sklad_to,
  om.comment,
  om.PARENT_ID_NAKL,
  om.ZATRATY,
  om.KURS_INDIRECT,
  om.ID_CURRENCY_TO,
  om.NDS_FROM
from 
  naklo om, rdb$database
where
  om.tip = -87 /*¡”’√¿À“≈–— Œ≈ œ≈–≈Ã≈Ÿ≈Õ»≈*/
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

CREATE TRIGGER NAKL_PEREM_BUX_VW_BI FOR NAKL_PEREM_BUX_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER NAKL_PEREM_BUX_VW_BU FOR NAKL_PEREM_BUX_VW
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

ALTER TRIGGER NAKL_PEREM_BUX_VW_BI
AS
  declare variable classid integer;
begin
  if (new.id_nakl is null) then begin
    NEW.ID_NAKL = GEN_ID(NAKLO_GEN,1);
  end
  select oid
    from GET_OID_OBJECTS_PC('¡”’√¿À“≈–— Œ≈ œ≈–≈Ã≈Ÿ≈Õ»≈',-100)
    into :classid;
  /*◊ÚÓ·˚ ‚ ÓÚ˜∏Ú‡ı ÔÓÎÂ ·˚ÎÓ Á‡ÔÓÎÌÂÌÌ˚Ï*/
  if (new.id_zak is null) then begin
    new.id_zak=new.id_izg;
  end
  insert into naklo (id_nakl,id,kurs,nds,dat,id_izg,id_zak,
    id_manager,nalog_nds,posted,blocked,delmarked,
    comment,
    id_currency,parent_id_nakl,zatraty,
    tip,id_currency_to,kurs_indirect,nds_from,
    id_sklad,id_sklad_to)
  values (new.id_nakl,new.id,new.kurs,new.nds,new.dat,new.id_izg,new.id_zak,
    new.id_manager,new.nalog_nds,new.posted,new.blocked,new.delmarked,
    new.comment,
    new.id_currency, new.id_vygruzka, new.zatraty,
    :classid, new.id_currency_to, new.kurs_indirect, new.nds_from,
    new.id_sklad,new.id_sklad_to);
end^

ALTER TRIGGER NAKL_PEREM_BUX_VW_BU
AS
  declare variable data_fields_change integer;
  declare variable classid integer;
begin
   if ((z(new.id_nakl)<>z(old.id_nakl)) or (trim(new.id)<>trim(old.id)) or
   (z(new.kurs)<>z(old.kurs)) or (z(new.nds)<>z(old.nds)) or
   (z(new.id_izg)<>z(old.id_izg)) or
   (z(new.id_manager)<>z(old.id_manager)) or (z(new.nalog_nds)<>z(old.nalog_nds)) or
   (z(new.id_currency)<>z(old.id_currency)) or (z(new.id_sklad)<>z(old.id_sklad)) or
   (trim(new.comment)<>trim(old.comment)) or (z(new.id_vygruzka)<>z(old.id_vygruzka)) or
   (ExtractDate(new.dat)<>ExtractDate(old.dat)) or
   (z(new.id_currency_to)<>z(old.id_currency_to)) or
   (z(new.nds_from)<>z(old.nds_from)) or
   (z(new.kurs_indirect)<>z(old.kurs_indirect)) or
   (z(new.zatraty)<>z(old.zatraty))
   ) then begin
    data_fields_change=1;
  end else begin
    data_fields_change=0;
  end
  execute procedure can_modify_naklo(new.id_nakl,:data_fields_change);
  
  /*◊ÚÓ·˚ ‚ ÓÚ˜∏Ú‡ı ÔÓÎÂ ·˚ÎÓ Á‡ÔÓÎÌÂÌÌ˚Ï*/
  if (new.id_zak is null) then begin
    new.id_zak=new.id_izg;
  end
  
  select oid
    from GET_OID_OBJECTS_PC('¡”’√¿À“≈–— Œ≈ œ≈–≈Ã≈Ÿ≈Õ»≈',-100)
    into :classid;  
  update naklo om
  set
    om.id_nakl=new.id_nakl,
    om.id=new.id,
    om.kurs=new.kurs,
    om.nds=new.nds,
    om.dat=new.dat,
    om.id_izg=new.id_izg,
    om.id_zak=new.id_zak,
    om.id_manager=new.id_manager,
    om.id_sklad=new.id_sklad, 
    om.nalog_nds=new.nalog_nds,
/*$$IBEC$$     om.posted = new.posted, $$IBEC$$*/
    om.blocked = new.blocked,
    om.delmarked = new.delmarked,
    om.id_currency = new.id_currency,
    om.comment = new.comment,
    om.parent_id_nakl=new.id_vygruzka,
    om.zatraty=z(new.zatraty),
    om.id_currency_to = new.id_currency_to,
    om.kurs_indirect = new.kurs_indirect,
    om.nds_from=new.nds_from,
    om.id_sklad_to=new.id_sklad_to
  where
    om.id_nakl=old.id_nakl and
      om.tip=:classid;
end^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring bodies of procedures */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE NAKLO_MAKE_NAKL_PEREM_BUX_PC(
    ID_NAKL_IN INTEGER)
RETURNS (
    ID_NAKL INTEGER)
AS
declare variable delmarked integer;
  declare variable id_sklad integer;
  declare variable id_sklad_to integer;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_currency integer;
  declare variable sTemp varchar(250);
  declare variable fr varchar(5);
  declare variable id varchar(20);
  declare variable id_manager integer;
  declare variable posted integer;
  declare variable tip integer;
  declare variable parent_id_nakl integer;
  declare variable nds double precision;
  declare variable kurs double precision;
  declare variable nalog_nds double precision;
  declare variable dat date;
  declare variable tip_nakl_perem_bux integer;
begin
  select oid
    from get_oid_objects_pc('¡”’√¿À“≈–— Œ≈ œ≈–≈Ã≈Ÿ≈Õ»≈',-100)
    into :tip_nakl_perem_bux;
  select
      n.delmarked,n.id_sklad,n.tip,n.dat,
      n.parent_id_nakl,n.nds,n.kurs,n.nalog_nds,
      n.id_izg,n.id_zak,n.id_manager,n.id_sklad_to,
      n.id_currency
    from naklo n
    where n.id_nakl = :id_nakl_in
    into
      :delmarked,:id_sklad,:tip,:dat,
      :parent_id_nakl,:nds,:kurs,:nalog_nds,
      :id_izg,:id_zak,:id_manager,:id_sklad_to,
      :id_currency;
  if (tip not in (5,103,3047)) then  begin
    sTemp ='Œ¯Ë·Í‡. –‡ÒıÓ‰ÌÛ˛ ÏÓÊÌÓ ÒÓÁ‰‡Ú¸ ÚÓÎ¸ÍÓ ËÁ ÓÚ„ÛÁÍË ËÎË ı‡ÌÂÌËˇ';
    execute procedure error(sTemp);
  end
  

  
  fr='·/Ì';
  id=gen_id(naklr_gen_id,1);
  id_nakl=gen_id(naklo_gen,1);
  posted=1;
  insert into nakl_perem_bux_vw (id_nakl,id,kurs,
      nds,dat,id_izg,id_zak, id_manager,
      nalog_nds,delmarked,id_currency,
      id_sklad,id_sklad_to)
    values (:id_nakl,:id,:kurs,
      :nds,:dat,:id_izg,:id_zak, :id_manager,
      :nalog_nds,:delmarked,:id_currency,
      :id_sklad,:id_sklad_to);
  execute procedure NAKLOT_DOC_COPY_PC(:id_nakl, :id_nakl_in,
    :tip_nakl_perem_bux, 1);

/*$$IBEC$$   execute procedure naklr_post_pc(:id_nakl,null); $$IBEC$$*/
  suspend;
end
^

ALTER PROCEDURE REP_NAKL_PEREM_BUX_PC(
    ID_NAKL_IN INTEGER,
    MODE_IN INTEGER)
RETURNS (
    ID_POS INTEGER,
    ID_NAKLD INTEGER,
    ID_NAKL INTEGER,
    ID_TOVAR INTEGER,
    KOLOTP NUMERIC(15,4),
    CENA DOUBLE PRECISION,
    NALOG_NDS DOUBLE PRECISION,
    SUMA DOUBLE PRECISION)
AS
declare variable id_schet_tip integer;
declare variable id_schet_bux integer;
declare variable id_schet_bux_tara integer;
declare variable dat date;
begin
  /*»‰ÂÌÚËÙËÍ‡ÚÓ˚*/
  select oid
    from GET_OID_OBJECTS_PC('“»œ —◊≈“¿',-100)
    into :id_schet_tip;
  select oid
    from GET_OID_OBJECTS_PC('—≈¡≈—“Œ»ÃŒ—“‹ ¡”’',:id_schet_tip)
    into :id_schet_bux;
  select oid
    from GET_OID_OBJECTS_PC('—≈¡≈—“Œ»ÃŒ—“‹ ¡”’ “¿–¿',:id_schet_tip)
    into :id_schet_bux_tara;
  if (mode_in is null) then begin
    mode_in=0;
  end
  if (mode_in=1) then begin
    select dat
      from nakl_perem_bux_vw om
      where om.id_nakl=:id_nakl_in
      into :dat;
  end
  for
    select 
      d.id_nakld, d.id_nakl, d.id_pos, d.id_tovar, d.kolotp
    from 
      nakl_perem_bux_det_vw d 
    where 
      d.id_nakl=:id_nakl_in
    order by d.id_pos
    into
     :id_nakld,:id_nakl,:Id_pos,:id_tovar,:kolotp
  do begin
    if (mode_in=0) then begin
      FOR
        select Round(dzero(pr.kredit,pr.kredit_kolotp,0),2),
            pr.kredit_kolotp
          from provodki pr
          where pr.id_schet in (:id_schet_bux,:id_schet_bux_tara)
            and pr.id_nakl=:id_nakl
            and pr.attr1=:id_nakld
            and pr.kredit_kolotp>0
          into :cena,:kolotp
      DO  begin
        Suma=Round(z(cena*kolotp),2);
        suspend;
      end
    end /*if (mode_in=0)*/
    if (mode_in=1) then begin
      cena=null;
      select round(cena,2)
        from get_price_default_pc(null,:id_tovar,null,:dat,0)
        into :cena;
      Suma=Round(z(cena*kolotp),2);
      suspend;
    end /*if (mode_in=1)*/
  end /*FOR nakl_perem_bux_det_vw*/
END
^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring privileges */
/*-------------------------------------------------------------------------*/

GRANT SELECT ON NAKLO TO VIEW NAKL_PEREM_BUX_VW;
GRANT UPDATE, REFERENCES ON NAKL_PEREM_BUX_VW TO TRIGGER NAKL_PEREM_BUX_VW_AU;
GRANT UPDATE, REFERENCES ON NAKL_PEREM_BUX_VW TO TRIGGER NAKL_PEREM_BUX_VW_BI;
GRANT INSERT ON NAKL_PEREM_BUX_VW TO PROCEDURE NAKLO_MAKE_NAKL_PEREM_BUX_PC;
GRANT SELECT, UPDATE ON NAKL_PEREM_BUX_VW TO PROCEDURE NAKL_PEREM_BUX_POST_PC;
GRANT SELECT, UPDATE ON NAKL_PEREM_BUX_VW TO PROCEDURE NAKL_PEREM_BUX_UNPOST_PC;
GRANT SELECT ON NAKL_PEREM_BUX_VW TO PROCEDURE REP_NAKL_PEREM_BUX_PC;
GRANT SELECT, REFERENCES ON NAKL_PEREM_BUX_VW TO BOSSES;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON NAKL_PEREM_BUX_VW TO BUXG;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON NAKL_PEREM_BUX_VW TO POWER_USER;
GRANT SELECT, UPDATE, INSERT, REFERENCES ON NAKL_PEREM_BUX_VW TO SKLAD;


GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER NAKL_PEREM_BUX_VW_BI;
GRANT INSERT ON NAKLO TO TRIGGER NAKL_PEREM_BUX_VW_BI;
GRANT EXECUTE ON PROCEDURE CAN_MODIFY_NAKLO TO TRIGGER NAKL_PEREM_BUX_VW_BU;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER NAKL_PEREM_BUX_VW_BU;
GRANT SELECT,UPDATE ON NAKLO TO TRIGGER NAKL_PEREM_BUX_VW_BU;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLO_MAKE_NAKL_PEREM_BUX_PC;
GRANT SELECT ON NAKLO TO PROCEDURE NAKLO_MAKE_NAKL_PEREM_BUX_PC;
GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE NAKLO_MAKE_NAKL_PEREM_BUX_PC;
GRANT INSERT ON NAKL_PEREM_BUX_VW TO PROCEDURE NAKLO_MAKE_NAKL_PEREM_BUX_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_DOC_COPY_PC TO PROCEDURE NAKLO_MAKE_NAKL_PEREM_BUX_PC;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_NAKL_PEREM_BUX_PC;
GRANT SELECT ON NAKL_PEREM_BUX_VW TO PROCEDURE REP_NAKL_PEREM_BUX_PC;
GRANT SELECT ON NAKL_PEREM_BUX_DET_VW TO PROCEDURE REP_NAKL_PEREM_BUX_PC;
GRANT SELECT ON PROVODKI TO PROCEDURE REP_NAKL_PEREM_BUX_PC;
GRANT EXECUTE ON PROCEDURE GET_PRICE_DEFAULT_PC TO PROCEDURE REP_NAKL_PEREM_BUX_PC;
