SET TERM ^ ;

CREATE OR ALTER PROCEDURE PROVODKI_CHECK_VZPOST_PC (
    id_schet_in integer,
    dat_from_in timestamp,
    dat_to_in timestamp,
    sub1_in integer,
    fix integer)
returns (
    id_prov integer,
    id_schet integer,
    dat timestamp,
    id_nakl integer,
    attr1 integer,
    attr2 integer,
    tip integer,
    reason varchar(50))
as
declare variable id_schet_tip integer;
declare variable tip_plategy integer;
declare variable tip_prix_nakl integer;
declare variable delmarked integer;
declare variable sub1 integer;
declare variable sub2 integer;
declare variable sub3 bigint;
declare variable sub4 integer;
declare variable tip_oplaty integer;
declare variable tip_transh integer;
begin
  if (fix is null) then begin
    fix=0;/*не исправлять*/
  end
  if (dat_from_in is null) then begin
    /*Начало предыдущего месяца*/
    dat_from_in =firstdaymonth(incdate(current_timestamp,0,-1,0));
  end
  if (dat_to_in is null) then begin
    /*Конец текущего месяца*/
    dat_to_in=lastdaymonth(current_timestamp);
  end
  
  select oid from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100) into :id_schet_tip;  
  if (id_schet_in is null ) then begin
    select oid from GET_OID_OBJECTS_PC('РАСЧЁТЫ С ПОСТАВЩИКАМИ',:id_schet_tip) into :id_schet_in;
  end

  select oid from GET_OID_OBJECTS_PC('ОПЛАТЫ ИСХОДЯЩИЕ',-100) into :tip_plategy;
  select oid from GET_OID_OBJECTS_PC('ПРИХОДНЫЕ НАКЛАДНЫЕ',-100) into :tip_prix_nakl;
  select oid from GET_OID_OBJECTS_PC('ТИП ТРАНШИ',-100) into :tip_transh;
  select oid from GET_OID_OBJECTS_PC('ОПЛАТЫ',-100) into :tip_oplaty;
  /*provodki orphans*/
  for
    select
      id_nakl, pr.dat
    from provodki pr
      where pr.sub5 is  null and pr.id_schet=9043 and pr.tip=8294
        and pr.dat between :dat_from_in and :dat_to_in
    group by id_nakl,pr.dat
    into :id_nakl ,:dat
  do begin
    reason='transh with no currency';
    id_schet=:id_schet_in;
    if (fix=1) then begin
      execute procedure oplnakl_post_pc(:id_nakl);
    end
    suspend;
  end

  for
    select
      r.sub4
    from rep_oborotka_pc(:id_schet_in,:dat_from_in,:dat_to_in,
      :sub1_in,null,null,null,null,null,null,null,null,null) r
    group by r.sub1,r.sub2,r.sub3,r.sub4
    having ((Round(sum(r.kreditafter),2)<0) or (Round(sum(r.debetafter),2)<0))
    into :id_nakl
  do begin
    reason='provodki minus';
    id_schet=:id_schet_in;
    select tip,delmarked from naklo om where om.id_nakl=:id_nakl into :tip,:delmarked;
    if (fix=1) then begin
      delete from provodki pr
      where pr.sub4=:id_nakl and pr.id_schet=:id_schet_in
        and pr.dat between :dat_from_in and :dat_to_in
        and ((pr.debet<0) or (pr.kredit<0)); /*only transh provodki*/
      if ((tip=tip_plategy) and (delmarked=0)) then begin
        execute procedure plategy_post_pc(:id_nakl,:id_schet_in);
      end
      if ((tip=tip_prix_nakl) and (delmarked=0))  then begin
        execute procedure naklpbux_post_pc(:id_nakl,:id_schet_in);
      end
      if (delmarked=1) then begin
        delete from provodki pr
        where pr.sub4=:id_nakl and pr.id_schet=:id_schet_in
          and pr.dat between :dat_from_in and :dat_to_in;      
      end
    end
    suspend;  
  end

