SET TERM ^ ;

CREATE OR ALTER PROCEDURE TEMP56_SEBEST_DAT_OVERLAP_PC (
    dat_from timestamp,
    dat_to timestamp)
returns (
    sub1 integer,
    sub2 integer,
    sub3 integer,
    dat timestamp,
    id_partiya bigint,
    kredit_kolotp double precision,
    kolotp_nexvat double precision,
    kredit double precision,
    diagnoz integer)
as
declare variable id_schet_tip integer;
declare variable id_schet_sebest_sklad integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
    into :id_schet_tip;
  select oid
    from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ СКЛАД',:id_schet_tip)
    into :id_schet_sebest_sklad;
  for
    select sub1,sub2,sub3,dat,debet_kolotp
      from provodki pr
      where pr.id_schet=:id_schet_sebest_sklad and
        pr.tip=5 and
        pr.debet=0 and
        pr.debet_kolotp>0 and
        pr.dat between :dat_from and :dat_to

      into :sub1,:sub2,:sub3,:dat,:kolotp_nexvat
  do begin
     diagnoz=0;
     for 
      select sub3,Round(sum(kolotp_after),3),Round(sum(r.debetafter)-sum(r.kreditafter),2)
      from rep_ostatki_pc(:id_schet_sebest_sklad,:dat,/*current_timestamp,*/
        :sub1,:sub2,
        null,null,
        null,null,
        null,null,
        null,null) r
      group by sub1,sub2,sub3,sub4
      having Round(sum(kolotp_after),3)>0
      order by sub3
      into :id_partiya,:kredit_kolotp,:kredit
     do begin
       if (id_partiya is not null) then begin
         /*была партия. Непонятно почему не использовалась*/
         diagnoz=1;
         suspend;
       end
     end
     if (diagnoz=0) then begin
     for 
        select sub3,Round(sum(kolotp_after),3),Round(sum(r.debetafter)-sum(r.kreditafter),2)
        from rep_ostatki_pc(:id_schet_sebest_sklad,current_timestamp,/*current_timestamp,*/
          :sub1,:sub2,
          null,null,
          null,null,
          null,null,
          null,null) r
        group by sub1,sub2,sub3,sub4
        having Round(sum(kolotp_after),3)>0
        order by sub3
        into :id_partiya,:kredit_kolotp,:kredit
       do begin
         if (id_partiya is not null) then begin
           /*была партия позже*/
           diagnoz=2;
           suspend;
         end
       end
     end  /*if (diagnoz=0)*/
     if (diagnoz=0) then begin
       suspend;
     end
   end /*for*/
  /* Procedure Text */
end
^

SET TERM ; ^


