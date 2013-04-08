SET TERM ^ ;

CREATE OR ALTER PROCEDURE OPLATY_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_manager integer;
  declare variable dat date;
  declare variable tip integer;
  declare variable id_schet_dolg integer;
  declare variable id_schet_tip integer;
  declare variable classid integer;
  declare variable nds numeric(15,4);
  declare variable posted integer;
  declare variable id_schet_dengi integer;
  declare variable id_bank integer;
  declare variable id_currency_bank integer;
  declare variable schet_name varchar(50);
  declare variable parent_id_nakl integer;
  declare variable id_izg_ukk integer;
  declare variable delmarked integer;
  declare variable id_xoz_oper_tip integer;
  declare variable id_xoz_oper integer;
  declare variable xoz_oper_name varchar(50);
  declare variable id_schet_post integer;
  declare variable id_schet_agent integer;
  declare variable id_agent integer;
  declare variable nds_from double precision;
  declare variable id_schet_dolg_usl integer;
  declare variable id_schet_finrez integer;
  declare variable id_project integer;
  declare variable id_statya_dr_tip integer;
  declare variable id_statya_dox integer;
  declare variable id_statya_ras integer;
  declare variable id_schet_post_usl integer;
  declare variable tip_transh integer;
  declare variable id_schet_dolg_finusl integer;
