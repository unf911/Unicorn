SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_DOLG_NAL_PC (
    id_schet integer,
    sub1_in integer,
    sub2_in integer,
    sub3_in bigint,
    dat_from timestamp,
    dat_to timestamp,
    id_currency_to integer)
returns (
    sub1 integer,
    sub2 integer,
    sub3 bigint,
    sub4 integer,
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
declare variable dat_from_ost date;
declare variable sub1_det integer;
declare variable sub2_det integer;
declare variable sub3_det bigint;
declare variable sub4_det integer;
declare variable sub5_det integer;
declare variable datostbefore date;
declare variable datostafter date;
declare variable kurs double precision;
declare variable old_sub5_det integer;
begin
  if (id_schet is null) then begin
    select oid from get_oid_objects_pc('ТИП СЧЕТА',-100) into :id_schet;
    /*select oid from get_oid_objects_pc('ТИП ТРАНШИ',-100) into :tip_transh;*/
    select oid from get_oid_objects_pc('ДОЛГИ ЗА КАБЕЛЬ',:id_schet) into :id_schet;  
  end
  if (id_currency_to is null) then begin
    select oid from get_oid_objects_pc('ТИП ВАЛЮТ',-100) into :id_currency_to;
    select oid from get_oid_objects_pc('UAH',:id_currency_to) into :id_currency_to;
    sub5_det=id_currency_to;
  end

  /*Создание остатков за новое полугодие если оно наступило*/
  execute procedure PROVODKI_OSTATKI_PC(:id_schet,:dat_from);
    
  if (extractmonth(:dat_from)>6) then begin
    dat_from_ost= encodedate(1,7,extractyear(:dat_from));
  end else begin
    dat_from_ost= encodedate(1,1,extractyear(:dat_from));
  end
  
  for
    select
      p.sub1, p.sub2, p.sub3,p.sub4,p.sub5, p.debet,p.kredit,p.tip,p.dat,p.id_prov
    from provodki p
    where p.id_schet=:id_schet
      and p.dat between :dat_from_ost and :dat_to
      and (p.sub1 between coalesce(:sub1_in,-2147483648) and coalesce(:sub1_in, 2147483647) or p.sub1 is null)
      and (p.sub2 between coalesce(:sub2_in,-2147483648) and coalesce(:sub2_in, 2147483647) or p.sub2 is null)
      and (p.sub3 between coalesce(:sub3_in,-9223372036854775808) and coalesce(:sub3_in, 9223372036854775807) or p.sub3 is null)
    order by p.sub1,p.sub2,p.sub3,p.sub4,p.dat asc,p.tip
    into :sub1_det,:sub2_det,:sub3_det,:sub4_det,:sub5_det,:debet_det,:kredit_det,:tip,:dat,:id_prov
  do begin
  
    if (sub1 is null and sub2 is null and sub3 is null and sub4 is null) then begin
      /*первый шаг*/
      sub1=sub1_det;
      sub2=sub2_det;
      sub3=sub3_det;
      sub4=sub4_det;
    end /*первый шаг*/
    /*Узнаём курс на конечную дату и переводим всё по этому курсу*/
    /*Валюта записана в sub5*/
    kurs=1;
    if (sub5_det<>id_currency_to) then begin
      if (sub5_det<>old_sub5_det) then begin
        old_sub5_det=sub5_det;
        select dzero(kurs_from,kurs_to,1)
          from kurs_get_pc(:dat_to,:sub5_det,:id_currency_to,null)
          into :kurs;
      end
    end
    if (sub1<>sub1_det or sub2<>sub2_det or sub3<>sub3_det or sub4<>sub4_det) then begin
      /*следующий ряд, следовательно возвращаём результаты*/
      debet=Round(debet,2)*:kurs;
      kredit=Round(kredit,2)*:kurs;
      debetbefore=Round(debetbefore,2)*:kurs;
      kreditbefore=Round(kreditbefore,2)*:kurs;
      debetafter=Round(debetafter,2)*:kurs;
      kreditafter=Round(kreditafter,2)*:kurs;
      
      suspend;
      debet=0;
      kredit=0;
      debetbefore=0;
      kreditbefore=0;
      debetafter=0;
      kreditafter=0;
      sub1=sub1_det;
      sub2=sub2_det;
      sub3=sub3_det;
      sub4=sub4_det;
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
      if (tip<>1)  then begin
        if (debet_det>0) then begin
          debet=z(debet_det)+z(debet);
        end
        if (kredit_det>0) then begin
          kredit=z(kredit_det)+z(kredit);
        end
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
  debet=Round(debet,2)*:kurs;
  kredit=Round(kredit,2)*:kurs;
  debetbefore=Round(debetbefore,2)*:kurs;
  kreditbefore=Round(kreditbefore,2)*:kurs;
  debetafter=Round(debetafter,2)*:kurs;
  kreditafter=Round(kreditafter,2)*:kurs;

/*$$IBEC$$   debet=Round(debet,2);
  kredit=Round(kredit,2);
  debetbefore=Round(debetbefore,2);
  kreditbefore=Round(kreditbefore,2);
  debetafter=Round(debetafter,2);
  kreditafter=Round(kreditafter,2); $$IBEC$$*/
  suspend;  
EXIT;
end
^

SET TERM ; ^


