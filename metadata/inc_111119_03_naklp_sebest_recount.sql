SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC(
    DAT_FROM_IN TIMESTAMP,
    ID_TOVAR_IN INTEGER,
    ID_SKLAD_IN INTEGER,
    ID_PARTIYA_IN INTEGER)
AS
declare variable id_nakld integer;
declare variable id_uchet_politics integer;
declare variable id_sklad_seb integer;
declare variable id_schet integer;
declare variable id_nakl integer;
declare variable tip integer;
declare variable id_nakld_recount integer;
declare variable tip_depend integer;
declare variable dat_depend timestamp;
declare variable id_nakl_depend integer;
declare variable sebest double precision;
declare variable id_partiya integer;
declare variable id_sklad_to integer;
declare variable parent_id_nakl_depend integer;

begin

  /*��������������*/
  select oid
    from GET_OID_OBJECTS_PC('��� �����',-100)
    into :id_schet;
  select oid
    from GET_OID_OBJECTS_PC('������������� �����',:id_schet)
    into :id_schet;

  if (dat_from_in is null) then begin
    dat_from_in='01.01.2000';
  end
  select oid
    from GET_OID_OBJECTS_PC('�������� �������� �������������',-100)
    into :id_uchet_politics;
  select oid
    from GET_OID_OBJECTS_PC('�������������� �ר�',:id_uchet_politics)
    into :id_uchet_politics;
  select first 1 id_sklad,id_uchet_politics
    from sklad_sebest_settings_pc(:ID_SKLAD_IN, :id_uchet_politics)
    into :id_sklad_seb,:id_uchet_politics; 

   /*����������� ������ ������*/

    /*�������� ������ ������ �� ���� ������ � ������ ������
      ������������� ��� � ��������� ������ 3*/
   
    select first 1 pr.attr1,pr.id_nakl,pr.tip
      from provodki pr
      where pr.id_schet=:id_schet and
        pr.sub2=:id_sklad_seb and
        pr.sub1=:id_tovar_in and
        pr.sub3=:id_partiya_in and
        pr.dat>=:dat_from_in and
        pr.debet_kolotp>0
      order by pr.dat
      into :id_nakld,:id_nakl,:tip;

    if (id_nakld is not null) then begin

    /*�������� �������*/
    /*$$IBEC$$       execute procedure naklp_sebest4_recount_pc(
        :id_nakld,:id_sklad_in,
        :id_partiya_in,:tip,4); $$IBEC$$*/

    /*naklp_sebest4_recount_pc ����� 4 �� ��������, �.�.
     *���� ��� ��������� �� ���� ������ � �� �����, � ����� ������
     *��� ������, ������ ������� ���� - ��� �� ��������������� ���������
     * �� ��������, �.�. ��� ��� ������������ ��� �������, ������� �����
     * ����� � ����� ������� ��� � ����� ������� ������, � ���� ���� ����������
     * �� ��� ����� ������. � ������ �� ����� ���������� �������� �������������,
     * � ���� ����� ��� ����� �� ��������� ������, */

     /*������� �� �������������. ����� ���.*/

      for
        select pr.attr1,pr.tip,pr.dat,
            pr.id_nakl
          from provodki pr
          where 
            pr.id_schet=:id_schet and
            pr.sub1=:id_tovar_in and
            pr.sub2=:id_sklad_seb and
            /*pr.debet_kolotp>0 and*/
            pr.tip<>1 and
            pr.sub3=:id_partiya_in
          order by pr.dat,pr.attr1
          into :id_nakld_recount,:tip_depend,:dat_depend,
            :id_nakl_depend
      do begin
        /*������� ����� ����� � ���������
          ��� �������� ����� ������� ���������*/
        if (:tip_depend =2) then begin
          /*������������� ������� �������� ������ ���� ��
           ���� �������� ������������ ������ ��� ����� ������ �������*/
          select sebest
            from naklot_sebest2_count_pc(:id_nakld_recount,
              :id_uchet_politics,:id_schet,2,2)
            into :sebest;              

          select sebest,id_partiya
            from naklot_sebest2_count_pc(:id_nakld_recount,
              :id_uchet_politics,:id_schet,6,2)
            into :sebest,:id_partiya;
        end  /*if (:tip_depend =2)*/
        /*��� ������ 2 ������������� ������ �������,����� ������� ��������
        �� ������� �� ������*/
        if (:tip_depend in (5,30,103))  then begin
          SELECT id_sklad_to, parent_id_nakl
            FROM naklo om
            WHERE om.id_nakl=:id_nakl_depend
            INTO :id_sklad_to, :parent_id_nakl_depend;
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
          /*���� �������� � ��� ���������, ��� ��������, ���������*/
          if (((:tip_depend=103) and (id_sklad_to<>id_sklad_in)) or (tip_depend<>103)) then begin
            update provodki pr
              set pr.kredit=null,
                pr.kredit_kolotp=null
              where
                pr.id_schet=:id_schet and
                pr.dat=:dat_depend and
                pr.sub1=:id_tovar_in and
                pr.sub2=:id_sklad_in and
                pr.sub3=:id_partiya_in and
                pr.tip in (5,30,103) and
                pr.kredit is not null and
                pr.kredit_kolotp is not null and
                pr.attr1>:id_nakld_recount;
            end



