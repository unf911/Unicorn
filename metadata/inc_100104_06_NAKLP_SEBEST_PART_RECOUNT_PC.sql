SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLP_SEBEST_PART_RECOUNT_PC(
    ID_SCHET_IN INTEGER,
    DAT_FROM_IN TIMESTAMP,
    ID_TOVAR_IN INTEGER,
    ID_SKLAD_IN INTEGER,
    ID_PARTIYA_IN INTEGER)
AS
  declare variable id_schet_tip integer;
  declare variable id_nakld integer;
  declare variable id_nakl integer;
  declare variable tip integer;
begin
  if (id_schet_in is null) then begin
    select oid
      from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
      into :id_schet_tip;
    select oid
      from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ БУХ',:id_schet_tip)
      into :id_schet_in;
  end
  if (dat_from_in is null) then begin
    dat_from_in='01.01.2000';
  end

  /*Выясняем первый приход по этой партии и дальше просто
    пересчитываем его и зависимые режиме 3*/
  select first 1 pr.attr1,pr.id_nakl,pr.tip
    from provodki pr
    where pr.id_schet=:id_schet_in and
      pr.sub2=:id_sklad_in and
      pr.sub1=:id_tovar_in and
      pr.sub3=:id_partiya_in and
      pr.dat>=:dat_from_in and
      pr.debet_kolotp>0
    order by pr.dat
    into :id_nakld,:id_nakl,:tip;
  if (id_nakld is not null) then begin
    /*Пересчёт прихода*/
    execute procedure naklp_sebest_recount_pc(
      :id_nakl,:id_nakld,:id_sklad_in,
      :id_schet_in,:tip,:dat_from_in,4);
  end else begin
    /*Не найдено прихода по этой партии в данном периоде,
      пересчитываем расход*/
    for
      select  pr.attr1,pr.id_nakl,pr.tip
      from provodki pr
      where pr.id_schet=:id_schet_in and
        pr.sub2=:id_sklad_in and
        pr.sub1=:id_tovar_in and
        pr.sub3=:id_partiya_in and
        pr.dat>=:dat_from_in and
        pr.kredit_kolotp>0
      order by pr.dat
      into :id_nakld,:id_nakl,:tip
    do begin
      execute procedure naklp_sebest_recount_pc(
        :id_nakl,:id_nakld,:id_sklad_in,
        :id_schet_in,:tip,:dat_from_in,1);      
    end/**/
  end/*if (id_nakld_in is not null)*/
end^

SET TERM ; ^

DESCRIBE PROCEDURE NAKLP_SEBEST_PART_RECOUNT_PC
'
mode=5 - пересчитать партию товара
  на вход id_nakl_in - номер товара (sub1)
  кроме того требуется id_sklad_in, id_partiya_in,dat_from_in';

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLP_SEBEST_PART_RECOUNT_PC;

GRANT SELECT ON PROVODKI TO PROCEDURE NAKLP_SEBEST_PART_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO PROCEDURE NAKLP_SEBEST_PART_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_PART_RECOUNT_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_PART_RECOUNT_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_PART_RECOUNT_PC TO POWER_USER;

