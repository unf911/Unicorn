SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLO_POST_PC (
    id_nakl integer,
    id_schet integer)
as
declare variable schet_name varchar(50);
declare variable serror varchar(50);
declare variable id_partiya bigint;
declare variable id_schet_komiss integer;
declare variable id_schet_prem integer;
declare variable id_schet_tip integer;
declare variable id_schet_sebest_sklad integer;
declare variable tip smallint;
declare variable posted smallint;
declare variable id_det integer;
declare variable delmarked smallint;
declare variable id_tovar integer;
declare variable id_nakld integer;
declare variable id_sklad integer;
declare variable dat date;
declare variable nds double precision;
declare variable kolotp double precision;
declare variable cena double precision;
declare variable parent_id_nakl integer;
declare variable tara integer;
declare variable tara_cur_pos double precision;
declare variable tara_sum double precision;
declare variable nalog_nds double precision;
declare variable id_manager integer;
declare variable id_uchet_politics integer;
declare variable sebest double precision;
declare variable id_sklad_to integer;
declare variable id_uchet_politics_in integer;
declare variable parent_delmarked integer;
declare variable parent_id_manager integer;
declare variable kolotp_temp double precision;
declare variable parent_id_izg integer;
declare variable parent_id_zak integer;
declare variable id_currency_uah integer;
declare variable id_schet_dolg_nal integer;
declare variable id_schet_finrez integer;
declare variable id_project integer;
declare variable id_izg integer;
declare variable id_zak integer;
declare variable id_statya_dox integer;
declare variable id_statya_dr_tip integer;
declare variable sebest_nakl double precision;
declare variable id_statya_ras integer;
declare variable id_currency_sebest integer;
declare variable parent_tip integer;
declare variable tip_vozvrat integer;
begin

  /* �������� �������� �� ������������ ( ������� �����, �
  ��������� �� ����� ��������)*/
  select
      n.posted,n.delmarked,n.id_sklad,n.tip,n.dat,
      n.parent_id_nakl,n.nds,n.nalog_nds,
      n.id_manager,n.id_sklad_to,n.id_izg,n.id_zak
    from
      naklo n
    where
      n.id_nakl = :id_nakl
    into
      :posted,:delmarked,:id_sklad,:tip,:dat,
      :parent_id_nakl,:nds,:nalog_nds,
      :id_manager,:id_sklad_to,:id_izg,:id_zak;
      
    if ((tip<>5) and (tip<>6) and  (tip<>103) and (tip<>30)) then begin
      execute procedure error ('������ �������� �� ��������� ���������');
    end  
    if (delmarked<>0) then begin
      execute procedure error ('������ �������� �������� ���������');
    end
    if (id_schet =0 ) then begin
      id_schet = null;
    end    
    if ((posted<>0) and (id_schet is null)) then begin
      execute procedure error ('������ �������� ��� ����������� ��������');
    end      
    if ((posted=0) and (id_schet is not null)) then begin
      sError = '������ �������� �������� �� ����������� ��������. id_schet=' || coalesce(:id_schet,999);
      execute procedure error (sError);
    end
    /*��� �������� �������� �������� ��������*/
    if (tip=5) then begin
      select om.delmarked,om.id_manager,om.id_izg,om.id_zak,om.tip
        from naklo om
        where om.id_nakl=:parent_id_nakl
        into :parent_delmarked,:parent_id_manager,:parent_id_izg,:parent_id_zak,:parent_tip;
    end
    if ((tip=5) and (id_schet is null)) then begin
      /*��� ������ ���������� ��������� ������� ������������
        ��������� � ��������*/
      if ((parent_id_nakl is null) and (id_schet is null) and (:dat>'01.10.2003')) then begin
        execute procedure error ('������ �������� ��� �������� ��������� ���������');
      end

      if (:parent_delmarked<>0) then begin
        execute  procedure error ('������ �������� � ��������� ���˨���� ��������� ���������');
      end
      /*$$IBEC$$       if (:parent_posted<>1) then begin
        execute  procedure error ('������ �������� � ��������� ������������� ��������� ���������');
      end $$IBEC$$*/
      if (:parent_id_manager<>:id_manager) then begin
        execute  procedure error ('������ �������� � ��������� ��������� �����, ��� � ��������� ���������');
      end /*if (:parent_manager<>:id_manager)*/
    end /*((tip=5) and (id_schet is null))*/
    if ((tip<>6) and (user in ('STROGAL'))) then begin
      execute procedure error('����, ��������� ����� ������ �������.');
    end

  if (tip<>5 and parent_id_nakl is not null) then begin
    /*�������� ����� �������� ���� �� ������ �� ������, � ��������
      �������, ���������, ��������*/
    update naklo n
      set n.parent_id_nakl = null
      where n.id_nakl=:id_nakl and n.parent_id_nakl is not null;
  end


  select oid
    from GET_OID_OBJECTS_PC('�������� �������� �������������',-100)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('�������������� �ר�',:id_uchet_politics_in)
    into :id_uchet_politics_in;      
  select oid
    from GET_OID_OBJECTS_PC('��� �����',-100)
    into :id_schet_tip;
  select oid
    from GET_OID_OBJECTS_PC('������������',:id_schet_tip)
    into :id_schet_komiss;
  select oid
    from GET_OID_OBJECTS_PC('������',:id_schet_tip)
    into :id_schet_prem;       
  select oid
    from GET_OID_OBJECTS_PC('������������� �����',:id_schet_tip)
    into :id_schet_sebest_sklad;
  select oid
    from GET_OID_OBJECTS_PC('���������� ���������',:id_schet_tip)
    into :id_schet_finrez;
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
    from GET_OID_OBJECTS_PC('����� �� ������� �������',:id_statya_dr_tip)
    into :id_statya_dox;
  select oid
    from GET_OID_OBJECTS_PC('������ �� �������� ������������� ������',:id_statya_dr_tip)
    into :id_statya_ras;


  select oid from GET_OID_OBJECTS_PC('�������� �����',:id_schet_tip) into :id_schet_dolg_nal;
  select oid from get_oid_objects_pc('��� �����',-100) into :id_currency_uah;
  select oid from get_oid_objects_pc('UAH',:id_currency_uah) into :id_currency_uah;
  select oid from get_oid_objects_pc('������� ����������',-100) into :tip_vozvrat;

