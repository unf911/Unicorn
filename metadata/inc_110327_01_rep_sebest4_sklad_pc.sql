SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_SEBEST4_SKLAD_PC(
    MODE INTEGER,
    ID_SKLAD_IN INTEGER,
    ID_TOVAR_IN INTEGER,
    ID_CURRENCY_TO INTEGER,
    DAT_TO TIMESTAMP)
RETURNS (
    ID_SKLAD INTEGER,
    ID_TOVAR INTEGER,
    ID_PARTIYA INTEGER,
    KOLOTP DOUBLE PRECISION,
    SEBEST DOUBLE PRECISION,
    SEBESTSUM DOUBLE PRECISION,
    DAT TIMESTAMP,
    ID_MANAGER INTEGER)
AS
  declare variable id_schet integer;
  declare variable id_schet_sebest integer;
  declare variable id_currency_tip integer;
  declare variable id_currency integer;
  declare variable tree_oid integer;
  declare variable tree_oid_sklad integer;
  declare variable tree_oid_tovar integer;
  declare variable sub4_in integer;
  
  declare variable id_sklad_in2 integer;
  declare variable id_tovar_in2 integer;
  declare variable oid_temp integer;
  declare variable year_int integer;
  declare variable month_int integer;
  declare variable day_int integer;
  declare variable id_partiya_in integer;
begin
  select oid
    from get_oid_objects_pc('ТИП СЧЕТА',-100)
    into :id_schet;
  select oid
    from get_oid_objects_pc('СЕБЕСТОИМОСТЬ СКЛАД',:id_schet)
    into :id_schet_sebest;
  select oid
    from get_oid_objects_pc('ТИП ВАЛЮТ',-100)
    into :id_currency_tip;
  select oid
    from get_oid_objects_pc('USD',:id_currency_tip)
    into :id_currency;
  /*
    select oid
      from get_oid_objects_pc('ТИП ДЕРЕВЬЯ',-100)
      into :tree_oid;
    select oid
      from get_oid_objects_pc('ИЕРАРХИЯ СКЛАДОВ',:tree_oid)
      into :tree_oid;*/
  select oid
    from get_oid_objects_pc('ТИП НАЗВАНИЯ СКЛАДОВ',-100)
    into :tree_oid_sklad;
  select oid
    from get_oid_objects_pc('ТИП ТОВАРЫ',-100)
    into :tree_oid_tovar;
  /*Если не указано на какую дату отчёт,
      то по умолчанию на сейчас*/    
  if (dat_to is null) then begin
    dat_to=current_timestamp;
  end

    
 /* mode=1 -  тип отчёта: по складам*/
  if (mode=1) then begin
    for
      select c.oid
      from get_object_children2_pc
        (:id_sklad_in,:tree_oid_sklad) c
      into :id_sklad_in2
    do begin
      for
        select t.oid
        from get_object_children2_pc(:id_tovar_in,:tree_oid_tovar) t
        into :id_tovar_in2
      do begin
        for
          select sub2,min(sub3),
            sum(r.debetafter)-
            sum(r.kreditafter),
            sum(r.kolotp_after),
            cast (null as date) as dat
          from rep_ostatki_pc(:id_schet_sebest,:dat_to,:id_tovar_in2,:id_sklad_in2,
            null,null,null,null,
            null,null,null,null) r
          where round(r.kolotp_after,4)<>0  or Round(r.debetafter-r.kreditafter,2)<>0
          group  by sub2
          having round(sum(r.kolotp_after),4)<>0   or
            Round(sum(r.debetafter)-sum(r.kreditafter),2)<>0
          into :id_sklad,:id_partiya, :sebestsum, :kolotp,:dat
        do begin
          year_int =div(:id_partiya,100000000)+2000;
          month_int=div(:id_partiya, 1000000);
          month_int=mod(month_int,100);
          day_int=div(:id_partiya, 10000);
          day_int=mod(day_int,100);
          dat=encodedate(day_int,month_int,year_int);        
          sebest=dzero(:sebestsum,:kolotp, 0);
          select id_manager
            from spr_sklad_vw s
            where s.oid=:id_sklad
            into :id_manager;          
          suspend;
        end /*for one id_tovar and one id_sklad*/
      end /*for id_tovar*/
    end /*for id_sklad*/
  end
 

  /*mode=2 - тип отчёта: по товарам*/
  if (mode=2) then begin
    for
      select c.oid
      from get_object_children2_pc
        (:id_sklad_in,:tree_oid_sklad) c
      into :id_sklad_in2
    do begin
      for
        select t.oid
        from get_object_children2_pc(:id_tovar_in,:tree_oid_tovar) t
        into :id_tovar_in2
      do begin
        for
          select sub1,sub2,min(sub3),
            sum(r.debetafter)-
            sum(r.kreditafter),
            sum(r.kolotp_after),
            cast (null as date) as dat
          from rep_ostatki_pc(:id_schet_sebest,:dat_to,:id_tovar_in2,:id_sklad_in2,
            null,null,null,null,
            null,null,null,null) r
          where round(r.kolotp_after,4)<>0  or Round(r.debetafter-r.kreditafter,2)<>0
          group by sub1,sub2
          having round(sum(r.kolotp_after),4)<>0    or
            Round(sum(r.debetafter)-sum(r.kreditafter),2)<>0
          into :id_tovar, :id_sklad,:id_partiya, :sebestsum, :kolotp,:dat
        do begin
          year_int =div(:id_partiya,100000000)+2000;
          month_int=div(:id_partiya, 1000000);
          month_int=mod(month_int,100);
          day_int=div(:id_partiya, 10000);
          day_int=mod(day_int,100);
          dat=encodedate(day_int,month_int,year_int);        
          sebest=dzero(:sebestsum,:kolotp, 0);
          suspend;
        end /*for one id_tovar and one id_sklad*/
      end /*for id_tovar*/
    end /*for id_sklad*/
  end /*if mode=2 тип отчёта: по товарам на дату*/
  
  
  
  if (mode=3 ) then begin
    /*тип отчёта: по партиям*/
    for
      select c.oid
      from get_object_children2_pc
        (:id_sklad_in,:tree_oid_sklad) c
      into :id_sklad_in2
    do begin
      for
        select t.oid
        from get_object_children2_pc(:id_tovar_in,:tree_oid_tovar) t
        into :id_tovar_in2
      do begin
        for
          select sub1,sub2,sub3,
            sum(r.debetafter)-
            sum(r.kreditafter),
            sum(r.kolotp_after),
            cast (null as date) as dat
          from rep_ostatki_pc(:id_schet_sebest,:dat_to,:id_tovar_in2,:id_sklad_in2,
            null,null,null,null,
            null,null,null,null) r
          group  by sub1,sub2,sub3
          having round(sum(r.kolotp_after),4)<>0  or
            Round(sum(r.debetafter)-sum(r.kreditafter),2)<>0
          into :id_tovar, :id_sklad,:id_partiya, :sebestsum, :kolotp,:dat
        do begin
          year_int =div(:id_partiya,100000000)+2000;
          month_int=div(:id_partiya, 1000000);
          month_int=mod(month_int,100);
          day_int=div(:id_partiya, 10000);
          day_int=mod(day_int,100);
          dat=encodedate(day_int,month_int,year_int);
          sebest=dzero(:sebestsum,:kolotp, 0);
          suspend;
        end /*for one id_tovar and one id_sklad*/
      end /*for id_tovar*/
    end /*for id_sklad*/
  end /*if mode=3 тип отчёта: по партиям*/
  
  if (mode=4) then begin
    for
    select /*$$IBEC$$ pr.attr1, $$IBEC$$*/pr.sub3, pr.sub2,pr.sub1
      from provodki pr
      where
        pr.id_schet=:id_schet_sebest and
        pr.tip<>1 and
        pr.id_nakl=:id_sklad_in /*$$IBEC$$ and
        pr.debet_kolotp>0 $$IBEC$$*/
      group by /*$$IBEC$$ attr1 $$IBEC$$*/pr.sub3,pr.sub2,pr.sub1
      into :id_partiya_in,:id_sklad_in2,:id_tovar_in2
    do begin
      for
        select sub1,sub2,sub3,
          sum(r.debetafter)-
          sum(r.kreditafter),
          sum(r.kolotp_after),
          cast (null as date) as dat
        from rep_ostatki_pc(:id_schet_sebest,:dat_to,:id_tovar_in2,:id_sklad_in2,
          :id_partiya_in,null,null,null,
          null,null,null,null) r
        group  by sub1,sub2,sub3
        having round(sum(r.kolotp_after),4)<>0 or
            Round(sum(r.debetafter)-sum(r.kreditafter),2)<>0
        into :id_tovar, :id_sklad,:id_partiya, :sebestsum, :kolotp,:dat
      do begin
        year_int =div(:id_partiya,100000000)+2000;
        month_int=div(:id_partiya, 1000000);
        month_int=mod(month_int,100);
        day_int=div(:id_partiya, 10000);
        day_int=mod(day_int,100);
        dat=encodedate(day_int,month_int,year_int);
        sebest=dzero(:sebestsum,:kolotp, 0);
        suspend;
      end /*for one id_tovar and one id_sklad*/
    end /*for все партии упоминающиеся в данной накладной*/
  end /*if mode=4 режим детализации по одной накладной*/
