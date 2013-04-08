SET TERM ^ ;

CREATE OR ALTER PROCEDURE SKLOSTDET_OST_PC(
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
      if (baraban_p<>1) then begin
        /*
        28/12/09
        id_ostt = 80526, ТППэпЗ 30*2*0,5 , Укк склад. Был приход, излишек.
        Излишек содержит в поле тара = бухта и затирает что на самом деле
        там барабан от прихода, поэтому если был барабан уже, то тару не затираем
        */
        id_tara_itog = id_tara;
      end
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

DESCRIBE PROCEDURE SKLOSTDET_OST_PC
'считает и возвращает остаток на
нужное время modified на позицию по складу
id_ostt

    ID_TARA_ITOG INTEGER, - тип тары в sklostt.id_tara
    KOLOTP_ITOG NUMERIC(15,4) - длина провода свободного,
    KOLBUXT_ITOG NUMERIC(15,4) - колво бухт свободного,
    KOLREZERV_ITOG NUMERIC(15,4) - колво зарезрв,
    KOLBREZERV_ITOG NUMERIC(15,4) - бухт зарезв,
    DET_COUNT INTEGER - кол-во записей в журнале,
если-0, то пустая позиция (не было даже такого прихода)
подлежит удалению';

GRANT EXECUTE ON PROCEDURE GET_BUXTNUMBER_PC TO PROCEDURE SKLOSTDET_OST_PC;

GRANT EXECUTE ON PROCEDURE SKLOSTDET_OST_PART_PC TO PROCEDURE SKLOSTDET_OST_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE SKLOSTDET_OST_PC;

GRANT EXECUTE ON PROCEDURE SKLOSTDET_OST_PC TO PROCEDURE REP_ACT_PC;
GRANT EXECUTE ON PROCEDURE SKLOSTDET_OST_PC TO PROCEDURE REP_AFTER_CUT_OSTATOK_PC;
GRANT EXECUTE ON PROCEDURE SKLOSTDET_OST_PC TO PROCEDURE REP_NAKLO_PC;
GRANT EXECUTE ON PROCEDURE SKLOSTDET_OST_PC TO PROCEDURE REP_OTPRAVKI_PC;
GRANT EXECUTE ON PROCEDURE SKLOSTDET_OST_PC TO PROCEDURE SKLOSTDET_RECALC_PC;
GRANT EXECUTE ON PROCEDURE SKLOSTDET_OST_PC TO PROCEDURE SKLOSTT_TIME_PC;
GRANT EXECUTE ON PROCEDURE SKLOSTDET_OST_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE SKLOSTDET_OST_PC TO BOSSES;
GRANT EXECUTE ON PROCEDURE SKLOSTDET_OST_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE SKLOSTDET_OST_PC TO MANAGER;
GRANT EXECUTE ON PROCEDURE SKLOSTDET_OST_PC TO POWER_USER;
GRANT EXECUTE ON PROCEDURE SKLOSTDET_OST_PC TO SKLAD;