--Документы незакрытые траншами
  for
    select r.sub1,r.sub2,r.sub3
    from rep_ostatki_pc(:id_schet_in,incdate(:dat_to_in,-1,0,0),
        :sub1_in,null,
        null,null,
        null,null,
        null,null,
        null,null) r
    where ((Round(r.debetafter,2)<>0) or (Round(r.kreditafter,2)<>0))
    group by r.sub1,r.sub2,r.sub3
    having sum(r.debetafter)<>0 and sum(r.kreditafter)<>0
    into :sub1,:sub2,:sub3
  do begin
      
    for
      select r.sub4
      from rep_ostatki_pc(:id_schet_in,incdate(:dat_to_in,-1,0,0),
        :sub1,:sub2,
        :sub3,null,
        null,null,
        null,null,
        null,null) r
      where Round(r.debetafter,2)<>0
      group by r.sub1,r.sub2,r.sub3,r.sub4
      into :id_nakl
    do begin
      id_schet=:id_schet_in;
      select tip,delmarked from naklo om where om.id_nakl=:id_nakl into :tip,:delmarked;
      reason='nepotrachen debet';
      if (bitand(fix,2)<>0) then begin
        delete from provodki pr
        where pr.sub4=:id_nakl and pr.id_schet=:id_schet_in
          and pr.dat between :dat_from_in and :dat_to_in
          and ((pr.debet<0) or (pr.kredit<0)); /*only transh provodki*/
        if ((tip=tip_plategy) and (delmarked=0)) then begin
          execute procedure plategy_post_pc(:id_nakl,:id_schet_in);
        end
        if ((tip=tip_prix_nakl) and (delmarked=0))  then begin
          execute procedure naklpbux_post_pc(:id_nakl,:id_schet_in);
        end
        if ((tip=tip_oplaty) and (delmarked=0)) then begin
          execute procedure oplaty_post_pc(:id_nakl,:id_schet_in);
        end
        if (delmarked=1) then begin
          delete from provodki pr
          where pr.sub4=:id_nakl and pr.id_schet=:id_schet_in
            and pr.dat between :dat_from_in and :dat_to_in;      
        end    
        
      end
      suspend;
    end/*for*/
    for
      select r.sub4
      from rep_ostatki_pc(:id_schet_in,incdate(:dat_to_in,-1,0,0),
        :sub1,:sub2,
        :sub3,null,
        null,null,
        null,null,
        null,null) r 
      where Round(r.kreditafter,2)<>0
      group by r.sub1,r.sub2,r.sub3,r.sub4
      into :id_nakl
    do begin
    
      id_schet=:id_schet_in;
      select tip,delmarked from naklo om where om.id_nakl=:id_nakl into :tip,:delmarked;
      reason='nepotrachen kredit';
      if (bitand(fix,2)<>0) then begin
        delete from provodki pr
        where pr.sub4=:id_nakl and pr.id_schet=:id_schet_in
          and pr.dat between :dat_from_in and :dat_to_in
          and ((pr.debet<0) or (pr.kredit<0)); /*only transh provodki*/
        if ((tip=tip_plategy) and (delmarked=0)) then begin
          execute procedure plategy_post_pc(:id_nakl,:id_schet_in);
        end
        if ((tip=tip_prix_nakl) and (delmarked=0))  then begin
          execute procedure naklpbux_post_pc(:id_nakl,:id_schet_in);
        end
        if ((tip=tip_oplaty) and (delmarked=0)) then begin
          execute procedure oplaty_post_pc(:id_nakl,:id_schet_in);
        end        
        if (delmarked=1) then begin
          delete from provodki pr
          where pr.sub4=:id_nakl and pr.id_schet=:id_schet_in
            and pr.dat between :dat_from_in and :dat_to_in;      
        end    
      end
      suspend;
    end/*for*/
  end/*for  sub3*/
  /*Платежи и др док без валюты*/
  for
    select
      id_nakl, pr.dat ,pr.tip,pr.attr1,pr.attr2,pr.id_prov
    from provodki pr
    where pr.id_schet=9043 and pr.sub5 is null and tip<>8294
        and pr.dat between :dat_from_in and :dat_to_in
    into :id_nakl ,:dat,:tip,:attr1,:attr2 ,:id_prov
  do begin
    reason='documents with no currency';
    id_schet=:id_schet_in;
    if (fix=1) then begin
      if (tip=:tip_plategy) then begin
        execute procedure plategy_post_pc(:id_nakl,:id_schet_in);
      end
    end
    suspend;
  end

  
  /*В отчёте иногда показана неверая валюта между фирмой интер и поставщиком укк*/
  if (bitand(fix,1)=0) then begin
    for
      select id_nakl, pr.dat, pr.tip, pr.id_prov, pr.sub4
        from provodki pr
        where pr.id_schet=:id_schet_in
          and pr.tip=:tip_transh
          and pr.sub5=-44 /*РАСХОДНАЯ НАКЛАДНАЯ И КАК ПРИХОДНАЯ*/
          and pr.dat between :dat_from_in and :dat_to_in
        into :id_nakl ,:dat, :tip, :id_prov, :sub4
    do begin
      reason='id_currency =-44';
      suspend;
    end  
  end
  
  if (bitand(fix,1)<>0) then begin
    for
      select pr.sub4, pr.tip
        from provodki pr
        where pr.id_schet=:id_schet_in
          and pr.tip=:tip_transh
          and pr.sub5=-44 /*РАСХОДНАЯ НАКЛАДНАЯ И КАК ПРИХОДНАЯ*/
          and pr.dat between :dat_from_in and :dat_to_in
        group by pr.sub4, pr.tip
        into :sub4 , :tip
    do begin
      reason='id_currency =-44';
      if (tip=:tip_transh) then begin
        execute procedure naklr_post_pc(:sub4, :id_schet_in);
      end
      suspend;
    end
  end
  
  /*У платежа слишком много траншей*/
  for
    select 
        pr.id_nakl, pr.dat, pr.tip, pr.id_prov, pr.sub4
      from provodki pr inner join provodki pr2 on pr.sub4=pr2.sub4
      where pr.id_schet=:id_schet_in and pr.tip=:tip_plategy and
        pr.dat between :dat_from_in and :dat_to_in and
        pr2.tip=:tip_transh and pr2.id_schet=:id_schet_in
      group by pr2.sub4, pr.debet, pr.tip , pr.id_nakl, pr.id_prov, pr.dat, pr.sub4
      having Round(-sum(pr2.debet),2)> Round(pr.debet,2)
      into :id_nakl ,:dat, :tip, :id_prov, :sub4
  do begin
    reason='plateg has too many transhes';
    if (fix=1) then begin
      execute procedure plategy_post_pc(:id_nakl, :id_schet_in);
    end
    suspend;
  end
  
  /*У возврата слишком много траншей*/
  for  
    select 
        pr.id_nakl, pr.dat, pr.tip, pr.id_prov, pr.sub4 
      from provodki pr inner join provodki pr2 on pr.sub4=pr2.sub4
      where pr.id_schet=:id_schet_in and pr.tip=:tip_oplaty and
        pr.dat between :dat_from_in and :dat_to_in and
        pr2.tip=:tip_transh and pr2.id_schet=:id_schet_in
      group by pr2.sub4, pr.kredit, pr.tip , pr.id_nakl, pr.id_prov, pr.dat, pr.sub4
      having Round(-sum(pr2.kredit),2)> Round(pr.kredit,2)
      into :id_nakl ,:dat, :tip, :id_prov, :sub4       
  do begin
    reason='oplata has too many transhes';
    if (fix=1) then begin
      execute procedure oplaty_post_pc(:id_nakl, :id_schet_in);
    end
    suspend;
  end
  /*У приходной бух накл слишком много траншей*/
  for  
    select 
        pr.id_nakl, pr.dat, pr.tip, pr.id_prov, pr.sub4 
      from provodki pr inner join provodki pr2 on pr.sub4=pr2.sub4
      where pr.id_schet=:id_schet_in and pr.tip = :tip_prix_nakl and
        pr.dat between :dat_from_in and :dat_to_in and
        pr2.tip=:tip_transh and pr2.id_schet=:id_schet_in
      group by pr2.sub4, pr.kredit, pr.tip , pr.id_nakl, pr.id_prov, pr.dat, pr.sub4
      having Round(-sum(pr2.kredit),2)> Round(pr.kredit,2)
      into :id_nakl ,:dat, :tip, :id_prov, :sub4        
  do begin
    reason='prix_bux has too many transhes';
    if (fix=1) then begin
      execute procedure naklpbux_post_pc(:id_nakl, :id_schet_in);
    end
    suspend;
  end
end
^

SET TERM ; ^


