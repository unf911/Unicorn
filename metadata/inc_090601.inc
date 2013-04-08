CREATE OR ALTER PROCEDURE SCHET_MAKE_FROM_SCHET(
    ID_NAKL_IN INTEGER,
    DAT_NEW DATE,
    ID_TOVAR_FROM INTEGER,
    ID_TOVAR_TO INTEGER)
RETURNS (
    ID_NAKL INTEGER)
AS
declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id varchar(20);
  declare variable id_manager integer;
  declare variable nds double precision;
  declare variable kurs double precision;
  declare variable nalog_nds double precision;
  declare variable vsego double precision;
  declare variable id_bank integer;
  declare variable id_nakld_from integer;
begin
  /*Копирование шапки*/
  select
    KURS,
    ID,
    NDS,
    VSEGO,
    ID_BANK,
    NALOG_NDS,
    ID_IZG,
    ID_ZAK,
    ID_MANAGER
  from schet s
  where s.schet=:id_nakl_in
  into
    :KURS,
    :ID,
    :NDS,
    :VSEGO ,
    :ID_BANK,
    :NALOG_NDS,
    :ID_IZG,
    :ID_ZAK,
    :ID_MANAGER;
  id_nakl=GEN_ID(schet_gen,1);
  id=gen_id(schet_id_gen,1);
  insert into schet (    DAT,
      SCHET,
      KURS,
      ID,
      NDS,
      VSEGO,
      ID_BANK,
      NALOG_NDS,
      ID_IZG,
      ID_ZAK,
      ID_MANAGER)
    values (
      :DAT_new,
      :id_nakl,
      :KURS,
      :ID,
      :NDS,
      :VSEGO ,
      :ID_BANK,
      :NALOG_NDS,
      :ID_IZG,
      :ID_ZAK,
      :ID_MANAGER
    );
  /*копирование позиций*/
  for
    select sch
    from schett ot
    where ot.schet=:id_nakl_in
    order by ot.npp
    into :id_nakld_from
  do begin
    execute procedure naklot_det_copy_pc(:id_nakl,:id_nakld_from,null,3);
  end
  /*Изменение товара*/
  if ((id_tovar_from is not null) and (id_tovar_from<>0) ) then begin
    update schett ot
    set ot.id_tovar=:id_tovar_to
    where ot.id_tovar=:id_tovar_from and ot.schet=:id_nakl;
  end
end
