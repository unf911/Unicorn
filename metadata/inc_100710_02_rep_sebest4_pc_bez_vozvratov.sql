SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_SEBEST4_PC(
    DAT_FROM TIMESTAMP,
    DAT_TO TIMESTAMP,
    ID_IZG_IN INTEGER,
    ID_ZAK_IN INTEGER,
    ID_MANAGER_IN INTEGER)
RETURNS (
    ID VARCHAR(20),
    DAT TIMESTAMP,
    ID_NAKL INTEGER,
    ID_IZG INTEGER,
    ID_ZAK INTEGER,
    ID_MANAGER INTEGER,
    KURS2 DOUBLE PRECISION,
    NDS DOUBLE PRECISION,
    TARA DOUBLE PRECISION,
    NDS_FACT DOUBLE PRECISION,
    OBOROT DOUBLE PRECISION,
    NDS_SEBEST DOUBLE PRECISION,
    NDS_SEBEST2 DOUBLE PRECISION,
    OPLACH DOUBLE PRECISION,
    OPLACH_ZA_PERIOD DOUBLE PRECISION,
    PERC_OPLACH DOUBLE PRECISION,
    MAX_DOXOD DOUBLE PRECISION,
    MAX_DOXOD_OPL DOUBLE PRECISION,
    VYPL_DOXOD DOUBLE PRECISION,
    DOXOD DOUBLE PRECISION,
    RENT DOUBLE PRECISION)
AS
  declare variable id_nakl_in_list integer;
  declare variable tip_rasx_nakl integer;
  declare variable id_schet_dolgi integer;
  declare variable id_schet_premiya integer;
  declare variable id_schet integer;

  declare variable debet double precision;
  declare variable kredit double precision;
  declare variable tip integer;
  
  declare variable sum_fact double precision;
  declare variable sum_tara double precision;
  declare variable opl_dat date;
  declare variable oplach_ranee double precision;
  declare variable transh double precision;
  declare variable sum_tara_za_period double precision;
  declare variable sum_fact_za_period double precision;
  declare variable nds_fact_za_period double precision;
  declare variable dat_temp date;
  declare variable nds_sebest_ranee double precision;
  declare variable nds_sebest_det double precision;
  declare variable dat_sebest date;
  declare variable nds_fact_ranee double precision;
