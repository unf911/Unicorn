SET TERM ^ ;

CREATE OR ALTER PROCEDURE PRICE_CHANGE_UNPOST_PC (
    id_nakl integer)
as
declare variable tip smallint;
declare variable posted smallint;
declare variable delmarked smallint;
declare variable id_registr integer;
declare variable tip_nakl integer;
begin
  /*�������������� ��������*/
  select oid
    from GET_OID_OBJECTS_PC('�������� ��������',-100)
    into :id_registr;
  select oid
    from GET_OID_OBJECTS_PC('������� �������',:id_registr)
    into :id_registr;
  select oid
    from GET_OID_OBJECTS_PC('��������� ������',-100)
    into :tip;
  /*������ � �����*/
  select
      n.posted,n.delmarked,
      n.tip
    from
      naklo n
    where
      n.id_nakl = :id_nakl
    into
      :posted,:delmarked,
      tip_nakl;
  /*�������� �� ������������*/
  if ((:tip<>:tip_nakl) or (tip_nakl is null) ) then begin
    execute procedure error ('���� ���������� ����� ������� ������ ''��������� ������''');
  end  
  if (:delmarked<>0) then begin
    execute procedure error ('������ ���������� �������� ��������');
  end
  if (:posted=0) then begin
    execute procedure error ('������ ���������� �� ����������� ��������');
  end

  /*������ 0 � posted ��� ������� ��������������� ���������*/
  update naklo n
    set n.posted=0
    where n.id_nakl=:id_nakl and n.posted<>0;
end
^

SET TERM ; ^


