SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLPU_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
/*declare variable id_schet integer;*/
  declare variable schet_name varchar(50);
  declare variable id_schet_dolg integer;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_manager integer;
  declare variable dat date;
  declare variable tip integer;
  declare variable classid integer;
  declare variable nds numeric(15,4);
  declare variable id_nakl2 integer;
  declare variable id_schet_tip integer;
  declare variable id_currency_uah integer;
  declare variable max_dat_depend_nakl date;
  declare variable id_xoz_oper integer;
  declare variable id_xoz_oper_fact integer;
  declare variable id_xoz_oper_tip integer;
  declare variable parent_id_nakl integer;
  declare variable id_currency integer;
  declare variable tip_transh integer;
  declare variable id_schet_finrez integer;
  declare variable id_project integer;
  declare variable id_statya_ras integer;
begin
  /* Procedure Text */
  select om.tip,
      om.id_izg,om.id_zak,om.id_manager,
      om.nds,om.dat,om.id_nakl,om.id_sklad_to,om.parent_id_nakl,
      om.id_currency,om.id_sklad,om.id_currency_to
    from naklo om
    where om.id_nakl=:id_nakl and om.delmarked=0
    into :tip,
      :id_izg,:id_zak,:id_manager,
      :nds,:dat,:id_nakl2,:id_xoz_oper,:parent_id_nakl,
      :id_currency,:id_project,:id_statya_ras;
   /**/


  /*ïğîâåğêè*/
  if (id_nakl2 is null) then begin
    execute procedure error('Äîêóìåíò íå íàéäåí');
  end
  select oid
    from GET_OID_OBJECTS_PC('ÏĞÈÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ ÍÀ ÓÑËÓÃÈ',-100)
    into :classid;
  if (tip<>classid) then begin
    execute procedure error('Íåëüçÿ ïğîâåñòè íå ïğèõîäíóş íàêëàäíóş íà óñëóãè');
  end
  select oid
    from get_oid_objects_pc('ÕÎÇßÉÑÒÂÅÍÍÛÅ ÎÏÅĞÀÖÈÈ',-100)
    into :id_xoz_oper_tip;
  select oid
    from get_oid_objects_pc('ÏĞÈÕÎÄÍÀß ÍÀ ÓÑËÓÃÈ ÔÀÊÒ ×ÀÑÒÜ',:id_xoz_oper_tip)
    into :id_xoz_oper_fact;

  if (id_xoz_oper=:id_xoz_oper_fact) then begin
    if (:parent_id_nakl is null) then begin
      execute procedure error('Íåëüçÿ ïğîâåñòè áåç óêàçàíèÿ ğîäèòåëüñêîé íàêëàäíîé');
    end
  end
  select max(dat)
    from naklo om
    where om.tip=:classid and om.delmarked=0 and om.posted=1 and
      om.parent_id_nakl=:id_nakl
    into :max_dat_depend_nakl;
  if (max_dat_depend_nakl is not null) then begin
    if (:dat>incdate(firstdaymonth(max_dat_depend_nakl),0,2,0)) then begin
      execute procedure error('Äàòà ôàêò ÷àñòè '||
        datetostr(:max_dat_depend_nakl, '%d.%m.%y') ||
        ', ïîıòîìó äàòà äîëæíà áûòü <='||
        datetostr(incdate(firstdaymonth(max_dat_depend_nakl),0,2,0), '%d.%m.%y'));
    end
  end
  execute procedure naklo_can_modify_common_pc(:dat,:id_manager);


  /*èäåíòèôèêàòîğû îáúåêòîâ*/
  if (id_schet =0 ) then begin
    id_schet = null;
  end

  if (/*$$IBEC$$ (:posted = 1) and $$IBEC$$*/ (id_schet is null)) then begin
    execute procedure naklpu_unpost_pc(:id_nakl);
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
    from GET_OID_OBJECTS_PC('ĞÀÑ×¨ÒÛ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ ÓÑËÓÃ',:id_schet_tip)
    into :id_schet_dolg;
  select oid
    from GET_OID_OBJECTS_PC('ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ',:id_schet_tip)
    into :id_schet_finrez;

  select oid from get_oid_objects_pc('ÒÈÏ ÂÀËŞÒ',-100) into :id_currency_uah;
  select oid from get_oid_objects_pc('UAH',:id_currency_uah) into :id_currency_uah;    

  /*Óäàëåíèå ïğîâîäîê ïî äîêóìåíòó òîëüêî ïî îäíîìó ñ÷¸òó. Äëÿ ïåğåïğîâåäåíèÿ*/
  if (id_schet is not null) then begin
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.tip=:tip
        and pr.id_schet=:id_schet;
  end     

  /*ïğîâîäêè*/
  if ((id_schet is null) or (schet_name='ĞÀÑ×¨ÒÛ Ñ ÏÎÑÒÀÂÙÈÊÀÌÈ ÓÑËÓÃ') ) then begin
      /* -65='ÒĞÀÍØ Â ĞÀÑ×ÅÒÀÕ Ñ ÏÎÑÒÀÙÈÊÀÌÈ ÓÑËÓÃ' */
      select oid
        from get_oid_objects_pc('ÒĞÀÍØ Â ĞÀÑ×ÅÒÀÕ Ñ ÏÎÑÒÀÙÈÊÀÌÈ ÓÑËÓÃ',:id_xoz_oper_tip)
        into :tip_transh;
      /*Ñòàğûå òğàíøè ïğè ïåğåïğîâåäåíèè óäàëÿşòñÿ*/
      delete from oplnakl t
        where t.id_to=:id_nakl and t.tip=:tip_transh;
      insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_dolg,:dat,:tip,
        :nds, :id_nakl,
        :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency);
      execute procedure naklo_auto_spend_pc(:id_schet_dolg,:id_nakl,
        :dat, :id_izg,:id_zak, :id_currency, :tip_transh);

  end /*ÄÎËÃÈ ÇÀ ÊÀÁÅËÜ*/

  if ((id_schet is null) or (schet_name='ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ')) then begin
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4,sub5,sub6)
      values(:id_schet_finrez,:dat,:tip,
        Round(:nds,2),:id_nakl,
        :id_project,:id_statya_ras,:id_currency,:id_izg,:id_zak,:id_manager);
  end /*'ÔÈÍÀÍÑÎÂÛÉ ĞÅÇÓËÜÒÀÒ'*/

  update naklo om
    set om.posted =1
    where om.id_nakl=:id_nakl;
end^

SET TERM ; ^

GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE NAKLPU_POST_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE NAKLPU_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLPU_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLO_CAN_MODIFY_COMMON_PC TO PROCEDURE NAKLPU_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLPU_UNPOST_PC TO PROCEDURE NAKLPU_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE NAKLPU_POST_PC;

GRANT SELECT,INSERT,DELETE ON PROVODKI TO PROCEDURE NAKLPU_POST_PC;

GRANT SELECT,DELETE ON OPLNAKL TO PROCEDURE NAKLPU_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLO_AUTO_SPEND_PC TO PROCEDURE NAKLPU_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLPU_POST_PC TO PROCEDURE PROVODKI_CHECK_FINREZ_PC;
GRANT EXECUTE ON PROCEDURE NAKLPU_POST_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE NAKLPU_POST_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE NAKLPU_POST_PC TO POWER_USER;
