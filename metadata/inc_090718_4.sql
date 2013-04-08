CREATE OR ALTER trigger naklp_vw_bu0 for naklp_vw
active before update position 0
AS
  /*$$IBEC$$ declare variable data_fields_change smallint; $$IBEC$$*/
  declare variable classid integer;  
begin
  execute procedure can_modify_naklot(new.id_nakl);
/*$$IBEC$$   if ((z(new.id_nakl)<>z(old.id_nakl)) or (trim(new.id)<>trim(old.id)) or
   (z(new.kurs)<>z(old.kurs)) or (z(new.nds)<>z(old.nds)) or
   (z(new.id_izg)<>z(old.id_izg)) or (z(new.id_zak)<>z(old.id_zak)) or
   (z(new.id_manager)<>z(old.id_manager)) or (z(new.nalog_nds)<>z(old.nalog_nds)) or
   (z(new.id_currency)<>z(old.id_currency)) or (z(new.id_sklad)<>z(old.id_sklad)) or
   (trim(new.comment)<>trim(old.comment)) or (z(new.parent_id_nakl)<>z(old.parent_id_nakl)) or
   (ExtractDate(new.dat)<>ExtractDate(old.dat)) or
   (z(new.id_currency_to)<>z(old.id_currency_to)) or
   (z(new.nds_from)<>z(old.nds_from)) or
   (z(new.kurs_indirect)<>z(old.kurs_indirect)) or
   (z(new.zatraty)<>z(old.zatraty))
   ) then begin
    data_fields_change=1;
  end else begin
    data_fields_change=0;
  end
  if (old.delmarked<>0 and data_fields_change<>0) then begin
    execute procedure error ('Запрещено менять удалённый документ');
  end
  if (old.posted<>0 and data_fields_change<>0) then begin
    execute procedure error ('Запрещено менять проведенный документ');
  end
  if (old.blocked<>0 and data_fields_change<>0) then begin
    execute procedure error('Запрещено менять заблокированный документ');
  end $$IBEC$$*/
  select oid
    from GET_OID_OBJECTS_PC('ПРИХОДНЫЕ НАКЛАДНЫЕ',-100)
    into :classid;  
  update naklo om
  set
    om.id_nakl=new.id_nakl,
    om.id=new.id,
    om.kurs=new.kurs,
    om.nds=new.nds,
    om.dat=new.dat,
    om.id_izg=new.id_izg,
    om.id_zak=new.id_zak,
    om.id_manager=new.id_manager,
    om.id_sklad=new.id_sklad, 
    om.nalog_nds=new.nalog_nds,
    om.posted = new.posted,
    om.blocked = new.blocked,
    om.delmarked = new.delmarked,
    om.id_currency = new.id_currency,
    om.comment = new.comment,
    om.parent_id_nakl=new.parent_id_nakl,
    om.zatraty=z(new.zatraty),
    om.id_currency_to = new.id_currency_to,
    om.kurs_indirect = new.kurs_indirect,
    om.nds_from=new.nds_from,
    om.id_sklad_to=new.id_xoz_oper,
    om.SCH=new.sch,
    om.dov=new.dov,
    om.ddo=new.ddo,
    om.lico=new.lico,
    om.fr=new.fr
  where
    om.id_nakl=old.id_nakl and
      om.tip=:classid;
end
