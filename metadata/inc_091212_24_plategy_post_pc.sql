SET TERM ^ ;

CREATE OR ALTER PROCEDURE PLATEGY_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
declare variable schet_name varchar(50);
  declare variable dat_transh date;
  declare variable dat_report date;
  declare variable id_manager_nakl integer;
  declare variable transh double precision;
  declare variable id_transh integer;
  declare variable id_nakl_nakl integer;
  declare variable name varchar(50);
  declare variable id_schet_tip integer;
  declare variable id_schet_post integer;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_manager integer;
  declare variable dat date;
  declare variable tip integer;
  declare variable nds double precision;
  declare variable id_currency integer;
  declare variable posted integer;
  declare variable sError varchar(100);
  declare variable dat_opl date;
  declare variable nds_neopl double precision;
  declare variable id_bank integer;
  declare variable id_currency_bank integer;
  declare variable id_schet_dengi integer;
  declare variable nds_from double precision;
  declare variable delmarked integer;
  declare variable id_xoz_oper integer;
  declare variable id_xoz_oper_tip integer;
  declare variable xoz_oper_name varchar(50);
  declare variable id_schet_dolg integer;
  declare variable id_agent integer;
  declare variable id_schet_agent integer;
  declare variable id_schet_post_uslug integer;
  declare variable tip_transh integer;
  declare variable id_schet_finrez integer;
  declare variable id_project integer;
  declare variable id_statya_dr_tip integer;
  declare variable id_statya_dox integer;
  declare variable id_statya_ras integer;
  declare variable tip_transh_vovz_pok_usl integer;
  declare variable id_schet_dolg_usl integer;
begin
  select om.tip,om.id_izg,om.id_zak,om.id_manager,
      om.nds,om.dat,
      om.id_currency,om.id_sklad,
      om.posted,om.nds_from,
      om.delmarked,om.id_sklad_to,
      om.id_currency_to
    from naklo om
    where om.id_nakl=:id_nakl
    into :tip,:id_izg, :id_zak,:id_manager,
      :nds,:dat,
      :id_currency,:id_bank,
      :posted,:nds_from,
      :delmarked,:id_xoz_oper,
      :id_agent;
  /*��������*/
  if (id_schet =0 ) then begin
    id_schet = null;
  end   
  select name from get_name_objects_pc(:tip,-100) into :name;
  if (name<>'������ ���������') then begin
    execute procedure error('������ �������� �� ��������� �����');
  end  

  if ((posted<>0) and (id_schet is null)) then begin
    execute procedure error ('������ �������� ��� ����������� ��������');
  end      
  if ((posted=0) and (id_schet is not null)) then begin
    sError = '������ �������� �������� �� ����������� ��������' || coalesce(:id_schet,999);
    execute procedure error (sError);
  end
  if (delmarked<>0) then begin
    execute procedure error ('������ �������� �������� ��������');
  end
  if (nds<0 ) then begin
    execute procedure error('������ �������� ������������� �����. ����������� ��������.');
  end
  /*�������������� ��������*/
  select oid
    from GET_OID_OBJECTS_PC('��� �����',-100)
    into :id_schet_tip;
  select oid
    from GET_OID_OBJECTS_PC('������������� ��������',-100)
    into :id_xoz_oper_tip;
  if (z(:id_xoz_oper)<>0) then begin
    select name
      from get_name_objects_pc(:id_xoz_oper, :id_xoz_oper_tip)
      into :xoz_oper_name;
  end else begin
    xoz_oper_name='������ ����������� �������';
  end
  if (id_schet is not null) then begin
    select name
      from get_name_objects_pc(:id_schet,:id_schet_tip)
      into schet_name;
  end
    
  select oid
    from GET_OID_OBJECTS_PC('���ר�� � ������������',:id_schet_tip)
    into :id_schet_post;
  select oid
    from GET_OID_OBJECTS_PC('����� �� ������',:id_schet_tip)
    into :id_schet_dolg;
  select oid
    from GET_OID_OBJECTS_PC('����� �� ������',:id_schet_tip)
    into :id_schet_dolg_usl;
  select oid
    from GET_OID_OBJECTS_PC('������ �� ������',:id_schet_tip)
    into :id_schet_dengi;
  select oid
    from GET_OID_OBJECTS_PC('������� � ��������',:id_schet_tip)
    into :id_schet_agent;
  select oid
    from GET_OID_OBJECTS_PC('���ר�� � ������������ �����',:id_schet_tip)
    into :id_schet_post_uslug;          
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
  select oid
    from GET_OID_OBJECTS_PC('����� � �������� � ������������ ����� �������',:id_xoz_oper_tip)
    into :tip_transh_vovz_pok_usl;




    
  /*�������� �������� �� ��������� ������ �� ������ �����. ��� ��������������*/
  if (id_schet is not null) then begin
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.tip=:tip
        and pr.id_schet=:id_schet;
  end
  dat_report=:dat; 
  /*��������*/
  if (((id_schet is null) or (schet_name='���ר�� � ������������'))
    and (xoz_oper_name='������ ����������� �������'))
  then begin
    /*������ ������ ��� �������������� ���������*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip=1;    
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=1;
      
    
    if (nds>=0) then begin
      /*���������� �������, �.�. �������������*/
      insert into provodki (id_schet,dat,tip,
        debet,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_post,:dat,:tip,
        :nds, :id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency);
      execute procedure oplaty_auto_spend_pc(:id_schet_post,:id_nakl,:dat, :id_izg, :id_zak, :id_currency, 1);
      
    end else begin /*if (nds>=0)*/
