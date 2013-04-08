/******************************************************************************/

SET SQL DIALECT 3;

SET NAMES WIN1251;



/******************************************************************************/
/***                                 Views                                  ***/
/******************************************************************************/


/* View: REALPRICE_VW */
CREATE VIEW REALPRICE_VW(
    ID,
    DAT,
    DAT_FACT,
    NDS_FACT,
    ID_IZG,
    ID_ZAK,
    ID_MANAGER,
    ID_NAKL,
    NDS,
    COMMENT)
AS
select om.id, om.dat,
    /*$$IBEC$$ max(om2.dat) as dat_fact, $$IBEC$$*/
    /*$$IBEC$$ sum(om2.nds) as nds_fact, $$IBEC$$*/
    (select max(om2.dat)
      from naklo om2
      where om.id_nakl=om2.parent_id_nakl and
        om2.delmarked=0 and
        om2.tip= (select oid from get_oid_objects_pc('Отгрузка',101))
    ) as dat_fact,
    (select sum(om2.nds)
      from naklo om2
      where om.id_nakl=om2.parent_id_nakl and
        om2.delmarked=0 and
        om2.tip= (select oid from get_oid_objects_pc('Отгрузка',101))
    ) as nds_fact,
    om.id_izg, om.id_zak, om.id_manager,
    om.id_nakl, om.nds, om.comment
  from
    naklr_vw om/*$$IBEC$$  left join naklo om2 on
      om.id_nakl=om2.parent_id_nakl and
      om2.delmarked=0 and
      om2.tip= (select oid from get_oid_objects_pc('Отгрузка',101)) $$IBEC$$*/
      
  where  om.delmarked=0
    /*$$IBEC$$ and om.dat between '01.11.06' and '30.11.06' $$IBEC$$*/
  group by om.id, om.id_nakl, om.dat,
    om.id_izg, om.id_zak, om.id_manager,
    om.nds, om.delmarked, om.dat,
    om.comment
  /*order by om.dat,om.id*/
;




/******************************************************************************/
/***                               Privileges                               ***/
/******************************************************************************/


/* Privileges of roles */
GRANT SELECT, REFERENCES ON REALPRICE_VW TO BOSSES;
GRANT SELECT, REFERENCES ON REALPRICE_VW TO MANAGER;
GRANT SELECT, UPDATE, REFERENCES ON REALPRICE_VW TO POWER_USER;
GRANT SELECT, REFERENCES ON REALPRICE_VW TO SNAB;

DROP VIEW REALPRICE_VW;

