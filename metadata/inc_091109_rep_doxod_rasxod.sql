CREATE OR ALTER PROCEDURE REP_DOXOD_RASXOD_PC(
    DAT_FROM TIMESTAMP,
    DAT_TO TIMESTAMP,
    ID_CURRENCY_TO INTEGER,
    SUB1_IN INTEGER,
    SUB2_IN INTEGER,
    SUB3_IN INTEGER,
    SUB4_IN INTEGER)
RETURNS (
    ID_NAKL integer, 
    SUB1 INTEGER,
    SUB2 INTEGER,
    SUB3 INTEGER,
    DAT TIMESTAMP,
    KURS DOUBLE PRECISION,
    KURS_INDIRECT INTEGER,
    DEBET DOUBLE PRECISION,
    KREDIT DOUBLE PRECISION,
    DEBETINCURRENCY DOUBLE PRECISION,
    KREDITINCURRENCY DOUBLE PRECISION)
AS
    declare variable id_currency_previous integer;
    declare variable dat_previous timestamp;
    declare variable kurs_from double precision;
    declare variable kurs_to double precision;
begin

    for
        select pr.id_nakl, pr.debet,pr.kredit, pr.dat, pr.sub1, pr.sub2, pr.sub3
        from provodki pr
        where pr.id_schet=(select oid from get_oid_objects_pc('‘»Õ¿Õ—Œ¬€… –≈«”À‹“¿“',
                (select oid from get_oid_objects_pc('“»œ —◊≈“¿',-100)))
            ) and
            pr.dat between :dat_from and :dat_to
            and (pr.sub1 between coalesce(:sub1_in,-2147483648)
                and coalesce(:sub1_in, 2147483647) or pr.sub1 is null)
            and (pr.sub2 between coalesce(:sub2_in,-2147483648)
                and coalesce(:sub2_in, 2147483647) or pr.sub2 is null)
            and ((pr.sub3 between coalesce(:sub3_in,-2147483648)
                and coalesce(:sub3_in, 2147483647)) or pr.sub3 is null)
            and ((pr.sub4 between coalesce(:sub4_in,-2147483648)
                and coalesce(:sub4_in, 2147483647)) or pr.sub4 is null)
        order by pr.sub3, pr.dat
        into :id_nakl, :debet,:kredit,:dat,:sub1,:sub2,:sub3
    do begin
        /*¬‡Î˛Ú‡ ı‡ÌËÚÒˇ ‚ sub3*/
        if ((sub3<>id_currency_previous) or (id_currency_previous is null)
           or (dat<>dat_previous) or (dat_previous is null)) then
        begin
            select k.kurs_from,k.kurs_to
            from kurs_get_pc(:dat,:sub3,:id_currency_to,1) k
            into :kurs_from,:kurs_to;
                
            id_currency_previous = sub3;
            dat_previous = dat;
            
            if (kurs_from=1 and kurs_to<>1) then begin
                kurs_indirect=1;
                kurs=kurs_to/kurs_from;
            end else begin
                kurs_indirect=0;        
                kurs=kurs_from/kurs_to;
            end            
        end
        DEBETINCURRENCY = :debet * :kurs_from / :kurs_to;
        KREDITINCURRENCY = :kredit * :kurs_from / :kurs_to;
        suspend;
    end
end