/*������������� �������, �.�. ��������*/

      insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_post,:dat,:tip,
        :nds*(-1), :id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency);
      if (dat_report<current_timestamp ) then begin
        dat_report=current_timestamp;
      end
      for
        select om.dat,om.id_manager,
            r.sub4,sum(r.debetafter)-sum(r.kreditafter)
        from rep_ostatki_pc(:id_schet_post,:dat_report,
          :id_izg,:id_zak,
          null,null,
          :id_currency,null,
          null,null,
          null,null) r inner join naklo om
          on om.id_nakl=r.sub4
        where r.debetafter>0
        group by sub4,om.dat,om.id_izg,om.id_zak,om.id_manager
        order by om.dat
        into :dat_opl,
          :id_manager_nakl,:id_nakl_nakl,:transh
      do begin
        select sum(r.kreditafter)-sum(r.debetafter)
        from rep_ostatki_pc(:id_schet_post,:dat_report,
          :id_izg,:id_zak,
          :id_manager,:id_nakl,
          :id_currency, null,
          null,null,
          null,null) r 
        into :nds_neopl;
        if (nds_neopl<=0) then begin
          leave;
        end
        dat_transh=:dat;
        if (dat_transh<:dat_opl) then begin
          dat_transh=:dat_opl;
        end
        id_transh=gen_id(OPLNAKL_GEN, 1);
        insert into oplnakl  (id_from,id_to,transh,
            opl_data,id_manager,tip,id, id_currency)
          values (:id_nakl_nakl,:id_nakl,minnum(:transh,:nds_neopl),
            :dat_transh,:id_manager_nakl,1,:id_transh, :id_currency);
        execute procedure oplnakl_post_pc(:id_transh);
      end /*for naklo*/
    end /*if (nds>=0)*/
  end /*if schet*/
  if (((id_schet is null) or (schet_name='����� �� ������'))
    and (xoz_oper_name='������� ����������'))
  then begin
    /*������ ������ ��� �������������� ���������*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip=2;    
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=2;  
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4)
      values(:id_schet_dolg,:dat,:tip,
        (-1*:nds),:id_nakl,
        :id_zak,:id_izg,:id_manager,:id_nakl);
    --TODO  ��������� �������� ������
    execute procedure oplaty_auto_spend_pc(:id_schet_dolg, :id_nakl, :dat,
      :id_zak, :id_izg, :id_currency, 2);
  end

  select b.id_currency
    from bank_vw b
    where b.oid=:id_bank
    into :id_currency_bank;

  if (((id_schet is null) or (schet_name='����� �� ������'))
    and (xoz_oper_name='������� ���������� �����'))
  then begin

    /*������ ������ ��� �������������� ���������*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip=:tip_transh_vovz_pok_usl;
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=:tip_transh_vovz_pok_usl;
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_dolg_usl,:dat,:tip,
        (-1*:nds),:id_nakl,
        :id_zak,:id_izg,:id_manager,:id_nakl,:id_currency_bank);
    --TODO ��������� �������� �������
    execute procedure oplaty_auto_spend_pc(:id_schet_dolg_usl,:id_nakl, :dat,
      :id_zak,:id_izg, :id_currency, :tip_transh_vovz_pok_usl);
  end

  if (((id_schet is null) or (schet_name='������� � ��������'))
    and (xoz_oper_name='������ ������'))
  then begin
    insert into provodki (id_schet,dat,tip,
        debet,id_nakl,
        sub1,sub2)
      values(:id_schet_agent,:dat,:tip,
        :nds,:id_nakl,
        :id_agent,:id_currency_bank);
    /*��������, ��� ���������� ����� ������*/
    if (:nds_from>0) then begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2)
        values(:id_schet_agent,:dat,:tip,
          Round(:nds_from,2),:id_nakl,
          :id_agent,:id_currency_bank);
    end else begin
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2)
        values(:id_schet_agent,:dat,:tip,
          Round(-:nds_from,2),:id_nakl,
          :id_agent,:id_currency_bank);    
    end
  end  /*if '������� � ��������'*/
  
  if (((id_schet is null) or (schet_name='���ר�� � ������������ �����'))
    and (xoz_oper_name='������ ����������� �����'))
  then begin
    /* -65='����� � �������� � ����������� �����' */
    select oid
      from get_oid_objects_pc('����� � �������� � ����������� �����',:id_xoz_oper_tip)
      into :tip_transh;
    /*������ ������ ��� �������������� ���������*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip=:tip_transh;
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=:tip_transh;
    insert into provodki (id_schet,dat,tip,
      debet,id_nakl,
      sub1,sub2,sub3,sub4,sub5)
    values(:id_schet_post_uslug,:dat,:tip,
      :nds, :id_nakl,
      :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency);
    
    execute procedure oplaty_auto_spend_pc(:id_schet_post_uslug, :id_nakl,
      :dat, :id_izg,:id_zak, :id_currency, :tip_transh);
  end  /*if '���ר�� � ������������ �����'*/
        
  if ((id_schet is null) or (schet_name='������ �� ������')) then begin
    if ((id_bank is not null) and (:dat>='31.05.07')) then begin
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3)
        values(:id_schet_dengi,:dat,:tip,
          Round(:nds,2),:id_nakl,
          :id_zak,:id_bank,:id_currency_bank);
    end /*if (id_bank is not null)*/
  end /*if '������ �� ������'*/

  if (((id_schet is null) or (schet_name='���������� ���������'))
    and (xoz_oper_name='������ ������'))
  then begin
    /*��������, ��� ���������� ����� ������*/
    if (:nds_from>0) then begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(:nds_from,2),:id_nakl,
          :id_project,:id_statya_dox,:id_currency_bank,:id_zak,:id_izg,:id_manager);
    end else begin
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(-:nds_from,2),:id_nakl,
          :id_project,:id_statya_ras,:id_currency_bank,:id_zak,:id_izg,:id_manager);
    end        
  end  /*if '���������� ���������'*/
    
  update naklo om
    set om.posted=1
    where om.posted=0 and
      om.delmarked=0 and
      om.id_nakl=:id_nakl;
