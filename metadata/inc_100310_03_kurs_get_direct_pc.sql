SET TERM ^ ;

CREATE OR ALTER PROCEDURE KURS_GET_DIRECT_PC(
    DAT TIMESTAMP,
    ID_CURRENCY_FROM INTEGER,
    ID_CURRENCY_TO INTEGER,
    MODE INTEGER)
RETURNS (
    KURS_INDIRECT INTEGER,
    KURS DOUBLE PRECISION)
AS
  declare variable kurs_from double precision;
  declare variable kurs_to double precision;
begin
  select k.kurs_from,k.kurs_to
    from kurs_get_pc(:dat,:ID_CURRENCY_FROM,:id_currency_to,:mode) k
    into :kurs_from,:kurs_to;
  if (kurs_from=1 and kurs_to<>1) then begin
    kurs_indirect=1;
    KURS=dzero(kurs_to,kurs_from,0);
  end else begin
    kurs_indirect=0;        
    KURS=dzero(kurs_from,kurs_to,0);
  end
  suspend;
end^

SET TERM ; ^

DESCRIBE PROCEDURE KURS_GET_DIRECT_PC
'Возвращает курс на дату. В форме курс и прямой или непрямой он.';

GRANT EXECUTE ON PROCEDURE KURS_GET_PC TO PROCEDURE KURS_GET_DIRECT_PC;

GRANT EXECUTE ON PROCEDURE KURS_GET_DIRECT_PC TO SYSDBA;
