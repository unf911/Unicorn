SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLP_POST_PC (
    id_nakl integer,
    id_schet integer)
as
declare variable schet_name varchar(50);
declare variable id_det integer;
declare variable tip smallint;
declare variable posted smallint;
declare variable delmarked smallint;
declare variable id_tovar integer;
declare variable id_nakld integer;
declare variable id_sklad integer;
declare variable id_uchet_politics integer;
declare variable str varchar(50);
declare variable id_pos integer;
declare variable parent_id_nakl integer;
declare variable kolotp numeric(15,4);
declare variable serror varchar(100);
declare variable sebest double precision;
declare variable cena double precision;
declare variable id_schet_tip integer;
declare variable id_schet_prix integer;
declare variable dat date;
declare variable id_currency integer;
declare variable nalog_nds double precision;
declare variable parent_id_izg integer;
declare variable parent_id_zak integer;
declare variable parent_id_manager integer;
declare variable tip_prov integer;
declare variable id_uchet_politics_in integer;
declare variable id_partiya bigint;
declare variable id_schet_sebest_sklad integer;
declare variable id_tara integer;
declare variable kolotp_temp double precision;
declare variable tip_vozvrat integer;
declare variable parent_tip integer;
declare variable has_role integer;
declare variable naklp_modified integer;
declare variable parent_id_sklad integer;
declare variable id_schet_finrez integer;
declare variable id_statya_dr_tip integer;
declare variable id_statya_dox integer;
declare variable id_currency_sebest integer;
declare variable id_izg integer;
declare variable id_zak integer;
declare variable id_manager integer;
declare variable id_project integer;
declare variable sebest_nakl double precision;
declare variable nds double precision;
declare variable id_statya_dox_nedopost integer;
declare variable sum_tovarwithnds double precision;
declare variable id_statya_rasx_ot_vozvratov integer;
declare variable id_statya_dox_za_dostavku integer;
declare variable id_rasx integer;
declare variable id_sklad_otgr integer;
declare variable sklad_name_otgr varchar(50);
begin

  /* �������� �������� �� ������������ ( ������� �����, �
  ��������� �� ����� ��������)*/

  select n.posted,n.delmarked,n.id_sklad,n.tip,
      n.parent_id_nakl,
      n.dat,
      n.id_currency,n.nalog_nds,n.id_izg,n.id_zak,n.id_manager
    from naklo n
    where n.id_nakl = :id_nakl
    into :posted,:delmarked,:id_sklad,:tip,
      :parent_id_nakl,
      :dat,:id_currency,:nalog_nds,:id_izg,:id_zak,:id_manager;

  if ((tip<>1) and (tip<>2) and (tip<>-110 /*�������*/)) then begin
    execute procedure error ('������ �������� �� ��������� ���������');
  end  
  if (delmarked<>0) then begin
    execute procedure error ('������ �������� �������� ���������');
  end
  if (id_schet =0 ) then begin
    id_schet = null;
  end
  if ((parent_id_nakl is null) and (tip=1) and (dat>'04.10.04')
   and (id_schet is null)) then begin
    execute procedure error ('������ �������� ��� �������� ��������� ���. ���������');
  end



  if (:tip in(1,2, -110 /*�������*/)) then begin

    
   /*�������, ������� ������ ��������� ���� ���������� ����� ������, �.� ����� 7 �����*/
    if ((posted=0) and (id_schet is null)) then begin
    /*�������, ������� ������ ��������� ���� ���� �� ������ ��� naklp_modified ����*/
      select cast(p_value as integer)
        from get_param_pc('naklp_modified')
        into :naklp_modified;
      if ((daysbetween(:dat,current_timestamp)>naklp_modified)
        and (current_user<>'SYSDBA'))
      then begin
        execute procedure error('��������� ��������� ������� ������� ���� ����� ' || coalesce(naklp_modified,0) || ' ���� �����' );
      end  /*���� ������ ��� naklp_modified (90) ����*/
      if (current_timestamp-firstdaymonth(current_timestamp)<=7) then begin
        /*������ �� 7 ����� ����� ��������� ���������� �����*/
        if (:dat<firstdaymonth (incdate(current_timestamp,0,-1,0))) then begin
          select has_role from get_roles_pc('SKLAD') into :has_role;
          if (has_role=1) then begin
            sError ='������ ��������� ���������� ��������� ������ �� ������ ����������� ������';
            execute procedure error(sError);
          end
        end
      end else begin
        /*����� 7 ����� ������ ��������� ���������� �����*/
        if (:dat<firstdaymonth(current_timestamp)) then begin
          select has_role from get_roles_pc('SKLAD') into :has_role;
          if (has_role=1) then begin
            sError ='������ ��������� ���������� ��������� �� ������ ����� ������';
            execute procedure error(sError);
          end
        end /*if (:dat<firstdaymonth(current_timestamp))*/
      end/* if (current_timestamp-firstdaymonth(current_timestamp)<=5)  */
    end/*if ((posted=0) and (id_schet is null))*/ 
  end /*if (:tip in(1,2))*/
  
  if ((posted=0) and (id_schet is not null)) then begin
    sError = '������ �������� �������� �� ����������� ��������' || coalesce(:id_schet,999);
    execute procedure error (sError);
  end
  if (id_schet is null) then begin
    /*��������� ����*/
    for
      select ID_TARA,KOLOTP,KOLOTP_OLD
        from generate_tara(:id_nakl)
       into :id_tara,:kolotp_temp,:kolotp_temp
    do begin
    end
    
    /*����� �������� ������� ����������� ���������� ��������*/
    update naklo n
      set n.posted=1
      where n.id_nakl=:id_nakl and n.posted=0;
  end  

  
  /*���� ��������� ���� parent_id_nakl,
    �� ���������� ���� � �������, �������������
    ������������� */
  if (parent_id_nakl is not null ) then begin
    execute procedure naklp_prices_naklpbux_pc(:id_nakl);
    select id_currency,
        om.nalog_nds,
        om.nds
      from naklo om
      where om.id_nakl=:id_nakl
      into :id_currency,
        :nalog_nds,
        :nds;
    select id_izg, id_zak, id_manager, tip, id_sklad
      from naklo om
      where om.id_nakl=:parent_id_nakl
      into :parent_id_izg,:parent_id_zak,:parent_id_manager,:parent_tip,
        :parent_id_sklad;

    select oid from get_oid_objects_pc('�������',-100) into :tip_vozvrat;
    if (parent_tip=:tip_vozvrat) then begin

      select parent_id_nakl from vozvrat_vw om where om.id_nakl=:parent_id_nakl into :id_rasx;

      select max(id_sklad)
      from naklo om inner join naklot ot on ot.id_nakl=om.id_nakl
      where om.tip=5 and om.parent_id_nakl=:id_rasx
        and ot.id_tovar in (select id_tovar from naklot ot2 where ot2.id_nakl=:id_nakl)
      into :id_sklad_otgr;

      select name from objects where oid=:id_sklad_otgr into :sklad_name_otgr;
      if (:id_sklad_otgr<>:id_sklad) then begin
        execute procedure error ('����� �� ��������� �� ������� ��������, �� ������� �������� �������. ' || trim(sklad_name_otgr));
      end
    end
          
  end /*if (parent_id_nakl is not null )*/
  /*���������� � ������������ ��������*/
  select oid
    from GET_OID_OBJECTS_PC('��� �����',-100)
    into :id_schet_tip;
  if (id_schet is not null) then begin
    select name
      from get_name_objects_pc(:id_schet,:id_schet_tip)
      into schet_name;
  end    
  select oid
    from GET_OID_OBJECTS_PC('������������ ��������',:id_schet_tip)
    into :id_schet_prix;
  select oid
    from GET_OID_OBJECTS_PC('������������� �����',:id_schet_tip)
    into :id_schet_sebest_sklad;
  select oid
    from GET_OID_OBJECTS_PC('���������� ���������',:id_schet_tip)
    into :id_schet_finrez;
  select oid
    from GET_OID_OBJECTS_PC('��� ������ ������� � ��������',-100)
    into :id_statya_dr_tip;
  select oid
    from GET_OID_OBJECTS_PC('����� �� ��������',:id_statya_dr_tip)
    into :id_statya_dox;
  select oid
    from GET_OID_OBJECTS_PC('��� �������',-100)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('�����',:id_project)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('����� �� ������������',:id_statya_dr_tip)
    into :id_statya_dox_nedopost;
  select oid
    from GET_OID_OBJECTS_PC('������ �� ��������� ������ ���������',:id_statya_dr_tip)
    into :id_statya_rasx_ot_vozvratov;
  select oid
    from GET_OID_OBJECTS_PC('����� �� �������� ������',:id_statya_dr_tip)
    into :id_statya_dox_za_dostavku;




  if (tip=1) then begin
    select oid
      from GET_OID_OBJECTS_PC('��������� ��������� ���������',-100)
      into :tip_prov;
  end else begin
    tip_prov=tip;
  end
  select oid
    from GET_OID_OBJECTS_PC('�������� �������� �������������',-100)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('�������������� �ר�',:id_uchet_politics_in)
    into :id_uchet_politics_in;
  select id_uchet_politics
    from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
    into :id_uchet_politics;

  /*�������� �������� �� ��������� ������ �� ������ �����. ��� ��������������*/
  if (id_schet is not null) then begin
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.tip=:tip_prov
        and pr.id_schet=:id_schet;
  end
  if ((id_schet is null) or
    (schet_name='������������ ��������')  )
  then begin
    /*��� ��������� ���������� ������� �� ������, ���� ������� ����
    ���� �������, �� ������ �� ��������� ����� �������� ��-�� ����������
    ������ � ������ ����. ������ ��������� ��� �������� �� ���� ���,
    � ����� ��� ������� � ����� �� ������
    */
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.id_schet=:id_schet_prix
        and pr.tip=:tip_prov;
  end
    
  for
    select
      t.id_tovar,t.id_nakld,t.id_pos,t.cena,t.kolotp
    from
      naklot t
    where
      t.id_nakl = :id_nakl
    into :id_tovar,:id_nakld,:id_pos,:cena,:kolotp
  do begin
    
    if ((tip=1) or (tip=-110)/*�������*/) then begin
    /*����������� ��� 555 ��� ��������� ���������,
        �.�. ��� 1 ����� ��� �������� � ��������� */
       if ((id_schet is null) or
         (schet_name='������������ ��������')  )
       then begin
           /*��� ��������� ���������� ������� �� ������, ���� ������� ����
          ���� �������, �� ������ �� ��������� ����� �������� ��-�� ����������
          ������ � ������ ����. ������ ��������� ��� �������� �� ���� ���,
          � ����� ��� ������� � ����� �� ������
          */
          insert into provodki (id_schet,dat,tip,
              kredit,kredit_kolotp,id_nakl,
              sub1,sub2,sub3,sub4,
              sub5,sub6,sub7,attr1)
            values(:id_schet_prix,:dat,:tip_prov,
              Round(Round((:cena*:kolotp),2)*(1+:nalog_nds),2),
              :kolotp, :id_nakl,
              :parent_id_izg,:parent_id_zak,:parent_id_manager,:parent_id_nakl,
              :id_tovar,:id_currency,:parent_id_sklad,:id_nakld);
       end  /*������������ ��������*/

       if ((id_schet is null) or (schet_name='������������� �����') ) then begin
        if (:id_uchet_politics is not null) then begin
          /*���������� ������������� �� ������*/
          /*���� ������, �� ���� ������������ ������������� �� �������� �����*/
          select sebest
            from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,2,2)
            into :sebest;              
          select sebest,id_partiya
            from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,1,2)
            into :sebest,:id_partiya;
