SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_OBOROTKA_DET_PC (
    id_schet integer,
    dat_from timestamp,
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
    sub10_in integer,
    id_nakl_in integer,
    attr1_in integer,
    attr2_in integer)
returns (
    sub1 integer,
    sub2 integer,
    sub3 bigint,
    sub4 integer,
    sub5 integer,
    sub6 integer,
    sub7 integer,
    sub8 integer,
    sub9 integer,
    sub10 integer,
    debet double precision,
    kredit double precision,
    debet_kolotp double precision,
    kredit_kolotp double precision,
    dat timestamp,
    id_nakl integer,
    attr1 integer,
    attr2 integer,
    tip integer,
    id_prov integer)
as
begin
  for
    select
      p.sub1, p.sub2, p.sub3, p.sub4, p.sub5,
      p.sub6, p.sub7, p.sub8, p.sub9, p.sub10,
      p.debet, p.kredit, p.tip, p.dat, p.id_prov,
      p.debet_kolotp,p.kredit_kolotp,p.id_nakl,
      p.attr1,p.attr2, p.tip
    from provodki p
    where p.id_schet=:id_schet
      and p.dat between :dat_from and :dat_to
      and p.tip<>1 
      and (p.sub1 between coalesce(:sub1_in,-2147483648) and coalesce(:sub1_in, 2147483647) or p.sub1 is null)
      and (p.sub2 between coalesce(:sub2_in,-2147483648) and coalesce(:sub2_in, 2147483647) or p.sub2 is null)
      and ((p.sub3 between coalesce(:sub3_in,-9,223,372,036,854,775,808) and coalesce(:sub3_in, 9,223,372,036,854,775,807)) or p.sub3 is null)
      and ((p.sub4 between coalesce(:sub4_in,-2147483648) and coalesce(:sub4_in, 2147483647)) or p.sub4 is null)
      and (p.sub5 between coalesce(:sub5_in,-2147483648) and coalesce(:sub5_in, 2147483647) or p.sub5 is null)
      and (p.sub6 between coalesce(:sub6_in,-2147483648) and coalesce(:sub6_in, 2147483647) or p.sub6 is null)
      and (p.sub7 between coalesce(:sub7_in,-2147483648) and coalesce(:sub7_in, 2147483647) or p.sub7 is null)
      and (p.sub8 between coalesce(:sub8_in,-2147483648) and coalesce(:sub8_in, 2147483647) or p.sub8 is null)
      and (p.sub9 between coalesce(:sub9_in,-2147483648) and coalesce(:sub9_in, 2147483647) or p.sub9 is null)
      and (p.sub10 between coalesce(:sub10_in,-2147483648) and coalesce(:sub10_in, 2147483647) or p.sub10 is null)
      and ((p.id_nakl between coalesce(:id_nakl_in,-2147483648) and coalesce(:id_nakl_in, 2147483647)) or p.id_nakl is null)
      and ((p.attr1 between coalesce(:attr1_in,-2147483648) and coalesce(:attr1_in, 2147483647)) or p.attr1 is null)
      and ((p.attr2 between coalesce(:attr2_in,-2147483648) and coalesce(:attr2_in, 2147483647)) or p.attr2 is null)
    order by p.dat asc,p.sub1,p.sub2,p.sub3,p.sub4,p.sub5,
      p.sub6,p.sub7,p.sub8,p.sub9,p.sub10,/*$$IBEC$$ tip $$IBEC$$*/debet,kredit
    into :sub1,:sub2,:sub3,:sub4,:sub5,
      :sub6,:sub7,:sub8,:sub9,:sub10,
      :debet,:kredit,:tip,:dat,:id_prov,
      :debet_kolotp,:kredit_kolotp,:id_nakl,
      :attr1,:attr2 , :tip
  do begin
    suspend;
  end
end
^

SET TERM ; ^


