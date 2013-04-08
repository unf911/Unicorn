SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLOT_SEBEST2_COUNT_PC(
    ID_NAKLD INTEGER,
    ID_UCHET_POLITICS INTEGER,
    ID_SCHET INTEGER,
    MODE INTEGER,
    SUBMODE INTEGER)
RETURNS (
    SEBEST DOUBLE PRECISION,
    ID_PARTIYA INTEGER)
AS
DECLARE VARIABLE cena DOUBLE PRECISION;
DECLARE VARIABLE id_nakl INTEGER;
DECLARE VARIABLE id_sklad_seb_to INTEGER;
DECLARE VARIABLE id_uchet_politics_to INTEGER;
DECLARE VARIABLE id_tovar INTEGER;
DECLARE VARIABLE kolotp DOUBLE PRECISION;
DECLARE VARIABLE id_sklad_nakl INTEGER;
DECLARE VARIABLE kurs DOUBLE PRECISION;
DECLARE VARIABLE id_currency INTEGER;
DECLARE VARIABLE nalog_nds DOUBLE PRECISION;
DECLARE VARIABLE zatraty DOUBLE PRECISION;
DECLARE VARIABLE nalog_nds_def NUMERIC(15,4);
DECLARE VARIABLE kurs_from DOUBLE PRECISION;
DECLARE VARIABLE kurs_to DOUBLE PRECISION;
DECLARE VARIABLE dat DATE;
DECLARE VARIABLE id_sklad_seb INTEGER;
DECLARE VARIABLE itemp INTEGER;
DECLARE VARIABLE serror VARCHAR(100);
DECLARE VARIABLE id_currency_sebest INTEGER;
DECLARE VARIABLE include_nds INTEGER;
DECLARE VARIABLE include_zatraty INTEGER;
DECLARE VARIABLE id_currency_schet INTEGER;
DECLARE VARIABLE tip INTEGER;
DECLARE VARIABLE id_schet_sebest INTEGER;
DECLARE VARIABLE flag_more INTEGER;
DECLARE VARIABLE kredit_kolotp DOUBLE PRECISION;
DECLARE VARIABLE kredit DOUBLE PRECISION;
DECLARE VARIABLE partiya_kolotp DOUBLE PRECISION;
DECLARE VARIABLE sum_partiya_kolotp DOUBLE PRECISION;
DECLARE VARIABLE id_currency_tip INTEGER;
DECLARE VARIABLE include_nds_from INTEGER;
DECLARE VARIABLE include_zatraty_from INTEGER;
DECLARE VARIABLE id_izg INTEGER;
DECLARE VARIABLE id_zak INTEGER;
DECLARE VARIABLE id_sklad_to INTEGER;
DECLARE VARIABLE id_currency_to INTEGER;
DECLARE VARIABLE kurs_indirect INTEGER;
DECLARE VARIABLE transh_in_currency DOUBLE PRECISION;
DECLARE VARIABLE transh_in_grn DOUBLE PRECISION;
DECLARE VARIABLE id_post INTEGER;
DECLARE VARIABLE parent_id_nakl INTEGER;
DECLARE VARIABLE tip_prixod INTEGER;
DECLARE VARIABLE flag_end_of_partiya INTEGER;
declare variable dat_report date;
declare variable delmarked integer;
BEGIN
  SELECT id_nakl,cena,id_tovar,round(kolotp,3)
    FROM naklot ot
    WHERE ot.id_nakld=:id_nakld
    INTO :id_nakl,:cena,:id_tovar,:kolotp;
  /*спец режим для излишков и недостач по себест
    он только информирует о полученной себест, т.е. как submode=0*/
  IF (submode=3) THEN BEGIN
    id_nakl=:id_nakld;
    id_izg=NULL;
    id_zak=NULL;
    submode=0;
  END
  SELECT id_sklad,kurs,id_currency,nalog_nds,dat,
      zatraty,tip,id_izg,id_zak,id_sklad_to,
      id_currency_to,kurs_indirect,  parent_id_nakl,delmarked
    FROM naklo om
    WHERE om.id_nakl=:id_nakl
    INTO :id_sklad_nakl,:kurs,:id_currency,:nalog_nds,:dat,
      :zatraty,:tip,:id_izg,:id_zak,:id_sklad_to,
      :id_currency_to,:kurs_indirect,:parent_id_nakl,:delmarked;
  /*Пустые позиции не отгружать*/
  IF (submode=2) THEN BEGIN
    /*Для себестоимости реальной
    не нужно субконто по фирме.
    Для этого ставим признак фирмы в null*/
    id_izg=NULL;
    id_zak=NULL;
    submode=1;
  END
  
  

    
  IF (z(kolotp)=0 AND mode<>2) THEN BEGIN
    EXIT;
  END
  IF (tip=1) THEN BEGIN
    SELECT oid
      FROM GET_OID_OBJECTS_PC('ПРИХОДНЫЕ СКЛАДСКИЕ НАКЛАДНЫЕ',-100)
      INTO :tip;
    tip_prixod=:tip;