/*$$IBEC$$             select sebest
              from naklot_sebest2_count_pc(:id_nakld_recount,
                :id_uchet_politics,:id_schet,2,2)
              into :sebest;
            select sebest,id_partiya
              from naklot_sebest2_count_pc(:id_nakld_recount,
                :id_uchet_politics,:id_schet,3,2)
              into :sebest,:id_partiya; $$IBEC$$*/
          end

          select p.id_partiya, p.sebest
            from naklot_sebest2_post_pc(:id_nakl, :id_nakld, 3) p
            into :id_partiya, :sebest;

/*$$IBEC$$           if ((:tip_depend=103) and (id_sklad_to<>id_sklad_in)) then begin
            select sebest,id_partiya
              from naklot_sebest2_count_pc(:id_nakld_recount,
                :id_uchet_politics,:id_schet,4,2)
              into :sebest,:id_partiya; 
             $$IBEC$$*//*kredit_kolotp_depend>0  �.�. �� �������� ������ ��������
            ��� ������, ������� ������������� � �������� ������� �������
            �� ���� ��� �� ������, ��� �� �������, ������������� ���������*//*$$IBEC$$ 


            SELECT id_sklad_to
              FROM naklo om
              WHERE om.id_nakl=:id_nakl_depend
              INTO :id_sklad_to;
            execute procedure naklp_sebest4_part_recount_pc(
              :dat_from_in,:id_tovar_in,:id_sklad_to,:id_partiya);
          end  $$IBEC$$*//* if (:tip_depend=103)*//*$$IBEC$$ 
        end  $$IBEC$$*//*if (:tip_depend in (5,30,103))*/

        /*���� �������� ���������, �� ������� ��������*//*$$IBEC$$ 
        if (tip_depend=3047) then begin
            select sebest
              from naklot_sebest2_count_pc(:id_nakld_recount,:id_uchet_politics,:id_schet,2,2)
              into :sebest;       
        end  $$IBEC$$*//*if (tip_depend=3047)*/
      end /*�������� ��������� ���������*/


    end else begin
      /*�� ������� ������� �� ���� ������ � ������ �������,
        ������������� ������*/
      for
        select  pr.attr1,pr.id_nakl,pr.tip
        from provodki pr
        where pr.id_schet=:id_schet and
          pr.sub2=:id_sklad_seb and
          pr.sub1=:id_tovar_in and
          pr.sub3=:id_partiya_in and
          pr.dat>=:dat_from_in and
          pr.kredit_kolotp>0
        order by pr.dat
        into :id_nakld,:id_nakl,:tip
      do begin
        execute procedure naklp_sebest4_recount_pc(
          :id_nakld,:id_sklad_in,
          :id_partiya_in,:tip,4);
      end/**/
    end/*if (id_nakld_in is not null)*/
end^

SET TERM ; ^

DESCRIBE PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC
'������� � ������� ������. ����������� ������.';

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_SETTINGS_PC TO PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC;

GRANT SELECT,UPDATE ON PROVODKI TO PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC;

GRANT SELECT ON NAKLO TO PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_POST_PC TO PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC TO PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC TO PROCEDURE PROVODKI_CHECK_SKLAD_SEBEST_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC TO POWER_USER;
