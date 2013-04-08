SET TERM ^ ;

CREATE PROCEDURE REP_NAKL_PEREM_BUX_PC(
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
  /*Идентификаторы*/
  select oid
    from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
    into :id_schet_tip;
  select oid
    from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ БУХ',:id_schet_tip)
    into :id_schet_bux;
  select oid
    from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ БУХ ТАРА',:id_schet_tip)
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
        from get_price_default_pc(1,:id_tovar,null,:dat,0)
        into :cena;
      Suma=Round(z(cena*kolotp),2);
      suspend;
    end /*if (mode_in=1)*/
  end /*FOR nakl_perem_bux_det_vw*/
END^

SET TERM ; ^

DESCRIBE PROCEDURE REP_NAKL_PEREM_BUX_PC
'select *
from rep_nakl_perem_bux_pc(286262,1)

mode=0 - цена = себестоимости отгрузки с бухгалтерского склада
mode=1 - цена = прайсовой цене без НДС на дату перемещения';

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_NAKL_PEREM_BUX_PC;

GRANT SELECT ON NAKL_PEREM_BUX_VW TO PROCEDURE REP_NAKL_PEREM_BUX_PC;

GRANT SELECT ON NAKL_PEREM_BUX_DET_VW TO PROCEDURE REP_NAKL_PEREM_BUX_PC;

GRANT SELECT ON PROVODKI TO PROCEDURE REP_NAKL_PEREM_BUX_PC;

GRANT EXECUTE ON PROCEDURE GET_PRICE_DEFAULT_PC TO PROCEDURE REP_NAKL_PEREM_BUX_PC;

GRANT EXECUTE ON PROCEDURE REP_NAKL_PEREM_BUX_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE REP_NAKL_PEREM_BUX_PC TO BOSSES;
GRANT EXECUTE ON PROCEDURE REP_NAKL_PEREM_BUX_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE REP_NAKL_PEREM_BUX_PC TO POWER_USER;
GRANT EXECUTE ON PROCEDURE REP_NAKL_PEREM_BUX_PC TO SKLAD;

