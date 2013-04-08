SET TERM ^ ;

CREATE OR ALTER PROCEDURE MAKE_FIN_TRASH_FINUSL(
    ID INTEGER)
RETURNS (
    ID_NAKL INTEGER)
AS
  declare variable dat date;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_manager integer;
  declare variable opl numeric(15,4);
  declare variable potracheno numeric (15,4);
  declare variable nakl_id integer;
begin

  select
    dat,id_izg,id_zak,id_manager,nds,
    (select cast(z(sum(t.transh)) as numeric(15,4))
      from oplnakl t
      where t.id_from=o.id_nakl
    ) as potracheno
  from naklo o
  where o.tip=  (select oid
      from get_oid_objects_pc('ŒœÀ¿“€',-100)) and
    o.id_nakl=:id
    into :dat,:id_izg,
      :id_zak,:id_manager,:opl,:potracheno;
      
  id_nakl = gen_id(naklo_gen,1);
  nakl_id=gen_id(naklr_gen,1);
  insert into naklrf_vw (
    id_nakl, dat, id_izg, id_zak, id_manager, id,
    nds,  kurs,
    nalog_nds,delmarked
     )
  values
    (:id_nakl, :dat, :id_izg, :id_zak,:id_manager,:nakl_id,
    round(:opl-:potracheno,2),
      '1.000',
     (select nds from get_nds(:dat,null)),
     0
    );
end^

SET TERM ; ^

GRANT SELECT ON OPLNAKL TO PROCEDURE MAKE_FIN_TRASH_FINUSL;

GRANT SELECT ON NAKLO TO PROCEDURE MAKE_FIN_TRASH_FINUSL;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE MAKE_FIN_TRASH_FINUSL;

GRANT INSERT ON NAKLRF_VW TO PROCEDURE MAKE_FIN_TRASH_FINUSL;

GRANT EXECUTE ON PROCEDURE GET_NDS TO PROCEDURE MAKE_FIN_TRASH_FINUSL;

GRANT EXECUTE ON PROCEDURE MAKE_FIN_TRASH_FINUSL TO SYSDBA;
GRANT EXECUTE ON PROCEDURE MAKE_FIN_TRASH_FINUSL TO POWER_USER;

