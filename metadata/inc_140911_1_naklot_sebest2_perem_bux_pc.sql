create or alter  procedure naklot_sebest2_perem_bux_pc (ID_NAKLD INTEGER,
    ID_UCHET_POLITICS INTEGER,
    ID_SCHET INTEGER)
RETURNS (
    SEBEST DOUBLE PRECISION,
    ID_PARTIYA INTEGER)
as

declare variable cena double precision;
declare variable id_nakl integer;
declare variable id_sklad_seb_to integer;
declare variable id_uchet_politics_to integer;
declare variable id_tovar integer;
declare variable kolotp double precision;
declare variable id_sklad_nakl integer;

declare variable id_currency integer;
declare variable zatraty double precision;
declare variable kurs_from double precision;
declare variable kurs_to double precision;
declare variable dat date;
declare variable id_sklad_seb integer;
declare variable itemp integer;
declare variable serror varchar(100);
declare variable id_currency_sebest integer;
declare variable include_nds integer;
declare variable include_zatraty integer;
declare variable tip integer;
declare variable id_schet_sebest integer;
declare variable kredit double precision;
declare variable partiya_kolotp double precision;
declare variable include_nds_from integer;
declare variable include_zatraty_from integer;
declare variable id_izg integer;
declare variable id_zak integer;
declare variable id_sklad_to integer;
declare variable id_post integer;
declare variable delmarked integer;
declare variable id_partiya_nakld integer;

begin
  SELECT id_nakl,cena,id_tovar,round(kolotp,3)
    FROM naklot ot
    WHERE ot.id_nakld=:id_nakld
    INTO :id_nakl,:cena,:id_tovar,:kolotp;

  SELECT id_sklad,id_currency,dat,
      zatraty,tip,id_izg,id_zak,id_sklad_to,
      delmarked
    FROM naklo om
    WHERE om.id_nakl=:id_nakl
    INTO :id_sklad_nakl,:id_currency,:dat,
      :zatraty,:tip,:id_izg,:id_zak,:id_sklad_to,
      :delmarked;

  IF (z(kolotp)=0) THEN BEGIN
    EXIT;
  END

  id_schet_sebest=id_schet;

  IF (id_uchet_politics IS NULL) THEN BEGIN
    sError = 'Ошибка в n_s2_c_pc. Укажите учётную политику. id_nakld='||COALESCE(:id_nakld,0);
    EXECUTE PROCEDURE error(sError);
  END

  SELECT FIRST 1 id_sklad,id_uchet_politics
    FROM sklad_sebest_settings_pc(:id_sklad_nakl,:id_uchet_politics)
    INTO :id_sklad_seb,:id_uchet_politics;    

  /*При хранении узнаём политику склада назначения*/
  SELECT FIRST 1 id_sklad,id_uchet_politics
    FROM sklad_sebest_settings_pc(:id_sklad_to,:id_uchet_politics)
    INTO :id_sklad_seb_to,:id_uchet_politics_to;

  if (delmarked<>0) then begin
    exit;
  end

  IF (z(id_uchet_politics_to)<>z(id_uchet_politics)) THEN BEGIN
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
    sError = 'Ошибка в naklot_sebest2_perem_bux_pc. №1. id_uchet_politics='|| COALESCE(:id_uchet_politics,0);
    EXECUTE PROCEDURE error(sError);
  END

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

  id_partiya=NULL;

  FOR
    SELECT
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
    INTO :cena,
      :partiya_kolotp,:id_post,:kredit
  DO BEGIN
    sebest=kredit;

    IF (id_partiya_nakld IS NULL)  THEN BEGIN
      id_partiya_nakld=:id_nakld;
    END ELSE BEGIN
      id_partiya_nakld=z(id_partiya_nakld)+1;
    END

    select id_partiya, sebest
      from naklot_sebest2_insert_pc(
        :cena,:kurs_from,:kurs_to,:partiya_kolotp, :include_nds_from, :include_nds,
        :include_zatraty_from, :include_zatraty, :zatraty, :dat, 1/*реальная запись в проводки*/,
        :id_partiya_nakld, :id_post, :id_zak, :id_nakl, :id_tovar, :id_schet_sebest,
        :id_sklad_seb_to, :tip)
      into :id_partiya, :sebest;

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

end

