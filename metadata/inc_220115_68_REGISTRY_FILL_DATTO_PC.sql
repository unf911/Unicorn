SET TERM ^ ;

CREATE OR ALTER PROCEDURE REGISTRY_FILL_DATTO_PC (
    id_prov integer,
    operation smallint)
as
declare variable dat date;
declare variable dat_to date;
declare variable id_registr integer;
declare variable sub1 integer;
declare variable sub2 integer;
declare variable sub3 bigint;
declare variable id_prov_oxv integer;
declare variable dat_oxv date;
declare variable dat_to_oxv date;
declare variable dat_next date;
declare variable id_prov_prev integer;
declare variable dat_to_prev date;
declare variable dat_prev date;
begin
  select r.id_registr,r.sub1,r.sub2,r.sub3,r.dat,r.dat_to
    from registry r
    where r.id_prov=:id_prov
    into :id_registr,:sub1,:sub2,:sub3,:dat,:dat_to;
  /*������� �����*/
  if (operation = 1) then begin
    /*������� ������������ ������*/
    select r.id_prov,r.dat,r.dat_to
      from registry r
      where r.id_registr=:id_registr
        and (r.sub1 between coalesce(:sub1,-2147483648)
        and coalesce (:sub1,2147483647) or r.sub1 is null)
        and (r.sub2 between coalesce(:sub2,-2147483648)
        and coalesce (:sub2,2147483647) or r.sub2 is null)
        and (r.sub3 between coalesce(:sub3,-9,223,372,036,854,775,808)
        and coalesce(:sub3, 9,223,372,036,854,775,807) or r.sub3 is null)
        and r.dat<=:dat and r.dat_to>:dat
      into :id_prov_oxv,:dat_oxv,:dat_to_oxv;
    /*������ ������������ ������ � ��������*/
    if (:id_prov_oxv is not null) then begin
        /*� ������������ ������ ������ ���� ���������=���� ������ ����� ������*/
        /*���� ���� ����� ������ = ���� ������������,
          �� ������ ������ ���������� �����, � � ������
          ���� �����= ���� ������*/        
        update registry r
          set r.dat_to=:dat
          where r.id_prov=:id_prov_oxv;
        /*����� ������ ��������� �� ���� ��������� ������������ ������*/
        update registry r2
          set r2.dat_to=:dat_to_oxv
          where r2.id_prov=:id_prov;
        exit;
    end else begin /*if (:id_prov_oxv is not null)*/
      /*�� ������� ������������ ������*/
      /*������ ����������� ����*/
      select first 1 r.dat
        from registry r
        where r.id_registr=:id_registr
          and (r.sub1 between coalesce(:sub1,-2147483648)
          and coalesce (:sub1,2147483647) or r.sub1 is null)
          and (r.sub2 between coalesce(:sub2,-2147483648)
          and coalesce (:sub2,2147483647) or r.sub2 is null)
          and (r.sub3 between coalesce(:sub3,-9,223,372,036,854,775,808)
          and coalesce(:sub3, 9,223,372,036,854,775,807) or r.sub3 is null)
          and r.dat>:dat
        order by r.dat asc
        into :dat_next;
      if (:dat_next is not null) then begin
        update registry r2
          set r2.dat_to=:dat_next
          where r2.id_prov=:id_prov;    
        exit;
      end else begin /*if (:dat_next is not null)*/
        /*�� ������� �� ������������ �� ����������� ������*/
        /*����� ���� ��������� = �������������*/
        dat_next = '31.12.9999';
        update registry r2
          set r2.dat_to=:dat_next
          where r2.id_prov=:id_prov;        
      end /*if (:dat_next is not null)*/
    end /*if (:id_prov_oxv is not null)*/
  end /*if (operation = 1)*/
  
  /*�������� �����*/
  if (operation=4) then begin
    /*���� ���� ���������� ������, �� ��������������� ��������� �� ���*/
    select first 1 r.id_prov,r.dat,r.dat_to
      from registry r
      where r.id_registr=:id_registr
        and (r.sub1 between coalesce(:sub1,-2147483648)
        and coalesce (:sub1,2147483647) or r.sub1 is null)
        and (r.sub2 between coalesce(:sub2,-2147483648)
        and coalesce (:sub2,2147483647) or r.sub2 is null)
        and (r.sub3 between coalesce(:sub3,-9,223,372,036,854,775,808)
        and coalesce(:sub3, 9,223,372,036,854,775,807) or r.sub3 is null)
        and r.dat_to=:dat
      order by r.dat desc, r.id_prov desc
      into :id_prov_prev,:dat_prev,:dat_to_prev;
    /*����������� ���� ����� ��������� ��������*/
    update registry r2
      set r2.dat_to=:dat_to
      where r2.id_prov=:id_prov_prev;     
/*���������� ���� �� � ��������� ������*/ /*$$IBEC$$ 
    update registry r
      set r.dat_to=null
      where r.id_prov=:id_prov; $$IBEC$$*/
  end
end
^

SET TERM ; ^


