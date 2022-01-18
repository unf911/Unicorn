SET TERM ^ ;

CREATE OR ALTER PROCEDURE PROVODKI_REFRESH2_PC (
    id_schet integer,
    dat_from timestamp,
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
as
declare variable dat date;
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
begin
  for
    select min(pr.dat),sub1,sub2,sub3,sub4,sub5,
        sub6,sub7,sub8,sub9,sub10,
        id_schet
      from provodki pr
      where pr.id_schet=:id_schet
        /*and pr.tip<>1*/
        and (pr.sub1 between coalesce(:sub1_IN,-2000000000) and coalesce(:sub1_IN, 2000000000) or pr.sub1 is null)
        and (pr.sub2 between coalesce(:sub2_IN,-2000000000) and coalesce(:sub2_IN, 2000000000) or pr.sub2 is null)
        and (pr.sub3 between coalesce(:sub3_in,-9,223,372,036,854,775,808) and coalesce(:sub3_in, 9,223,372,036,854,775,807) or pr.sub3 is null)
        and (pr.sub4 between coalesce(:sub4_IN,-2000000000) and coalesce(:sub4_IN, 2000000000) or pr.sub4 is null)
        and (pr.sub5 between coalesce(:sub5_IN,-2000000000) and coalesce(:sub5_IN, 2000000000) or pr.sub5 is null)        
        and (pr.sub6 between coalesce(:sub6_IN,-2000000000) and coalesce(:sub6_IN, 2000000000) or pr.sub6 is null)        
        and (pr.sub7 between coalesce(:sub7_IN,-2000000000) and coalesce(:sub7_IN, 2000000000) or pr.sub7 is null)        
        and (pr.sub8 between coalesce(:sub8_IN,-2000000000) and coalesce(:sub8_IN, 2000000000) or pr.sub8 is null)        
        and (pr.sub9 between coalesce(:sub9_IN,-2000000000) and coalesce(:sub9_IN, 2000000000) or pr.sub9 is null)
        and (pr.sub10 between coalesce(:sub10_IN,-2000000000) and coalesce(:sub10_IN, 2000000000) or pr.sub10 is null)
        and pr.dat>=:dat_from
        and pr.tip<>1
    group by sub1,sub2,sub3,sub4,sub5,
      sub6,sub7,sub8,sub9,sub10,
      id_schet
    into :dat,:sub1, :sub2, :sub3, :sub4, :sub5,
      :sub6,:sub7,:sub8,:sub9,:sub10,
      :id_schet
  do begin
    if (dat is not null) then begin
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


