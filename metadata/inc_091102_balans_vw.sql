UPDATE balans_vw B
SET B.OID=-27
WHERE B.OID=19874;

UPDATE balans_vw B
SET B.OID=-26
WHERE B.OID=19930;

UPDATE balans_vw B
SET B.OID=-25
WHERE B.OID=19940;

UPDATE balans_vw B
SET B.OID=-24
WHERE B.OID=19873;

UPDATE balans_vw B
SET B.OID=-23
WHERE B.OID=21508;

UPDATE balans_vw B
SET B.OID=-22
WHERE B.OID=22478;

UPDATE balans_vw B
SET B.OID=-21
WHERE B.OID=22479;

UPDATE balans_vw B
SET B.OID=-20
WHERE B.OID=22480;

UPDATE balans_vw B
SET B.OID=-19
WHERE B.OID=22481;

UPDATE balans_vw B
SET B.name='ДОЛГИ ПОКУПАТЕЛЕЙ АРЕНДЫ',
b.fullname='Долги покупателей аренды'
WHERE B.OID=-23;


INSERT INTO BALANS_VW (OID, NAME, FULLNAME, DELMARKED,
ID_CURRENCY, SQL_TEXT, IS_MINUS, ID_SCHET, SUB_CURRENCY
) VALUES (-18,
'ДОЛГИ ПОКУПАТЕЛЕЙ УСЛУГ',
'Долги покупателей услуг', 0,
NULL, NULL, 0, -31, 5);


/*
select
  sum(r.DEBETAFTERINCURRENCY)-sum(r.KREDITAFTERINCURRENCY) as itog
from rep_oborotka2_roles_pc(
  (select oid from get_oid_objects_pc('ДОЛГИ ЗА ФИНУСЛУГИ',
    (select oid from get_oid_objects_pc('ТИП СЧЕТА',-100)))),
    :dat_to,:dat_to,
    null,null,null,null,null,null,null,null,null,null,
    'POWER_USER;BUXG;BOSSES',:id_currency_to,5) r

*/