/*$$IBEC$$     select oid
      from get_oid_objects_pc('ТИП СЕБЕСТОИМОСТЬ',-100)
      into :tip;  
    select oid
      from get_oid_objects_pc('НАЧАЛЬНЫЕ ОСТАТКИ',:tip)
      into :tip; $$IBEC$$*/       
  END
  id_schet_sebest=id_schet;

  /*Возврат приходной накладной*/
  IF (mode=2 AND submode=1) THEN BEGIN
    DELETE FROM provodki pr
      WHERE pr.id_schet=:id_schet_sebest
        AND pr.id_nakl=:id_nakl
        AND pr.attr1=:id_nakld
        AND pr.tip=:tip;
    EXIT;
  END
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
  IF (mode IN (4,11)) THEN BEGIN
    /*При хранении узнаём политику склада назначения*/
    SELECT FIRST 1 id_sklad,id_uchet_politics
      FROM sklad_sebest_settings_pc(:id_sklad_to,:id_uchet_politics)
      INTO :id_sklad_seb_to,:id_uchet_politics_to;
/*    id_sklad_nakl=:id_sklad_nakl;*/
  END

  if (delmarked<>0) then begin
    exit;
  end

  IF ((mode IN (4,11)) AND (z(id_uchet_politics_to)<>z(id_uchet_politics))) THEN BEGIN
    sError = 'Ошибка в n_s2_c_pc. Учётная политика хранения. id_nakld='||
      COALESCE(:id_nakl,0)||
      'up='||
      COALESCE(:id_uchet_politics_to,0) ||
      'id_up_to' ||
      COALESCE(:id_uchet_politics,0);
    EXECUTE PROCEDURE error(sError);
  END
  
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
  
  /*Чтобы для всех складских приходов вызывать режим 1, а процедура сама
    разберётся откуда брать себестоимость*/
  IF (mode=1 AND parent_id_nakl IS NULL AND z(tip)=z(tip_prixod)) THEN BEGIN
    mode=5;
  END
  /*Приход*/
  IF (mode IN (1,8,9)) THEN BEGIN
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
    IF (:id_currency<>:id_currency_sebest) THEN BEGIN
      IF (:id_currency_to<>:id_currency_sebest) THEN BEGIN
        /*Найти курс из валюты детализации в валюту себестоимости*/
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
        /*Была ошибка. Валюты=usd, но курс руками выставлен 5.3,
        так на самом деле курс=1 id_nakl=133548*/
        IF (kurs_from IS NULL ) THEN BEGIN
          sError = 'Ошибка в naklot_sebest2_count_pc. Курс. id_curr=' || COALESCE(:id_currency,0)  || '. id_curr_to=' || COALESCE(:id_currency_sebest,0);
          EXECUTE PROCEDURE error(sError);
        END
      END ELSE BEGIN
        /*Сумма храниться в той же валюте, что и себестоимость,
          тогда просто домножить на курс указанный в накладной*/
        kurs_from=1.0000;
        kurs_to=:kurs;
      END /*if (:id_currency<>:id_currency_schet) */
    END ELSE BEGIN
      kurs_from=1.0000;
      kurs_to=1.0000;
    END  /* if (:id_currency<>:id_currency_sebest) */
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
    /*Расчёт бух затрат на товар*/
    IF (mode=8) THEN BEGIN
      SELECT SUM(nds)
        FROM naklp_zatr_vw om INNER JOIN
          spr_statya_vw s ON s.oid=om.id_sklad_to
        WHERE om.parent_id_nakl=:id_nakl AND om.delmarked=0 AND
          s.is_bux=1 AND s.is_for_tovar=1
        INTO :zatraty;
      SELECT z(SUM(r.transh_in_currency)),z(SUM(r.transh_in_grn))
        FROM rep_naklpbux_to_grn_convert_pc(:id_nakl,0) r
        INTO :transh_in_currency,:transh_in_grn;
      kurs_from=dzero(z(transh_in_grn),z(transh_in_currency),1);
      kurs_to=1.000;
      zatraty=(dzero(z(:kurs)*(z(:zatraty)+z(:transh_in_grn)),z(:transh_in_grn),0)-1)*100;
      /*zatraty=dzero((1+z(:nalog_nds))*(z(:zatraty))*100,z(:transh_in_grn),0);*/
      /*    zatraty=z(Round(dzero(:zatraty,:nds,0)*100,2));*/
    END
    /*Расчёт бух затрат на тару*/
    IF (mode=9) THEN BEGIN
      SELECT SUM(nds)
        FROM naklp_zatr_vw om INNER JOIN
          spr_statya_vw s ON s.oid=om.id_sklad_to
        WHERE om.parent_id_nakl=:id_nakl AND om.delmarked=0 AND
          s.is_bux=1 AND s.is_for_tara=1 AND s.is_bux=1
        INTO :zatraty;
      SELECT z(SUM(r.transh_in_currency)),z(SUM(r.transh_in_grn))
        FROM rep_naklpbux_to_grn_convert_pc(:id_nakl,0) r
        INTO :transh_in_currency,:transh_in_grn;
      zatraty=(dzero(z(:kurs)*(z(:zatraty)+z(:transh_in_grn)),z(:transh_in_grn),0)-1)*100;
      /*zatraty=dzero((1+z(:nalog_nds))*(z(:zatraty))*100,z(:transh_in_grn),0);*/
      /*zatraty=z(Round(dzero(:zatraty,:nds,0)*100,2));*/
    END
  END /*if mode=1*/
  
  /*Приход с ценой из справочника себестоимости*/
  IF (mode IN (5,7)) THEN BEGIN
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
      FROM get_oid_objects_pc('USD',:id_currency_tip)
      INTO :id_currency;
    SELECT oid
      FROM get_oid_objects_pc('UAH',:id_currency_tip)
      INTO :id_currency_schet;      
      
    IF (:id_currency<>:id_currency_sebest) THEN BEGIN
      IF (:id_currency_schet<>:id_currency_sebest) THEN BEGIN
        /*Найти курс из валюты детализации в валюту себестоимости*/
        SELECT kurs_from,kurs_to
          FROM kurs_get_pc (:dat, :id_currency,:id_currency_sebest,1)
          INTO :kurs_from,:kurs_to;
        IF (kurs_from IS NULL ) THEN BEGIN
          sError = 'Ошибка в naklot_sebest_count_pc. Курс не найден. id_curr_from=' || CAST(z(:id_currency) AS VARCHAR(8)) || '. id_curr_to=' || CAST(z(:id_currency_sebest) AS VARCHAR(8));
          EXECUTE PROCEDURE error(sError);
        END
      END ELSE BEGIN
        /*Сумма храниться в той же валюте, что и себестоимость,
          тогда просто домножить на курс указанный в накладной*/
        kurs_from=1.0000;
        kurs_to=:kurs;
      END /*if (:id_currency<>:id_currency_schet) */
    END ELSE BEGIN
      kurs_from=1.0000;
      kurs_to=1.0000;
    END  /* if (:id_currency<>:id_currency_sebest) */
    /*Затраты и НДС уже включены с себестоимость из справочника*/

    cena = NULL ;
    SELECT FIRST 1 s.sebest
      FROM sebest s
      WHERE s.id_tovar=:id_tovar AND s.dat<=:dat
      ORDER BY s.dat DESC
      INTO :cena;
    include_nds_from=1;
    include_zatraty_from=1;
  END /*if mode=5*/
  /*Приход на склад по накладной хранения */  
  IF (mode=11) THEN BEGIN
  
    /*id_sklad_seb=id_sklad_seb_to;*/
     /*Найти курс*/ 
    SELECT kurs_from,kurs_to
      FROM kurs_get_pc (:dat, :id_currency_sebest,:id_currency_sebest,1)
      INTO :kurs_from,:kurs_to;
    IF (kurs_from IS NULL ) THEN BEGIN
      sError = 'Ошибка в naklot_sebest2_count_pc. Курс не найден2. id_curr_from=' || CAST(z(:id_currency) AS VARCHAR(8)) || '. id_curr_to=' || COALESCE(:id_currency_sebest,0);
      EXECUTE PROCEDURE error(sError);
    END
    include_nds_from=:include_nds;
    include_zatraty_from=:include_zatraty;
    id_zak=id_izg;
    nalog_nds_def=0;
    SELECT nds
      FROM get_nds(:dat, NULL)
      INTO :nalog_nds_def;    
    id_partiya=NULL;
    FOR
      SELECT   pr.kredit_kolotp,
        Round(dzero(pr.kredit,pr.kredit_kolotp,0),2),
        pr.kredit_kolotp,
        pr.sub5,
        pr.kredit
      FROM provodki pr
      WHERE 
        pr.tip<>1 AND
        pr.id_schet=:id_schet_sebest AND
        pr.sub1=:id_tovar AND
        pr.sub2=:id_sklad_seb AND
        pr.id_nakl=:id_nakl AND
        pr.attr1=:id_nakld AND
        pr.kredit_kolotp>0
      INTO :sum_partiya_kolotp,:cena,
        :partiya_kolotp,:id_post,:kredit
    DO BEGIN
      sebest=kredit;
