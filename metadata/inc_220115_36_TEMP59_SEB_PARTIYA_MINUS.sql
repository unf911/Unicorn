SET TERM ^ ;

CREATE OR ALTER PROCEDURE TEMP59_SEB_PARTIYA_MINUS (
    id_tovar_in integer,
    id_sklad_in integer,
    dat_to_in timestamp,
    mode_in integer)
returns (
    id_tovar integer,
    id_sklad integer,
    id_partiya bigint,
    kolotp_seb double precision,
    id_nakld integer,
    dat timestamp,
    tip integer)
as
declare variable id_schet_tip integer;
declare variable id_schet_sebest_sklad integer;
declare variable kolotp_after double precision;
declare variable mode integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
    into :id_schet_tip;
  select oid
    from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ СКЛАД',:id_schet_tip)
    into :id_schet_sebest_sklad;   
  for
    select sub1,sub2, sub3,sum(r.kolotp_after)
      from rep_ostatki_pc(:id_schet_sebest_sklad,:dat_to_in,:id_tovar_in,:id_sklad_in,
        null,null,null,null,
        null,null,null,null) r
      group  by sub1,sub2,sub3
      having Round(sum(r.kolotp_after),4)<0
      into :id_tovar,:id_sklad,:id_partiya, :kolotp_seb
  do begin
    if (mode_in=2) then begin
/*Пересчёт только расходов по партиям
     особенно полезно если отрицательная партия
     состоит только из недостачи и прихода для
     пересчёта просто не существует*/  
      select first 1 pr.attr1,pr.tip,pr.dat
        from provodki pr
        where pr.id_schet = :id_schet_sebest_sklad and
          pr.sub3=:id_partiya and
          pr.sub1=:id_tovar and
          pr.sub2=:id_sklad and
          pr.kredit_kolotp>0
        order by pr.dat desc
        into :id_nakld,:tip,:dat;
      execute procedure naklp_sebest4_recount_pc(:id_nakld,
        :id_sklad,:id_partiya,:tip,4);
    end
    suspend;    
    
  end
EXIT;
end
^

SET TERM ; ^


