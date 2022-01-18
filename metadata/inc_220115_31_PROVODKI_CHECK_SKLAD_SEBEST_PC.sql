SET TERM ^ ;

CREATE OR ALTER PROCEDURE PROVODKI_CHECK_SKLAD_SEBEST_PC (
    id_tovar_in integer,
    id_sklad_in integer,
    dat_from timestamp,
    dat_to timestamp,
    mode integer,
    submode integer)
returns (
    id_nakl integer,
    id_nakld integer,
    tip integer,
    dat timestamp,
    id_sklad integer,
    id_sklad_to integer,
    id_tovar integer,
    ot_kolotp double precision,
    pr_kolotp double precision,
    errorcode integer)
as
declare variable id_schet_tip integer;
declare variable id_schet_sebest_sklad integer;
declare variable id_partiya bigint;
declare variable tree_oid_sklad integer;
declare variable id_sklad_in2 integer;
declare variable kolotp_temp double precision;
declare variable id_ostt integer;
declare variable id_uchet_politics integer;
declare variable sebest double precision;
declare variable id_partiya_new bigint;
begin
  select oid
    from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
    into :id_schet_tip;
  select oid
    from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ СКЛАД',:id_schet_tip)
    into :id_schet_sebest_sklad;
  select oid
    from get_oid_objects_pc('ТИП НАЗВАНИЯ СКЛАДОВ',-100)
    into :tree_oid_sklad;
  select oid
    from GET_OID_OBJECTS_PC('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100)
    into :id_uchet_politics;
  select oid
    from GET_OID_OBJECTS_PC('УПРАВЛЕНЧЕСКИЙ УЧЁТ',:id_uchet_politics)
    into :id_uchet_politics;
  if (submode is null) then begin
    submode=1023;
  end

  for
    select c.oid
    from get_object_children2_pc
      (:id_sklad_in,:tree_oid_sklad) c
    into :id_sklad_in2
  do begin
    if (bitand(submode, 1)<>0) then begin
    /*Проверяем на целостность приходы и излишки*/
    
      for
        select ot.id_nakl,ot.id_nakld,om.tip,om.dat,
          om.id_sklad,om.id_sklad_to,
          ot.id_tovar,
              z(sum(ot.kolotp)),
        (  select (z(sum(pr.debet_kolotp))-z(sum(pr.kredit_kolotp)))
          from provodki pr
          where pr.attr1=ot.id_nakld and
            pr.id_schet=:id_schet_sebest_sklad and
            ((pr.debet_kolotp>0) or (pr.kredit_kolotp<0)) and
            pr.sub2=om.id_sklad and
            pr.id_nakl=om.id_nakl and
            pr.sub1=ot.id_tovar and
            pr.tip<>1
        )
          from
            naklo om inner join naklot ot
              on ot.id_nakl=om.id_nakl
        where
          (om.id_sklad between
            coalesce(:id_sklad_in2,-2147483648)
            and coalesce(:id_sklad_in2, 2147483647)
            or om.id_sklad is null)  and
          (ot.id_tovar between
            coalesce(:id_tovar_in,-2147483648)
            and coalesce(:id_tovar_in, 2147483647)) and
          om.tip in (1,2,-110) and
          om.posted=1 and
          om.dat between :dat_from and :dat_to and
          ot.kolotp>0
         /* om.dat>'04.10.04'*/
        group by ot.id_nakl,ot.id_nakld,om.id_sklad,
          om.tip,ot.id_tovar,om.dat,
          om.id_sklad,om.id_sklad_to,om.id_nakl
        having Round(z(sum(ot.kolotp)),3)<>
        (  select Round((z(sum(pr.debet_kolotp))-z(sum(pr.kredit_kolotp))),3)
        
          from provodki pr
          where pr.attr1=ot.id_nakld and
            pr.id_schet=:id_schet_sebest_sklad and
            ((pr.debet_kolotp>0) or (pr.kredit_kolotp<0)) and
            pr.sub2=om.id_sklad and
            pr.id_nakl=om.id_nakl and
            pr.sub1=ot.id_tovar and
            pr.tip<>1
        )
      into :id_nakl,:id_nakld,:tip,:dat,
        :id_sklad,:id_sklad_to,:id_tovar,
        :ot_kolotp,:pr_kolotp
      /* Procedure Text */
      do begin
        errorcode=1;
        if (:mode=2) then begin
          id_partiya=:id_nakld-(floor(:id_nakld/10000)*10000);
          id_partiya=((extractyear(:dat)-2000)*100000000)+(extractmonth(:dat)*1000000)+extractday(:dat)*10000+z(:id_partiya);
          execute procedure naklp_sebest4_recount_pc(:id_nakld,
            :id_sklad,:id_partiya,:tip,6);
        end  
        suspend;
      end /*for Проверяем на целостность приходы и излишки*/
      
    /*Проверяем на целостность излишки с минусовыми количествами*/
    
      for
        select ot.id_nakl,ot.id_nakld,om.tip,om.dat,
          om.id_sklad,om.id_sklad_to,
          ot.id_tovar,
              z(sum(ot.kolotp)),
        (  select z(sum(pr.kredit_kolotp))
          from provodki pr
          where pr.attr1=ot.id_nakld and
            pr.id_schet=:id_schet_sebest_sklad and
            pr.kredit_kolotp>0 and
            pr.sub2=om.id_sklad and
            pr.id_nakl=om.id_nakl and
            pr.tip<>1
        )
          from
            naklo om inner join naklot ot
              on ot.id_nakl=om.id_nakl
        where
          (om.id_sklad between
            coalesce(:id_sklad_in2,-2147483648)
            and coalesce(:id_sklad_in2, 2147483647)
            or om.id_sklad is null)  and
          (ot.id_tovar between
            coalesce(:id_tovar_in,-2147483648)
            and coalesce(:id_tovar_in, 2147483647)) and
          om.tip in (2) and
          om.posted=1 and
          om.dat between :dat_from and :dat_to and
          ot.kolotp<0
         /* om.dat>'04.10.04'*/
        group by ot.id_nakl,ot.id_nakld,om.id_sklad,
          om.tip,ot.id_tovar,om.dat,
          om.id_sklad,om.id_sklad_to,om.id_nakl
        having Round(z(-1*sum(ot.kolotp)),3)<>
        (  select Round(z(sum(pr.kredit_kolotp)),3)
        
          from provodki pr
          where pr.attr1=ot.id_nakld and
            pr.id_schet=:id_schet_sebest_sklad and
            pr.kredit_kolotp>0 and
            pr.sub2=om.id_sklad and
            pr.id_nakl=om.id_nakl and
            pr.tip<>1
        )
      into :id_nakl,:id_nakld,:tip,:dat,
        :id_sklad,:id_sklad_to,:id_tovar,
        :ot_kolotp,:pr_kolotp
      /* Procedure Text */
      do begin
        errorcode=1;
        if (:mode=2) then begin
          id_partiya=:id_nakld-(Round(:id_nakld/10000,0)*10000);
          id_partiya=((extractyear(:dat)-2000)*100000000)+(extractmonth(:dat)*1000000)+extractday(:dat)*10000+z(:id_partiya);
          execute procedure naklp_sebest4_recount_pc(:id_nakld,
            :id_sklad,:id_partiya,:tip,6);
        end  
        suspend;
      end /*for Проверяем на целостность  излишки*/
      

      /*Излишек барабана, который не оприходован на склад*/
      for
        select ot.id_nakl,ot.id_nakld,om.tip,om.dat,
          om.id_sklad,om.id_sklad_to,
          od.id_tara

        from 
          naklodet od
          inner join naklot ot on ot.id_nakld=od.id_nakld
          inner join naklo om on om.id_nakl=ot.id_nakl
          inner join sklostdet sd on sd.id_det=od.id_det
        where 
          (om.id_sklad between
            coalesce(:id_sklad_in2,-2147483648)
            and coalesce(:id_sklad_in2, 2147483647)
            or om.id_sklad is null)  and
          (od.id_tara between
            coalesce(:id_tovar_in,-2147483648)
            and coalesce(:id_tovar_in, 2147483647)) and
          om.tip in (2) and
          om.posted=1 and
          om.dat between :dat_from and :dat_to and

          od.id_tara not in (select id_tara from get_buxtnumber_pc) and
          not exists (select *
            from sklostdet sw
            where sw.id_type=11
            and sw.id_det=od.id_det)

      into :id_nakl,:id_nakld,:tip,:dat,
        :id_sklad,:id_sklad_to,:id_tovar
      /* Procedure Text */
      do begin
        errorcode=1;
        if (:mode=2) then begin
          /* Виснет, и склад старый менять не надо
          id_partiya=:id_nakld-(Round(:id_nakld/10000,0)*10000);
          id_partiya=((extractyear(:dat)-2000)*100000000)+(extractmonth(:dat)*1000000)+extractday(:dat)*10000+z(:id_partiya);
          execute procedure naklp_unpost_pc(:id_nakl);
          execute procedure naklp_post_pc(:id_nakl,null);
          */
        end  
        suspend;
      end /*for Проверяем на целостность  излишки*/
      
    end/*if (bitand(submode, 1)<>0)*/

    /*Проверяем на целостность расходы, недостачи, хранения*/
    if (bitand(submode,2)<>0) then begin
      for
        select ot.id_nakl,ot.id_nakld,om.tip,om.dat,
          om.id_sklad,om.id_sklad_to,
          ot.id_tovar,
          z(sum(ot.kolotp)),
            (  select z(sum(pr.kredit_kolotp))-z(sum(pr.debet_kolotp))
               from provodki pr
               where pr.attr1=ot.id_nakld and
            pr.id_schet=:id_schet_sebest_sklad and
            (pr.kredit_kolotp>0 or pr.debet_kolotp<0) and
            pr.sub2=om.id_sklad and
            pr.id_nakl=om.id_nakl and
            pr.tip<>1
            )
          from
            naklo om inner join naklot ot
              on ot.id_nakl=om.id_nakl
          where
            (om.id_sklad between
              coalesce(:id_sklad_in2,-2147483648)
              and coalesce(:id_sklad_in2, 2147483647)
              or om.id_sklad is null)  and
            (ot.id_tovar between
              coalesce(:id_tovar_in,-2147483648)
              and coalesce(:id_tovar_in, 2147483647)) and
            om.tip in (5,30,103)  and
            om.posted=1 and
            om.dat between :dat_from and :dat_to
          group by ot.id_nakl,ot.id_nakld,om.id_sklad,
            om.tip,ot.id_tovar,om.dat,
            om.id_sklad,om.id_sklad_to,om.id_nakl
          having Round(z(sum(ot.kolotp)),3)<>
            (  select Round(z(sum(pr.kredit_kolotp))-z(sum(pr.debet_kolotp)),3)
               from provodki pr
               where pr.attr1=ot.id_nakld and
            pr.id_schet=:id_schet_sebest_sklad and
            (pr.kredit_kolotp>0 or pr.debet_kolotp<0) and
            pr.sub2=om.id_sklad and
            pr.id_nakl=om.id_nakl and
            pr.tip<>1
            )
          into :id_nakl,:id_nakld,:tip,:dat,
            :id_sklad,:id_sklad_to,:id_tovar,
            :ot_kolotp,:pr_kolotp
      do begin
        errorcode=2;
        if (:mode=2) then begin
          id_partiya=:id_nakld-(Round(:id_nakld/10000,0)*10000);
          id_partiya=((extractyear(:dat)-2000)*100000000)+(extractmonth(:dat)*1000000)+extractday(:dat)*10000+z(:id_partiya);
          execute procedure naklp_sebest4_recount_pc(:id_nakld,
            :id_sklad,:id_partiya,:tip,6);
        end  
        suspend;
      end /*for Проверяем на целостность расходы, недостачи, хранения*/
    end /*if bitand*/
    if (bitand(submode,4)<>0) then begin
      /*Проверяем на целостность хранения как приходы на склады получателя*/
      for
        select ot.id_nakl,ot.id_nakld,om.tip,om.dat,
          om.id_sklad,om.id_sklad_to,
          ot.id_tovar,
          (sum(ot.kolotp)),
          (
               select z(sum(pr.debet_kolotp))
               from provodki pr
               where pr.attr1=ot.id_nakld and
            pr.id_schet=:id_schet_sebest_sklad and
            pr.debet_kolotp>0 and
            pr.sub2=om.id_sklad_to and
            pr.id_nakl=om.id_nakl and
            pr.tip<>1
          
          )
            from
              naklo om inner join naklot ot
                on ot.id_nakl=om.id_nakl
          where
            (om.id_sklad_to between
              coalesce(:id_sklad_in2,-2147483648)
              and coalesce(:id_sklad_in2, 2147483647)
              or om.id_sklad_to is null)  and
            (ot.id_tovar between
              coalesce(:id_tovar_in,-2147483648)
              and coalesce(:id_tovar_in, 2147483647)) and              
            om.tip in (103) and
            om.posted=1 and
            om.dat between :dat_from and :dat_to
          group by ot.id_nakl,ot.id_nakld,om.id_sklad,
            om.tip,ot.id_tovar,om.dat,
            om.id_sklad,om.id_sklad_to,om.id_nakl
          having Round(z(sum(ot.kolotp)),3)<>
          (    select Round(z(sum(pr.debet_kolotp)),3)
               from provodki pr
               where pr.attr1=ot.id_nakld and
            pr.id_schet=:id_schet_sebest_sklad and
            pr.debet_kolotp>0 and
            pr.sub2=om.id_sklad_to and
            pr.id_nakl=om.id_nakl and
            pr.tip<>1
          )
          into :id_nakl,:id_nakld,:tip,:dat,
            :id_sklad,:id_sklad_to,:id_tovar,
            :ot_kolotp,:pr_kolotp
      do begin
        errorcode=4;
        id_sklad = id_sklad_to; /*Для читабельности показываем склад на котором не было прихода,
          а не тот с которого был расход*/
        if (:mode=2) then begin
          id_partiya=:id_nakld-(Round(:id_nakld/10000,0)*10000);
          id_partiya=((extractyear(:dat)-2000)*100000000)+(extractmonth(:dat)*1000000)+extractday(:dat)*10000+z(:id_partiya);
          execute procedure naklp_sebest4_recount_pc(:id_nakld,
            :id_sklad_to,:id_partiya,:tip,6);
/*$$IBEC$$           execute procedure naklp_sebest4_recount_pc(:id_nakld,
            :id_sklad_to,:id_partiya,:tip,5); $$IBEC$$*/
        end
        suspend;
      end /*for Проверяем на целостность хранения как приходы на склады получателя */
    end /*if bitand*/
    if (bitand(submode,8)<>0) then begin
      /*Проверяем не создавали ли отгрузки себе приходы*/
      for
        select ot.id_nakl,ot.id_nakld,om.tip,om.dat,
          om.id_sklad,om.id_sklad_to,
          ot.id_tovar,
          (sum(ot.kolotp)),
          (
               select z(sum(pr.debet_kolotp))
               from provodki pr
               where pr.attr1=ot.id_nakld and
            pr.id_schet=:id_schet_sebest_sklad and
            pr.debet_kolotp>0 and
            pr.sub2=om.id_sklad and
            pr.id_nakl=om.id_nakl and
            pr.tip<>1
          
          )
            from
              naklo om inner join naklot ot
                on ot.id_nakl=om.id_nakl
          where
            (om.id_sklad between
              coalesce(:id_sklad_in2,-2147483648)
              and coalesce(:id_sklad_in2, 2147483647)
              or om.id_sklad is null)  and
            (ot.id_tovar between
              coalesce(:id_tovar_in,-2147483648)
              and coalesce(:id_tovar_in, 2147483647)) and              
            om.tip in (5,6,103) and
            om.posted=1 and
            om.dat between :dat_from and :dat_to
          group by ot.id_nakl,ot.id_nakld,om.id_sklad,
            om.tip,ot.id_tovar,om.dat,
            om.id_sklad,om.id_sklad_to,om.id_nakl
          having Round(          (
               select z(sum(pr.debet_kolotp))
               from provodki pr
               where pr.attr1=ot.id_nakld and
            pr.id_schet=:id_schet_sebest_sklad and
            pr.debet_kolotp>0 and
            pr.sub2=om.id_sklad and
            pr.id_nakl=om.id_nakl and
            pr.tip<>1
          
          ),3)<>0
          into :id_nakl,:id_nakld,:tip,:dat,
            :id_sklad,:id_sklad_to,:id_tovar,
            :ot_kolotp,:pr_kolotp
      do begin
        errorcode=8;
        if (:mode=2) then begin
          id_partiya=:id_nakld-(Round(:id_nakld/10000,0)*10000);
          id_partiya=((extractyear(:dat)-2000)*100000000)+(extractmonth(:dat)*1000000)+extractday(:dat)*10000+z(:id_partiya);
          if (tip <>103) then begin
            execute procedure naklp_sebest4_recount_pc(:id_nakld,
              :id_sklad,:id_partiya,:tip,6);
          end else begin
            execute procedure naklp_sebest4_recount_pc(:id_nakld,
              :id_sklad,:id_partiya,:tip,6);
          end
        end
        suspend;
      end /*for Проверяем на целостность хранения как приходы на склады получателя */
    end /*if bitand*/    
    
    if (bitand(submode, 16)<>0) then begin
      /*Кол-во товара должно быть с 3 знаками после запятой, чтобы
       остатки были =0, а не 0.0001*/
      for
        select ot.id_nakl,ot.id_nakld,om.tip,om.dat,
          om.id_sklad,om.id_sklad_to,
          ot.id_tovar,
          ot.kolotp,Round(Round(ot.kolotp,3)-ot.kolotp,4)
          from
            naklo om inner join naklot ot
              on ot.id_nakl=om.id_nakl
        where
          (om.id_sklad between
            coalesce(:id_sklad_in2,-2147483648)
            and coalesce(:id_sklad_in2, 2147483647)
            or om.id_sklad is null)  and
          (ot.id_tovar between
            coalesce(:id_tovar_in,-2147483648)
            and coalesce(:id_tovar_in, 2147483647)) and
          om.tip in (1,2,5,6,30,103) and
          om.posted=1 and
          om.dat between :dat_from and :dat_to and
          Round(Round(ot.kolotp,3)-ot.kolotp,4)<>0
        into :id_nakl,:id_nakld,:tip,:dat,
          :id_sklad,:id_sklad_to,:id_tovar,
          :ot_kolotp,:pr_kolotp
      /* Procedure Text */
      do begin
        errorcode=16;
        if (:mode=2) then begin
          id_partiya=:id_nakld-(Round(:id_nakld/10000,0)*10000);
          id_partiya=((extractyear(:dat)-2000)*100000000)+(extractmonth(:dat)*1000000)+extractday(:dat)*10000+z(:id_partiya);
         for
           select KOLOTP,KOLOTP_OLD
           from generate_tara(:id_nakl)
           into :kolotp_temp,:kolotp_temp
         do begin
         end          
          execute procedure naklp_sebest4_recount_pc(:id_nakld,
            :id_sklad,:id_partiya,:tip,6);
        end  
        suspend;
      end /*for Проверяем на целостность приходы и излишки*/    
    end /*if (bitand(submode, 16)<>0)*/

    
    /*Неправильные количества. Знаков больше 4*/
    if (bitand(submode, 128)<>0) then begin
      errorcode=128;
      for
        select
          ot.id_nakl,ot.id_nakld,om.tip,om.dat,
          om.id_sklad,om.id_sklad_to,
          ot.id_tovar
          /*$$IBEC$$ Round(od.kolotp*1000,0)-Round(od.kolotp*1000,3), od.*,om.* $$IBEC$$*/
        from naklodet od inner join naklot ot on ot.id_nakld=od.id_nakld inner join naklo om
          on ot.id_nakl=om.id_nakl
        where /*$$IBEC$$ ot.id_tovar=6452 and $$IBEC$$*/
          (Round(od.kolotp*1000,0)-Round(od.kolotp*1000,3))<>0
          and om.dat between :dat_from and :dat_to
          and om.tip in (1,5,103,6,30,2)  and
          (om.id_sklad between
            coalesce(:id_sklad_in2,-2147483648)
            and coalesce(:id_sklad_in2, 2147483647)
            or om.id_sklad is null)  and
          (ot.id_tovar between
            coalesce(:id_tovar_in,-2147483648)
            and coalesce(:id_tovar_in, 2147483647))
        into :id_nakl,:id_nakld,:tip,:dat,
          :id_sklad,:id_sklad_to,
          :id_tovar
      do begin
        if (:mode=2) then begin
        for
          select KOLOTP,KOLOTP_OLD
          from generate_tara(:id_nakl)
          into :kolotp_temp,:kolotp_temp
        do begin
        end          
          execute procedure naklp_sebest4_recount_pc(:id_nakld,
        :id_sklad,:id_partiya,:tip,6);
        end /*if (:mode=2)*/
        suspend;
      end /*for Проверяем на целостность приходы и излишки*/
    end /*if (bitand(submode, 128)<>0) then begin*/
    if (bitand(submode,256)<>0) then begin
       errorcode=256;
       for
         select
            pr.id_nakl,pr.attr1,pr.tip, pr.dat,pr.sub1, pr.sub2,pr.kredit_kolotp
          from
             provodki pr
            left join naklot ot on pr.attr1=ot.id_nakld
          where
            pr.id_schet=:id_schet_sebest_sklad and pr.dat between :dat_from and :dat_to
            and ot.id_nakld is null
            and pr.id_nakl<>pr.attr1 and/*Выравнивания*/
            (pr.sub2 between
              coalesce(:id_sklad_in2,-2147483648)
              and coalesce(:id_sklad_in2, 2147483647)
              or pr.sub2 is null)  and
            (pr.sub1 between
              coalesce(:id_tovar_in,-2147483648)
              and coalesce(:id_tovar_in, 2147483647))
           into :ID_NAKL,:ID_NAKLD,:TIP,:DAT,:ID_TOVAR,:ID_SKLAD,:PR_KOLOTP
       do begin
          if (:mode=2) then begin
            delete from provodki pr
              where pr.attr1=:id_nakld
                and pr.id_nakl=:id_nakl
                and pr.sub1=:id_tovar
                and pr.sub2=:id_sklad
                and pr.id_schet=:id_schet_sebest_sklad;
          end  
          suspend;
       end
     end
    /*Проверка что сумма прихода имеет не более 2 знаков после запятой
    обычно этим грешат излишки*/
    if (bitand(submode,512)<>0) then begin
       errorcode=512;
       for
        select 
          pr.id_nakl,pr.attr1,pr.tip, pr.dat,pr.sub1, pr.sub2,pr.kredit_kolotp,pr.sub3
        from provodki pr
        where pr.id_schet=:id_schet_sebest_sklad and
            pr.dat between :dat_from and :dat_to and
            (pr.sub2 between
              coalesce(:id_sklad_in2,-2147483648)
              and coalesce(:id_sklad_in2, 2147483647)
              or pr.sub2 is null)  and
            (pr.sub1 between
              coalesce(:id_tovar_in,-2147483648)
              and coalesce(:id_tovar_in, 2147483647)) and  
             Round(pr.debet-Round(pr.debet,2),4)<>0
         into :ID_NAKL,:ID_NAKLD,:TIP,:DAT,:ID_TOVAR,:ID_SKLAD,:PR_KOLOTP,:id_partiya
       do begin
          if (:mode=2) then begin
            execute procedure naklp_sebest4_part_recount_pc(null,:id_tovar,:id_sklad,:id_partiya);
          end
          suspend;
       end
     end
    if (bitand(submode,512)<>0) then begin
       errorcode=512;
       for
        select 
          pr.id_nakl,pr.attr1,pr.tip, pr.dat,pr.sub1, pr.sub2,pr.kredit_kolotp,pr.sub3
        from provodki pr
        where pr.id_schet=:id_schet_sebest_sklad and
            pr.dat between :dat_from and :dat_to and
            (pr.sub2 between
              coalesce(:id_sklad_in2,-2147483648)
              and coalesce(:id_sklad_in2, 2147483647)
              or pr.sub2 is null)  and
            (pr.sub1 between
              coalesce(:id_tovar_in,-2147483648)
              and coalesce(:id_tovar_in, 2147483647)) and  
             Round(pr.kredit-Round(pr.kredit,2),4)<>0
         into :ID_NAKL,:ID_NAKLD,:TIP,:DAT,:ID_TOVAR,:ID_SKLAD,:PR_KOLOTP,:id_partiya
       do begin
          if (:mode=2) then begin
            execute procedure naklp_sebest4_part_recount_pc(null,:id_tovar,:id_sklad,:id_partiya);
          end
          suspend;
       end
     end
  end /*for tree sklad*/
end
^

SET TERM ; ^


