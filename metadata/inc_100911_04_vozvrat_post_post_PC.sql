SET TERM ^ ;

CREATE OR ALTER PROCEDURE VOZVRAT_POST_POST_PC(
    ID_NAKL INTEGER,
    ID_SCHET INTEGER)
AS
  declare variable posted smallint;
  declare variable delmarked smallint;
  declare variable id_sklad integer;
  declare variable dat date;
  declare variable parent_id_nakl integer;
  declare variable nds double precision;
  declare variable nalog_nds double precision;
  declare variable id_izg integer;
  declare variable id_zak integer;
  declare variable id_manager integer;
  declare variable tip_to_process integer;
  declare variable tip integer;
  declare variable id_schet_tip integer;
  declare variable sError varchar(250);
  declare variable schet_name varchar(50);
  declare variable id_tovar integer;
  declare variable kolotp double precision;
  declare variable kolotp_parent double precision;
  declare variable tovar_name varchar(50);
  declare variable id_schet_dolg integer;
  declare variable id_schet_prix integer;
  declare variable cena double precision;
  declare variable id_nakld integer;
  declare variable id_currency integer;
  declare variable id_schet_bux integer;
  declare variable id_schet_bux_tara integer;
  declare variable id_uchet_politics_in integer;
  declare variable id_uchet_politics integer;
  declare variable tara integer;
  declare variable sebest double precision;
  declare variable id_schet_post integer;
  declare variable id_schet_dolg_nal integer;
  declare variable id_currency_uah integer;
  declare variable id_nakl_depend integer;
