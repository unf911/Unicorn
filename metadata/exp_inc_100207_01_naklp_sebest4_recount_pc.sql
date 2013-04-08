SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLP_SEBEST4_RECOUNT_PC(
    ID_NAKL INTEGER,
    ID_SKLAD INTEGER,
    ID_PARTIYA_IN INTEGER,
    TIP INTEGER,
    MODE INTEGER)
AS
declare variable id_uchet_politics_in integer;
declare variable id_nakld_in integer;
declare variable id_schet_sebest_sklad integer;
declare variable id_nakld_recount integer;
declare variable tip_depend integer;
declare variable id_uchet_politics integer;
declare variable id_sklad_seb_to integer;
declare variable id_tovar integer;
declare variable id_nakld integer;
declare variable kolotp double precision;
declare variable id_schet integer;
declare variable dat_depend date;
declare variable tip_prov integer;
declare variable id_partiya integer;
declare variable sebest double precision;
begin
  /*Обработка не всей накладной, а только одной позиции*/
  if (mode in (4,5,6,7)) then begin
    id_nakld_in=:id_nakl;
    select id_nakl
      from naklot ot
      where ot.id_nakld=:id_nakld_in
      into :id_nakl;
    if (mode<>7) then begin
      mode=mode-3;
    end else begin
      mode=1;
    end
  end
  
  if (tip>103) then begin
    /*Если на вход пришёл тип приходных проводок
    то процедура будет обрабатывать накладную как приходную.
    Сделано, чтобы в вызывающих процедурах можно
    было не узнавать тип накладной по складу,
    а сразу кидать его в эту процедуру
    */
    select oid
      from GET_OID_OBJECTS_PC('ПРИХОДНЫЕ СКЛАДСКИЕ НАКЛАДНЫЕ',-100)
      into :tip_prov;  
    if (tip=tip_prov) then begin
      tip=1;
    end
  end

  select oid
    from get_oid_objects_pc('ТИП СЧЕТА',-100)
    into :id_schet;
  select oid
    from get_oid_objects_pc('СЕБЕСТОИМОСТЬ СКЛАД',:id_schet)
    into :id_schet_sebest_sklad;
  select oid
    from GET_OID_OBJECTS_PC('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('УПРАВЛЕНЧЕСКИЙ УЧЁТ',:id_uchet_politics_in)
    into :id_uchet_politics_in;      

  select id_sklad,id_uchet_politics
    from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
    into :id_sklad_seb_to,:id_uchet_politics;     

  for
    select t.id_tovar,t.id_nakld,t.kolotp
      from naklot t
      where t.id_nakl = :id_nakl and
        (t.id_nakld between coalesce(:id_nakld_in,-2147483648)
          and coalesce(:id_nakld_in, 2147483647))
      into :id_tovar,:id_nakld,:kolotp
  do begin

    if (:id_uchet_politics is null) then begin
      exit;
    end
    /*Пересчитывают после себя только приходы */
    /*Если же необходимо пересчитать излишек,
    то пересчитать родительский приход*/
    if (:tip in (1,2,103) and (:mode in (1,2))) then begin
      for
        select pr.attr1,pr.tip,pr.dat
          from provodki pr
          where 
            pr.id_schet=:id_schet_sebest_sklad and
            pr.sub1=:id_tovar and
            pr.sub2=:id_sklad_seb_to and
            /*pr.debet_kolotp>0 and*/
            pr.tip<>1 and
            pr.sub3=:id_partiya_in /*Теперь считаем только эту партию, а не >= */
          order by pr.dat,pr.attr1
          into :id_nakld_recount,:tip_depend,:dat_depend        
      do begin
        /*Создать новый режим в процедуре
          для пересчёт одной позиции накладной*/
        if (:tip_depend =2) then begin
          /*Пересчитывать позицию излишков только если об
           этом попросил родительский приход или более ранний излишек*/
          select sebest
            from naklot_sebest2_count_pc(:id_nakld_recount,
              :id_uchet_politics,:id_schet_sebest_sklad,2,2)
            into :sebest;              
          /*Режим 6 создать. Излишки*/
          if (kolotp>0) then begin
            select sebest,id_partiya
              from naklot_sebest2_count_pc(:id_nakld_recount,
                :id_uchet_politics,:id_schet_sebest_sklad,6,2)
              into :sebest,:id_partiya;
          end else begin
            /*Если излишек с отрицательной длиной то он недостача*/
            select sebest,id_partiya
              from naklot_sebest2_count_pc(:id_nakld_recount,
                :id_uchet_politics,:id_schet_sebest_sklad,3,2)
              into :sebest,:id_partiya;
          end /*if (:tip_depend =2)*/
        end
        /*при режиме 2 пересчитывать только излишки,чтобы быстрее выходить
        на остатки по складу*/
        if ((:tip_depend in (5,30,103)) and (mode=1)) then begin
          /*Очень хитрый финт ушами. Есть несколько неправильно
          посчитанных отгрузочных накладных на одну дату.
          Надо за один проход пересчитать все и правильно
          Для этого упорядочиваем их по номерам позиций
          и первая позиция обнуляет стоимость и кол-во
          для всех остальных позиций данного дня по данному складу
          и партии. При обновлении не стоит триггер на пересчёт
          остатков, но это не страшно, т.к. цикл всё равно пересчитает
          все занулённые накладные, но в порядке очереди !!!
          Альтернатива: хранение в базе времени документа.
          Но очень много надо переписывать.
          */
          update provodki pr
            set pr.kredit=null,
              pr.kredit_kolotp=null
            where
              pr.id_schet=:id_schet_sebest_sklad and
              pr.dat=:dat_depend and
              pr.sub1=:id_tovar and
              pr.sub2=:id_sklad and
              pr.sub3=:id_partiya_in and
              pr.tip in (5,30,103) and
              pr.kredit is not null and
              pr.kredit_kolotp is not null and
              pr.attr1>:id_nakld_recount;

          select sebest
            from naklot_sebest2_count_pc(:id_nakld_recount,
              :id_uchet_politics,:id_schet_sebest_sklad,2,2)
            into :sebest;              
          select sebest,id_partiya
            from naklot_sebest2_count_pc(:id_nakld_recount,
              :id_uchet_politics,:id_schet_sebest_sklad,3,2)
            into :sebest,:id_partiya;
          if (:tip_depend=103) then begin
            select sebest,id_partiya
              from naklot_sebest2_count_pc(:id_nakld_recount,
                :id_uchet_politics,:id_schet_sebest_sklad,4,2)
              into :sebest,:id_partiya;
          end /* if (:tip_depend=103)*/
        end /*if (:tip_depend in (5,30,103))*/
      end /*пересчёт зависимых накладных*/
    end /*if (:tip in (1,2,103) and (:mode in (1,2)))*/

    /*Если сказали перепровести расход со склада как-будто он сегодня*/
    if (:tip in (5,103,30) and mode=3) then begin
      select sebest
        from naklot_sebest2_count_pc(:id_nakld,
          :id_uchet_politics,:id_schet_sebest_sklad,2,2)
        into :sebest;
      /*$$IBEC$$ if (mode=3) then begin $$IBEC$$*/
      /*Режим 6 для отгрузок*/
        select sebest,id_partiya
          from naklot_sebest2_count_pc(:id_nakld,
            :id_uchet_politics,:id_schet_sebest_sklad,3,2)
          into :sebest,:id_partiya;
      if (tip=103 and mode=3) then begin
        select sebest,id_partiya
        from naklot_sebest2_count_pc(:id_nakld,
          :id_uchet_politics,:id_schet_sebest_sklad,4,2)
        into :sebest,:id_partiya;
      end /*if (tip=103 and mode=3)*/
        
    end /*if (:tip in (5,103,30) and mode=3)*/


    if ((tip=1) and (mode=3)) then begin
        /*пересыпать себестоимость по новому*/
        /*Если приход, то надо оприходовать себестоимость на конечный склад*/
        select sebest
          from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,2,2)
          into :sebest;              
        select sebest,id_partiya
          from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,1,2)
          into :sebest,:id_partiya;
    end /*tip=1*/

      /*Излишек */
    if ((tip=2) and (mode=3)) then begin
      select sebest
        from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,2,2)
        into :sebest;              
      /*Режим 6 создать. Излишки*/
      if (kolotp>0) then begin
        select sebest,id_partiya
          from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,6,2)
          into :sebest,:id_partiya;
      end else begin
        /*Если излишек с отрицательной длиной то он недостача*/
        select sebest,id_partiya
          from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,3,2)
          into :sebest,:id_partiya;
      end
    end /*if tip=2*/
    /*Просто пересчитать отгрузку*/
    if ((tip=5) and (mode=1)) then begin
      select sebest
        from naklot_sebest2_count_pc(:ID_NAKLD,
          :id_uchet_politics,:id_schet_sebest_sklad,2,2)
        into :sebest;              
      select sebest,id_partiya
        from naklot_sebest2_count_pc(:ID_NAKLD,
          :id_uchet_politics,:id_schet_sebest_sklad,3,2)
        into :sebest,:id_partiya;
    end/*((tip=5) and (mode=1))*/

  end /*for*/
