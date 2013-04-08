SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLR_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
/*declare variable id_schet integer;*/
  declare variable schet_name varchar(50);
  declare variable id_schet_dolg integer;
  declare variable id_schet_comiss integer;
  declare variable id_schet_bux_tara integer;
  declare variable id_schet_bux integer;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_manager integer;
  declare variable dat date;
  declare variable tip integer;
  declare variable classid integer;
  declare variable nds numeric(15,4);
  declare variable id_nakl2 integer;
  declare variable id_schet_tip integer;
  declare variable id_uchet_politics integer;
  declare variable id_uchet_politics_in integer;
  declare variable id_sklad integer;
  declare variable tara integer;
  declare variable id_nakld integer;
  declare variable sebest double precision;
  declare variable id_schet_premiya integer;
  declare variable depend_id_nakl integer;
  declare variable id_schet_dolg_nal integer;
  declare variable id_currency_uah integer;
  declare variable max_dat_depend_nakl date;
  declare variable id_nakl_depend integer;
  declare variable id_xoz_oper integer;
  declare variable id_xoz_oper_tip integer;
  declare variable xoz_oper_name varchar(50);
  declare variable id_schet_post integer;
  declare variable id_sklad_seb integer;
  declare variable has_role integer;
begin
  /* Procedure Text */
  select om.tip,
      om.id_izg,om.id_zak,om.id_manager,
      om.nds,om.dat,om.id_nakl,om.id_sklad,om.id_currency_to
    from naklo om
    where om.id_nakl=:id_nakl and om.delmarked=0
    into :tip,
      :id_izg,:id_zak,:id_manager,
      :nds,:dat,:id_nakl2,:id_sklad,:id_xoz_oper;
   /**/


  /*��������*/
  if (id_nakl2 is null) then begin
    execute procedure error('�������� �� ������');
  end
  select oid
    from GET_OID_OBJECTS_PC('��������� ���������',-100)
    into :classid;
  if (tip<>classid) then begin
    execute procedure error('������ �������� �� ��������� ���������');
  end
    select max(dat)
      from naklo om
      where om.tip=5 and om.delmarked=0 and om.posted=1 and
        om.parent_id_nakl=:id_nakl
      into :max_dat_depend_nakl;
  if (max_dat_depend_nakl is not null) then begin
    if (:dat>incdate(firstdaymonth(max_dat_depend_nakl),0,2,0)) then begin
      execute procedure error('���� �������� '||
        datetostr(:max_dat_depend_nakl, '%d.%m.%y') ||
        ', ������� ���� ������ ���� <='||
        datetostr(incdate(firstdaymonth(max_dat_depend_nakl),0,2,0), '%d.%m.%y'));
    end
  end
  execute procedure naklo_can_modify_common_pc(:dat,:id_manager);

  select oid
    from get_oid_objects_pc('������������� ��������',-100)
    into :id_xoz_oper_tip;
  select name
    from get_name_objects_pc(:id_xoz_oper,:id_xoz_oper_tip)
    into :xoz_oper_name;
  xoz_oper_name=trim(:xoz_oper_name);
  if (xoz_oper_name='��������� ��������� � ��� ���������') then begin
    if (not exists( select v.name
      from vlad_vw v
      where v.id=:id_zak and v.delmarked=0))
    then begin
      execute procedure error('���������� ���� ������ ���� ����� ������');
    end
    select has_role from get_roles_pc('POWER_USER') into :has_role;
    if (has_role=0) then begin
      select has_role from get_roles_pc('BUXG') into :has_role;
    end
    if (has_role=0) then begin
      if (current_user='SYSDBA') then begin
        has_role=1;
      end
    end
    if (has_role=0) then begin
      execute procedure error('������ ����������� � �������� ����� ��������� ����� ���������');
    end
  end

  /*�������������� ��������*/
  if (id_schet =0 ) then begin
    id_schet = null;
  end

  if (/*$$IBEC$$ (:posted = 1) and $$IBEC$$*/ (id_schet is null)) then begin
    execute procedure naklr_unpost_pc(:id_nakl);
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
    from GET_OID_OBJECTS_PC('������������',:id_schet_tip)
    into :id_schet_comiss;
  select oid
    from GET_OID_OBJECTS_PC('������������� ���',:id_schet_tip)
    into :id_schet_bux;
  select oid
    from GET_OID_OBJECTS_PC('������������� ��� ����',:id_schet_tip)
    into :id_schet_bux_tara;
  select oid
    from GET_OID_OBJECTS_PC('������',:id_schet_tip)
    into :id_schet_premiya;
  select oid
    from GET_OID_OBJECTS_PC('���ר�� � ������������',:id_schet_tip)
    into :id_schet_post;
  select oid
    from GET_OID_OBJECTS_PC('�������� �������� �������������',-100)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('������������� �ר�',:id_uchet_politics_in)
    into :id_uchet_politics_in;

  select oid from GET_OID_OBJECTS_PC('�������� �����',:id_schet_tip) into :id_schet_dolg_nal;
  select oid from get_oid_objects_pc('��� �����',-100) into :id_currency_uah;
  select oid from get_oid_objects_pc('UAH',:id_currency_uah) into :id_currency_uah;    

  /*�������� �������� �� ��������� ������ �� ������ �����. ��� ��������������*/
  if (id_schet is not null) then begin
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.tip=:tip
        and pr.id_schet=:id_schet;
  end     

  /*��������*/
  if ((id_schet is null) or (schet_name='����� �� ������') ) then begin
    insert into provodki (id_schet,dat,tip,
        debet,id_nakl,
        sub1,sub2,sub3,sub4)
      values(:id_schet_dolg,:dat,:classid,
        :nds,:id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl);
  end /*����� �� ������*/
  if (((id_schet is null) or (schet_name='���ר�� � ������������'))
    and (xoz_oper_name='��������� ��������� � ��� ���������'))
  then begin
    /*������ ������ ��� �������������� ���������*/
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=1;
    /*�� ������ ������, � �� �������� ������ �� ���������*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip=1;
    insert into provodki (id_schet,dat,tip,
      kredit,id_nakl,
      sub1,sub2,sub3,sub4,sub5)
    values(:id_schet_post,:dat,:tip,
      :nds, :id_nakl,
      :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_uah);
    execute procedure oplaty_auto_spend_pc(:id_schet_post,:id_nakl,:dat, :id_izg,:id_zak, :id_currency_uah, 1,0);
  end  /*if ���ר�� � ������������*/
  if ((id_schet is null) or (schet_name='������������') ) then begin    
    insert into provodki (id_schet,dat,tip,
        debet,id_nakl,
        sub1)
      values(:id_schet_comiss,:dat,:classid,
        :nds,:id_nakl,
        :id_nakl);
  end /*'������������'*/
  if (((id_schet is null) or (schet_name='�������� �����'))
    and (xoz_oper_name<>'��������� ��������� � ��� ���������')) then
  begin
    insert into provodki (id_schet,dat,tip,
      debet,id_nakl,
      sub1,sub2,sub3,sub4,sub5)
    values(:id_schet_dolg_nal,:dat,:tip,
      :nds, :id_nakl,
      :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_uah);
    for
      select id_nakl
        from naklo om
        where om.parent_id_nakl=:id_nakl and
          om.posted=1 and
          om.tip=5
        into :id_nakl_depend
    do begin
      execute procedure naklo_post_pc(:id_nakl_depend,:id_schet_dolg_nal);
    end
  end /*'�������� �����'*/  
  
  
  if ((id_schet is null) or
  (schet_name='������������� ���') or
  (schet_name='������������� ��� ����')) then begin
    if (dat>='31.05.06') then begin
      select id_uchet_politics
        from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
        into :id_uchet_politics;
      if (id_uchet_politics is not null) then begin
        for
          select t.tara,ot.id_nakld
            from naklot ot inner join tovar t
              on ot.id_tovar=t.oid
            where ot.id_nakl=:id_nakl
            into :tara,:id_nakld
        do begin

          if (((id_schet is null) or (schet_name='������������� ���')) and
            (:tara=2))
          then begin
            select sebest
              from naklot_sebest2_naklr_pc(:ID_NAKLD,:id_uchet_politics_in,:id_schet_bux)
              into :sebest;              
          end

          if (((id_schet is null) or (schet_name='������������� ��� ����')) and
            (:tara=1))
          then begin
            select sebest
              from naklot_sebest2_naklr_pc(:ID_NAKLD,:id_uchet_politics_in,:id_schet_bux_tara)
              into :sebest;              
          end

          if (((id_schet is null) or (schet_name='������������� ���')) and
            (xoz_oper_name='��������� ��������� � ��� ���������') and
            (:tara=2) and
            (:id_uchet_politics is not null) and
            (:dat>='31.05.06')) then
          begin
            select id_sklad
              from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
              into :id_sklad_seb;
            select sebest
              from NAKLOT_SEBEST2_NAKLR_ASP_PC(:ID_NAKLD,:id_uchet_politics,:id_schet_bux)
              into :sebest;
