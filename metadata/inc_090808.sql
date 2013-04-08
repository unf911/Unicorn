SET TERM ^ ;
ALTER PROCEDURE REP_KLIENT_LAST_CONTACT_PC (
    id_manager_in integer)
returns (
    dat timestamp,
    tip integer,
    id_nakl integer,
    id_klient integer,
    name varchar(50),
    id_manager integer,
    yur_adres varchar(100),
    fiz_adres varchar(100),
    tel varchar(50),
    fax varchar(50),
    kontact_lico varchar(50),
    director varchar(50))
as
declare variable tip_rasx integer;
begin
  select oid from get_oid_objects_pc('РАСХОДНЫЕ НАКЛАДНЫЕ',-100) into :tip_rasx;
   
  for
  select max(om.dat), om.tip, om.id_zak,  max(om.id_nakl)
  from naklo om
  where om.delmarked=0 and om.tip in (:tip_rasx)
    and om.dat>incdate(current_date, 0,0,-1)
  group by om.id_zak,om.tip
  into :dat, :tip, :id_klient,:id_nakl
  do begin
    for
    select k.name,k.id_manager,k.adrp,k.adres,k.tel,k.fax,k.lico, k.fio
    from klient_all_vw k
    where k.id=:id_klient and
        k.id_manager between coalesce(:ID_MANAGER_IN,-2147483648)
        and coalesce(:ID_MANAGER_IN, 2147483647) and k.delmarked=0
    into :name, :id_manager,:yur_adres,:fiz_adres,:tel,:fax,:kontact_lico,:director
    do begin
      suspend;
    end
  end
end
^

SET TERM ; ^

update tovar t
set t.nothing=1
where t.oid=23601;

update tovar t
set t.nothing=1
where t.oid=23602;


delete from sklost s where s.id_tovar in
    (select t.id from tovar_all_vw t where t.nothing=1);




SET TERM ^ ;

ALTER PROCEDURE GET_BUXTNUMBER_PC 
returns (
    id_tara integer)
as
begin
  --Бухта
  id_tara=6828;
  suspend;
  --Банка
  id_tara=23601;
  suspend;
  --Мешок
  id_tara=23602;
  suspend;
END^

SET TERM ; ^

DESCRIBE PROCEDURE GET_BUXTNUMBER_PC
'Возвращает номер соответствующий номеру товара "Бухта"
из справочника товаров

select id_tara from get_buxtnumber_pc
Чтобы всё правильно работало также нужно в поле tovar.nothing=1.
Иначе остатки по складу будут считаться для товара "Мешок"';

SET TERM ^ ;

ALTER PROCEDURE NAKLODET_EXCHANGE_BUXT_PC (
    id_ostt1 integer,
    id_ostt2 integer)
as
declare variable id_det1 integer;
declare variable id_nakld integer;
declare variable blocked integer;
declare variable id_nakl integer;
begin
  select od.id_nakld,od.id_det
    from naklodet od
    where od.id_det in (
      select sd.id_det
        from sklostdet sd
        where sd.id_ostt=:id_ostt1 and sd.id_type=22
      ) and
      od.id_tara in (select id_tara from get_buxtnumber_pc) and
      od.tip=2 /*целиком отложено*/
  into :id_nakld,:id_det1;

  select om.blocked,om.id_nakl
    from naklo om
    where om.id_nakl = (
      select ot.id_nakl
        from naklot ot
        where ot.id_nakld=:id_nakld
    )
    into :blocked,:id_nakl;

  if (blocked = 1) then begin
    update naklo om
      set om.blocked=0
      where om.id_nakl=:id_nakl;
  end

  delete from naklodet od where od.id_det=:id_det1;
  execute procedure naklodet_insert_pc(1,:id_nakld,:id_ostt2,0,0,0);

  if (blocked = 1) then begin
    update naklo om
      set om.blocked=1
      where om.id_nakl=:id_nakl;
  end
end^

SET TERM ; ^


SET TERM ^ ;

ALTER PROCEDURE NAKLODET_PROCESS_PC(
    ID_DET INTEGER)
AS
DECLARE VARIABLE STR VARCHAR(100);
DECLARE VARIABLE ID_OSTT INTEGER;
DECLARE VARIABLE BARABAN SMALLINT;
DECLARE VARIABLE TIP INTEGER;
DECLARE VARIABLE ID_TARA INTEGER;
DECLARE VARIABLE ID_SKLAD INTEGER;
DECLARE VARIABLE ID_SKLAD_TO INTEGER;
DECLARE VARIABLE ID_OST INTEGER;
DECLARE VARIABLE ID_TOVAR INTEGER;
DECLARE VARIABLE ID_IZG INTEGER;
DECLARE VARIABLE COMMENT VARCHAR(50);
DECLARE VARIABLE NOMER_TARY VARCHAR(30);
DECLARE VARIABLE ID_OSTT2 INTEGER;
begin

  select
    od.tip,od.id_ostt,od.id_tara
  from
    naklodet od
  where
    od.id_det=:id_det
  into
    :tip,:id_ostt,:id_tara;
  /* ставим флаг барабана*/
  baraban = 1;
  if (exists (select * from get_buxtnumber_pc b where b.id_tara=:id_tara)) then begin
  --  if (:id_tara in (select id_tara from get_buxtnumber_pc)) then begin
    baraban = 0;
  end
  
  /*сама вставка нужных записей*/
  if (tip=0) then begin
    str = 'Некорректная позиция  ' || cast(id_det as varchar(10));
    /*execute procedure error(str);*/
  end
  
  if (tip=1) then begin
    if (baraban=1) then begin
      execute procedure sklostdet_insert_check_pc (:id_det,11,:id_ostt);
    end
    execute procedure sklostdet_insert_check_pc(:id_det,12,:id_ostt);
  end
  
  if (tip=2) then begin
    if (baraban=1) then begin
      execute procedure sklostdet_insert_check_pc (:id_det,21,:id_ostt);
    end  
    execute procedure sklostdet_insert_check_pc(:id_det,22,:id_ostt);
  end

  if (tip=3) then begin
    execute procedure sklostdet_insert_check_pc(:id_det,22,:id_ostt);
  end

  if (tip=4) then begin
    update sklostdet sd
    set sd.id_type=sd.id_type-10
    where
      (sd.id_type between 30 and 39) and
       sd.id_det=:id_det;
    execute procedure sklostdet_insert_check_pc(:id_det,22,:id_ostt);
    /*пересчёт барабана намотки*/
    select st.id_ostt
    from sklostdet st
    where st.id_det=:id_det and
      st.id_type=21
    into :id_ostt;
    execute procedure sklostdet_recalc_pc(:id_ostt);    
  end
      
  if (tip=5) then begin
    /*Даже в излишках могут быть барабаны. Их тоже нужно проводить*/
    if (baraban=1) then begin
      execute procedure sklostdet_insert_check_pc (:id_det,11,:id_ostt);
    end
    execute procedure sklostdet_insert_check_pc(:id_det,12,:id_ostt);
  end

  if (tip=8) then begin
    if (baraban=1) then begin
      execute procedure sklostdet_insert_check_pc (:id_det,31,:id_ostt);
    end  
    execute procedure sklostdet_insert_check_pc(:id_det,32,:id_ostt);
  end  

  if (tip=9) then begin
    execute procedure sklostdet_insert_check_pc(:id_det,32,:id_ostt);
  end  

  if (tip=10) then begin
    /*нет инфы о связи с барабаном намотки,
      поэтому ни разу не удаляем данные про
      барабан с намоткой*/
    update sklostdet sd
    set sd.id_type=sd.id_type+10
    where
      (sd.id_type between 20 and 29) and
       sd.id_det=:id_det;
    /*пересчёт барабана намотки*/
    select st.id_ostt
    from sklostdet st
    where st.id_det=:id_det and
      st.id_type=31
    into :id_ostt;
    execute procedure sklostdet_recalc_pc(:id_ostt);
  end

  if (tip=11) then begin
  /*целиком в порезку*/
    if (baraban=1) then begin
      execute procedure sklostdet_insert_check_pc (:id_det,31,:id_ostt);
    end  
    execute procedure sklostdet_insert_check_pc(:id_det,32,:id_ostt);
  end

  if (tip=12) then begin
    /*отмотка в порезку*/
    execute procedure sklostdet_insert_check_pc(:id_det,32,:id_ostt);
  end

  if (tip=13) then begin
    /*намотка в порезку*/
    /*нет инфы о связи с барабаном намотки,
      поэтому ни разу не удаляем данные про
      барабан с намоткой*/
    update sklostdet sd
    set sd.id_type=sd.id_type+10
    where
      (sd.id_type between 20 and 29) and
       sd.id_det=:id_det;
    /*пересчёт барабана намотки*/
    select st.id_ostt
    from sklostdet st
    where st.id_det=:id_det and
      st.id_type=31
    into :id_ostt;
    execute procedure sklostdet_recalc_pc(:id_ostt);
  end  /* tip=13*/

  if (tip=14) then begin
  /*целиком на хранение*/
    if (baraban=1) then begin
      execute procedure sklostdet_insert_check_pc (:id_det,31,:id_ostt);
    end  
    execute procedure sklostdet_insert_check_pc(:id_det,32,:id_ostt);
  end

  if (tip=15) then begin
    /*отмотка на хранение*/
    execute procedure sklostdet_insert_check_pc(:id_det,32,:id_ostt);
  end

  if (tip=16) then begin
    /*намотка на хранение*/
    /*нет инфы о связи с барабаном намотки,
      поэтому ни разу не удаляем данные про
      барабан с намоткой*/
    update sklostdet sd
    set sd.id_type=sd.id_type+10
    where
      (sd.id_type between 20 and 29) and
       sd.id_det=:id_det;
    /*пересчёт барабана намотки*/
    select st.id_ostt
    from sklostdet st
    where st.id_det=:id_det and
      st.id_type=31
    into :id_ostt;
    execute procedure sklostdet_recalc_pc(:id_ostt);
  end  /* tip=13*/


  /*выяснение информации о позиции для порезки и хранения*/
  if (tip between 11 and 16) then begin
    /*узнаем склад, товар, комментарий*/
    select om.id_sklad,om.id_sklad_to,ot.id_tovar, od.comment
      from naklo om
        inner join naklot ot on om.id_nakl=ot.id_nakl
        inner join naklodet od on od.id_nakld=ot.id_nakld
      where od.id_det=:id_det
      into :id_sklad,:id_sklad_to,:id_tovar,:comment;
    /*узнаем изготовителя кабеля*/
    select st.id_izg, st.nomer_tary
      from sklostdet sd
        inner join sklostt st on st.id_ostt=sd.id_ostt
      where sd.id_det=:id_det and sd.id_type in (22,32)
      into :id_izg,:nomer_tary;
    /*выясняем куда добавлять новую позицию на склад*/
    /*если порезка, то новая позиция попадает на тот же склад*/
    if (tip between 11 and 13) then begin
      execute procedure sklost_get_idost_pc(:id_tovar,:id_sklad)
        returning_values :id_ost;
    end
    /*если хранение, то новая позиция попадает на склад назначения (покупателя)*/
    if (tip between 14 and 16) then begin
      execute procedure sklost_get_idost_pc(:id_tovar,:id_sklad_to)
        returning_values :id_ost;
    end
   /*добавляем новую позицию с указанием известного изготовителя,
     комментария, т.к. процедура пересчёта остатков по складу не
     будет знать кто изготовитель данного кабеля */
    execute procedure sklostt_get_idostt_pc(null,
      :id_ost,:id_izg,:comment,:nomer_tary,:id_tara)
      returning_values :id_ostt2;
    /*в деталицию склада добавляем соответсвующие записи*/
    if (baraban=1) then begin
      execute procedure sklostdet_insert_check_pc (:id_det,11,:id_ostt2);
    end
    execute procedure sklostdet_insert_check_pc(:id_det,12,:id_ostt2);
    execute procedure sklostdet_recalc_pc(:id_ostt2);
  end
