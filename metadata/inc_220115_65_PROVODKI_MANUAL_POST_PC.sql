SET TERM ^ ;

CREATE OR ALTER PROCEDURE PROVODKI_MANUAL_POST_PC (
    id_prov integer)
as
declare variable sub1 integer;
declare variable sub2 integer;
declare variable sub3 bigint;
declare variable sub4 integer;
declare variable sub5 integer;
declare variable sub6 integer;
declare variable sub7 integer;
declare variable sub8 integer;
declare variable sub9 integer;
declare variable sub10 integer;
declare variable dat date;
declare variable id_schet integer;
declare variable tip_transh_fiction_not_ostatok integer;
begin
  select pr.dat, pr.sub1, pr.sub2, pr.sub3, pr.sub4, pr.sub5,
      pr.sub6, pr.sub7,  pr.sub8, pr.sub9, pr.sub10,
      pr.id_schet
    from provodki pr
    where pr.id_prov = :id_prov
    into :dat,:sub1, :sub2, :sub3, :sub4, :sub5,
      :sub6, :sub7, :sub8, :sub9, :sub10,
      :id_schet;
  tip_transh_fiction_not_ostatok = 2;
  execute procedure provodki_post_pc(
    :id_schet,
    :tip_transh_fiction_not_ostatok,
    :dat,
    :sub1,
    :sub2,
    :sub3,
    :sub4,
    :sub5,
    :sub6,
    :sub7,
    :sub8,
    :sub9,
    :sub10);
end
^

SET TERM ; ^


