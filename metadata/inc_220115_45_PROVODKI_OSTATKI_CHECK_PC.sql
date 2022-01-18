SET TERM ^ ;

CREATE OR ALTER PROCEDURE PROVODKI_OSTATKI_CHECK_PC (
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
returns (
    dat timestamp,
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
declare variable dat_act date;
begin
  select a.value_date
    from attributes a
    where a.oid=:id_schet and a.attribute_id=3
    into :dat_act;
  if (dat_to is null) then begin
    dat_to = dat_act;
  end
  if (dat_act<DAT_TO) then begin
    execute procedure error('Дата актуальности меньше даты проверки');
  end
  for
    select r.dat_first,r.sub1,r.sub2,r.sub3,r.sub4,r.sub5,r.sub6,r.sub7,r.sub8,r.sub9,r.sub10
    from rep_ostatki_pc(:id_schet,incdate(:dat_to,-1,0,0),
      :sub1_in,:sub2_in,
      :sub3_in,:sub4_in,
      :sub5_in,:sub6_in, 
      :sub7_in,:sub8_in,
      :sub9_in,:sub10_in) r  left join provodki pr on
        pr.sub1=r.sub1 and pr.sub2=r.sub2 and pr.sub3=r.sub3 and z(pr.sub4)=z(r.sub4)
        and z(pr.sub5)=z(r.sub5) and  z(pr.sub6)=z(r.sub6) and  z(pr.sub7)=z(r.sub7)
        and z(pr.sub8)=z(r.sub8) and  z(pr.sub9)=z(r.sub9) and  z(pr.sub10)=z(r.sub10) and
         pr.dat=:dat_to and pr.id_schet=:id_schet and pr.tip=1
    where /*$$IBEC$$ ((Round(r.debetafter,2)<>0) or (Round(r.kreditafter,2)<>0))
         and $$IBEC$$*/ 
         ((Round(z(pr.debet),2)<>Round(z(r.debetafter),2))
           or ((Round(z(pr.kredit),2)<>Round(z(r.kreditafter),2))))
      into :dat,:sub1, :sub2, :sub3,:sub4, :sub5,
        :sub6,:sub7,:sub8,:sub9,:sub10
  do begin
    suspend;
  end /*for provodki*/
end
^

SET TERM ; ^


