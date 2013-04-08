SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLP_SEBEST4_RECOUNT_PC(
    ID_NAKL INTEGER,
    ID_SKLAD INTEGER,
    ID_PARTIYA_IN INTEGER,
    TIP INTEGER,
    MODE INTEGER)
AS
declare variable id_uchet_politics_in integer;
declare variable id_nakld_in integer;
declare variable id_schet_sebest_sklad integer;
declare variable id_nakld_recount integer;
declare variable tip_depend integer;
declare variable id_uchet_politics integer;
declare variable id_sklad_seb_to integer;
declare variable id_tovar integer;
declare variable id_nakld integer;
declare variable kolotp double precision;
declare variable id_schet integer;
declare variable dat_depend date;
declare variable tip_prov integer;
declare variable id_partiya integer;
declare variable sebest double precision;
begin
  /*��������� �� ���� ���������, � ������ ����� �������*/
  if (mode in (4,5,6,7)) then begin
    id_nakld_in=:id_nakl;
    select id_nakl
      from naklot ot
      where ot.id_nakld=:id_nakld_in
      into :id_nakl;
    if (mode<>7) then begin
      mode=mode-3;
    end else begin
      mode=1;
    end
  end
  
  if (tip>103) then begin
    /*���� �� ���� ������ ��� ��������� ��������
    �� ��������� ����� ������������ ��������� ��� ���������.
    �������, ����� � ���������� ���������� �����
    ���� �� �������� ��� ��������� �� ������,
    � ����� ������ ��� � ��� ���������
    */
    select oid
      from GET_OID_OBJECTS_PC('��������� ��������� ���������',-100)
      into :tip_prov;  
    if (tip=tip_prov) then begin
      tip=1;
    end
  end

  select oid
    from get_oid_objects_pc('��� �����',-100)
    into :id_schet;
  select oid
    from get_oid_objects_pc('������������� �����',:id_schet)
    into :id_schet_sebest_sklad;
  select oid
    from GET_OID_OBJECTS_PC('�������� �������� �������������',-100)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('�������������� �ר�',:id_uchet_politics_in)
    into :id_uchet_politics_in;      

  select id_sklad,id_uchet_politics
    from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
    into :id_sklad_seb_to,:id_uchet_politics;     

  for
    select t.id_tovar,t.id_nakld,t.kolotp
      from naklot t
      where t.id_nakl = :id_nakl and
        (t.id_nakld between coalesce(:id_nakld_in,-2147483648)
          and coalesce(:id_nakld_in, 2147483647))
      into :id_tovar,:id_nakld,:kolotp
  do begin

    if (:id_uchet_politics is null) then begin
      exit;
    end
    /*������������� ����� ���� ������ ������� */
    /*���� �� ���������� ����������� �������,
    �� ����������� ������������ ������*/
    if (:tip in (1,2,103) and (:mode in (1,2))) then begin
      for
        select pr.attr1,pr.tip,pr.dat
          from provodki pr
          where 
            pr.id_schet=:id_schet_sebest_sklad and
            pr.sub1=:id_tovar and
            pr.sub2=:id_sklad_seb_to and
            /*pr.debet_kolotp>0 and*/
            pr.tip<>1 and
            pr.sub3=:id_partiya_in /*������ ������� ������ ��� ������, � �� >= */
          order by pr.dat,pr.attr1
          into :id_nakld_recount,:tip_depend,:dat_depend        
      do begin
        /*������� ����� ����� � ���������
          ��� �������� ����� ������� ���������*/
        if (:tip_depend =2) then begin
          /*������������� ������� �������� ������ ���� ��
           ���� �������� ������������ ������ ��� ����� ������ �������*/
          select sebest
            from naklot_sebest2_count_pc(:id_nakld_recount,
              :id_uchet_politics,:id_schet_sebest_sklad,2,2)
            into :sebest;              
          /*����� 6 �������. �������*/
          if (kolotp>0) then begin
            select sebest,id_partiya
              from naklot_sebest2_count_pc(:id_nakld_recount,
                :id_uchet_politics,:id_schet_sebest_sklad,6,2)
              into :sebest,:id_partiya;
          end else begin
            /*���� ������� � ������������� ������ �� �� ���������*/
            select sebest,id_partiya
              from naklot_sebest2_count_pc(:id_nakld_recount,
                :id_uchet_politics,:id_schet_sebest_sklad,3,2)
              into :sebest,:id_partiya;
          end /*if (:tip_depend =2)*/
        end
        /*��� ������ 2 ������������� ������ �������,����� ������� ��������
        �� ������� �� ������*/
        if ((:tip_depend in (5,30,103)) and (mode=1)) then begin
          /*����� ������ ���� �����. ���� ��������� �����������
          ����������� ����������� ��������� �� ���� ����.
          ���� �� ���� ������ ����������� ��� � ���������
          ��� ����� ������������� �� �� ������� �������
          � ������ ������� �������� ��������� � ���-��
          ��� ���� ��������� ������� ������� ��� �� ������� ������
          � ������. ��� ���������� �� ����� ������� �� ��������
          ��������, �� ��� �� �������, �.�. ���� �� ����� �����������
          ��� ��������� ���������, �� � ������� ������� !!!
          ������������: �������� � ���� ������� ���������.
          �� ����� ����� ���� ������������.
          */
          update provodki pr
            set pr.kredit=null,
              pr.kredit_kolotp=null
            where
              pr.id_schet=:id_schet_sebest_sklad and
              pr.dat=:dat_depend and
              pr.sub1=:id_tovar and
              pr.sub2=:id_sklad and
              pr.sub3=:id_partiya_in and
              pr.tip in (5,30,103) and
              pr.kredit is not null and
              pr.kredit_kolotp is not null and
              pr.attr1>:id_nakld_recount;

          select sebest
            from naklot_sebest2_count_pc(:id_nakld_recount,
              :id_uchet_politics,:id_schet_sebest_sklad,2,2)
            into :sebest;              
          select sebest,id_partiya
            from naklot_sebest2_count_pc(:id_nakld_recount,
              :id_uchet_politics,:id_schet_sebest_sklad,3,2)
            into :sebest,:id_partiya;
          if (:tip_depend=103) then begin
            select sebest,id_partiya
              from naklot_sebest2_count_pc(:id_nakld_recount,
                :id_uchet_politics,:id_schet_sebest_sklad,4,2)
              into :sebest,:id_partiya;
          end /* if (:tip_depend=103)*/
        end /*if (:tip_depend in (5,30,103))*/
      end /*�������� ��������� ���������*/
    end /*if (:tip in (1,2,103) and (:mode in (1,2)))*/

    /*���� ������� ������������ ������ �� ������ ���-����� �� �������*/
    if (:tip in (5,103,30) and mode=3) then begin
      select sebest
        from naklot_sebest2_count_pc(:id_nakld,
          :id_uchet_politics,:id_schet_sebest_sklad,2,2)
        into :sebest;
      /*$$IBEC$$ if (mode=3) then begin $$IBEC$$*/
      /*����� 6 ��� ��������*/
        select sebest,id_partiya
          from naklot_sebest2_count_pc(:id_nakld,
            :id_uchet_politics,:id_schet_sebest_sklad,3,2)
          into :sebest,:id_partiya;
      if (tip=103 and mode=3) then begin
        select sebest,id_partiya
        from naklot_sebest2_count_pc(:id_nakld,
          :id_uchet_politics,:id_schet_sebest_sklad,4,2)
        into :sebest,:id_partiya;
      end /*if (tip=103 and mode=3)*/
        
    end /*if (:tip in (5,103,30) and mode=3)*/


    if ((tip=1) and (mode=3)) then begin
        /*���������� ������������� �� ������*/
        /*���� ������, �� ���� ������������ ������������� �� �������� �����*/
        select sebest
          from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,2,2)
          into :sebest;              
        select sebest,id_partiya
          from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,1,2)
          into :sebest,:id_partiya;
    end /*tip=1*/

      /*������� */
    if ((tip=2) and (mode=3)) then begin
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
    end /*if tip=2*/
    /*������ ����������� ��������*/
    if ((tip=5) and (mode=1)) then begin
      select sebest
        from naklot_sebest2_count_pc(:ID_NAKLD,
          :id_uchet_politics,:id_schet_sebest_sklad,2,2)
        into :sebest;              
      select sebest,id_partiya
        from naklot_sebest2_count_pc(:ID_NAKLD,
          :id_uchet_politics,:id_schet_sebest_sklad,3,2)
        into :sebest,:id_partiya;
    end/*((tip=5) and (mode=1))*/

  end /*for*/