/*$$IBEC$$       sebest= :cena*:kurs_from/:kurs_to;
       $$IBEC$$*/ /*Храниться сумма себестоимости*/ /*$$IBEC$$ 
      sebest=:sebest*:partiya_kolotp; $$IBEC$$*/
      IF (:include_nds_from<>:include_nds) THEN BEGIN

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
      sebest=Round(sebest,4); /*округляется только сумма себестоимости*/
      /*Реальная запись в проводки*/
      IF (submode=1) THEN BEGIN
        IF (id_partiya IS NULL)  THEN BEGIN
          id_partiya=:id_nakld-(floor(:id_nakld/10000)*10000);
          id_partiya=((extractyear(:dat)-2000)*100000000)+(extractmonth(:dat)*1000000)+extractday(:dat)*10000+z(:id_partiya);
        END ELSE BEGIN
          id_partiya=z(id_partiya)+1;
        END
        INSERT INTO provodki(id_schet,id_nakl,tip,dat,
            debet,debet_kolotp,
            sub1,sub2,sub3,sub4,sub5,attr1)
          VALUES(:id_schet_sebest,:id_nakl, :tip,:dat,
            :sebest,:partiya_kolotp,
            :id_tovar,:id_sklad_seb_to, :id_partiya,:id_zak,:id_post,:id_nakld);
      END /*  if (submode=1)*/
    END /*for provodki*/
    /*Расчёт себестоимости итоговой*/
    SELECT
        Round(dzero(SUM(pr.debet),SUM(pr.debet_kolotp),0),2)
      FROM provodki pr
      WHERE 
        pr.tip<>1 AND
        pr.id_schet=:id_schet_sebest AND
        pr.sub1=:id_tovar AND
        pr.sub2=:id_sklad_seb_to AND
        pr.id_nakl=:id_nakl AND
        pr.attr1=:id_nakld AND
        pr.debet_kolotp>0
      INTO :sebest;
    SUSPEND;    
  END
  /*Приход на склад по накладной хранения */
  IF (mode=4) THEN BEGIN
    sum_partiya_kolotp=NULL;
    SELECT
        SUM(pr.kredit_kolotp),
        Round(dzero(SUM(pr.kredit),SUM(pr.kredit_kolotp),0),2),
        MIN(pr.sub5)
      FROM provodki pr
      WHERE 
        pr.tip<>1 AND
        pr.id_schet=:id_schet_sebest AND
        pr.sub1=:id_tovar AND
        pr.sub2=:id_sklad_seb AND
        pr.id_nakl=:id_nakl AND
        pr.attr1=:id_nakld AND
        pr.kredit_kolotp>0
      INTO :sum_partiya_kolotp,:cena,:id_post;

