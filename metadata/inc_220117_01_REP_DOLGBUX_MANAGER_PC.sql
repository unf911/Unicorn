SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_DOLGBUX_MANAGER_PC (
    sub1_in integer,
    sub2_in integer,
    sub3_in bigint,
    dat_in timestamp)
returns (
    sub1p integer,
    sub2p integer,
    sub3p bigint,
    debet double precision,
    kredit double precision,
    last_opl_dat timestamp,
    last_otg_neopl_dat timestamp,
    last_otg_sum double precision)
as
declare variable sub1 integer;
declare variable sub2 integer;
declare variable sub3 bigint;
declare variable sub4 integer;
declare variable debet_det double precision;
declare variable kredit_det double precision;
declare variable dat date;
declare variable datost date;
declare variable id_schet integer;
declare variable dat_to date;
declare variable oidtransh integer;
declare variable last_otg_dat date;
declare variable oidnaklr integer;
declare variable oidopl integer;
declare variable last_otg_id integer;
declare variable oid_tree integer;
declare variable id_manager_det integer;
begin
  select oid from get_oid_objects_pc('ТИП ТРАНШИ',-100) into :oidTransh;
  select oid from get_oid_objects_pc('РАСХОДНЫЕ НАКЛАДНЫЕ',-100) into :oidNaklr;
  select oid from get_oid_objects_pc('ОПЛАТЫ',-100) into :oidOpl;
  select oid from get_oid_objects_pc('ТИП СЧЕТА',-100) into :id_schet;
  select oid from get_oid_objects_pc('ДОЛГИ ЗА КАБЕЛЬ',:id_schet) into :id_schet;   

  dat_to=dat_in;
  
  select oid from get_oid_objects_pc('ТИП МЕНЕДЖЕРЫ',-100) into :oid_tree;
  if (sub3_in is null) then begin
    select g.visible_area
      from get_manager_visible_area(null) g
      into :sub3_in;
  end /*if (sub3_in is null)*/
  for
    select g.oid
    from get_object_children_pc(cast(:sub3_in as integer), :oid_tree) g
    into :id_manager_det
  do begin
      
    for
      select sub1,sub2,sub3,sub4,sum(r.debetafter),sum(r.kreditafter),max(r.dat_first)
      from rep_ostatki_pc(:id_schet,:dat_to,:sub1_in,:sub2_in,:id_manager_det,null,null,
        null,null,null,null,null) r
      group by sub1,sub2,sub3,sub4
      /*order by r.dat*/
      into :sub1,:sub2,:sub3,:sub4,:debet_det,:kredit_det,:dat
    do begin
      if ((sub1p is null) and
       (sub2p is null) and
       (sub3p is null)) then begin
        /*первый шаг*/
        sub1p=sub1;
        sub2p=sub2;
        sub3p=sub3;
      end
  
      if ((sub1p<>sub1) or (sub2p<>sub2) or (sub3p<>sub3)) then begin
        /*следующий ряд, следовательно возвращаём результаты*/
        /*не были найдены дата посл отг или дата посл опл или сумма посл неопл отгр*/
        if (Round(:debet,2)<>0 or Round(:kredit,2)<>0) then begin
          if (LAST_OPL_DAT is null) then begin
            select max(pr.dat)
              from provodki pr
              where pr.id_schet=:ID_SCHET
                and pr.tip=:oidOpl
                and pr.sub1=:sub1p
                and pr.sub2=:sub2p
                and pr.sub3=:sub3p
              into :LAST_OPL_DAT;
          end
          if (LAST_OTG_NEOPL_DAT is null) then begin
            select first 1 min(dat)
            from provodki pr
            where pr.id_schet=:id_schet
              and pr.sub1=:sub1p
              and pr.sub2=:sub2p
              and pr.sub3=:sub3p
              and pr.debet is not null
              and tip<>1
            group by
              pr.sub1,pr.sub2,pr.sub3,pr.sub4
            having Round(z(sum(pr.debet)),2)>0
            order by 1
            into :LAST_OTG_NEOPL_DAT;
          end
          if (last_otg_id is not null) then begin
            select first 1 pr.debet
              from provodki pr
              where pr.id_schet=:ID_SCHET
                and pr.tip=:oidNaklr
                and pr.sub1=:sub1p
                and pr.sub2=:sub2p
                and pr.sub3=:sub3p
                and pr.sub4=:last_otg_id
              order by pr.dat desc
              into :last_otg_sum;        
          end
          if (last_otg_sum is null) then begin
            select first 1 pr.debet
              from provodki pr
              where pr.id_schet=:ID_SCHET
                and pr.tip=:oidNaklr
                and pr.sub1=:sub1p
                and pr.sub2=:sub2p
                and pr.sub3=:sub3p
              order by pr.dat desc
              into :last_otg_sum;
          end
        end /*if debet<>0 or kredit<>0*/
        suspend;
        debet=0;
        kredit=0;
        sub1p=sub1;
        sub2p=sub2;
        sub3p=sub3;
        last_opl_dat = null;
        last_otg_dat = null;
        last_otg_sum=null;
        LAST_OTG_NEOPL_DAT=null;
        datost = null;
      end /*if следующий ряд*/
      /*оплаты*/
      if (kredit_det is not null) then begin
        kredit=z(kredit)+z(kredit_det);
        if (/*kredit_det>0  and*/ (last_opl_dat is null or dat>last_opl_dat)) then begin
          /*дата последней оплаты*/
          last_opl_dat = dat;
        end
      end  /*kredit_det>0*/
      /*расходные накладные*/
      if (debet_det is not null) then begin
        debet=z(debet)+z(debet_det);
        if (/*debet_det>0 and*/ (last_otg_dat is null or dat>last_otg_dat)) then begin
          /*дата последней отгрузки*/
          last_otg_dat = dat;
          last_otg_id = sub4;
        end
        if (debet_det>0 and (LAST_OTG_NEOPL_DAT is null or dat>LAST_OTG_NEOPL_DAT)) then begin
          /*дата последней неоплаченной отгрузки*/
          LAST_OTG_NEOPL_DAT = dat;
        end
      end /*debet_det is not null*/
    end /*for select*/
  end /*for*/
    /*Расчёт тех же дат, но только для последней записи. Оригинал выше*/
    if (LAST_OPL_DAT is null) then begin
      select max(pr.dat)
        from provodki pr
        where pr.id_schet=:ID_SCHET
          and pr.tip=:oidOpl
          and pr.sub1=:sub1p
          and pr.sub2=:sub2p
          and pr.sub3=:sub3p
        into :LAST_OPL_DAT;
    end
    if (LAST_OTG_NEOPL_DAT is null) then begin
      select first 1 min(dat)
      from provodki pr
      where pr.id_schet=:id_schet
        and pr.sub1=:sub1p
        and pr.sub2=:sub2p
        and pr.sub3=:sub3p
        and pr.debet is not null
        and tip<>1
      group by
        pr.sub1,pr.sub2,pr.sub3,pr.sub4
      having Round(z(sum(pr.debet)),2)>0
      order by 1
      into :LAST_OTG_NEOPL_DAT;
    end
    if (last_otg_id is not null) then begin
      select first 1 pr.debet
        from provodki pr
        where pr.id_schet=:ID_SCHET
          and pr.tip=:oidNaklr
          and pr.sub1=:sub1p
          and pr.sub2=:sub2p
          and pr.sub3=:sub3p
          and pr.sub4=:last_otg_id
        order by pr.dat desc
        into :last_otg_sum;        
    end  
    if (last_otg_sum is null) then begin
      select first 1 pr.debet
        from provodki pr
        where pr.id_schet=:ID_SCHET
          and pr.tip=:oidNaklr
          and pr.sub1=:sub1p
          and pr.sub2=:sub2p
          and pr.sub3=:sub3p
        order by pr.dat desc
        into :last_otg_sum;
    end
    
    suspend;
end
^

SET TERM ; ^


