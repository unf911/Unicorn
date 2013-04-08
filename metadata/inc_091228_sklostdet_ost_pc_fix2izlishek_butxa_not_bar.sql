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
  /* ������� ���������� ������� � �������*/
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
  mnogo_buxt_p=0; /* =1 -> ������ ����� ����*/
  for
    select kolotp,kolbuxt,id_type,id_tara
    from SKLOSTDET_OST_PART_PC(:id_ostt,:modified,:tip_ost)
    into
      :kolotp,:kolbuxt,:id_type,:id_tara
  do begin
    /*����������� ������� ������� � �������*/
    det_count = det_count + 1;
  
    if (:id_type=11) then begin
      /*������ ��������*/
      baraban_p=1;
      id_tara_itog = id_tara;
    end

    if (:id_type=12) then begin
      /*������ ������*/
      kolotp1=z(:kolotp1)+z(:kolotp);
      if (kolbuxt>1) then begin
         kolbuxt1=z(:kolbuxt1)+z(:kolbuxt);
        if (baraban_p=0) then begin
          mnogo_buxt_p=1;
        end else begin
          str = '�� ������� �� ����� ���� �������� ��������� ����';
          execute procedure error (str);
        end  /*��� ��������*/
      end else begin  /*kolbuxt>1*/
        if (kolbuxt1>1) then begin
          str = '���� ����>1, �� ���������� ������� ���������';
          execute procedure error (str);
        end
        kolbuxt1=1;
      end /* kolbuxt>1 */
      if (baraban_p<>1) then begin
        /*
        28/12/09
        id_ostt = 80526, ������ 30*2*0,5 , ��� �����. ��� ������, �������.
        ������� �������� � ���� ���� = ����� � �������� ��� �� ����� ����
        ��� ������� �� �������, ������� ���� ��� ������� ���, �� ���� �� ��������
        */
        id_tara_itog = id_tara;
      end
    end /*id_type=12*/

    if (:id_type=21) then begin
      /* ������ �������� */
      baraban_r = 2;
    end  /*id_type=21*/

    if (:id_type=22) then begin
      /* ������ ������*/
      if (mnogo_buxt_p=1) then begin
        if  (Round(kolotp,3)<>Round(kolotp1,3)) then begin
           str = '���������� �������� ����� � ������ �� ������ '
             || cast(Round(kolotp1,3) as varchar(6)) ;
           execute procedure error(str);
        end else begin /*�������� ����� ����*/
           kolotp2=z(:kolotp);
           kolbuxt2=z(:kolbuxt2)+z(:kolbuxt);
        end /*�������� ����� ����*/
      end  else begin /*mnogo buxt*/
        if (kolbuxt>1) then begin
          /*� �������� �������� ��������� ����. � �������� ��� ������������
            ��� ���� ����� � ������ =����� ��� ����� * ���-�� ���� */
          kolbuxt2=1;
          kolotp2=z(:kolotp2)+Round(z(:kolbuxt)*z(kolotp),2);
        end else begin /*kolbuxt>1*/
          /*c �������� �������� ���� ����� - ��������*/
          kolbuxt2=z(:kolbuxt);
          kolotp2=z(:kolotp2)+z(kolotp);
        end
      end /*mnogo buxt*/
    end /*id_type=22*/

    if (:id_type=31) then begin
      /* �������� �������� */
      baraban_r = 3;
    end /*id_type=31*/

    if (:id_type=32) then begin
      /*�������� ������*/
      if (mnogo_buxt_p=1) then begin
        if  (Round(kolotp,2)<>Round(kolotp1,2)) then begin
           str = '���������� ��������� ����� � ������ �� ������ '
             || cast(Round(kolotp1,3) as varchar(6));
           execute procedure error(str);
        end else begin /*�������� ����� ����*/
           kolotp3=z(:kolotp);
           kolbuxt3=z(:kolbuxt3)+z(:kolbuxt);
        end /*�������� ����� ����*/
      end else begin /*mnogo buxt*/
        if (kolbuxt>1) then begin
          /*� �������� �������� ��������� ����. � �������� ��� ������������
            ��� ���� ����� � ������ =����� ��� ����� * ���-�� ���� */
          kolotp3=z(:kolotp3)+Round(z(:kolotp)*z(kolbuxt),2);
          kolbuxt3=1;
        end else begin /*kolbuxt>1*/
          /*c �������� ��������� ���� ����� - ��������*/
          kolbuxt3=z(:kolbuxt);
          kolotp3=z(:kolotp3)+z(kolotp);
        end /*kolbuxt>1*/
      end /*mnogo buxt*/
    end  /*id_type=32*/

  end /* for */

  kolbuxt_itog =z(:kolbuxt1)-z(:kolbuxt2)-z(:kolbuxt3);
  if (mnogo_buxt_p=1) then begin
    /*����� ����*/
    if (kolbuxt_itog=0) then begin
      /*��� ����� �������� ��� �������*/
      kolotp_itog=0;
    end else begin/* kolbuxt_itog=0 */
      kolotp_itog=z(:kolotp1);
    end
  end else begin  /*mnogo_buxt=1*/
    /*������� ��� �����*/
    kolotp_itog =z(:kolotp1)-z(:kolotp2)-z(:kolotp3);
  end  /* mnogo_buxt=1 */
  kolotp_itog=round(kolotp_itog,3);
  kolrezerv_itog = Round(z(:kolotp2),3);
  kolbrezerv_itog=z(:kolbuxt2);

  /*����� ������ �� 1 � ����� ���� 0, �� ������ �� 1*/
  if ((kolbrezerv_itog=0) and Round(kolrezerv_itog,3)>0) then begin
    kolbrezerv_itog = 1;
  end

  /*����� ������ ���������, �� ������ �������,
  ������������� ���� ���� ����� ����*/
  if ((kolbuxt_itog<1) and (mnogo_buxt_p=0)) then begin
    /*���, ������, 14.12.04 ���-2*1.5 ������ �������� ����� ����
    ������, ��� ������� �� ����� ���� �� ����� ���������
    1 ���������� �����. ������ ��� ����� ������
    ���� ���� ���� ����� ��� �������*/
    kolbuxt_itog = 0; /*�� ������ ���� ������*/
    if (round(kolotp_itog,3)>0) then begin
      kolbuxt_itog = 1;
    end
  end
  /*--------------------------------------------*/
  /*��������� ���� ������� - �����, ��������, ������ �������*/
  /*�������� �� �������*/
  empty=0;
  /*��� = ��� ���� �� ��������� */
  id_type_itog=5;

  if ((round(kolotp_itog,3)=0) and
    (round(kolrezerv_itog,3)=0)) then begin
    if (baraban_p=1) then begin
      /*������� �������� ���� � ���� �� ���������*/
      empty=1; /*���� ����������� �����*/
    end else begin
      /*����� ������, �����, ��������� ->������� ���������*/
      id_type_itog=3;
    end
  end
  /*������� ������*/
  if (baraban_p=1) then begin
    if (z(kolotp3)=0) then begin
      id_type_itog=4; /*�����*/
    end
    if (z(kolotp3)>0) then begin
      id_type_itog=6;/*����������*/
    end
  end
  /*����� ������*/
  if (baraban_p=0) then begin
    if ((z(kolotp3)>0) and (id_type_itog<>3)) then begin
      id_type_itog=6;/*����� ���������� �� �� ������*/
    end
  end
  
  if ((baraban_r=0) and (empty=1)) then
  begin
    id_type_itog=1; /*������� ��������*/
    /*04/12/08. ����� ��������, ������� 18. idostt=149409, ������� ��� ��������
    �� ���������� ���� ������������ � �������=0, ����� ����� ��������� ����� ����0
    � �� ������ ������ � ��� �� ������*/
    kolbuxt_itog = 1;
    kolbrezerv_itog=0;
  end
  
  if ((baraban_r=2) and (baraban_p=1) and (empty=1)) then
  begin
    id_type_itog=2; /*������� �������*/
    kolbrezerv_itog=1;
    kolbuxt_itog=0;
  end

  /*������� ������, ����, �������� ->������� ���������*/
  if ((baraban_r=3) and (baraban_p=1) and (empty=1)) then
  begin
    id_type_itog=3; /*������� ���������*/
  end

  if ((baraban_r=3) and (baraban_p=1) and (empty=0)) then
  begin
    /*�������� �����*/
    id_type_itog=5; /*������ ������- ����� ������� ������*/
    /*id_tara_itog = buxt_number;*/
  end
END^

SET TERM ; ^

DESCRIBE PROCEDURE SKLOSTDET_OST_PC
'������� � ���������� ������� ��
������ ����� modified �� ������� �� ������
id_ostt

    ID_TARA_ITOG INTEGER, - ��� ���� � sklostt.id_tara
    KOLOTP_ITOG NUMERIC(15,4) - ����� ������� ����������,
    KOLBUXT_ITOG NUMERIC(15,4) - ����� ���� ����������,
    KOLREZERV_ITOG NUMERIC(15,4) - ����� �������,
    KOLBREZERV_ITOG NUMERIC(15,4) - ���� ������,
    DET_COUNT INTEGER - ���-�� ������� � �������,
����-0, �� ������ ������� (�� ���� ���� ������ �������)
�������� ��������';

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