/*$$IBEC$$             select sebest
              from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_bux,8,1)
              into :sebest; $$IBEC$$*/
            execute procedure naklp_sebest_recount_pc(:id_nakl, :id_nakld,
              :id_sklad_seb,null,id_schet_bux,:tip,null, 2);
          end /*if (xoz_oper_name='��������� ��������� � ��� ���������')*/

          if (((id_schet is null) or (schet_name='������������� ��� ����')) and
            (xoz_oper_name='��������� ��������� � ��� ���������') and
            (:tara=1) and
            (:id_uchet_politics is not null) and
            (:dat>='31.05.06')) then
          begin
            select sebest
              from NAKLOT_SEBEST2_NAKLR_ASP_PC(:ID_NAKLD,:id_uchet_politics,:id_schet_bux_tara)
              into :sebest;
              /*$$IBEC$$  select sebest
              from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_bux_tara,9,1)
              into :sebest; $$IBEC$$*/
          end /*if (xoz_oper_name='��������� ��������� � ��� ���������')*/ 

        end/*for id_nakld*/
      end /* if (dat>='31.12.04') then begin*/
    end /*if id_uchet_politics is not null*/
  end /*if �������������*/
  
  if ((id_schet is null) or (schet_name='������') ) then begin
    for
      select id_nakl
      from naklo om
      where om.tip=5 and om.delmarked=0 and om.posted=1 and
        om.parent_id_nakl=:id_nakl
      into :depend_id_nakl
    do begin
      execute procedure naklo_post_pc(:depend_id_nakl,:id_schet_premiya);
    end
  end/*if schet_name='������'*/
  
  update naklo om
    set om.posted =1
    where om.id_nakl=:id_nakl;
