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
    from GET_OID_OBJECTS_PC('ÎÏËÀÒÛ',-100)
    into :classid;
  if (tip<>classid) then begin
    execute procedure error('Íåëüçÿ ïğîâåñòè äğóãèå äîêóìåíòû êğîìå ïëàòåæåé');
  end
  if (delmarked<>0) then begin
    execute procedure error ('Íåëüçÿ ïğîâåñòè óäàë¸ííûé äîêóìåíò');
  end  
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ Ñ×ÅÒÀ',-100)
    into :id_schet_tip;
  if (id_schet is not null) then begin
    select name
      from get_name_objects_pc(:id_schet,:id_schet_tip)
      into schet_name;
  end    
  select oid
    from GET_OID_OBJECTS_PC('ÄÎËÃÈ ÇÀ ÊÀÁÅËÜ',:id_schet_tip)
    into :id_schet_dolg;
  select oid
    from GET_OID_OBJECTS_PC('ÄÎËÃÈ ÇÀ ÓÑËÓÃÈ',:id_schet_tip)
    into :id_schet_dolg_usl;
  select oid
    from GET_OID_OBJECTS_PC('ÄÎËÃÈ ÇÀ ÔÈÍÓÑËÓÃÈ',:id_schet_tip)
    into :id_schet_dolg_finusl;    
  select oid
    from GET_OID_OBJECTS_PC('ÄÅÍÜÃÈ ÍÀ Ñ×ÅÒÀÕ',:id_schet_tip)
    into :id_schet_dengi;
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑ×¨ÒÛ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ',:id_schet_tip)
    into :id_schet_post;
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑ×¨ÒÛ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ ÓÑËÓÃ',:id_schet_tip)
    into :id_schet_post_usl;
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑ×ÅÒÛ Ñ ÀÃÅÍÒÀÌÈ',:id_schet_tip)
    into :id_schet_agent;
  select oid
    from GET_OID_OBJECTS_PC('ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ',:id_schet_tip)
    into :id_schet_finrez;
  select oid
    from GET_OID_OBJECTS_PC('ÕÎÇßÉÑÒÂÅÍÍÛÅ ÎÏÅĞÀÖÈÈ',-100)
    into :id_xoz_oper_tip;
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ ÏĞÎÅÊÒÛ',-100)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('ÔÈĞÌÀ',:id_project)
    into :id_project;
  select oid
    from GET_OID_OBJECTS_PC('ÒÈÏ ÑÒÀÒÜÈ ÄÎÕÎÄÎÂ È ĞÀÑÕÎÄÎÂ',-100)
    into :id_statya_dr_tip;
  select oid
    from GET_OID_OBJECTS_PC('ÄÎÕÎÄ ÎÒ ÊÎÌÈÑÑÈÉ ÀÃÅÍÒÀÌ',:id_statya_dr_tip)
    into :id_statya_dox;
  select oid
    from GET_OID_OBJECTS_PC('ĞÀÑÕÎÄ ÍÀ ÊÎÌÈÑÑÈÈ ÀÃÅÍÒÀÌ',:id_statya_dr_tip)
    into :id_statya_ras;

  if (:id_xoz_oper is not null) then begin
    select name
      from get_name_objects_pc(:id_xoz_oper, :id_xoz_oper_tip)
      into :xoz_oper_name;
  end else begin
    xoz_oper_name='ÎÏËÀÒÀ ÏÎÊÓÏÀÒÅËÅÌ ÒÎÂÀĞÎÂ';
  end        
  /*Óäàëåíèå ïğîâîäîê ïî äîêóìåíòó òîëüêî ïî îäíîìó ñ÷¸òó. Äëÿ ïåğåïğîâåäåíèÿ*/
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
  if (((id_schet is null) or (schet_name='ÄÎËÃÈ ÇÀ ÊÀÁÅËÜ'))
    and (xoz_oper_name='ÎÏËÀÒÀ ÏÎÊÓÏÀÒÅËÅÌ ÒÎÂÀĞÎÂ'))
  then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4)
      values(:id_schet_dolg,:dat,:classid,
        :nds,:id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl);
  end  /*if 'ÄÎËÃÈ ÇÀ ÊÀÁÅËÜ'*/
  select b.id_currency
    from bank_vw b
    where b.oid=:id_bank
    into :id_currency_bank; 

  if (((id_schet is null) or (schet_name='ÄÎËÃÈ ÇÀ ÓÑËÓÃÈ'))
    and (xoz_oper_name='ÎÏËÀÒÀ ÏÎÊÓÏÀÒÅËÅÌ ÓÑËÓÃ'))
  then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_dolg_usl,:dat,:classid,
        :nds,:id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_bank);
  end  /*if 'ÄÎËÃÈ ÇÀ ÓÑËÓÃÈ'*/
  
  if (((id_schet is null) or (schet_name='ÄÎËÃÈ ÇÀ ÔÈÍÓÑËÓÃÈ'))
    and (xoz_oper_name='ÎÏËÀÒÀ ÏÎÊÓÏÀÒÅËÅÌ ÔÈÍÓÑËÓÃ'))
  then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_dolg_finusl,:dat,:classid,
        :nds,:id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_bank);
  end  /*if 'ÄÎËÃÈ ÇÀ ÔÈÍÓÑËÓÃÈ'*/

  if (((id_schet is null) or (schet_name='ĞÀÑ×¨ÒÛ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ'))
    and (xoz_oper_name='ÂÎÇÂĞÀÒ ÎÒ ÏÎÑÒÀÂÙÈÊÀ'))
  then begin
    /*Ñòàğûå òğàíøè ïğè ïåğåïğîâåäåíèè óäàëÿşòñÿ*/
    delete from oplnakl t
      where t.id_from=:id_nakl and t.tip=3;
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=3;
    insert into provodki (id_schet,dat,tip,
      debet,id_nakl,
      sub1,sub2,sub3,sub4,sub5)
    values(:id_schet_post,:dat,:tip,
      (-1*:nds), :id_nakl,
      :id_zak,:id_izg,:id_manager,:id_nakl,:id_currency_bank);
    execute procedure oplaty_auto_spend_pc(:id_schet_post,:id_nakl,:dat, :id_zak,:id_izg, null,:id_currency_bank, 3,0);
  end

  if (((id_schet is null) or (schet_name='ĞÀÑ×¨ÒÛ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ ÓÑËÓÃ'))
    and (xoz_oper_name='ÂÎÇÂĞÀÒ ÎÒ ÏÎÑÒÀÂÙÈÊÀ ÓÑËÓÃ'))
  then begin
    select oid
      from get_oid_objects_pc('ÕÎÇßÉÑÒÂÅÍÍÛÅ ÎÏÅĞÀÖÈÈ',-100)
      into :tip_transh;
    select oid
      from get_oid_objects_pc('ÒĞÀÍØ Â ĞÀÑ×ÅÒÀÕ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ ÓÑËÓÃ ÂÎÇÂĞÀÒ',:tip_transh)
      into :tip_transh;
    /*Ñòàğûå òğàíøè ïğè ïåğåïğîâåäåíèè óäàëÿşòñÿ*/
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
    /*execute procedure oplaty_auto_spend_pc(:id_schet_post_usl,:id_nakl,:dat, :id_zak,:id_izg, null,:id_currency_bank, :tip_transh,0);*/
  end
  
  if (((id_schet is null) or (schet_name='ĞÀÑ×ÅÒÛ Ñ ÀÃÅÍÒÀÌÈ'))
    and (xoz_oper_name='ÎÏËÀÒÀ ÎÒ ÀÃÅÍÒÀ'))
  then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2)
      values(:id_schet_agent,:dat,:classid,
        :nds,:id_nakl,
        :id_agent,:id_currency_bank);
    /*êîìèññèÿ, êàê óìåíüøåíèå äîëãà àãåíòà*/
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
  end  /*if 'ĞÀÑ×ÅÒÛ Ñ ÀÃÅÍÒÀÌÈ'*/
    
  if ((id_schet is null) or (schet_name='ÄÅÍÜÃÈ ÍÀ Ñ×ÅÒÀÕ')) then begin
    if ((id_bank is not null and id_bank<>0) and (:dat>='31.05.07')) then begin
      insert into provodki (id_schet,dat,tip,
          debet,id_nakl,
          sub1,sub2,sub3)
        values(:id_schet_dengi,:dat,:classid,
          Round(:nds,2),:id_nakl,
          :id_izg,:id_bank,:id_currency_bank);
    end /*if (id_bank is not null)*/
  end /*if 'ÄÅÍÜÃÈ ÍÀ Ñ×ÅÒÀÕ'*/

  if (((id_schet is null) or (schet_name='ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ'))
    and (xoz_oper_name='ÎÏËÀÒÀ ÎÒ ÀÃÅÍÒÀ'))
  then begin
    /*êîìèññèÿ, êàê óìåíüøåíèå äîëãà àãåíòà*/
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
  end  /*if 'ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ'*/

  update naklo om
    set om.posted =1
    where om.id_nakl=:id_nakl and om.posted=0;

end^

SET TERM ; ^
