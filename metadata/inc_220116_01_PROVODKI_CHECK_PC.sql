SET TERM ^ ;

CREATE OR ALTER PROCEDURE PROVODKI_CHECK_PC (
    id_schet integer,
    dat_ost timestamp,
    sub1_in integer,
    sub2_in integer,
    sub3_in bigint)
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
    debet_ost double precision,
    kredit_ost double precision,
    debet_fact double precision,
    kredit_fact double precision)
as
declare variable dat_act date;
declare variable new_dat_act date;
declare variable old_dat_act date;
declare variable period integer;
declare variable month1 integer;
declare variable year1 integer;
declare variable value_date date;
begin

  select a.value_date
    from attributes a
    where a.oid=:id_schet and a.attribute_id=3
    into :dat_act;

  select a.value_int
    from attributes a
    where a.oid=:id_schet and a.attribute_id=2
    into :period;
  /*period=0; Никогда*/
  /* period=1; Год*/
  /* period=2; Полгода*/
  if (period is null) then begin
    execute procedure error('Для счёта №'||cast(id_schet as varchar(6))||' не установлен атрибут "Периодичность расчёта остатков"');
  end
  if (DAT_OST<DAT_ACT) then begin
    /*пользователь хочет проверить целостность
      более старых чем последний остатко*/
    dat_act=:dat_ost;
  end
    
  if (dat_act is null) then begin
    execute procedure error('Для счёта №'||cast(id_schet as varchar(6))||' не установлен атрибут "Дата актуальности счёта"');
/*    if (period=2) then begin
      dat_act=incdate(current_timestamp,0,-5,0);
    end
    if (period=1) then begin
      dat_act=incdate(current_timestamp,0,0,-1);
    end*/
  end

  if (period=0) then begin
    /*нечего считать*/
    exit;
  end
  if (period=2) then begin
    /*следующая дата через полгода*/
    old_dat_act=incdate(dat_act,0,-6,0);
  end
  if (period=1) then begin
    /*раз в год*/
    old_dat_act=incdate(dat_act,0,0,-1);
  end
    for
      select sub1,sub2,sub3,/*sub4,sub5,
          sub6,sub7,sub8,sub9,sub10,*/
          id_schet,sum(debet),sum(kredit)
        from provodki pr
        where pr.id_schet=:id_schet
          and pr.dat<:dat_act and pr.dat>=:old_dat_act
          and (pr.sub1 between coalesce(:sub1_in,-2147483648) and coalesce(:sub1_in, 2147483647) or pr.sub1 is null)
          and (pr.sub2 between coalesce(:sub2_in,-2147483648) and coalesce(:sub2_in, 2147483647) or pr.sub2 is null)
          and (pr.sub3 between coalesce(:sub3_in,-9223372036854775808) and coalesce(:sub3_in, 9223372036854775807) or pr.sub3 is null)
        group by sub1,sub2,sub3,/*sub4,sub5,
          sub6,sub7,sub8,sub9,sub10,*/
          id_schet
        into :sub1, :sub2, :sub3,/*:sub4, :sub5,
          :sub6,:sub7,:sub8,:sub9,:sub10,*/
          :id_schet,:debet_fact,:kredit_fact
    do begin
      debet_ost=null;
      kredit_ost=null;
      select sum(debet),sum(kredit)
        from provodki pr
        where pr.id_schet=:id_schet
          and pr.dat=:dat_act
          and (sub1=:sub1 or sub1 is null)
          and (sub2=:sub2 or sub2 is null)
          and (sub3=:sub3 or sub3 is null)
          and (sub4=:sub4 or sub4 is null)
          and (sub5=:sub5 or sub5 is null)
          and (sub6=:sub6 or sub6 is null)
          and (sub7=:sub7 or sub7 is null)
          and (sub8=:sub8 or sub8 is null)                                                                      
          and (sub9=:sub9 or sub9 is null)
          and (sub10=:sub10 or sub10 is null)
          and tip=1 
        group by sub1,sub2,sub3,/*sub4,sub5,
          sub6,sub7,sub8,sub9,sub10,*/
          id_schet
        into :debet_ost,:kredit_ost;
        if (Round(debet_ost-debet_fact,2)<>0 or Round(kredit_ost-kredit_fact,2)<>0 )  then begin
          suspend;
          debet_fact=null;
          kredit_fact=null;
        end
    end
end
^

SET TERM ; ^


