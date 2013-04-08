SET TERM ^ ;

CREATE OR ALTER PROCEDURE MAKE_TRANSH(
    TYPE1 INTEGER,
    ID1 INTEGER,
    TYPE2 INTEGER,
    ID2 INTEGER,
    WHAT_ID INTEGER,
    SUMA DOUBLE PRECISION)
RETURNS (
    RESULT DOUBLE PRECISION)
AS
DECLARE VARIABLE OPLACH2 NUMERIC(15,2);
DECLARE VARIABLE SUM2 NUMERIC(15,2);
DECLARE VARIABLE DAT2 DATE;
DECLARE VARIABLE DAT1 DATE;
DECLARE VARIABLE TRANSH NUMERIC(15,2);
DECLARE VARIABLE POTRACH1 NUMERIC(15,2);
DECLARE VARIABLE OPL_ID INTEGER;
DECLARE VARIABLE NAKL_ID INTEGER;
DECLARE VARIABLE SUM1 NUMERIC(15,2);
Declare variable tip_opl integer;
Declare variable tip_nakl integer;
declare variable id_manager integer;
declare variable id_manager_opl integer;
declare variable str varchar(50);
declare variable tip_transh integer;
declare variable id_currency integer;
declare variable id_transh integer;
begin
  select oid from get_oid_objects_pc('ОПЛАТЫ',-100) into :tip_opl;
  select oid from get_oid_objects_pc('РАСХОДНЫЕ НАКЛАДНЫЕ',-100) into :tip_nakl;
  /* type 1=1 - id1 from oplaty  */
  /* type 1=2 - id1 from РАСХОДНЫЕ НАКЛАДНЫЕ*/
  /* type 2=3 - id1 from РАСХОДНЫЕ НАКЛАДНЫЕ НА УСЛУГИ */
  /* type 2=4 - id1 from РАСХОДНЫЕ НАКЛАДНЫЕ НА ФИНУСЛУГИ */
  /*По умолчанию*/
  tip_transh=0;
  SUMA = round(SUMA,2);
  if (type2=3) then begin
    /*Оплата услуг*/
    select oid from get_oid_objects_pc('РАСХОДНЫЕ НАКЛАДНЫЕ НА УСЛУГИ',-100) into :tip_nakl;
    type2=2;
    select oid from get_oid_objects_pc('ХОЗЯЙСТВЕННЫЕ ОПЕРАЦИИ',-100) into :tip_transh;
    select oid from get_oid_objects_pc('ТРАНШ В ДОЛГАХ ЗА УСЛУГИ',:tip_transh) into :tip_transh;
    /*tip_transh=-50;*/
  end
  if (type2=4) then begin
    /*Оплата финуслуг*/
    select oid from get_oid_objects_pc('РАСХОДНЫЕ НАКЛАДНЫЕ НА ФИНУСЛУГИ',-100) into :tip_nakl;
    type2=2;
    select oid from get_oid_objects_pc('ХОЗЯЙСТВЕННЫЕ ОПЕРАЦИИ',-100) into :tip_transh;
    select oid from get_oid_objects_pc('ТРАНШ В ДОЛГАХ ЗА ФИНУСЛУГИ',:tip_transh) into :tip_transh;
    /*tip_transh=-28;*/
  end  

  /* what_id=1 -max transh  */
  /* what_id=2 -partial transh */
  /* what_id=4 -clear oplaty,naklr,oplnakl */
  /* what_id=5 -clear last transh  */
  /* what_id=6 -recalculate field oplaty,naklr  */
  if (type1=1) then begin

  select dat,nds,
    (select cast(z(sum(t.transh)) as numeric(15,4))
      from oplnakl t
      where t.id_from=o.id_nakl
      ) as potracheno,o.id_manager
    from naklo o
    where tip=:tip_opl and id_nakl=:id1
    into :dat1,:sum1,:potrach1,:id_manager_opl;
    if (id_manager_opl is null) then begin
      str='Укажите менеджера которому идёт предоплата';
      execute procedure error (str);
    end
  end
  if (type1=2) then begin
    select  n.dat,n.nds,
      (select cast(z(sum(t.transh)) as numeric(15,4))
        from oplnakl t
        where t.id_to=n.id_nakl and t.tip in (0,2,-50)
        ) , n.id_manager, n.id_currency
    from naklo n
    where n.tip=:tip_nakl and n.id_nakl=:id1
    into :dat1,:sum1,:potrach1,:id_manager, :id_currency;
  end
  if (type2=2) then begin
    select  n.dat,n.nds, 
      (select cast(z(sum(t.transh)) as numeric(15,4))
        from oplnakl t
        where t.id_to=n.id_nakl and t.tip in (0,2,-50)
        ) , n.id_manager, n.id_currency
    from naklo n
    where n.tip=:tip_nakl and n.id_nakl=:id2
    into :dat2,:sum2,:oplach2,:id_manager, :id_currency;
  end

  /* partial transh  */
  if ((what_id=2) and (type1=1) and (type2=2)) then begin
    if ((z(sum1)-z(potrach1))>(z(sum2)-z(oplach2))) then begin
      transh=z(sum2)-z(oplach2);
    end
    else begin
      transh=z(sum1)-z(potrach1);
    end
    transh=round(transh,2);
    if ((transh>0) and (transh>=suma)) then begin
      transh=round(suma,2);
      if (:dat1<:dat2) then begin
        dat1=dat2;
      end
      
      id_transh=gen_id(OPLNAKL_GEN, 1);
      insert into oplnakl  (id, id_from,id_to,transh,opl_data,id_manager,tip, id_currency)
        values (:id_transh, :id1,:id2,:transh,:dat1,:id_manager,:tip_transh, :id_currency);
      execute procedure oplnakl_post_pc(:id_transh);
       
    end
    result = transh;
  end   /* partial transh  */

  /* transfer money from 1 to 2 maximum amount  */
  if ((what_id=1) and (type1=1) and  (type2=2)) then begin
    if ((z(sum1)-z(potrach1))>(z(sum2)-z(oplach2))) then begin
      transh=z(sum2)-z(oplach2);
    end
    else begin
      transh=z(sum1)-z(potrach1);
    end
    transh=round(transh,2);
    if (transh>0) then begin
      if (:dat1<:dat2) then begin
        dat1=dat2;
      end
      
      id_transh=gen_id(OPLNAKL_GEN, 1);
      insert into oplnakl  (id_from,id_to,transh,opl_data,id_manager,tip, id_currency)
        values (:id1,:id2,:transh,:dat1,:id_manager,:tip_transh, :id_currency);
      execute procedure oplnakl_post_pc(:id_transh);
        
      result = transh;
    end
  end   /* maximum transh  */

  /* clear oplaty  */
  if ((what_id=4) and (type1=1)) then begin
    result =0;
    for
      select id_to,transh from oplnakl
        where id_from=:id1 into :nakl_id,:transh
    do begin
      delete from oplnakl where id_from=:id1 and id_to=:nakl_id;
      result=result+1;
    end
  end /* clear oplaty  */

  /* clear naklr */
  if ((what_id=4) and (type1=2)) then begin
    result =0;
    for
      select id_from,transh from oplnakl
        where id_to=:id1 into :opl_id,:transh
    do begin
      delete from oplnakl where id_to=:id1 and id_from=:opl_id;
      result=result+1;
    end
  end /* clear naklr */

  /* clear last transh naklr  */
  if ((what_id=5) and (type1=2)) then begin
    select max(id) from oplnakl where id_to=:id1 into :id2;
    if (:id2 is not null) then  begin
      select t.id_to,t.id_from
        from oplnakl t        SET TERM ^ ;

