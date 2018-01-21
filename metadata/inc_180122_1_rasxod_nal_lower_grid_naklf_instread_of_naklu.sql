SET TERM ^ ;

CREATE OR ALTER PROCEDURE RASXOD_NAL_LOWER_GRID_PC(
    ID_IZG_IN INTEGER,
    ID_ZAK_IN INTEGER,
    ID_MANAGER_IN INTEGER,
    MODE_IN INTEGER)
RETURNS (
    ID VARCHAR(20),
    DAT TIMESTAMP,
    NDS NUMERIC(15,4),
    SUB1 INTEGER,
    SUB2 INTEGER,
    SUB3 INTEGER,
    ID_NAKL INTEGER,
    OTKAT DOUBLE PRECISION,
    DAT_FIRST TIMESTAMP,
    OSTATOK DOUBLE PRECISION)
AS
declare variable id_schet integer;
declare variable tip_naklr integer;
declare variable tip_naklrf integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('“»œ —◊≈“¿',-100)
    into :id_schet;
  select oid
    from GET_OID_OBJECTS_PC('Õ¿À»◊Õ€≈ ƒŒÀ√»',:id_schet)
    into :id_schet;
  select oid
    from GET_OID_OBJECTS_PC('–¿—’ŒƒÕ€≈ Õ¿ À¿ƒÕ€≈',-100)
    into :tip_naklr;
  select oid
    from GET_OID_OBJECTS_PC('–¿—’ŒƒÕ€≈ Õ¿ À¿ƒÕ€≈ Õ¿ ‘»Õ”—À”√»',-100)
    into :tip_naklrf;
  for
    select om.id, om.dat, om.nds, r.sub1,r.sub2,r.sub3, r.sub4 as id_nakl,
      z(om.nds)-(select z(sum(om2.nds))
         from naklo om2
         where om2.tip=5 and
           om2.posted=1 and
           om2.parent_id_nakl=r.sub4) as otkat,
        max(r.dat_first),sum(r.debetafter)-sum(r.kreditafter)
      from rep_ostatki_pc(
        :id_schet,
        current_timestamp,
        :id_izg_in,:id_zak_in,
        null,null,
        null,null,
        null,null,
        null,null) r
        inner join naklo om on om.id_nakl=r.sub4
      /*$$IBEC$$ where  r.kreditafter<=0 $$IBEC$$*/
      where om.tip in (:tip_naklr,:tip_naklrf)
      group by  r.sub1,r.sub2,r.sub3,r.sub4 ,om.id, om.dat, om.nds
      having (sum(r.debetafter)<>0) or (sum(r.kreditafter)<>0)
      order by om.dat desc, om.id desc
      into :id, :dat, :nds, :sub1,:sub2,:sub3,:id_nakl,:otkat,:dat_first,:ostatok
  do begin
    suspend;
  end
end
^

SET TERM ; ^




