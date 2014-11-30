CREATE OR ALTER PROCEDURE NAKLOT_SEBEST2_VOZVR_SKL_PC (
    id_nakld integer,
    id_uchet_politics integer,
    id_schet integer)
returns (
    sebest double precision,
    id_partiya integer)
as
declare variable id_nakl integer;
declare variable id_tovar integer;
declare variable kolotp double precision;
declare variable id_sklad_nakl integer;
declare variable dat date;
declare variable id_sklad_seb integer;
declare variable itemp integer;
declare variable serror varchar(100);
declare variable tip integer;
declare variable id_schet_sebest integer;
declare variable sum_partiya_kolotp double precision;
declare variable parent_id_nakl integer;
declare variable sub1 integer;
declare variable sub2 integer;
declare variable kredit_kolotp double precision;
declare variable kredit double precision;
declare variable partiya_kolotp_vozvrat double precision;
declare variable sebest_partiya double precision;
begin
  select id_nakl,id_tovar,round(kolotp,3)
    from naklot ot
    where ot.id_nakld=:id_nakld
    into :id_nakl,:id_tovar,:kolotp;
  /*спец режим для излишков и недостач по себест
    он только информирует о полученной себест, т.е. как submode=0*/

  select id_sklad,dat,
      tip, parent_id_nakl
    from naklo om
    where om.id_nakl=:id_nakl
    into :id_sklad_nakl,:dat,
      :tip,:parent_id_nakl;
    
  if (z(kolotp)=0 /*$$IBEC$$ and mode<>2 $$IBEC$$*/) then begin
    exit;
  end
  if (tip=1) then begin
    select oid
      from GET_OID_OBJECTS_PC('ПРИХОДНЫЕ СКЛАДСКИЕ НАКЛАДНЫЕ',-100)
      into :tip;
    /*tip_prixod=:tip;*/
  end
  
  id_schet_sebest=id_schet;
  
  if (id_uchet_politics is null) then begin
    sError = 'Ошибка в n_s2_v_s_pc. Укажите учётную политику. id_nakld='||coalesce(:id_nakld,0);
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
    sError = 'Ошибка в n_s2_v_s_pc. №1. id_uchet_politics='|| coalesce(:id_uchet_politics,0);
    execute procedure error(sError);
  end
  select parent_id_nakl from vozvrat_vw om where om.id_nakl=:parent_id_nakl into :parent_id_nakl;
  for
    select pr.sub1, pr.sub2,pr.sub3,
        pr.kredit_kolotp,pr.kredit
      from naklo om inner join naklot ot
        on om.id_nakl=ot.id_nakl
        inner join provodki pr on
        ot.id_nakl=pr.id_nakl and ot.id_nakld=pr.attr1
      where om.parent_id_nakl=:parent_id_nakl and
        om.tip=5 and
        pr.id_schet=:id_schet_sebest and
        ot.id_tovar=:id_tovar
      into :sub1,:sub2,:id_partiya,:kredit_kolotp,:kredit
  do begin
    sum_partiya_kolotp=z(sum_partiya_kolotp)+z(kredit_kolotp);
    if (sum_partiya_kolotp<=kolotp) then begin
      partiya_kolotp_vozvrat=-1*:kredit_kolotp;
      sebest_partiya=-1*:kredit;
    end else begin
      partiya_kolotp_vozvrat=-1*Round(:kolotp-(:sum_partiya_kolotp-:kredit_kolotp),3);
      sebest_partiya=Round(dzero(:kredit,:kredit_kolotp,0)*:partiya_kolotp_vozvrat,2);
    end
    insert into provodki(id_schet,id_nakl,tip,dat,
        kredit,kredit_kolotp,
        sub1,sub2,sub3,attr1)
      values(:id_schet_sebest,:id_nakl, :tip,:dat,
        :sebest_partiya,:partiya_kolotp_vozvrat,
        :sub1,:sub2, :id_partiya,:id_nakld);
    if (z(sum_partiya_kolotp)>=kolotp) then begin
      leave;
    end
  end


  if (Round(z(sum_partiya_kolotp),3)<round(:kolotp,3)) then begin
    sError ='Ошибка в n_s2_v_s_c. Нет себестоимости для id_tovar='
      || coalesce(:id_tovar,0) || '. id_nakl=' ||coalesce(:id_nakl,0)
      || ' d='|| z(round(z(:kolotp),3)-round(z(sum_partiya_kolotp),3));
    execute procedure error(sError);
  end
  select Round(dzero(sum(pr.kredit),sum(pr.kredit_kolotp),0),2)
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
end