end^

SET TERM ; ^

DESCRIBE PROCEDURE NAKLP_SEBEST4_RECOUNT_PC
'Пересчёт всех зависимых от одного прихода или излишка
накладных по себестоимости3. Используется naklp_post_pc
Для прихода, излишка, и хранения пересчитывает зависимые
Для расхода пересчитывает только одну свою позицию
 
mode=7 - одна позиция накладной на хранение
mode=4 - зависимые позиции от одной позиции прихода
mode=1 - вся накл  и зависимые
mode=2 - вся накл
mode=6 - пересчёт позиции излишков
mode=6 - как и mode=5 для одной позиции отгрузки,
  но свободные партии смотрим на сегодня, а
  не на день отгрузки. Это для пересчёта отгрузок
  которые сами создали себе приходы';

GRANT SELECT ON NAKLOT TO PROCEDURE NAKLP_SEBEST4_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLP_SEBEST4_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_SETTINGS_PC TO PROCEDURE NAKLP_SEBEST4_RECOUNT_PC;

GRANT SELECT,UPDATE ON PROVODKI TO PROCEDURE NAKLP_SEBEST4_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE NAKLP_SEBEST4_RECOUNT_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO PROCEDURE NAKLO_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO PROCEDURE NAKLP_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO PROCEDURE NAKLP_SEBEST4_PART_RECOUNT_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO PROCEDURE NAKLP_SEBEST4_RECOUNT_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO PROCEDURE TEMP67_SKLAD_SEBEST_MINUS_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO PROCEDURE TEMP70_SEBSKLAD_TIME_CHECK;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE NAKLP_SEBEST4_RECOUNT_PC TO POWER_USER;

