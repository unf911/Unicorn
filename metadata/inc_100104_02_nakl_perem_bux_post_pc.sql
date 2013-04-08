SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKL_PEREM_BUX_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
  declare variable name varchar(50);
  declare variable schet_name varchar(50);
  declare variable id_schet_bux integer;
  declare variable id_schet_bux_tara integer;
  declare variable id_schet_tip integer;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_manager integer;
  declare variable dat date;
  declare variable parent_id_nakl integer;
  declare variable tip integer;
  declare variable nds double precision;
  declare variable kurs double precision;
  declare variable nalog_nds double precision;
  declare variable cena double precision;
  declare variable kolotp double precision;
  declare variable id_tovar integer;
  declare variable id_currency integer;
  declare variable id_sklad integer;
  declare variable posted integer;
  declare variable delmarked integer;  
  declare variable tara integer;
  declare variable id_sebest integer;
  declare variable sError varchar(250);
  declare variable id_pos integer;
  declare variable id_uchet_politics_in integer;
  declare variable id_sklad_seb integer;
  declare variable id_uchet_politics integer;
  declare variable id_nakld integer;
  declare variable sebest double precision;
  declare variable id_currency_to integer;
  declare variable id_sklad_to integer;
begin
  select om.tip,om.id_izg,om.id_zak,om.id_manager,
      om.nds,om.dat,om.parent_id_nakl,om.kurs,
      om.id_currency,om.id_sklad,om.nalog_nds,
      om.posted,om.delmarked,om.id_currency_to,
      om.id_sklad_to
    from naklo om
    where om.id_nakl=:id_nakl
    into :tip,:id_izg, :id_zak,:id_manager,
      :nds,:dat,:parent_id_nakl,:kurs,
      :id_currency,:id_sklad,:nalog_nds,
      :posted,:delmarked,:id_currency_to,
      :id_sklad_to;
  select name from get_name_objects_pc(:tip,-100) into :name;
  
  if (name='¡”’√¿À“≈–— Œ≈ œ≈–≈Ã≈Ÿ≈Õ»≈') then begin
    /*ÔÓ‚ÂÍË*/
    if (delmarked<>0) then begin
      execute procedure error ('ÕÂÎ¸Áˇ ÔÓ‚ÂÒÚË Û‰‡Î∏ÌÌ˚È ‰ÓÍÛÏÂÌÚ');
    end
    if (id_schet =0 ) then begin
      id_schet = null;
    end
    if ((posted<>0) and (id_schet is null)) then begin
      execute procedure error ('ÕÂÎ¸Áˇ ÔÓ‚ÂÒÚË ÛÊÂ ÔÓ‚Â‰ÂÌÌ˚È ‰ÓÍÛÏÂÌÚ');
    end      
    if ((posted=0) and (id_schet is not null)) then begin
      sError = 'ÕÂÎ¸Áˇ ˜‡ÒÚË˜ÌÓ ÔÓ‚ÂÒÚË ÌÂ ÔÓ‚Â‰ÂÌÌ˚È ‰ÓÍÛÏÂÌÚ' || coalesce(:id_schet,999);
      execute procedure error (sError);
    end

    /*»‰ÂÌÚËÙËÍ‡ÚÓ˚*/
    select oid
      from GET_OID_OBJECTS_PC('“»œ —◊≈“¿',-100)
      into :id_schet_tip;
    if (id_schet is not null) then begin
      select name
        from get_name_objects_pc(:id_schet,:id_schet_tip)
        into schet_name;
    end
    select oid
      from GET_OID_OBJECTS_PC('—≈¡≈—“Œ»ÃŒ—“‹ ¡”’',:id_schet_tip)
      into :id_schet_bux;
    select oid
      from GET_OID_OBJECTS_PC('—≈¡≈—“Œ»ÃŒ—“‹ ¡”’ “¿–¿',:id_schet_tip)
      into :id_schet_bux_tara;
    select oid
      from GET_OID_OBJECTS_PC('œŒÀ»“» » —œ»—¿Õ»ﬂ —≈¡≈—“Œ»ÃŒ—“»',-100)
      into :id_uchet_politics_in;
    select oid
      from GET_OID_OBJECTS_PC('¡”’√¿À“≈–— »… ”◊®“',:id_uchet_politics_in)
      into :id_uchet_politics_in;
    /*”‰‡ÎÂÌËÂ ÔÓ‚Ó‰ÓÍ ÔÓ ‰ÓÍÛÏÂÌÚÛ ÚÓÎ¸ÍÓ ÔÓ Ó‰ÌÓÏÛ Ò˜∏ÚÛ. ƒÎˇ ÔÂÂÔÓ‚Â‰ÂÌËˇ*/
    if (id_schet is not null) then begin
      delete from provodki pr
        where pr.id_nakl=:id_nakl
          and pr.tip=:tip
          and pr.id_schet=:id_schet;
    end
    update naklo om
      set om.posted=1
      where om.posted=0 and
        om.delmarked=0 and
        om.id_nakl=:id_nakl;     
      
    if ((id_schet is null) or
      (schet_name='—≈¡≈—“Œ»ÃŒ—“‹ ¡”’') or
      (schet_name='—≈¡≈—“Œ»ÃŒ—“‹ ¡”’ “¿–¿')) then
    begin
      select first 1 id_sklad,id_uchet_politics
        from sklad_sebest_settings_pc(:ID_SKLAD_TO, :id_uchet_politics_in)
        into :id_sklad_seb,:id_uchet_politics;
    end
    for
      select ot.id_tovar,ot.cena,ot.kolotp,
          t.tara,ot.id_sebest,ot.id_pos,ot.id_nakld
        from naklot ot inner join tovar t
          on ot.id_tovar=t.oid
        where ot.id_nakl=:id_nakl 
        /*¬ÒÂ ÚÓ‚‡˚ ÍÓÏÂ Ú‡˚*/
        into :id_tovar,:cena,:kolotp,
          :tara,:id_sebest,:id_pos,:id_nakld
    do begin
      if (((id_schet is null) or (schet_name='—≈¡≈—“Œ»ÃŒ—“‹ ¡”’')) and
        (:tara=2) and (:dat>='31.05.06')) then
      begin
        select sebest
          from naklot_sebest2_naklr_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_bux)
          into :sebest;
      end /*if (((id_schet is null) or (schet_name='—≈¡≈—“Œ»ÃŒ—“‹ ¡”’'))*/
      
      if (((id_schet is null) or (schet_name='—≈¡≈—“Œ»ÃŒ—“‹ ¡”’ “¿–¿')) and
        (:tara=1) and (:dat>='31.05.06')) then
      begin
        select sebest
          from naklot_sebest2_naklr_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_bux_tara)
          into :sebest;
      end /*if (((id_schet is null) or (schet_name='—≈¡≈—“Œ»ÃŒ—“‹ ¡”’ “¿–¿')) */
      if (((id_schet is null) or (schet_name='—≈¡≈—“Œ»ÃŒ—“‹ ¡”’')) and
        (:tara=2) and (:dat>='31.05.06')) then
      begin
        select sebest
          from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_bux,11,1)
          into :sebest;
        execute procedure naklp_sebest_recount_pc(:id_nakl, :id_nakld,
          :id_sklad_seb,id_schet_bux,:tip,null,2);
      end/*if (((id_schet is null) or (schet_name='—≈¡≈—“Œ»ÃŒ—“‹ ¡”’'))*/
      if (((id_schet is null) or (schet_name='—≈¡≈—“Œ»ÃŒ—“‹ ¡”’ “¿–¿')) and
        (:tara=1) and (:dat>='31.05.06')) then
      begin
        select sebest
          from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_bux_tara,11,1)
          into :sebest;
      end/*if (((id_schet is null) or (schet_name='—≈¡≈—“Œ»ÃŒ—“‹ ¡”’ “¿–¿')) */
    end/*for naklot*/
  end /*if name='¡”’√¿À“≈–— Œ≈ œ≈–≈Ã≈Ÿ≈Õ»≈'*/
