SET TERM ^ ;
SET TERM ^ ;


CREATE TRIGGER NAKLRU_VW_BU FOR NAKLRU_VW
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


ALTER TRIGGER NAKLRU_VW_BU
as
begin


  if (trim(new.blocked)<>trim(old.blocked)) then begin
    if (not (current_role in ('BUXG','POWER_USER')) and (not (user='SYSDBA')))  then begin
      execute procedure error('Запрещено менять поле "Оригинал""');
    end
  end else begin
    execute procedure can_modify_naklot(new.id_nakl);
  end


  update naklo om
  set om.id_nakl=new.id_nakl,
    om.id=new.id,
    om.kurs=new.kurs,
    om.nds=new.nds,
    om.dat=new.dat,
    om.id_izg=new.id_izg,
    om.id_zak=new.id_zak,
    om.id_manager=new.id_manager,
    om.nalog_nds=new.nalog_nds,
    om.posted = new.posted,
    om.blocked = new.blocked,
    om.delmarked = new.delmarked,
    om.id_currency = new.id_currency,
    om.id_currency_to=new.id_statya,
    om.id_sklad=new.id_project,
    om.id_sklad_to=new.id_xoz_oper,
    om.comment=new.comment,
    om.parent_id_nakl=new.parent_id_nakl,
    om.id_dogovor=new.id_dogovor
  where om.id_nakl=old.id_nakl;
end
^


SET TERM ; ^

ALTER TRIGGER NAKLRU_VW_BU
as
begin
  execute procedure can_modify_naklot(new.id_nakl);

  if (trim(new.blocked)<>trim(old.blocked)) then begin
    if (not (current_role in ('BUXG','POWER_USER')) and (not (user='SYSDBA')))  then begin
      execute procedure error('Запрещено менять поле "Оригинал""');
    end    
  end


  update naklo om
  set om.id_nakl=new.id_nakl,
    om.id=new.id,
    om.kurs=new.kurs,
    om.nds=new.nds,
    om.dat=new.dat,
    om.id_izg=new.id_izg,
    om.id_zak=new.id_zak,
    om.id_manager=new.id_manager,
    om.nalog_nds=new.nalog_nds,
    om.posted = new.posted,
    om.blocked = new.blocked,
    om.delmarked = new.delmarked,
    om.id_currency = new.id_currency,
    om.id_currency_to=new.id_statya,
    om.id_sklad=new.id_project,
    om.id_sklad_to=new.id_xoz_oper,
    om.comment=new.comment,
    om.parent_id_nakl=new.parent_id_nakl,
    om.id_dogovor=new.id_dogovor
  where om.id_nakl=old.id_nakl;
end

SET TERM ; ^