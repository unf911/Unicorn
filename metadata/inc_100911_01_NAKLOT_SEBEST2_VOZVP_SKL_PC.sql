SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLOT_SEBEST2_VOZVP_SKL_PC(
    ID_NAKLD INTEGER,
    ID_UCHET_POLITICS INTEGER,
    ID_SCHET INTEGER)
RETURNS (
    SEBEST DOUBLE PRECISION,
    ID_PARTIYA INTEGER)
AS
  declare variable id_nakl integer;
  declare variable id_tovar integer;
  declare variable kolotp double precision;
  declare variable id_sklad_nakl integer;
  declare variable dat date;
  declare variable id_sklad_seb integer;
  declare variable iTemp integer;
  declare variable sError varchar(100);
  declare variable tip integer;
  declare variable id_schet_sebest integer;
  declare variable sum_partiya_kolotp double precision;
  declare variable parent_id_nakl integer;
  declare variable sub1 integer;
  declare variable sub2 integer;
  declare variable partiya_kolotp_vozvrat double precision;
  declare variable sebest_partiya double precision;
  declare variable debet_kolotp double precision;
  declare variable debet double precision;
begin
  select id_nakl,id_tovar,round(kolotp,4)
    from naklot ot
    where ot.id_nakld=:id_nakld
    into :id_nakl,:id_tovar,:kolotp;


  select id_sklad,dat,
      tip, parent_id_nakl
    from naklo om
    where om.id_nakl=:id_nakl
    into :id_sklad_nakl,:dat,
      :tip,:parent_id_nakl;
    
  if (z(kolotp)=0 /*$$IBEC$$ and mode<>2 $$IBEC$$*/) then begin
    exit;
  end

  
  id_schet_sebest=id_schet;
  
  if (id_uchet_politics is null) then begin
    sError = 'Ошибка в n_s2_vp_s_pc. Укажите учётную политику. id_nakld='||coalesce(:id_nakld,0);
    execute procedure error(sError);
  end
  select first 1 id_sklad,id_uchet_politics
    from sklad_sebest_settings_pc(:id_sklad_nakl,:id_uchet_politics)
    into :id_sklad_seb,:id_uchet_politics;    


  iTemp = null;
  select 
      u.oid
    from spr_uchet_politics_vw u
    where u.oid=:id_uchet_politics and u.delmarked=0
    into 
      :iTemp;
  if (iTemp is null) then begin
    sError = 'Ошибка в n_s2_vp_s_pc. №1. id_uchet_politics='|| coalesce(:id_uchet_politics,0);
    execute procedure error(sError);
  end
  /*Приходная бух накл которая явл родит возврата поставщику*/
  select parent_id_nakl from vozvrat_post_vw om where om.id_nakl=:parent_id_nakl into :parent_id_nakl;
  /*Складские приходы привяз к прих бух накл*/
  for
    select pr.sub1, pr.sub2,pr.sub3, pr.debet_kolotp,pr.debet
      from naklo om inner join naklot ot
        on om.id_nakl=ot.id_nakl
        inner join provodki pr on
        ot.id_nakl=pr.id_nakl and ot.id_nakld=pr.attr1
      where om.parent_id_nakl=:parent_id_nakl and
        om.tip=1 and
        pr.id_schet=:id_schet_sebest and
        ot.id_tovar=:id_tovar
      into :sub1, :sub2, :id_partiya, :debet_kolotp, :debet
  do begin
    sum_partiya_kolotp=z(sum_partiya_kolotp)+z(debet_kolotp);
    if (sum_partiya_kolotp<=kolotp) then begin
      partiya_kolotp_vozvrat=-1*:debet_kolotp;
      sebest_partiya=-1*:debet;
    end else begin
      partiya_kolotp_vozvrat=-1*Round(:sum_partiya_kolotp-:kolotp,3);
      sebest_partiya=Round(dzero(:debet,:debet_kolotp,0)*:partiya_kolotp_vozvrat,2);
    end
    insert into provodki(id_schet,id_nakl,tip,dat,
        debet,debet_kolotp,
        sub1,sub2,sub3,attr1)
      values(:id_schet_sebest,:id_nakl, :tip,:dat,
        :sebest_partiya,:partiya_kolotp_vozvrat,
        :sub1,:sub2, :id_partiya,:id_nakld);
    if (sum_partiya_kolotp>=kolotp) then begin
      leave;
    end
  end
  if (sum_partiya_kolotp<:kolotp) then begin
    sError ='Ошибка в n_s2_vp_s_c. Нет себестоимости для id_tovar=' || coalesce(:id_tovar,0) || '. id_nakl=' ||coalesce(:id_nakl,0);
    execute procedure error(sError);
  end
  select Round(dzero(sum(pr.debet),sum(pr.debet_kolotp),0),2)
    from provodki pr
    where 
      pr.tip<>1 and
      pr.id_schet=:id_schet_sebest and
      pr.sub1=:id_tovar and
      pr.sub2=:id_sklad_seb and
      pr.id_nakl=:id_nakl and
      pr.attr1=:id_nakld 
    into :sebest;
  SUSPEND;
end^

SET TERM ; ^

DESCRIBE PROCEDURE NAKLOT_SEBEST2_VOZVP_SKL_PC
'Проведение позиции отгрузки, которая привязана к возврату поставщику товара.';

GRANT SELECT ON NAKLOT TO PROCEDURE NAKLOT_SEBEST2_VOZVP_SKL_PC;

GRANT SELECT ON NAKLO TO PROCEDURE NAKLOT_SEBEST2_VOZVP_SKL_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE NAKLOT_SEBEST2_VOZVP_SKL_PC;

GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_SETTINGS_PC TO PROCEDURE NAKLOT_SEBEST2_VOZVP_SKL_PC;

GRANT SELECT ON SPR_UCHET_POLITICS_VW TO PROCEDURE NAKLOT_SEBEST2_VOZVP_SKL_PC;

GRANT SELECT ON VOZVRAT_POST_VW TO PROCEDURE NAKLOT_SEBEST2_VOZVP_SKL_PC;

GRANT SELECT,INSERT ON PROVODKI TO PROCEDURE NAKLOT_SEBEST2_VOZVP_SKL_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_VOZVP_SKL_PC TO SYSDBA;