end^

SET TERM ; ^

DESCRIBE PROCEDURE NAKLP_SEBEST4_RECOUNT_PC
'�������� ���� ��������� �� ������ ������� ��� �������
��������� �� �������������3. ������������ naklp_post_pc
��� �������, �������, � �������� ������������� ���������
��� ������� ������������� ������ ���� ���� �������
 
mode=7 - ���� ������� ��������� �� ��������
mode=4 - ��������� ������� �� ����� ������� �������
mode=1 - ��� ����  � ���������
mode=2 - ��� ����
mode=6 - �������� ������� ��������
mode=6 - ��� � mode=5 ��� ����� ������� ��������,
  �� ��������� ������ ������� �� �������, �
  �� �� ���� ��������. ��� ��� ��������� ��������
  ������� ���� ������� ���� �������';

GRANT SELECT ON NAKLOT TO PROCEDURE NAKLP_SEBEST4_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLP_SEBEST4_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_SETTINGS_PC TO PROCEDURE NAKLP_SEBEST4_RECOUNT_PC;

GRANT SELECT,UPDATE ON PROVODKI TO PROCEDURE NAKLP_SEBEST4_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLP_SEBEST4_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO PROCEDURE NAKLO_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO PROCEDURE NAKLP_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO PROCEDURE NAKLP_SEBEST4_RECOUNT_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO PROCEDURE TEMP67_SKLAD_SEBEST_MINUS_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO PROCEDURE TEMP70_SEBSKLAD_TIME_CHECK;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO POWER_USER;

