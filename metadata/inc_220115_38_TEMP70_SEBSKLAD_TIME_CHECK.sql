SET TERM ^ ;

CREATE OR ALTER PROCEDURE TEMP70_SEBSKLAD_TIME_CHECK (
    id_tovar_in integer,
    id_sklad_in integer,
    dat_from_in timestamp,
    dat_to_in timestamp,
    mode_in integer,
    submode_in integer)
returns (
    id_tovar integer,
    id_sklad integer,
    id_partiya bigint,
    debet_kolotp double precision,
    kolotp_sklad double precision,
    kolotp_seb double precision)
as
declare variable id_schet_tip integer;
declare variable id_schet_sebest_sklad integer;
declare variable kolotp_after double precision;
declare variable id_uchet_politics_in integer;
declare variable id_manager integer;
declare variable id_izg integer;
declare variable id_nakl_new integer;
declare variable id_sklad2 integer;
declare variable debet_kolotp_pr double precision;
declare variable debet_pr double precision;
declare variable sebest double precision;
declare variable kredit double precision;
declare variable kredit_kolotp double precision;
declare variable dat_nakl date;
declare variable id_sklad3 integer;
declare variable partiya_kolotp double precision;
declare variable flag_more integer;
declare variable sum_partiya_kolotp double precision;
declare variable serror varchar(250);
declare variable kolotp double precision;
declare variable id_prov integer;
declare variable id_nakld integer;
declare variable tip integer;
declare variable id_nakl integer;
declare variable old_id_nakl integer;
declare variable id_sklad_det integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
    into :id_schet_tip;
  select oid
    from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ СКЛАД',:id_schet_tip)
    into :id_schet_sebest_sklad;   
  if (mode_in=2) then begin
    /*Нужно чтоб сравнение id_sklad2<>id_sklad давало правду,
     а если значение null, то проверка даёт ложь*/
    id_sklad2=-1;
    id_sklad3=-1;
    select oid
      from GET_OID_OBJECTS_PC('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100)
      into :id_uchet_politics_in;
    select oid
      from GET_OID_OBJECTS_PC('УПРАВЛЕНЧЕСКИЙ УЧЁТ',:id_uchet_politics_in)
      into :id_uchet_politics_in;
      
    select oid
      from GET_OID_OBJECTS_PC('ТИП МЕНЕДЖЕРЫ',-100)
      into :id_manager;
    select oid
      from GET_OID_OBJECTS_PC('Тест',:id_manager)
      into :id_manager;
    select oid
      from GET_OID_OBJECTS_PC('ТИП ФИРМЫ',-100)
      into :id_izg;
    select oid
      from GET_OID_OBJECTS_PC('нал',:id_izg)
      into :id_izg;
  end
  for
    select sub1,sub2, sum(r.kolotp_after)
      from rep_ostatki_pc(:id_schet_sebest_sklad,:dat_to_in,:id_tovar_in,:id_sklad_in,
        null,null,null,null,
        null,null,null,null) r
      group  by sub1,sub2
      order by sub2,sub1
      into :id_tovar,:id_sklad,:kolotp_after
  do begin
    select sum(
      case when ((id_tara=:id_tovar) and (id_type in(1,2))) then (s.kolbuxt+s.kolbrezerv)
        when ((id_tara=:id_tovar) and (id_type in(4,6))) then (1)
        else (s.kolotp*s.kolbuxt+s.kolrezerv*s.kolbrezerv) end
      )
    from sklostt_time_pc(:id_tovar,:id_sklad,/*incdate(*/:dat_to_in/*,-1,0,0)*/) s
    into :kolotp_sklad;
    /*Несовпадающее колво, либо режим принудительного пересчёта*/
    if ((Round(z(:kolotp_sklad)-z(:kolotp_after),4)<>0) or (:submode_in=1)) then begin
      KOLOTP_seb =:kolotp_after;
      if (:mode_in=0) then begin
        for
          select sub3,z(sum(r.kolotp_after))
            from rep_ostatki_pc(:id_schet_sebest_sklad,:dat_to_in,:id_tovar,:id_sklad,
              null,null,null,null,
              null,null,null,null) r
            group  by sub1,sub2,sub3
            having Round(sum(r.kolotp_after),4)<>0
            into :id_partiya,:debet_kolotp
        do begin
          suspend;
        end /*for id_partiya*/
      end /*if mode=0*/
      if (:mode_in=2) then begin
        if (Round(z(:kolotp_sklad)-z(:kolotp_after),4)>0) then begin
          if (:id_sklad2<>:id_sklad) then begin
            /*новая накладная требуется, и склад в ней другой*/
            id_sklad2=id_sklad;
            id_nakl_new=gen_id(naklo_gen,1);
            dat_nakl=incdate(:DAT_TO_IN,-1,0,0);
            insert into naklo (id,id_nakl,tip,dat,
              id_izg,id_zak,id_manager,id_sklad,
              posted,blocked,zatraty)
              values ('СЕБЕСТ',:id_nakl_new,2,:DAT_nakl,
              :id_izg,:id_izg,:id_manager,:id_sklad2, 1,1,0);
          end        
          /*Колво партии будущего излишка*/
          debet_kolotp_pr=Round(z(:kolotp_sklad)-z(:kolotp_after),4);
          kredit = null;
          select first 1
              sub3,Round(sum(kolotp_after),3),
              Round(sum(r.debetafter)-sum(r.kreditafter),2)
            from rep_ostatki_pc(:id_schet_sebest_sklad,/*:dat_nakl,*/current_timestamp,
              :id_tovar,:id_sklad,
              null,null,
              null,null,
              null,null,
              null,null) r
            group by sub1,sub2,sub3,sub4
            having Round(sum(kolotp_after),3)>0
            order by sub3 desc
            into :id_partiya,:kredit_kolotp,:kredit;
          /*Номер партии должен быть похож на дату фиктивного прихода*/
          id_partiya=((extractyear(:dat_to_in)-2000)*100000000)+
            (extractmonth(:dat_to_in)*1000000)+
            extractday(:dat_to_in)*10000;  
          if (:kredit is null) then begin
            /*Если такой товар не приходовался то
            его себест берется ВРЕМЕННО из спр себест*/
            select first 1 s.sebest
              from sebest s
              where s.id_tovar=:id_tovar and s.dat<=:dat_nakl
              order by s.dat desc
              into :kredit;
            kredit=z(:kredit)*z(:debet_kolotp_pr);
        

          end else begin
            kredit=(kredit/kredit_kolotp)*z(:debet_kolotp_pr);
          end
          debet_pr=kredit;

          insert into provodki (id_schet,dat,tip,id_nakl,attr1,
            sub1,sub2,sub3,
            debet_kolotp,debet
            /*$$IBEC$$ ,kredit_kolotp,kredit $$IBEC$$*/)
          values (:id_schet_sebest_sklad,:dat_nakl, 2,:id_nakl_new,:id_nakl_new,
            :id_tovar,:id_sklad,:id_partiya,
            :debet_kolotp_pr,:debet_pr
            /*$$IBEC$$ ,:kredit_kolotp_pr,:kredit_pr $$IBEC$$*/);
          /*Для отображения на экран колва излишка*/
          debet_kolotp=debet_kolotp_pr;
          suspend;
        end /*if излишек*/
        
        if (Round(z(:kolotp_sklad)-z(:kolotp_after),4)<0) then begin
          if (:id_sklad3<>:id_sklad) then begin
            /*новая накладная требуется, и склад в ней другой*/
            id_sklad3=id_sklad;
            id_nakl_new=gen_id(naklo_gen,1);
            dat_nakl=incdate(:DAT_TO_IN,-1,0,0);
            insert into naklo (id,id_nakl,tip,dat,
              id_izg,id_zak,id_manager,id_sklad,
              posted,blocked,zatraty)
              values ('СЕБЕСТ',:id_nakl_new,30,:DAT_nakl,
              :id_izg,:id_izg,:id_manager,:id_sklad3, 1,1,0);
          end        
          /*Колво партии будущей недостачи*/
          KOLOTP=Round(z(:kolotp_after)-z(:kolotp_sklad),4);
          kredit = null;
          kredit_kolotp = null;
          flag_more=1;
          sum_partiya_kolotp=0;
          for
            select sub3,Round(sum(kolotp_after),3),Round(sum(r.debetafter)-sum(r.kreditafter),2)
            from rep_ostatki_pc(:id_schet_sebest_sklad,/*:dat_nakl,*/current_timestamp,
              :id_tovar,:id_sklad,
              null,null,
              null,null,
              null,null,
              null,null) r
            group by sub1,sub2,sub3,sub4
            having Round(sum(kolotp_after),3)>0
            order by sub3
            into :id_partiya,:kredit_kolotp,:kredit
          do begin
            if (kredit_kolotp is null) then begin
              sError ='Ошибка в naklot_sebest2_count. Нет себестоимости для id_tovar1=' || coalesce(:id_tovar,0) || '. id_sklad=' ||coalesce(:id_sklad,0);
              execute procedure error(sError);
              /*leave;*/
            end
            /*Потребуется ещё себестоимость*/
            flag_more=1;
            if (:kredit_kolotp>=Round(z(:kolotp-:sum_partiya_kolotp),3)) then begin
              flag_more=0;
              partiya_kolotp=Round(z(:kolotp-:sum_partiya_kolotp),4);
            end else begin
              partiya_kolotp=:kredit_kolotp;      
            end
            sum_partiya_kolotp=Round(z(partiya_kolotp)+z(sum_partiya_kolotp),4);
            sebest=Round(dzero(kredit,kredit_kolotp,0)*partiya_kolotp,2);
            insert into provodki(id_schet,id_nakl,tip,dat,
                kredit,kredit_kolotp,
                sub1,sub2,sub3,attr1)
              values(:id_schet_sebest_sklad,:id_nakl_new, 30,:dat_nakl,
                :sebest,:partiya_kolotp,
                :id_tovar,:id_sklad, :id_partiya,:id_nakl_new);
            debet_kolotp=:partiya_kolotp;
            suspend;

            if (flag_more<>1) then begin
              leave;
            end
            kredit_kolotp = null;
            /*Прописывание расхода в проводках*/
          end /*for*/
        end /*if недостача*/
        
        
      end /*if mode=2*/
      /*Удаление фиктивных приходов и расходов по позиции*/      
      if (:mode_in=3) then begin
        for
          select pr.id_prov,pr.sub1, pr.sub2, pr.sub3,z(pr.debet_kolotp)-z(pr.kredit_kolotp)
          from naklo om inner join provodki pr on pr.id_nakl=om.id_nakl
          where om.tip in (2,30) and
            om.id='СЕБЕСТ' and
            pr.id_schet=:id_schet_sebest_sklad and
            pr.sub1=:id_tovar and
            pr.sub2=:id_sklad and
            pr.dat between :dat_from_in and :dat_to_in
          into :id_prov,:id_tovar,:id_sklad,:id_partiya,:kolotp_seb
        do begin
          /*Только для показа выравниваний режим 2*/
          if (submode_in<>2) then begin
            delete from provodki pr where pr.id_prov=:id_prov;
          end
          suspend;
        end/*for id_prov*/
      end /*if mode=3*/
      /*Перепроведение отгрузок которые создали приход сами*/
      if (mode_in=4) then begin
        for
          select r.NEW_ID_PARTIYA,r.kolotp_seb
            from temp69_seb_otgr_self_prixod(:id_sklad,:id_tovar,:dat_from_in,:dat_to_in) r
            into :id_partiya,:kolotp_sklad
        do begin
          suspend;
        end
        /*$$IBEC$$ execute procedure temp69_seb_otgr_self_prixod(:id_sklad,:id_tovar,'01.01.01',:dat_to_in); $$IBEC$$*/
      end /*if mode_in=4*/
      /*Перепроведение всех накладных*/
      if (mode_in=5 ) then begin
        /*Удаление всех проводок*/
/*$$IBEC$$         for
          select ot.id_nakld,om.id_sklad,om.tip,om.id_nakl
          from naklo om inner join naklot ot on om.id_nakl=ot.id_nakl
          where om.dat between :dat_from_in and :dat_to_in
            and ot.id_tovar=:id_tovar
            and ((om.id_sklad=:id_sklad and om.tip in (1,2,5,30,103))
              or (om.id_sklad_to=:id_sklad and om.tip=103))
            and om.posted=1 and om.delmarked=0
          into :id_nakld,:id_sklad,:tip,:id_nakl
        do begin

        end $$IBEC$$*/
        delete from provodki pr
        where pr.id_schet=:id_schet_sebest_sklad
          and pr.sub1=:id_tovar
          and pr.sub2=:id_sklad
          and pr.dat between :dat_from_in and :dat_to_in;
        /*Весь приход*/
        for
          select ot.id_nakld,
          case when om.tip=103 then om.id_sklad_to else om.id_sklad end,
          om.tip
          from naklo om inner join naklot ot on om.id_nakl=ot.id_nakl
          where om.dat between :dat_from_in and :dat_to_in
            and ot.id_tovar=:id_tovar
            and ((om.id_sklad=:id_sklad and om.tip in (1,2))
              or (om.id_sklad_to=:id_sklad and om.tip=103))
            and om.posted=1 and om.delmarked=0
          order by om.dat, om.tip, om.id
          into :id_nakld,:id_sklad_det,:tip
        do begin
          execute procedure naklp_sebest4_recount_pc(:id_nakld,
            :id_sklad_det,:id_partiya,:tip,6);
          for
            select pr.sub3,pr.debet_kolotp
            from provodki pr
            where pr.id_schet=:id_schet_sebest_sklad
              and pr.sub1=:id_tovar
              and pr.sub2=:id_sklad_det
              and pr.attr1=:id_nakld
              and pr.debet_kolotp>0
            into :id_partiya,:debet_kolotp
          do begin
            suspend;
          end
        end
        /*Весь расход*/
        for
          select ot.id_nakld,om.id_sklad,om.tip
          from naklo om inner join naklot ot on om.id_nakl=ot.id_nakl
          where om.dat between :dat_from_in and :dat_to_in
            and ot.id_tovar=:id_tovar
            and om.id_sklad=:id_sklad
            and om.tip in (5,30,103)
            and om.posted=1 and om.delmarked=0
          order by om.dat, om.tip, om.id
          into :id_nakld,:id_sklad_det,:tip
        do begin
          execute procedure naklp_sebest4_recount_pc(:id_nakld,
            :id_sklad_det,:id_partiya,:tip,6);
          for
            select pr.sub3,(-1)*pr.kredit_kolotp
            from provodki pr
            where pr.id_schet=:id_schet_sebest_sklad
              and pr.sub1=:id_tovar
              and pr.sub2=:id_sklad_det
              and pr.attr1=:id_nakld
              and pr.kredit_kolotp>0
            into :id_partiya,:debet_kolotp
          do begin
            suspend;
          end            
        end        
      end/*if mode_in=5*/
      /*Перепроведение минусовых партий*/
      if (mode_in=6) then begin
        for
          select r.id_partiya_new,r.kolotp,r.id_sklad,r.id_tovar
          from sklad_sebest_minus_pc(:id_tovar,:id_sklad,:dat_to_in,2) r
          into :id_partiya,:debet_kolotp,:id_sklad,:id_tovar
        do begin
          suspend;
        end/*for*/
      end /*if (mode_in=6)*/
      /*Генерация тары повторно для всего списка накладных*/
      if (mode_in=7 ) then begin
        old_id_nakl=0;
        for
          select om.id_nakl,om.id_sklad,om.tip
          from naklo om inner join naklot ot on om.id_nakl=ot.id_nakl
            inner join naklodet od on od.id_nakld=ot.id_nakld
          where om.dat between :dat_from_in and :dat_to_in
            and od.id_tara=:id_tovar
            and ((om.id_sklad=:id_sklad and om.tip in (1,2,5,30,103))
              or (om.id_sklad_to=:id_sklad and om.tip=103))
            and om.posted=1 and om.delmarked=0
          group by om.id_nakl,om.id_sklad,om.tip,om.id,om.id_sklad, om.dat
          order by om.dat,om.tip, om.id,om.id_sklad

          into :id_nakl,:id_sklad3,:tip
        do begin
          for
            select id_tara,kolotp_old,kolotp
              from generate_tara(:id_nakl)
              into :id_tovar,:kolotp_sklad,:kolotp_seb
          do begin
            if (old_id_nakl=0) then begin
              old_id_nakl=id_nakl;
            end
            if (id_nakl<>old_id_nakl) then begin
              execute procedure naklp_sebest4_recount_pc(:old_id_nakl,
                :id_sklad3,:id_partiya,:tip,6);
              old_id_nakl=id_nakl;
            end
            suspend;
          end  /*for*/
        end
      end/*if mode_in=7*/      
      /*Перепроведение минусовых партий*/
      if (mode_in=8) then begin
        for
          select r.id_partiya_new,r.kolotp,r.id_sklad,r.id_tovar
          from sklad_sebest_minus_pc(:id_tovar,:id_sklad,:dat_to_in,4) r
          into :id_partiya,:debet_kolotp,:id_sklad,:id_tovar
        do begin
          suspend;
        end/*for*/
      end /*if (mode_in=8)*/
      
    end/*if ((Round(z(:kolotp_sklad)-z(:kolotp_after),4)<>0) or (:submode_in=1))*/
  end/*for*/
end
^

SET TERM ; ^


