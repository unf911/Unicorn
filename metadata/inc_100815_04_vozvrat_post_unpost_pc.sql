SET TERM ^ ;

CREATE OR ALTER PROCEDURE VOZVRAT_POST_UNPOST_PC(
    ID_NAKL INTEGER)
AS
  declare variable name varchar(50);
  declare variable id_manager integer;
  declare variable dat date;
  declare variable tip integer;
  declare variable nds double precision;
  declare variable has_role smallint;
begin
  select om.tip,om.id_manager,
      om.nds,om.dat
    from naklo om
    where om.id_nakl=:id_nakl
    into :tip,:id_manager,
      :nds,:dat;
  select name from get_name_objects_pc(:tip,-100) into :name;
  if (name='������� ����������') then begin
    /*������� �����������*/
    if (current_timestamp-firstdaymonth(current_timestamp)<=5) then begin
      /*������ �� 5 ����� ����� ��������� ���������� �����*/
      if (:dat<firstdaymonth (incdate(current_timestamp,0,-1,0))) then begin
        select has_role from get_roles_pc('SNAB') into :has_role;
        if (has_role=1) then begin
          execute procedure error(
            '��������� �������� ������� ��������� ������ �� ������ ����������� ������');
        end
      end
    end else begin
      /*����� 5 ����� ������ ��������� ���������� �����*/
      if (:dat<firstdaymonth(current_timestamp)) then begin
        select has_role from get_roles_pc('SNAB') into :has_role;
        if (has_role=1) then begin
          execute procedure error(
            '��������� �������� ������� ��������� �� ������ ����� ������');
        end
      end /*if (:dat<firstdaymonth(current_timestamp))*/
    end/* if (current_timestamp-firstdaymonth(current_timestamp)<=5)  */
    /*�������� ���� ������� �� ���� ��������� �� ��������*/
    delete from provodki pr
      where pr.tip=:tip and pr.id_nakl=:id_nakl;
    /*�������� �������*/
    delete from oplnakl t where t.id_from=:id_nakl;
    /*������� ��� �������*/
    update naklo om
      set om.posted=0
      where om.posted=1 and
        om.delmarked=0 and
        om.id_nakl=:id_nakl;
  end /*if name='������� ����������'*/
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE VOZVRAT_POST_UNPOST_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE VOZVRAT_POST_UNPOST_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE VOZVRAT_POST_UNPOST_PC TO SNAB;
GRANT EXECUTE ON PROCEDURE VOZVRAT_POST_UNPOST_PC TO POWER_USER;