CREATE OR ALTER PROCEDURE PROVODKI_CHECK_VZPOST_PC(
    ID_SCHET_IN INTEGER,
    DAT_FROM_IN TIMESTAMP,
    DAT_TO_IN TIMESTAMP,
    SUB1_IN INTEGER,
    FIX INTEGER)
RETURNS (
    ID_PROV INTEGER,
    ID_SCHET INTEGER,
    DAT TIMESTAMP,
    ID_NAKL INTEGER,
    ATTR1 INTEGER,
    ATTR2 INTEGER,
    TIP INTEGER,
    REASON VARCHAR(50))
AS
declare variable id_schet_tip integer;
  declare variable tip_plategy integer;
  declare variable tip_prix_nakl integer;
  declare variable delmarked integer;
  declare variable sub1 integer;
  declare variable sub2 integer;
  declare variable sub3 integer;
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

/*$$IBEC$$   for
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
        and ((pr.debet<0) or (pr.kredit<0));  $$IBEC$$*//*only transh provodki*//*$$IBEC$$ 
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
  
 $$IBEC$$*//*$$IBEC$$   --Документы незакрытые траншами
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
      if (fix=1) then begin
        delete from provodki pr
        where pr.sub4=:id_nakl and pr.id_schet=:id_schet_in
          and pr.dat between :dat_from_in and :dat_to_in
          and ((pr.debet<0) or (pr.kredit<0));  $$IBEC$$*//*only transh provodki*//*$$IBEC$$ 
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
    end $$IBEC$$*//*for*//*$$IBEC$$ 
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
      if (fix=1) then begin
        delete from provodki pr
        where pr.sub4=:id_nakl and pr.id_schet=:id_schet_in
          and pr.dat between :dat_from_in and :dat_to_in
          and ((pr.debet<0) or (pr.kredit<0));  $$IBEC$$*//*only transh provodki*//*$$IBEC$$ 
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
    end $$IBEC$$*//*for*//*$$IBEC$$ 

  end $$IBEC$$*//*for  sub3*/

  /*Платежи и др док без валюты*//*$$IBEC$$ 
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
   $$IBEC$$*//*Транши с проводками >0*//*$$IBEC$$ 
  for
    select id_nakl, pr.dat ,pr.tip,pr.attr1,pr.attr2,pr.id_prov
    from provodki pr
    where pr.id_schet=:id_schet_in and pr.tip=:tip_transh $$IBEC$$*//*8294*//*$$IBEC$$  and pr.debet>0
      and pr.dat between :dat_from_in and :dat_to_in
    into :id_nakl ,:dat,:tip,:attr1,:attr2 ,:id_prov
  do begin
    reason='transh debet>0';
    id_schet=:id_schet_in;
    if (fix=1) then begin
      if (tip=:tip_transh) then begin
        execute procedure oplnakl_post_pc(:id_nakl);
      end
    end
    suspend;
  end
  
   $$IBEC$$*//*В отчёте иногда показана неверая валюта между фирмой интер и поставщиком укк*//*$$IBEC$$ 
  if (fix=0) then begin
    for
      select id_nakl, pr.dat, pr.tip, pr.id_prov, pr.sub4
        from provodki pr
        where pr.id_schet=:id_schet_in
          and pr.tip=:tip_transh
          and pr.sub5=-44  $$IBEC$$*//*РАСХОДНАЯ НАКЛАДНАЯ И КАК ПРИХОДНАЯ*//*$$IBEC$$ 
          and pr.dat between :dat_from_in and :dat_to_in
        into :id_nakl ,:dat, :tip, :id_prov, :sub4
    do begin
      reason='id_currency =-44';
      suspend;
    end  
  end
  
  if (fix=1) then begin
    for
      select pr.sub4, pr.tip
        from provodki pr
        where pr.id_schet=:id_schet_in
          and pr.tip=:tip_transh
          and pr.sub5=-44  $$IBEC$$*//*РАСХОДНАЯ НАКЛАДНАЯ И КАК ПРИХОДНАЯ*//*$$IBEC$$ 
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
  end $$IBEC$$*/
  
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
end^

