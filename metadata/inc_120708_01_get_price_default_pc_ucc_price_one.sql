SET TERM ^ ;

CREATE PROCEDURE GET_PRICE_DEFAULT_PC(
    ID_PRICE_IN INTEGER,
    ID_TOVAR_IN INTEGER,
    ID_CURRENCY_IN INTEGER,
    DAT_IN TIMESTAMP,
    WITH_NDS SMALLINT)
RETURNS (
    CENA DOUBLE PRECISION,
    ID_TOVAR INTEGER)
AS
  declare variable id_registr integer;
  declare variable id_registr_price integer;
  declare variable cena_from double precision;
  declare variable nalog_nds double precision;
  declare variable dat date;
  declare variable id_currency_det integer;
  declare variable include_nds integer;
  declare variable id_currency_prev integer;
  declare variable kurs double precision;
  declare variable kurs_to double precision;
  declare variable kurs_from double precision;
  declare variable kurs_indirect integer;
  declare variable id_currency integer;
  declare variable id_currency_tip integer;
begin
  select oid
    from get_oid_objects_pc('РЕГИСТРЫ СВЕДЕНИЙ',-100)
    into :id_registr;
  select oid
    from get_oid_objects_pc('РЕГИСТР ПРАЙСОВ',:id_registr)
    into :id_registr_price;


    
  select nds
    from get_nds(:dat_in, null)
    into :nalog_nds;

  if ( id_price_in is null) then begin
    exit;
  end

  if (id_price_in=1) then begin
     select o.id_price
     from vlad_vw o
     where o.id_price is not null
       and o.delmarked=0
       and o.isdefault=1
     into :id_price_in; /*Прайс Укк*/

    /*цена основного аналога, для совместимости в расходных,
      в спецификациях нужен товар, а не основной аналог*/
    if (id_tovar_in is not null) then begin
      select id_analog from tovar t where t.oid=:id_tovar_in into :id_tovar_in;
    end
  end

  select s.id_currency,s.include_nds
    from spr_price_vw s
    where s.oid=:id_price_in
    into :id_currency_det,:include_nds;

  if (id_currency_in is null) then begin
    select oid
      from get_oid_objects_pc('ТИП ВАЛЮТ',-100)
      into :id_currency_tip;
    select oid
      from get_oid_objects_pc('UAH',:id_currency_tip)
      into :id_currency_in;
  end
  for
    select r.sub1, r.resurs1, r.dat
      from rep_registry_last_pc(:id_registr_price,:dat_in,
      :id_tovar_in, :id_price_in,null) r
    into :id_tovar,:cena_from,
      :dat
  do begin

    if ((id_currency_prev is null) or
     (id_currency_det<>id_currency_prev))  then begin
      /*значит первая итерация и надо узнать курс*/
      /*Или валюта на этой итерации изменилась*/
      select k.kurs_from,k.kurs_to
        from kurs_get_pc(:dat_in, :id_currency_det,:id_currency_in,1) k
        into :kurs_from,:kurs_to;
      if (kurs_from=1 and kurs_to<>1) then begin
        kurs_indirect=1;
        kurs=kurs_to/kurs_from;
      end else begin
        kurs_indirect=0;        
        kurs=kurs_from/kurs_to;
      end

      id_currency_prev=id_currency_det;
    end  /*(id_currency_prev is null) or*/
    /*убираем ндс*/
    if (include_nds=with_nds) then begin
      cena=cena_from;
    end else begin
      if ((with_nds=0) and (include_nds=1)) then begin
        cena=cena_from/(1+:nalog_nds);
      end
      if ((with_nds=1) and (include_nds=0)) then begin
        cena=cena_from*(1+:nalog_nds);
      end
    end
    /*конвертируем*/
    if (kurs_indirect=1) then begin
      cena=cena/kurs;
    end else begin
      cena=cena*kurs;
    end
    id_currency=:id_currency_det;
    suspend;
  end  /*for rep_registry_pc*/    
end^

SET TERM ; ^

DESCRIBE PROCEDURE GET_PRICE_DEFAULT_PC
'Возвращает прайсовую цену в нужной валюте на дату
с ндс или без, в зависимости от входного параметра with_nds
select
  round(cena,2)
from
  get_price_default_pc(1,6365,null,''19.06.06'',0) action

  Раньше id_price= null ссылался на Укк прайс
  Теперь id_price = null возвращает пусто';

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE GET_PRICE_DEFAULT_PC;

GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE GET_PRICE_DEFAULT_PC;

GRANT SELECT ON VLAD_VW TO PROCEDURE GET_PRICE_DEFAULT_PC;

GRANT SELECT ON TOVAR TO PROCEDURE GET_PRICE_DEFAULT_PC;

GRANT SELECT ON SPR_PRICE_VW TO PROCEDURE GET_PRICE_DEFAULT_PC;

GRANT EXECUTE ON PROCEDURE REP_REGISTRY_LAST_PC TO PROCEDURE GET_PRICE_DEFAULT_PC;

GRANT EXECUTE ON PROCEDURE KURS_GET_PC TO PROCEDURE GET_PRICE_DEFAULT_PC;

GRANT EXECUTE ON PROCEDURE GET_PRICE_DEFAULT_PC TO PROCEDURE REP_NAKL_PEREM_BUX_PC;
GRANT EXECUTE ON PROCEDURE GET_PRICE_DEFAULT_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE GET_PRICE_DEFAULT_PC TO BOSSES;
GRANT EXECUTE ON PROCEDURE GET_PRICE_DEFAULT_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE GET_PRICE_DEFAULT_PC TO MANAGER;
GRANT EXECUTE ON PROCEDURE GET_PRICE_DEFAULT_PC TO POWER_USER;
GRANT EXECUTE ON PROCEDURE GET_PRICE_DEFAULT_PC TO SKLAD;
GRANT EXECUTE ON PROCEDURE GET_PRICE_DEFAULT_PC TO SNAB;