END^

SET TERM ; ^


SET TERM ^ ;




ALTER PROCEDURE REP_NAKLO_PC(
    ID_NAKL INTEGER)
RETURNS (
    ID_TOVAR INTEGER,
    ID_TARA INTEGER,
    NOMER_TARY VARCHAR(30),
    KOLOTP NUMERIC(15,4),
    KOLBUXT INTEGER,
    TIP INTEGER,
    KOLOTP_ITOG NUMERIC(15,4),
    ID_TARA_ITOG INTEGER,
    NOMER_TARY_ITOG VARCHAR(30),
    ID_IZG_ITOG INTEGER,
    COMMENT VARCHAR(50),
    TIP2 VARCHAR(50),
    PRIM VARCHAR(100))
AS
DECLARE VARIABLE MODIFIED DATE;
DECLARE VARIABLE ID_OSTT INTEGER;
declare variable id_nakld integer;
begin
  execute procedure check_naklo_consistency_pc(id_nakl);
  for
   /*список бухт в накладной*/
   select
    om.dat,
    ot.id_nakld,
    ot.id_tovar
   from
    naklo om inner join naklot ot on om.id_nakl=ot.id_nakl
   where
    ot.id_nakl=:id_nakl
   order by
    ot.id_pos
   into
     :modified,
     :id_nakld,
     :id_tovar
  do begin
    for
      select tip2, prim, id_izg_itog, nomer_tary_itog,
        kolotp_itog, id_ostt, id_tara_itog,
        id_tara, nomer_tary, tip, kolotp,
        kolbuxt, comment
      from rep_naklo_row_pr(:id_nakld,1)
      into :tip2,:prim,:id_izg_itog,:nomer_tary_itog,
        :kolotp_itog,:id_ostt,:id_tara_itog,
        :id_tara, :nomer_tary, :tip, :kolotp,
        :kolbuxt, :comment
    do begin
      suspend;
    end/*for rep_naklo_row_pr*/
  end/*for*/
END^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE REP_NAKLO_ROW_PR(
    ID_NAKLD INTEGER,
    MODE INTEGER)
RETURNS (
    TIP2 VARCHAR(50),
    PRIM VARCHAR(100),
    ID_IZG_ITOG INTEGER,
    NOMER_TARY_ITOG VARCHAR(50),
    KOLOTP_ITOG DOUBLE PRECISION,
    ID_OSTT INTEGER,
    ID_TARA_ITOG INTEGER,
    ID_TARA INTEGER,
    NOMER_TARY VARCHAR(30),
    TIP INTEGER,
    KOLOTP DOUBLE PRECISION,
    KOLBUXT INTEGER,
    COMMENT VARCHAR(50))
AS
  DECLARE VARIABLE DET_COUNT SMALLINT;
  DECLARE VARIABLE KOLREZERV_ITOG NUMERIC(15,4);
  DECLARE VARIABLE KOLBREZERV_ITOG INTEGER;
  DECLARE VARIABLE ID_TYPE_ITOG INTEGER;
  DECLARE VARIABLE MODIFIED DATE;
  DECLARE VARIABLE KOLBUXT_ITOG INTEGER;
  Declare variable STR varchar(250);
  declare variable tovar varchar(50);
  declare variable izg_itog varchar(50);
  declare variable id_buxt_number integer;
  declare variable id_tovar integer;
  declare variable id_det integer;
begin
  for
    select od.id_tara,od.nomer_tary,od.tip,od.kolotp,od.kolbuxt,od.comment,od.id_det, sd.id_ostt
      from naklodet od inner join sklostdet sd on od.id_det=sd.id_det
      where
        od.id_nakld =:id_nakld
        and sd.id_type in (22,32)
      order by od.id_det
      into :id_tara, :nomer_tary, :tip,:kolotp,:kolbuxt,:comment,:id_det,:id_ostt
  do begin

    if (id_ostt is null) then begin
   /*при слиянии строк с null получается null.Поэтому делаем строку пустой */
  
      select ot.id_tovar,(select trim(t.name) from objects t where t.oid=ot.id_tovar) as tovar
        from naklodet od
          inner join naklot ot
          on od.id_nakld=ot.id_nakld
        where od.id_det=:id_det
        into :id_tovar,:tovar;
      str = 'Ошибочная позиция: ' || tovar || ' ; ' || cast (cast(kolotp as numeric(9,3)) as varchar (9))  || trim(nomer_tary);
      execute procedure error (str);/*при слиянии строк с null получается null.Поэтому делаем строку пустой */ 
    end
    /*узнаем остаток на барабане на текущий момент*/
    execute procedure sklostdet_ost_pc(
      :id_ostt,
      :modified,
      3
    ) returning_values
    (  :id_tara_itog,
       :kolotp_itog,
       :KOLBUXT_ITOG,
       :KOLREZERV_ITOG,
       :KOLBREZERV_ITOG,
       :DET_COUNT,
       :ID_TYPE_ITOG);
    /*вычисляем сколько кабеля ещё не отгрузили*/
    kolotp_itog=Round(:kolotp_itog*:KOLBUXT_ITOG+
      KOLREZERV_ITOG,3);
    /*узнаём номер барабана*/
    select st.nomer_tary
    from sklostt st
    where st.id_ostt=:id_ostt
    into :NOMER_TARY_ITOG;
    /*возвращаем запись*/
    select st.id_izg
      from sklostt st
      where st.id_ostt=:id_ostt
      into :id_izg_itog;
    select name from objects o where o.oid=:id_izg_itog into :izg_itog;
    tip2 ='неизвестно';
    tip2= case tip
      when 0 then 'нет кабеля'
      when 1 then 'приход'
      when 2 then 'целиком'
      when 8 then 'целиком'
      when 11 then 'целиком'
      when 14 then 'целиком'
      when 3 then 'смотка'
      when 9 then 'смотка'
      when 12 then 'смотка'
      when 15 then 'смотка'
      when 4 then 'намотка'
      when 10 then 'намотка'
      when 13 then 'намотка'
      when 16 then 'намотка'
      when 5 then 'излишек'
    end;
    if (upper(tip2)='ЦЕЛИКОМ') then begin
      prim=trim(:nomer_tary);
    end
    if (upper(tip2)='СМОТКА') then begin
      prim= 'c ' || trim(cast (coalesce(:kolotp_itog,0) as numeric(9,3)) )
        || ' ' || trim(:nomer_tary_itog) ;
    end
    if (upper(tip2)='НАМОТКА') then begin
      prim= 'c ' || trim(cast (coalesce(:kolotp_itog,0) as numeric(9,3)) )
        || ' ' || trim(:nomer_tary_itog);
    end
    if (exists (select * from get_buxtnumber_pc b where b.id_tara=:id_tara)) then begin
      prim = trim(prim) || ' ' || substr(:izg_itog,1,4);
    end /*if (id_tara=id_buxt_number)*/
    suspend;
  end /*for*/