/*$$IBEC$$     if (sum_partiya_kolotp is null) then begin
       $$IBEC$$*/ /*Временно выключаем контроль при отгрузке
      на хранение. Можно оприходовать на склад
      получателя того что не отгрузили по партиям
      */
/*$$IBEC$$       sError ='Ошибка в n_s2_c_pc. '
        || ' №5 №накл='
        ||coalesce(id_nakl,0)
        || ' №поз=' || coalesce(:id_pos,0)
        || ' №товара=' || coalesce(:id_tovar,0);
      execute procedure error(sError); $$IBEC$$*/ /*$$IBEC$$ 
      cena=0;
    end else begin
      cena=(sebest/sum_partiya_kolotp);
    end $$IBEC$$*/
    
    /*select oid
      from get_oid_objects_pc('USD',:id_currency_tip)
      into :id_currency;*/
    /*После выяснения себест отгрузки с исх склада
    меняем его на склад назначения для того
    чтобы при submode=1 был записан
    правильный склад в проводки*/
    id_sklad_seb=id_sklad_seb_to;
     /*Найти курс*/ 
    SELECT kurs_from,kurs_to
      FROM kurs_get_pc (:dat, :id_currency_sebest,:id_currency_sebest,1)
      INTO :kurs_from,:kurs_to;
    IF (kurs_from IS NULL ) THEN BEGIN
      sError = 'Ошибка в naklot_sebest2_count_pc. Курс не найден2. id_curr_from=' || CAST(z(:id_currency) AS VARCHAR(8)) || '. id_curr_to=' || COALESCE(:id_currency_sebest,0);
      EXECUTE PROCEDURE error(sError);
    END
    include_nds_from=:include_nds;
    include_zatraty_from=:include_nds;
    /*Если не было приходов вообще, то постащиком товара пусть будет
      наша фирма - i.e. укк*/
