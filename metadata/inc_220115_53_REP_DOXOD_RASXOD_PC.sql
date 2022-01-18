SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_DOXOD_RASXOD_PC (
    dat_from timestamp,
    dat_to timestamp,
    id_currency_to integer,
    id_nakl_in integer,
    sub1_in integer,
    sub2_in integer,
    sub3_in bigint)
returns (
    id_nakl integer,
    sub1 integer,
    sub2 integer,
    sub3 bigint,
    dat timestamp,
    kurs double precision,
    kurs_indirect integer,
    debet double precision,
    kredit double precision,
    sumincurrency double precision)
as
declare variable id_currency_previous integer;
declare variable dat_previous timestamp;
declare variable kurs_from double precision;
declare variable kurs_to double precision;
begin
  
    for
        select pr.id_nakl, pr.debet,pr.kredit, pr.dat, pr.sub1, pr.sub2, pr.sub3
        from provodki pr
        where pr.id_schet=(select oid from get_oid_objects_pc('ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ',
                (select oid from get_oid_objects_pc('ÒÈÏ Ñ×ÅÒÀ',-100)))
            ) and
            pr.dat between :dat_from and :dat_to
            and (pr.sub1 between coalesce(:sub1_in,-2147483648)
                and coalesce(:sub1_in, 2147483647) or pr.sub1 is null)
            and (pr.sub2 between coalesce(:sub2_in,-2147483648)
                and coalesce(:sub2_in, 2147483647) or pr.sub2 is null)
            and ((pr.sub3 between coalesce(:sub3_in,-9,223,372,036,854,775,808)
                and coalesce(:sub3_in, 9,223,372,036,854,775,807)) or pr.sub3 is null)
            and ((pr.id_nakl between coalesce(:id_nakl_in,-2147483648)
                and coalesce(:id_nakl_in, 2147483647)) )
        order by pr.sub3, pr.dat
        into :id_nakl, :debet,:kredit,:dat,:sub1,:sub2,:sub3
    do begin
        /*Âàëşòà õğàíèòñÿ â sub3*/
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
        SUMINCURRENCY = (z(:debet) - z(:kredit)) * :kurs_from / :kurs_to;
        suspend;
    end
end
^

SET TERM ; ^


