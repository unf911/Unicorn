SET TERM ^ ;

CREATE or alter PROCEDURE NAKLOT_SEBEST2_INSERT_PC(
    CENA DOUBLE PRECISION,
    KURS_FROM DOUBLE PRECISION,
    KURS_TO DOUBLE PRECISION,
    KOLOTP DOUBLE PRECISION,
    INCLUDE_NDS_FROM INTEGER,
    INCLUDE_NDS INTEGER,
    INCLUDE_ZATRATY_FROM INTEGER,
    INCLUDE_ZATRATY INTEGER,
    ZATRATY DOUBLE PRECISION,
    DAT TIMESTAMP,
    SUBMODE INTEGER,
    ID_NAKLD INTEGER,
    ID_IZG INTEGER,
    ID_ZAK INTEGER,
    ID_NAKL INTEGER,
    ID_TOVAR INTEGER,
    ID_SCHET_SEBEST INTEGER,
    ID_SKLAD_SEB INTEGER,
    TIP INTEGER)
RETURNS (
    SEBEST DOUBLE PRECISION,
    ID_PARTIYA INTEGER)
AS
  declare variable nalog_nds_def double precision;
begin
    sebest= :cena*:kurs_from/:kurs_to;
    /*Храниться сумма себестоимости*/
    sebest=:sebest*:kolotp;
    IF (:include_nds_from<>:include_nds) THEN BEGIN
      nalog_nds_def=0;
      SELECT nds
        FROM get_nds(:dat, NULL)
        INTO :nalog_nds_def;
      IF (:include_nds_from=1 AND :include_nds<>1) THEN BEGIN
        sebest=sebest/(1+:nalog_nds_def);
      END
      IF (:include_nds_from<>1 AND :include_nds=1) THEN BEGIN
        sebest=sebest*(1+:nalog_nds_def);
      END      
    END /*if (include_nds_from<>include_nds)*/
    IF (:include_zatraty_from<>:include_zatraty) THEN BEGIN
      IF (:include_zatraty_from=1 AND :include_zatraty<>1) THEN BEGIN
        sebest=sebest/(1+(z(:zatraty)/100));
      END
      IF (:include_zatraty_from<>1 AND :include_zatraty=1) THEN BEGIN
        sebest=sebest*(1+(z(:zatraty)/100));
      END
    END /*if (include_zatraty_from<>include_zartaty)*/
    sebest=Round(sebest,5);/*округляется только сумма себестоимости до 5 знаков*/
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
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE NAKLOT_SEBEST2_INSERT_PC;

GRANT INSERT ON PROVODKI TO PROCEDURE NAKLOT_SEBEST2_INSERT_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_INSERT_PC TO PROCEDURE NAKLOT_SEBEST2_COUNT_PC;
GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_INSERT_PC TO SYSDBA;