begin
  /*автозаполнение валют, ставок налогов,курсов*/
  execute procedure naklo_autofill_cn_pc(:id_nakl);
  select
      n.posted, n.delmarked, n.id_sklad, n.dat,
      n.parent_id_nakl, n.nds, n.nalog_nds,
      n.id_izg, n.id_zak, n.id_manager,
      n.tip, n.id_currency
    from
      naklo n
    where
      n.id_nakl = :id_nakl
    into
      :posted, :delmarked, :id_sklad,:dat,
      :parent_id_nakl, :nds, :nalog_nds,
      :id_izg, :id_zak, :id_manager,
      :tip, :id_currency ;
  select oid
    from GET_OID_OBJECTS_PC('ВОЗВРАТ ПОСТАВЩИКУ',-100)
    into :tip_to_process;
  select oid
    from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
    into :id_schet_tip;
  select oid
    from GET_OID_OBJECTS_PC('РАСЧЁТЫ С ПОСТАВЩИКАМИ',:id_schet_tip)
    into :id_schet_post;    
  select oid
    from GET_OID_OBJECTS_PC('НЕСОБЛЮДЕНИЕ ПРИХОДОВ',:id_schet_tip)
    into :id_schet_prix;
  select oid
    from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ БУХ',:id_schet_tip)
    into :id_schet_bux;
  select oid
    from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ БУХ ТАРА',:id_schet_tip)
    into :id_schet_bux_tara;
  select oid
    from GET_OID_OBJECTS_PC('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('БУХГАЛТЕРСКИЙ УЧЁТ',:id_uchet_politics_in)
    into :id_uchet_politics_in;
  select oid from GET_OID_OBJECTS_PC('НАЛИЧНЫЕ ДОЛГИ',:id_schet_tip) into :id_schet_dolg_nal;
  select oid from get_oid_objects_pc('ТИП ВАЛЮТ',-100) into :id_currency_uah;
  select oid from get_oid_objects_pc('UAH',:id_currency_uah) into :id_currency_uah;    
            
  select id_uchet_politics
    from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
    into :id_uchet_politics;             
  if (delmarked<>0) then begin
    execute procedure error ('Нельзя провести удалённый документ');
  end
  if (id_schet =0 ) then begin
    id_schet = null;
  end
  if (id_currency <> id_currency_uah) then begin
    execute procedure error('Возврат товара поставщику должен быть в гривне');
  end
  if ((posted<>0) and (id_schet is null)) then begin
    execute procedure error ('Нельзя провести уже проведенный документ');
  end      
  if ((posted=0) and (id_schet is not null)) then begin
    sError = 'Нельзя частично провести не проведенный документ. id_schet=' || coalesce(:id_schet,999);
    execute procedure error (sError);
  end
  if ((:tip<>:tip_to_process) or (:tip is null) ) then begin
    execute procedure error ('Этой процедурой можно провести только ''ВОЗВРАТ ПОСТАВЩИКУ''');
  end    
  if (id_schet is not null) then begin
    select name
      from get_name_objects_pc(:id_schet,:id_schet_tip)
      into schet_name;
    /*Удаление проводок по документу только по одному счёту. Для перепроведения*/
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.tip=:tip
        and pr.id_schet=:id_schet;
  end else begin
    /*Проверка на совпадение всех позиций с родительской расходной*/
    for
      select id_tovar,z(sum(ot.kolotp))
        from naklot ot
        where ot.id_nakl=:id_nakl
        group by id_tovar
        into :id_tovar,:kolotp
    do begin
      select z(sum(ot.kolotp))
        from naklot ot
        where ot.id_nakl=:parent_id_nakl and ot.id_tovar=:id_tovar
        group by id_tovar
        into :kolotp_parent;
      if (kolotp_parent<kolotp) then begin
        select oid from objects o where o.oid=:id_tovar into :tovar_name;
        sError = 'Товара ' || trim(:tovar_name) || ' больше чем в родительской приходной';
        execute procedure error(sError);
      end
    end  /*for*/
    /*Упорядочивание позиций*/
    execute procedure NAKLO_ORDER_PC(:id_nakl);
    /*цена равна продажной цене из родительской приходной*/
    update naklot ot
      set ot.cena=(
        select dzero(sum(ot2.cena*ot2.kolotp),sum(ot2.kolotp),avg(ot2.cena))
          from naklot ot2
          where ot2.id_nakl=:parent_id_nakl
            and ot2.id_tovar=ot.id_tovar)
      where ot.id_nakl=:id_nakl;
    /*Пересчёт суммы*/
    execute procedure naklo_sum_recount(:id_nakl,0);
  end  /*if (id_schet is not null)*/
  
  /*Уменьшить бух долг */
  if ((id_schet is null) or (schet_name='РАСЧЁТЫ С ПОСТАВЩИКАМИ') ) then begin
    select z(nds) from naklo om where om.id_nakl=:id_nakl into :nds;
    insert into provodki (id_schet,dat,tip,
        debet,id_nakl,
        sub1,sub2,sub3,sub4,sub5)
      values(:id_schet_post,:dat,:tip,
        :nds,:id_nakl,
        :id_zak,:id_izg,:id_manager,:id_nakl,:id_currency);
    /*В возвратах поставщик - это клиент, а получатель - фирма*/
    /*tip=2 - спец транш для возвратов*/
    execute procedure oplaty_auto_spend_pc(:id_schet_post,:id_nakl,:dat, :id_zak, :id_izg, :id_currency, 1,1);
  end
  
  if ((id_schet is null) or (schet_name='НАЛИЧНЫЕ ДОЛГИ')) then
  begin
    insert into provodki (id_schet,dat,tip,
      debet,id_nakl,
      sub1,sub2,sub3,sub4,sub5)
    values(:id_schet_dolg_nal,:dat,:tip,
      :nds, :id_nakl,
      :id_izg,:id_zak,:id_manager,:id_nakl,:id_currency_uah);
    for
      select id_nakl
        from naklo om
        where om.parent_id_nakl=:id_nakl and
          om.posted=1 and
          om.tip=5
        into :id_nakl_depend
    do begin
      execute procedure naklo_post_pc(:id_nakl_depend,:id_schet_dolg_nal);
    end
  end /*'НАЛИЧНЫЕ ДОЛГИ'*/  
  for
    select ot.id_tovar, ot.cena, ot.kolotp, ot.id_nakld, t.tara
      from naklot ot inner join tovar t on
        ot.id_tovar=t.oid
      where ot.id_nakl=:id_nakl
      /*Все товары кроме тары*/
      into :id_tovar, :cena, :kolotp, :id_nakld, :tara
  do begin  
    if ((id_schet is null) or
      (schet_name='СЕБЕСТОИМОСТЬ БУХ') or
      (schet_name='СЕБЕСТОИМОСТЬ БУХ ТАРА')) then
    begin
      if ((dat>='31.05.06') and (id_uchet_politics is not null))  then begin
          if (((id_schet is null) or (schet_name='СЕБЕСТОИМОСТЬ БУХ')) and
            (:tara=2)) then begin
            select sebest
              from naklot_sebest2_vozvratpost_pc(:ID_NAKLD,:id_uchet_politics_in,:id_schet_bux)
              into :sebest;
          end
          if (((id_schet is null) or (schet_name='СЕБЕСТОИМОСТЬ БУХ ТАРА')) and
            (:tara=1)) then begin
            select sebest
              from naklot_sebest2_vozvratpost_pc(:ID_NAKLD,:id_uchet_politics_in,:id_schet_bux_tara)
              into :sebest;
          end
      end /*if id_uchet_politics is not null*/
    end /*if себестоимость*/
  end  /*for naklot*/
  
  
  /*Себестоимость равна себестоимости из родительской расходной*/
  update naklo om
    set om.posted=1,
      om.zatraty=0
    where om.posted=0 and
      om.delmarked=0 and
      om.id_nakl=:id_nakl;

end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE NAKLO_AUTOFILL_CN_PC TO PROCEDURE VOZVRAT_POST_POST_PC;

GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE VOZVRAT_POST_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE VOZVRAT_POST_POST_PC;

GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_SETTINGS_PC TO PROCEDURE VOZVRAT_POST_POST_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE VOZVRAT_POST_POST_PC;

GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE VOZVRAT_POST_POST_PC;

GRANT SELECT,INSERT,DELETE ON PROVODKI TO PROCEDURE VOZVRAT_POST_POST_PC;

GRANT SELECT,UPDATE ON NAKLOT TO PROCEDURE VOZVRAT_POST_POST_PC;

GRANT SELECT ON OBJECTS TO PROCEDURE VOZVRAT_POST_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLO_ORDER_PC TO PROCEDURE VOZVRAT_POST_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLO_SUM_RECOUNT TO PROCEDURE VOZVRAT_POST_POST_PC;

GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO PROCEDURE VOZVRAT_POST_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLO_POST_PC TO PROCEDURE VOZVRAT_POST_POST_PC;

GRANT SELECT ON TOVAR TO PROCEDURE VOZVRAT_POST_POST_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_VOZVRATPOST_PC TO PROCEDURE VOZVRAT_POST_POST_PC;

GRANT EXECUTE ON PROCEDURE VOZVRAT_POST_POST_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE VOZVRAT_POST_POST_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE VOZVRAT_POST_POST_PC TO POWER_USER;
