SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLRU_UNPOST_PC(
    ID_NAKL INTEGER)
AS
begin
  execute procedure naklr_unpost_common_pc(:id_nakl,
    'РАСХОДНЫЕ НАКЛАДНЫЕ НА УСЛУГИ',
    'Нельзя вернуть не расходную накладную по аренде');
end^

SET TERM ; ^
