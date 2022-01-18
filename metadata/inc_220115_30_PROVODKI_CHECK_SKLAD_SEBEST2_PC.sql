SET TERM ^ ;

CREATE OR ALTER PROCEDURE PROVODKI_CHECK_SKLAD_SEBEST2_PC (
    id_tovar_in integer,
    id_sklad_in integer,
    dat_from timestamp,
    dat_to timestamp,
    mode integer)
returns (
    id_nakl integer,
    id_nakld integer,
    tip integer,
    dat timestamp,
    id_sklad integer,
    id_tovar integer,
    id_partiya bigint,
    debetafter double precision,
    kreditafter double precision,
    kolotp_after double precision)
as
declare variable id_schet_tip integer;
declare variable id_schet_sebest_sklad integer;
declare variable tree_oid_sklad integer;
declare variable id_sklad_in2 integer;
declare variable id_uchet_politics_in integer;
declare variable id_sklad_seb integer;
declare variable id_uchet_politics integer;
declare variable sebest double precision;
declare variable id_partiya_new bigint;
begin
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ Ñ×ÅÒÀ',-100)
    into :id_schet_tip;
  select oid
    from GET_OID_OBJECTS_PC('ÑÅÁÅÑÒÎÈÌÎÑÒÜ ÑÊËÀÄ',:id_schet_tip)
    into :id_schet_sebest_sklad;
  select oid
    from get_oid_objects_pc('ÒÈÏ ÍÀÇÂÀÍÈß ÑÊËÀÄÎÂ',-100)
    into :tree_oid_sklad;
  select oid
    from GET_OID_OBJECTS_PC('ÏÎËÈÒÈÊÈ ÑÏÈÑÀÍÈß ÑÅÁÅÑÒÎÈÌÎÑÒÈ',-100)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('ÓÏĞÀÂËÅÍ×ÅÑÊÈÉ Ó×¨Ò',:id_uchet_politics_in)
    into :id_uchet_politics_in;
  for
    select c.oid
    from get_object_children2_pc
      (:id_sklad_in,:tree_oid_sklad) c
    into :id_sklad_in2
  do begin
       for
        select
          r.sub1,r.sub2,r.sub3
        from rep_oborotka2_pc(:id_schet_sebest_sklad,
        :dat_from,:dat_to,
        :id_tovar_in,:id_sklad_in2,null,null,null,
        null,null,null,null,null) r
        where r.kolotp_after<0.001 and ((r.debetafter<>0) or (r.kreditafter<>0))
        into :id_tovar,:id_sklad,:id_partiya
       do begin
          for
            select first 1
              d.id_nakl,d.id_nakld,d.dat,d.tip
            from rep_sebest4_sklad_det_pc(
              1,:id_sklad,:id_tovar,null,null, :id_partiya,null) d
            where d.tip in (5,30,2,103) and d.kolotp<0
            order by d.dat desc
            into :id_nakl,:id_nakld,:dat,:tip
          DO BEGIN
            if (mode=2) then begin
              select id_sklad,id_uchet_politics
                from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
                into :id_sklad_seb,:id_uchet_politics;
              delete from provodki pr
                where pr.attr1=:id_nakld
                  and pr.id_nakl=:id_nakl
                  and pr.sub1=:id_tovar
                  and pr.sub2=:id_sklad_seb
                  and pr.id_schet=:id_schet_sebest_sklad;
              select sebest,id_partiya
                from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,3,2)
                into :sebest,:id_partiya_new;
            end /*if (mode=2) */
            if (mode=3) then begin
              execute procedure naklp_sebest4_part_recount_pc(null,:id_tovar,:id_sklad,:id_partiya);
            end
            suspend;
          END /*for rep_sebest4_sklad_det_pc*/
       end

    /*Ïğè íóëåâîì êîëè÷åñòâåííîì îñòàòêå åñòü ñóììà îñòàòêà*/
    for
      select
        r.sub1,r.sub2,r.sub3,r.debetafter,r.kreditafter,r.kolotp_after
      from rep_oborotka2_pc(:id_schet_sebest_sklad,
      :dat_from,:dat_to,
      :id_tovar_in,:id_sklad_in2,null,null,null,
      null,null,null,null,null) r
      where r.kolotp_after<0.001 and ((r.debetafter<>0) or (r.kreditafter<>0))
      into :id_tovar,:id_sklad,:id_partiya,:debetafter,:kreditafter,:kolotp_after
    do begin
      if (mode=2) then begin
        for
          select first 1
            d.id_nakl,d.id_nakld,d.dat,d.tip
          from rep_sebest4_sklad_det_pc(
            1,:id_sklad,:id_tovar,null,null, :id_partiya,null) d
          where d.tip in (5,30,2,103) and d.kolotp<0
          order by d.dat desc
          into :id_nakl,:id_nakld,:dat,:tip
        DO BEGIN
          select id_sklad,id_uchet_politics
            from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
            into :id_sklad_seb,:id_uchet_politics;
          delete from provodki pr
            where pr.attr1=:id_nakld
              and pr.id_nakl=:id_nakl
              and pr.sub1=:id_tovar
              and pr.sub2=:id_sklad_seb
              and pr.id_schet=:id_schet_sebest_sklad;
          select sebest,id_partiya
            from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,3,2)
            into :sebest,:id_partiya_new;
        END /*for rep_sebest4_sklad_det_pc*/
      end /*if (mode=2) */
      suspend;
    end
  end /*for tree sklad*/
end
^

SET TERM ; ^