end^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SKLOSTDET_OST_PC(
    ID_OSTT INTEGER,
    MODIFIED TIMESTAMP,
    TIP_OST INTEGER)
RETURNS (
    ID_TARA_ITOG INTEGER,
    KOLOTP_ITOG NUMERIC(15,4),
    KOLBUXT_ITOG INTEGER,
    KOLREZERV_ITOG NUMERIC(15,4),
    KOLBREZERV_ITOG INTEGER,
    DET_COUNT INTEGER,
    ID_TYPE_ITOG INTEGER)
AS
DECLARE VARIABLE STR VARCHAR(100);
DECLARE VARIABLE BARABAN_R SMALLINT;
DECLARE VARIABLE BARABAN_P SMALLINT;
DECLARE VARIABLE MNOGO_BUXT_P INTEGER;
DECLARE VARIABLE BUXT_NUMBER INTEGER;
DECLARE VARIABLE KOLBUXT INTEGER;
DECLARE VARIABLE KOLOTP NUMERIC(15,4);
DECLARE VARIABLE ID_TYPE INTEGER;
DECLARE VARIABLE ID_TARA INTEGER;
DECLARE VARIABLE KOLBUXT1 INTEGER;
DECLARE VARIABLE KOLBUXT2 INTEGER;
DECLARE VARIABLE KOLBUXT3 INTEGER;
DECLARE VARIABLE KOLOTP1 NUMERIC(15,4);
DECLARE VARIABLE KOLOTP2 NUMERIC(15,4);
DECLARE VARIABLE KOLOTP3 NUMERIC(15,4);
DECLARE VARIABLE EMPTY INTEGER;
begin
  /* счётчик количества записей в журнале*/
  det_count = 0;
  if (modified is null) then begin
    modified = '31.12.9999';
  end
  select first 1 id_tara
  from get_buxtnumber_pc
  into :BUXT_NUMBER;
  
  id_tara_itog = buxt_number;
  baraban_p=0;
  baraban_r=0;
  mnogo_buxt_p=0; /* =1 -> пришло много бухт*/
  for
    select kolotp,kolbuxt,id_type,id_tara
    from SKLOSTDET_OST_PART_PC(:id_ostt,:modified,:tip_ost)
    into
      :kolotp,:kolbuxt,:id_type,:id_tara
  do begin
    /*увеличиваем счётчик записей в журнале*/
    det_count = det_count + 1;
  
    if (:id_type=11) then begin
      /*приход барабана*/
      baraban_p=1;
      id_tara_itog = id_tara;
    end

    if (:id_type=12) then begin
      /*приход кабеля*/
      kolotp1=z(:kolotp1)+z(:kolotp);
      if (kolbuxt>1) then begin
         kolbuxt1=z(:kolbuxt1)+z(:kolbuxt);
        if (baraban_p=0) then begin
          mnogo_buxt_p=1;
        end else begin
          str = 'На барабан не может быть намотано несколько бухт';
          execute procedure error (str);
        end  /*нет барабана*/
      end else begin  /*kolbuxt>1*/
        if (kolbuxt1>1) then begin
          str = 'Если бухт>1, то наматывать излишки запрещено';
          execute procedure error (str);
        end
        kolbuxt1=1;
      end /* kolbuxt>1 */
      id_tara_itog = id_tara;
    end /*id_type=12*/

    if (:id_type=21) then begin
      /* резерв барабана */
      baraban_r = 2;
    end  /*id_type=21*/

    if (:id_type=22) then begin
      /* резерв кабеля*/
      if (mnogo_buxt_p=1) then begin
        if  (Round(kolotp,3)<>Round(kolotp1,3)) then begin
           str = 'Невозможно отложить бухты с длиной не равной '
             || cast(Round(kolotp1,3) as varchar(6)) ;
           execute procedure error(str);
        end else begin /*неверная длина бухт*/
           kolotp2=z(:kolotp);
           kolbuxt2=z(:kolbuxt2)+z(:kolbuxt);
        end /*неверная длина бухт*/
      end  else begin /*mnogo buxt*/
        if (kolbuxt>1) then begin
          /*с барабана отрезают несколько бухт. в остатках это отображается
            как одна бухта с длиной =длина отл бухты * кол-во бухт */
          kolbuxt2=1;
          kolotp2=z(:kolotp2)+Round(z(:kolbuxt)*z(kolotp),2);
        end else begin /*kolbuxt>1*/
          /*c барабана отрезали одну бухту - стандарт*/
          kolbuxt2=z(:kolbuxt);
          kolotp2=z(:kolotp2)+z(kolotp);
        end
      end /*mnogo buxt*/
    end /*id_type=22*/

    if (:id_type=31) then begin
      /* отгрузка барабана */
      baraban_r = 3;
    end /*id_type=31*/

    if (:id_type=32) then begin
      /*отгрузка кабеля*/
      if (mnogo_buxt_p=1) then begin
        if  (Round(kolotp,2)<>Round(kolotp1,2)) then begin
           str = 'Невозможно отгрузить бухты с длиной не равной '
             || cast(Round(kolotp1,3) as varchar(6));
           execute procedure error(str);
        end else begin /*неверная длина бухт*/
           kolotp3=z(:kolotp);
           kolbuxt3=z(:kolbuxt3)+z(:kolbuxt);
        end /*неверная длина бухт*/
      end else begin /*mnogo buxt*/
        if (kolbuxt>1) then begin
          /*с барабана отрезают несколько бухт. в остатках это отображается
            как одна бухта с длиной =длина отл бухты * кол-во бухт */
          kolotp3=z(:kolotp3)+Round(z(:kolotp)*z(kolbuxt),2);
          kolbuxt3=1;
        end else begin /*kolbuxt>1*/
          /*c барабана отгрузили одну бухту - стандарт*/
          kolbuxt3=z(:kolbuxt);
          kolotp3=z(:kolotp3)+z(kolotp);
        end /*kolbuxt>1*/
      end /*mnogo buxt*/
    end  /*id_type=32*/

  end /* for */

  kolbuxt_itog =z(:kolbuxt1)-z(:kolbuxt2)-z(:kolbuxt3);
  if (mnogo_buxt_p=1) then begin
    /*много бухт*/
    if (kolbuxt_itog=0) then begin
      /*все бухты отложили или продали*/
      kolotp_itog=0;
    end else begin/* kolbuxt_itog=0 */
      kolotp_itog=z(:kolotp1);
    end
  end else begin  /*mnogo_buxt=1*/
    /*барабан или бухта*/
    kolotp_itog =z(:kolotp1)-z(:kolotp2)-z(:kolotp3);
  end  /* mnogo_buxt=1 */
  kolotp_itog=round(kolotp_itog,3);
  kolrezerv_itog = Round(z(:kolotp2),3);
  kolbrezerv_itog=z(:kolbuxt2);

  /*много кусков по 1 в сумме дают 0, мы меняем на 1*/
  if ((kolbrezerv_itog=0) and Round(kolrezerv_itog,3)>0) then begin
    kolbrezerv_itog = 1;
  end

  /*много кусков отгружали, но кабель остался,
  следовательно хоть одна бухта есть*/
  if ((kolbuxt_itog<1) and (mnogo_buxt_p=0)) then begin
    /*Юра, Янтарь, 14.12.04 ПВС-2*1.5 Смогли отложить много бухт
    потому, что остаток по колву бухт всё время показывал
    1 оставшуюся бухту. Теперь это будет только
    если была одна бухта или барабан*/
    kolbuxt_itog = 0; /*не меньше нуля кусков*/
    if (round(kolotp_itog,3)>0) then begin
      kolbuxt_itog = 1;
    end
  end
  /*--------------------------------------------*/
  /*выяснение типа остатка - целый, резанный, пустой барабан*/
  /*свободен ли барабан*/
  empty=0;
  /*тип = без тары по умолчанию */
  id_type_itog=5;

  if ((round(kolotp_itog,3)=0) and
    (round(kolrezerv_itog,3)=0)) then begin
    if (baraban_p=1) then begin
      /*барабан свободен если с него всё отгружено*/
      empty=1; /*флаг проверяемый далее*/
    end else begin
      /*бухта пришла, пуста, отгружена ->позиция отгружена*/
      id_type_itog=3;
    end
  end
  /*барабан пришёл*/
  if (baraban_p=1) then begin
    if (z(kolotp3)=0) then begin
      id_type_itog=4; /*целый*/
    end
    if (z(kolotp3)>0) then begin
      id_type_itog=6;/*порезанный*/
    end
  end
  /*бухта пришла*/
  if (baraban_p=0) then begin
    if ((z(kolotp3)>0) and (id_type_itog<>3)) then begin
      id_type_itog=6;/*бухта порезанная но не пустая*/
    end
  end
  
  if ((baraban_r=0) and (empty=1)) then
  begin
    id_type_itog=1; /*барабан свободен*/
    /*04/12/08. Склад Люмилюкс, барабан 18. idostt=149409, барабан был свободен
    но количество бухт показывалось в расчёте=0, соотв колво барабанов итого было0
    и не билась себест с ост по складу*/
    kolbuxt_itog = 1;
    kolbrezerv_itog=0;
  end
  
  if ((baraban_r=2) and (baraban_p=1) and (empty=1)) then
  begin
    id_type_itog=2; /*барабан отложен*/
    kolbrezerv_itog=1;
    kolbuxt_itog=0;
  end

  /*барабан пришёл, пуст, отгружен ->позиция отгружена*/
  if ((baraban_r=3) and (baraban_p=1) and (empty=1)) then
  begin
    id_type_itog=3; /*позиция отгружена*/
  end

  if ((baraban_r=3) and (baraban_p=1) and (empty=0)) then
  begin
    /*осталась бухта*/
    id_type_itog=5; /*редкий случай- можно считать ошибка*/
    /*id_tara_itog = buxt_number;*/
  end
