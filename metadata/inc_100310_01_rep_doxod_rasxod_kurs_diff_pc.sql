SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_DOXOD_RASXOD_KURS_DIFF_PC(
    DAT_FROM TIMESTAMP,
    DAT_TO TIMESTAMP,
    ID_CURRENCY_TO INTEGER,
    ID_NAKL_IN INTEGER,
    SUB1_IN INTEGER,
    SUB2_IN INTEGER,
    SUB3_IN INTEGER)
RETURNS (
    ID_NAKL INTEGER,
    SUB1 INTEGER,
    SUB2 INTEGER,
    SUB3 INTEGER,
    SUB4 INTEGER,
    SUB5 INTEGER,
    DAT TIMESTAMP,
    KURS DOUBLE PRECISION,
    KURS_TO DOUBLE PRECISION,
    KURS_INDIRECT INTEGER,
    SUM_FROM DOUBLE PRECISION,
    SUM_IN_CURRENCY_BEFORE DOUBLE PRECISION,
    SUM_IN_CURRENCY_NOW DOUBLE PRECISION,
    KURSDIFFINCURRENCY DOUBLE PRECISION)
AS
    declare variable id_currency_previous integer;
    declare variable dat_previous timestamp;
    declare variable id_schet integer;
    declare variable debet double precision;
    declare variable kredit double precision;
begin
   select oid
   from get_oid_objects_pc('‘»Õ¿Õ—Œ¬€… –≈«”À‹“¿“',
     (select oid from get_oid_objects_pc('“»œ —◊≈“¿',-100)))
   into :id_schet;
            

    for
        select pr.id_nakl, pr.debet,pr.kredit, pr.dat,
          pr.sub1, pr.sub2, pr.sub3, pr.sub4, pr.sub5
        from provodki pr
        where pr.id_schet=:id_schet and
            pr.dat between :dat_from and :dat_to
            and (pr.sub1 between coalesce(:sub1_in,-2147483648)
                and coalesce(:sub1_in, 2147483647) or pr.sub1 is null)
            and (pr.sub2 between coalesce(:sub2_in,-2147483648)
                and coalesce(:sub2_in, 2147483647) or pr.sub2 is null)
            and ((pr.sub3 between coalesce(:sub3_in,-2147483648)
                and coalesce(:sub3_in, 2147483647)) or pr.sub3 is null)
            and (pr.id_nakl between coalesce(:id_nakl_in,-2147483648)
                and coalesce(:id_nakl_in, 2147483647))
        order by pr.sub3, pr.dat
        into :id_nakl, :debet,:kredit,:dat, :sub1, :sub2, :sub3, :sub4, :sub5
    do begin
      if ((dat<>dat_previous) or (dat_previous is null) or
        (sub3<>id_currency_previous) or (id_currency_previous is null)) then
      begin
        select k.kurs_indirect, k.kurs
        from kurs_get_direct_pc(:dat,:sub3,:id_currency_to,1) k
        into :kurs_indirect,:kurs;
        
        dat_previous = dat;
        /*¬‡Î˛Ú‡ ı‡ÌËÚÒˇ ‚ sub3*/
        if ((sub3<>id_currency_previous) or (id_currency_previous is null)) then begin
          select k.kurs_indirect, k.kurs
          from kurs_get_direct_pc(:dat_to,:sub3,:id_currency_to,0) k
          into :kurs_indirect,:kurs_to;
          id_currency_previous = sub3;
        end
      end
      sum_from = z(:debet)-z(:kredit);
      SUM_IN_CURRENCY_BEFORE = sum_from * dif(:kurs_indirect-1, :kurs, 1/:kurs);
      SUM_IN_CURRENCY_NOW = sum_from * dif(:kurs_indirect-1, :kurs_to, 1/:kurs_to);
      KURSDIFFINCURRENCY = z(SUM_IN_CURRENCY_NOW) - z(SUM_IN_CURRENCY_BEFORE);
      suspend;
    end
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_DOXOD_RASXOD_KURS_DIFF_PC;

GRANT SELECT ON PROVODKI TO PROCEDURE REP_DOXOD_RASXOD_KURS_DIFF_PC;

GRANT EXECUTE ON PROCEDURE KURS_GET_DIRECT_PC TO PROCEDURE REP_DOXOD_RASXOD_KURS_DIFF_PC;

GRANT EXECUTE ON PROCEDURE REP_DOXOD_RASXOD_KURS_DIFF_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE REP_DOXOD_RASXOD_KURS_DIFF_PC TO POWER_USER;