end^

SET TERM ; ^

DESCRIBE PROCEDURE NAKLR_POST_PC
'���������� ��������� ���������, ����������
� ������� naklo.';

GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE NAKLR_POST_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE NAKLR_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLR_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLO_CAN_MODIFY_COMMON_PC TO PROCEDURE NAKLR_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE NAKLR_POST_PC;

GRANT SELECT ON VLAD_VW TO PROCEDURE NAKLR_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_ROLES_PC TO PROCEDURE NAKLR_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLR_UNPOST_PC TO PROCEDURE NAKLR_POST_PC;

GRANT SELECT,INSERT,DELETE ON PROVODKI TO PROCEDURE NAKLR_POST_PC;

GRANT SELECT,DELETE ON OPLNAKL TO PROCEDURE NAKLR_POST_PC;

GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO PROCEDURE NAKLR_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLO_POST_PC TO PROCEDURE NAKLR_POST_PC;

GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_SETTINGS_PC TO PROCEDURE NAKLR_POST_PC;

GRANT SELECT ON NAKLOT TO PROCEDURE NAKLR_POST_PC;

GRANT SELECT ON TOVAR TO PROCEDURE NAKLR_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_NAKLR_PC TO PROCEDURE NAKLR_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_NAKLR_ASP_PC TO PROCEDURE NAKLR_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO PROCEDURE NAKLR_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLR_POST_PC TO TRIGGER NAKLO_AUDIT_AI80;
GRANT EXECUTE ON PROCEDURE NAKLR_POST_PC TO TRIGGER NAKLO_AUDIT_AU80;
GRANT EXECUTE ON PROCEDURE NAKLR_POST_PC TO TRIGGER NAKLR_VW_AI;
GRANT EXECUTE ON PROCEDURE NAKLR_POST_PC TO TRIGGER NAKLR_VW_AU10;
GRANT EXECUTE ON PROCEDURE NAKLR_POST_PC TO PROCEDURE MAKE_FIN_TRASH;
GRANT EXECUTE ON PROCEDURE NAKLR_POST_PC TO PROCEDURE NAKLO_MAKE_NAKLR_PC;
GRANT EXECUTE ON PROCEDURE NAKLR_POST_PC TO SPIVAK;
GRANT EXECUTE ON PROCEDURE NAKLR_POST_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE NAKLR_POST_PC TO BOSSES;
GRANT EXECUTE ON PROCEDURE NAKLR_POST_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE NAKLR_POST_PC TO MANAGER;
GRANT EXECUTE ON PROCEDURE NAKLR_POST_PC TO POWER_USER;
GRANT EXECUTE ON PROCEDURE NAKLR_POST_PC TO SKLAD;
GRANT EXECUTE ON PROCEDURE NAKLR_POST_PC TO SNAB;
