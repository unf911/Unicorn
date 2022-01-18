SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_OBOROTKA2_PC (
    id_schet integer,
    dat_from timestamp,
    dat_to timestamp,
    sub1_in integer,
    sub2_in integer,
    sub3_in bigint,
    sub4_in integer,
    sub5_in integer,
    sub6_in integer,
    sub7_in integer,
    sub8_in integer,
    sub9_in integer,
    sub10_in integer)
returns (
    sub1 integer,
    sub2 integer,
    sub3 bigint,
    sub4 integer,
    sub5 integer,
    sub6 integer,
    sub7 integer,
    sub8 integer,
    sub9 integer,
    sub10 integer,
    debetbefore double precision,
    kreditbefore double precision,
    debet double precision,
    kredit double precision,
    debetafter double precision,
    kreditafter double precision,
    kolotp_before double precision,
    debet_kolotp double precision,
    kredit_kolotp double precision,
    kolotp_after double precision)
as
declare variable debet_det double precision;
declare variable kredit_det double precision;
declare variable tip integer;
declare variable dat date;
declare variable id_prov integer;
declare variable dat_from_ost date;
declare variable debet_kolotp_det double precision;
declare variable kredit_kolotp_det double precision;
declare variable minvalue double precision;
declare variable sub1_det integer;
declare variable sub2_det integer;
declare variable sub3_det bigint;
declare variable sub4_det integer;
declare variable sub5_det integer;
declare variable sub6_det integer;
declare variable sub7_det integer;
declare variable sub8_det integer;
declare variable sub9_det integer;
declare variable sub10_det integer;
declare variable datostbefore date;
declare variable datostafter date;
declare variable tip_transh integer;
begin
  select oid from get_oid_objects_pc('��� ������',-100) into :tip_transh;
  /*�������� �������� �� ����� ��������� ���� ��� ���������*/
  execute procedure PROVODKI_OSTATKI_PC(:id_schet,null);
  select dat_from_ost
    from Get_Schet_Dat_From_Ost_PC(:id_schet,:dat_from)
    into :dat_from_ost;

  debet=0;
  kredit=0;
  debetbefore=0;
  kreditbefore=0;
  debetafter=0;
  kreditafter=0;
  kolotp_before=0;
  debet_kolotp=0;
  kredit_kolotp=0;
  kolotp_after=0;

  for
    select
      p.sub1, p.sub2, p.sub3, p.sub4, p.sub5,
      p.sub6, p.sub7, p.sub8, p.sub9, p.sub10,
      p.debet, p.kredit, p.tip, p.dat, p.id_prov,
      p.debet_kolotp,p.kredit_kolotp
    from provodki p
    where p.id_schet=:id_schet
      and p.dat between :dat_from_ost and :dat_to
      and (p.sub1 between coalesce(:sub1_in,-2147483648) and coalesce(:sub1_in, 2147483647) or p.sub1 is null)
      and (p.sub2 between coalesce(:sub2_in,-2147483648) and coalesce(:sub2_in, 2147483647) or p.sub2 is null)
      and (p.sub3 between coalesce(:sub3_in,-9,223,372,036,854,775,808) and coalesce(:sub3_in, 9,223,372,036,854,775,807) or p.sub3 is null)
      and (p.sub4 between coalesce(:sub4_in,-2147483648) and coalesce(:sub4_in, 2147483647) or p.sub4 is null)
      and (p.sub5 between coalesce(:sub5_in,-2147483648) and coalesce(:sub5_in, 2147483647) or p.sub5 is null)
      and (p.sub6 between coalesce(:sub6_in,-2147483648) and coalesce(:sub6_in, 2147483647) or p.sub6 is null)
      and (p.sub7 between coalesce(:sub7_in,-2147483648) and coalesce(:sub7_in, 2147483647) or p.sub7 is null)
      and (p.sub8 between coalesce(:sub8_in,-2147483648) and coalesce(:sub8_in, 2147483647) or p.sub8 is null)
      and (p.sub9 between coalesce(:sub9_in,-2147483648) and coalesce(:sub9_in, 2147483647) or p.sub9 is null)
      and (p.sub10 between coalesce(:sub10_in,-2147483648) and coalesce(:sub10_in, 2147483647) or p.sub10 is null)
    order by p.sub1,p.sub2,p.sub3,p.sub4,p.sub5,
      p.sub6,p.sub7,p.sub8,p.sub9,p.sub10,
      p.dat asc,tip
    into :sub1_det,:sub2_det,:sub3_det,:sub4_det,:sub5_det,
      :sub6_det,:sub7_det,:sub8_det,:sub9_det,:sub10_det,
      :debet_det,:kredit_det,:tip,:dat,:id_prov,
      :debet_kolotp_det,:kredit_kolotp_det
  do begin
  
    if (sub1 is null and sub2 is null and sub3 is null and sub4 is null and
      sub5 is null and sub6 is null and sub7 is null and sub8 is null and
      sub9 is null and sub10 is null) then begin
      /*������ ���*/
      sub1=sub1_det;
      sub2=sub2_det;
      sub3=sub3_det;
      sub4=sub4_det;
      sub5=sub5_det;
      sub6=sub6_det;
      sub7=sub7_det;
      sub8=sub8_det;
      sub9=sub9_det;
      sub10=sub10_det;
    end /*������ ���*/
    
    if (sub1<>sub1_det or sub2<>sub2_det
     or sub3<>sub3_det or sub4<>sub4_det
     or sub5<>sub5_det or sub6<>sub6_det
     or sub7<>sub7_det or sub8<>sub8_det
     or sub9<>sub9_det or sub10<>sub10_det) then begin
     
      /*��������� ���, ������������� ��������� ����������*/
      debet=Round(:debet,4);
      kredit=Round(:kredit,4);
      debetbefore=Round(:debetbefore,4);
      kreditbefore=Round(:kreditbefore,4);
      debetafter=Round(:debetafter,4);
      kreditafter=Round(:kreditafter,4);
      
      
      minvalue=minnum(:debetbefore,:kreditbefore);
      debetbefore=z(:debetbefore)-z(:minvalue);
      kreditbefore=z(:kreditbefore)-z(:minvalue);

      minvalue=minnum(:debetafter,:kreditafter);
      debetafter=z(:debetafter)-z(:minvalue);
      kreditafter=z(:kreditafter)-z(:minvalue);

      kolotp_before=z(:kolotp_before);
      kolotp_after=z(:kolotp_after);
      debet_kolotp=z(:debet_kolotp);
      kredit_kolotp=z(:kredit_kolotp);
      if ((debet<>0) or (kredit<>0) or (debetbefore<>0) or (kreditbefore<>0) or
        (debetafter<>0) or (kreditafter<>0) or
        (z(Round(kolotp_before,3))<>0) or (z(Round(kolotp_after,3))<>0) or
        ( z(Round(debet_kolotp,3))<>0)  or (z(Round(kredit_kolotp,3))<>0) )
      then begin
        suspend;
      end
 /*     minvalue=minnum(:debet_kolotp_before,:kredit_kolotp_before);
      kolotp_before=z(:debet_kolotp_before)-z(:minvalue);
      

      minvalue=minnum(:debet_kolotp_after, :kredit_kolotp_after);
      debet_kolotp_after=z(:debet_kolotp_after)-z(:minvalue);
      kredit_kolotp_after=z(:kredit_kolotp_after)-z(:minvalue);
*/

      debet=0;
      kredit=0;
      debetbefore=0;
      kreditbefore=0;
      debetafter=0;
      kreditafter=0;
      kolotp_before=0;
      debet_kolotp=0;
      kredit_kolotp=0;
      kolotp_after=0;
      sub1=sub1_det;
      sub2=sub2_det;
      sub3=sub3_det;
      sub4=sub4_det;
      sub5=sub5_det;
      sub6=sub6_det;
      sub7=sub7_det;
      sub8=sub8_det;
      sub9=sub9_det;
      sub10=sub10_det;
      datostbefore = null;
      datostafter = null;
    end /*��������� ���, ������������� ��������� ����������*/
    
    /*������� �� ������ �������*/
    if (dat<=dat_from) then begin
      if (tip=1) then begin
        if (datostbefore is null or datostbefore<dat) then begin
          /*������ ���������� ��� ������� ��� ����� ����� ������� �������*/
          datostbefore=dat;
          debetbefore=z(debet_det);
          kreditbefore=z(kredit_det);
        end
        else begin
           /*������� �� �� �� ���� ������� ���������*/ 
          debetbefore=z(debet_det)+z(debetbefore);
          kreditbefore=z(kredit_det)+z(kreditbefore);
        end  /*if*/
      end /*tip=1*/
    end
    if (dat<dat_from) then begin
      if (tip<>1) then begin
          debetbefore=z(debet_det)+z(debetbefore);
          kreditbefore=z(kredit_det)+z(kreditbefore);
          kolotp_before=z(kolotp_before)+z(debet_kolotp_det)-z(kredit_kolotp_det);
      end
    end
    /*������� �� ������ �������*/

    /*������� �� ������*/
    if  (dat between dat_from and dat_to) then begin
      if ((tip<>1) and (tip<>:tip_transh)) then begin
        /*���� � ����� ������� � ������������ ������
        �� ����� �� ��� ������ 0 ��-�� �������� ��������
        � ��������� ��������� ��������*/
        /*$$IBEC$$ if (kredit_det>=0) then begin $$IBEC$$*/
          kredit=z(kredit_det)+z(kredit);
          kredit_kolotp=z(kredit_kolotp)+z(kredit_kolotp_det);
