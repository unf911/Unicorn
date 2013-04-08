SET TERM ^ ;

CREATE PROCEDURE STATYA_DR_SPISANIE_SEBEST_FIX (
    dat_from timestamp,
    dat_to timestamp,
    fix integer)
returns (
    id_nakl integer,
    spisanie_sebest double precision,
    sebest double precision,
    diff double precision)
as
declare variable id_schet_tip integer;
declare variable id_schet_sebest_sklad integer;
declare variable id_statya_dr_tip integer;
declare variable id_statya_ras integer;
declare variable id_schet_finrez integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('“»œ —◊≈“¿',-100)
    into :id_schet_tip;
  select oid
    from GET_OID_OBJECTS_PC('—≈¡≈—“Œ»ÃŒ—“‹ — À¿ƒ',:id_schet_tip)
    into :id_schet_sebest_sklad;
  select oid
    from GET_OID_OBJECTS_PC('“»œ —“¿“‹» ƒŒ’ŒƒŒ¬ » –¿—’ŒƒŒ¬',-100)
    into :id_statya_dr_tip;
  select oid
    from GET_OID_OBJECTS_PC('–¿—’Œƒ Œ“ —œ»—¿Õ»ﬂ —≈¡≈—“Œ»ÃŒ—“» “Œ¬¿–¿',:id_statya_dr_tip)
    into :id_statya_ras;
  select oid
    from GET_OID_OBJECTS_PC('‘»Õ¿Õ—Œ¬€… –≈«”À‹“¿“',:id_schet_tip)
    into :id_schet_finrez;
  for
    select pr.id_nakl, pr.kredit, sum(pr2.kredit), Round(pr.kredit-sum(pr2.kredit),2)
    from provodki pr inner join provodki pr2 on pr.id_nakl=pr2.id_nakl
    where pr.id_schet=:id_schet_finrez/*-39*/
      and pr.dat between :dat_from and :dat_to
      and pr.sub2=:id_statya_ras/*22822*/
      and pr2.id_schet=:id_schet_sebest_sklad/*11607*/
      and pr2.dat between :dat_from and :dat_to
    group by pr.id_nakl, pr.kredit
    having  Round(pr.kredit-sum(pr2.kredit),3)<>0
    into :id_nakl, :spisanie_sebest, :sebest,:diff
  do begin

    suspend;
    if (fix=1) then begin
      execute procedure naklo_post_pc(:id_nakl, :id_schet_finrez);
    end
  end
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE STATYA_DR_SPISANIE_SEBEST_FIX;

GRANT SELECT ON PROVODKI TO PROCEDURE STATYA_DR_SPISANIE_SEBEST_FIX;

GRANT EXECUTE ON PROCEDURE NAKLO_POST_PC TO PROCEDURE STATYA_DR_SPISANIE_SEBEST_FIX;

GRANT EXECUTE ON PROCEDURE STATYA_DR_SPISANIE_SEBEST_FIX TO SYSDBA;

