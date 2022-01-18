SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_OSTATKI_PC (
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
    sub1 integer,
    sub2 integer,
    sub3 bigint,
    sub4 integer,
    sub5 integer,
    sub6 integer,
    sub7 integer,
    sub8 integer,
    sub9 integer,
    sub10 integer,
    debetafter double precision,
    kreditafter double precision,
    kolotp_after double precision,
    dat_first timestamp,
    dat_last timestamp)
as
declare variable debet_det double precision;
declare variable kredit_det double precision;
declare variable tip integer;
declare variable dat date;
declare variable dat_from_ost date;
declare variable debet_kolotp_det double precision;
declare variable kredit_kolotp_det double precision;
declare variable minvalue double precision;
declare variable sub1_det integer;
declare variable sub2_det integer;
declare variable sub3_det bigint;
declare variable sub4_det integer;
declare variable sub5_det integer;
declare variable sub6_det integer;
declare variable sub7_det integer;
declare variable sub8_det integer;
declare variable sub9_det integer;
declare variable sub10_det integer;
declare variable datostafter date;
begin
  /*Создание остатков за новое полугодие если оно наступило*/
  /*$$IBEC$$ execute procedure PROVODKI_OSTATKI_PC(:id_schet,null); $$IBEC$$*/
    
  select dat_from_ost
    from Get_Schet_Dat_From_Ost_PC(:id_schet,:dat_to)
    into :dat_from_ost;

  for
    select
      p.sub1, p.sub2, p.sub3, p.sub4, p.sub5,
      p.sub6, p.sub7, p.sub8, p.sub9, p.sub10,
      p.debet, p.kredit, p.tip, p.dat,
      p.debet_kolotp,p.kredit_kolotp
    from provodki p
    where p.id_schet=:id_schet
      and p.dat between :dat_from_ost and :dat_to
      and (p.sub1 between coalesce(:sub1_in,-2147483648) and coalesce(:sub1_in, 2147483647) or p.sub1 is null)
      and (p.sub2 between coalesce(:sub2_in,-2147483648) and coalesce(:sub2_in, 2147483647) or p.sub2 is null)
      and (p.sub3 between coalesce(:sub3_in,-9,223,372,036,854,775,808) and coalesce(:sub3_in, 9,223,372,036,854,775,807) or p.sub3 is null)
      and (p.sub4 between coalesce(:sub4_in,-2147483648) and coalesce(:sub4_in, 2147483647) or p.sub4 is null)
      and (p.sub5 between coalesce(:sub5_in,-2147483648) and coalesce(:sub5_in, 2147483647) or p.sub5 is null)
      and (p.sub6 between coalesce(:sub6_in,-2147483648) and coalesce(:sub6_in, 2147483647) or p.sub6 is null)
      and (p.sub7 between coalesce(:sub7_in,-2147483648) and coalesce(:sub7_in, 2147483647) or p.sub7 is null)
      and (p.sub8 between coalesce(:sub8_in,-2147483648) and coalesce(:sub8_in, 2147483647) or p.sub8 is null)
      and (p.sub9 between coalesce(:sub9_in,-2147483648) and coalesce(:sub9_in, 2147483647) or p.sub9 is null)
      and (p.sub10 between coalesce(:sub10_in,-2147483648) and coalesce(:sub10_in, 2147483647) or p.sub10 is null)
    order by p.sub1,p.sub2,p.sub3,p.sub4,p.sub5,
      p.sub6,p.sub7,p.sub8,p.sub9,p.sub10,
      p.dat asc,tip
    into :sub1_det,:sub2_det,:sub3_det,:sub4_det,:sub5_det,
      :sub6_det,:sub7_det,:sub8_det,:sub9_det,:sub10_det,
      :debet_det,:kredit_det,:tip,:dat,
      :debet_kolotp_det,:kredit_kolotp_det
  do begin
  
    if (sub1 is null and sub2 is null and sub3 is null and sub4 is null and
      sub5 is null and sub6 is null and sub7 is null and sub8 is null and
      sub9 is null and sub10 is null) then begin
      /*первый шаг*/
      sub1=sub1_det;
      sub2=sub2_det;
      sub3=sub3_det;
      sub4=sub4_det;
      sub5=sub5_det;
      sub6=sub6_det;
      sub7=sub7_det;
      sub8=sub8_det;
      sub9=sub9_det;
      sub10=sub10_det;
    end /*первый шаг*/
    
    if (sub1<>sub1_det or sub2<>sub2_det
     or sub3<>sub3_det or sub4<>sub4_det
     or sub5<>sub5_det or sub6<>sub6_det
     or sub7<>sub7_det or sub8<>sub8_det
     or sub9<>sub9_det or sub10<>sub10_det) then begin
     
      /*следующий ряд, следовательно возвращаём результаты*/
      debetafter=Round(:debetafter,4);
      kreditafter=Round(:kreditafter,4);
      
      minvalue=minnum(:debetafter,:kreditafter);
      debetafter=z(:debetafter)-z(:minvalue);
      kreditafter=z(:kreditafter)-z(:minvalue);


      kolotp_after=z(:kolotp_after);

      suspend;

      debetafter=0;
      kreditafter=0;
      kolotp_after=0;
      sub1=sub1_det;
      sub2=sub2_det;
      sub3=sub3_det;
      sub4=sub4_det;
      sub5=sub5_det;
      sub6=sub6_det;
      sub7=sub7_det;
      sub8=sub8_det;
      sub9=sub9_det;
      sub10=sub10_det;
      datostafter = null;
      dat_first = null;
      dat_last = null;
    end /*следующий ряд, следовательно возвращаём результаты*/
    
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
        kolotp_after=z(kolotp_after)+z(debet_kolotp_det)-z(kredit_kolotp_det);
        if ((:dat_first is null) or (:dat_first>:dat)) then begin
          dat_first=:dat;
        end
        if ((:dat_last is null) or (:dat_last<:dat)) then begin
          dat_last=:dat;
        end        
      end
    end
    
  end /*for select*/

  debetafter=Round(:debetafter,4);
  kreditafter=Round(:kreditafter,4);
  

  minvalue=minnum(:debetafter,:kreditafter);
  debetafter=z(:debetafter)-z(:minvalue);
  kreditafter=z(:kreditafter)-z(:minvalue);

  suspend;
end
^

SET TERM ; ^


