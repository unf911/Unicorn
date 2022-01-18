SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLOT_SEBEST2_VOZVRATPOST_PC (
    id_nakld integer,
    id_uchet_politics integer,
    id_schet integer)
returns (
    sebest double precision,
    id_partiya bigint)
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
declare variable partiya_kolotp double precision;
declare variable kredit_kolotp double precision;
declare variable kredit double precision;
declare variable flag_more integer;
declare variable id_post integer;
declare variable id_izg integer;
declare variable flag_end_of_partiya integer;
begin
  select id_nakl,id_tovar,round(kolotp,4)
    from naklot ot
    where ot.id_nakld=:id_nakld
    into :id_nakl,:id_tovar,:kolotp;

  select id_sklad,dat,
      tip, id_izg
      /*, parent_id_nakl */
    from naklo om
    where om.id_nakl=:id_nakl
    into :id_sklad_nakl,:dat,
      :tip, :id_izg
      /*, :parent_id_nakl*/
      ;
    
  if (z(kolotp)=0 /*$$IBEC$$ and mode<>2 $$IBEC$$*/) then begin
    exit;
  end
  
  id_schet_sebest=id_schet;
  
  if (id_uchet_politics is null) then begin
    sError = 'Ошибка в n_s2_vp_pc. Укажите учётную политику. id_nakld='||coalesce(:id_nakld,0);
    execute procedure error(sError);
  end
  select first 1 id_sklad,id_uchet_politics
    from sklad_sebest_settings_pc(:id_sklad_nakl,:id_uchet_politics)
    into :id_sklad_seb,:id_uchet_politics;    


  iTemp = null;
  select u.oid
    from spr_uchet_politics_vw u
    where u.oid=:id_uchet_politics and u.delmarked=0
    into :iTemp;
  if (iTemp is null) then begin
    sError = 'Ошибка в n_s2_vp_pc. №1. id_uchet_politics='|| coalesce(:id_uchet_politics,0);
    execute procedure error(sError);
  end