SET TERM ; ^

DESCRIBE PROCEDURE PROVODKI_CHECK_VZPOST_PC
'select
  r.sub1,r.sub2,r.sub3,r.sub4,
  sum(r.debet),sum(r.kredit),sum(r.debetafter), sum(r.kreditafter)
from rep_oborotka_pc(
  (select oid from get_oid_objects_pc(''РАСЧЁТЫ С ПОСТАВЩИКАМИ'',
  (select oid from get_oid_objects_pc(''ТИП СЧЕТА'',-100))))/*9043*/,''01.01.07'',''01.01.08'',
  18788/*null*/,null,null,null,null,null,null,null,null,null) r
group by r.sub1,r.sub2,r.sub3,r.sub4

select
  r.sub1,r.sub2,r.sub3,r.sub4,
  sum(r.debetbefore),sum(r.kreditbefore),sum(r.debet),sum(r.kredit),sum(r.debetafter), sum(r.kreditafter)
from rep_oborotka_pc(9043,''01.01.01'',''31.12.07'',
  null,null,null,null,null,null,null,null,null,null) r
group by r.sub1,r.sub2,r.sub3,r.sub4

select
  *
from provodki pr
  where /*$$IBEC$$  pr.sub4=94327 and $$IBEC$$*/ pr.id_schet=9043 and pr.sub1=14