END^
SET TERM ; ^

SET TERM ^ ;
ALTER PROCEDURE SKLOSTDET_RECALC_TEST_PC(
    ID_OSTT INTEGER)
AS
DECLARE VARIABLE ID_OST INTEGER;
DECLARE VARIABLE DAT_OTGR DATE;
DECLARE VARIABLE DET_COUNT SMALLINT;
DECLARE VARIABLE ID_IZG INTEGER;
DECLARE VARIABLE KOLOTP_ITOG NUMERIC(15,4);
DECLARE VARIABLE KOLREZERV_ITOG NUMERIC(15,4);
DECLARE VARIABLE KOLBREZERV_ITOG INTEGER;
DECLARE VARIABLE KOLBUXT_ITOG INTEGER;
DECLARE VARIABLE ID_TYPE_ITOG INTEGER;
DECLARE VARIABLE ID_TARA_ITOG INTEGER;
DECLARE VARIABLE ID_TOVAR INTEGER;
DECLARE VARIABLE ID_SKLAD INTEGER;
begin
  execute procedure sklostdet_ost_pc(:id_ostt,null,1) returning_values
    (:id_tara_itog,
     :kolotp_itog,
     :KOLBUXT_ITOG,
     :KOLREZERV_ITOG,
     :KOLBREZERV_ITOG,
     :DET_COUNT,
     :ID_TYPE_ITOG);
     
  /*для пересчёта колва позиции */
    select
      st.id_ost,st.id_izg,st.dat_otgr,st.id_tovar,st.id_sklad
    from
      sklostt st
    where
      st.id_ostt=:id_ostt
    into
      :id_ost,:id_izg,:dat_otgr,:id_tovar,:id_sklad;
  /*если неизвестен поставщик, то проставить id_izg*/
  if (:id_izg =0) then begin
    select om.id_izg
    from naklo om inner join naklot ot
      on om.id_nakl=ot.id_nakl
      inner join naklodet od
      on od.id_nakld=ot.id_nakld
      inner join sklostdet sd on
      sd.id_det=od.id_det
    where sd.id_ostt=:id_ostt and
      od.tip=1 and
      (sd.id_type =11 or sd.id_type=12) and
      om.id_izg is not null
    group by om.id_izg,sd.id_type
    order by sd.id_type
    into :id_izg;
  end

  /*проставляем дату отгрузки кабеля со склада*/
  if (:id_type_itog<>3) then begin
     /*кабель ещё не отгружен со склада*/
     if (:dat_otgr is not null) then begin
       /*не должно быть даты отгрузки*/
       update sklostt st
       set st.dat_otgr = null
       where st.id_ostt=:id_ostt;
     end
  end else begin /*:id_type_itog<>3*/
     /*кабель отгружен со склада*/
     if (:dat_otgr is null) then begin
       /*нужно проставить дату отгрузки*/
       select max(om.dat)
       from naklo om inner join naklot ot on ot.id_nakl=om.id_nakl
         inner join naklodet od on od.id_nakld=ot.id_nakld
         inner join sklostdet sd on sd.id_det=od.id_det
       where
         sd.id_type in (31,32) and sd.id_ostt=:id_ostt
       into :dat_otgr;

       update sklostt st
       set st.dat_otgr =:dat_otgr
       where st.id_ostt=:id_ostt;
     end

  end /*:id_type_itog<>3*/

  if (det_count>0) then begin
   /*запись новых количеств на барабан*/
   update sklostt s
   set
    s.id_tara = :id_tara_itog,
    s.kolotp=Round(z(:kolotp_itog),3),
    s.kolrezerv =Round(z(:kolrezerv_itog),3),
    s.kolbrezerv=z(:kolbrezerv_itog),
    s.kolbuxt=z(:kolbuxt_itog),
    s.id_type=z(:id_type_itog),
    s.id_izg=:id_izg
   where
    s.id_ostt=:id_ostt;
  end
  else begin
    /* не было записей в журнале -> позиция пустая*/
    delete from sklostt st
    where
      st.id_ostt=:id_ostt;
  end
  /* пересчёт колва позиции */
  execute procedure sklostt_recalc2_pc(:id_tovar,:id_sklad,:id_tara_itog);
END^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SKLOSTT_TIME_TEST_PC(
    ID_TOVAR_IN INTEGER,
    ID_SKLAD_IN INTEGER,
    TODAY TIMESTAMP)
RETURNS (
    ID_OSTT INTEGER,
    ID_TARA INTEGER,
    KOLOTP NUMERIC(15,4),
    KOLBUXT INTEGER,
    KOLREZERV NUMERIC(15,4),
    KOLBREZERV INTEGER,
    DET_COUNT INTEGER,
    ID_TYPE INTEGER,
    ID_IZG INTEGER,
    NOMER_TARY VARCHAR(30),
    COMMENT VARCHAR(50),
    ID_TOVAR INTEGER,
    ID_SKLAD INTEGER,
    DAT_POST TIMESTAMP,
    KOLOTP_ISX NUMERIC(15,4))
AS
begin
  /* Procedure Text */
  for
    select st.id_ostt
    from sklostt st
    where st.id_tovar=:id_tovar_in and
      st.id_sklad = :id_sklad_in and
      (st.dat_otgr is null or st.dat_otgr>=:today)
    union all
    select st.id_ostt
    from sklostt st
    where st.id_tara=:id_tovar_in and
      st.id_sklad = :id_sklad_in and
      (st.dat_otgr is null or st.dat_otgr>=:today)    
   into :id_ostt
  do begin
    select st.id_izg,st.nomer_tary,st.comment
      from sklostt st
      where st.id_ostt=:id_ostt
      into :id_izg,:nomer_tary,:comment;
    select first 1 om.dat, od.kolotp*od.kolbuxt
      from naklo om inner join naklot ot on ot.id_nakl=om.id_nakl
        inner join naklodet od on od.id_nakld=ot.id_nakld
        inner join sklostdet sd on sd.id_det=od.id_det
      where sd.id_ostt=:id_ostt and om.tip in (1,2,6,103) and sd.id_type in (11,12)
      order by om.dat asc
      into :dat_post, :kolotp_isx;
    id_tovar = :id_tovar_in;
    id_sklad = :id_sklad_in;
    execute procedure sklostdet_ost_pc(:id_ostt,:today,2) returning_values
      (:id_tara,
       :kolotp,
       :KOLBUXT,
       :KOLREZERV,
       :KOLBREZERV,
       :DET_COUNT,
       :ID_TYPE);
     if ((det_count>0) and (id_type<>3)) then begin
       if (not(:id_type=5 and :id_tovar_in=:id_tara)) then begin
         suspend;
       end
     end
  end
END^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SKLOSTT_GET_IDOSTT_PC(
    ID_OSTT INTEGER,
    ID_OST INTEGER,
    ID_IZG INTEGER,
    COMMENT VARCHAR(50),
    NOMER_TARY VARCHAR(30),
    ID_TARA integer)
RETURNS (
    ID_OSTT2 INTEGER)