/*$$IBEC$$     if (id_post is null) then begin
      id_post=id_izg;
    end   $$IBEC$$*/
    id_zak=id_izg;
    id_izg=id_post;
  END  /*if mode=4*/

  IF (mode IN (1,4,5,7,8,9)) THEN BEGIN
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
    IF (submode=1) THEN BEGIN
      id_partiya=:id_nakld-(floor(:id_nakld/10000)*10000);
      id_partiya=((extractyear(:dat)-2000)*100000000)+(extractmonth(:dat)*1000000)+extractday(:dat)*10000+z(:id_partiya);
      INSERT INTO provodki(id_schet,id_nakl,tip,dat,
          debet,debet_kolotp,
          sub1,sub2,sub3,sub4,sub5,attr1)
        VALUES(:id_schet_sebest,:id_nakl, :tip,:dat,
          :sebest,:kolotp,
          :id_tovar,:id_sklad_seb, :id_partiya,:id_zak,:id_izg,:id_nakld);
    END /*  if (submode=1)*/
    SUSPEND;
  END /*if (mode in (1,4))*/
  

  
  /*Проведение складской расходной накладной**/
  IF ((mode=3) or (mode=10) or (mode=12) )  THEN BEGIN
    if (mode=10) then begin
      dat_report=current_timestamp;
    end
    if (mode=3) then begin
      dat_report=:dat;
    end
    if (mode=12) then begin
      select first 1 pr.dat
        from provodki pr
        where pr.id_schet=:id_schet and
          pr.sub1=:id_tovar and
          pr.sub2=:id_sklad_seb and
          pr.dat>:dat and
          pr.debet_kolotp>0
        order by pr.dat
        into :dat_report;
    end
    /*Находжение нужной партии*/
    IF ((kolotp<0) AND (tip=2)) THEN BEGIN
      /*Неправильный излишек с отрицательным количеством- недостача*/
      kolotp=-kolotp;
    END
    kredit_kolotp = NULL;
    flag_more=1;
    sum_partiya_kolotp=0;
    /*Пусть партии для расхода берутся на берутся на сегодня,
     даже если отгружали в 2003 году, а товара не было
     то в дело пойдет первый приход после этого,
     а то очень много партий с колвом меньше нуля
     накапливается на складе*/
    FOR
      SELECT sub3,Round(SUM(kolotp_after),3),
        SUM(r.debetafter)-SUM(r.kreditafter),
        MIN(sub5)
      FROM rep_ostatki_pc(:id_schet_sebest,:dat_report,/*current_timestamp,*/
        :id_tovar,:id_sklad_seb,
        NULL,:id_izg,
        NULL,NULL,
        NULL,NULL,
        NULL,NULL) r
      GROUP BY sub1,sub2,sub3,sub4
      HAVING Round(SUM(kolotp_after),3)>0
      ORDER BY sub3
      INTO :id_partiya,:kredit_kolotp,:kredit,:id_post
    DO BEGIN
      /*для расходных накладных сумму нужно округлять до 4 знаков, а не до 2,
        как для складской отгрузки.*/
      IF (submode=4) THEN BEGIN
        kredit=Round(:kredit,4);
      END ELSE BEGIN
        /*складская отгузка*/
        kredit=Round(:kredit,2);
      END /*if (submode=4)*/
      IF (kredit_kolotp IS NULL) THEN BEGIN
        sError ='Ошибка в naklot_sebest2_count. Нет себестоимости для id_tovar1=' || COALESCE(:id_tovar,0) || '. id_sklad_seb=' ||COALESCE(:id_sklad_seb,0);
        EXECUTE PROCEDURE error(sError);
        /*leave;*/
      END
      /*Потребуется ещё себестоимость*/
      flag_more=1;
      flag_end_of_partiya=1;
      IF (:kredit_kolotp>=Round(z(:kolotp-:sum_partiya_kolotp),3)) THEN BEGIN
        IF (:kredit_kolotp=Round(z(:kolotp-:sum_partiya_kolotp),3)) THEN BEGIN
          flag_end_of_partiya=1;
        END ELSE BEGIN
          flag_end_of_partiya=0;
        END
        flag_more=0;
        partiya_kolotp=Round(z(:kolotp-:sum_partiya_kolotp),4);
      END ELSE BEGIN
        partiya_kolotp=:kredit_kolotp;      
      END
      sum_partiya_kolotp=Round(z(partiya_kolotp)+z(sum_partiya_kolotp),4);
      /*для расходных накладных сумму нужно округлять до 4 знаков, а не до 2,
        как для складской отгрузки.*/      

      /*Если в бух себест отгрузка последняя в партии, то цену считать по сумме*/
      IF (flag_end_of_partiya=0) THEN BEGIN
       /*Если же середина партии, то брать тупо по цене первого прихода*/
        SELECT FIRST 1 pr.debet,pr.debet_kolotp
          FROM provodki pr
          WHERE pr.id_schet=:id_schet_sebest AND
            pr.dat<=:dat AND
            pr.sub1=:id_tovar AND
            pr.sub2=:id_sklad_seb AND
            pr.sub3=:id_partiya AND
            pr.debet>=0
          ORDER BY dat
          INTO :kredit,:kredit_kolotp;
        sebest=Round(Round(dzero(kredit,kredit_kolotp,0),2)*partiya_kolotp,2);
      END ELSE BEGIN/*if (flag_more=1)*/
        /*Последняя сумма тратится полностью без округлений*/
