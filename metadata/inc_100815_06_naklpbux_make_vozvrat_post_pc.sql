SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLPBUX_MAKE_VOZVRAT_POST_PC(
    ID_NAKL_IN INTEGER)
RETURNS (
    ID_NAKL INTEGER)
AS
declare variable id_sklad integer;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_currency integer;
  declare variable id_manager integer;
  declare variable tip integer;
  declare variable parent_id_nakl integer;
  declare variable kurs double precision;
  declare variable nalog_nds double precision;
  declare variable tip_name varchar(50);
  declare variable tip_to integer;
  declare variable id_currency_uah integer;
begin
  select
      n.id_sklad,n.tip,
      n.parent_id_nakl,n.kurs,n.nalog_nds,
      n.id_izg,n.id_zak,n.id_manager,
      n.id_currency
    from naklo n
    where n.id_nakl = :id_nakl_in and n.posted=1
    into
      :id_sklad,:tip,
      :parent_id_nakl,:kurs,:nalog_nds,
      :id_izg,:id_zak,:id_manager,
      :id_currency;
  if (:tip is null) then begin
    exit;
  end
  select trim(name) from get_name_objects_pc(:tip,-100)  into :tip_name;
  if (:tip_name<>'ПРИХОДНЫЕ НАКЛАДНЫЕ') then  begin
    execute procedure error(
      'Ошибка. Возвраты поставщикам можно создать только из приходной накладной');
  end
  select oid from get_oid_objects_pc('ВОЗВРАТ ПОСТАВЩИКУ',-100) into :tip_to;
  select oid  from get_oid_objects_pc('ТИП ВАЛЮТ',-100) into :id_currency_uah;
  select oid  from get_oid_objects_pc('UAH',:id_currency_uah) into :id_currency_uah;
  
  if ((id_currency is null) or (id_currency=0) ) then begin
    id_currency=id_currency_uah;
  end
  id_nakl=gen_id(naklo_gen,1);
  /*Поставщик в возврате - это наш клиент*/
  /*Получатели -мы*/
  insert into vozvrat_post_vw (
      ID_NAKL,
      id,
      DAT,
      ID_IZG,
      ID_ZAK,
      ID_MANAGER,
      NALOG_NDS,
      ID_SKLAD,
      KURS,
      PARENT_ID_NAKL,
      KURS_INDIRECT,
      ID_CURRENCY,
      ID_CURRENCY_TO,
      nds_from
    )
    values (:id_nakl,:id_nakl,extractdate(current_timestamp),
      :id_zak,:id_izg, :id_manager,
      :nalog_nds, :id_sklad,
      :kurs,:id_nakl_in,0,
      :id_currency, 
      :id_currency_uah,0);
  execute procedure NAKLOT_DOC_COPY_PC(:id_nakl, :id_nakl_in, :tip_to, 2);
  execute procedure naklo_order_pc(:id_nakl);
  execute procedure naklo_sum_recount(:id_nakl,null);
  suspend;
end^

SET TERM ; ^

GRANT SELECT ON NAKLO TO PROCEDURE NAKLPBUX_MAKE_VOZVRAT_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE NAKLPBUX_MAKE_VOZVRAT_POST_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE NAKLPBUX_MAKE_VOZVRAT_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLPBUX_MAKE_VOZVRAT_POST_PC;

GRANT INSERT ON VOZVRAT_VW TO PROCEDURE NAKLPBUX_MAKE_VOZVRAT_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_DOC_COPY_PC TO PROCEDURE NAKLPBUX_MAKE_VOZVRAT_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLO_ORDER_PC TO PROCEDURE NAKLPBUX_MAKE_VOZVRAT_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLO_SUM_RECOUNT TO PROCEDURE NAKLPBUX_MAKE_VOZVRAT_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLPBUX_MAKE_VOZVRAT_POST_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE NAKLPBUX_MAKE_VOZVRAT_POST_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE NAKLPBUX_MAKE_VOZVRAT_POST_PC TO SNAB;
GRANT EXECUTE ON PROCEDURE NAKLPBUX_MAKE_VOZVRAT_POST_PC TO POWER_USER;

