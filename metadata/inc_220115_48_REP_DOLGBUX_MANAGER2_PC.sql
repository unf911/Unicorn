SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_DOLGBUX_MANAGER2_PC (
    sub1_in integer,
    sub2_in integer,
    sub3_in bigint,
    dat_from_in timestamp,
    dat_to_in timestamp)
returns (
    sub1p integer,
    sub2p integer,
    sub3p bigint,
    debet double precision,
    kredit double precision,
    last_opl_dat timestamp,
    last_otg_neopl_dat timestamp,
    last_otg_sum double precision)
as
declare variable id_schet integer;
declare variable oidtransh integer;
declare variable oidnaklr integer;
declare variable oidopl integer;
declare variable dat_first date;
declare variable dat_last date;
declare variable oid_tree integer;
declare variable id_manager_det integer;
begin
  select oid from get_oid_objects_pc('ÒÈÏ ÒÐÀÍØÈ',-100) into :oidTransh;
  select oid from get_oid_objects_pc('ÐÀÑÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ',-100) into :oidNaklr;
  select oid from get_oid_objects_pc('ÎÏËÀÒÛ',-100) into :oidOpl;
  select oid from get_oid_objects_pc('ÒÈÏ Ñ×ÅÒÀ',-100) into :id_schet;
  select oid from get_oid_objects_pc('ÄÎËÃÈ ÇÀ ÊÀÁÅËÜ',:id_schet) into :id_schet;
  
  select oid from get_oid_objects_pc('ÒÈÏ ÌÅÍÅÄÆÅÐÛ',-100) into :oid_tree;
  if (sub3_in is null) then begin
    select g.visible_area
      from get_manager_visible_area(null) g
      into :sub3_in;
  end /*if (sub3_in is null)*/
  for
    select g.oid
    from get_object_children_pc(:sub3_in,:oid_tree) g
    into :id_manager_det
  do begin
    for
      select  r.sub1,r.sub2,r.sub3, /*$$IBEC$$ r.sub4, $$IBEC$$*/
          sum(r.debetafter),sum(r.kreditafter) ,min(r.dat_first),max(r.dat_last)
        from rep_ostatki_datfirst_pc(:id_schet,:DAT_TO_IN,
          :sub1_in,:sub2_in,
          :id_manager_det,null,
          null,null,
          null,null,
          null,null) r
        where ((r.kreditafter>0) or (r.debetafter>0)) AND
          r.dat_first<=:DAT_FROM_IN
        group by  r.sub1,r.sub2,r.sub3
        into :sub1p, :sub2p,:sub3p,/*$$IBEC$$ :sub4, $$IBEC$$*/
          :debet,:kredit,:dat_first,:dat_last
    do begin
      if (debet>0 ) then begin
        LAST_OTG_NEOPL_DAT=:dat_first;
      end
      suspend;
    end  /*for rep_ostatki_datfirst_pc*/
  end /*for get_object_children_pc*/
end
^

SET TERM ; ^