end^

SET TERM ; ^

DESCRIBE PROCEDURE REP_SEBEST4_SKLAD_PC
'Себестоимость складов,товаров.
Используется в Отчёты-Себестоимость склада3
mode=1 -  детализация по складам
mode=2 - детализация по товарам
mode=3 - детализация по партиям
mode=4 - детализация по одной накладной
 её номер передаём через id_sklad_in

select
  (select name from objects o where o.oid=r.id_sklad) as sklad,
  (select name from objects o where o.oid=r.id_tovar) as tovar,
  id_sklad,id_tovar,id_partiya,dat,
  kolotp,sebest,sebestsum
from 
  rep_sebest_sklad_pc(1,:id_sklad_in,null,
  null,null) r';

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_SEBEST4_SKLAD_PC;

GRANT EXECUTE ON PROCEDURE GET_OBJECT_CHILDREN2_PC TO PROCEDURE REP_SEBEST4_SKLAD_PC;

GRANT EXECUTE ON PROCEDURE REP_OSTATKI_PC TO PROCEDURE REP_SEBEST4_SKLAD_PC;

GRANT SELECT ON SPR_SKLAD_VW TO PROCEDURE REP_SEBEST4_SKLAD_PC;

GRANT SELECT ON PROVODKI TO PROCEDURE REP_SEBEST4_SKLAD_PC;

GRANT EXECUTE ON PROCEDURE REP_SEBEST4_SKLAD_PC TO PROCEDURE SKLAD_SEBEST_MINUS_PC;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_SKLAD_PC TO PROCEDURE TEMP67_SKLAD_SEBEST_MINUS_PC;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_SKLAD_PC TO ALEXEY;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_SKLAD_PC TO DIMA;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_SKLAD_PC TO SS;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_SKLAD_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_SKLAD_PC TO BOSSES;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_SKLAD_PC TO POWER_USER;
GRANT EXECUTE ON PROCEDURE REP_SEBEST4_SKLAD_PC TO SNAB;

