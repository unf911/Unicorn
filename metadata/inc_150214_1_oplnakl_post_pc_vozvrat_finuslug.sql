CREATE OR ALTER PROCEDURE OPLNAKL_POST_PC (
    id integer)
as
declare variable id_izg integer;
declare variable id_zak integer;
declare variable id_schet integer;
declare variable oidtransh integer;
declare variable id_manager_predopl integer;
declare variable id_temp integer;
declare variable id_schet_tip integer;
declare variable id_to integer;
declare variable id_from integer;
declare variable id_manager integer;
declare variable transh double precision;
declare variable tip integer;
declare variable opl_data date;
declare variable id_currency integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('��� �����',-100)
    into :id_schet_tip;
  /*����� ����������� ������� ������ �������� �� ������*/
  select oid
    from GET_OID_OBJECTS_PC('��� ������',-100)
    into :oidTransh;  
  delete from provodki p
    where p.id_nakl=:id and
      p.tip=:oidTransh;

  select o.id_to, o.id_from, o.transh, o.tip, o.opl_data, o.id_currency
    from oplnakl o
    where o.id=:id
    into :id_to, :id_from, :transh, :tip, :opl_data, :id_currency;
  select id_izg,id_zak,id_manager
    from naklo om
    where om.id_nakl=:id_to
    into :id_izg,:id_zak,:id_manager;
  /*���� ��� ����. �� ��� �� ������� ������*/
  select id_manager
    from naklo om
    where om.id_nakl=:id_from
    into :id_manager_predopl;

  /*'����� �� ������'*/
  /*'����� �� ������ �� ���������'*/
  if (:tip in (0,2) ) then begin
    select oid
      from GET_OID_OBJECTS_PC('����� �� ������',:id_schet_tip)
      into :id_schet;
    if (:tip=2) then begin
      /*��������� �������. ������� ����������. ����� �������� � id_zak ���������*/
      id_temp=id_izg;
      id_izg=id_zak;
      id_zak=id_temp;
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4)
        values(:id_schet,:opl_data,:oidTransh,
          :transh,:id,
          :id_izg,:id_zak,:id_manager,:id_to);
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager_predopl,:id_from);
    end
    if (:tip=0) then  begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager,:id_to);
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager_predopl,:id_from);
    end
  end /*����� �� ������*/
  
  /*������� �������� ����� �� ��������� �������
  �� �������� � ������������*/
  /*'���ר�� � ������������'*/
  if (:tip in (1,3) ) then begin
    select oid
      from GET_OID_OBJECTS_PC('���ר�� � ������������',:id_schet_tip)
      into :id_schet;  
    if (:tip=1) then begin
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager,:id_to,:id_currency);
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager_predopl,:id_from,:id_currency);
    end
    if (:tip=3) then begin
      /*�������� �������. ������� �� ����������*/
      id_temp=id_izg;
      id_izg=id_zak;
      id_zak=id_temp;
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          :transh,:id,
          :id_izg,:id_zak,:id_manager,:id_to,:id_currency);
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager_predopl,:id_from,:id_currency);
    end  /*if (new.tip=3) then begin*/
  end /*if (new.tip in (1,3) )*/
  
  /*'���ר�� � ������������ �����'*/  
  if (tip in (-65,-36)) then begin
    select oid
      from GET_OID_OBJECTS_PC('���ר�� � ������������ �����',:id_schet_tip)
      into :id_schet;
    /* -65='����� � �������� � ����������� �����' */
    if (tip=-65) then begin
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager,:id_to,:id_currency);
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager_predopl,:id_from,:id_currency);    
    end /*if (:tip=-65)*/
    /*'-36=����� � �������� � ������������ ����� �������' */
    if (tip=-36) then begin
      /*�������� �������. ������� �� ���������� �����*/
      id_temp=id_izg;
      id_izg=id_zak;
      id_zak=id_temp;
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          :transh,:id,
          :id_izg,:id_zak,:id_manager,:id_to,:id_currency);
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager_predopl,:id_from,:id_currency);
    end /*if (tip=-36)*/    
  end
  
/*����� � �������� � ������������ ����� �������*//*$$IBEC$$ 
  if (tip=-36) then begin
    select oid
      from GET_OID_OBJECTS_PC('����� �� ������',:id_schet_tip)
      into :id_schet;
       $$IBEC$$*//*��������� �������. ������� ����������. ����� �������� � id_zak ���������*/
      /*�������� �������. ������� �� ����������*//*$$IBEC$$ 

    id_temp=id_izg;
    id_izg=id_zak;
    id_zak=id_temp;
    insert into provodki (id_schet,dat,tip,
        debet,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet,:opl_data,:oidTransh,
        -:transh,:id,
        :id_izg,:id_zak,:id_manager,:id_to,:id_currency);
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet,:opl_data,:oidTransh,
        -:transh,:id,
        :id_izg,:id_zak,:id_manager_predopl,:id_from,:id_currency);
  end   $$IBEC$$*//*'����� � ������ �� ������'*/  
  
  /*'���ר�� � ������������ �����'*/  
  if (tip in (-50,-33)) then begin
    select oid
      from GET_OID_OBJECTS_PC('����� �� ������',:id_schet_tip)
      into :id_schet;
    /*  -50='����� � ������ �� ������'*/
    if (tip=-50) then begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager,:id_to,:id_currency);
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager_predopl,:id_from,:id_currency);   
    end /* -50='����� � ������ �� ������'*/
    /*'-33=����� � ������ �� ������ �������' */
    if (tip=-33) then begin
      /*��������� �������. ������� �� ���������� �����*/
      id_temp=id_izg;
      id_izg=id_zak;
      id_zak=id_temp;
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          :transh,:id,
          :id_izg,:id_zak,:id_manager,:id_to,:id_currency);
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager_predopl,:id_from,:id_currency);
    end /*if '-33=����� � ������ �� ������ �������' */
  end   /*'���ר�� � ������������ �����'*/ 
    
  
  /*'���ר�� � ������������ �����'*/  
  if (tip in (-28,-102)) then begin
    select oid
      from GET_OID_OBJECTS_PC('����� �� ���������',:id_schet_tip)
      into :id_schet;
    /*  -28='����� � ������ �� ���������'*/
    if (tip=-28) then begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager,:id_to,:id_currency);
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager_predopl,:id_from,:id_currency);  
    end /*  -28='����� � ������ �� ���������'*/
    /*'-102=����� � ������ �� ��������� �������' */
    if (tip=-102) then begin
      /*��������� �������. ������� �� ���������� ��������*/
      id_temp=id_izg;
      id_izg=id_zak;
      id_zak=id_temp;
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          :transh,:id,
          :id_izg,:id_zak,:id_manager,:id_to,:id_currency);
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5)
        values(:id_schet,:opl_data,:oidTransh,
          -:transh,:id,
          :id_izg,:id_zak,:id_manager_predopl,:id_from,:id_currency);
    end /*if '-33=����� � ������ �� ������ �������' */
  end   /*'���ר�� � ������������ �����'*/
end

