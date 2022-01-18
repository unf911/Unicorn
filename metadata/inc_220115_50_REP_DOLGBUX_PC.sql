SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_DOLGBUX_PC (
    sub1_in integer,
    sub2_in integer,
    sub3_in bigint,
    dat_from timestamp,
    dat_to timestamp)
returns (
    sub1 integer,
    sub2 integer,
    debetbefore double precision,
    kreditbefore double precision,
    debet double precision,
    kredit double precision,
    debetafter double precision,
    kreditafter double precision)
as
declare variable debet_det double precision;
declare variable kredit_det double precision;
declare variable tip integer;
declare variable dat date;
declare variable id_prov integer;
declare variable id_schet integer;
declare variable dat_from_ost date;
declare variable sub1_det integer;
declare variable sub2_det integer;
declare variable sub3_det bigint;
declare variable sub4_det integer;
declare variable datostbefore date;
declare variable datostafter date;
declare variable tip_transh integer;
declare variable minvalue double precision;
begin
  select oid from get_oid_objects_pc('ТИП СЧЕТА',-100) into :id_schet;
  select oid from get_oid_objects_pc('ТИП ТРАНШИ',-100) into :tip_transh;
  select oid from get_oid_objects_pc('ДОЛГИ ЗА КАБЕЛЬ',:id_schet) into :id_schet;
/*Создание остатков за новое полугодие если оно наступило*/
  execute procedure PROVODKI_OSTATKI_PC(:id_schet,null);
  select dat_from_ost
    from Get_Schet_Dat_From_Ost_PC(:id_schet,:dat_from)
    into :dat_from_ost;
  for
    select
      p.sub1, p.sub2, p.sub3,p.sub4,p.debet,p.kredit,p.tip,p.dat,p.id_prov
    from provodki p
    where p.id_schet=:id_schet
      and p.dat between :dat_from_ost and :dat_to
      and (p.sub1 between coalesce(:sub1_in,-2147483648) and coalesce(:sub1_in, 2147483647) or p.sub1 is null)
      and (p.sub2 between coalesce(:sub2_in,-2147483648) and coalesce(:sub2_in, 2147483647) or p.sub2 is null)
      and (p.sub3 between coalesce(:sub3_in,-9,223,372,036,854,775,808) and coalesce(:sub3_in, 9,223,372,036,854,775,807) or p.sub3 is null)
    order by p.sub1,p.sub2,p.dat asc,tip
    into :sub1_det,:sub2_det,:sub3_det,:sub4_det,:debet_det,:kredit_det,:tip,:dat,:id_prov
  do begin
  
    if (sub1 is null and sub2 is null) then begin
      /*первый шаг*/
      sub1=sub1_det;
      sub2=sub2_det;
    end /*первый шаг*/
    
    if (sub1<>sub1_det or sub2<>sub2_det) then begin
      /*следующий ряд, следовательно возвращаём результаты*/

      debet=Round(debet,2);
      kredit=Round(kredit,2);
      debetbefore=Round(debetbefore,2);
      kreditbefore=Round(kreditbefore,2);
      debetafter=Round(debetafter,2);
      kreditafter=Round(kreditafter,2);

      suspend;
      debet=0;
      kredit=0;
      debetbefore=0;
      kreditbefore=0;
      debetafter=0;
      kreditafter=0;
      sub1=sub1_det;
      sub2=sub2_det;
      datostbefore = null;
      datostafter = null;
    end /*следующий ряд, следовательно возвращаём результаты*/
    
    /*Остатки на начало периода*/
    if (dat<=dat_from) then begin
      if (tip=1) then begin
        if (datostbefore is null or datostbefore<dat) then begin
          /*первый попавшийся нам остаток или нашли более поздний остаток*/
          datostbefore=dat;
          debetbefore=z(debet_det);
          kreditbefore=z(kredit_det);
        end
        else begin
           /*остаток на ту же дату другого менеджера*/ 
          debetbefore=z(debet_det)+z(debetbefore);
          kreditbefore=z(kredit_det)+z(kreditbefore);
        end  /*if*/
      end /*tip=1*/
    end
    if (dat<dat_from) then begin
      if (tip<>1) then begin
          debetbefore=z(debet_det)+z(debetbefore);
          kreditbefore=z(kredit_det)+z(kreditbefore);
      end
    end
    /*Остатки на начало периода*/

    /*Обороты за период*/
    if  (dat between dat_from and dat_to) then begin
      if ((tip<>1) and (tip<>:tip_transh)) then begin
        kredit=z(kredit_det)+z(kredit);
        debet=z(debet_det)+z(debet);
        /*
        if (kredit_det>0) then begin
          kredit=z(kredit_det)+z(kredit);
        end
        if (debet_det>0) then begin
          debet=z(debet_det)+z(debet);
        end  */
      end
    end /*Обороты за период*/

    /*Остатки на конец периода*/
    if (dat<=dat_to) then begin
      if (tip=1) then begin
        if (datostafter is null or datostafter<dat) then begin
          /*первый попавшийся нам остаток или нашли более поздний остаток*/
          datostafter=dat;
          debetafter=z(debet_det);
          kreditafter=z(kredit_det);
        end else begin
          /*остаток на ту же дату другого менеджера*/
          debetafter=z(debet_det)+z(debetafter);
          kreditafter=z(kredit_det)+z(kreditafter);
        end /*if*/
      end /*tip=1*/
    end /*Остатки на конец периода*/
    
    if (dat<=dat_to) then begin
      if (tip<>1) then begin
        /*оплаты или долги*/
        kreditafter=z(kreditafter)+z(kredit_det);
        debetafter=z(debet_det)+z(debetafter);
      end    
    end
    
  end /*for select*/
  
      debet=Round(debet,2);
      kredit=Round(kredit,2);
      debetbefore=Round(debetbefore,2);
      kreditbefore=Round(kreditbefore,2);
      debetafter=Round(debetafter,2);
      kreditafter=Round(kreditafter,2);
      suspend;
end
^

SET TERM ; ^