AS
DECLARE VARIABLE ID_TOVAR INTEGER;
DECLARE VARIABLE ID_SKLAD INTEGER;
begin
      /*случай 2-не было позиции на складе*/
      if (
        (id_ostt is null) or
        (not exists(
            select st.id_ostt
            from sklostt st
            where id_ostt=:id_ostt
          )
        )) then
      begin
        id_ostt = gen_id(sklostt_gen,1);
        select sm.id_tovar,sm.id_sklad
          from sklost sm
          where sm.id_ost=:id_ost
          into :id_tovar,:id_sklad;
        /*тип тары =0 */
        insert into sklostt (
          id_ost,
          comment,
          id_ostt,
          id_izg,
          id_tara,
          nomer_tary,
          id_tovar,
          id_sklad)
        values (
          :id_ost,
          :comment, :id_ostt,
          :id_izg,
          :id_tara,
          :nomer_tary,
          :id_tovar,
          :id_sklad );
        /*позиция накладной знает какой позиции на складе
          она принадлежит, только для приходов и излишков*/

      end
  ID_OSTT2 = id_ostt;
END^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE NAKLPDET_POST_PC(
    ID_DET INTEGER)
AS
DECLARE VARIABLE ID_OSTT INTEGER;
DECLARE VARIABLE ID_IZG INTEGER;
DECLARE VARIABLE COMMENT VARCHAR(50);
DECLARE VARIABLE NOMER_TARY VARCHAR(30);
DECLARE VARIABLE ID_TOVAR INTEGER;
DECLARE VARIABLE ID_SKLAD INTEGER;
DECLARE VARIABLE ID_OST INTEGER;
declare variable id_tara integer;
begin
  for
    select
      od.comment,
      od.nomer_tary,
      od.id_ostt,
      od.id_tara,
      ot.id_tovar,
      om.id_sklad,om.id_izg
    from  naklodet od
      inner join naklot ot on ot.id_nakld=od.id_nakld
      inner join naklo om on om.id_nakl=ot.id_nakl
    where
      od.id_det = :id_det
   into
      :comment,
      :nomer_tary,
      :id_ostt,
      :id_tara,
      :id_tovar,:id_sklad,:id_izg
      
  do begin
    /*long if*/
    /* случай 1- нет записи о товаре вообще
       случай 2 -нет записи о барабане id_ostt
       случай 3 -есть запись о барабане, нет записи о проводке
       случай 4 -всё есть - просто пересчёт */
    execute procedure sklost_get_idost_pc(:id_tovar,:id_sklad)
      returning_values :id_ost;
    execute procedure sklostt_get_idostt_pc(:id_ostt,
      :id_ost,:id_izg,:comment,'',:id_tara)
      returning_values :id_ostt;
    update naklodet od
      set od.id_ostt=:id_ostt
      where od.id_det=:id_det and od.tip in (1,5);

    /*случай 3 - позиция на складе уже есть*/
    /*при изменении номера барабана в приходе
      при повторной проводке должен меняться номер
      тары на складе и комментарий*/
    update sklostt st
      set st.nomer_tary=:nomer_tary,
        st.comment=:comment
      where st.id_ostt=:id_ostt;
    execute procedure naklodet_process_pc(:id_det);
    execute procedure sklostdet_recalc_pc(:id_ostt);
  end /* third */
END^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE GENERATE_TARA(
    ID_NAKL INTEGER)
RETURNS (
    ID_TARA INTEGER,
    KOLOTP_OLD DOUBLE PRECISION,
    KOLOTP DOUBLE PRECISION)
AS
  declare variable oidTara integer;
  declare variable max_id_pos integer;
  declare variable id_nakld integer;
  declare variable id_tara2 integer;
  declare variable kolotp2 double precision;
  declare variable id_nakld_2 integer;
  declare variable counter integer;
begin
  select oid from get_oid_objects_pc('ТАРА В ТАБЛИЧНОЙ ЧАСТИ',-100) into :oidTara;
  select max(ot.id_pos)
    from naklot ot
    where ot.id_nakl=:id_nakl
    into :max_id_pos;
  for
    select od.id_tara,count(*)
    from naklot ot
      inner join naklodet od on ot.id_nakld=od.id_nakld
      inner join tovar t on t.oid=od.id_tara
    where ot.id_nakl=:id_nakl
      and t.nothing is null
    group by od.id_tara
      
    union
    
    select ot.id_tovar,cast (ot.kolotp as integer)
    from naklot ot
      left join naklodet od on od.id_nakld=ot.id_nakld
    where
      ot.id_nakl=:id_nakl
      and od.id_nakld is null
      /*Накладные с уже сгенегированными позициями "Бухта" не пересчитывались*/
    into :id_tara2,:kolotp2
  do begin
    id_nakld = null;
    kolotp_old = null;
    kolotp=null;
    select od.id_tara,count(*)
      from naklot ot
        inner join naklodet od on ot.id_nakld=od.id_nakld
        inner join tovar t on t.oid=od.id_tara
      where ot.id_nakl=:id_nakl and od.id_tara=:id_tara2
        and t.nothing is null
      group by od.id_tara
    into :id_tara,:kolotp;
    /*Если тары более чем одна позиция, то все кроме первой удалить*/
    counter=0;
    for
      select ot.id_nakld,ot.kolotp
      from naklot ot
      where ot.id_nakl=:id_nakl and ot.id_tovar=:id_tara2
      into :id_nakld_2,:kolotp_old
    do begin
      counter=counter+1;
      if (counter>=2) then begin
        delete from naklot ot where ot.id_nakld=:id_nakld_2;
      end else begin
        id_nakld=:id_nakld_2;
      end
    end
    if (id_nakld is not null) then begin
      if (z(kolotp)>0) then begin
        update naklot ot
          set ot.kolotp=:kolotp,
            ot.tip=:oidTara
          where ot.id_nakld=:id_nakld and
            Round(:kolotp_old,5)<>Round(:kolotp,5);
        if (Round(kolotp_old,5)<>Round(kolotp,5)) then begin
          suspend;
        end /*Ранее была сделана позиция тары с НЕВЕРНЫМ её количеством*/
      end else begin
        /*Если была вставлена тара, которой нет в накладной*/
        /*Пример id_nakl=134331 был вставлен барабан 10а, т.е. id_tovar=5768*/
        delete from naklot ot where ot.id_nakl=:id_nakl  and ot.id_nakld=:id_nakld;
        id_tara=id_tara2;
        suspend;
      end
    end else begin /*if id_nakld is not null*/
      max_id_pos = z(max_id_pos)+1;
      insert into naklot (id_nakl,id_pos,tip,id_tovar,kolotp)
        values (:id_nakl,:max_id_pos,:oidTara,:id_tara2,:kolotp2);
      suspend; /*ранее не было такой позиции*/
    end /*if id_nakld is not null*/
  end /*for*/
  
  for
    select Round(sum(od.kolotp*od.kolbuxt),3),ot.kolotp,ot.id_nakld,ot.id_tovar
    from naklot ot inner join naklodet od
      on ot.id_nakld=od.id_nakld
    where ot.id_nakl=:id_nakl
    group by ot.id_nakld,ot.kolotp,ot.id_nakld,ot.id_tovar
    having Round(Round(sum(od.kolotp*od.kolbuxt),3)-ot.kolotp,4)<>0
    into :kolotp,:kolotp_old,:id_nakld,:id_tara
  do begin
    update naklot ot
    set ot.kolotp=:kolotp
    where ot.id_nakld=:id_nakld;
    suspend;
  end /*for */
end^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE NAKLP_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
  declare variable schet_name varchar(50);
  DECLARE VARIABLE ID_DET INTEGER;
  DECLARE VARIABLE TIP SMALLINT;
  DECLARE VARIABLE POSTED SMALLINT;
  DECLARE VARIABLE DELMARKED SMALLINT;
  DECLARE VARIABLE ID_TOVAR INTEGER;
  DECLARE VARIABLE ID_NAKLD INTEGER;
  DECLARE VARIABLE ID_SKLAD INTEGER;
  DECLARE VARIABLE ID_uchet_politics INTEGER;
  declare variable str varchar(50);
  declare variable id_pos integer;
  declare variable parent_id_nakl integer;
  declare variable kolotp NUMERIC(15,4);
  declare variable sError varchar(100);
  declare variable sebest double precision;
  declare variable cena double precision;
  declare variable id_schet_tip integer;
  declare variable id_schet_prix integer;
  declare variable dat date;
  declare variable id_currency integer;
  declare variable nalog_nds double precision;
  declare variable parent_id_izg integer;
  declare variable parent_id_zak integer;
  declare variable parent_id_manager integer;
  declare variable tip_prov integer;
  declare variable id_uchet_politics_in integer;
  declare variable id_partiya integer;
  declare variable id_schet_sebest_sklad integer;
  declare variable id_tara integer;
  declare variable kolotp_temp double precision;
  declare variable tip_vozvrat integer;
  declare variable parent_tip integer;
  declare variable has_role integer;
  declare variable naklp_modified integer;
  declare variable parent_id_sklad integer;
  declare variable id_schet_finrez integer;
  declare variable id_statya_dr_tip integer;
  declare variable id_statya_dox integer;
  declare variable id_currency_sebest integer;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_manager integer;
  declare variable id_project integer;
  declare variable sebest_nakl double precision;
  /*$$IBEC$$ declare variable tip_depend integer; $$IBEC$$*/
