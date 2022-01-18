SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_SEBEST4_SKLAD_DET_PC (
    mode integer,
    id_sklad_in integer,
    id_tovar_in integer,
    id_currency_to integer,
    dat_to timestamp,
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
    nalog_nds double precision,
    zatraty double precision,
    id_nakl integer,
    id_nakld integer,
    id_uchet_politics integer,
    tip integer)
as
declare variable id_schet integer;
declare variable id_schet_sebest integer;
declare variable id_currency_tip integer;
declare variable id_currency integer;
declare variable tree_oid integer;
declare variable tree_oid_sklad integer;
declare variable tree_oid_tovar integer;
declare variable debet double precision;
declare variable kredit double precision;
declare variable debet_kolotp double precision;
declare variable kredit_kolotp double precision;
declare variable id_uchet_politics_in integer;
declare variable id_currency_sebest integer;
declare variable kurs_indirect integer;
declare variable kurs_from double precision;
declare variable kurs_to double precision;
begin
  select oid
    from get_oid_objects_pc('ТИП СЧЕТА',-100)
    into :id_schet;
  select oid
    from get_oid_objects_pc('СЕБЕСТОИМОСТЬ СКЛАД',:id_schet)
    into :id_schet_sebest;
  select oid
    from get_oid_objects_pc('ТИП ВАЛЮТ',-100)
    into :id_currency_tip;
  select oid
    from get_oid_objects_pc('USD',:id_currency_tip)
    into :id_currency;
  /*
    select oid
      from get_oid_objects_pc('ТИП ДЕРЕВЬЯ',-100)
      into :tree_oid;
    select oid
      from get_oid_objects_pc('ИЕРАРХИЯ СКЛАДОВ',:tree_oid)
      into :tree_oid;*/
    select oid
      from get_oid_objects_pc('ТИП НАЗВАНИЯ СКЛАДОВ',-100)
      into :tree_oid_sklad;
  select oid
    from get_oid_objects_pc('ТИП ТОВАРЫ',-100)
    into :tree_oid_tovar;
    
    
    
 /* mode=1 -  тип отчёта : по партии */
  if ((mode=1) and (dat_to is null)) then begin
    for
      select pr.sub3,pr.attr1,pr.id_nakl,
        pr.debet_kolotp,pr.debet,
        pr.kredit_kolotp,pr.kredit,
        ot.cena
      from provodki pr /*inner join naklo om
        on om.id_nakl=pr.id_nakl*/
        left join naklot ot
        on ot.id_nakld=pr.attr1
          and ot.id_nakl=pr.id_nakl
      where
        pr.id_schet=:id_schet_sebest and
        pr.tip<>1 and
        pr.sub1=:id_tovar_in and
        pr.sub2=:id_sklad_in and
        pr.sub3=:id_partiya_in
      into /*:id_uchet_politics,*/
        :id_partiya,:id_nakld,:id_nakl,
        :debet_kolotp,:debet,
        :kredit_kolotp,:kredit,
        :cena
    do begin
      select om.id,om.zatraty,om.nalog_nds,om.kurs,
          om.dat,om.tip,om.kurs_indirect,
          om.id_currency,om.id_currency_to
        from naklo om
        where om.id_nakl=:id_nakl
        into :id, :zatraty,:nalog_nds,:kurs,
          :dat,:tip,:kurs_indirect,
          :id_currency,:id_currency_to;
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
      /*Курс пересчёта цены прихода в себестоимость*/
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
            /*Найти курс из валюты детализации в валюту себестоимости*/
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
            /*Была ошибка. Валюты=usd, но курс руками выставлен 5.3,
            так на самом деле курс=1 id_nakl=133548*/
            if (kurs_from is null ) then begin
              kurs=null;
              /*sError = 'Ошибка в naklot_sebest2_count_pc. Курс. id_curr=' || coalesce(:id_currency,0)  || '. id_curr_to=' || coalesce(:id_currency_sebest,0);
              execute procedure error(sError);*/
            end
          end else begin
            /*Сумма храниться в той же валюте, что и себестоимость,
              тогда просто домножить на курс указанный в накладной*/
            kurs_from=1.0000;
            kurs_to=:kurs;
          end /*if (:id_currency<>:id_currency_schet) */
        end else begin
          kurs_from=1.0000;
          kurs_to=1.0000;
        end  /* if (:id_currency<>:id_currency_sebest) */
        kurs=:kurs_from/:kurs_to;
      end /*if (tip=1)*/

      suspend;
    end /*for select provodki*/
  end


  
 /* mode=2 -  тип отчёта : по позиции накладной */
  if ((mode=2) and (dat_to is null)) then begin
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
        pr.attr1=:id_nakld_in
      into /*:id_uchet_politics*/
         :id_partiya,:id_nakld,:id_nakl,
        :debet_kolotp,:debet,
        :kredit_kolotp,:kredit,
        :cena
    do begin
      select om.id,om.zatraty,om.nalog_nds,om.kurs,om.dat,om.tip
        from naklo om
        where om.id_nakl=:id_nakl
        into :id, :zatraty,:nalog_nds,:kurs,:dat,:tip;
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

      suspend;
    end /*for select provodki*/
  end

 /* mode=3 -  ттип отчёта: по номеру накладной и товару*/
 /*на вход id_nakld_in подавать id_nakl*/
  if ((mode=3) and (dat_to is null)) then begin
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
        /*:id_uchet_politics,*/
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

      /*Курс пересчёта цены прихода в себестоимость*/
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
            /*Найти курс из валюты детализации в валюту себестоимости*/
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
            /*Была ошибка. Валюты=usd, но курс руками выставлен 5.3,
            так на самом деле курс=1 id_nakl=133548*/
            if (kurs_from is null ) then begin
              kurs=null;
              /*sError = 'Ошибка в naklot_sebest2_count_pc. Курс. id_curr=' || coalesce(:id_currency,0)  || '. id_curr_to=' || coalesce(:id_currency_sebest,0);
              execute procedure error(sError);*/
            end
          end else begin
            /*Сумма храниться в той же валюте, что и себестоимость,
              тогда просто домножить на курс указанный в накладной*/
            kurs_from=1.0000;
            kurs_to=:kurs;
          end /*if (:id_currency<>:id_currency_schet) */
        end else begin
          kurs_from=1.0000;
          kurs_to=1.0000;
        end  /* if (:id_currency<>:id_currency_sebest) */
        kurs=:kurs_from/:kurs_to;
      end /*if (tip=1)*/

      suspend;
    end /*for select provodki*/
  end
end
^

SET TERM ; ^


