SET TERM ^ ;

CREATE OR ALTER PROCEDURE PROVODKI_REFRESH_PC (
    id_schet integer,
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
declare variable dat date;
begin
  for
    select min(pr.dat),sub1,sub2,sub3,id_schet
      from provodki pr
      where pr.id_schet=:id_schet
        and pr.tip<>1
        and (pr.sub1 between coalesce(:sub1,-2000000000) and coalesce(:sub1, 2000000000) or pr.sub1 is null)
        and (pr.sub2 between coalesce(:sub2,-2000000000) and coalesce(:sub2, 2000000000) or pr.sub2 is null)
        and (pr.sub3 between coalesce(:sub3,-9223372036854775808) and coalesce(:sub3, 9223372036854775807) or pr.sub3 is null)
    group by sub1,sub2,sub3,id_schet
    into :dat,:sub1, :sub2, :sub3, :id_schet
  do begin
    if (dat is not null) then begin
      dat=incdate(:dat,0,-12,0);
      execute procedure provodki_post_pc(
      :id_schet,
      2,
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
    end /*if*/
  end /*for*/
end
^

SET TERM ; ^


