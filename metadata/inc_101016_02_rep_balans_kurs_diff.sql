SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_BALANS_KURS_DIFF_PC(
    DAT_FROM TIMESTAMP,
    DAT_TO TIMESTAMP,
    ID_CURRENCY_TO INTEGER)
RETURNS (
    OID INTEGER,
    NAME VARCHAR(50),
    FULLNAME VARCHAR(255),
    ID_CURRENCY INTEGER,
    SUM_FROM DOUBLE PRECISION,
    KURS_INDIRECT INTEGER,
    KURS_DAT_FROM DOUBLE PRECISION,
    KURS_DAT_TO DOUBLE PRECISION,
    SUM_DAT_FROM DOUBLE PRECISION,
    SUM_DAT_TO DOUBLE PRECISION,
    KURS_DIFF DOUBLE PRECISION)
AS
  declare variable id_schet integer;
  declare variable sub_currency integer;
  declare variable id_currency_schet integer;
  declare variable is_minus integer;
begin
  /*Чтобы при dat_from=01.11.08 курс брался на 30.10.08,
  т.е. на дату предыдущего баланса*/
  dat_from=incdate(:dat_from,-1,0,0);
  for
    select b.oid, b.name, b.fullname, b.id_schet, b.sub_currency, b.id_currency, b.is_minus
    from balans_vw b
    where b.delmarked = 0
    into :oid, :name, :fullname, :id_schet, :sub_currency, :id_currency_schet, :is_minus
  do begin
    kurs_diff=0;
    sum_dat_to=0;
    sum_dat_from=0;

    /*Моновалютный счёт*/
    if ((sub_currency is null) and (id_currency_schet is not null)) then begin
      id_currency=id_currency_schet;
      select
        sum(r.DEBETAFTER)-sum(r.KREDITAFTER)
      from rep_ostatki_pc(:id_schet,:dat_to,
        null,null,null,null,null,null,null,null,null,null) r
      into :sum_from;
      execute procedure rep_balans_kurs_diff_row_pc(:id_currency,
        :id_currency_to, :sum_from, :dat_from)
        returning_values :kurs_indirect,:kurs_dat_from,:sum_dat_from;
      execute procedure rep_balans_kurs_diff_row_pc(:id_currency,
        :id_currency_to, :sum_from, :dat_to)
        returning_values :kurs_indirect,:kurs_dat_to,:sum_dat_to;
    end

    if (sub_currency=2) then begin
      for
        select
          sub2,sum(r.DEBETAFTER)-sum(r.KREDITAFTER)
        from rep_ostatki_pc(:id_schet,:dat_to,
          null,null,null,null,null,null,null,null,null,null) r
        group by sub2
        having  Round(sum(r.DEBETAFTER)-sum(r.KREDITAFTER),2)<>0
        into :id_currency,:sum_from
      do begin
        execute procedure rep_balans_kurs_diff_row_pc(:id_currency,
          :id_currency_to, :sum_from, :dat_from)
          returning_values :kurs_indirect,:kurs_dat_from,:sum_dat_from;
        execute procedure rep_balans_kurs_diff_row_pc(:id_currency,
          :id_currency_to, :sum_from, :dat_to)
          returning_values :kurs_indirect,:kurs_dat_to,:sum_dat_to;
      end /*for*/
    end /*if (sub_currency=2)*/

    if (sub_currency=3) then begin
      for
        select
          sub3,sum(r.DEBETAFTER)-sum(r.KREDITAFTER)
        from rep_ostatki_pc(:id_schet,:dat_to,
          null,null,null,null,null,null,null,null,null,null) r
        group by sub3
        having  Round(sum(r.DEBETAFTER)-sum(r.KREDITAFTER),2)<>0
        into :id_currency,:sum_from
      do begin
        execute procedure rep_balans_kurs_diff_row_pc(:id_currency,
          :id_currency_to, :sum_from, :dat_from)
          returning_values :kurs_indirect,:kurs_dat_from,:sum_dat_from;
        execute procedure rep_balans_kurs_diff_row_pc(:id_currency,
          :id_currency_to, :sum_from, :dat_to)
          returning_values :kurs_indirect,:kurs_dat_to,:sum_dat_to;
      end /*for*/
    end /*if (sub_currency=3)*/

    if (sub_currency=5) then begin
      for
        select
          sub5,sum(r.DEBETAFTER)-sum(r.KREDITAFTER)
        from rep_ostatki_pc(:id_schet,:dat_to,
          null,null,null,null,null,null,null,null,null,null) r
        group by sub5
        having  Round(sum(r.DEBETAFTER)-sum(r.KREDITAFTER),2)<>0
        into :id_currency,:sum_from
      do begin
        execute procedure rep_balans_kurs_diff_row_pc(:id_currency,
          :id_currency_to, :sum_from, :dat_from)
          returning_values :kurs_indirect,:kurs_dat_from,:sum_dat_from;
        execute procedure rep_balans_kurs_diff_row_pc(:id_currency,
          :id_currency_to, :sum_from, :dat_to)
          returning_values :kurs_indirect,:kurs_dat_to,:sum_dat_to;
      end /*for*/
    end /*if (sub_currency=5)*/

    if (sub_currency=6) then begin
      for
        select
          sub6,sum(r.DEBETAFTER)-sum(r.KREDITAFTER)
        from rep_ostatki_pc(:id_schet,:dat_to,
          null,null,null,null,null,null,null,null,null,null) r
        group by sub6
        having  Round(sum(r.DEBETAFTER)-sum(r.KREDITAFTER),2)<>0
        into :id_currency,:sum_from
      do begin
        execute procedure rep_balans_kurs_diff_row_pc(:id_currency,
          :id_currency_to, :sum_from, :dat_from)
          returning_values :kurs_indirect,:kurs_dat_from,:sum_dat_from;
        execute procedure rep_balans_kurs_diff_row_pc(:id_currency,
          :id_currency_to, :sum_from, :dat_to)
          returning_values :kurs_indirect,:kurs_dat_to,:sum_dat_to;
      end /*for*/
    end /*if (sub_currency=6)*/

    /*common part*/
    if (is_minus=1) then begin
      kurs_diff=sum_dat_from-sum_dat_to;
    end else begin
      kurs_diff=sum_dat_to-sum_dat_from;
    end /*if (is_minus=1)*/
    suspend;

  end  /*for*/

end^

SET TERM ; ^

GRANT SELECT ON BALANS_VW TO PROCEDURE REP_BALANS_KURS_DIFF_PC;

GRANT EXECUTE ON PROCEDURE REP_OSTATKI_PC TO PROCEDURE REP_BALANS_KURS_DIFF_PC;

GRANT EXECUTE ON PROCEDURE REP_BALANS_KURS_DIFF_ROW_PC TO PROCEDURE REP_BALANS_KURS_DIFF_PC;

GRANT EXECUTE ON PROCEDURE REP_BALANS_KURS_DIFF_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE REP_BALANS_KURS_DIFF_PC TO BOSSES;
GRANT EXECUTE ON PROCEDURE REP_BALANS_KURS_DIFF_PC TO POWER_USER;

