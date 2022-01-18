SET TERM ^ ;

CREATE OR ALTER PROCEDURE PROVODKI_POST_PC (
    id_schet integer,
    tip integer,
    dat timestamp,
    sub1 integer,
    sub2 integer,
    sub3 bigint,
    sub4 integer,
    sub5 integer,
    sub6 integer,
    sub7 integer,
    sub8 integer,
    sub9 integer,
    sub10 integer)
as
declare variable dat_act date;
declare variable dat1 date;
declare variable dat2 date;
declare variable id_prov integer;
declare variable day1 integer;
declare variable count_ost integer;
declare variable month1 integer;
declare variable year1 integer;
declare variable debet2 double precision;
declare variable kredit2 double precision;
declare variable debet1 double precision;
declare variable kredit1 double precision;
declare variable kredit_kolotp_1 double precision;
declare variable debet_kolotp_1 double precision;
declare variable delta integer;
declare variable schet_name varchar(50);
declare variable period integer;
declare variable dat_next_ost date;
begin
  if (:tip=1) then begin
    /*���� �������� �������, �� ������ �������*/
    exit;
  end

  select name from get_name_objects_pc(:id_schet,8210) into :schet_name;

  /*����� �������� �����*/

  
  if (schet_name='������������' /*����. ������������*/) then begin
    /*����� ��� � ��� !!!!! */
    delta =1; /*��� �� ������� � ������� ��� ���������� �����*/
    day1=1;
    year1=extractyear(dat);
    month1=1;
    year1=year1+1;
    dat1=encodedate(day1,month1,year1);
    dat2=incdate(:dat1,0,0,-1);
  end
  
  /*����. ������������*/
  /*�����: ��������� ���������.���;
    ������:��������� ���������.���, ����������� �����(to_do)*/
  /*��������1: ��������� ���������.��*/
  if (schet_name='������������') then begin
    while (:dat1<=(firstdaymonth(incdate(cast('now' as date),0,0,1)))) do begin
      id_prov = null;
      /*���� ������� �� 1 ��������*/
      select max(pr.id_prov),count(*)
        from provodki pr
        where pr.id_schet=:id_schet and
          pr.dat=:dat1 and
          pr.sub1=:sub1 and
/*          pr.sub2=:sub2 and
          pr.sub3=:sub3 and
          pr.sub4=:sub4 and*/
          pr.tip=1
      into :id_prov,:count_ost;

      if (count_ost>1 ) then begin
        /*���� �������� �� �������� ������ ������,
        ��� ���������� ����� �������� ������ ��������,
        �� ���� ������� ��� ������� � ����������� �� ������*/
        delete from provodki pr
        where pr.id_schet=:id_schet and
          pr.dat=:dat1 and
          pr.sub1=:sub1 and
          pr.tip=1;
        id_prov=null;
      end

      /*������� ���� �������� ������� ������� �� ���������� ������*/
      select z(sum(pr.debet)), z(sum(pr.kredit))
        from provodki pr
        where pr.id_schet=:id_schet and
          pr.dat>=:dat2 and
          pr.dat<:dat1 and
          pr.sub1=:sub1 /* and
          pr.sub2=:sub2 and
          pr.sub3=:sub3 and
          pr.sub4=:sub4 */
        into :debet1,:kredit1;
      /*������� �� ����� ����� ������� ����*/
      if (id_prov is null) then begin
        if ((:debet1<>0) or (:kredit1<>0)) then begin
          insert into provodki (id_schet,dat,tip,
              sub1,
              debet,
              kredit)
            values(:id_schet,:dat1,1,
              :sub1,
              z(:debet1),
              z(:kredit1));
        end /* if ((:debet1<>0)*/
      end /*if id_prov*/ else begin
        /* ���� ������� ��� ������*/
        /*������� �� ����� ����� ������� ����*/
        update provodki pr
          set pr.debet=z(:debet1),
            pr.kredit=z(:kredit1)
          where pr.id_schet=:id_schet and
            pr.dat=:dat1 and
            pr.sub1=:sub1 and
/*            pr.sub2=:sub2 and
            pr.sub3=:sub3 and
            pr.sub4=:sub4 and*/
            pr.tip=1;
      end /*if id_prov*/
      /*��� � 6 �������*/
      dat1=incdate(:dat1,0,0,:delta);
      dat2=incdate(:dat1,0,0,-:delta);
    end /*while*/
     /*������� ������� ���������� ������ ����*/
    delete from provodki pr
      where pr.id_schet=:id_schet and
        pr.dat>:dat and
        pr.sub1=:sub1 and
