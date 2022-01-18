SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLOT_SEBEST2_NAKLR_ASP_PC (
    id_nakld integer,
    id_uchet_politics integer,
    id_schet integer)
returns (
    sebest double precision,
    id_partiya bigint)
as
declare variable cena double precision;
declare variable id_nakl integer;
declare variable id_tovar integer;
declare variable kolotp double precision;
declare variable id_sklad_nakl integer;
declare variable kurs double precision;
declare variable id_currency integer;
declare variable nalog_nds double precision;
declare variable zatraty double precision;
declare variable nalog_nds_def numeric(15,4);
declare variable kurs_from double precision;
declare variable kurs_to double precision;
declare variable dat date;
declare variable id_sklad_seb integer;
declare variable itemp integer;
declare variable serror varchar(100);
declare variable id_currency_sebest integer;
declare variable include_nds integer;
declare variable include_zatraty integer;
declare variable id_currency_schet integer;
declare variable tip integer;
declare variable id_schet_sebest integer;
declare variable id_currency_tip integer;
declare variable include_nds_from integer;
declare variable include_zatraty_from integer;
declare variable id_izg integer;
declare variable id_zak integer;
declare variable id_currency_to integer;
declare variable kurs_indirect integer;
declare variable delmarked integer;
BEGIN
  SELECT id_nakl,cena,id_tovar,round(kolotp,3)
    FROM naklot ot
    WHERE ot.id_nakld=:id_nakld
    INTO :id_nakl,:cena,:id_tovar,:kolotp;
  /*спец режим для излишков и недостач по себест
    он только информирует о полученной себест, т.е. как submode=0*/
  SELECT id_sklad,kurs,id_currency,nalog_nds,dat,
      zatraty,tip,id_izg,id_zak,
      id_currency_to,kurs_indirect,  delmarked
    FROM naklo om
    WHERE om.id_nakl=:id_nakl
    INTO :id_sklad_nakl,:kurs,:id_currency,:nalog_nds,:dat,
      :zatraty,:tip,:id_izg,:id_zak,
      :id_currency_to,:kurs_indirect,:delmarked;
  /*Пустые позиции не отгружать*/

    
  IF (z(kolotp)=0 ) THEN BEGIN
    EXIT;
  END
  id_schet_sebest=id_schet;

  IF (id_uchet_politics IS NULL) THEN BEGIN
    sError = 'Ошибка в n_s2_c_pc. Укажите учётную политику. id_nakld='||COALESCE(:id_nakld,0);
    EXECUTE PROCEDURE error(sError);
  END
  SELECT oid
    FROM get_oid_objects_pc('ТИП ВАЛЮТ',-100)
    INTO :id_currency_tip;
  SELECT FIRST 1 id_sklad,id_uchet_politics
    FROM sklad_sebest_settings_pc(:id_sklad_nakl,:id_uchet_politics)
    INTO :id_sklad_seb,:id_uchet_politics;    

  if (delmarked<>0) then begin
    exit;
  end

  iTemp = NULL;
  SELECT u.id_currency_sebest,
      u.include_nds,u.include_zatraty,u.oid
    FROM spr_uchet_politics_vw u
    WHERE u.oid=:id_uchet_politics AND u.delmarked=0
    INTO :id_currency_sebest,
      :include_nds,:include_zatraty,:iTemp;
  IF (iTemp IS NULL) THEN BEGIN
    sError = 'Ошибка в naklot_sebest2_count_pc. №1. id_uchet_politics='|| COALESCE(:id_uchet_politics,0);
    EXECUTE PROCEDURE error(sError);
  END
  

  /*Приход*/

    /*Сумма любой приходной накладной храниться в гривнах
     а цены в детализации в
     валюте указанной в naklo.id_currency,при этом курс
     пересчёта на гривну в naklo.kurs.
     Если же валюта себестоимости не совпадает с
     валютой накладной naklo.id_currency, то
     пересчёт ведётся через гривну. Т.е. в
     таблице курс должен быть указан курс пересчёта
     гривны в эту валюту себестоимости
    */
    SELECT oid
      FROM get_oid_objects_pc('UAH',:id_currency_tip)
      INTO :id_currency_schet;      
    IF (:id_currency_to IS NULL) THEN BEGIN
      id_currency_to=:id_currency_schet;
    END
    execute procedure get_kurs_for_sebest_pc(:dat,:kurs,:kurs_indirect,
      :id_currency, :id_currency_to,
      :id_currency_sebest)
      returning_values :kurs_from, :kurs_to;

