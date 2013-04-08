SET TERM ^ ;

CREATE OR ALTER PROCEDURE SKLAD_SEBEST_MINUS_PC(
    ID_TOVAR_IN INTEGER,
    ID_SKLAD_IN INTEGER,
    DAT_TO_IN TIMESTAMP,
    MODE_IN INTEGER)
RETURNS (
    ID_SKLAD INTEGER,
    ID_TOVAR INTEGER,
    ID_PARTIYA INTEGER,
    ID_NAKL INTEGER,
    ID_NAKLD INTEGER,
    ID_PARTIYA_NEW INTEGER,
    KOLOTP DOUBLE PRECISION,
    DAT TIMESTAMP,
    TIP INTEGER)
AS
  declare variable id_uchet_politics_in integer;
  declare variable id_uchet_politics integer;
  declare variable id_schet_tip integer;
  declare variable id_schet_sebest_sklad integer;
  declare variable id_sklad_seb integer;
  declare variable sebest double precision;
  declare variable kolotp_sum double precision;
  declare variable kolotp_det double precision;
begin
  if (mode_in is null) then begin
    mode_in=0;
  end
  select oid
    from GET_OID_OBJECTS_PC('ПОЛИТИКИ СПИСАНИЯ СЕБЕСТОИМОСТИ',-100)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('УПРАВЛЕНЧЕСКИЙ УЧЁТ',:id_uchet_politics_in)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('ТИП СЧЕТА',-100)
    into :id_schet_tip;      
  select oid
    from GET_OID_OBJECTS_PC('СЕБЕСТОИМОСТЬ СКЛАД',:id_schet_tip)
    into :id_schet_sebest_sklad;
  if (mode_in in (0,2,3,4,5)) then begin
    for
      select  r.id_sklad,r.id_tovar, r.id_partiya,r.kolotp
      from rep_sebest4_sklad_pc(3,:id_sklad_in,:id_tovar_in ,null, :dat_to_in) r
      where Round(r.kolotp,3)<0
      into :id_sklad,:id_tovar,:id_partiya,:kolotp
    do begin
      if (mode_in=0) then begin
        suspend;
      end /*if ((mode=0) or (mode is null) )*/
      if (:mode_in in (2,3)) then begin
          kolotp_sum=0;
          for
            select /*$$IBEC$$ first 1 $$IBEC$$*/
              d.id_nakl,d.id_nakld,d.kolotp,d.dat,d.tip
            from rep_sebest4_sklad_det_pc(
              1,:id_sklad,:id_tovar,null,null, :id_partiya,null) d
            where d.tip in (5,30,2,103) and d.kolotp<0
            order by d.dat desc
            into :id_nakl,:id_nakld,:kolotp_det,:dat,:tip
          DO BEGIN
  
            kolotp_sum=z(:kolotp_sum)+abs(z(:kolotp_det));
            select id_sklad,id_uchet_politics
              from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
              into :id_sklad_seb,:id_uchet_politics;
            if (tip in (5,2,30,103)) then begin
              delete from provodki pr
                where pr.attr1=:id_nakld
                  and pr.id_nakl=:id_nakl
                  and pr.sub1=:id_tovar
                  and pr.sub2=:id_sklad
                  and pr.id_schet=:id_schet_sebest_sklad;
              if (:mode_in=2) then begin
                select sebest,id_partiya
                from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,10,2)
                into :sebest,:id_partiya_new;
              end/*if (:mode_in=2)*/
              if (:mode_in=3) then begin
                select sebest,id_partiya
                from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,3,2)
                into :sebest,:id_partiya_new;
              end/*if (:mode_in=3)*/

            end /*if (:id_sklad=102) */
            if (id_partiya_new<>id_partiya) then begin
              suspend;
            end else begin
              id_partiya_new=null;
              suspend;
            end
            
            if (abs(z(:kolotp_sum))>=abs(z(kolotp))) then begin
              break;
            end
            
          END /*for detail*/
      end /*if (mode=2)*/
      if (mode_in in (4)) then begin
          /*Перепроведение минусовых партий*/
        for
          select pr.id_nakl,pr.attr1,pr.sub3
          from provodki pr inner join
            provodki pr2 on pr.sub1=pr2.sub1
            and pr.sub2=pr2.sub2
            and pr.sub3=pr2.sub3
          where pr.id_schet=:id_schet_sebest_sklad
            and pr2.id_schet=:id_schet_sebest_sklad
            and pr.kredit_kolotp>0
            and pr2.debet_kolotp>0
            and pr.dat<pr2.dat
            and pr.sub3=:id_partiya
            and pr2.sub1= :id_tovar
            and pr2.sub2=:id_sklad
            and pr.sub1=:id_tovar
            and pr.sub2=:id_sklad
          order by pr.dat,pr.sub1, pr.sub2, pr.sub3, pr.id_nakl
          into :id_nakl,:id_nakld,:id_partiya
        do begin
          select sebest,id_partiya
            from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,2,2)
            into :sebest,:id_partiya_new;
          select sebest,id_partiya
            from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,3,2)
            into :sebest,:id_partiya_new;
          if (id_partiya_new<>id_partiya) then begin
            suspend;
          end else begin
            id_partiya_new=null;
            suspend;
          end         
        end /*for */
      end /*if (mode_in in (4))*/

      if (:mode_in=5) then begin
          kolotp_sum=0;
          for
            select /*$$IBEC$$ first 1 $$IBEC$$*/
              d.id_nakl,d.id_nakld,d.kolotp,d.dat,d.tip
            from rep_sebest4_sklad_det_pc(
              1,:id_sklad,:id_tovar,null,null, :id_partiya,null) d
            where d.tip in (5,30,2,103) and d.kolotp<0
            order by d.dat desc
            into :id_nakl,:id_nakld,:kolotp_det,:dat,:tip
          DO BEGIN
            kolotp_sum=z(:kolotp_sum)+abs(z(:kolotp_det));
            select id_sklad,id_uchet_politics
              from sklad_sebest_settings_pc(:ID_SKLAD, :id_uchet_politics_in)
              into :id_sklad_seb,:id_uchet_politics;
            if (tip in (5,2,30,103) and
              (:id_nakl<>:id_nakld)) --не из накл выравнивания с пометкой "СЕБЕСТ"
            then begin
              delete from provodki pr
                where pr.attr1=:id_nakld
                  and pr.id_nakl=:id_nakl
                  and pr.sub1=:id_tovar
                  and pr.sub2=:id_sklad
                  and pr.id_schet=:id_schet_sebest_sklad;
              select sebest,id_partiya
              from naklot_sebest2_count_pc(:ID_NAKLD,:id_uchet_politics,:id_schet_sebest_sklad,12,2)
              into :sebest,:id_partiya_new;
              if (id_partiya_new<>id_partiya) then begin
                suspend;
              end else begin
                id_partiya_new=null;
                suspend;
              end
              if (abs(z(:kolotp_sum))>=abs(z(kolotp))) then begin
                break;
              end              
            end /*if (:tip in (5,2,30,103) */

          END /*for detail*/
      end /*if (:mode_in=5) */
            
    end  /* for partiya<0 */
  end /*if mode_in(0,2,3,4)*/
