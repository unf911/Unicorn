SET TERM ^ ;

CREATE or alter PROCEDURE NAKLOT_SEBEST2_COUNT_PC(
    ID_NAKLD INTEGER,
    ID_UCHET_POLITICS INTEGER,
    ID_SCHET INTEGER,
    MODE INTEGER,
    SUBMODE INTEGER)
RETURNS (
    SEBEST DOUBLE PRECISION,
    ID_PARTIYA INTEGER)
AS
declare variable cena double precision;
declare variable id_nakl integer;
declare variable id_sklad_seb_to integer;
declare variable id_uchet_politics_to integer;
declare variable id_tovar integer;
declare variable kolotp double precision;
declare variable id_sklad_nakl integer;
declare variable kurs double precision;
declare variable id_currency integer;
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
declare variable flag_more integer;
declare variable kredit_kolotp double precision;
declare variable kredit double precision;
declare variable partiya_kolotp double precision;
declare variable sum_partiya_kolotp double precision;
declare variable id_currency_tip integer;
declare variable include_nds_from integer;
declare variable include_zatraty_from integer;
declare variable id_izg integer;
declare variable id_zak integer;
declare variable id_sklad_to integer;
declare variable id_post integer;
declare variable parent_id_nakl integer;
declare variable tip_prixod integer;
declare variable flag_end_of_partiya integer;
declare variable dat_report date;
declare variable delmarked integer;
declare variable parent_tip integer;
declare variable tip_vozvrat integer;
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
  SELECT id_sklad,kurs,id_currency,dat,
      zatraty,tip,id_izg,id_zak,id_sklad_to,
      parent_id_nakl,delmarked
    FROM naklo om
    WHERE om.id_nakl=:id_nakl
    INTO :id_sklad_nakl,:kurs,:id_currency,:dat,
      :zatraty,:tip,:id_izg,:id_zak,:id_sklad_to,
      :parent_id_nakl,:delmarked;
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
    разберётся откуда брать себестоимость*//*$$IBEC$$ 
  IF (mode=1 AND parent_id_nakl IS NULL AND z(tip)=z(tip_prixod)) THEN BEGIN
    mode=5;
  END $$IBEC$$*/

  /*Приход*/
  IF (mode IN (1,8,9)) THEN BEGIN
    if (parent_id_nakl is not null ) then begin
      select tip
      from naklo om
      where om.id_nakl=:parent_id_nakl
      into :parent_tip;

      select oid from get_oid_objects_pc('ВОЗВРАТ',-100) into :tip_vozvrat;

      if (parent_tip=:tip_vozvrat) then begin
        select sebest,id_partiya
        from naklot_sebest2_vozvr_skl_pc(:ID_NAKLD,:id_uchet_politics,:id_schet)
        into :sebest,:id_partiya;

        exit;
      end
    end

    select t.include_zatraty_from, t.include_nds_from, t.zatraty, t.kurs_from, t.kurs_to
    from naklot_sebest2_prixod_pc(:id_nakl, :include_nds, :id_currency_sebest , :mode) t
    into :include_zatraty_from, :include_nds_from, :zatraty, :kurs_from, :kurs_to;

  END /*if mode=1*/
  
 /*Приход с ценой из справочника себестоимости*//*$$IBEC$$ 
  IF (mode IN (5,7)) THEN BEGIN
     $$IBEC$$*//*Сумма любой приходной накладной храниться в гривнах
     а цены в детализации в
     валюте указанной в naklo.id_currency,при этом курс
     пересчёта на гривну в naklo.kurs.
     Если же валюта себестоимости не совпадает с
     валютой накладной naklo.id_currency, то
     пересчёт ведётся через гривну. Т.е. в
     таблице курс должен быть указан курс пересчёта
     гривны в эту валюту себестоимости
    *//*$$IBEC$$ 
    SELECT oid
      FROM get_oid_objects_pc('USD',:id_currency_tip)
      INTO :id_currency;
    SELECT oid
      FROM get_oid_objects_pc('UAH',:id_currency_tip)
      INTO :id_currency_schet;      
      
    IF (:id_currency<>:id_currency_sebest) THEN BEGIN
      IF (:id_currency_schet<>:id_currency_sebest) THEN BEGIN
         $$IBEC$$*//*Найти курс из валюты детализации в валюту себестоимости*//*$$IBEC$$ 
        SELECT kurs_from,kurs_to
          FROM kurs_get_pc (:dat, :id_currency,:id_currency_sebest,1)
          INTO :kurs_from,:kurs_to;
        IF (kurs_from IS NULL ) THEN BEGIN
          sError = 'Ошибка в naklot_sebest_count_pc. Курс не найден. id_curr_from=' || CAST(z(:id_currency) AS VARCHAR(8)) || '. id_curr_to=' || CAST(z(:id_currency_sebest) AS VARCHAR(8));
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
    /*Затраты и НДС уже включены с себестоимость из справочника*//*$$IBEC$$ 

    cena = NULL ;
    SELECT FIRST 1 s.sebest
      FROM sebest s
      WHERE s.id_tovar=:id_tovar AND s.dat<=:dat
      ORDER BY s.dat DESC
      INTO :cena;
    include_nds_from=1;
    include_zatraty_from=1;
  END  $$IBEC$$*//*if mode=5*/
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
        Round(dzero(pr.kredit,pr.kredit_kolotp,0),5),
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
/*$$IBEC$$       IF (:include_nds_from<>:include_nds) THEN BEGIN
        IF (:include_nds_from=1 AND :include_nds<>1) THEN BEGIN
          sebest=sebest/(1+:nalog_nds_def);
        END
        IF (:include_nds_from<>1 AND :include_nds=1) THEN BEGIN
          sebest=sebest*(1+:nalog_nds_def);
        END      
      END  $$IBEC$$*//*if (include_nds_from<>include_nds)*//*$$IBEC$$ 

      IF (:include_zatraty_from<>:include_zatraty) THEN BEGIN
        IF (:include_zatraty_from=1 AND :include_zatraty<>1) THEN BEGIN
          sebest=sebest/(1+(z(:zatraty)/100));
        END
        IF (:include_zatraty_from<>1 AND :include_zatraty=1) THEN BEGIN
          sebest=sebest*(1+(z(:zatraty)/100));
        END
      END  $$IBEC$$*//*if (include_zatraty_from<>include_zartaty)*//*$$IBEC$$ 

      sebest=Round(sebest,4);  $$IBEC$$*//*округляется только сумма себестоимости*/
      /*Реальная запись в проводки*/
      IF (submode=1) THEN BEGIN