begin

  select oid
    from get_oid_objects_pc('ТИП НАКЛАДНЫХ ДЛЯ СКЛАДА',-100)
    into :tip_rasx_nakl;
  select oid
    from get_oid_objects_pc('Отгрузка',:tip_rasx_nakl)
    into :tip_rasx_nakl;    
  select oid
    from get_oid_objects_pc('ТИП СЧЕТА',-100)
    into :id_schet;
  select oid
    from get_oid_objects_pc('ДОЛГИ ЗА КАБЕЛЬ',:id_schet)
    into :id_schet_dolgi;
  select oid
    from get_oid_objects_pc('ПРЕМИЯ',:id_schet)
    into :id_schet_premiya;
  for
    /*В проводках по платежу храниться менеджер из накладной,
    а не тот кому была предоплата*/
    select
      sub4
    from
      provodki pr
    where
      (pr.dat between :dat_from and :dat_to) and
      pr.id_schet=:id_schet_dolgi and
      pr.tip<>1 and
      pr.debet<0  and
      pr.sub1 BETWEEN COALESCE(:id_izg_in, -2147483647 ) AND
        COALESCE(:id_izg_in, 2147483647 ) and
      pr.sub2 BETWEEN COALESCE(:id_zak_in, -2147483647 ) AND
        COALESCE(:id_zak_in, 2147483647 ) and
      pr.sub3 BETWEEN COALESCE(:id_manager_in, -2147483647 ) AND
        COALESCE(:id_manager_in, 2147483647 )
    union
    select
      sub4
    from
      provodki pr
    where
      (pr.dat between :dat_from and :dat_to) and
      pr.id_schet=:id_schet_premiya and
      pr.tip<>1 and kredit>0 and
      pr.sub1 BETWEEN COALESCE(:id_izg_in, -2147483647 ) AND
        COALESCE(:id_izg_in, 2147483647 ) and
      pr.sub2 BETWEEN COALESCE(:id_zak_in, -2147483647 ) AND
        COALESCE(:id_zak_in, 2147483647 ) and
      pr.sub3 BETWEEN COALESCE(:id_manager_in, -2147483647 ) AND
        COALESCE(:id_manager_in, 2147483647 )
    into :id_nakl_in_list
  do begin
    /*Все накладные которые оплачивались в текущем периоде времени*/
    select id,id_izg,id_zak,id_manager,nds,dat
      from naklo om
      where  om.id_nakl=:id_nakl_in_list
      into :id,:id_izg,:id_zak,:id_manager,:nds,:dat;
      
    /*Оплата за период с учётом того, что в
      таблице проводок стоит дата транша, а не дата платежа,
      следовательно туда попадают предоплаты, хотя они
      были в предыдущем периоде*/
    /*Транши возратов товара от клиентов не попадают в оплаты вообще*/
    oplach_za_period=0;
    oplach_ranee=0;
    oplach=0;
    for
      select t.transh, om.dat,t.opl_data
        from oplnakl t inner join naklo om
          on t.id_from=om.id_nakl
        where t.id_to=:id_nakl_in_list and
          om.tip<>-84 /*ВОЗВРАТ*/
        into :transh, :dat_temp,:opl_dat
    do begin
      if (:dat_temp between :dat_from and :dat_to) then begin
        oplach_za_period=z(:oplach_za_period)+:transh;
      end
      if (:dat_temp < :dat_from) then begin
        oplach_ranee=z(:oplach_ranee)+z(:transh);
      end
      if (:opl_dat<=:dat_to) then begin
        oplach=z(:oplach)+z(:transh);
      end
    end

    nds_sebest=0;
    nds_sebest_ranee=0;
    for
      select
        Round(Round(r.cena_sebest*r.kurs2,2)*r.kolotp,2)
        ,r.kurs2,r.dat
      from rep_sebest4_rec_noprice_pc(:id_nakl_in_list,null,:dat_to) r
      into :nds_sebest_det,:kurs2,:dat_sebest
    do begin
      if (:dat_sebest<=:dat_to ) then begin
        nds_sebest=z(:nds_sebest)+z(:nds_sebest_det);
      end
      if (:dat_sebest<:dat_from) then begin
        nds_sebest_ranee=z(nds_sebest_ranee)+z(:nds_sebest_det);
      end
    end
    /*Процент оплаты расходной накладной*/
    if (nds=0) then begin
      perc_oplach =0;
    end else begin
      perc_oplach = z((oplach *100/ nds)) ;    
    end
    /*Сумма факт, тара, макс премия*/
    sum_fact = 0;
    sum_fact_za_period=0;
    sum_tara = 0;
    sum_tara_za_period=0;
     for
       select debet,kredit,tip, dat
         from provodki pr
         where pr.dat <=:dat_to and
           pr.id_schet=:id_schet_premiya and
           pr.tip<>1 and
           pr.sub4=:id_nakl_in_list
         into :debet,:kredit,:tip, :dat_temp
     do begin
       if ((tip=tip_rasx_nakl) and (kredit>0)) then begin
         /*Сумма факт*/
         sum_fact=z(sum_fact)+kredit;
         if (dat_temp>=:dat_from) then begin
           sum_fact_za_period=z(sum_fact_za_period)+kredit;
         end
       end
       if ((tip=tip_rasx_nakl) and (debet>0)) then begin
         /*Тара*/
         sum_tara=z(sum_tara)+debet;
         if (dat_temp>=:dat_from) then begin
           sum_tara_za_period=z(sum_tara_za_period)+debet;
         end         
       end
     end /*for sum_tara,sum_fact*/
     /*Тепрь выплаченная прибыль считается на лету, а не храниться*/
     /*теперь по таре мы тоже получаем прибыль*/
     nds_fact=Round(z(:sum_fact),2);
     nds_fact_za_period=Round(z(:sum_fact_za_period),2);
     nds_fact_ranee=Round(
       z(:sum_fact)-z(:sum_fact_za_period),2);
     oborot= dzero( nds_fact*z(oplach_za_period), nds, 0)+
       dzero( nds_fact_za_period*z(oplach_ranee), nds, 0);
     nds_sebest2=dzero (nds_sebest*z(oplach_za_period),nds,0);
     
     max_doxod=Round(nds_fact-nds_sebest,2);
     vypl_doxod = dzero(z(oplach_ranee),nds,0) *
       (z(nds_fact_ranee)-z(nds_sebest_ranee));

     max_doxod_opl=Round((max_doxod*perc_oplach)/100,2);
     /*Премия=Максимальная оплаченная премия - уже выплаченная премия*/
     doxod=Round(max_doxod_opl-vypl_doxod,2);
     rent=dzero(max_doxod,nds_sebest,0)*100;
     id_nakl=id_nakl_in_list;
     suspend;
  end /*for*/
end^

SET TERM ; ^

DESCRIBE PROCEDURE REP_SEBEST4_PC
'Используется в
формы ввода-себестоимость3';

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_SEBEST4_PC;

GRANT SELECT ON PROVODKI TO PROCEDURE REP_SEBEST4_PC;

GRANT SELECT ON NAKLO TO PROCEDURE REP_SEBEST4_PC;

GRANT SELECT ON OPLNAKL TO PROCEDURE REP_SEBEST4_PC;

GRANT EXECUTE ON PROCEDURE REP_SEBEST4_REC_NOPRICE_PC TO PROCEDURE REP_SEBEST4_PC;

GRANT EXECUTE ON PROCEDURE REP_SEBEST4_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_PC TO BOSSES;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_PC TO POWER_USER;