/*          sebest=Round(dzero(kredit,kredit_kolotp,0)*partiya_kolotp,4);*/
        sebest=Round(dzero(kredit,kredit_kolotp,0)*partiya_kolotp,2);
      END /*if (flag_more=1)*/

      IF (:submode  IN (1,4)) THEN BEGIN
        INSERT INTO provodki(id_schet,id_nakl,tip,dat,
            kredit,kredit_kolotp,
            sub1,sub2,sub3,sub4,sub5,attr1)
          VALUES(:id_schet_sebest,:id_nakl, :tip,:dat,
            :sebest,:partiya_kolotp,
            :id_tovar,:id_sklad_seb, :id_partiya,:id_izg,:id_post,:id_nakld);
      END
      IF (flag_more<>1) THEN BEGIN
        LEAVE;
      END
      kredit_kolotp = NULL;
      /*Прописывание расхода в проводках*/
    END /*for*/

    IF (flag_more=1) THEN BEGIN
      /*Излишек создаём только для submode=1*/
      IF (:submode IN (1,4)) THEN BEGIN
        /*если на складе нет товара, то отгружется товар с себестоимостью
        как у излишка
         и количеством которого не хватало для реальной отгрузки*/
        partiya_kolotp=Round(z(:kolotp-:sum_partiya_kolotp),4);
        /*повторение процедуры излишков*/
        kredit = NULL;
        select first 1
          sub3, z(debet),z(debet_kolotp),sub4,sub5
          from provodki pr
          where pr.id_schet=:id_schet_sebest and pr.dat<=:dat and
            pr.sub1=:id_tovar and pr.sub2=:id_sklad_seb
            and pr.sub4=:id_izg /*Только для бух себест где есть фирма, для склада
            фирма не упоминается и эта submode=2, т.е. ветка не должна выполняться*/
            and pr.debet_kolotp>0
           order by sub3 desc
          into :id_partiya,:kredit,:kredit_kolotp,:id_izg, :id_post;
        IF (z(:kredit)=0) THEN BEGIN
          kredit=0;
          kredit=kredit*partiya_kolotp;
          id_partiya=:id_nakld-(floor(:id_nakld/10000)*10000);
          id_partiya=((extractyear(:dat)-2000)*100000000)+(extractmonth(:dat)*1000000)+extractday(:dat)*10000+z(:id_partiya);
        END ELSE BEGIN
          kredit=dzero(:kredit,:kredit_kolotp,0)*:partiya_kolotp;
        END
        /*Если не было приходов вообще, то постащиком товара пусть будет
          наша фирма - i.e. укк*/
        IF (id_post IS NULL) THEN BEGIN
          id_post=id_izg;
        END
        INSERT INTO provodki(id_schet,id_nakl,tip,dat,
            kredit,kredit_kolotp,
            sub1,sub2,sub3,sub4,sub5,attr1)
          VALUES(:id_schet_sebest,:id_nakl, :tip,:dat,
            :kredit,:partiya_kolotp,
            :id_tovar,:id_sklad_seb, :id_partiya,:id_izg,:id_post,:id_nakld);
      END    
    END


    SELECT Round(dzero(SUM(pr.kredit),SUM(pr.kredit_kolotp),0),2)
      FROM provodki pr
      WHERE 
        pr.tip<>1 AND
        pr.id_schet=:id_schet_sebest AND
        pr.sub1=:id_tovar AND
        pr.sub2=:id_sklad_seb AND
        pr.id_nakl=:id_nakl AND
        pr.attr1=:id_nakld AND
        pr.kredit_kolotp>0
      INTO :sebest;
      SUSPEND;
  END /*if mode=3*/

  /*Проведение излишка*/
  IF (mode=6) THEN BEGIN
     /*Находжение нужной партии*/
    kredit = NULL;
    SELECT FIRST 1
        sub3,Round(SUM(kolotp_after),3),
        Round(SUM(r.debetafter)-SUM(r.kreditafter),2)
      FROM rep_ostatki_pc(:id_schet_sebest,:dat,/*current_timestamp,*/
        :id_tovar,:id_sklad_seb,
        NULL,:id_izg,
        NULL,NULL,
        NULL,NULL,
        NULL,NULL) r
      GROUP BY sub1,sub2,sub3,sub4
      HAVING Round(SUM(kolotp_after),3)>0
      ORDER BY sub3 DESC
      INTO :id_partiya,:kredit_kolotp,:kredit;


    IF (:kredit IS NULL) THEN BEGIN
      /*  Если такой товар не приходовался то
      его себест берется ВРЕМЕННО из спр себест.
      Изменил поведение. Теперь себестоимость
      только что внесенной щеки№18=0.
      Накладная №165643 01.08.05*/
      /* select first 1 s.sebest
        from sebest s
        where s.id_tovar=:id_tovar and s.dat<=:dat
        order by s.dat desc
        into :kredit;
      kredit=kredit*kolotp;*/
      kredit=0;
      id_partiya=:id_nakld-(floor(:id_nakld/10000)*10000);
      id_partiya=((extractyear(:dat)-2000)*100000000)+(extractmonth(:dat)*1000000)+extractday(:dat)*10000+z(:id_partiya);
 /*      sError ='Ошибка в naklot_sebest_count. Нет себестоимости для id_tovar2=' || coalesce(:id_tovar,0) || '. id_sklad_seb=' ||coalesce(:id_sklad_seb,0);
      execute procedure error(sError);*/ 
    END ELSE BEGIN
      kredit=(kredit/kredit_kolotp)*kolotp;
    END
    IF (:submode=1) THEN BEGIN
      INSERT INTO provodki(id_schet,id_nakl,tip,dat,
          debet,debet_kolotp,
          sub1,sub2,sub3,sub4,attr1)
        VALUES(:id_schet_sebest,:id_nakl, :tip,:dat,
          :kredit,:kolotp,
          :id_tovar,:id_sklad_seb, :id_partiya,:id_zak,:id_nakld);
    END  /*if*/

    SELECT Round(dzero(SUM(pr.debet),SUM(pr.debet_kolotp),0),2)
      FROM provodki pr
      WHERE 
        pr.tip<>1 AND
        pr.id_schet=:id_schet_sebest AND
        pr.sub1=:id_tovar AND
        pr.sub2=:id_sklad_seb AND
        pr.id_nakl=:id_nakl AND
        pr.attr1=:id_nakld AND
        pr.debet_kolotp>0
      INTO :sebest;
    SUSPEND;
  END  /*if mode=6 Проведение излишка*/
