CREATE OR ALTER PROCEDURE ATTRIB_NAKLOT_SET_PC(
    OID INTEGER,
    CLASSID INTEGER,
    ATTRIBUTE_NAME VARCHAR(50),
    ATTRIBUTE_VALUE VARCHAR(250))
AS
/*$$IBEC$$   declare variable classid integer; $$IBEC$$*/
  declare variable attribute_id integer;
  declare variable attribute_type integer;
  declare variable attribute_classid integer;
  declare variable attribute_value_int integer;
  declare variable attribute_value_int_old integer;
  declare variable attribute_value_date date;
  declare variable attribute_value_date_old date;
  declare variable sError varchar(100);
  declare variable attribute_value_double double precision;
  declare variable attribute_value_double_old double precision;
  declare variable attribute_value_old varchar(50);
begin


  select ca.attribute_id,ca.attribute_type,ca.classid
    from class_attributes ca
    where ca.oid=:classid
      and ca.attribute_name=:attribute_name
    into :attribute_id,:attribute_type,:attribute_classid;
  if (attribute_id is null) then begin
    sError = '������. �������� �� ������. classid='||cast(classid as varchar(8))||'. a_name=' || attribute_name;
    execute procedure error(sError);
  end
  
  /*�������� �� �������������� ������ �������� ������ ��� ����� ��������*/
  if (:attribute_type=2) then begin
    attribute_value_int = cast (attribute_value as integer);
    if (attribute_classid is not null) then begin
      /*��������� �������������� ������*/
      if (attribute_value is not null) then begin
        /*������ ���� ����� �������� �� null*/
        if (not exists(select o.oid
          from objects o
          where o.classid=:attribute_classid
            and o.delmarked=0
            and o.oid=:attribute_value_int)) then
        begin
          sError = '������. �������� �� � ������. a_value='||trim(attribute_value)||'. classid='||cast(attribute_classid as varchar(8));
          execute procedure error(sError);
        end
      end /*if (attribute_value is not null)*/
    end /*if (attribute_classid is not null)*/
    if (:attribute_value is null) then begin
      delete from attrib_naklot a
        where a.oid=:oid and a.attribute_id=:attribute_id;
    end else begin
      /*����� �������� �� ������*/
      select a.value_int
         from attrib_naklot a
         where a.oid=:oid and a.attribute_id=:attribute_id
         into :attribute_value_int_old;
      if (:attribute_value_int_old is null) then begin
        /*������� �������� �� ����*/
        insert into attrib_naklot (oid,attribute_id,value_int)
          values(:oid,:attribute_id,:attribute_value_int);
      end else begin
        /*������ �������� ����*/
        if (:attribute_value_int_old<>:attribute_value_int) then begin
          /*� ��� �� ��������� � �����*/
          update attrib_naklot a
            set a.value_int=:attribute_value_int
            where a.oid=:oid
              and a.attribute_id=:attribute_id;
        end
      end
    end /*(:attribute_value is null) */
    exit;
  end /* if ((:attribute_type=2)*/
  
  if (:attribute_type=3) then begin
    /*���������� ���� �����*/
    attribute_value_date = cast (attribute_value as timestamp);
    if (:attribute_value is null) then begin
      delete from attrib_naklot a
        where a.oid=:oid and a.attribute_id=:attribute_id;
    end else begin
      /*����� �������� �� ������*/
      select a.value_date
         from attrib_naklot a
         where a.oid=:oid and a.attribute_id=:attribute_id
         into :attribute_value_date_old;
      if (:attribute_value_date_old is null) then begin
        /*������� �������� �� ����*/
        insert into attrib_naklot (oid,attribute_id,value_date)
          values(:oid,:attribute_id,:attribute_value_date);
      end else begin
        /*������ �������� ����*/
        if (:attribute_value_date_old<>:attribute_value_date) then begin
          /*� ��� �� ��������� � �����*/
          update attrib_naklot a
            set a.value_date=:attribute_value_date
            where a.oid=:oid
              and a.attribute_id=:attribute_id;
        end
      end
    end /*(:attribute_value is null) */  
    exit;
  end /* if ((:attribute_type=3)*/

  if (:attribute_type=4) then begin
    /*���������� ������������ �����*/
    attribute_value_double = cast (attribute_value as double precision);
    if (:attribute_value is null) then begin
      delete from attrib_naklot a
        where a.oid=:oid and a.attribute_id=:attribute_id;
    end else begin
      /*����� �������� �� ������*/
      select a.value_num15_4
         from attrib_naklot a
         where a.oid=:oid and a.attribute_id=:attribute_id
         into :attribute_value_double_old;
      if (:attribute_value_double_old is null) then begin
        /*������� �������� �� ����*/
        insert into attrib_naklot (oid,attribute_id,value_num15_4)
          values(:oid,:attribute_id,:attribute_value_double);
      end else begin
        /*������ �������� ����*/
        if (:attribute_value_double_old<>:attribute_value_double) then begin
          /*� ��� �� ��������� � �����*/
          update attrib_naklot a
            set a.value_num15_4=:attribute_value_double
            where a.oid=:oid
              and a.attribute_id=:attribute_id;
        end
      end
    end /*(:attribute_value is null) */  
    exit;
  end /* if ((:attribute_type=4)*/
  
  if (:attribute_type=1) then begin
    /*���������� ������*/
    if (:attribute_value is null) then begin
      delete from attrib_naklot a
        where a.oid=:oid and a.attribute_id=:attribute_id;
    end else begin
      /*����� �������� �� ������*/
      select a.value1
         from attrib_naklot a
         where a.oid=:oid and a.attribute_id=:attribute_id
         into :attribute_value_old;
      if (:attribute_value_old is null) then begin
        /*������� �������� �� ����*/
        insert into attrib_naklot (oid,attribute_id,value1)
          values(:oid,:attribute_id,:attribute_value);
      end else begin
        /*������ �������� ����*/
        if (:attribute_value_old<>:attribute_value) then begin
          /*� ��� �� ��������� � �����*/
          update attrib_naklot a
            set a.value1=:attribute_value
            where a.oid=:oid
              and a.attribute_id=:attribute_id;
        end
      end
    end /*(:attribute_value is null) */  
    exit;
  end /* if ((:attribute_type=4)*/
  
  sError='������. ���� �������������� ������ �����, ����, ������������, ������';
  execute procedure error(sError);

end

