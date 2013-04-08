CREATE OR ALTER PROCEDURE SKLAD_SEBEST_MINUS_PC(
    ID_TOVAR_IN INTEGER,
    ID_SKLAD_IN INTEGER,
    DAT_TO_IN TIMESTAMP,
    MODE_IN INTEGER)
RETURNS (
    ID_SKLAD INTEGER,
    ID_TOVAR INTEGER,
    ID_PARTIYA INTEGER,
    ID_NAKL INTEGER,
    ID_NAKLD INTEGER,
    ID_PARTIYA_NEW INTEGER,
    KOLOTP DOUBLE PRECISION,
    DAT TIMESTAMP,
    TIP INTEGER)
AS
  declare variable id_uchet_politics_in integer;
  declare variable id_uchet_politics integer;
  declare variable id_schet_tip integer;
  declare variable id_schet_sebest_sklad integer;
  declare variable id_sklad_seb integer;
  declare variable sebest double precision;
  declare variable kolotp_sum double precision;
  declare variable kolotp_det double precision;
  declare variable id_sklad_outer integer;
  declare variable id_tovar_outer integer;
  declare variable count_partiya_minus integer;
  declare variable flag_terminate_loops integer;
begin
  if (mode_in is null) then begin
    mode_in=0;
  end
  select oid
    from GET_OID_OBJECTS_PC('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('УПРАВЛЕНЧЕСКИЙ УЧЁТ',:id_uchet_politics_in)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
    into :id_schet_tip;      
  select oid
    from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ СКЛАД',:id_schet_tip)
    into :id_schet_sebest_sklad;
  if (mode_in in (0,2,4,5)) then begin
    for
      select  r.id_sklad,r.id_tovar, r.id_partiya,r.kolotp
      from rep_sebest4_sklad_pc(3,:id_sklad_in,:id_tovar_in ,null, :dat_to_in) r
      where Round(r.kolotp,3)<0
      into :id_sklad,:id_tovar,:id_partiya,:kolotp
    do begin
      if (mode_in=0) then begin
        suspend;
      end /*if ((mode=0) or (mode is null) )*/
      if (:mode_in in (2,3)) then begin
          kolotp_sum=0;
          for
            select /*$$IBEC$$ first 1 $$IBEC$$*/
              d.id_nakl,d.id_nakld,d.kolotp,d.dat,d.tip
            from rep_sebest4_sklad_det_pc(
              1,:id_sklad,:id_tovar,null,null, :id_partiya,null) d
            where d.tip in (5,30,2,103) and d.kolotp<0
            order by d.dat desc
            into :id_nakl,:id_nakld,:kolotp_det,:dat,:tip
          DO BEGIN
  
            kolotp_sum=z(:kolotp_sum)+abs(z(:kolotp_det));
            select id_sklad,id_uchet_politics
              from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
              into :id_sklad_seb,:id_uchet_politics;
            if (tip in (5,2,30,103)) then begin
              /*Накладные с пометкой СЕБЕСТ не удаляются этой процедурой,
              поэтому пересчёт партий должен перестать изменять остатки*/
              select sebest
              from naklot_sebest2_count_pc(:id_nakld,
              :id_uchet_politics,:id_schet_sebest_sklad,2,2)
              into :sebest;
              
              if (:mode_in=2) then begin
                select p.id_partiya, p.sebest
                  from naklot_sebest2_post_pc(:id_nakl, :id_nakld, 10) p
                  into :id_partiya_new, :sebest;
              end/*if (:mode_in=2)*/
              if (:mode_in=3) then begin
                select p.id_partiya, p.sebest
                  from naklot_sebest2_post_pc(:id_nakl, :id_nakld, 3) p
                  into :id_partiya_new, :sebest;
              end/*if (:mode_in=3)*/

            end /*if (:id_sklad=102) */
            if (id_partiya_new<>id_partiya) then begin
              suspend;
            end else begin
              id_partiya_new=null;
              suspend;
            end
            
            if (abs(z(:kolotp_sum))>=abs(z(kolotp))) then begin
              break;
            end
            
          END /*for detail*/
      end /*if (mode=2)*/
      if (mode_in in (4)) then begin
          /*Перепроведение минусовых партий*/
        for
          select pr.id_nakl,pr.attr1,pr.sub3
          from provodki pr inner join
            provodki pr2 on pr.sub1=pr2.sub1
            and pr.sub2=pr2.sub2
            and pr.sub3=pr2.sub3
          where pr.id_schet=:id_schet_sebest_sklad
            and pr2.id_schet=:id_schet_sebest_sklad
            and pr.kredit_kolotp>0
            and pr2.debet_kolotp>0
            and pr.dat<pr2.dat
            and pr.sub3=:id_partiya
            and pr2.sub1= :id_tovar
            and pr2.sub2=:id_sklad
            and pr.sub1=:id_tovar
            and pr.sub2=:id_sklad
          order by pr.dat,pr.sub1, pr.sub2, pr.sub3, pr.id_nakl
          into :id_nakl,:id_nakld,:id_partiya
        do begin
          select p.id_partiya, p.sebest
            from naklot_sebest2_post_pc(:id_nakl, :id_nakld, 3) p
            into :id_partiya_new, :sebest;
          if (id_partiya_new<>id_partiya) then begin
            suspend;
          end else begin
            id_partiya_new=null;
            suspend;
          end         
        end /*for */
      end /*if (mode_in in (4))*/

      if (:mode_in=5) then begin
          kolotp_sum=0;
          for
            select /*$$IBEC$$ first 1 $$IBEC$$*/
              d.id_nakl,d.id_nakld,d.kolotp,d.dat,d.tip
            from rep_sebest4_sklad_det_pc(
              1,:id_sklad,:id_tovar,null,null, :id_partiya,null) d
            where d.tip in (5,30,2,103) and d.kolotp<0
            order by d.dat desc
            into :id_nakl,:id_nakld,:kolotp_det,:dat,:tip
          DO BEGIN
            kolotp_sum=z(:kolotp_sum)+abs(z(:kolotp_det));
            select id_sklad,id_uchet_politics
              from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
              into :id_sklad_seb,:id_uchet_politics;
            if (tip in (5,2,30,103) and
              (:id_nakl<>:id_nakld)) --не из накл выравнивания с пометкой "СЕБЕСТ"
            then begin

              /*Накладные с пометкой СЕБЕСТ не удаляются этой процедурой,
              поэтому пересчёт партий должен перестать изменять остатки*/
              select p.id_partiya, p.sebest
                from naklot_sebest2_post_pc(:id_nakl, :id_nakld, 12) p
                into :id_partiya_new, :sebest;
                            

/*$$IBEC$$               select sebest
              from naklot_sebest2_count_pc(:id_nakld,
              :id_uchet_politics,:id_schet_sebest_sklad,2,2)
              into :sebest;
              
              select sebest,id_partiya
              from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,12,2)
              into :sebest,:id_partiya_new;

              if (tip=103) then begin
                SELECT id_sklad_to
                  FROM naklo om
                  WHERE om.id_nakl=:id_nakl
                  INTO :id_sklad_to;

                select sebest,id_partiya
                  from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,4,2)
                  into :sebest,:id_partiya;

                 $$IBEC$$*//*Пересчитывают после себя приходы излишки и хранения*//*$$IBEC$$ 
                execute procedure naklp_sebest4_recount_pc(:id_nakld,
                  :id_sklad_to, :id_partiya,:tip,4);
              end  $$IBEC$$*//*if (tip=103)*/

              if (id_partiya_new<>id_partiya) then begin
                suspend;
              end else begin
                id_partiya_new=null;
                suspend;
              end
              if (abs(z(:kolotp_sum))>=abs(z(kolotp))) then begin
                break;
              end              
            end /*if (:tip in (5,2,30,103) */

          END /*for detail*/
      end /*if (:mode_in=5) */
            
    end  /* for partiya<0 */
  end /*if mode_in(0,2,3,4)*/
  
  if (mode_in in (3)) then begin
    flag_terminate_loops = 0;
    for
      select  r.id_sklad,r.id_tovar
      from rep_sebest4_sklad_pc(3,:id_sklad_in,:id_tovar_in ,null, :dat_to_in) r
      where Round(r.kolotp,3)<0
      group by r.id_sklad,r.id_tovar
      into :id_sklad_outer,:id_tovar_outer
    do begin
      count_partiya_minus = 1; /*emulating repeat until*/
      WHILE (count_partiya_minus>0) do begin
        for
          select  r.id_sklad,r.id_tovar, r.id_partiya,r.kolotp
          from rep_sebest4_sklad_pc(3,:id_sklad_outer,:id_tovar_outer ,null, :dat_to_in) r
          where Round(r.kolotp,3)<0
          into :id_sklad,:id_tovar,:id_partiya,:kolotp
        do begin
          kolotp_sum=0;
          for
            select /*$$IBEC$$ first 1 $$IBEC$$*/
              d.id_nakl,d.id_nakld,d.kolotp,d.dat,d.tip
            from rep_sebest4_sklad_det_pc(
              1,:id_sklad,:id_tovar,null,null, :id_partiya,null) d
            where d.tip in (5,30,2,103) and d.kolotp<0
            order by d.dat desc
            into :id_nakl,:id_nakld,:kolotp_det,:dat,:tip
          DO BEGIN
            kolotp_sum=z(:kolotp_sum)+abs(z(:kolotp_det));
            select id_sklad,id_uchet_politics
              from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
              into :id_sklad_seb,:id_uchet_politics;
            if (tip in (5,2,30,103)) then begin

              select p.id_partiya, p.sebest
                from naklot_sebest2_post_pc(:id_nakl, :id_nakld, 3) p
                into :id_partiya_new, :sebest;

            end /*if (:id_sklad=102) */
            if (id_partiya_new<>id_partiya) then begin
              suspend;
            end else begin
              id_partiya_new=null;
              flag_terminate_loops=1;
              suspend;
            end
            if (abs(z(:kolotp_sum))>=abs(z(kolotp))) then begin
              leave;
            end
          END /*for detail*/
        end /*for partiya*/
        select z(count(*))
          from rep_sebest4_sklad_pc(3,:id_sklad_outer,:id_tovar_outer ,null, :dat_to_in) r
          where Round(r.kolotp,3)<0
          into :count_partiya_minus;
        if (flag_terminate_loops =1) then begin
          /*Не нашли куда перелить минусовой остаток ОДНОЙ партии, значит в будущем партий с
          плюсовым остатком нет. Заканчиваем цикл*/
          count_partiya_minus = 0;
        end
      end
    end /* for outer */
  end /*if (mode=3)*/
end
