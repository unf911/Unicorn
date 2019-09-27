--inc_180122_1_rasxod_nal_lower_grid_naklf_instread_of_naklu.sql

CREATE DOMAIN RASCH_IBAN AS 
VARCHAR(32) CHARACTER SET WIN1251 
COLLATE WIN1251 ;

ALTER TABLE BANK
ADD RASCH_IBAN RASCH_IBAN
COLLATE WIN1251;

update bank
set RASCH_IBAN = cast(RASCH as bigint);

/* todo in future after 25/12/2019 */
-- ALTER TABLE BANK DROP RASCH

