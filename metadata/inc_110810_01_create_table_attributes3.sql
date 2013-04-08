
CREATE TABLE ATTRIB_NAKLOT (
    OID            PK /* PK = INTEGER NOT NULL */,
    ATTRIBUTE_ID   PK /* PK = INTEGER NOT NULL */,
    VALUE1         VAR250_N /* VAR250_N = VARCHAR(250) */,
    VALUE_INT      INT_NULL /* INT_NULL = INTEGER */,
    VALUE_DATE     DATA_NULL /* DATA_NULL = TIMESTAMP */,
    VALUE_NUM15_4  MONEYP_NULL /* MONEYP_NULL = NUMERIC(15,4) */,
    SQL_TEXT       TEXT /* TEXT = BLOB SUB_TYPE 1 SEGMENT SIZE 100 */
);
      


/******************************************************************************/
/***                              Primary Keys                              ***/
/******************************************************************************/

ALTER TABLE ATTRIB_NAKLOT ADD CONSTRAINT ATTRIB_NAKLOT_PK PRIMARY KEY (OID, ATTRIBUTE_ID);


/******************************************************************************/
/***                              Descriptions                              ***/
/******************************************************************************/

DESCRIBE TABLE ATTRIB_NAKLOT
'Псевдоним ab';



/* Fields descriptions */

DESCRIBE FIELD VALUE1 TABLE ATTRIB_NAKLOT
'Строковое значение аттрибута, если class_attributes.attribute_type=1';

DESCRIBE FIELD VALUE_INT TABLE ATTRIB_NAKLOT
'Целое значение аттрибута, если class_attributes.attribute_type=2
';

DESCRIBE FIELD VALUE_DATE TABLE ATTRIB_NAKLOT
'Дата, как значение аттрибута, если class_attributes.attribute_type=3';



/******************************************************************************/
/***                               Privileges                               ***/
/******************************************************************************/


/* Privileges of users */
GRANT SELECT, REFERENCES ON ATTRIB_NAKLOT TO PUBLIC;

/* Privileges of roles */
GRANT ALL ON ATTRIB_NAKLOT TO BUXG;
GRANT ALL ON ATTRIB_NAKLOT TO MANAGER;
GRANT ALL ON ATTRIB_NAKLOT TO POWER_USER;
GRANT ALL ON ATTRIB_NAKLOT TO SKLAD;