end^

SET TERM ; ^

GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE PLATEGY_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE PLATEGY_POST_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE PLATEGY_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE PLATEGY_POST_PC;

GRANT SELECT,INSERT,DELETE ON PROVODKI TO PROCEDURE PLATEGY_POST_PC;

GRANT SELECT,INSERT,DELETE ON OPLNAKL TO PROCEDURE PLATEGY_POST_PC;

GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO PROCEDURE PLATEGY_POST_PC;

GRANT EXECUTE ON PROCEDURE REP_OSTATKI_PC TO PROCEDURE PLATEGY_POST_PC;

GRANT EXECUTE ON PROCEDURE OPLNAKL_POST_PC TO PROCEDURE PLATEGY_POST_PC;

GRANT SELECT ON BANK_VW TO PROCEDURE PLATEGY_POST_PC;

GRANT EXECUTE ON PROCEDURE PLATEGY_POST_PC TO PROCEDURE PROVODKI_CHECK_DENGI_PC;
GRANT EXECUTE ON PROCEDURE PLATEGY_POST_PC TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT EXECUTE ON PROCEDURE PLATEGY_POST_PC TO PROCEDURE TEMP65_NAKLPBUX_POST_PC;
GRANT EXECUTE ON PROCEDURE PLATEGY_POST_PC TO PROCEDURE TEST_OPLATY_AUTO_SPEND_PC;
GRANT EXECUTE ON PROCEDURE PLATEGY_POST_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE PLATEGY_POST_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE PLATEGY_POST_PC TO POWER_USER;
