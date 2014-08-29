SET TERM ^ ;

CREATE PROCEDURE NAKLO_DELMARK_PC(
    ID_NAKL INTEGER)
AS
DECLARE VARIABLE ID_OSTT INTEGER;
DECLARE VARIABLE TIP SMALLINT;
DECLARE VARIABLE POSTED SMALLINT;
DECLARE VARIABLE BLOCKED SMALLINT;
DECLARE VARIABLE DELMARKED SMALLINT;
DECLARE VARIABLE ID_DET INTEGER;
DECLARE VARIABLE ID_NAKLD INTEGER;
begin
  /* добавить проверки на безопасность ( шматков может, а
  остальные не могут провести)*/
  select om.delmarked,om.tip,om.posted,om.blocked
    from naklo om
    where om.id_nakl=:id_nakl
    into :delmarked,:tip,:posted,:blocked;

    if (tip not in (1,2,5,6,103,30,-110)) then begin
      execute procedure error ('Нельзя удалить неизвесную накладную');
    end  
    if (delmarked<>0) then begin
      execute procedure error ('Нельзя удалить уже удалённую накладную');
    end
    if (posted=1) then begin
      execute procedure error ('Нельзя удалить проведенную накладную');
    end    
    if (blocked=1) then begin
      execute procedure error ('Нельзя удалить заблокированную накладную');
    end    

  for
    select
        sd.id_ostt,od.id_det
      from naklot ot inner join naklodet od
        on ot.id_nakld=od.id_nakld
        inner join sklostdet sd
        on sd.id_det=od.id_det
      where ot.id_nakl = :id_nakl
      group by sd.id_ostt,od.id_det
      into :id_ostt,:id_det
  do begin
    /* first loop */
    delete from sklostdet sd
      where sd.id_ostt=:id_ostt and sd.id_det=:id_det;
    execute procedure sklostdet_recalc_pc(:id_ostt);
  end
  /*Удалённая складская не должна остаться в отправке*/
  delete from otpravkit_vw ot where ot.id_pos=:id_nakl;
  update
    naklo om
  set
    om.delmarked=1,
    om.parent_id_nakl = null
  where
    om.id_nakl=:id_nakl;
END^

SET TERM ; ^

DESCRIBE PROCEDURE NAKLO_DELMARK_PC
'для пометки отгрузок на удаление';

GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE NAKLO_DELMARK_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE NAKLO_DELMARK_PC;

GRANT SELECT ON NAKLOT TO PROCEDURE NAKLO_DELMARK_PC;

GRANT SELECT ON NAKLODET TO PROCEDURE NAKLO_DELMARK_PC;

GRANT SELECT,DELETE ON SKLOSTDET TO PROCEDURE NAKLO_DELMARK_PC;

GRANT EXECUTE ON PROCEDURE SKLOSTDET_RECALC_PC TO PROCEDURE NAKLO_DELMARK_PC;

GRANT SELECT,DELETE ON OTPRAVKIT_VW TO PROCEDURE NAKLO_DELMARK_PC;

GRANT EXECUTE ON PROCEDURE NAKLO_DELMARK_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE NAKLO_DELMARK_PC TO MANAGER;
GRANT EXECUTE ON PROCEDURE NAKLO_DELMARK_PC TO POWER_USER;
GRANT EXECUTE ON PROCEDURE NAKLO_DELMARK_PC TO SKLAD;
