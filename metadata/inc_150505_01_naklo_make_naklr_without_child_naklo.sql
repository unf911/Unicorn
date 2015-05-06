SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLO_MAKE_NAKLR_PC (
    id_nakl_in integer)
returns (
    id_nakl integer)
as
declare variable delmarked integer;
declare variable id_sklad integer;
declare variable id_izg integer;
declare variable id_zak integer;
declare variable id_currency integer;
declare variable stemp varchar(250);
declare variable fr varchar(5);
declare variable id varchar(20);
declare variable id_manager integer;
declare variable tip integer;
declare variable parent_id_nakl integer;
declare variable nds double precision;
declare variable kurs double precision;
declare variable nalog_nds double precision;
declare variable dat date;
declare variable parent_delmarked integer;
declare variable tip_rasx_nakl integer;
begin
  select
      n.delmarked,n.id_sklad,n.tip,n.dat,
      n.parent_id_nakl,n.nds,n.kurs,n.nalog_nds,
      n.id_izg,n.id_zak,n.id_manager,
      n.id_currency
    from naklo n
    where n.id_nakl = :id_nakl_in
    into
      :delmarked,:id_sklad,:tip,:dat,
      :parent_id_nakl,:nds,:kurs,:nalog_nds,
      :id_izg,:id_zak,:id_manager,
      :id_currency;
  if (tip not in (5,103)) then  begin
    stemp ='Ошибка. Расходную можно создать только из отгрузки или хранения';
    execute procedure error(stemp);
  end
  
  if (parent_id_nakl is not null) then begin
    select delmarked
      from naklo om
      where om.id_nakl=:parent_id_nakl
      into :parent_delmarked;
    if (parent_delmarked=0) then begin
      stemp = 'Ошибка. Родительская расходная накладная уже существует';
      execute procedure error(stemp);
    end
  end
  
  fr='б/н';
  id=gen_id(naklr_gen_id,1);
  id_nakl=gen_id(naklo_gen,1);
  insert into naklr_vw (id_nakl,id,kurs,
      nds,dat,id_izg,id_zak, id_manager,
      nalog_nds,fr,delmarked,id_currency,
      id_sklad)
    values (:id_nakl,:id,:kurs,
      :nds,:dat,:id_izg,:id_zak, :id_manager,
      :nalog_nds,:fr,:delmarked,:id_currency,
      :id_sklad);
  select oid
    from get_oid_objects_pc('РАСХОДНЫЕ НАКЛАДНЫЕ',-100)
    into :tip_rasx_nakl;
  execute procedure naklot_doc_copy_pc(:id_nakl, :id_nakl_in, :tip_rasx_nakl, 2);
  suspend;
end^

SET TERM ; ^

DESCRIBE PROCEDURE NAKLO_MAKE_NAKLR_PC
'Создание расходной накладной из
складской отгрузки или хранения
Используется в Склад-Отгрузки со склада.';

GRANT SELECT ON NAKLO TO PROCEDURE NAKLO_MAKE_NAKLR_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE NAKLO_MAKE_NAKLR_PC;

GRANT INSERT ON NAKLR_VW TO PROCEDURE NAKLO_MAKE_NAKLR_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLO_MAKE_NAKLR_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_DOC_COPY_PC TO PROCEDURE NAKLO_MAKE_NAKLR_PC;

GRANT EXECUTE ON PROCEDURE NAKLO_MAKE_NAKLR_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE NAKLO_MAKE_NAKLR_PC TO MANAGER;
GRANT EXECUTE ON PROCEDURE NAKLO_MAKE_NAKLR_PC TO POWER_USER;
GRANT EXECUTE ON PROCEDURE NAKLO_MAKE_NAKLR_PC TO SKLAD;
GRANT EXECUTE ON PROCEDURE NAKLO_MAKE_NAKLR_PC TO SNAB;

