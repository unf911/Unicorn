SET TERM ^ ;

CREATE OR ALTER PROCEDURE TEMP71_MARINA_SKLAD_POST_PC (
    dat_from timestamp,
    dat_to timestamp,
    id_sklad_in integer)
as
declare variable id_nakl integer;
declare variable id_nakl2 integer;
begin
/*$$IBEC$$   for
    select om.id_nakl
      from naklo om
      where om.dat between :dat_from and :dat_to  and
        om.tip in (5) and
        om.id_manager=8772   $$IBEC$$*//*Марина*//*$$IBEC$$ 
        and om.id_sklad in (8735,12854)  and
        om.posted=0 and om.delmarked=0
      order by om.dat, om.id_sklad,om.tip, om.id
      into :id_nakl
  do begin
    execute procedure naklo_post_pc(:id_nakl,null);
  end $$IBEC$$*/
  for
    select om.id_nakl
      from naklo om
      where om.dat between :dat_from and :dat_to  and
        om.tip in (5) and
        om.posted=1 and om.delmarked=0
      order by om.dat, om.id_sklad,om.tip, om.id
      into :id_nakl
  do begin
    execute procedure naklo_post_pc(:id_nakl,/*-82*/-39 /*Фин рез*/);
  end  
/*$$IBEC$$   for
    select id_nakl
    from naklo om 
    where om.id_manager=8772
      and om.tip=3047
      and om.dat between :dat_from and :dat_to
      and id_sklad=:id_sklad_in
    order by om.dat   
    into :id_nakl
  do begin
    execute procedure naklo_make_nakl_perem_bux_pc(:id_nakl) returning_values :id_nakl2;
  end $$IBEC$$*/
  /*suspend;*/
end
^

SET TERM ; ^


