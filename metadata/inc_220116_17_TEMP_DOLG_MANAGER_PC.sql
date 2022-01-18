SET TERM ^ ;

CREATE OR ALTER PROCEDURE TEMP_DOLG_MANAGER_PC (
    sub1_in integer,
    sub2_in integer,
    sub3_in bigint)
returns (
    sub1p integer,
    sub2p integer,
    sub3p bigint,
    debet double precision,
    kredit double precision,
    last_opl_dat timestamp,
    last_otg_dat timestamp,
    last_otg_sum double precision)
as
declare variable sub1 integer;
declare variable sub2 integer;
declare variable sub3 bigint;
declare variable debet_det double precision;
declare variable kredit_det double precision;
declare variable tip integer;
declare variable dat date;
declare variable datost date;
declare variable id_prov integer;
declare variable str varchar(250);
declare variable id_schet integer;
declare variable dat_from date;
declare variable dat_to date;
declare variable dat1 date;
declare variable kredit1 double precision;
declare variable debet1 double precision;
declare variable id_nakl1 integer;
declare variable sum1 double precision;
begin
  /* Procedure Text */
  id_schet=8211;
  dat_to=current_timestamp;
  if (extractmonth(current_timestamp)>6) then begin
    dat_from= encodedate(1,7,extractyear(current_timestamp));
  end else begin
    dat_from= encodedate(1,1,extractyear(current_timestamp));
  end
  for
    select
      p.sub1, p.sub2, p.sub3,p.debet,p.kredit,p.tip,p.dat,p.id_prov
    from provodki p
    where p.id_schet=:id_schet
      and p.dat between :dat_from and :dat_to
      and (p.sub1 between coalesce(:sub1_in,-2000000000) and coalesce(:sub1_in, 2000000000) or p.sub1 is null)
      and (p.sub2 between coalesce(:sub2_in,-2000000000) and coalesce(:sub2_in, 2000000000) or p.sub2 is null)
      and (p.sub3 between coalesce(:sub3_in,-9223372036854775808) and coalesce(:sub3_in, 9223372036854775807) or p.sub3 is null)
    order by p.sub1, p.sub2,p.sub3,p.tip,p.dat
    into :sub1,:sub2,:sub3,:debet_det,:kredit_det,:tip,:dat,:id_prov
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

        for
          select p.dat,p.kredit,p.debet,p.id_nakl
          from provodki p
          where p.id_schet=:ID_SCHET
            and p.sub1=:sub1p
            and p.sub2=:sub2p
            and p.sub3=:sub3p
            and p.tip<>1
          order by p.dat desc
          into :dat1, :kredit1, :debet1,:id_nakl1
        do begin
          if (last_otg_dat is null) then begin
          /*если ещё не знаем даты последней отгрузки то выясняем*/
            if (debet>0) then begin
              last_opl_dat=:dat1;
            end
          end /*нашли дату последней отгрузки*/
          if (last_otg_sum is null) then begin
            /*ещё не знаем суммы последней неоплаченной отгрузки*/
            if (debet1>0) then begin
              /*если отгрузка, то ищем была ли она оплачена*/
              select sum(debet)
              from provodki p2
              where p2.sub1=:sub1p
                and p2.sub2=:sub2p
                and p2.sub3=:sub3p
                and p2.sub4=:id_nakl1
                and p2.tip=8242 /*транши*/
              into :sum1;
              if (Round(:debet1+:sum1,4)>0) then begin
                /*раз отгрузка не оплачена, то нашли*/
                last_otg_sum=:debet1;
              end
            end
          end /*last_otg_sum*/
          if (last_opl_dat is null) then begin
            /*если ещё не знаем дату последней оплаты*/
            if (kredit1>0) then begin
              last_opl_dat=:dat1;
            end
          end /*last_opl_dat*/
        end /*for все движения по счёту*/
      suspend;
      debet=0;
      kredit=0;
      sub1p=sub1;
      sub2p=sub2;
      sub3p=sub3;
      last_opl_dat = null;
      last_otg_dat = null;
      last_otg_sum=null;
      datost = null;
    end
    if (tip=1) then begin
      if (datost is null) then begin
        /*первый попавшийся нам остаток*/
        datost=dat;
        debet=z(debet_det);
        kredit=z(kredit_det);
      end
      if (datost<dat) then begin
        /*уже был найден остаток, но дата этого - позднее*/
        str = 'Ошибка: два остатка за один период. Номер проводки ' ||
          trim(cast(id_prov as varchar(10)));
        execute procedure error(str);
      end
    end /*tip=1*/
    if (tip<>1) then begin
      /*оплаты*/
      if (kredit_det is not null ) then begin
        kredit=z(kredit)+z(kredit_det);
        if ((last_opl_dat is null) or (dat>last_opl_dat)) then begin
          /*дата последней оплаты*/
          last_opl_dat = dat;
        end
      end  /*kredit_det>0*/
      /*расходные накладные*/
      if (debet_det is not null) then begin
        debet=z(debet)+z(debet_det);
        if((last_otg_dat is null) or (dat>last_otg_dat)) then begin
          /*дата последней отгрузки*/
          last_otg_dat = dat;
        end
      end
    end /*tip<>1*/
  end /*for select*/
end
^

SET TERM ; ^


