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
    from GET_OID_OBJECTS_PC('ДОЛГИ ЗА КАБЕЛЬ',:id_schet_tip)
    into :id_schet_dolg;
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
            
  select id_uchet_politics
    from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
    into :id_uchet_politics;             
  if (delmarked<>0) then begin
    execute procedure error ('Нельзя провести удалённый документ');
  end
  if (id_schet =0 ) then begin
    id_schet = null;
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
  if ((id_schet is null) or (schet_name='ДОЛГИ ЗА КАБЕЛЬ') ) then begin
    select z(nds) from naklo om where om.id_nakl=:id_nakl into :nds;
    insert into provodki (id_schet,dat,tip,
        kredit,id_nakl,
        sub1,sub2,sub3,sub4)
      values(:id_schet_dolg,:dat,:tip,
        :nds,:id_nakl,
        :id_zak,:id_izg,:id_manager,:id_nakl);
    /*В возвратах поставщик - это клиент, а получатель - фирма*/
    /*tip=2 - спец транш для возвратов*/
    execute procedure nakl_auto_oplat_pc(:id_nakl,0,:id_schet_dolg,:id_zak, :id_izg);
  end
  for
    select ot.id_tovar, ot.cena, ot.kolotp, ot.id_nakld, t.tara
      from naklot ot inner join tovar t on
        ot.id_tovar=t.oid
      where ot.id_nakl=:id_nakl
      /*Все товары кроме тары*/
      into :id_tovar, :cena, :kolotp, :id_nakld, :tara
  do begin  
    if ((id_schet is null) or (schet_name='НЕСОБЛЮДЕНИЕ ПРИХОДОВ') ) then begin
      insert into provodki (id_schet,dat,tip,
          debet,debet_kolotp,id_nakl,
          sub1,sub2,sub3,sub4,
          sub5,sub6,sub7)
        values(:id_schet_prix,:dat,:tip,
          Round(Round(:cena*:kolotp,2)*(1+:nalog_nds),2),:kolotp, :id_nakl,
          :id_izg,:id_zak,:id_manager,:id_nakl,
          :id_tovar,:id_currency,:id_sklad);
    end /*if 'НЕСОБЛЮДЕНИЕ ПРИХОДОВ'*/
    if ((id_schet is null) or
      (schet_name='СЕБЕСТОИМОСТЬ БУХ') or
      (schet_name='СЕБЕСТОИМОСТЬ БУХ ТАРА')) then
    begin
      if ((dat>='31.05.06') and (id_uchet_politics is not null))  then begin
          if (((id_schet is null) or (schet_name='СЕБЕСТОИМОСТЬ БУХ')) and
            (:tara=2)) then begin
            select sebest
              from naklot_sebest2_vozvrat_pc(:ID_NAKLD,:id_uchet_politics_in,:id_schet_bux)
              into :sebest;
          end
          if (((id_schet is null) or (schet_name='СЕБЕСТОИМОСТЬ БУХ ТАРА')) and
            (:tara=1)) then begin
            select sebest
              from naklot_sebest2_vozvrat_pc(:ID_NAKLD,:id_uchet_politics_in,:id_schet_bux_tara)
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


GRANT EXECUTE ON PROCEDURE VOZVRAT_POST_POST_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE VOZVRAT_POST_POST_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE VOZVRAT_POST_POST_PC TO POWER_USER;