/* ������ ��� �������� ��� ������ �������?
  ��� ��� ����� �������� ������ ������������� ���
  ����� ����� �������*/
  select id_uchet_politics
    from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
    into :id_uchet_politics;
/*  id_uchet_politics = id_uchet_politics_in;*/
  if (id_schet is not null) then begin
    select name
      from get_name_objects_pc(:id_schet,:id_schet_tip)
      into schet_name;
  end
  /*�������� �������� �� ��������� ������ �� ������ �����. ��� ��������������*/
  if (id_schet is not null) then begin
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.tip=:tip
        and pr.id_schet=:id_schet;
  end             
    
    /*����� ���� ����� ����� ��������� =0*/
    tara_sum=0;
    /*��� ��������� ���������� ��������� �����������*/
    if (id_schet is null) then begin
       /*��������� ����*/
       for
         select KOLOTP,KOLOTP_OLD
         from generate_tara(:id_nakl)
         into :kolotp_temp,:kolotp_temp
       do begin
       end

    /*���� ������ ��� ���������, ����� ��������������, �� ��� ���� ��������
      ����� ������� � ����������� ������*/
        /* Procedure Text */
      execute procedure check_naklo_consistency_pc(:id_nakl);
      execute procedure naklo_sum_recount(:id_nakl,0);
      select nds from naklo om where om.id_nakl=:id_nakl into :nds;
    end
    for
      select
        t.id_tovar,t.id_nakld,t.kolotp,t.cena
      from
        naklot t
      where
        t.id_nakl = :id_nakl
      into :id_tovar,:id_nakld,:kolotp,:cena
    do begin
      /*����� ���� ������� ������ ��� ��������*/
      if (tip=5) then begin
        /*����� ��� �� ����� �����.*/
        tara=null;
        select t.tara
          from tovar t
          where t.oid=:id_tovar
          into :tara;
        if (tara=1) then begin
          /*���� ��, �� ����������� ����� ���� ���� ���������*/
          tara_cur_pos=0;
          tara_cur_pos=Round(:kolotp*Round(:cena,2),2);
          tara_sum=tara_sum+tara_cur_pos;
        end
      end /*����� ���� ������� ������ ��� ��������*/
      
      /*����������� ������������� ��������� �������*/

      if (tip in (5,30,103)) then begin
        if ((id_schet is null) or (schet_name='������������� �����') ) then begin
          if (:id_uchet_politics is not null) then begin
            select p.id_partiya, p.sebest
              from naklot_sebest2_post_pc(:id_nakl, :id_nakld, 3) p
              into :id_partiya, :sebest;
            if (tip=103) then begin
              execute procedure naklp_sebest4_recount_pc(:id_nakld, :id_sklad_to, :id_partiya,:tip,4);
            end
          end /*(:id_uchet_politics is not null)*/
        end /*if id_schet= ������������� �����*/
      end /*if tip*/
      /*��� ��������� ���������� ����� ������� �� ����*/
      if (id_schet is null) then begin
        for
          select nd.id_det
            from naklodet nd
            where nd.id_nakld=:id_nakld
            into :id_det
        do begin
          /*third loop*/
          /* �������� ���� �������*/
          execute procedure naklodet_post_pc(id_det);
        end
      end
    end /* second */
    /*����� ���� � ���*/
    tara_sum=Round(:tara_sum*(1+:nalog_nds),2);


  /*������ ��� �������� �� ������*/
  if (tip=5) then begin
    /*�������� �� ����� "������������"*/
    if ((id_schet is null) or
       (schet_name='������������') ) then begin
      insert into provodki (id_schet,dat,id_nakl,
        sub1,
        kredit,tip)
        values(:id_schet_komiss,:dat,:id_nakl,
        :parent_id_nakl,
        :nds,:tip);
    end /*if id_schet*/
    if ((id_schet is null) or (schet_name='�������� �����') ) then begin

      insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_dolg_nal,:dat,:tip,
        :nds, :id_nakl,
        :parent_id_izg,:parent_id_zak,:parent_id_manager,:parent_id_nakl,:id_currency_uah);
    end /*'�������� �����'*/     
    if ((id_schet is null) or
       (schet_name='������') ) then begin
      /* +��� */
      insert into provodki (id_schet,dat,id_nakl,
        sub1,sub2,sub3,sub4,
        kredit,tip)
        values(:id_schet_prem,:dat,:id_nakl,
        :parent_id_izg,:parent_id_zak,:parent_id_manager,:parent_id_nakl,
        :nds,:tip);
      /* -���� */
      insert into provodki (id_schet,dat,id_nakl,
        sub1,sub2,sub3,sub4,
        debet,tip)
        values(:id_schet_prem,:dat,:id_nakl,
        :parent_id_izg,:parent_id_zak,:parent_id_manager,:parent_id_nakl,
        :tara_sum,:tip);
    end /*if id_schet= ������*/
    if ((id_schet is null) or (schet_name='���������� ���������') ) then begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(:nds,2),:id_nakl,
          :id_project,:id_statya_dox,:id_currency_uah,:id_izg,:id_zak,:id_manager);
      SELECT u.id_currency_sebest
        FROM spr_uchet_politics_vw u
        WHERE u.oid=:id_uchet_politics AND u.delmarked=0
        INTO :id_currency_sebest;
      select sum(kredit)
        from provodki pr
        where pr.id_schet=:id_schet_sebest_sklad and
          pr.tip=:tip and pr.id_nakl=:id_nakl
        into :sebest_nakl;
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(:sebest_nakl,2),:id_nakl,
          :id_project,:id_statya_ras,:id_currency_sebest,:id_izg,:id_zak,:id_manager);
    end /*if id_schet= '���������� ���������'*/
  end /*if tip=5*/
  if (tip=30) then /*���������*/
  begin
    select oid
      from GET_OID_OBJECTS_PC('������ �� ��������',:id_statya_dr_tip)
      into :id_statya_ras;
    if ((id_schet is null) or (schet_name='���������� ���������') ) then begin
      SELECT u.id_currency_sebest
        FROM spr_uchet_politics_vw u
        WHERE u.oid=:id_uchet_politics AND u.delmarked=0
        INTO :id_currency_sebest;
      select sum(kredit)
        from provodki pr
        where pr.id_schet=:id_schet_sebest_sklad and
          pr.tip=:tip and pr.id_nakl=:id_nakl
        into :sebest_nakl;
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(:sebest_nakl,2),:id_nakl,
          :id_project,:id_statya_ras,:id_currency_sebest,:id_izg,:id_zak,:id_manager);
    end /*if id_schet= '���������� ���������'*/
  end/*if tip=30*/
  /*������ 1 � posted ��� ������� ������������� ���������*/
  if (id_schet is null) then begin
    update naklo n
      set n.posted=1
      where n.id_nakl=:id_nakl and n.posted=0;
  end
  /* ����������� ������� � �������������*/
END
^

SET TERM ; ^


