SET TERM ^ ;

CREATE OR ALTER PROCEDURE TEMP83_FIX_IZLISHEK_BAR_PC(
    DAT_FROM TIMESTAMP)
RETURNS (
    ID_NAKL INTEGER,
    ID_DET INTEGER)
AS
begin
  if (DAT_FROM is null) then begin
    DAT_FROM= '23.12.09';
  end
  for
    select om.id_nakl,od.id_det
    from naklo om
      inner join naklot ot on ot.id_nakl=om.id_nakl
      inner join naklodet od on od.id_nakld=ot.id_nakld
    where om.dat>=:DAT_FROM
      and om.dat>'01.06.09' -- ��� ������������
--'15.08.09'
      and om.tip=2 and om.posted=1 --���������� �������
      and od.tip=5 and od.id_tara<>6828 --�� �����
      and ot.id_tovar<>12015 --�� ����� = ����
    into :id_nakl, :id_det
  do begin
  --864651
  --859690
    execute procedure naklp_unpost_pc(:id_nakl);

    update naklodet od
    set od.id_tara=6828 /*getbuxtnumber*/
    where od.id_det=:id_det;

    execute procedure naklp_post_pc(:id_nakl,null);

    suspend;
  end
end^

SET TERM ; ^

DESCRIBE PROCEDURE TEMP83_FIX_IZLISHEK_BAR_PC
'��������� ���� ������. ����� �������� ������ ������ ����� � ��� ������� �������.
��� ��� ����� ������ ��������� �� ������
select * from temp83_fix_izlishek_bar_pc(null)

����� ��
select * from temp83_fix_izlishek_bar_pc(''01.06.09'');
commit;';

GRANT SELECT ON NAKLO TO PROCEDURE TEMP83_FIX_IZLISHEK_BAR_PC;

GRANT SELECT ON NAKLOT TO PROCEDURE TEMP83_FIX_IZLISHEK_BAR_PC;

GRANT SELECT,UPDATE ON NAKLODET TO PROCEDURE TEMP83_FIX_IZLISHEK_BAR_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_UNPOST_PC TO PROCEDURE TEMP83_FIX_IZLISHEK_BAR_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_POST_PC TO PROCEDURE TEMP83_FIX_IZLISHEK_BAR_PC;

GRANT EXECUTE ON PROCEDURE TEMP83_FIX_IZLISHEK_BAR_PC TO SYSDBA;
