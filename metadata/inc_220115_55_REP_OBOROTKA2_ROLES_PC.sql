SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_OBOROTKA2_ROLES_PC (
    id_schet integer,
    dat_from timestamp,
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
    sub10_in integer,
    roles_list varchar(150),
    id_currency_to integer,
    sub_currency integer)
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
    debetbefore double precision,
    kreditbefore double precision,
    debet double precision,
    kredit double precision,
    debetafter double precision,
    kreditafter double precision,
    kolotp_before double precision,
    debet_kolotp double precision,
    kredit_kolotp double precision,
    kolotp_after double precision,
    kurs double precision,
    kurs_indirect integer,
    debetafterincurrency double precision,
    kreditafterincurrency double precision)
as
declare variable role_name varchar(50);
declare variable has_role integer;
declare variable kurs_from double precision;
declare variable kurs_to double precision;
declare variable id_currency_previous integer;
begin
  has_role=0;
  for
    select item 
      from get_list_from_str_pc(:ROLES_LIST)
      into :role_name
  do begin
    select has_role from get_roles_pc(:role_name) into :has_role;
    if (has_role=1) then begin
      break;
    end
  end
  if (has_role=0 and current_user<>'SYSDBA') then begin
    execute procedure error('Выполнение процедуры rep_oborotka2_roles_pc запрещено.');
  end
  /*Если не указана валюта отчёта то пересчёт вести не надо и
   поля DEBETAFTERINCURRENCY и KREDITAFTERINCURRENCY не надо заполнять*/
  if (id_currency_to is not null) then begin
    /*По умолчанию в sub5 храниться номер валюты*/
    if (sub_currency is null) then begin
      sub_currency=5;
    end
  end
  for
    select  SUB1, SUB2, SUB3, SUB4, SUB5, SUB6, SUB7, SUB8,
        SUB9, SUB10,
        DEBETBEFORE, KREDITBEFORE, DEBET, KREDIT,
        DEBETAFTER, KREDITAFTER, KOLOTP_BEFORE,
        DEBET_KOLOTP, KREDIT_KOLOTP, KOLOTP_AFTER
      from rep_oborotka2_pc(:id_schet, :dat_from,:dat_to, :sub1_in,:sub2_in,:sub3_in,:sub4_in,
        :sub5_in,:sub6_in,:sub7_in,:sub8_in,:sub9_in,:sub10_in)
     into :SUB1, :SUB2, :SUB3, :SUB4, :SUB5, :SUB6, :SUB7, :SUB8,
        :SUB9, :SUB10,
        :DEBETBEFORE, :KREDITBEFORE, :DEBET, :KREDIT,
        :DEBETAFTER, :KREDITAFTER, :KOLOTP_BEFORE,
        :DEBET_KOLOTP, :KREDIT_KOLOTP, :KOLOTP_AFTER
  do begin
    if (id_currency_to is not null) then begin
      /*Валюта хранится в sub5*/
      if (sub_currency=5) then  begin
        if ((sub5<>id_currency_previous) or (id_currency_previous is null))  then begin
          select k.kurs_from,k.kurs_to
            from kurs_get_pc(:dat_to,:sub5,:id_currency_to,1) k
            into :kurs_from,:kurs_to;
          id_currency_previous=sub5;
        end
      end
      /*Валюта хранится в sub2*/
      if (sub_currency=2) then  begin
        if ((sub2<>id_currency_previous) or (id_currency_previous is null))  then begin
          select k.kurs_from,k.kurs_to
            from kurs_get_pc(:dat_to,:sub2,:id_currency_to,1) k
            into :kurs_from,:kurs_to;
          id_currency_previous=sub2;
        end
      end
      /*Валюта хранится в sub3*/
      if (sub_currency=3) then  begin
        if ((sub3<>id_currency_previous) or (id_currency_previous is null))  then begin
          select k.kurs_from,k.kurs_to
            from kurs_get_pc(:dat_to,:sub3,:id_currency_to,1) k
            into :kurs_from,:kurs_to;
          id_currency_previous=sub3;
        end
      end
      if (sub_currency=6) then  begin
        if ((sub6<>id_currency_previous) or (id_currency_previous is null))  then begin
          select k.kurs_from,k.kurs_to
            from kurs_get_pc(:dat_to,:sub6,:id_currency_to,1) k
            into :kurs_from,:kurs_to;
          id_currency_previous=sub6;
        end
      end              
      if (kurs_from=1 and kurs_to<>1) then begin
        kurs_indirect=1;
        kurs=kurs_to/kurs_from;
      end else begin
        kurs_indirect=0;        
        kurs=kurs_from/kurs_to;
      end
      if (kurs_indirect=1) then begin
        DEBETAFTERINCURRENCY=DEBETAFTER/kurs;
        KREDITAFTERINCURRENCY= KREDITAFTER/kurs;
      end else begin
        DEBETAFTERINCURRENCY=DEBETAFTER*kurs;
        KREDITAFTERINCURRENCY= KREDITAFTER*kurs;
      end
    end
    suspend;
  end
end
^

SET TERM ; ^


