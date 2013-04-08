SET TERM ^ ;

CREATE OR ALTER PROCEDURE OPLATY_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_manager integer;
  declare variable dat date;
  declare variable tip integer;
  declare variable id_schet_dolg integer;
  declare variable id_schet_tip integer;
  declare variable classid integer;
  declare variable nds numeric(15,4);
  declare variable posted integer;
  declare variable id_schet_dengi integer;
  declare variable id_bank integer;
  declare variable id_currency_bank integer;
  declare variable schet_name varchar(50);
  declare variable parent_id_nakl integer;
  declare variable id_izg_ukk integer;
  declare variable delmarked integer;
  declare variable id_xoz_oper_tip integer;
  declare variable id_xoz_oper integer;
  declare variable xoz_oper_name varchar(50);
  declare variable id_schet_post integer;
  declare variable id_schet_agent integer;
  declare variable id_agent integer;
  declare variable nds_from double precision;
  declare variable id_schet_dolg_usl integer;
  declare variable id_schet_finrez integer;
  declare variable id_project integer;
  declare variable id_statya_dr_tip integer;
  declare variable id_statya_dox integer;
  declare variable id_statya_ras integer;
  declare variable id_schet_post_usl integer;
  declare variable tip_transh integer;
  declare variable id_schet_dolg_finusl integer;
