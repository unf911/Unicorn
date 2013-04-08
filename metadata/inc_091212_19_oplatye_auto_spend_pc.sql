SET TERM ^ ;

CREATE OR ALTER PROCEDURE OPLATY_AUTO_SPEND_PC(
    ID_SCHET INTEGER,
    ID_NAKL INTEGER,
    DAT TIMESTAMP,
    ID_IZG INTEGER,
    ID_ZAK INTEGER,
    ID_CURRENCY INTEGER,
    TIP_TRANSH INTEGER)
AS
  declare variable dat_nakl date;
  declare variable id_nakl_nakl integer;
  declare variable id_manager_nakl integer;
  declare variable transh double precision;
  declare variable dat_transh date;
  declare variable dat_report date;
  declare variable id_transh integer;
  declare variable nds_nepotrach double precision;
  declare variable tip_transh_vozvrat integer;
  declare variable nds double precision;
begin
    dat_report=dat;
    if (dat_report<current_timestamp ) then begin
      dat_report=current_timestamp;
    end
    for
      /*Оплаты*/
      select
        pr.dat, pr.sub3 as id_manager, z(pr.kredit),
        r.sub4 as id_nakl, sum(r.kreditafter)
      from rep_ostatki_pc(:id_schet,:dat_report,
        :id_izg,:id_zak,
        null,null,
        :id_currency,null,
        null,null,
        null,null) r inner join provodki pr
        on pr.id_nakl=r.sub4
      where r.kreditafter>0 and pr.id_schet=:id_schet
      group by pr.sub4,pr.dat,pr.sub3,pr.kredit,r.sub4
      order by pr.dat
      into :dat_nakl, :id_manager_nakl, :nds, :id_nakl_nakl, :transh
    do begin
      /*накладная*/
      select sum(r.debetafter)/*-sum(r.kreditafter) */
      from rep_ostatki_pc(:id_schet,:dat_report,
        :id_izg,:id_zak,
        null,:id_nakl,
        null,null,
        null,null,
        null,null) r 
      into :nds_nepotrach;
      if (nds_nepotrach<=0) then begin
        leave;
      end
      dat_transh=:dat;
      if (dat_transh<:dat_nakl) then begin
        dat_transh=:dat_nakl;
      end
      id_transh=gen_id(OPLNAKL_GEN, 1);
      
      /*ТРАНШ В РАСЧЕТАХ С ПОСТАВЩИКАМИ УСЛУГ ВОЗВРАТ*/
      if ((tip_transh =2) or (tip_transh =-36)) then  begin
        /*Возвраты. Предоплата клиента идёт на возврат клиенту. */
        insert into oplnakl  (id_from,id_to,transh,
            opl_data,id_manager,tip, id, id_currency)
          values (:id_nakl_nakl,:id_nakl,minnum(:transh,:nds_nepotrach),
            :dat_transh,:id_manager_nakl,:tip_transh,:id_transh, :id_currency);
        execute procedure oplnakl_post_pc(:id_transh);
      end
      if (tip_transh=1) then begin
        if (nds>0) then begin
          /*Обычные проводки*/
          insert into oplnakl  (id_from,id_to,transh,
              opl_data,id_manager,tip,id, id_currency)
            values (:id_nakl,:id_nakl_nakl,minnum(:transh,:nds_nepotrach),
              :dat_transh,:id_manager_nakl,:tip_transh,:id_transh, :id_currency);
          execute procedure oplnakl_post_pc(:id_transh);
        end else begin
          /*Входящие платежи. Возврат от поставщика*/
          tip_transh_vozvrat=3;
          insert into oplnakl  (id_from,id_to,transh,
              opl_data,id_manager,tip,id, id_currency)
            values (:id_nakl,:id_nakl_nakl,minnum(:transh,:nds_nepotrach),
              :dat_transh,:id_manager_nakl,:tip_transh_vozvrat,:id_transh, :id_currency);
          execute procedure oplnakl_post_pc(:id_transh);
        end
      end      
    end /*for*/
end^

SET TERM ; ^

DESCRIBE PROCEDURE OPLATY_AUTO_SPEND_PC
'Используется во взаиморасчётах с поставщиками

Самая тяжёлая часть. Оплата не знает попадёт ли на накладную или на возврат.
Т.е. нужно выбрать правильный тип транша в зависимости от того что будет оплачено.

Кроме того эту процедуру вызывают подозрительно. Возможно возвраты должны
вызывать naklo_auto_spend_pc. Проверить метки TODO в процедурах

Может использоваться только для вз с пост. Если для других счетов,
то нужна таблица соответствий: тип проводки = счёт, тип оплачиваемого документа

Пока обойду проблему отсутствия таблицы. Возьму проводку оплачиваемого документа,
если она с минусом, то возврат, иначе нормальная накладная.';

GRANT EXECUTE ON PROCEDURE REP_OSTATKI_PC TO PROCEDURE OPLATY_AUTO_SPEND_PC;

GRANT SELECT ON PROVODKI TO PROCEDURE OPLATY_AUTO_SPEND_PC;

GRANT INSERT ON OPLNAKL TO PROCEDURE OPLATY_AUTO_SPEND_PC;

GRANT EXECUTE ON PROCEDURE OPLNAKL_POST_PC TO PROCEDURE OPLATY_AUTO_SPEND_PC;

GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO PROCEDURE NAKLPBUX_POST_PC;
GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO PROCEDURE NAKLPU_POST_PC;
GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO PROCEDURE NAKLR_POST_PC;
GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO PROCEDURE OPLATY_POST_PC;
GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO PROCEDURE PLATEGY_POST_PC;
GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO SYSDBA;
