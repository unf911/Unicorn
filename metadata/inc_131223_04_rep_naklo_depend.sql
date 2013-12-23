SET TERM ^ ;

CREATE or alter PROCEDURE REP_NAKLO_DEPEND_PC(
    ID_NAKL_IN INTEGER)
RETURNS (
    ID_DET INTEGER,
    ID_NAKLD INTEGER,
    ID_TARA INTEGER,
    NOMER_TARY VARCHAR(50),
    KOLOTP DOUBLE PRECISION,
    KOLBUXT INTEGER,
    COMMENT VARCHAR(50),
    ID_TOVAR INTEGER,
    ID_POS INTEGER,
    ID VARCHAR(20),
    DAT TIMESTAMP,
    ID_NAKL INTEGER,
    ID_IZG INTEGER,
    ID_ZAK INTEGER,
    ID_MANAGER INTEGER,
    TIP INTEGER,
    ID_SKLAD INTEGER,
    ID_SKLAD_TO INTEGER,
    POSTED INTEGER,
    NDS NUMERIC(15,2))
AS
begin
  for
    select od2.id_det,od2.id_nakld,od2.id_tara,
      od2.nomer_tary,od2.kolotp,od2.kolbuxt,od2.comment,
      ot2.id_tovar,ot2.id_pos,
      om2.id,om2.dat,om2.id_nakl,om2.id_izg,om2.id_zak,om2.id_manager,
      om2.tip,om2.id_sklad,om2.id_sklad_to,om2.posted,om2.nds
      from naklo om
        inner join naklot ot on ot.id_nakl=om.id_nakl
        inner join naklodet od on od.id_nakld=ot.id_nakld
        inner join sklostdet sd on sd.id_det=od.id_det
        inner join sklostt st on st.id_ostt=sd.id_ostt
        inner join sklostdet sd2 on st.id_ostt=sd2.id_ostt
        inner join naklodet od2 on od2.id_det=sd2.id_det
        inner join naklot ot2 on ot2.id_nakld=od2.id_nakld
        inner join naklo om2 on om2.id_nakl=ot2.id_nakl
      where 
        om.id_nakl=:id_nakl_in
        and sd.id_type in (11,12) and sd2.id_type in (21,22,31,32)
      group by od2.id_det,od2.id_nakld,od2.id_tara,
      od2.nomer_tary,od2.kolotp,od2.kolbuxt,od2.comment,
      ot2.id_tovar,ot2.id_pos,
      om2.id,om2.dat,om2.id_nakl,om2.id_izg,om2.id_zak,om2.id_manager,
      om2.tip,om2.id_sklad,om2.id_sklad_to,om2.posted,om2.nds
      order by om2.dat, om2.id,om2.id_nakl,ot2.id_pos
      into :id_det,:id_nakld,:id_tara,:nomer_tary,:kolotp,
        :kolbuxt ,:comment,:id_tovar,:id_pos,:id,:dat,:id_nakl,
        :id_izg ,:id_zak,:id_manager,:tip,:id_sklad,:id_sklad_to,
        :posted,:nds
  do begin
    suspend;
  end
end^

SET TERM ; ^

DESCRIBE PROCEDURE REP_NAKLO_DEPEND_PC
'Склад - Приходные накладные и излишки - Действия - Показать зависимые складские накладные

select 
  (select name from objects o where o.oid=r.id_izg) as izg,
  (select name from objects o where o.oid=r.id_zak) as zak,
  (select name from objects o where o.oid=r.id_manager) as manager,
  (select name from objects o where o.oid=r.tip) as tip_name,
  (select name from objects o where o.oid=r.id_tovar) as tovar,
  (select name from objects o where o.oid=r.id_tara) as tara,
  r.*
from rep_naklo_depend_pc(314845) r';

GRANT SELECT ON NAKLO TO PROCEDURE REP_NAKLO_DEPEND_PC;

GRANT SELECT ON NAKLOT TO PROCEDURE REP_NAKLO_DEPEND_PC;

GRANT SELECT ON NAKLODET TO PROCEDURE REP_NAKLO_DEPEND_PC;

GRANT SELECT ON SKLOSTDET TO PROCEDURE REP_NAKLO_DEPEND_PC;

GRANT SELECT ON SKLOSTT TO PROCEDURE REP_NAKLO_DEPEND_PC;

GRANT EXECUTE ON PROCEDURE REP_NAKLO_DEPEND_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE REP_NAKLO_DEPEND_PC TO BOSSES;
GRANT EXECUTE ON PROCEDURE REP_NAKLO_DEPEND_PC TO POWER_USER;
GRANT EXECUTE ON PROCEDURE REP_NAKLO_DEPEND_PC TO SKLAD;

