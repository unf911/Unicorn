
ALTER TABLE NAKLO
ADD DOV         VAR50_NULL  COLLATE PXW_CYRL,
ADD DDO         DATA2,
ADD LICO        VAR50_NULL COLLATE PXW_CYRL,
ADD FR          VARCHAR(5) CHARACTER SET WIN1251 COLLATE PXW_CYRL,
ADD SCH         INTEGER ;

 /*
update naklo om
set
om.dov=(select n.dov from naklr n where n.id_nakl=om.id_nakl),
om.DDO=(select DDO from naklr n where n.id_nakl=om.id_nakl),   
om.LICO=(select LICO from naklr n where n.id_nakl=om.id_nakl),   
om.FR=(select FR from naklr n where n.id_nakl=om.id_nakl),
om.SCH=(select SCH from naklr n where n.id_nakl=om.id_nakl)  
where om.tip=3047 and om.id_nakl=16221
-- and om.dat<'01.01.03'
;
*/