order by pr.sub4

select * from PROVODKI_CHECK_VZPOST_PC(null,''01.01.05'',''31.12.08'',null,0)
select * from PROVODKI_CHECK_VZPOST_PC(null,''01.01.05'',''31.12.08'',2245,0)


Движения по траншу
select *
from provodki pr
where pr.id_schet=9043 and pr.sub4=(select id_from from oplnakl t where t.id=:id_nakl)
union all
select *
from provodki pr
where pr.id_schet=9043 and pr.sub4=(select id_to from oplnakl t where t.id=:id_nakl)';

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE PROVODKI_CHECK_VZPOST_PC;

GRANT SELECT ON PROVODKI TO PROCEDURE PROVODKI_CHECK_VZPOST_PC;

GRANT EXECUTE ON PROCEDURE OPLNAKL_POST_PC TO PROCEDURE PROVODKI_CHECK_VZPOST_PC;

GRANT EXECUTE ON PROCEDURE PLATEGY_POST_PC TO PROCEDURE PROVODKI_CHECK_VZPOST_PC;

GRANT EXECUTE ON PROCEDURE OPLATY_POST_PC TO PROCEDURE PROVODKI_CHECK_VZPOST_PC;

GRANT EXECUTE ON PROCEDURE PROVODKI_CHECK_VZPOST_PC TO SYSDBA;
        where t.id=:id2
        into :NAKL_ID,:OPL_ID;
      delete from oplnakl t where id=:id2;
      result = 1;
    end
  end /* clear last transh naklr  */


END^

SET TERM ; ^

DESCRIBE PROCEDURE MAKE_TRANSH
'Проводит оплату накладных с платежей
Используется в Формы ввода-Платежи-Оплатить';

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE MAKE_TRANSH;

GRANT SELECT,INSERT,DELETE ON OPLNAKL TO PROCEDURE MAKE_TRANSH;

GRANT SELECT ON NAKLO TO PROCEDURE MAKE_TRANSH;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE MAKE_TRANSH;

GRANT EXECUTE ON PROCEDURE OPLNAKL_POST_PC TO PROCEDURE MAKE_TRANSH;

GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO TRIGGER NAKLR_OPLNAKL_AU;
GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO PROCEDURE MAKE_FIN_TRASH;
GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO PROCEDURE MAKE_TRANSH;
GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO SYSDBA;
GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO BOSSES;
GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO BUXG;
GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO MANAGER;
GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO POWER_USER;
