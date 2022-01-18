SET TERM ^ ;

CREATE OR ALTER PROCEDURE PROVODKI_OSTATKI_FORCE_PC (
    id_schet integer,
    dat_to timestamp,
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
begin
  delete from provodki p
    where p.id_schet=:id_schet and p.tip=1 and p.dat=:dat_to
      and (p.sub1 between coalesce(:sub1_in,-2147483648) and coalesce(:sub1_in, 2147483647) or p.sub1 is null)
      and (p.sub2 between coalesce(:sub2_in,-2147483648) and coalesce(:sub2_in, 2147483647) or p.sub2 is null)
      and (p.sub3 between coalesce(:sub3_in,-2147483648) and coalesce(:sub3_in, 2147483647) or p.sub3 is null)
      and (p.sub4 between coalesce(:sub4_in,-2147483648) and coalesce(:sub4_in, 2147483647) or p.sub4 is null)
      and (p.sub5 between coalesce(:sub5_in,-2147483648) and coalesce(:sub5_in, 2147483647) or p.sub5 is null)
      and (p.sub6 between coalesce(:sub6_in,-2147483648) and coalesce(:sub6_in, 2147483647) or p.sub6 is null)
      and (p.sub7 between coalesce(:sub7_in,-2147483648) and coalesce(:sub7_in, 2147483647) or p.sub7 is null)
      and (p.sub8 between coalesce(:sub8_in,-2147483648) and coalesce(:sub8_in, 2147483647) or p.sub8 is null)
      and (p.sub9 between coalesce(:sub9_in,-2147483648) and coalesce(:sub9_in, 2147483647) or p.sub9 is null)
      and (p.sub10 between coalesce(:sub10_in,-2147483648) and coalesce(:sub10_in, 2147483647) or p.sub10 is null);
  for
    select r.dat_first,r.sub1,r.sub2,r.sub3,r.sub4,r.sub5,r.sub6,r.sub7,r.sub8,r.sub9,r.sub10
    from rep_ostatki_pc(:id_schet,incdate(:dat_to,-1,0,0),
      :sub1_in,:sub2_in,
      :sub3_in,:sub4_in,
      :sub5_in,:sub6_in, 
      :sub7_in,:sub8_in,
      :sub9_in,:sub10_in) r
    where ((Round(r.debetafter,2)<>0) or (Round(r.kreditafter,2)<>0))
        
      into :dat,:sub1, :sub2, :sub3,:sub4, :sub5,
        :sub6,:sub7,:sub8,:sub9,:sub10
  do begin
    if (dat is null) then begin
      dat=incdate(:dat_to,-1,0,0);
    end
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
    dat=null;
  end /*for provodki*/
end
^

SET TERM ; ^


