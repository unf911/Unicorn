SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_PRIBYL_PRILOG_EDNAL_PC(
    ID_IZG INTEGER,
    DAT_FROM TIMESTAMP,
    DAT_TO TIMESTAMP)
RETURNS (
    ID_ZAK INTEGER,
    VSEGO NUMERIC(15,4))
AS
declare variable id_schet_tip integer;
declare variable tip_transh integer;
declare variable id_schet_dolg integer;
declare variable id_schet_arenda integer;
begin

  select oid from get_oid_objects_pc('рхо яверю',-100) into :id_schet_tip;
  select oid from get_oid_objects_pc('рхо рпюмьх',-100) into :tip_transh;
  select oid from get_oid_objects_pc('днкцх гю йюаекэ',:id_schet_tip) into :id_schet_dolg;
  select oid from get_oid_objects_pc('днкцх гю юпемдс',:id_schet_tip) into :id_schet_arenda;

  for
    select
      pr.sub2, Round(sum(pr.debet) /1.2, 2) as vsego
    from provodki pr
    where
      pr.dat between :dat_from and :dat_to and pr.sub1=:id_izg
      and pr.id_schet in (:id_schet_dolg/*днкцх гю йюаекэ*/, :id_schet_arenda /*днкцх гю юпемдс*/)
      and pr.tip<>:tip_transh/*рхо рпюмьх*/
    group by pr.sub2, pr.sub1
    having Round(sum(pr.debet) /1.2, 2)>0
    into :id_zak, :vsego
   do begin
     suspend;
   end

END^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_PRIBYL_PRILOG_EDNAL_PC;

GRANT SELECT ON PROVODKI TO PROCEDURE REP_PRIBYL_PRILOG_EDNAL_PC;

GRANT EXECUTE ON PROCEDURE REP_PRIBYL_PRILOG_EDNAL_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE REP_PRIBYL_PRILOG_EDNAL_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE REP_PRIBYL_PRILOG_EDNAL_PC TO POWER_USER;
