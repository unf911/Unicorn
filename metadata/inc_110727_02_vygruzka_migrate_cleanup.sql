SET TERM ^ ;

create procedure TEMP_VYGRUZKA_MIGRATE_FROM_REYS 
as
declare variable NOMER_PRITSEPA varchar(50);
declare variable PUNKT_VYGRUZKI varchar(50);
declare variable ID_REYS integer;
declare variable id_vygruzka integer;
begin
  for select(select A.VALUE1 
      from ATTRIBUTES A 
      where A.OID = S.ID_REYS and A.ATTRIBUTE_ID = 8) as NOMER_PRITSEPA, 
          S.NOMER_PRITSEPA as PUNKT_VYGRUZKI, S.ID_REYS as ID_REYS 
      from SPR_REYS_VW S order by S.ID_REYS 
      into :NOMER_PRITSEPA, :PUNKT_VYGRUZKI, :ID_REYS 
  do
  begin
    id_vygruzka = gen_id(naklo_gen, 1);
    insert into SPR_VYGRUZKA_VW(ID_REYS, PUNKT_VYGRUZKI, ID_VYGRUZKA)
    values(:ID_REYS, :PUNKT_VYGRUZKI, :id_vygruzka);

    update SPR_REYS_VW S 
    set S.NOMER_PRITSEPA = :NOMER_PRITSEPA,
      s.pokupatel_platit=0,
      s.cena_reysa=0
    where S.ID_REYS = :ID_REYS;

    update naklo
    set parent_id_nakl=:id_vygruzka
    where parent_id_nakl=:id_reys and tip=3047;
  end
end^

SET TERM ; ^

GRANT SELECT ON ATTRIBUTES TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;

GRANT SELECT,UPDATE ON SPR_REYS_VW TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;

GRANT INSERT ON SPR_VYGRUZKA_VW TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;

GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS;

GRANT EXECUTE ON PROCEDURE TEMP_VYGRUZKA_MIGRATE_FROM_REYS TO SYSDBA;

  
/*$$IBEC$$ update naklo
set om.lico = (select a.value1
    from attributes a
    where a.oid=om.id_nakl and a.attribute_id=8)
where tip= -106   $$IBEC$$*//*ÑÏÐÀÂÎ×ÍÈÊ ÐÅÉÑÎÂ*/

/******/
delete from CLASS_ATTRIBUTES where OID=-106
/*and ATTRIBUTE_ID=1, ATTRIBUTE_NAME, ATTRIBUTE_TYPE, CLASSID) VALUES (-106, 1, 'Íîìåð ïðèöåïà', 1, NULL);*/