begin

  /* добавить проверки на безопасность ( шматков может, а
  остальные не могут провести)*/

  select n.posted,n.delmarked,n.id_sklad,n.tip,
      n.parent_id_nakl,
      n.dat,
      n.id_currency,n.nalog_nds,n.id_izg,n.id_zak,n.id_manager
    from naklo n
    where n.id_nakl = :id_nakl
    into :posted,:delmarked,:id_sklad,:tip,
      :parent_id_nakl,
      :dat,:id_currency,:nalog_nds,:id_izg,:id_zak,:id_manager;

  if ((tip<>1) and (tip<>2)) then begin
    execute procedure error ('Нельзя провести не приходную накладную');
  end  
  if (delmarked<>0) then begin
    execute procedure error ('Нельзя провести удалённую накладную');
  end
  if (id_schet =0 ) then begin
    id_schet = null;
  end
  if ((parent_id_nakl is null) and (tip=1) and (dat>'04.10.04')
   and (id_schet is null)) then begin
    execute procedure error ('Нельзя провести без указания приходной бух. накладной');
  end

  if (:tip in(1,2)) then begin

    
   /*приходы, излишки нельзя проводить если предыдущий месяц закрыт, т.е после 7 числа*/
    if ((posted=0) and (id_schet is null)) then begin
    /*приходы, излишки нельзя проводить ВСЕМ если им больше чем naklp_modified дней*/
      select cast(p_value as integer)
        from get_param_pc('naklp_modified')
        into :naklp_modified;
      if (daysbetween(:dat,current_timestamp)>naklp_modified) then begin
        execute procedure error('Запрещено проводить приходы которые были более ' || coalesce(naklp_modified,0) || ' дней назад' );
      end  /*если больше чем naklp_modified (90) дней*/
      if (current_timestamp-firstdaymonth(current_timestamp)<=7) then begin
        /*Вплоть до 7 числа можно проводить предыдущий месяц*/
        if (:dat<firstdaymonth (incdate(current_timestamp,0,-1,0))) then begin
          select has_role from get_roles_pc('SKLAD') into :has_role;
          if (has_role=1) then begin
            sError ='Складу запрещено проведение накладных вплоть до начала предыдущего месяца';
            execute procedure error(sError);
          end
        end
      end else begin
        /*После 7 числа нельзя проводить предыдущий месяц*/
        if (:dat<firstdaymonth(current_timestamp)) then begin
          select has_role from get_roles_pc('SKLAD') into :has_role;
          if (has_role=1) then begin
            sError ='Складу запрещено проведение накладных до начала этого месяца';
            execute procedure error(sError);
          end
        end /*if (:dat<firstdaymonth(current_timestamp))*/
      end/* if (current_timestamp-firstdaymonth(current_timestamp)<=5)  */
    end/*if ((posted=0) and (id_schet is null))*/ 
  end /*if (:tip in(1,2))*/
  
  if ((posted=0) and (id_schet is not null)) then begin
    sError = 'Нельзя частично провести не проведенный документ' || coalesce(:id_schet,999);
    execute procedure error (sError);
  end
  if (id_schet is null) then begin
    /*Генерация тары*/
    for
      select ID_TARA,KOLOTP,KOLOTP_OLD
        from generate_tara(:id_nakl)
       into :id_tara,:kolotp_temp,:kolotp_temp
    do begin
    end
    
    /*чтобы сработал триггер проверяющий разрешения пораньше*/
    update naklo n
      set n.posted=1
      where n.id_nakl=:id_nakl and n.posted=0;
  end  

  
  /*Если заполнено поле parent_id_nakl,
    то копируются цены и затраты, расчитывается
    себестоимость */
  if (parent_id_nakl is not null ) then begin
    execute procedure naklp_prices_naklpbux_pc(:id_nakl);
    select id_currency ,nalog_nds,
        om.id_currency,
        om.nalog_nds
      from naklo om
      where om.id_nakl=:id_nakl
      into :id_currency,:nalog_nds,
        :id_currency,
        :nalog_nds;
    select id_izg,id_zak,id_manager,tip,
        id_sklad
      from naklo om
      where om.id_nakl=:parent_id_nakl
      into :parent_id_izg,:parent_id_zak,:parent_id_manager,:parent_tip,
        :parent_id_sklad;
        
  end /*if (parent_id_nakl is not null )*/
  /*Подготовка к несоблюдению приходов*/
  select oid
    from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
    into :id_schet_tip;
  if (id_schet is not null) then begin
    select name
      from get_name_objects_pc(:id_schet,:id_schet_tip)
      into schet_name;
  end    
  select oid
    from GET_OID_OBJECTS_PC('НЕСОБЛЮДЕНИЕ ПРИХОДОВ',:id_schet_tip)
    into :id_schet_prix;
  select oid
    from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ СКЛАД',:id_schet_tip)
    into :id_schet_sebest_sklad;
  select oid
    from GET_OID_OBJECTS_PC('ФИНАНСОВЫЙ РЕЗУЛЬТАТ',:id_schet_tip)
    into :id_schet_finrez;
  select oid
    from GET_OID_OBJECTS_PC('ТИП СТАТЬИ ДОХОДОВ И РАСХОДОВ',-100)
    into :id_statya_dr_tip;
  select oid
    from GET_OID_OBJECTS_PC('ДОХОД ОТ ИЗЛИШКОВ',:id_statya_dr_tip)
    into :id_statya_dox;
  select oid
    from GET_OID_OBJECTS_PC('ТИП ПРОЕКТЫ',-100)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('ФИРМА',:id_project)
    into :id_project;


  if (tip=1) then begin
    select oid
      from GET_OID_OBJECTS_PC('ПРИХОДНЫЕ СКЛАДСКИЕ НАКЛАДНЫЕ',-100)
      into :tip_prov;
  end else begin
    tip_prov=tip;
  end
  select oid
    from GET_OID_OBJECTS_PC('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('УПРАВЛЕНЧЕСКИЙ УЧЁТ',:id_uchet_politics_in)
    into :id_uchet_politics_in;
  select id_uchet_politics
    from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
    into :id_uchet_politics;
  select oid from get_oid_objects_pc('ВОЗВРАТ',-100) into :tip_vozvrat;
  /*Удаление проводок по документу только по одному счёту. Для перепроведения*/
  if (id_schet is not null) then begin
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.tip=:tip_prov
        and pr.id_schet=:id_schet;
  end
  if ((id_schet is null) or
    (schet_name='НЕСОБЛЮДЕНИЕ ПРИХОДОВ')  )
  then begin
    /*При повторном проведении прихода по складу, если позиция тары
    была удалена, то раньше не удалялась соотв проводка из-за отсутствия
    записи о старой таре. Теперь удаляются все проводки за один раз,
    а новые уже пишутся в цикле по товару
    */
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.id_schet=:id_schet_prix
        and pr.tip=:tip_prov;
  end
    
  for
    select
      t.id_tovar,t.id_nakld,t.id_pos,t.cena,t.kolotp
    from
      naklot t
    where
      t.id_nakl = :id_nakl
    into :id_tovar,:id_nakld,:id_pos,:cena,:kolotp
  do begin
    
    if (tip=1) then begin
    /*специальный тип 555 для приходных накладных,
        т.к. тип 1 забит для остатков в проводках */
       if ((id_schet is null) or
         (schet_name='НЕСОБЛЮДЕНИЕ ПРИХОДОВ')  )
       then begin
           /*При повторном проведении прихода по складу, если позиция тары
          была удалена, то раньше не удалялась соотв проводка из-за отсутствия
          записи о старой таре. Теперь удаляются все проводки за один раз,
          а новые уже пишутся в цикле по товару
          */
          /*delete from provodki pr
            where pr.id_nakl=:id_nakl
              and pr.id_schet=:id_schet_prix
              and pr.tip=:tip_prov
              and pr.sub5=:id_tovar
              and pr.attr1=:id_nakld; */
          insert into provodki (id_schet,dat,tip,
              kredit,kredit_kolotp,id_nakl,
              sub1,sub2,sub3,sub4,
              sub5,sub6,sub7,attr1)
            values(:id_schet_prix,:dat,:tip_prov,
              Round(Round((:cena*:kolotp),2)*(1+:nalog_nds),2),
              :kolotp, :id_nakl,
              :parent_id_izg,:parent_id_zak,:parent_id_manager,:parent_id_nakl,
              :id_tovar,:id_currency,:parent_id_sklad,:id_nakld);
       end  /*Несоблюдение приходов*/

      if ((id_schet is null) or
        (schet_name='СЕБЕСТОИМОСТЬ СКЛАД') ) then begin
        if (:id_uchet_politics is not null) then begin
          /*пересыпать себестоимость по новому*/
          /*Если приход, то надо оприходовать себестоимость на конечный склад*/
          select sebest
            from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,2,2)
            into :sebest;              
          if (parent_id_nakl is not null )  then begin
            if (parent_tip=:tip_vozvrat) then begin
              select sebest,id_partiya
                from naklot_sebest2_vozvr_skl_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad)
                into :sebest,:id_partiya;
            
            end else begin
              select sebest,id_partiya
                from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,1,2)
                into :sebest,:id_partiya;
            end
          end
          if (parent_id_nakl is null )  then begin
           /*если нет родительская накладная*/
            /*Режим 5 создать. Ищем себестоимость в справочнике*/
            select sebest
              from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,5,2)
              into :sebest;
          end /*if parent_id_nakl is null*/          
          /* Здесь был пересчёт зависимых накл, сейчас перенёс ниже*/
        end /*id_uchet*/
      end /*id_schet*/
    end /*tip=1*/

    /*Излишек */
    if (tip=2) then begin
      /*Расчёт себестоимости*/