/*$$IBEC$$           end $$IBEC$$*/
/*$$IBEC$$           if (parent_id_nakl is null )  then begin
            $$IBEC$$*//*���� ��� ������������ ���������*/
            /*����� 5 �������. ���� ������������� � �����������*//*$$IBEC$$ 
            select sebest
              from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,5,2)
              into :sebest;
          end  $$IBEC$$*//*if parent_id_nakl is null*/
          /* ����� ��� �������� ��������� ����, ������ ������� ����*/
        end /*id_uchet*/
      end /*id_schet*/
    end /*tip=1*/

    /*������� */
    if (tip=2) then begin
      /*������ �������������*/
      if ((id_schet is null) or
        (schet_name='������������� �����') ) then begin
        if (:id_uchet_politics is not null) then begin
          /*���������� ������������� �� ������*/
          /*���� ������, �� ���� ������������ ������������� �� �������� �����*/
          select sebest
            from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,2,2)
            into :sebest;              
          /*����� 6 �������. �������*/
          if (kolotp>0) then begin
            select sebest,id_partiya
              from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,6,2)
              into :sebest,:id_partiya;
          end else begin
            /*���� ������� � ������������� ������ �� �� ���������*/
            select sebest,id_partiya
              from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,3,2)
              into :sebest,:id_partiya;
          end
          /* ����� ��� �������� ��������� ����, ������ ������� ����*/
        end /*id_uchet*/
      end /*id_schet*/      
    end /*if tip=2*/
    /* �������� ��������� ����*/
    /*���� ���������� ���� � ����� �����*/
    if ((id_schet is null) or
      (schet_name='������������� �����') ) then begin
      if (:id_uchet_politics is not null) then begin
        /*������������� ����� ���� ������ ������� */
        /*���� �� ���������� ����������� �������,
        �� ����������� ������������ ������*/
        if (:tip in (1,2)) then begin
          execute procedure naklp_sebest4_recount_pc(:id_nakld,
            :id_sklad, :id_partiya,:tip,  4);
        end
      end/*if (:id_uchet_politics*/
    end /*if (schet_name='������������� �����')*/ 
    
    /* second loop  */
    if ((id_schet is null)) then begin
      kolotp=null;
      for
        select od.id_det,od.kolotp
        from naklodet od
        where od.id_nakld=:id_nakld
        into :id_det,:kolotp
      do begin
        if ((Round(kolotp*1000,0)-Round(kolotp*1000,3))<>0) then begin
          update naklodet od
          set od.kolotp=Round(od.kolotp,3)
          where od.id_det=:id_det;
        end
        if (kolotp<0) then begin
          str='������ � ������� �' || cast (:id_pos as varchar(3)) ||
            '. ������������� �����';
          execute procedure error(str);
        end
        execute procedure naklpdet_post_pc(:id_det);
      end /*for*/
    end /* if id_schet is null */
  end /*for id_nakld*/
      
  if (tip=2) then begin/*�������*/
    if ((id_schet is null) or (schet_name='���������� ���������') ) then begin
      SELECT u.id_currency_sebest
        FROM spr_uchet_politics_vw u
        WHERE u.oid=:id_uchet_politics AND u.delmarked=0
        INTO :id_currency_sebest;
      select sum(debet)
        from provodki pr
        where pr.id_schet=:id_schet_sebest_sklad and
          pr.tip=:tip and pr.id_nakl=:id_nakl
        into :sebest_nakl;
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(:sebest_nakl,2),:id_nakl,
          :id_project,:id_statya_dox,:id_currency_sebest,:id_izg,:id_zak,:id_manager);
    end /*if id_schet= '���������� ���������'*/
  end/*if tip=2*/

  if (tip=1) then begin /**/
    if ((id_schet is null) or (schet_name='���������� ���������') ) then begin
      delete
      from provodki pr
      where pr.id_nakl=:parent_id_nakl and
        pr.tip=:tip_prov and
        pr.id_schet=:id_schet_finrez and
        ((pr.attr1=:id_nakl) or (pr.attr1 is null));

      select g.sum_tovarwithnds
        from get_sum_tovarwithnds(:id_nakl) g
        into :sum_tovarwithnds;
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6,attr1)
        values(:id_schet_finrez,:dat,:tip_prov,
          :sum_tovarwithnds,:parent_id_nakl,
          :id_project,:id_statya_dox_nedopost,:id_currency,:id_zak,:id_izg,:id_manager,:id_nakl);
      /*������ �� ��������� = ����� ��������� - ����� �������������*/
      if (parent_tip=:tip_vozvrat) then begin
        insert into provodki (id_schet,dat,tip,
            kredit,id_nakl,
            sub1,sub2,sub3,sub4,sub5,sub6,attr1)
          values(:id_schet_finrez,:dat,:tip_prov,
            :sum_tovarwithnds,:id_nakl,
            :id_project,:id_statya_rasx_ot_vozvratov,:id_currency,:id_zak,:id_izg,:id_manager,:id_nakl);
  
        SELECT u.id_currency_sebest
          FROM spr_uchet_politics_vw u
          WHERE u.oid=:id_uchet_politics AND u.delmarked=0
          INTO :id_currency_sebest;
        select -sum(kredit)
          from provodki pr
          where pr.id_schet=:id_schet_sebest_sklad and
            pr.tip=:tip_prov and pr.id_nakl=:id_nakl
          into :sebest_nakl;
        insert into provodki (id_schet,dat,tip,
            debet,id_nakl,
            sub1,sub2,sub3,sub4,sub5,sub6)
          values(:id_schet_finrez,:dat,:tip_prov,
            Round(:sebest_nakl,2),:id_nakl,
            :id_project,:id_statya_rasx_ot_vozvratov,:id_currency_sebest,:id_zak,:id_izg,:id_manager);

      end else begin /*if parent_tip=:tip_vozvrat*/
        insert into provodki (id_schet,dat,tip,
            kredit,id_nakl,
            sub1,sub2,sub3,sub4,sub5,sub6,attr1)
          values(:id_schet_finrez,:dat,:tip_prov,
            :sum_tovarwithnds,:id_nakl,
            :id_project,:id_statya_dox_za_dostavku,:id_currency,:id_zak,:id_izg,:id_manager,:id_nakl);
  
        SELECT u.id_currency_sebest
          FROM spr_uchet_politics_vw u
          WHERE u.oid=:id_uchet_politics AND u.delmarked=0
          INTO :id_currency_sebest;
        select sum(debet)
          from provodki pr
          where pr.id_schet=:id_schet_sebest_sklad and
            pr.tip=:tip_prov and pr.id_nakl=:id_nakl
          into :sebest_nakl;
        insert into provodki (id_schet,dat,tip,
            debet,id_nakl,
            sub1,sub2,sub3,sub4,sub5,sub6)
          values(:id_schet_finrez,:dat,:tip_prov,
            Round(:sebest_nakl,2),:id_nakl,
            :id_project,:id_statya_dox_za_dostavku,:id_currency_sebest,:id_zak,:id_izg,:id_manager);
      end /*if parent_tip=:tip_vozvrat*/
    end  /*if id_schet*/
  end /*if tip=1*/
END
^

SET TERM ; ^