begin
  select om.tip,
      om.id_izg,om.id_zak,om.id_manager,
      om.nds,om.dat,om.posted,om.id_sklad,
      om.parent_id_nakl,om.delmarked,om.id_sklad_to,
      om.id_currency_to,om.nds_from
    from naklo om
    where om.id_nakl=:id_nakl and om.delmarked=0
    into :tip,
      :id_izg,:id_zak,:id_manager,
      :nds,:dat,:posted,:id_bank,:parent_id_nakl,:delmarked,:id_xoz_oper,
      :id_agent,:nds_from;
  if ((:posted = 1) and (id_schet is null)) then begin
    execute procedure oplaty_unpost_pc(:id_nakl);
  end
  select oid
    from GET_OID_OBJECTS_PC('������',-100)
    into :classid;
  if (tip<>classid) then begin
    execute procedure error('������ �������� ������ ��������� ����� ��������');
  end
  if (delmarked<>0) then begin
    execute procedure error ('������ �������� �������� ��������');
  end  
  select oid
    from GET_OID_OBJECTS_PC('��� �����',-100)
    into :id_schet_tip;
  if (id_schet is not null) then begin
    select name
      from get_name_objects_pc(:id_schet,:id_schet_tip)
      into schet_name;
  end    
  select oid
    from GET_OID_OBJECTS_PC('����� �� ������',:id_schet_tip)
    into :id_schet_dolg;
  select oid
    from GET_OID_OBJECTS_PC('����� �� ������',:id_schet_tip)
    into :id_schet_dolg_usl;
  select oid
    from GET_OID_OBJECTS_PC('����� �� ���������',:id_schet_tip)
    into :id_schet_dolg_finusl;    
  select oid
    from GET_OID_OBJECTS_PC('������ �� ������',:id_schet_tip)
    into :id_schet_dengi;
  select oid
    from GET_OID_OBJECTS_PC('���ר�� � ������������',:id_schet_tip)
    into :id_schet_post;
  select oid
    from GET_OID_OBJECTS_PC('���ר�� � ������������ �����',:id_schet_tip)
    into :id_schet_post_usl;
  select oid
    from GET_OID_OBJECTS_PC('������� � ��������',:id_schet_tip)
    into :id_schet_agent;
  select oid
    from GET_OID_OBJECTS_PC('���������� ���������',:id_schet_tip)
    into :id_schet_finrez;
  select oid
    from GET_OID_OBJECTS_PC('������������� ��������',-100)
    into :id_xoz_oper_tip;
  select oid
    from GET_OID_OBJECTS_PC('��� �������',-100)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('�����',:id_project)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('��� ������ ������� � ��������',-100)
    into :id_statya_dr_tip;
  select oid
    from GET_OID_OBJECTS_PC('����� �� �������� �������',:id_statya_dr_tip)
    into :id_statya_dox;
  select oid
    from GET_OID_OBJECTS_PC('������ �� �������� �������',:id_statya_dr_tip)
    into :id_statya_ras;

  if (:id_xoz_oper is not null) then begin
    select name
      from get_name_objects_pc(:id_xoz_oper, :id_xoz_oper_tip)
      into :xoz_oper_name;
  end else begin
    xoz_oper_name='������ ����������� �������';
  end        
  /*�������� �������� �� ��������� ������ �� ������ �����. ��� ��������������*/
  if (id_schet is not null) then begin
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.tip=:tip
        and pr.id_schet=:id_schet;
  end
  if (:parent_id_nakl is null and id_schet is null) then begin
    select v.id
      from vlad_vw v
      where v.isdefault=1
      into :id_izg_ukk;
    if (:id_izg =:id_izg_ukk) then begin
      parent_id_nakl=gen_id(naklras_id_gen,1);
      update naklo om
        set om.parent_id_nakl =:parent_id_nakl
        where om.id_nakl=:id_nakl;
    end
  end
  if (((id_schet is null) or (schet_name='����� �� ������'))
    and (xoz_oper_name='������ ����������� �������'))
  then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4)
      values(:id_schet_dolg,:dat,:classid,
        :nds,:id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl);
  end  /*if '����� �� ������'*/
  select b.id_currency
    from bank_vw b
    where b.oid=:id_bank
    into :id_currency_bank; 

  if (((id_schet is null) or (schet_name='����� �� ������'))
    and (xoz_oper_name='������ ����������� �����'))
  then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_dolg_usl,:dat,:classid,
        :nds,:id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_bank);
  end  /*if '����� �� ������'*/
  
  if (((id_schet is null) or (schet_name='����� �� ���������'))
    and (xoz_oper_name='������ ����������� ��������'))
  then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_dolg_finusl,:dat,:classid,
        :nds,:id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_bank);
  end  /*if '����� �� ���������'*/

  if (((id_schet is null) or (schet_name='���ר�� � ������������'))
    and (xoz_oper_name='������� �� ����������'))
  then begin
    /*������ ������ ��� �������������� ���������*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip=3;
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=3;
    insert into provodki (id_schet,dat,tip,
      debet,id_nakl,
      sub1,sub2,sub3,sub4,sub5)
    values(:id_schet_post,:dat,:tip,
      (-1*:nds), :id_nakl,
      :id_zak,:id_izg,:id_manager,:id_nakl,:id_currency_bank);
    execute procedure oplaty_auto_spend_pc(:id_schet_post,:id_nakl,:dat, :id_zak,:id_izg, null,:id_currency_bank, 3,0);
  end

  if (((id_schet is null) or (schet_name='���ר�� � ������������ �����'))
    and (xoz_oper_name='������� �� ���������� �����'))
  then begin
    select oid
      from get_oid_objects_pc('������������� ��������',-100)
      into :tip_transh;
    select oid
      from get_oid_objects_pc('����� � �������� � ������������ ����� �������',:tip_transh)
      into :tip_transh;
    /*������ ������ ��� �������������� ���������*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip=:tip_transh;
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=:tip_transh;
    insert into provodki (id_schet,dat,tip,
      debet,id_nakl,
      sub1,sub2,sub3,sub4,sub5)
    values(:id_schet_post_usl,:dat,:tip,
      (-1*:nds), :id_nakl,
      :id_zak,:id_izg,:id_manager,:id_nakl,:id_currency_bank);
    /*execute procedure oplaty_auto_spend_pc(:id_schet_post_usl,:id_nakl,:dat, :id_zak,:id_izg, null,:id_currency_bank, :tip_transh,0);*/
  end
  
  if (((id_schet is null) or (schet_name='������� � ��������'))
    and (xoz_oper_name='������ �� ������'))
  then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2)
      values(:id_schet_agent,:dat,:classid,
        :nds,:id_nakl,
        :id_agent,:id_currency_bank);
    /*��������, ��� ���������� ����� ������*/
    if (:nds_from>0) then begin
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2)
        values(:id_schet_agent,:dat,:tip,
          Round(:nds_from,2),:id_nakl,
          :id_agent,:id_currency_bank);
    end else begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2)
        values(:id_schet_agent,:dat,:tip,
          Round(-:nds_from,2),:id_nakl,
          :id_agent,:id_currency_bank);    
    end        
  end  /*if '������� � ��������'*/
    
  if ((id_schet is null) or (schet_name='������ �� ������')) then begin
    if ((id_bank is not null and id_bank<>0) and (:dat>='31.05.07')) then begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3)
        values(:id_schet_dengi,:dat,:classid,
          Round(:nds,2),:id_nakl,
          :id_izg,:id_bank,:id_currency_bank);
    end /*if (id_bank is not null)*/
  end /*if '������ �� ������'*/

  if (((id_schet is null) or (schet_name='���������� ���������'))
    and (xoz_oper_name='������ �� ������'))
  then begin
    /*��������, ��� ���������� ����� ������*/
    if (:nds_from>0) then begin
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(:nds_from,2),:id_nakl,
          :id_project,:id_statya_ras,:id_currency_bank,:id_izg,:id_zak,:id_manager);
    end else begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(-:nds_from,2),:id_nakl,
          :id_project,:id_statya_dox,:id_currency_bank,:id_izg,:id_zak,:id_manager);
    end        
  end  /*if '���������� ���������'*/

  update naklo om
    set om.posted =1
    where om.id_nakl=:id_nakl and om.posted=0;

end^

SET TERM ; ^
