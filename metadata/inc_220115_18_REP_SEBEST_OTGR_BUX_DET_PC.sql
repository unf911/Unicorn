SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_SEBEST_OTGR_BUX_DET_PC (
    mode_in integer,
    id_schet_in integer,
    id_sklad_in integer,
    id_tovar_in integer,
    id_currency_to integer,
    dat_to_in timestamp,
    id_partiya_in bigint,
    id_nakld_in integer)
returns (
    id_partiya bigint,
    id varchar(20),
    dat timestamp,
    kolotp double precision,
    sebest double precision,
    cena double precision,
    kurs double precision,
    kurs_indirect integer,
    nalog_nds double precision,
    zatraty double precision,
    id_nakl integer,
    id_nakld integer,
    id_uchet_politics integer,
    tip integer,
    id_sklad integer,
    id_sklad_to integer,
    tip_name varchar(50))
as
declare variable id_currency_tip integer;
declare variable id_currency integer;
declare variable tree_oid_sklad integer;
declare variable tree_oid_tovar integer;
declare variable debet double precision;
declare variable kredit double precision;
declare variable debet_kolotp double precision;
declare variable kredit_kolotp double precision;
declare variable id_currency_sebest integer;
declare variable id_currency_nakl integer;
declare variable id_schet_tip integer;
declare variable id_schet_bux integer;
declare variable tara_mode integer;
declare variable include_nds integer;
declare variable kurs_for_nakl double precision;
declare variable kurs_for_sebest double precision;
begin
  select oid
    from get_oid_objects_pc('ТИП ВАЛЮТ',-100)
    into :id_currency_tip;
  select oid
    from get_oid_objects_pc('UAH',:id_currency_tip)
    into :id_currency_nakl;
  /*По умолчанию отчёт валюта гривна*/
  if (id_currency_to is null) then begin
    id_currency_to=id_currency_nakl;
  end    
  select oid
    from get_oid_objects_pc('ТИП СЧЕТА',-100)
    into :id_schet_tip;
  select oid
    from get_oid_objects_pc('СЕБЕСТОИМОСТЬ БУХ',:id_schet_tip)
    into :id_schet_bux;
  if (id_schet_in is null) then begin
    id_schet_in=:id_schet_bux;
  end
  if (id_schet_in=id_schet_bux) then begin
    tara_mode=2;
  end else begin
    tara_mode=1;
  end
  if (dat_to_in is null) then begin
    dat_to_in=current_timestamp;
  end


  select oid
    from get_oid_objects_pc('ТИП НАЗВАНИЯ СКЛАДОВ',-100)
    into :tree_oid_sklad;
  select oid
    from get_oid_objects_pc('ТИП ТОВАРЫ',-100)
    into :tree_oid_tovar;
  select oid
    from get_oid_objects_pc('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100)
    into :id_uchet_politics;
  select oid
    from get_oid_objects_pc('БУХГАЛТЕРСКИЙ УЧЁТ',:id_uchet_politics)
    into :id_uchet_politics;
  select u.id_currency_sebest, u.include_nds
    from spr_uchet_politics_vw u
    where u.oid=:id_uchet_politics and u.delmarked=0
    into :id_currency_sebest,:include_nds;
  select dzero(kurs_to,kurs_from,1)
    from kurs_get_pc (:dat_to_in, :id_currency_nakl,:id_currency_to,1)
    into :kurs_for_nakl;
  select dzero(kurs_to,kurs_from,1)
    from kurs_get_pc (:dat_to_in, :id_currency_sebest,:id_currency_to,1)
    into :kurs_for_sebest;
    

    

    
    
    
 /* mode=1 -  тип отчёта : по партии */
  if (mode_in=1 ) then begin
    for
      select pr.sub3,pr.attr1,pr.id_nakl,
        pr.debet_kolotp,pr.debet,
        pr.kredit_kolotp,pr.kredit/*,
        ot.cena*/
      from provodki pr /*inner join naklo om
        on om.id_nakl=pr.id_nakl*/
        /*left join naklot ot
        on ot.id_nakld=pr.attr1
          and ot.id_nakl=pr.id_nakl*/
      where
        pr.id_schet=:id_schet_in and
        pr.dat<= :dat_to_in and
        pr.tip<>1 and
        pr.sub1=:id_tovar_in and
        pr.sub2=:id_sklad_in and
        pr.sub3=:id_partiya_in
      order by pr.debet_kolotp,pr.kredit_kolotp
      into /*:id_uchet_politics,*/
        :id_partiya,:id_nakld,:id_nakl,
        :debet_kolotp,:debet,
        :kredit_kolotp,:kredit/*,
        :cena*/
    do begin
      select om.id,/*$$IBEC$$ om.zatraty, $$IBEC$$*/om.nalog_nds,om.kurs,
          om.dat,om.tip,om.kurs_indirect,
          om.id_currency,om.id_currency_to,
          ot.cena,om.id_sklad,om.id_sklad_to
        from naklo om inner join naklot ot
          on ot.id_nakl=om.id_nakl
        where /*$$IBEC$$ om.id_nakl=:id_nakl
          and ot.id_nakl=:id_nakl
          and $$IBEC$$*/ ot.id_nakld=:id_nakld
        into :id, /*$$IBEC$$ :zatraty, $$IBEC$$*/:nalog_nds,:kurs,
          :dat,:tip,:kurs_indirect,
          :id_currency,:id_currency_to,
          :cena,:id_sklad,:id_sklad_to;
      select name
        from objects o
        where o.oid=:tip
        into :tip_name;
      if (kredit_kolotp>0) then begin
        kolotp=-:kredit_kolotp;
        sebest=:kredit/:kredit_kolotp;
      end
      if (kredit_kolotp<0) then begin
        kolotp=:kredit_kolotp;
        sebest=:kredit/:kredit_kolotp;
      end
      if (debet_kolotp>0) then begin
        kolotp=:debet_kolotp;
        sebest=:debet/:kolotp;
      end
      if (debet_kolotp<0) then begin
        kolotp=:debet_kolotp;
        sebest=:debet/:kolotp;
      end
      sebest=:sebest*:kurs_for_sebest;
      if (kurs_indirect<>0) then begin
        kurs=Dzero(kurs_for_nakl,kurs,cast(null as double precision));
      end else begin
        kurs=kurs_for_nakl*kurs;
      end
      /*Курс пересчёта цены прихода в себестоимость*/
/*$$IBEC$$       if (tip=1) then begin
  $$IBEC$$*/ /*       select oid
          from GET_OID_OBJECTS_PC('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100)
          into :id_uchet_politics;
        select oid
          from GET_OID_OBJECTS_PC('УПРАВЛЕНЧЕСКИЙ УЧЁТ',:id_uchet_politics)
          into :id_uchet_politics;
        select u.id_currency_sebest
          from spr_uchet_politics_vw u
          where u.oid=:id_uchet_politics and u.delmarked=0
          into :id_currency_sebest;      */ /*$$IBEC$$ 
        if (:id_currency<>:id_currency_sebest) then begin
          if (:id_currency_to<>:id_currency_sebest) then begin
             $$IBEC$$*/ /*Найти курс из валюты детализации в валюту себестоимости*/ /*$$IBEC$$ 
            select kurs_from,kurs_to
              from kurs_get_pc (:dat, :id_currency_to,:id_currency_sebest,1)
              into :kurs_from,:kurs_to;
            if (id_currency_to<>id_currency) then begin
              if (:kurs_indirect=1) then begin
                kurs_to=:kurs_to*:kurs;
              end else begin
                kurs_from=:kurs_from*:kurs;
              end
            end
             $$IBEC$$*/ /*Была ошибка. Валюты=usd, но курс руками выставлен 5.3,
            так на самом деле курс=1 id_nakl=133548*/ /*$$IBEC$$ 
            if (kurs_from is null ) then begin
              kurs=null;
               $$IBEC$$*/ /*sError = 'Ошибка в naklot_sebest2_count_pc. Курс. id_curr=' || coalesce(:id_currency,0)  || '. id_curr_to=' || coalesce(:id_currency_sebest,0);
              execute procedure error(sError);*/ /*$$IBEC$$ 
            end
          end else begin
             $$IBEC$$*/ /*Сумма храниться в той же валюте, что и себестоимость,
              тогда просто домножить на курс указанный в накладной*/ /*$$IBEC$$ 
            kurs_from=1.0000;
            kurs_to=:kurs;
          end  $$IBEC$$*/ /*if (:id_currency<>:id_currency_schet) */ /*$$IBEC$$ 
        end else begin
          kurs_from=1.0000;
          kurs_to=1.0000;
        end   $$IBEC$$*/ /* if (:id_currency<>:id_currency_sebest) */ /*$$IBEC$$ 
        kurs=:kurs_from/:kurs_to;
      end  $$IBEC$$*/ /*if (tip=1)*/

      suspend;
    end /*for select provodki*/
  end


  
  /* mode=3 -  тип отчёта : по позиции накладной */
  /*на вход id_nakld_in подавать id_nakl*/
  if ((mode_in=3) ) then begin
    for
      select pr.sub3,pr.attr1,pr.id_nakl,
        pr.debet_kolotp,pr.debet,
        pr.kredit_kolotp,pr.kredit/*$$IBEC$$ ,
        ot.cena $$IBEC$$*/
      from provodki pr/*$$IBEC$$  
        inner join naklot ot
        on ot.id_nakld=pr.attr1
          and ot.id_nakl=pr.id_nakl $$IBEC$$*/
      where
        pr.id_schet=:id_schet_in and
        pr.dat<=:dat_to_in and
        pr.tip<>1 and
        pr.sub1=:id_tovar_in and
        pr.sub2=:id_sklad_in and
        pr.id_nakl=:id_nakld_in
      into /*:id_uchet_politics*/
         :id_partiya,:id_nakld,:id_nakl,
        :debet_kolotp,:debet,
        :kredit_kolotp,:kredit/*$$IBEC$$ ,
        :cena $$IBEC$$*/
    do begin
      select om.id,/*$$IBEC$$ om.zatraty, $$IBEC$$*/om.nalog_nds,om.kurs,om.dat,om.tip,ot.cena,
          om.id_sklad,om.id_sklad_to
        from naklo om inner join naklot ot on om.id_nakl=ot.id_nakl
        where /*$$IBEC$$ om.id_nakl=:id_nakl
          and ot.id_nakl=:id_nakl
          and $$IBEC$$*/
          ot.id_nakl=:id_nakld_in
          and ot.id_tovar=:id_tovar_in
        into :id, /*$$IBEC$$ :zatraty, $$IBEC$$*/:nalog_nds,:kurs,:dat,:tip,:cena,
          :id_sklad,:id_sklad_to;
      select name
        from objects o
        where o.oid=:tip
        into :tip_name;
      kolotp=null;
      sebest=null;
      if (kredit_kolotp>=0) then begin
        kolotp=-:kredit_kolotp;
        sebest=dzero(:kredit,:kredit_kolotp,cast(null as double precision));
        /*$$IBEC$$ sebest=:kredit/:kredit_kolotp; $$IBEC$$*/
      end
      if (debet_kolotp>=0) then begin
        kolotp=:debet_kolotp;
        sebest=dzero(:debet,:kolotp,cast(null as double precision));
      end
      sebest=:sebest*:kurs_for_sebest;
      if (z(kurs_indirect)<>0) then begin
        kurs=Dzero(kurs_for_nakl,kurs,cast(null as double precision));
      end else begin
        kurs=kurs_for_nakl*kurs;
      end
      suspend;
    end /*for select provodki*/
  end
  /* mode=3 -  ттип отчёта: по номеру накладной и товару*/
  /*на вход id_nakld_in подавать id_nakl*/

 /* mode=3 -  ттип отчёта: по номеру накладной и товару*/
 /*на вход id_nakld_in подавать id_nakl*/
/*$$IBEC$$   if ((mode=3) and (dat_to is null)) then begin
    for
      select pr.sub3,pr.attr1,pr.id_nakl,
        pr.debet_kolotp,pr.debet,
        pr.kredit_kolotp,pr.kredit,
        ot.cena
      from provodki pr 
        inner join naklot ot
        on ot.id_nakld=pr.attr1 
          and ot.id_nakl=pr.id_nakl
      where
        pr.id_schet=:id_schet_sebest and
        pr.tip<>1 and
        pr.sub1=:id_tovar_in and
        pr.sub2=:id_sklad_in and
        pr.id_nakl=:id_nakld_in
      into :id_partiya,:id_nakld,:id_nakl,
         $$IBEC$$*/ /*:id_uchet_politics,*/ /*$$IBEC$$ 
        :debet_kolotp,:debet,
        :kredit_kolotp,:kredit,
        :cena
    do begin
      select om.id,om.zatraty,om.nalog_nds,om.kurs,om.dat,om.tip
        from naklo om
        where om.id_nakl=:id_nakl
        into :id, :zatraty,:nalog_nds,:kurs,:dat,:tip;
      if (kredit_kolotp>0) then begin
        kolotp=-:kredit_kolotp;
        sebest=:kredit/:kredit_kolotp;
      end
      if (debet_kolotp>0) then begin
        kolotp=:debet_kolotp;
        sebest=:debet/:kolotp;
      end

       $$IBEC$$*/ /*Курс пересчёта цены прихода в себестоимость*/ /*$$IBEC$$ 
      if (tip=1) then begin
        select oid
          from GET_OID_OBJECTS_PC('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100)
          into :id_uchet_politics;
        select oid
          from GET_OID_OBJECTS_PC('УПРАВЛЕНЧЕСКИЙ УЧЁТ',:id_uchet_politics)
          into :id_uchet_politics;
        select u.id_currency_sebest
          from spr_uchet_politics_vw u
          where u.oid=:id_uchet_politics and u.delmarked=0
          into :id_currency_sebest;      
        if (:id_currency<>:id_currency_sebest) then begin
          if (:id_currency_to<>:id_currency_sebest) then begin
             $$IBEC$$*/ /*Найти курс из валюты детализации в валюту себестоимости*/ /*$$IBEC$$ 
            select kurs_from,kurs_to
              from kurs_get_pc (:dat, :id_currency_to,:id_currency_sebest,1)
              into :kurs_from,:kurs_to;
            if (id_currency_to<>id_currency) then begin
              if (:kurs_indirect=1) then begin
                kurs_to=:kurs_to*:kurs;
              end else begin
                kurs_from=:kurs_from*:kurs;
              end
            end
             $$IBEC$$*/ /*Была ошибка. Валюты=usd, но курс руками выставлен 5.3,
            так на самом деле курс=1 id_nakl=133548*/ /*$$IBEC$$ 
            if (kurs_from is null ) then begin
              kurs=null;
               $$IBEC$$*/ /*sError = 'Ошибка в naklot_sebest2_count_pc. Курс. id_curr=' || coalesce(:id_currency,0)  || '. id_curr_to=' || coalesce(:id_currency_sebest,0);
              execute procedure error(sError);*/ /*$$IBEC$$ 
            end
          end else begin
             $$IBEC$$*/ /*Сумма храниться в той же валюте, что и себестоимость,
              тогда просто домножить на курс указанный в накладной*/ /*$$IBEC$$ 
            kurs_from=1.0000;
            kurs_to=:kurs;
          end  $$IBEC$$*/ /*if (:id_currency<>:id_currency_schet) */ /*$$IBEC$$ 
        end else begin
          kurs_from=1.0000;
          kurs_to=1.0000;
        end   $$IBEC$$*/ /* if (:id_currency<>:id_currency_sebest) */ /*$$IBEC$$ 
        kurs=:kurs_from/:kurs_to;
      end  $$IBEC$$*/ /*if (tip=1)*/ /*$$IBEC$$ 

      suspend;
    end  $$IBEC$$*/ /*for select provodki*/ /*$$IBEC$$ 
  end $$IBEC$$*/
end
^

SET TERM ; ^


