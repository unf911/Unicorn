SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_MANAGER_TEST_PC (
    dat_from timestamp,
    dat_to timestamp,
    id_izg_in integer,
    id_zak_in integer,
    id_manager_in integer)
returns (
    dat timestamp,
    id varchar(20),
    id_nakl integer,
    id_izg integer,
    id_zak integer,
    id_manager integer,
    nds double precision,
    nds_fact double precision,
    tara double precision,
    otkat double precision,
    oplach double precision,
    perc_oplach double precision,
    max_prem double precision,
    max_prem_opl double precision,
    vypl_prem double precision,
    premiya double precision,
    opl_data timestamp,
    comment varchar(50),
    oplach_za_period double precision)
as
 /*$$IBE$$ declare variable id_nakl_in_list integer;
declare variable tip_rasx_nakl integer;
declare variable tip_vypl_prem integer;
declare variable id_schet_dolgi integer;
declare variable id_schet_premiya integer;
declare variable debet double precision;
declare variable kredit double precision;
declare variable tip integer;
declare variable sum_fact double precision;
declare variable sum_tara double precision;
declare variable sum_vypl_prem double precision;
declare variable opl_dat date;
declare variable opl_sum double precision;
declare variable oid_tree integer;
declare variable oid_manager integer;
declare variable id_schet_tip integer; $$IBE$$*/ 
begin
/*$$IBEC$$   select oid
    from get_oid_objects_pc('ТИП ДЕРЕВЬЯ',-100)
    into :oid_tree;
  select oid
    from get_oid_objects_pc('ИЕРАРХИЯ МЕНЕДЖЕРОВ',:oid_tree)
    into :oid_tree; $$IBEC$$*/ /*$$IBE$$ 
  select oid from get_oid_objects_pc('ТИП МЕНЕДЖЕРЫ',-100) into :oid_manager;
  oid_tree=oid_manager;
  select oid from get_oid_objects_pc('Все менеджеры',:oid_manager) into :oid_manager;
  if (ID_MANAGER_IN is null) then begin
    id_manager_in=oid_manager;
  end
  select oid
    from get_oid_objects_pc('ТИП НАКЛАДНЫХ ДЛЯ СКЛАДА',-100)
    into :tip_rasx_nakl;
  select oid
    from get_oid_objects_pc('Отгрузка',:tip_rasx_nakl)
    into :tip_rasx_nakl;    
  select oid
    from get_oid_objects_pc('ВЫПЛАТА ПРЕМИИ',-100)
    into :tip_vypl_prem;
  select oid
    from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
    into :id_schet_tip;    
  select oid
    from get_oid_objects_pc('ДОЛГИ ЗА КАБЕЛЬ',:id_schet_tip)
    into :id_schet_dolgi;
 select oid
   from get_oid_objects_pc('ПРЕМИЯ',:id_schet_tip)
   into :id_schet_premiya;
  for
     $$IBE$$*/ /*В проводках по платежу храниться менеджер из накладной,
    а не тот кому была предоплата*/ /*$$IBE$$ 
    select
      sub4
    from
      provodki pr inner join
        get_object_children_pc(:id_manager_in,:oid_tree) c on
        pr.sub3=c.oid
    where
      (pr.dat between :dat_from and :dat_to) and
      pr.id_schet=:id_schet_dolgi and
      pr.tip<>1 and
      pr.debet<0
    union
    select
      sub4
    from
      provodki pr inner join
        get_object_children_pc(:id_manager_in,:oid_tree) c on
        pr.sub3=c.oid
    where
      (pr.dat between :dat_from and :dat_to) and
      pr.id_schet=:id_schet_premiya and
      pr.tip<>1 and kredit>0
    into :id_nakl_in_list
  do begin
    for
     $$IBE$$*/ /*Все накладные которые оплачивались в текущем периоде времени*/ /*$$IBE$$ 
      select id,id_izg,id_zak,id_manager,nds,dat,comment
        from naklo om
        where  om.id_nakl=:id_nakl_in_list and
          (om.id_izg between coalesce(:id_izg_in,-2147483648) and coalesce(:id_izg_in, 2147483647)) and
          (om.id_zak between coalesce(:id_zak_in,-2147483648) and coalesce(:id_zak_in, 2147483647)) 
        into :id,:id_izg,:id_zak,:id_manager,:nds,:dat,:comment
    do begin
       $$IBE$$*/ /*Сумма оплат до сегодняшнего дня*/ /*$$IBE$$ 
      oplach=null;
      oplach_za_period = null;
      opl_data=null;
       $$IBE$$*/ /*Возврат товара в премию не считается*/ /*$$IBE$$ 
      for
        select (pr.debet)*(-1),pr.dat
          from provodki pr inner join oplnakl t
            on pr.id_nakl=t.id
            inner join naklo om on t.id_from=om.id_nakl
          where
            pr.dat <=:dat_to and
            pr.id_schet=:id_schet_dolgi and
            pr.tip<>1 and
            pr.debet<0  and
            pr.sub4=:id_nakl_in_list and
            om.tip<>-84  $$IBE$$*/ /*ВОЗВРАТ*/ /*$$IBE$$ 
          into :opl_sum,:opl_dat
      do begin
        oplach=z(oplach)+z(opl_sum);
        if (:opl_dat>=:dat_from) then begin
          oplach_za_period=z(oplach_za_period)+z(opl_sum);   $$IBE$$*/ /*За период*/ /*$$IBE$$  
        end
  
        if (:opl_data is null or :opl_data<:opl_dat) then begin
          opl_data=opl_dat;  $$IBE$$*/ /*Дата посл опл*/ /*$$IBE$$ 
        end
      end $$IBE$$*/ /*for opl_sum*/
      
      /*Оплата за период с учётом того, что в
        таблице проводок стоит дата транша, а не дата платежа,
        следовательно туда попадают предоплаты, хотя они
        были в предыдущем периоде*/
  /*$$IBEC$$     select sum(t.transh)
        from oplnakl t inner join naklo om
          on t.id_from=om.id_nakl
        where t.id_to=:id_nakl_in_list and
          om.dat between :dat_from and :dat_to
        into :oplach_za_period; $$IBEC$$*/
          
       /*Процент оплаты расходной накладной*/ /*$$IBE$$ 
       perc_oplach = dzero(oplach *100,nds,0) ;
        $$IBE$$*/ /*Сумма факт, тара, макс премия*/ /*$$IBE$$ 
       sum_fact = 0;
       sum_tara = 0;
       sum_vypl_prem = 0;
       for
         select debet,kredit,tip,dat
           from provodki pr
           where pr.dat <=:dat_to and
             pr.id_schet=:id_schet_premiya and
             pr.tip<>1 and
             pr.sub4=:id_nakl_in_list
           into :debet,:kredit,:tip,:opl_dat
       do begin
         if ((tip=tip_rasx_nakl) and (kredit>0)) then begin
            $$IBE$$*/ /*Сумма факт*/ /*$$IBE$$ 
           sum_fact=z(sum_fact)+kredit;
         end
         if ((tip=tip_rasx_nakl) and (debet>0)) then begin
            $$IBE$$*/ /*Тара*/ /*$$IBE$$ 
           sum_tara=z(sum_tara)+debet;
         end
         if ((tip=tip_vypl_prem) and
          (debet>0) and (opl_dat<=:dat_from)) then begin
            $$IBE$$*/ /*Выплаченная премия*/ /*$$IBE$$ 
           sum_vypl_prem=z(sum_vypl_prem)+debet;
         end
       end  $$IBE$$*/ /*for sum_tara,sum_fact*/ /*$$IBE$$ 
       tara=Round(z(:sum_tara),2);
       nds_fact=Round(z(:sum_fact),2);
        $$IBE$$*/ /*Если всё оплачено, то премия = факт-тара*/ /*$$IBE$$ 
       max_prem=Round(nds_fact-tara,2);
       vypl_prem = Round(sum_vypl_prem,2);
       max_prem_opl=Round((max_prem*perc_oplach)/100,2);
        $$IBE$$*/ /*Премия=Максимальная оплаченная премия - уже выплаченная премия*/ /*$$IBE$$ 
       premiya=Round(max_prem_opl-vypl_prem,2);
       otkat=Round(nds-nds_fact,2);
       id_nakl=id_nakl_in_list;
       suspend;
     end  $$IBE$$*/ /*for id_zak*/ /*$$IBE$$ 
  end
 $$IBE$$*/ SUSPEND;
end
^

SET TERM ; ^