END^

SET TERM ; ^

DESCRIBE PROCEDURE NAKLOT_SEBEST2_COUNT_PC
'
mode=1 Проведение приходная складская накладная
mode=2 Возврат приходной накладной, и также отгрузочной
mode=3 Проведение складской расходной накладной
mode=4 Проведение отгрузки на хранение
mode=5 Проведение приходной складской накладной с
  себестоимостью взятой из справочника себестоимости
mode=6 Проведение излишка. Находим последнюю партию
  с таким товаром и добавляем излишек с такой себестоимостью
mode=7 Создание искусственного прихода для расходной накладной
  которая создана до введения себестоимости 04.10.04
mode=8 Проведение приходной бух накладной по счёту себестоимость товара.
  Необходимо расчитать бух затраты на товар
mode=9  Проведение приходной бух накладной по счёту себестоимость тары.
  Необходимо расчитать бух затраты на тару
mode=10 - как submode=4, только для расходных накладных
  при списывании не создаём излишка, если кабеля отгружаемого
  нет на складе. И остатки по партиям смотрим на сегодня.
mode=11 - как mode=4, только приход на склад назначения
  не одной партией, а с такой же разбивкой по партиям
mode=12 - mode3 и mode10. Остатки по партиям для отгрузки смотрим на дату
  ближайшего следующего прихода. Только для складских отгрузок, не смотрит на
  фирму продающую, т.е. не подходит для бухг
