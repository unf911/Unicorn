SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_SEBEST_KREDIT_PO_NAKL2_PC (
    id_schet integer,
    id_nakl integer,
    id_tovar integer,
    dat_from date,
    dat_to date,
    cena double precision,
    kolotp double precision)
returns (
    sub1 integer,
    sub2 integer,
    sub3 bigint,
    kredit double precision,
    kredit_kolotp double precision)
as
declare variable sub4_nakl integer;
declare variable sub5_nakl integer;
declare variable id_nakl_perem integer;
declare variable cena_from double precision;
declare variable cena_to double precision;
declare variable cena_partii double precision;
declare variable kolotp_partii_perem double precision;
begin
  cena_to = :cena * 1.005;
  cena_from = :cena * 0.995;
  for
    select  pr.sub1, pr.sub2, pr.sub3, pr.sub4, pr.sub5, dzero(pr.debet,pr.debet_kolotp,0)
    from rep_oborotka_det_pc (:id_schet,:dat_from,:dat_to,
      :id_tovar, null, null, null, null,
      null,null,null,null,null, :id_nakl, null, null) pr
    where pr.debet_kolotp is not null and
      dzero(pr.debet,pr.debet_kolotp,0) between  coalesce(:CENA_FROM, -2147483648)
      and coalesce(:CENA_TO, 2147483647)
      and Round(pr.debet_kolotp,4)=Round(:kolotp,4)
    into :sub1, :sub2, :sub3, :sub4_nakl, :sub5_nakl, :cena_partii
  do begin
    for  /*partiya rasxod*/
      select sum(r.kredit_kolotp), sum(r.kredit)
      from rep_oborotka_det_pc (:id_schet,:dat_from,:dat_to,
        :sub1, :sub2,:sub3,:sub4_nakl,:sub5_nakl,
        null,null,null,null,null, null, null, null) r
      where r.kredit_kolotp is not null and r.tip<>-87
      into :kredit_kolotp, :kredit
    do begin
      suspend;
    end /*for partiya rasxod*/

    for

      select pr.id_nakl, pr.kredit_kolotp
        from provodki pr
        where pr.id_schet=:id_schet and pr.dat between :dat_from and :dat_to and
          pr.tip=-87 and pr.sub1=:sub1 and pr.sub2=:sub2 and
          pr.sub3=:sub3 and pr.sub4=:sub4_nakl and pr.sub5=:sub5_nakl and
          pr.kredit_kolotp is not null
/*$$IBEC$$       from rep_oborotka_det_pc (:id_schet,:dat_from,:dat_to,
        :sub1, :sub2,:sub3,:sub4_nakl,:sub5_nakl,
        null,null,null,null,null, null, null, null) r
      where r.kredit_kolotp is not null and r.tip=-87  $$IBEC$$*//*Бух перем*//*$$IBEC$$ 
      group by r.id_nakl $$IBEC$$*/

      into :id_nakl_perem, :kolotp_partii_perem
    do begin
      for
        select p.sub1, p.sub2, p.sub3, p.kredit, p.kredit_kolotp
        from rep_sebest_kredit_po_nakl2_pc(:id_schet, :id_nakl_perem,
          :id_tovar, :dat_from, :dat_to, :cena_partii, :kolotp_partii_perem) p
        into :sub1, :sub2, :sub3, :kredit, :kredit_kolotp
      do begin
        suspend;
      end
    end /*for nakl perem*/
  end /*for nakl*/
end
^

SET TERM ; ^