/*$$IBEC$$         end
        if (debet_det>=0) then begin $$IBEC$$*/
          debet=z(debet_det)+z(debet);
          debet_kolotp=z(debet_kolotp)+z(debet_kolotp_det);
        /*$$IBEC$$ end $$IBEC$$*/
      end
    end /*������� �� ������*/

    /*������� �� ����� �������*/
    if (dat<=dat_to) then begin
      if (tip=1) then begin
        if (datostafter is null or datostafter<dat) then begin
          /*������ ���������� ��� ������� ��� ����� ����� ������� �������*/
          datostafter=dat;
          debetafter=z(debet_det);
          kreditafter=z(kredit_det);
        end else begin
          /*������� �� �� �� ���� ������� ���������*/
          debetafter=z(debet_det)+z(debetafter);
          kreditafter=z(kredit_det)+z(kreditafter);
        end /*if*/
      end /*tip=1*/
    end /*������� �� ����� �������*/
    
    if (dat<=dat_to) then begin
      if (tip<>1) then begin
        /*������ ��� �����*/
        kreditafter=z(kreditafter)+z(kredit_det);
        debetafter=z(debet_det)+z(debetafter);
        kolotp_after=z(kolotp_after)+z(debet_kolotp_det)-z(kredit_kolotp_det);
      end
    end
    
  end /*for select*/
  
      debet=Round(:debet,4);
      kredit=Round(:kredit,4);
      debetbefore=Round(:debetbefore,4);
      kreditbefore=Round(:kreditbefore,4);
      debetafter=Round(:debetafter,4);
      kreditafter=Round(:kreditafter,4);
      
      minvalue=minnum(:debetbefore,:kreditbefore);
      debetbefore=z(:debetbefore)-z(:minvalue);
      kreditbefore=z(:kreditbefore)-z(:minvalue);

      minvalue=minnum(:debetafter,:kreditafter);
      debetafter=z(:debetafter)-z(:minvalue);
      kreditafter=z(:kreditafter)-z(:minvalue);
      if ((debet<>0) or (kredit<>0) or (debetbefore<>0) or (kreditbefore<>0) or
        (debetafter<>0) or (kreditafter<>0) or
        (z(Round(kolotp_before,3))<>0) or (z(Round(kolotp_after,3))<>0) or
        ( z(Round(debet_kolotp,3))<>0)  or (z(Round(kredit_kolotp,3))<>0) )
      then begin
        suspend;
      end      
/*
      minvalue=minnum(:debet_kolotp_before,:kredit_kolotp_before);
      debet_kolotp_before=z(:debet_kolotp_before)-z(:minvalue);
      kredit_kolotp_before=z(:kredit_kolotp_before)-z(:minvalue);

      minvalue=minnum(:debet_kolotp_after, :kredit_kolotp_after);
      debet_kolotp_after=z(:debet_kolotp_after)-z(:minvalue);
      kredit_kolotp_after=z(:kredit_kolotp_after)-z(:minvalue);
 */
end
^

SET TERM ; ^


