SET TERM ^ ;

CREATE OR ALTER PROCEDURE GET_NDS(
    DAT TIMESTAMP,
    KLIENT INTEGER)
RETURNS (
    NDS NUMERIC(15,4))
AS
  declare variable value1 varchar(256);
  declare variable id_nds integer;
begin
  if (klient is not null) then begin
    select k.lgoty
      from klient k
      where k.id=:klient
      into :value1;
    /*Экспортёрам нет НДС*/  
    if (value1 = 1) then begin
      nds=0;
      suspend;
      exit;
    end
  end /*klient*/
  /*обычные предприятия*/
  /*$$IBEC$$
  select oid
    from get_oid_objects_pc('РЕГИСТРЫ СВЕДЕНИЙ',-100)
    into :id_nds;
  select oid
    from get_oid_objects_pc('СТАВКА НАЛОГА НДС',:id_nds)
    into :id_nds; $$IBEC$$*/
  /*'СТАВКА НАЛОГА НДС'*/
  id_nds=-86;
  for
    select r.resurs1
      from rep_registry_pc(:id_nds,:dat, null, null,null) r
      into :nds
  do begin
    suspend;
    exit;
  end
  /*обычные предприятия*/ 
  /*если ничего не было найдено*/
  nds=0.2;
  suspend;
end^

SET TERM ; ^

DESCRIBE PROCEDURE GET_NDS
'процедура возвращает значение ндс для
конкретной фирмы на конкретную дату';

GRANT SELECT ON KLIENT TO PROCEDURE GET_NDS;

GRANT EXECUTE ON PROCEDURE REP_REGISTRY_PC TO PROCEDURE GET_NDS;

GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE GET_PRICE_DEFAULT_PC;
GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE MAKE_FIN_TRASH;
GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE MAKE_FIN_TRASH_FINUSL;
GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE MAKE_FIN_TRASH_USL;
GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;
GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE NAKLOT_SEBEST2_NAKLR_ASP_PC;
GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE NAKLOT_SEBEST_COUNT_PC;
GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE REP_PRICE2_PC;
GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE REP_PRICE3_PC;
GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE REP_PRICE_PC;
GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE REP_SKLAD_BUX_VYR_PRIXOD_PC;
GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE REP_SKLAD_BUX_VYR_RASXOD_PC;
GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE SRAVNPRICE_MAKE_SPEC_PC;
GRANT EXECUTE ON PROCEDURE GET_NDS TO "PUBLIC";
GRANT EXECUTE ON PROCEDURE GET_NDS TO SYSDBA;
