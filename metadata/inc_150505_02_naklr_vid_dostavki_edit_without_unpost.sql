CREATE OR ALTER trigger naklr_vw_au10 for naklr_vw
active after update position 10
as
  declare variable fk1 integer;
  declare variable data_fields_change integer;
  declare variable posted integer;
  declare variable delmarked integer;
begin
  if ((z(new.id_nakl)<>z(old.id_nakl)) or (trim(new.id)<>trim(old.id)) or
   (z(new.kurs)<>z(old.kurs)) or (z(new.nds)<>z(old.nds)) or
   (z(new.id_izg)<>z(old.id_izg)) or
   (z(new.id_zak)<>z(old.id_zak)) or
   (trim(new.fr)<>trim(old.fr)) or
   (z(new.id_manager)<>z(old.id_manager)) or (z(new.nalog_nds)<>z(old.nalog_nds)) or
   (z(new.id_currency)<>z(old.id_currency)) or (z(new.id_sklad)<>z(old.id_sklad)) or
   (extractdate(new.dat)<>extractdate(old.dat))) then begin
    data_fields_change=1;
  end else begin
    data_fields_change=0;
  end

  select om.delmarked,om.posted
    from naklo om
    where om.id_nakl=old.id_nakl
    into :delmarked,:posted;
  if (delmarked<>0 and data_fields_change<>0) then begin
    execute procedure error ('��������� ������ �������� ��������');
  end
  if (posted<>0 and data_fields_change<>0) then begin
    execute procedure error ('��������� ������ ����������� ��������');
  end
  /*$$IBEC$$ execute procedure CAN_MODIFY_NAKLO (new.id_nakl,:data_fields_change); $$IBEC$$*/

  fk1=0;
  if (trim(new.comment)<>trim(old.comment)) then begin
    fk1=1;
  end

   /*���� � ��������� ��������� ����������� ��� ������ ������*/
  if ((fk1=1) /*$$IBEC$$ and (is_allowed_to_post=0) $$IBEC$$*/) then begin
    if (not (user in ('MARINASH','SYSDBA','FRASINYUK','MINEEVA')))  then begin
      exception otkat_opl;
    end
  end /*���� � ��������� ��������� ����������� ��� ������ ������*/
  /*���� � ��������� ���������� ���� "�������� ������������ �������"*/
  if (trim(new.blocked)<>trim(old.blocked)) then begin
    if (not (current_role in ('BUXG','POWER_USER')) and (not (user='SYSDBA')))  then begin
      execute procedure error('��������� ������ ���� "�������� ������������ �������"');
    end    
  end

  update naklo om
  set om.id_nakl=new.id_nakl,
    om.id=new.id,
    om.kurs=new.kurs,
    om.nds=new.nds,
    om.dat=new.dat,
    om.id_izg=new.id_izg,
    om.id_zak=new.id_zak,
    om.id_manager=new.id_manager,
    om.nalog_nds=new.nalog_nds,
    om.posted = new.posted,
    om.blocked = new.blocked,
    om.delmarked = new.delmarked,
    om.id_currency = new.id_currency,
    om.id_sklad = new.id_sklad,
    om.id_sklad_to = new.id_sklad_to,
    om.comment=new.comment,
    om.id_currency_to=new.id_xoz_oper ,
    om.id_vygruzka=new.id_vygruzka
  where om.id_nakl=old.id_nakl;

  update naklr n
  set n.sch=new.sch,
    n.dov=new.dov,
    n.ddo=new.ddo,
    n.lico=new.lico,
    n.fr=new.fr,
    n.id_nakl=new.id_nakl
  where
    n.id_nakl=old.id_nakl;
end
