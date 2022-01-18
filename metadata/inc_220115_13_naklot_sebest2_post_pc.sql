SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLOT_SEBEST2_POST_PC (
    id_nakl integer,
    id_nakld integer,
    mode_for_otgr integer)
returns (
    id_partiya bigint,
    sebest double precision)
as
declare variable tip_vozvrat integer;
declare variable parent_tip integer;
declare variable id_partiya_xran bigint;
declare variable id_sklad_to integer;
declare variable tip integer;
declare variable parent_id_nakl integer;
declare variable tip_rasx integer;
declare variable id_uchet_politics_in integer;
declare variable id_schet_tip integer;
declare variable id_sklad integer;
declare variable id_uchet_politics integer;
declare variable id_schet_sebest_sklad integer;
begin
  if (mode_for_otgr is null) then begin
    mode_for_otgr = 3; /*Проведение складской расходной накладной */
  end
  select oid from get_oid_objects_pc('ВОЗВРАТ ПОСТАВЩИКУ',-100) into :tip_vozvrat;
  select oid from GET_OID_OBJECTS_PC('РАСХОДНЫЕ НАКЛАДНЫЕ',-100) into :tip_rasx;
  select oid from GET_OID_OBJECTS_PC('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100) into :id_uchet_politics_in;
  select oid from GET_OID_OBJECTS_PC('УПРАВЛЕНЧЕСКИЙ УЧЁТ',:id_uchet_politics_in) into :id_uchet_politics_in;
  select oid from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100) into :id_schet_tip;
  select oid from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ СКЛАД',:id_schet_tip) into :id_schet_sebest_sklad;

  select tip, parent_id_nakl, id_sklad_to, id_sklad
    from naklo om
    where om.id_nakl=:id_nakl
    into :tip, :parent_id_nakl, :id_sklad_to, :id_sklad;

  select id_uchet_politics
    from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
    into :id_uchet_politics;
  if (:id_uchet_politics is  null) then begin
    exit; /* !!! */
  end
  if (tip in (5,30,103)) then begin

    /*Удалить старые проводки*/
    select sebest
      from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,2,2)
      into :sebest;

    select om.tip from naklo om where om.id_nakl=:parent_id_nakl into :parent_tip;

    if ((parent_id_nakl is not null) and (parent_tip=:tip_vozvrat))  then begin
      /*Возврат поставщику*/
      select sebest,id_partiya
        from naklot_sebest2_vozvp_skl_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad)
        into :sebest,:id_partiya;
    end else begin
      /*Всё остальное*/
      /*пересыпать себестоимость по новому*/
      /*Если приход, то надо оприходовать себестоимость на конечный склад*/
      select sebest,id_partiya
        from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad, :mode_for_otgr, 2)
        into :sebest,:id_partiya;
    end /*if ((parent_id_nakl is not null) and (parent_tip=:tip_vozvrat))*/

  end /*if (:id_sklad=102) */
  if ((tip=103 )  /*and (id_sklad_to<>id_sklad)*/)  then begin

    select sebest, id_partiya
      from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,4,2)
      into :sebest, :id_partiya_xran;

   /*Пересчитывают после себя приходы излишки и хранения*/
   /*Убрал, т.к. naklp_sebest4_recount_pc проваливается в рекурсию навсегда из-за этой строчки
     теперь это обязанность клиентов этой процедуры вызывать такую строчку для пересчёта зависимых от хранения*/
    /*execute procedure naklp_sebest4_recount_pc(:id_nakld, :id_sklad_to, :id_partiya_xran,:tip,4); */

  end /*tip=103*/

    /*Если случайно расходная, то удаляем проводки*/
  if (tip=:tip_rasx) then begin
      select sebest
        from naklot_sebest2_count_pc(:id_nakld,:id_uchet_politics,:id_schet_sebest_sklad,2,2)
        into :sebest;       
  end /*if (tip_depend=3047)*/
  suspend;
end
^

SET TERM ; ^