begin
  select om.tip,
      om.id_izg,om.id_zak,om.id_manager,
      om.nds,om.dat,om.posted,om.id_sklad,
      om.parent_id_nakl,om.delmarked,om.id_sklad_to,
      om.id_currency_to,om.nds_from
    from naklo om
    where om.id_nakl=:id_nakl and om.delmarked=0
    into :tip,
      :id_izg,:id_zak,:id_manager,
      :nds,:dat,:posted,:id_bank,:parent_id_nakl,:delmarked,:id_xoz_oper,
      :id_agent,:nds_from;
  if ((:posted = 1) and (id_schet is null)) then begin
    execute procedure oplaty_unpost_pc(:id_nakl);
  end
  select oid
    from GET_OID_OBJECTS_PC('ŒœÀ¿“€',-100)
    into :classid;
  if (tip<>classid) then begin
    execute procedure error('ÕÂÎ¸Áˇ ÔÓ‚ÂÒÚË ‰Û„ËÂ ‰ÓÍÛÏÂÌÚ˚ ÍÓÏÂ ÔÎ‡ÚÂÊÂÈ');
  end
  if (delmarked<>0) then begin
    execute procedure error ('ÕÂÎ¸Áˇ ÔÓ‚ÂÒÚË Û‰‡Î∏ÌÌ˚È ‰ÓÍÛÏÂÌÚ');
  end  
  select oid
    from GET_OID_OBJECTS_PC('“»œ —◊≈“¿',-100)
    into :id_schet_tip;
  if (id_schet is not null) then begin
    select name
      from get_name_objects_pc(:id_schet,:id_schet_tip)
      into schet_name;
  end    
  select oid
    from GET_OID_OBJECTS_PC('ƒŒÀ√» «¿  ¿¡≈À‹',:id_schet_tip)
    into :id_schet_dolg;
  select oid
    from GET_OID_OBJECTS_PC('ƒŒÀ√» «¿ ¿–≈Õƒ”',:id_schet_tip)
    into :id_schet_dolg_usl;
  select oid
    from GET_OID_OBJECTS_PC('ƒŒÀ√» «¿ ‘»Õ”—À”√»',:id_schet_tip)
    into :id_schet_dolg_finusl;    
  select oid
    from GET_OID_OBJECTS_PC('ƒ≈Õ‹√» Õ¿ —◊≈“¿’',:id_schet_tip)
    into :id_schet_dengi;
  select oid
    from GET_OID_OBJECTS_PC('–¿—◊®“€ — œŒ—“¿¬Ÿ» ¿Ã»',:id_schet_tip)
    into :id_schet_post;
  select oid
    from GET_OID_OBJECTS_PC('–¿—◊®“€ — œŒ—“¿¬Ÿ» ¿Ã» ”—À”√',:id_schet_tip)
    into :id_schet_post_usl;
  select oid
    from GET_OID_OBJECTS_PC('–¿—◊≈“€ — ¿√≈Õ“¿Ã»',:id_schet_tip)
    into :id_schet_agent;
  select oid
    from GET_OID_OBJECTS_PC('‘»Õ¿Õ—Œ¬€… –≈«”À‹“¿“',:id_schet_tip)
    into :id_schet_finrez;
  select oid
    from GET_OID_OBJECTS_PC('’Œ«ﬂ…—“¬≈ÕÕ€≈ Œœ≈–¿÷»»',-100)
    into :id_xoz_oper_tip;
  select oid
    from GET_OID_OBJECTS_PC('“»œ œ–Œ≈ “€',-100)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('‘»–Ã¿',:id_project)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('“»œ —“¿“‹» ƒŒ’ŒƒŒ¬ » –¿—’ŒƒŒ¬',-100)
    into :id_statya_dr_tip;
  select oid
    from GET_OID_OBJECTS_PC('ƒŒ’Œƒ Œ“  ŒÃ»——»… ¿√≈Õ“¿Ã',:id_statya_dr_tip)
    into :id_statya_dox;
  select oid
    from GET_OID_OBJECTS_PC('–¿—’Œƒ Õ¿  ŒÃ»——»» ¿√≈Õ“¿Ã',:id_statya_dr_tip)
    into :id_statya_ras;

  if (:id_xoz_oper is not null) then begin
    select name
      from get_name_objects_pc(:id_xoz_oper, :id_xoz_oper_tip)
      into :xoz_oper_name;
  end else begin
    xoz_oper_name='ŒœÀ¿“¿ œŒ ”œ¿“≈À≈Ã “Œ¬¿–Œ¬';
  end        
  /*”‰‡ÎÂÌËÂ ÔÓ‚Ó‰ÓÍ ÔÓ ‰ÓÍÛÏÂÌÚÛ ÚÓÎ¸ÍÓ ÔÓ Ó‰ÌÓÏÛ Ò˜∏ÚÛ. ƒÎˇ ÔÂÂÔÓ‚Â‰ÂÌËˇ*/
  if (id_schet is not null) then begin
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.tip=:tip
        and pr.id_schet=:id_schet;
  end
  if (:parent_id_nakl is null and id_schet is null) then begin
    select v.id
      from vlad_vw v
      where v.isdefault=1
      into :id_izg_ukk;
    if (:id_izg =:id_izg_ukk) then begin
      parent_id_nakl=gen_id(naklras_id_gen,1);
      update naklo om
        set om.parent_id_nakl =:parent_id_nakl
        where om.id_nakl=:id_nakl;
    end
  end
  if (((id_schet is null) or (schet_name='ƒŒÀ√» «¿  ¿¡≈À‹'))
    and (xoz_oper_name='ŒœÀ¿“¿ œŒ ”œ¿“≈À≈Ã “Œ¬¿–Œ¬'))
  then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4)
      values(:id_schet_dolg,:dat,:classid,
        :nds,:id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl);
  end  /*if 'ƒŒÀ√» «¿  ¿¡≈À‹'*/
  select b.id_currency
    from bank_vw b
    where b.oid=:id_bank
    into :id_currency_bank; 

  if (((id_schet is null) or (schet_name='ƒŒÀ√» «¿ ¿–≈Õƒ”'))
    and (xoz_oper_name='ŒœÀ¿“¿ œŒ ”œ¿“≈À≈Ã ”—À”√'))
  then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_dolg_usl,:dat,:classid,
        :nds,:id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_bank);
  end  /*if 'ƒŒÀ√» «¿ ¿–≈Õƒ”'*/
  
  if (((id_schet is null) or (schet_name='ƒŒÀ√» «¿ ‘»Õ”—À”√»'))
    and (xoz_oper_name='ŒœÀ¿“¿ œŒ ”œ¿“≈À≈Ã ‘»Õ”—À”√'))
  then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_dolg_finusl,:dat,:classid,
        :nds,:id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_bank);
  end  /*if 'ƒŒÀ√» «¿ ‘»Õ”—À”√»'*/

  if (((id_schet is null) or (schet_name='–¿—◊®“€ — œŒ—“¿¬Ÿ» ¿Ã»'))
    and (xoz_oper_name='¬Œ«¬–¿“ Œ“ œŒ—“¿¬Ÿ» ¿'))
  then begin
    /*—Ú‡˚Â Ú‡Ì¯Ë ÔË ÔÂÂÔÓ‚Â‰ÂÌËË Û‰‡Îˇ˛ÚÒˇ*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip in (1,3);
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip in (1,3);
    insert into provodki (id_schet,dat,tip,
      debet,id_nakl,
      sub1,sub2,sub3,sub4,sub5)
    values(:id_schet_post,:dat,:tip,
      (-1*:nds), :id_nakl,
      :id_zak,:id_izg,:id_manager,:id_nakl,:id_currency_bank);
    execute procedure naklo_auto_spend_pc(:id_schet_post,:id_nakl,:dat, :id_zak,:id_izg, :id_currency_bank, 3);
  end

  if (((id_schet is null) or (schet_name='–¿—◊®“€ — œŒ—“¿¬Ÿ» ¿Ã» ”—À”√'))
    and (xoz_oper_name='¬Œ«¬–¿“ Œ“ œŒ—“¿¬Ÿ» ¿ ”—À”√'))
  then begin
    select oid
      from get_oid_objects_pc('’Œ«ﬂ…—“¬≈ÕÕ€≈ Œœ≈–¿÷»»',-100)
      into :tip_transh;
    select oid
      from get_oid_objects_pc('“–¿Õÿ ¬ –¿—◊≈“¿’ — œŒ—“¿¬Ÿ» ¿Ã» ”—À”√ ¬Œ«¬–¿“',:tip_transh)
      into :tip_transh;
    /*—Ú‡˚Â Ú‡Ì¯Ë ÔË ÔÂÂÔÓ‚Â‰ÂÌËË Û‰‡Îˇ˛ÚÒˇ*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip=:tip_transh;
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=:tip_transh;
    insert into provodki (id_schet,dat,tip,
      debet,id_nakl,
      sub1,sub2,sub3,sub4,sub5)
    values(:id_schet_post_usl,:dat,:tip,
      (-1*:nds), :id_nakl,
      :id_zak,:id_izg,:id_manager,:id_nakl,:id_currency_bank);
  end
  
  if (((id_schet is null) or (schet_name='–¿—◊≈“€ — ¿√≈Õ“¿Ã»'))
    and (xoz_oper_name='ŒœÀ¿“¿ Œ“ ¿√≈Õ“¿'))
  then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2)
      values(:id_schet_agent,:dat,:classid,
        :nds,:id_nakl,
        :id_agent,:id_currency_bank);
    /*ÍÓÏËÒÒËˇ, Í‡Í ÛÏÂÌ¸¯ÂÌËÂ ‰ÓÎ„‡ ‡„ÂÌÚ‡*/
    if (:nds_from>0) then begin
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2)
        values(:id_schet_agent,:dat,:tip,
          Round(:nds_from,2),:id_nakl,
          :id_agent,:id_currency_bank);
    end else begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2)
        values(:id_schet_agent,:dat,:tip,
          Round(-:nds_from,2),:id_nakl,
          :id_agent,:id_currency_bank);    
    end        
  end  /*if '–¿—◊≈“€ — ¿√≈Õ“¿Ã»'*/
    
  if ((id_schet is null) or (schet_name='ƒ≈Õ‹√» Õ¿ —◊≈“¿’')) then begin
    if ((id_bank is not null and id_bank<>0) and (:dat>='31.05.07')) then begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3)
        values(:id_schet_dengi,:dat,:classid,
          Round(:nds,2),:id_nakl,
          :id_izg,:id_bank,:id_currency_bank);
    end /*if (id_bank is not null)*/
  end /*if 'ƒ≈Õ‹√» Õ¿ —◊≈“¿’'*/

  if (((id_schet is null) or (schet_name='‘»Õ¿Õ—Œ¬€… –≈«”À‹“¿“'))
    and (xoz_oper_name='ŒœÀ¿“¿ Œ“ ¿√≈Õ“¿'))
  then begin
    /*ÍÓÏËÒÒËˇ, Í‡Í ÛÏÂÌ¸¯ÂÌËÂ ‰ÓÎ„‡ ‡„ÂÌÚ‡*/
    if (:nds_from>0) then begin
      insert into provodki (id_schet,dat,tip,
          kredit,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(:nds_from,2),:id_nakl,
          :id_project,:id_statya_ras,:id_currency_bank,:id_izg,:id_zak,:id_manager);
    end else begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3,sub4,sub5,sub6)
        values(:id_schet_finrez,:dat,:tip,
          Round(-:nds_from,2),:id_nakl,
          :id_project,:id_statya_dox,:id_currency_bank,:id_izg,:id_zak,:id_manager);
    end        
  end  /*if '‘»Õ¿Õ—Œ¬€… –≈«”À‹“¿“'*/

  update naklo om
    set om.posted =1
    where om.id_nakl=:id_nakl and om.posted=0;