/*$$IBEC$$       if ((id_schet is null) or
         (schet_name='СЕБЕСТОИМОСТЬ') ) then begin    
        select sebest
          from naklot_sebest_count_pc(:ID_NAKLD,:id_sklad_seb_to,:id_uchet_politics,2,1)
          into :sebest;
        select sebest
          from naklot_sebest_count_pc(:ID_NAKLD,:id_sklad_seb_to,:id_uchet_politics,6,1)
          into :sebest;
      end $$IBEC$$*/
      if ((id_schet is null) or
        (schet_name='СЕБЕСТОИМОСТЬ СКЛАД') ) then begin
        if (:id_uchet_politics is not null) then begin
          /*пересыпать себестоимость по новому*/
          /*Если приход, то надо оприходовать себестоимость на конечный склад*/
          select sebest
            from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,2,2)
            into :sebest;              
          /*Режим 6 создать. Излишки*/
          if (kolotp>0) then begin
            select sebest,id_partiya
              from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,6,2)
              into :sebest,:id_partiya;
          end else begin
            /*Если излишек с отрицательной длиной то он недостача*/
            select sebest,id_partiya
              from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,3,2)
              into :sebest,:id_partiya;
          end
          /* Здесь был пересчёт зависимых накл, сейчас перенёс ниже*/
        end /*id_uchet*/
      end /*id_schet*/      
    end /*if tip=2*/
    /* Пересчёт зависимых накл*/
    /*Чтоб обновление было в одном месте*/
    if ((id_schet is null) or
      (schet_name='СЕБЕСТОИМОСТЬ СКЛАД') ) then begin
      if (:id_uchet_politics is not null) then begin
        /*Пересчитывают после себя только приходы */
        /*Если же необходимо пересчитать излишек,
        то пересчитать родительский приход*/
        if (:tip in (1,2)) then begin
          execute procedure naklp_sebest4_recount_pc(:id_nakld,
            :id_sklad, :id_partiya,:tip,  4);
        end
      end/*if (:id_uchet_politics*/
    end /*if (schet_name='СЕБЕСТОИМОСТЬ СКЛАД')*/ 
    
    /* second loop  */
    if ((id_schet is null)) then begin
      kolotp=null;
      for
        select od.id_det,od.kolotp
        from naklodet od
        where od.id_nakld=:id_nakld
        into :id_det,:kolotp
      do begin
        if ((Round(kolotp*1000,0)-Round(kolotp*1000,3))<>0) then begin
          update naklodet od
          set od.kolotp=Round(od.kolotp,3)
          where od.id_det=:id_det;
        end
        if (kolotp<0) then begin
          str='Ошибка в позиции №' || cast (:id_pos as varchar(3)) ||
            '. Отрицательная длина';
          execute procedure error(str);
        end
        execute procedure naklpdet_post_pc(:id_det);
      end /*for*/
    end /* if id_schet is null */
  end /*for id_nakld*/
      
  if (tip=2) then /*излишек*/
  begin
    if ((id_schet is null) or (schet_name='ФИНАНСОВЫЙ РЕЗУЛЬТАТ') ) then begin
      SELECT u.id_currency_sebest
        FROM spr_uchet_politics_vw u
        WHERE u.oid=:id_uchet_politics AND u.delmarked=0
        INTO :id_currency_sebest;
      select sum(debet)
        from provodki pr
        where pr.id_schet=:id_schet_sebest_sklad and
          pr.tip=:tip and pr.id_nakl=:id_nakl
        into :sebest_nakl;
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(:sebest_nakl,2),:id_nakl,
          :id_project,:id_statya_dox,:id_currency_sebest,:id_izg,:id_zak,:id_manager);
    end /*if id_schet= 'ФИНАНСОВЫЙ РЕЗУЛЬТАТ'*/
  end/*if tip=2*/
/*
добавить запись в таблицу log
*/


   
  /* пересчитать остатки и себестоимость*/
END^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SKLOSTDET_RECALC_PC(
    ID_OSTT INTEGER)
AS
DECLARE VARIABLE ID_OST INTEGER;
DECLARE VARIABLE DAT_OTGR DATE;
DECLARE VARIABLE DET_COUNT SMALLINT;
DECLARE VARIABLE ID_IZG INTEGER;
DECLARE VARIABLE KOLOTP_ITOG NUMERIC(15,4);
DECLARE VARIABLE KOLREZERV_ITOG NUMERIC(15,4);
DECLARE VARIABLE KOLBREZERV_ITOG INTEGER;
DECLARE VARIABLE KOLBUXT_ITOG INTEGER;
DECLARE VARIABLE ID_TYPE_ITOG INTEGER;
DECLARE VARIABLE ID_TARA_ITOG INTEGER;
DECLARE VARIABLE ID_TOVAR INTEGER;
DECLARE VARIABLE ID_SKLAD INTEGER;
begin
  execute procedure sklostdet_ost_pc(:id_ostt,null,1) returning_values
    (:id_tara_itog,
     :kolotp_itog,
     :KOLBUXT_ITOG,
     :KOLREZERV_ITOG,
     :KOLBREZERV_ITOG,
     :DET_COUNT,
     :ID_TYPE_ITOG);
     
  /*для пересчёта колва позиции */
    select
      st.id_ost,st.id_izg,st.dat_otgr,st.id_tovar,st.id_sklad
    from
      sklostt st
    where
      st.id_ostt=:id_ostt
    into
      :id_ost,:id_izg,:dat_otgr,:id_tovar,:id_sklad;
  /*если неизвестен поставщик, то проставить id_izg*/
  if (:id_izg =0) then begin
    select om.id_izg
    from naklo om inner join naklot ot
      on om.id_nakl=ot.id_nakl
      inner join naklodet od
      on od.id_nakld=ot.id_nakld
      inner join sklostdet sd on
      sd.id_det=od.id_det
    where sd.id_ostt=:id_ostt and
      od.tip=1 and
      (sd.id_type =11 or sd.id_type=12) and
      om.id_izg is not null
    group by om.id_izg,sd.id_type
    order by sd.id_type
    into :id_izg;
  end

  /*проставляем дату отгрузки кабеля со склада*/
  if (:id_type_itog<>3) then begin
     /*кабель ещё не отгружен со склада*/
     if (:dat_otgr is not null) then begin
       /*не должно быть даты отгрузки*/
       update sklostt st
       set st.dat_otgr = null
       where st.id_ostt=:id_ostt;
     end
  end else begin /*:id_type_itog<>3*/
     /*кабель отгружен со склада*/
     if (:dat_otgr is null) then begin
       /*нужно проставить дату отгрузки*/
       select max(om.dat)
       from naklo om inner join naklot ot on ot.id_nakl=om.id_nakl
         inner join naklodet od on od.id_nakld=ot.id_nakld
         inner join sklostdet sd on sd.id_det=od.id_det
       where
         sd.id_type in (31,32) and sd.id_ostt=:id_ostt
       into :dat_otgr;

       update sklostt st
       set st.dat_otgr =:dat_otgr
       where st.id_ostt=:id_ostt;
     end

  end /*:id_type_itog<>3*/

  if (det_count>0) then begin
   /*запись новых количеств на барабан*/
   update sklostt s
   set
    s.id_tara = :id_tara_itog,
    s.kolotp=Round(z(:kolotp_itog),3),
    s.kolrezerv =Round(z(:kolrezerv_itog),3),
    s.kolbrezerv=z(:kolbrezerv_itog),
    s.kolbuxt=z(:kolbuxt_itog),
    s.id_type=z(:id_type_itog),
    s.id_izg=:id_izg
   where
    s.id_ostt=:id_ostt;
  end
  else begin
    /* не было записей в журнале -> позиция пустая*/
    delete from sklostt st
    where
      st.id_ostt=:id_ostt;
  end
  /* пересчёт колва позиции */
  execute procedure sklostt_recalc2_pc(:id_tovar,:id_sklad,:id_tara_itog);
END^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE NAKLODET_INSERT_PC(
    WHAT INTEGER,
    ID_NAKLD INTEGER,
    ID_OSTT INTEGER,
    KOLOTP NUMERIC(15,4),
    KOLBUXT INTEGER,
    ID_OSTT_TARA INTEGER)
