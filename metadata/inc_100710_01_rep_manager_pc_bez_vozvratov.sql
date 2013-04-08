SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_MANAGER_PC(
    DAT_FROM TIMESTAMP,
    DAT_TO TIMESTAMP,
    ID_IZG_IN INTEGER,
    ID_ZAK_IN INTEGER,
    ID_MANAGER_IN INTEGER)
RETURNS (
    DAT TIMESTAMP,
    ID VARCHAR(20),
    ID_NAKL INTEGER,
    ID_IZG INTEGER,
    ID_ZAK INTEGER,
    ID_MANAGER INTEGER,
    NDS DOUBLE PRECISION,
    NDS_FACT DOUBLE PRECISION,
    TARA DOUBLE PRECISION,
    OTKAT DOUBLE PRECISION,
    OPLACH DOUBLE PRECISION,
    PERC_OPLACH DOUBLE PRECISION,
    MAX_PREM DOUBLE PRECISION,
    MAX_PREM_OPL DOUBLE PRECISION,
    VYPL_PREM DOUBLE PRECISION,
    PREMIYA DOUBLE PRECISION,
    OPL_DATA TIMESTAMP,
    COMMENT VARCHAR(50),
    OPLACH_ZA_PERIOD DOUBLE PRECISION)
AS
declare variable id_nakl_in_list integer;
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
  declare variable id_schet_tip integer;
begin
/*$$IBEC$$   select oid
    from get_oid_objects_pc('ТИП ДЕРЕВЬЯ',-100)
    into :oid_tree;
  select oid
    from get_oid_objects_pc('ИЕРАРХИЯ МЕНЕДЖЕРОВ',:oid_tree)
    into :oid_tree; $$IBEC$$*/
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
    /*В проводках по платежу храниться менеджер из накладной,
    а не тот кому была предоплата*/
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
    /*Все накладные которые оплачивались в текущем периоде времени*/
      select id,id_izg,id_zak,id_manager,nds,dat,comment
        from naklo om
        where  om.id_nakl=:id_nakl_in_list and
          (om.id_izg between coalesce(:id_izg_in,-2147483648) and coalesce(:id_izg_in, 2147483647)) and
          (om.id_zak between coalesce(:id_zak_in,-2147483648) and coalesce(:id_zak_in, 2147483647)) 
        into :id,:id_izg,:id_zak,:id_manager,:nds,:dat,:comment
    do begin
      /*Сумма оплат до сегодняшнего дня*/
      oplach=null;
      oplach_za_period = null;
      opl_data=null;
      /*Возврат товара в премию не считается*/
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
            om.tip<>-84 /*ВОЗВРАТ*/
          into :opl_sum,:opl_dat
      do begin
        oplach=z(oplach)+z(opl_sum);
        if (:opl_dat>=:dat_from) then begin
          oplach_za_period=z(oplach_za_period)+z(opl_sum);  /*За период*/ 
        end
  
        if (:opl_data is null or :opl_data<:opl_dat) then begin
          opl_data=opl_dat; /*Дата посл опл*/
        end
      end/*for opl_sum*/
      

       /*Процент оплаты расходной накладной*/
       perc_oplach = dzero(oplach *100,nds,0) ;
       /*Сумма факт, тара, макс премия*/
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
           /*Сумма факт*/
           sum_fact=z(sum_fact)+kredit;
         end
         if ((tip=tip_rasx_nakl) and (debet>0)) then begin
           /*Тара*/
           sum_tara=z(sum_tara)+debet;
         end
         if ((tip=tip_vypl_prem) and
          (debet>0) and (opl_dat<=:dat_from)) then begin
           /*Выплаченная премия*/
           sum_vypl_prem=z(sum_vypl_prem)+debet;
         end
       end /*for sum_tara,sum_fact*/
       tara=Round(z(:sum_tara),2);
       nds_fact=Round(z(:sum_fact),2);
       /*Если всё оплачено, то премия = факт-тара*/
       max_prem=Round(nds_fact-tara,2);
       vypl_prem = Round(sum_vypl_prem,2);
       max_prem_opl=Round((max_prem*perc_oplach)/100,2);
       /*Премия=Максимальная оплаченная премия - уже выплаченная премия*/
       premiya=Round(max_prem_opl-vypl_prem,2);
       otkat=Round(nds-nds_fact,2);
       id_nakl=id_nakl_in_list;
       suspend;
     end /*for id_zak*/
  end
end^

SET TERM ; ^

DESCRIBE PROCEDURE REP_MANAGER_PC
'Отчёт по менеджеру
Накладные для перепроведения по счёту "Премия"
select r.dat,r.id_izg,om.id_izg , r.id_zak,om.id_zak ,r.id_manager,om.id_manager
from naklo r inner join naklo om on om.parent_id_nakl=r.id_nakl
where r.posted=1 and om.posted=1 and
  (r.id_izg<>om.id_izg or  r.id_zak<>om.id_zak or r.id_manager<>om.id_manager) and r.tip=3047 and om.tip=5
  and r.dat>''01.01.06'' and om.dat>''01.01.06''';

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_MANAGER_PC;

GRANT SELECT ON PROVODKI TO PROCEDURE REP_MANAGER_PC;

GRANT EXECUTE ON PROCEDURE GET_OBJECT_CHILDREN_PC TO PROCEDURE REP_MANAGER_PC;

GRANT SELECT ON NAKLO TO PROCEDURE REP_MANAGER_PC;

GRANT SELECT ON OPLNAKL TO PROCEDURE REP_MANAGER_PC;

GRANT EXECUTE ON PROCEDURE REP_MANAGER_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE REP_MANAGER_PC TO BOSSES;
GRANT EXECUTE ON PROCEDURE REP_MANAGER_PC TO MANAGER;
GRANT EXECUTE ON PROCEDURE REP_MANAGER_PC TO POWER_USER;
GRANT EXECUTE ON PROCEDURE REP_MANAGER_PC TO SKLAD;
GRANT EXECUTE ON PROCEDURE REP_MANAGER_PC TO SNAB;