/*$$IBEC$$   sum_partiya_kolotp=0;
  for
    select pr.sub1, pr.sub2,pr.sub3,pr.sub4,pr.sub5,
        pr.debet_kolotp,pr.debet
      from provodki pr 
      where pr.id_nakl=:parent_id_nakl and
        pr.id_schet=:id_schet_sebest and
        pr.sub1=:id_tovar
      into :sub1,:sub2,:id_partiya,:sub4,:sub5,:debet_kolotp,:debet
  do begin
    sum_partiya_kolotp=z(sum_partiya_kolotp)+z(debet_kolotp);
    if (sum_partiya_kolotp<=kolotp) then begin
      partiya_kolotp_vozvrat=-1*:debet_kolotp;
      sebest_partiya=-1*:debet;
    end else begin
      partiya_kolotp_vozvrat=-1*Round(:kolotp-(:sum_partiya_kolotp-:debet_kolotp),3);
      sebest_partiya=Round(dzero(:debet,:debet_kolotp,0)*:partiya_kolotp_vozvrat,4);
    end
    insert into provodki(id_schet,id_nakl,tip,dat,
        debet,debet_kolotp,
        sub1,sub2,sub3,sub4,sub5,attr1)
      values(:id_schet_sebest,:id_nakl, :tip,:dat,
        :sebest_partiya,:partiya_kolotp_vozvrat,
        :sub1,:sub2, :id_partiya,:sub4,:sub5,:id_nakld);
    if (sum_partiya_kolotp>=kolotp) then begin
      leave;
    end
  end $$IBEC$$*/

  /*Проведение расходной накладной*/
  kredit_kolotp = null;
  flag_more=1;
  sum_partiya_kolotp=0;
  /*Пусть партии для расхода берутся на берутся на сегодня,
   даже если отгружали в 2003 году, а товара не было
   то в дело пойдет первый приход после этого,
   а то очень много партий с колвом меньше нуля
   накапливается на складе*/
  for
    select sub3,Round(sum(kolotp_after),3),
      sum(r.debetafter)-sum(r.kreditafter)/*$$IBEC$$ ,
      min(sub5) $$IBEC$$*/
    from rep_ostatki_pc(:id_schet_sebest,:dat,/*current_timestamp,*/
      :id_tovar,:id_sklad_seb,
      null,:id_izg,
      null,null,
      null,null,
      null,null) r
    group by sub1,sub2,sub3,sub4
    having Round(sum(kolotp_after),3)>0
    order by sub3
    into :id_partiya,:kredit_kolotp,:kredit/*$$IBEC$$ ,:id_post $$IBEC$$*/
  do begin
    select first 1 pr.sub5
      from provodki pr
      where pr.id_schet=:id_schet_sebest and
        pr.sub1=:id_tovar and
        pr.sub2=:id_sklad_seb and
        pr.sub3=:id_partiya and
        pr.debet_kolotp>0
      order by pr.dat
      into :id_post;
    /*для расходных накладных сумму нужно округлять до 4 знаков, а не до 2,
      как для складской отгрузки.*/
    kredit=Round(:kredit,4);
    if (kredit_kolotp is null) then begin
      sError ='Ошибка в n_s2_nr #3. Нет себестоимости для id_tovar=' || coalesce(:id_tovar,0) || '. id_nakl=' ||coalesce(:id_nakl,0);
      execute procedure error(sError);
    end
    /*Потребуется ещё себестоимость*/
    flag_more=1;
    flag_end_of_partiya=1;
    if (:kredit_kolotp>=Round(z(:kolotp-:sum_partiya_kolotp),3)) then begin
      if (:kredit_kolotp=Round(z(:kolotp-:sum_partiya_kolotp),3)) then begin
        flag_end_of_partiya=1;
      end else begin
        flag_end_of_partiya=0;
      end
      flag_more=0;
      partiya_kolotp=Round(z(:kolotp-:sum_partiya_kolotp),4);
    end else begin
      partiya_kolotp=:kredit_kolotp;      
    end
    sum_partiya_kolotp=Round(z(partiya_kolotp)+z(sum_partiya_kolotp),4);
    /*для расходных накладных сумму нужно округлять до 4 знаков, а не до 2,
      как для складской отгрузки.*/      
    /*Если в бух себест отгрузка последняя в партии, то цену считать по сумме*/
    if (flag_end_of_partiya=0) then begin
     /*Если же середина партии, то брать тупо по цене первого прихода*/
      select first 1 pr.debet,pr.debet_kolotp
        from provodki pr
        where pr.id_schet=:id_schet_sebest and
          pr.dat<=:dat and
          pr.sub1=:id_tovar and
          pr.sub2=:id_sklad_seb and
          pr.sub3=:id_partiya and
          pr.sub4=:id_izg and
          pr.debet>0
        order by dat
        into :kredit,:kredit_kolotp;
      partiya_kolotp = (-1)* partiya_kolotp;
      sebest=Round(Round(dzero(kredit,kredit_kolotp,0),2)*partiya_kolotp,4);
    end else begin/*if (flag_more=1)*/
      partiya_kolotp = (-1)* partiya_kolotp;
      /*Последняя сумма тратится полностью без округлений*/
      sebest=Round(dzero(kredit,kredit_kolotp,0)*partiya_kolotp,4);
    end /*if (flag_more=1)*/

    insert into provodki(id_schet,id_nakl,tip,dat,
        debet,debet_kolotp,
        sub1,sub2,sub3,sub4,sub5,attr1)
      values(:id_schet_sebest,:id_nakl, :tip,:dat,
        :sebest,:partiya_kolotp,
        :id_tovar,:id_sklad_seb, :id_partiya,:id_izg,:id_post,:id_nakld);
    if (flag_more<>1) then begin
      leave;
    end
    kredit_kolotp = null;
    /*Прописывание расхода в проводках*/
  end /*for*/

  if (round(sum_partiya_kolotp,3)<round(:kolotp,3)) then begin
    sError ='Ошибка в n_s2_vp_c. Нет себестоимости для id_tovar=' || coalesce(:id_tovar,0) || '. id_nakl=' ||coalesce(:id_nakl,0);
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
end
^

SET TERM ; ^