/*$$IBEC$$         IF (id_partiya IS NULL)  THEN BEGIN
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
            :id_tovar,:id_sklad_seb_to, :id_partiya,:id_zak,:id_post,:id_nakld); $$IBEC$$*/

        select id_partiya, sebest
          from naklot_sebest2_insert_pc(
            :cena,:kurs_from,:kurs_to,:partiya_kolotp, :include_nds_from, :include_nds,
            :include_zatraty_from, :include_zatraty, :zatraty, :dat, :submode,
            :id_nakld, :id_post, :id_zak, :id_nakl, :id_tovar, :id_schet_sebest, :id_sklad_seb, :tip)
          into :id_partiya, :sebest;
      END /*  if (submode=1)*/
    END /*for provodki*/
    /*Расчёт себестоимости итоговой*/
    SELECT
        Round(dzero(SUM(pr.debet),SUM(pr.debet_kolotp),0),5)
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
        Round(dzero(SUM(pr.kredit),SUM(pr.kredit_kolotp),0),5),
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
    for
      select id_partiya, sebest
      from naklot_sebest2_insert_pc(
        :cena,:kurs_from,:kurs_to,:kolotp, :include_nds_from, :include_nds,
        :include_zatraty_from, :include_zatraty, :zatraty, :dat, :submode,
        :id_nakld, :id_izg, :id_zak, :id_nakl, :id_tovar, :id_schet_sebest, :id_sklad_seb, :tip)
      into :id_partiya, :sebest
    do begin
      suspend;
    end
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
        if (dat_report is null) then begin
          dat_report = :dat;
        end
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
      kredit=Round(:kredit,5);

      IF (kredit_kolotp IS NULL) THEN BEGIN
        sError ='Ошибка в naklot_sebest2_count. Нет себестоимости для id_tovar1=' || COALESCE(:id_tovar,0) || '. id_sklad_seb=' ||COALESCE(:id_sklad_seb,0);
        EXECUTE PROCEDURE error(sError);
        /*leave;*/
      END
      /*Потребуется ещё себестоимость*/
      flag_more=1;
      flag_end_of_partiya=1;
      IF (:kredit_kolotp>=Round(z(:kolotp-:sum_partiya_kolotp),4)) THEN BEGIN
        IF (:kredit_kolotp=Round(z(:kolotp-:sum_partiya_kolotp),4)) THEN BEGIN
          flag_end_of_partiya=1;
        END ELSE BEGIN
          flag_end_of_partiya=0;
        END
        flag_more=0;
        partiya_kolotp=Round(z(:kolotp-:sum_partiya_kolotp),3);
      END ELSE BEGIN
        partiya_kolotp=:kredit_kolotp;      
      END
      sum_partiya_kolotp=Round(z(partiya_kolotp)+z(sum_partiya_kolotp),4);

      /*Если в бух себест отгрузка последняя в партии, то цену считать по сумме*/
      IF (flag_end_of_partiya=0) THEN BEGIN
       /*Если же середина партии, то брать цену первого прихода*/
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
        sebest=Round(Round(dzero(kredit,kredit_kolotp,0),5)*partiya_kolotp,5);
      END ELSE BEGIN/*if (flag_more=1)*/
        /*Последняя сумма тратится полностью без округлений*/
        sebest=Round(dzero(kredit,kredit_kolotp,0)*partiya_kolotp,5);
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
        partiya_kolotp=Round(z(:kolotp-:sum_partiya_kolotp),5);
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


    SELECT Round(dzero(SUM(pr.kredit),SUM(pr.kredit_kolotp),0),5)
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
/*$$IBEC$$     SELECT FIRST 1
        sub3,Round(SUM(kolotp_after),3),
        Round(SUM(r.debetafter)-SUM(r.kreditafter),2)
      FROM rep_ostatki_pc(:id_schet_sebest,:dat, $$IBEC$$*//*current_timestamp,*//*$$IBEC$$ 
        :id_tovar,:id_sklad_seb,
        NULL,:id_izg,
        NULL,NULL,
        NULL,NULL,
        NULL,NULL) r
      GROUP BY sub1,sub2,sub3,sub4
      HAVING Round(SUM(kolotp_after),3)>0
      ORDER BY sub3 DESC
      INTO :id_partiya,:kredit_kolotp,:kredit; $$IBEC$$*/
    select first 1
        sub3, debet_kolotp, debet
      from provodki pr
      where pr.id_schet=:id_schet_sebest and pr.dat<=:dat and
        pr.sub1=:id_tovar and pr.sub2=:id_sklad_seb and
        pr.debet_kolotp>0 and
        (pr.sub4 between coalesce(:id_izg,-2147483648) and coalesce(:id_izg, 2147483647) or pr.sub4 is null)
      order by pr.sub3 desc
      into :id_partiya, :kredit_kolotp, : kredit;

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
      kredit=Round((kredit/kredit_kolotp)*kolotp,5);
    END
    IF (:submode=1) THEN BEGIN
      INSERT INTO provodki(id_schet,id_nakl,tip,dat,
          debet,debet_kolotp,
          sub1,sub2,sub3,sub4,attr1)
        VALUES(:id_schet_sebest,:id_nakl, :tip,:dat,
          :kredit,:kolotp,
          :id_tovar,:id_sklad_seb, :id_partiya,:id_zak,:id_nakld);
    END  /*if*/

    SELECT Round(dzero(SUM(pr.debet),SUM(pr.debet_kolotp),0),5)
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

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_VOZVR_SKL_PC TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_PRIXOD_PC TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT EXECUTE ON PROCEDURE KURS_GET_PC TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_INSERT_PC TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT EXECUTE ON PROCEDURE REP_OSTATKI_PC TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLOT_SEBEST2_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLO_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLO_UNPOST_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLPBUX_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLP_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLP_SEBEST4_RECOUNT_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLP_SEBEST_RECOUNT_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLP_UNPOST_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLR_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKL_PEREM_BUX_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE SKLAD_SEBEST_MINUS_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE TEMP67_SKLAD_SEBEST_MINUS_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO SYSDBA;
