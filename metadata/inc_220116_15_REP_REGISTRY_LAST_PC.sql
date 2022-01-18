SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_REGISTRY_LAST_PC (
    id_registr integer,
    dat_in timestamp,
    sub1_in integer,
    sub2_in integer,
    sub3_in bigint)
returns (
    id_nakl integer,
    tip integer,
    dat timestamp,
    sub1 integer,
    sub2 integer,
    sub3 bigint,
    resurs1 double precision,
    resurs2 double precision)
as
declare variable dat_last_slice date;
declare variable id_prov integer;
begin
  if (dat_in is not null) then begin
    /*Если sub1= 1111, то выбрать среди всех товаров, а не по одному товар*/
    select max(r.dat)
    from registry r
    where r.id_registr=:id_registr
      and r.dat <=:dat_in
      and r.dat_to > :dat_in
      /*$$IBEC$$ and (r.sub1 between coalesce(:sub1_in,-2147483648) and coalesce(:sub1_in, 2147483647) or r.sub1 is null) $$IBEC$$*/
      and (r.sub2 between coalesce(:sub2_in,-2147483648) and coalesce(:sub2_in, 2147483647) or r.sub2 is null)
      and (r.sub3 between coalesce(:sub3_in,-9223372036854775808) and coalesce(:sub3_in, 9223372036854775807) or r.sub3 is null)
    into :dat_last_slice;
    for
      select r.sub1, r.sub2, r.sub3,
        r.resurs1, r.resurs2,
        r.tip, r.id_nakl, r.dat,r.id_prov
      from registry r
      where r.id_registr=:id_registr
        and r.dat =:dat_last_slice
        and r.dat_to > :dat_last_slice
        and (r.sub1 between coalesce(:sub1_in,-2147483648) and coalesce(:sub1_in, 2147483647) or r.sub1 is null)
        and (r.sub2 between coalesce(:sub2_in,-2147483648) and coalesce(:sub2_in, 2147483647) or r.sub2 is null)
        and (r.sub3 between coalesce(:sub3_in,-9223372036854775808) and coalesce(:sub3_in, 9223372036854775807) or r.sub3 is null)
      order by r.sub1,r.sub2,r.sub3,
        r.dat asc,r.tip
      into :sub1,:sub2,:sub3,
        :resurs1,:resurs2,
        :tip,:id_nakl,:dat, :id_prov
    do begin
      suspend;
    end
  end else begin
    /*возвращать записи на все даты */
    for
      select r.sub1, r.sub2, r.sub3,
        r.resurs1, r.resurs2,
        r.tip, r.id_nakl, r.dat,r.id_prov
      from registry r
      where r.id_registr=:id_registr
        and (r.sub1 between coalesce(:sub1_in,-2147483648) and coalesce(:sub1_in, 2147483647) or r.sub1 is null)
        and (r.sub2 between coalesce(:sub2_in,-2147483648) and coalesce(:sub2_in, 2147483647) or r.sub2 is null)
        and (r.sub3 between coalesce(:sub3_in,-9223372036854775808) and coalesce(:sub3_in, 9223372036854775807) or r.sub3 is null)
      order by r.sub1,r.sub2,r.sub3,
        r.dat asc,r.tip
      into :sub1,:sub2,:sub3,
        :resurs1,:resurs2,
        :tip,:id_nakl,:dat, :id_prov
    do begin
      suspend;
    end    
  end
end
^

SET TERM ; ^