end^

SET TERM ; ^

DESCRIBE PROCEDURE SKLAD_SEBEST_MINUS_PC
'Используется в
Склад-Остатки и обороты склада-Действия-Пересчитать отрицательные партии.

Себестоимость склада.
Ищет партии с отрицательными остатками. В них последнюю
отгрузку. И перепроводит эту одну позицию накладной.
Если после перепроведения отгрузка получилась с другой
партии, то в результат выводится строка со старой и новой партией

mode=3 - остатки партий на дату документа
mode=2 - остатки партий на сегодня
mode=4 - если расход был раньше прихода
mode=5 - остатки партий на дату ближайшего следующего прихода

select 
(select name from objects o where o.oid=r.id_tovar) as tovar,
(select name from objects o where o.oid=r.id_sklad) as sklad,
r.*
from sklad_sebest_minus_pc(null,null,null,0) r

Проверка на отрицательные партии
select  *
from rep_sebest4_sklad_pc(3,3043,null,null, null) r
where r.kolotp<0

select  r.*,t.name,t.tara
from rep_sebest4_sklad_pc(3,0,null,null, null) r inner join
  tovar t on r.id_tovar=t.oid
where r.kolotp<0 and t.tara=2
order by r.dat

Детализация
select first 1 *
from rep_sebest4_sklad_det_pc(1,3043,5958,null,null, 506230125,null) d
where d.tip=5
order by d.dat desc

Фиктивные приходы для отгрузок. Возможно неверные даты приходов
select *
from provodki pr
where pr.id_schet=11607 and pr.debet>0 and tip=5 and sub2=0
  and pr.dat between ''01.01.04'' and ''01.01.05''
order by pr.dat

/*Партии с расходом ранее прихода*/
select pr.id_nakl,pr.attr1,pr.sub3,pr.dat,
 encodedate(
   div(pr.sub3-div(pr.sub3,1000000)*1000000,10000),
   div(pr.sub3-div(pr.sub3,100000000)*100000000,1000000),
   div(pr.sub3,100000000)+2000)
  from provodki pr
  where pr.id_schet=:id_schet_sebest_sklad
    and pr.kredit_kolotp>0
    and pr.dat >= :dat_to_in
    and  encodedate(
  div(pr.sub3-div(pr.sub3,1000000)*1000000,10000),
  
  div(pr.sub3-div(pr.sub3,100000000)*100000000,1000000),
  div(pr.sub3,100000000)+2000)>pr.dat';

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE SKLAD_SEBEST_MINUS_PC;

GRANT EXECUTE ON PROCEDURE REP_SEBEST4_SKLAD_PC TO PROCEDURE SKLAD_SEBEST_MINUS_PC;

GRANT EXECUTE ON PROCEDURE REP_SEBEST4_SKLAD_DET_PC TO PROCEDURE SKLAD_SEBEST_MINUS_PC;

GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_SETTINGS_PC TO PROCEDURE SKLAD_SEBEST_MINUS_PC;

GRANT SELECT,DELETE ON PROVODKI TO PROCEDURE SKLAD_SEBEST_MINUS_PC;

GRANT EXECUTE ON PROCEDURE NAKLOT_SEBEST2_COUNT_PC TO PROCEDURE SKLAD_SEBEST_MINUS_PC;

GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_MINUS_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE SKLAD_SEBEST_MINUS_PC TO POWER_USER;