AS
DECLARE VARIABLE ID_TYPE INTEGER;
DECLARE VARIABLE TIP INTEGER;
DECLARE VARIABLE ID_DET INTEGER;
DECLARE VARIABLE ID_TARA INTEGER;
DECLARE VARIABLE ID_NAKL INTEGER;
DECLARE VARIABLE COMMENT VARCHAR(50);
DECLARE VARIABLE NOMER_TARY VARCHAR(30);
DECLARE VARIABLE KOLOTP_ST NUMERIC(15,4);
DECLARE VARIABLE KOLBUXT_ST INTEGER;
DECLARE VARIABLE POSTED SMALLINT;
declare variable str varchar(100);
begin
  tip = 0;
  select om.posted,om.id_nakl
    from naklo om inner join naklot ot
      on om.id_nakl=ot.id_nakl
    where ot.id_nakld=:id_nakld
    into :posted,:id_nakl;
  if (posted=1) then begin
    execute procedure error ('Нельзя менять кабель в проведённой отгрузке');
  end
  select
    st.comment,
    st.id_tara,
    st.id_type,
    st.kolotp,
    st.kolbuxt,
    st.nomer_tary
  from sklostt st
  where st.id_ostt=:id_ostt
  into
    :comment,
    :id_tara,
    :id_type,
    :kolotp_st,
    :kolbuxt_st,
    :nomer_tary;
  /*целиком*/
  if ((what=1) or (what=7))  then begin
    id_det=gen_id(naklodet_gen,1);
    tip = 2;
    if ((Round(kolotp_st,3)>0) and (kolbuxt_st>0)) then begin
      kolotp = kolotp_st;
      kolbuxt = kolbuxt_st;
    end else begin
      str = 'Нечего откладывать';
      execute procedure error(str);
    end
  end
  /*отрезаем кусок, получается бухта*/
  if (what=2) then begin
    /*если позиция из одной бухты или барабана (по умолч)*/
    if (kolbuxt_st=1) then begin
      if (Round(kolotp,3)>Round(kolotp_st,3)) then begin
        str = 'Невозможно отрезать бухту с длиной более '
          || cast(Round(kolotp_st,3) as varchar(6));
        execute procedure error(str);
      end
      if (Round(kolotp,3)=0) then begin
        str = 'Невозможно отрезать бухту с нулевой длиной';
        execute procedure error(str);
      end
      id_det = gen_id(naklodet_gen,1);
      select first 1 id_tara
      from get_buxtnumber_pc
      into :id_tara;
      tip = 3;
    end
    if (kolbuxt_st>1) then begin
      /*откладываем целую(е) бухту(ы) */
      if ((kolbuxt>0) and (Round(kolotp,3)=Round(kolotp_st,3))) then begin
        if (kolbuxt>kolbuxt_st) then begin
          /*если из интерфейса чудесным образом сказали отрезать больше
          бухт чем есть на складе, то отрезать только все свободные бухты*/
          kolbuxt=kolbuxt_st;
        end
        id_det = gen_id(naklodet_gen,1);
        tip = 3;
      end
      /*режем одну из многих бухт*/
      if ((kolbuxt=1) and (Round(kolotp,3)<>Round(kolotp_st,3))) then begin
        str = 'Невозможно отрезать бухты с длиной не равной '
           || coalesce(kolotp_st,0);
        execute procedure error(str);
      end
    end
    /*Добавил на случай если есть остаток -37 бухт и кто-то пытается
    отложить ещё что-то*/
    if (kolbuxt_st<1) then begin
      str = 'Невозможно отрезать если число бухт = ' || coalesce(kolbuxt_st,0);
      execute procedure error(str);
    end/*kolbuxt_st<1*/
    
/*  kolotp=kolotp
    kolbuxt= kolbuxt     */
  end
  /*намотка на барабан*/
  if ((what=3) or (what=9)) then begin
    id_det = gen_id(naklodet_gen,1);
    tip = 4;
    /*если позиция из одной бухты или барабана (по умолч)*/
    /*намотку с нулевой длинной можно использовать для
    отгрузки пустых барабанов!!!*/
    /*$$IBE$$
    if (kolbuxt_st=1) then begin    
      if (Round(kolotp,3)=0) then begin
        str = 'Невозможно намотать бухту с нулевой длиной';
        execute procedure error(str);
      end
    end  $$IBE$$*/ /*if (kolbuxt_st=1)*/
    if (Round(kolotp,3)>0) then begin
      if (Round(kolotp,3)>Round(kolotp_st,3)) then begin
        str = 'Невозможно намотать бухту с длиной более '
          || cast(Round(kolotp_st,3) as varchar(6));
        execute procedure error(str);
      end
    end
    select st.id_tara,st.nomer_tary
      from sklostt st
      where st.id_ostt=:ID_OSTT_TARA
      into :id_tara,:nomer_tary;
  end
  /*общая часть, вставка записи*/
    insert into naklodet
      (id_det,
       id_nakld,
       id_tara,
       nomer_tary,
       kolotp,
       kolbuxt,
       comment,
       id_ostt,
       tip)
    values
      (:id_det,
       :id_nakld,
       :id_tara,
       :nomer_tary,
       :kolotp,
       :kolbuxt,
       :comment,
       :id_ostt,
       :tip
      );
      
  if ((what=3) or (what=9))  then begin
    execute procedure sklostdet_insert_check_pc
      (:id_det,21,:ID_OSTT_TARA);
    execute procedure sklostdet_recalc_pc(:ID_OSTT_TARA);
  end
  
  /*нужные записи в журнал*/
  execute procedure naklodet_process_pc(:id_det);
  /*пересчёт изменённых позиций*/
  execute procedure sklostdet_recalc_pc(:id_ostt);
  /*Если один из новых режимов то создать барабаны */
  if ((what=7) or  (what=9)) then begin
    execute procedure naklot_maketara_pc(:id_nakl,:ID_DET, 1);
  end
END^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE NAKLOT_MAKETARA_PC(
    ID_NAKL INTEGER,
    ID_DET INTEGER,
    MODE INTEGER)
AS
  declare variable id_tara integer;
  declare variable kolbuxt integer;
  declare variable id_nakld integer;
  declare variable kolotp double precision;
  declare variable max_id_pos integer;
  declare variable cena double precision;
  declare variable id_price integer;
  declare variable dat date;
begin
  select id_tara,od.kolbuxt
    from naklodet od
    where od.id_det=:id_det
    into :id_tara,:kolbuxt;
  select dat from naklo om where om.id_nakl=:id_nakl into :dat;
  if (not (exists (
    select oid
      from tovar t
      where t.oid=:id_tara and t.nothing=1))) then begin
    /*Если эта тара не бухта, или что-либо аналогичное, то*/
    select ot.id_nakld,ot.kolotp
      from naklot ot
      where ot.id_nakl=:id_nakl and ot.id_tovar=:id_tara
      into :id_nakld,:kolotp;
    if (id_nakld is not null) then begin
      /*Такой барабан уже был использован хоть раз в этой
      накладной*/
      if (mode=1) then begin
        /*Увеличиваем число барабанов*/
        update naklot ot
          set ot.kolotp=Round(:kolotp+:kolbuxt,0)
          where ot.id_nakld=:id_nakld;
      end
      if (mode=2) then begin
        /*Уменьшаем число барабанов*/
        if (Round(:kolotp-:kolbuxt,0)>0) then begin
          /*После удаления этого барабана хоть один такой же ещё останется*/
          update naklot ot
            set ot.kolotp=Round(:kolotp-:kolbuxt,0)
            where ot.id_nakld=:id_nakld;
        end else begin
          /*Ни одного такого барабана не осталось. Удаляем пустую запись.*/
          delete from naklot ot
            where ot.id_nakld=:id_nakld;
        end
      end
    end else begin
      if (mode=1) then begin
       /*Добавить новую строчку товара в накладную*/
        select z(max(id_pos))
          from naklot ot
          where ot.id_nakl=:id_nakl
          into :max_id_pos;
        /*select t.cena
          from tovar t
          where t.oid=:id_tara
          into :cena; */
  
        select round(g.cena,2) as cena
        from get_price_default_pc(null,:id_tara,null,:dat,0) g
        into  :cena;
        id_price=1;
        insert into naklot (id_nakl, id_pos,
            id_tovar,cena,kolotp,kodcn,skidka)
          values(:id_nakl, :max_id_pos+1,
            :id_tara,:cena,:kolbuxt,:id_price,0);
      end /*mode=1*/
      /*$$IBEC$$       if (mode=2) then begin
        sError = 'Ошибка в процедуре naklot_tara_pc. Попытка удалить несуществующую тару id_tara=' || z(:id_tara) || 'id_nakl=' || z(:id_nakl);
        execute procedure error(sError);
      end $$IBEC$$*/
    end
  end
end^
SET TERM ; ^

DROP PROCEDURE SKLOSTDET_OST_TEST_PC ;
