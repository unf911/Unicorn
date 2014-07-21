SET TERM ^ ;

CREATE or alter PROCEDURE REP_SEBEST4_REC_PC(
    ID_NAKL INTEGER,
    ID_TOVAR_IN INTEGER)
RETURNS (
    ID_POS INTEGER,
    ID_NAKLD INTEGER,
    ID_TOVAR INTEGER,
    ID_SKLAD INTEGER,
    TARA INTEGER,
    NALOG_NDS NUMERIC(15,4),
    KURS DOUBLE PRECISION,
    KURS2 DOUBLE PRECISION,
    SKIDKA NUMERIC(15,2),
    CENA NUMERIC(15,4),
    CENA_GRN NUMERIC(15,4),
    KOLOTP DOUBLE PRECISION,
    CENA_SEBEST NUMERIC(15,5),
    DAT TIMESTAMP,
    PRICE_MINUS_18_COMPARE DOUBLE PRECISION,
    ID_ANALOG INTEGER)
AS
  declare variable id_schet integer;
  declare variable id_schet_sebest integer;
  declare variable id_currency integer;
  declare variable id_currency_from integer;
  declare variable id_currency_tip integer;
  declare variable id_nakl2 integer;
  declare variable id_uchet_politics integer;
  declare variable id_sklad_seb integer;
  declare variable id_registr integer;
  declare variable id_registr_price integer;
  declare variable id_price_post integer;
  declare variable id_currency_price integer;
  declare variable include_nds_price integer;
  declare variable kurs_price double precision;
  declare variable dat_price date;
  declare variable id_nakl_price integer;
  declare variable cena_from_price double precision;
  declare variable cena_with_nds_in_price_currency double precision;
  
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
  select oid
    from get_oid_objects_pc('РЕГИСТРЫ СВЕДЕНИЙ',-100)
    into :id_registr;
  select oid
    from get_oid_objects_pc('РЕГИСТР ПРАЙСОВ',:id_registr)
    into :id_registr_price;
  /*Прайс УКК*/
  select k.id_price
    from klient_all_vw k
    where k.isdefault=1 and k.delmarked=0
    into :id_price_post;
  select s.id_currency,s.include_nds
    from spr_price_vw s
    where s.oid=:id_price_post
    into :id_currency_price,:include_nds_price;
  for
    select kurs,dat,nalog_nds,om.id_sklad,om.id_nakl
      from naklo om
      where om.parent_id_nakl=:id_nakl and
        om.posted=1 and om.delmarked=0 and om.tip=5
      order by dat, id_nakl
      into :kurs,:dat,:nalog_nds,:id_sklad,:id_nakl2
  do begin
    select dzero(kurs_from,kurs_to,1)
      from kurs_get_pc (:dat,:id_currency_from ,:id_currency_price,1)
      into :kurs_price;  
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
        ot.cena,ot.skidka,ot.kolotp,t.id_analog
      from naklot ot inner join tovar t
        on ot.id_tovar=t.oid
      where ot.id_nakl=:id_nakl2 and
        (ot.id_tovar between coalesce(:id_tovar_in,-2147483648)
          and coalesce(:id_tovar_in, 2147483647))
        /*$$IBEC$$ and t.tara<>1 $$IBEC$$*/
      order by ot.id_pos
      into :tara, :id_tovar,:id_pos,:id_nakld,
        :cena,:skidka,:kolotp,:id_analog
    do begin
      select Round(dzero(sum(pr.kredit),sum(pr.kredit_kolotp),0),5)
        from provodki pr
        where 
          pr.tip<>1 and
          pr.id_schet=:id_schet_sebest and
          pr.sub1=:id_tovar and
          pr.sub2=:id_sklad_seb and
          pr.id_nakl=:id_nakl2 and
          pr.attr1=:id_nakld and
          pr.kredit_kolotp>0
        into :CENA_SEBEST;
      cena_from_price=null;
      
      select  Round(r.resurs1,2),    r.dat,r.id_nakl
        from rep_registry_last_pc(:id_registr_price,:dat,
          :id_analog, :id_price_post,null) r
        into :cena_from_price, :dat_price,:id_nakl_price;
      if (:include_nds_price=1) then begin
        cena_with_nds_in_price_currency=Round(cena*(1+nalog_nds),2);
      end else begin/*if (include_nds_price=1)*/
        cena_with_nds_in_price_currency=Round(cena,2);
      end/*if (include_nds_price=1)*/
      if (:tara=1 ) then begin
        cena_with_nds_in_price_currency=Round(cena_with_nds_in_price_currency*kurs_price,2);
      end else begin
        cena_with_nds_in_price_currency=Round(cena_with_nds_in_price_currency*kurs*kurs_price,2);
      end
      /*price_minus_18_compare=null;
      if (cena_from_price is not null) then begin*/
        price_minus_18_compare= Round((1-dzero(
          cena_with_nds_in_price_currency,
          cena_from_price,0))*100,2);
      /*end*/

      cena_grn=case when tara=1 then cena else cena*kurs end;
      suspend;
    end /*for tovar*/
  end /*for nakl*/
end^

SET TERM ; ^

DESCRIBE PROCEDURE REP_SEBEST4_REC_PC
'Используется в Формы ввода >> Себестоимость2.
Устарело.
На удаление';

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_SEBEST4_REC_PC;

GRANT SELECT ON KLIENT_ALL_VW TO PROCEDURE REP_SEBEST4_REC_PC;

GRANT SELECT ON SPR_PRICE_VW TO PROCEDURE REP_SEBEST4_REC_PC;

GRANT SELECT ON NAKLO TO PROCEDURE REP_SEBEST4_REC_PC;

GRANT EXECUTE ON PROCEDURE KURS_GET_PC TO PROCEDURE REP_SEBEST4_REC_PC;

GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_SETTINGS_PC TO PROCEDURE REP_SEBEST4_REC_PC;

GRANT SELECT ON NAKLOT TO PROCEDURE REP_SEBEST4_REC_PC;

GRANT SELECT ON TOVAR TO PROCEDURE REP_SEBEST4_REC_PC;

GRANT SELECT ON PROVODKI TO PROCEDURE REP_SEBEST4_REC_PC;

GRANT EXECUTE ON PROCEDURE REP_REGISTRY_LAST_PC TO PROCEDURE REP_SEBEST4_REC_PC;

GRANT EXECUTE ON PROCEDURE REP_SEBEST4_REC_PC TO PROCEDURE REP_DOLG_SEBEST_PC;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_REC_PC TO PROCEDURE TEST_REP_SEBEST4_REC;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_REC_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_REC_PC TO BOSSES;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_REC_PC TO POWER_USER;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_REC_PC TO SNAB;