/*        pr.sub2=:sub2 and
        pr.sub3=:sub3 and
        pr.sub4=:sub4 and*/
        pr.tip=1 and
        Round(z(pr.debet),6)=0 and
        Round(z(pr.kredit),6)=0;

  end

  /*����. ������������ ������������. 8927
    �����: ������������
    ������: ��� ��������� ���������
    ��������1: ���������
    ��������2: ����������
    ��������3: ��������
    ��������4: ������������
    ��������5: �����
    ��������6: ������
    ��������7: �����
    � kredit&debet ����� ����� � �������� ������.
    ���� � �������������� ������ � ��������,
    �.�. ��� ����� �������� � �������� ������
    � ������ ������� ������������ ��� ������
    "������� �� �������������".
    ������� �� ���������������.
  */
  /*if ((schet_name='������������ ������������') or
    (schet_name='���ר�� � ������������') or
    (schet_name='������������� ���') or
    (schet_name='������������� ��� ����') or
    (schet_name='������������� �����') or
    (schet_name='����� �� ������') or
    (schet_name='����� �� ������'))
  then begin */
  if ((:schet_name<>'������������') and (:schet_name is not null)) then
  begin
    select ab.value_int
      from attributes ab
      where ab.oid=:id_schet and ab.attribute_id=2
      into :period;
    select a.value_date
      from attributes a
      where a.oid=:id_schet and a.attribute_id=3
      into :dat_act;    
    if (period is null) then begin
      period=0;
    end
    if (period=0) then begin
      exit;
    end
    /*��� � ���*/
    if (period=1) then begin
      /*����� ��� � ��� !!!!! */
      delta =12; /*��� �� ������� � ������� ������ ���������� �����*/
      day1=1;
      year1=extractyear(dat);
      month1=1;
      year1=year1+1;
      dat1=encodedate(day1,month1,year1);
      dat2=incdate(:dat1,0,0,-1);    
      /*dat_next_ost=incdate(current_timestamp,0,12,0);*/
      dat_next_ost=dat_act;
    end
    /*��� � �������*/
    if (period=2) then begin
      /*����� ��� � 6 �������*/
      delta =6; /*��� �� ������� � ������� ��� ���������� �����*/
      day1=1;
      month1=extractmonth(dat);
      year1=extractyear(dat);
      if (month1>=7) then begin
        month1=1;
        year1=year1+1;
      end else begin
        month1=7;
      end
      dat1=encodedate(day1,month1,year1);
      dat2=incdate(:dat1,0,-6,0);
      /*dat_next_ost=incdate(current_timestamp,0,6,0);*/
      dat_next_ost=dat_act;
    end /*if period=2*/
    
    /*����� �� 10 ��������*/
    while (:dat1<=dat_next_ost) do begin
      id_prov = null;
      /*���� ������� �� 3 ��������*/
      count_ost=0;
      for
      select pr.id_prov
        from provodki pr
        where pr.id_schet=:id_schet and
          pr.dat=:dat1 and
          (pr.sub1=:sub1 or pr.sub1 is null) and
          (pr.sub2=:sub2 or pr.sub2 is null) and
          (pr.sub3=:sub3 or pr.sub3 is null) and
          (pr.sub4=:sub4 or pr.sub4 is null) and
          (pr.sub5=:sub5 or pr.sub5 is null) and
          (pr.sub6=:sub6 or pr.sub6 is null) and
          (pr.sub7=:sub7 or pr.sub7 is null) and
          (pr.sub8=:sub8 or pr.sub8 is null) and
          (pr.sub9=:sub9 or pr.sub9 is null) and
          (pr.sub10=:sub10 or pr.sub10 is null) and
          pr.tip=1
      into :id_prov
      do begin
        count_ost=count_ost+1;
      end
      if (count_ost>1 ) then begin
        /*���� �������� �� �������� ������ ������,
        ��� ���������� ����� �������� ������ ��������,
        �� ���� ������� ��� ������� � ����������� �� ������*/
        delete from provodki pr
        where pr.id_schet=:id_schet and
          pr.dat=:dat1 and
          (pr.sub1=:sub1 or pr.sub1 is null) and
          (pr.sub2=:sub2 or pr.sub2 is null) and
          (pr.sub3=:sub3 or pr.sub3 is null) and
          (pr.sub4=:sub4 or pr.sub4 is null) and
          (pr.sub5=:sub5 or pr.sub5 is null) and
          (pr.sub6=:sub6 or pr.sub6 is null) and
          (pr.sub7=:sub7 or pr.sub7 is null) and
          (pr.sub8=:sub8 or pr.sub8 is null) and
          (pr.sub9=:sub9 or pr.sub9 is null) and
          (pr.sub10=:sub10 or pr.sub10 is null) and
          pr.tip=1;
        id_prov=null;
      end
      /*������� ���� �������� ������� ������� �� ���������� ������*/

      select z(sum(pr.debet)), z(sum(pr.kredit)),
          z(sum(pr.debet_kolotp)),z(sum(pr.kredit_kolotp))
        from provodki pr
        where pr.id_schet=:id_schet and
          pr.dat>=:dat2 and
          pr.dat<:dat1 and
          (pr.sub1=:sub1 or pr.sub1 is null) and
          (pr.sub2=:sub2 or pr.sub2 is null) and
          (pr.sub3=:sub3 or pr.sub3 is null) and
          (pr.sub4=:sub4 or pr.sub4 is null) and
          (pr.sub5=:sub5 or pr.sub5 is null) and
          (pr.sub6=:sub6 or pr.sub6 is null) and
          (pr.sub7=:sub7 or pr.sub7 is null) and
          (pr.sub8=:sub8 or pr.sub8 is null) and
          (pr.sub9=:sub9 or pr.sub9 is null) and
          (pr.sub10=:sub10 or pr.sub10 is null)
        into :debet1,:kredit1,:debet_kolotp_1,:kredit_kolotp_1;
      /*���� �� ������ � �� ������� ������� �����, ��
      ������������ �� 10,10, � 0 �� ������ � 0 �� �������*/
      debet2=Round(z(debet1-minnum(:debet1,:kredit1)),6);
      kredit2=Round(z(kredit1-minnum(:debet1,:kredit1)),6);
      debet_kolotp_1=Round(z(:debet_kolotp_1),6);
      kredit_kolotp_1=Round(z(:kredit_kolotp_1),6);
      /*������� �� ����� ����� ������� ����*/      
      if (id_prov is null) then begin
        if ((:debet2<>0) or (:kredit2<>0) or
         (:debet_kolotp_1<>0) or (kredit_kolotp_1<>0))
        then begin
          insert into provodki (id_schet,dat,tip,
              sub1,sub2,sub3,sub4,sub5,
              sub6,sub7,sub8,sub9,sub10
              ,debet
              ,kredit
              ,debet_kolotp
              ,kredit_kolotp
              )
            values(:id_schet,:dat1,1,
              :sub1,:sub2,:sub3,:sub4, :sub5, 
              :sub6,:sub7,:sub8, :sub9, :sub10,
              :debet2,
              :kredit2,
              :debet_kolotp_1,
              :kredit_kolotp_1);
        end /*if not empty*/
      end /*if id_prov*/ else begin
        /* ���� ������� ��� ������*/
        /*������� �� ����� ����� ������� ����*/
        /*���� ������������ �����=0, �� ������� �������,
          ������ ����, ����� ��� ��������� �� �����, ����� ��� �������
          ������� �������*/
        if (Round(z(:debet2),6)=0 and
          Round(z(:kredit2),6)=0 and
          Round(z(:debet_kolotp_1),6)=0 and
          Round(z(:kredit_kolotp_1),6)=0) then
        begin
          delete from provodki pr
            where pr.id_schet = :id_schet and
              pr.dat = :dat1 and
              pr.id_prov = :id_prov;
        end else begin
        update provodki pr
          set pr.debet = :debet2,
            pr.kredit = :kredit2,
            pr.debet_kolotp = :debet_kolotp_1,
            pr.kredit_kolotp = :kredit_kolotp_1
          where
            pr.id_schet = :id_schet and
            pr.dat = :dat1 and
            pr.id_prov = :id_prov;
         end
      end /*if id_prov*/
      /*��� � 6 �������*/
      dat1=incdate(:dat1,0,:delta,0);
      dat2=incdate(:dat2,0,:delta,0);
    end /*while*/
  end /*if ������������ ������������*/
end
^

SET TERM ; ^



