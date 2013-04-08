CREATE OR ALTER trigger naklp_vw_bi0 for naklp_vw
active before insert position 0
AS
  declare variable classid integer;
begin
  if (new.id_nakl is null) then begin
    NEW.ID_NAKL = GEN_ID(NAKLO_GEN,1);
  end
  select oid
    from GET_OID_OBJECTS_PC('œ–»’ŒƒÕ€≈ Õ¿ À¿ƒÕ€≈',-100)
    into :classid;   
  insert into naklo (id_nakl,id,kurs,nds,dat,id_izg,id_zak,
      id_manager,nalog_nds,posted,blocked,delmarked,
      comment,
      id_currency,parent_id_nakl,zatraty,
      tip,id_currency_to,kurs_indirect,nds_from,
      id_sklad,id_sklad_to,
      SCH, DOV, DDO, LICO, FR
      
      )
    values (new.id_nakl,new.id,new.kurs,new.nds,new.dat,new.id_izg,new.id_zak,
      new.id_manager,new.nalog_nds,0/*new.posted*/,new.blocked,new.delmarked,
      new.comment,
      new.id_currency,new.parent_id_nakl,new.zatraty,
      :classid,new.id_currency_to,new.kurs_indirect, new.nds_from,
      new.id_sklad,new.id_xoz_oper,
      new.sch,new.dov,new.ddo,new.lico,new.fr);
end