end^

SET TERM ; ^

DESCRIBE PROCEDURE OPLATY_POST_PC
'œÓ‚Ó‰Í‡ ÓÔÎ‡Ú ËÁ Ú‡·ÎËˆ˚ naklo';

GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE OPLATY_POST_PC;

GRANT EXECUTE ON PROCEDURE OPLATY_UNPOST_PC TO PROCEDURE OPLATY_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE OPLATY_POST_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE OPLATY_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE OPLATY_POST_PC;

GRANT SELECT,INSERT,DELETE ON PROVODKI TO PROCEDURE OPLATY_POST_PC;

GRANT SELECT ON VLAD_VW TO PROCEDURE OPLATY_POST_PC;

GRANT SELECT ON BANK_VW TO PROCEDURE OPLATY_POST_PC;

GRANT SELECT,DELETE ON OPLNAKL TO PROCEDURE OPLATY_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLO_AUTO_SPEND_PC TO PROCEDURE OPLATY_POST_PC;

GRANT EXECUTE ON PROCEDURE OPLATY_POST_PC TO TRIGGER NAKLO_AUDIT_AI80;
GRANT EXECUTE ON PROCEDURE OPLATY_POST_PC TO TRIGGER NAKLO_AUDIT_AU80;
GRANT EXECUTE ON PROCEDURE OPLATY_POST_PC TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT EXECUTE ON PROCEDURE OPLATY_POST_PC TO PROCEDURE PROVODKI_CHECK_VZPOST_PC;
GRANT EXECUTE ON PROCEDURE OPLATY_POST_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE OPLATY_POST_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE OPLATY_POST_PC TO MANAGER;
GRANT EXECUTE ON PROCEDURE OPLATY_POST_PC TO POWER_USER;
