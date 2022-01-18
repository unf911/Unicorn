SET TERM ^ ;

CREATE OR ALTER PROCEDURE RASXOD_NAL_LOWER_GRID_PC (
    id_izg_in integer,
    id_zak_in integer,
    id_manager_in integer,
    mode_in integer)
returns (
    id varchar(20),
    dat timestamp,
    nds numeric(15,4),
    sub1 integer,
    sub2 integer,
    sub3 bigint,
    id_nakl integer,
    otkat double precision,
    dat_first timestamp,
    ostatok double precision)
as
declare variable id_schet integer;
declare variable tip_naklr integer;
declare variable tip_naklrf integer;
declare variable tip_naklru integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ Ñ×ÅÒÀ',-100)
    into :id_schet;
  select oid
    from GET_OID_OBJECTS_PC('ÍÀËÈ×ÍÛÅ ÄÎËÃÈ',:id_schet)
    into :id_schet;
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ',-100)
    into :tip_naklr;
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ ÍÀ ÔÈÍÓÑËÓÃÈ',-100)
    into :tip_naklrf;
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ ÍÀ ÓÑËÓÃÈ',-100)
    into :tip_naklru;
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
      where om.tip in (:tip_naklr,:tip_naklrf,:tip_naklru)
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


