SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_SEBEST_KREDIT_PO_NAKL_PC (
    dat_from date,
    dat_to date)
returns (
    id varchar(50),
    dat timestamp,
    id_izg integer,
    sub1 integer,
    sub2 integer,
    sub3 bigint,
    kredit double precision,
    kredit_kolotp double precision)
as
declare variable id_schet integer;
declare variable id_nakl integer;
declare variable id_tovar integer;
declare variable kolotp_partii double precision;
begin
  if (dat_from is null) then begin
    dat_from='01.04.2011';
  end
  if (dat_to is null) then begin
    dat_to='31.05.2011';
  end
  for
    select om.id_nakl, om.id, om.dat, om.id_izg, ot.id_tovar, ot.kolotp
    from naklp_vw  om inner join naklp_det_vw ot on om.id_nakl=ot.id_nakl
    where om.id_nakl
      in (
        1055547, 1081790,
        1054778,  1058587, 1058423,
        1055293, 1055287, 1068205, 1068199, 1068209,
        1060341,
        1067150, 1067158, 1067164,
        1115749)
        -- and ot.id_tovar=9860
    group by om.id_nakl, om.id, om.dat, om.id_izg, ot.id_tovar, ot.kolotp
    into :id_nakl, :id, :dat, :id_izg, :id_tovar, :kolotp_partii
  do begin
   for
      select s.oid
      from spr_schet_vw s
      where s.oid in (11352, 11513)
      into :id_schet
    do begin
      for
        select p.sub1, p.sub2, p.sub3, p.kredit, p.kredit_kolotp
        from rep_sebest_kredit_po_nakl2_pc(:id_schet, :id_nakl, :id_tovar,
          :dat_from, :dat_to, null ,:kolotp_partii) p
        into :sub1, :sub2, :sub3, :kredit, :kredit_kolotp
      do begin
        suspend;
      end
    end /*for id_schet*/
  end /*for naklp_vw*/
end
^

SET TERM ; ^


