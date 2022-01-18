SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_SEBEST_SKLAD_DET_PC (
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
declare variable id_currency_tip integer;
declare variable id_currency integer;
declare variable tree_oid_sklad integer;
declare variable tree_oid_tovar integer;
declare variable debet double precision;
declare variable kredit double precision;
declare variable debet_kolotp double precision;
declare variable kredit_kolotp double precision;
begin
  select oid
    from get_oid_objects_pc('ТИП СЧЕТА',-100)
    into :id_schet;
  select oid
    from get_oid_objects_pc('ТИП ВАЛЮТ',-100)
    into :id_currency_tip;
  select oid
    from get_oid_objects_pc('USD',:id_currency_tip)
    into :id_currency;
  select oid
    from get_oid_objects_pc('ТИП НАЗВАНИЯ СКЛАДОВ',-100)
    into :tree_oid_sklad;
  select oid
    from get_oid_objects_pc('ТИП ТОВАРЫ',-100)
    into :tree_oid_tovar;
    
    
    
 /* mode=1 -  тип отчёта : по партии */
  if ((mode=1) and (dat_to is null)) then begin
    for
      select pr.sub3,pr.sub4,pr.sub5,pr.id_nakl,
        pr.debet_kolotp,pr.debet,
        pr.kredit_kolotp,pr.kredit,
        ot.cena
      from provodki pr /*inner join naklo om
        on om.id_nakl=pr.id_nakl*/
        left join naklot ot
        on ot.id_nakld=pr.sub5
      where
        pr.tip<>1 and
        pr.sub1=:id_tovar_in and
        pr.sub2=:id_sklad_in and
        pr.sub4=:id_partiya_in
      into :id_uchet_politics,:id_partiya,:id_nakld,:id_nakl,
        :debet_kolotp,:debet,
        :kredit_kolotp,:kredit,
        :cena
    do begin
      select om.id,om.zatraty,om.nalog_nds,om.kurs,om.dat,om.tip
        from naklo om
        where om.id_nakl=:id_nakl
        into :id, :zatraty,:nalog_nds,:kurs,:dat,:tip;
      if (kredit_kolotp>0) then begin
        kolotp=:kredit_kolotp;
        sebest=:kredit;
      end
      if (debet_kolotp>0) then begin
        kolotp=-:debet_kolotp;
        sebest=:debet;
      end

      suspend;
    end /*for select provodki*/
  end


  
 /* mode=2 -  тип отчёта : по позиции накладной */
  if ((mode=2) and (dat_to is null)) then begin
    for
      select pr.sub3,pr.sub4,pr.sub5,pr.id_nakl,
        pr.debet_kolotp,pr.debet,
        pr.kredit_kolotp,pr.kredit,
        ot.cena
      from provodki pr 
        inner join naklot ot
        on ot.id_nakld=pr.sub5
      where
        pr.tip<>1 and
        pr.sub1=:id_tovar_in and
        pr.sub2=:id_sklad_in and
        pr.sub5=:id_nakld_in
      into :id_uchet_politics,:id_partiya,:id_nakld,:id_nakl,
        :debet_kolotp,:debet,
        :kredit_kolotp,:kredit,
        :cena
    do begin
      select om.id,om.zatraty,om.nalog_nds,om.kurs,om.dat,om.tip
        from naklo om
        where om.id_nakl=:id_nakl
        into :id, :zatraty,:nalog_nds,:kurs,:dat,:tip;
      if (kredit_kolotp>0) then begin
        kolotp=:kredit_kolotp;
        sebest=:kredit;
      end
      if (debet_kolotp>0) then begin
        kolotp=-:debet_kolotp;
        sebest=:debet;
      end

      suspend;
    end /*for select provodki*/
  end

 /* mode=2 -  ттип отчёта: по номеру накладной и товару*/
 /*на вход id_nakld_in подавать id_nakl*/
  if ((mode=3) and (dat_to is null)) then begin
    for
      select pr.sub3,pr.sub4,pr.sub5,pr.id_nakl,
        pr.debet_kolotp,pr.debet,
        pr.kredit_kolotp,pr.kredit,
        ot.cena
      from provodki pr 
        inner join naklot ot
        on ot.id_nakld=pr.sub5
      where
        pr.tip<>1 and
        pr.sub1=:id_tovar_in and
        pr.sub2=:id_sklad_in and
        ot.id_nakl=:id_nakld_in
      into :id_uchet_politics,:id_partiya,:id_nakld,:id_nakl,
        :debet_kolotp,:debet,
        :kredit_kolotp,:kredit,
        :cena
    do begin
      select om.id,om.zatraty,om.nalog_nds,om.kurs,om.dat,om.tip
        from naklo om
        where om.id_nakl=:id_nakl
        into :id, :zatraty,:nalog_nds,:kurs,:dat,:tip;
      if (kredit_kolotp>0) then begin
        kolotp=:kredit_kolotp;
        sebest=:kredit;
      end
      if (debet_kolotp>0) then begin
        kolotp=-:debet_kolotp;
        sebest=:debet;
      end

      suspend;
    end /*for select provodki*/
  end
end
^

SET TERM ; ^


