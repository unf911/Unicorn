SET TERM ^ ;

CREATE or alter PROCEDURE REP_SEBEST4_REC_NOPRICE_PC(
    ID_NAKL INTEGER,
    ID_TOVAR_IN INTEGER,
    DAT_TO_IN TIMESTAMP)
RETURNS (
    ID_POS INTEGER,
    ID_NAKLD INTEGER,
    ID_TOVAR INTEGER,
    NALOG_NDS NUMERIC(15,4),
    KURS2 DOUBLE PRECISION,
    CENA_GRN NUMERIC(15,4),
    KOLOTP DOUBLE PRECISION,
    CENA_SEBEST NUMERIC(15,5),
    DAT TIMESTAMP)
AS
  declare variable id_schet integer;
  declare variable id_schet_sebest integer;
  declare variable id_currency integer;
  declare variable id_currency_from integer;
  declare variable id_currency_tip integer;
  declare variable id_nakl2 integer;
  declare variable id_uchet_politics integer;
  declare variable id_sklad_seb integer;
  declare variable kurs_price double precision;

  declare variable cena_with_nds_in_price_currency double precision;
  declare variable kurs double precision;
  declare variable id_sklad integer;
  declare variable cena double precision;
  declare variable skidka double precision;
  declare variable id_analog integer;
  declare variable tara integer;
  
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
  select oid
    from get_oid_objects_pc('UAH',:id_currency_tip)
    into :id_currency_from;
  select oid
    from get_oid_objects_pc('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100)
    into :id_uchet_politics;
  select oid
    from get_oid_objects_pc('УПРАВЛЕНЧЕСКИЙ УЧЁТ',:id_uchet_politics)
    into :id_uchet_politics;

  for
    select kurs,dat,nalog_nds,om.id_sklad,om.id_nakl
      from naklo om
      where om.parent_id_nakl=:id_nakl and
        om.posted=1 and om.delmarked=0 and
        om.tip=5 and om.dat<=:dat_to_in
        
      order by dat, id_nakl
      into :kurs,:dat,:nalog_nds,:id_sklad,:id_nakl2
  do begin

    select id_sklad,id_uchet_politics
      from sklad_sebest_settings_pc(:id_sklad, :id_uchet_politics)
      into :id_sklad_seb,:id_uchet_politics;
    /*Марина сказала что курс себестоимости должен браться из
      справочника курсов, а не из курса складской накладной,
      если он был там указан*/
    select dzero(kurs_to,kurs_from,1)
      from kurs_get_pc (:dat, :id_currency_from,:id_currency,1)
      into :kurs2;      
    for
      /*Видно и тару тоже*/
      select t.tara,ot.id_tovar,ot.id_pos,ot.id_nakld,
        ot.cena,ot.skidka,ot.kolotp,t.id_analog,
        Round(dzero(sum(pr.kredit),sum(pr.kredit_kolotp),0),5)
      from naklot ot inner join tovar t
        inner join provodki pr on ot.id_nakl=pr.id_nakl and ot.id_nakld=pr.attr1
        on ot.id_tovar=t.oid
      where ot.id_nakl=:id_nakl2 and
        (ot.id_tovar between coalesce(:id_tovar_in,-2147483648)
          and coalesce(:id_tovar_in, 2147483647)) and
        pr.tip<>1 and
        pr.id_schet=:id_schet_sebest and
        pr.sub2=:id_sklad_seb and
        pr.kredit_kolotp>0
      group by t.tara,ot.id_tovar,ot.id_pos,ot.id_nakld,
        ot.cena,ot.skidka,ot.kolotp,t.id_analog
          
      order by ot.id_pos
      into :tara, :id_tovar,:id_pos,:id_nakld,
        :cena,:skidka,:kolotp,:id_analog,
        :cena_sebest
    do begin
      if (:tara=1 ) then begin
        cena_with_nds_in_price_currency=Round(cena_with_nds_in_price_currency*kurs_price,2);
      end else begin
        cena_with_nds_in_price_currency=Round(cena_with_nds_in_price_currency*kurs*kurs_price,2);
      end

      cena_grn=case when tara=1 then cena else cena*kurs end;
      suspend;
    end /*for tovar*/
  end /*for nakl*/
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_SEBEST4_REC_NOPRICE_PC;

GRANT SELECT ON NAKLO TO PROCEDURE REP_SEBEST4_REC_NOPRICE_PC;

GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_SETTINGS_PC TO PROCEDURE REP_SEBEST4_REC_NOPRICE_PC;

GRANT EXECUTE ON PROCEDURE KURS_GET_PC TO PROCEDURE REP_SEBEST4_REC_NOPRICE_PC;

GRANT SELECT ON NAKLOT TO PROCEDURE REP_SEBEST4_REC_NOPRICE_PC;

GRANT SELECT ON TOVAR TO PROCEDURE REP_SEBEST4_REC_NOPRICE_PC;

GRANT SELECT ON PROVODKI TO PROCEDURE REP_SEBEST4_REC_NOPRICE_PC;

GRANT EXECUTE ON PROCEDURE REP_SEBEST4_REC_NOPRICE_PC TO PROCEDURE REP_DOLG_SEBEST_PC;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_REC_NOPRICE_PC TO PROCEDURE REP_SEBEST4_PC;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_REC_NOPRICE_PC TO SYSDBA;