/*$$IBEC$$     IF (:id_currency<>:id_currency_sebest) THEN BEGIN
      IF (:id_currency_to<>:id_currency_sebest) THEN BEGIN
         $$IBEC$$*//*Найти курс из валюты детализации в валюту себестоимости*//*$$IBEC$$ 
        SELECT kurs_from,kurs_to
          FROM kurs_get_pc (:dat, :id_currency_to,:id_currency_sebest,1)
          INTO :kurs_from,:kurs_to;
        IF (id_currency_to<>id_currency) THEN BEGIN
          IF (:kurs_indirect=1) THEN BEGIN
            kurs_to=:kurs_to*:kurs;
          END ELSE BEGIN
            kurs_from=:kurs_from*:kurs;
          END
        END
         $$IBEC$$*//*Была ошибка. Валюты=usd, но курс руками выставлен 5.3,
        так на самом деле курс=1 id_nakl=133548*//*$$IBEC$$ 
        IF (kurs_from IS NULL ) THEN BEGIN
          sError = 'Ошибка в naklot_sebest2_count_pc. Курс. id_curr=' || COALESCE(:id_currency,0)  || '. id_curr_to=' || COALESCE(:id_currency_sebest,0);
          EXECUTE PROCEDURE error(sError);
        END
      END ELSE BEGIN
         $$IBEC$$*//*Сумма храниться в той же валюте, что и себестоимость,
          тогда просто домножить на курс указанный в накладной*//*$$IBEC$$ 
        kurs_from=1.0000;
        kurs_to=:kurs;
      END  $$IBEC$$*//*if (:id_currency<>:id_currency_schet) *//*$$IBEC$$ 
    END ELSE BEGIN
      kurs_from=1.0000;
      kurs_to=1.0000;
    END   $$IBEC$$*//* if (:id_currency<>:id_currency_sebest) */
    IF (:nalog_nds=0) THEN BEGIN
      /*Если Телтекс поставляет с ндс=0, значит на считается
      что в цене уже есть ндс*/
      /*И если в политике учёта нужна себест с ндс*/
      /*Иначе в накл 193534 id_pos=7 на себест накручивается ндс в бух учёте*/
      IF (include_nds=1) THEN BEGIN
        include_nds_from=1;
      END ELSE BEGIN
        include_nds_from=0;
      END
    END ELSE BEGIN
      include_nds_from=0;
    END
    include_zatraty_from=0;


    sebest= /*Round(*/:cena*:kurs_from/:kurs_to/*,2)*/;
    /*Храниться сумма себестоимости*/
    sebest=:sebest*:kolotp;
    IF (:include_nds_from<>:include_nds) THEN BEGIN
      nalog_nds_def=0;
      SELECT nds
        FROM get_nds(:dat, NULL)
        INTO :nalog_nds_def;
      IF (:include_nds_from=1 AND :include_nds<>1) THEN BEGIN
        sebest=/*Round(*/sebest/(1+:nalog_nds_def)/*,2)*/;
      END
      IF (:include_nds_from<>1 AND :include_nds=1) THEN BEGIN
        sebest=/*Round(*/sebest*(1+:nalog_nds_def)/*,2)*/;
      END      
    END /*if (include_nds_from<>include_nds)*/
    IF (:include_zatraty_from<>:include_zatraty) THEN BEGIN
      IF (:include_zatraty_from=1 AND :include_zatraty<>1) THEN BEGIN
        sebest=/*Round(*/sebest/(1+(z(:zatraty)/100))/*,2)*/;
      END
      IF (:include_zatraty_from<>1 AND :include_zatraty=1) THEN BEGIN
        sebest=/*Round(*/sebest*(1+(z(:zatraty)/100))/*,2)*/;
      END
    END /*if (include_zatraty_from<>include_zartaty)*/
    sebest=Round(sebest,2);/*округляется только сумма себестоимости*/
    /*Реальная запись в проводки*/

    id_partiya=:id_nakld-(floor(:id_nakld/10000)*10000);
    id_partiya=((extractyear(:dat)-2000)*100000000)+(extractmonth(:dat)*1000000)+extractday(:dat)*10000+z(:id_partiya);
    INSERT INTO provodki(id_schet,id_nakl,tip,dat,
        debet,debet_kolotp,
        sub1,sub2,sub3,sub4,sub5,attr1)
      VALUES(:id_schet_sebest,:id_nakl, :tip,:dat,
        :sebest,:kolotp,
        :id_tovar,:id_sklad_seb, :id_partiya,:id_zak,:id_izg,:id_nakld);

    SUSPEND;
end
^

SET TERM ; ^