submode=0 - просто инфа по себест для данного id_nakld
submode=1 - вставка себест в проводки дла id_nakld и
  бух себест, т.е. субконто фирмы
submode=2 - вставка себест в проводки дла id_nakld и
  факт себест, т.е. субконто фирмы=null
submode=3 -спец режим для излишков и недостач по себест
    он только информирует о полученной себест, т.е. как submode=0*/
submode=4 - как submode=1, только для расходных накладных
  при списывании не создаём излишка, если кабеля отгружаемого
  нет на складе.';

GRANT SELECT ON NAKLOT TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT SELECT ON NAKLO TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT SELECT,INSERT,DELETE ON PROVODKI TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_SETTINGS_PC TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT SELECT ON SPR_UCHET_POLITICS_VW TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT EXECUTE ON PROCEDURE KURS_GET_PC TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT SELECT ON NAKLP_ZATR_VW TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT SELECT ON SPR_STATYA_VW TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT EXECUTE ON PROCEDURE REP_NAKLPBUX_TO_GRN_CONVERT_PC TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT SELECT ON SEBEST TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT EXECUTE ON PROCEDURE REP_OSTATKI_PC TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLO_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLO_UNPOST_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLPBUX_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLP_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLP_SEBEST4_RECOUNT_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLP_SEBEST_RECOUNT_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLP_UNPOST_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLR_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKL_PEREM_BUX_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE SKLAD_SEBEST_MINUS_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE TEMP67_SKLAD_SEBEST_MINUS_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO SYSDBA;