end^

SET TERM ; ^

DESCRIBE PROCEDURE NAKL_PEREM_BUX_POST_PC
'œÓ‚Â‰ÂÌËÂ ·Ûı ÔÂÂÏÂ˘ÂÌËÈ';

GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE NAKL_PEREM_BUX_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE NAKL_PEREM_BUX_POST_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE NAKL_PEREM_BUX_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKL_PEREM_BUX_POST_PC;

GRANT SELECT,DELETE ON PROVODKI TO PROCEDURE NAKL_PEREM_BUX_POST_PC;

GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_SETTINGS_PC TO PROCEDURE NAKL_PEREM_BUX_POST_PC;

GRANT SELECT ON NAKLOT TO PROCEDURE NAKL_PEREM_BUX_POST_PC;

GRANT SELECT ON TOVAR TO PROCEDURE NAKL_PEREM_BUX_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_NAKLR_PC TO PROCEDURE NAKL_PEREM_BUX_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKL_PEREM_BUX_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST_RECOUNT_PC TO PROCEDURE NAKL_PEREM_BUX_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKL_PEREM_BUX_POST_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE NAKL_PEREM_BUX_POST_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE NAKL_PEREM_BUX_POST_PC TO POWER_USER;
GRANT EXECUTE ON PROCEDURE NAKL_PEREM_BUX_POST_PC TO SKLAD;
