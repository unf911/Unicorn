SET TERM ^ ;

CREATE OR ALTER PROCEDURE OPLATY_AUTO_SPEND_PC(
    ID_SCHET INTEGER,
    ID_NAKL INTEGER,
    DAT TIMESTAMP,
    ID_IZG INTEGER,
    ID_ZAK INTEGER,
    ID_CURRENCY INTEGER,
    TIP_TRANSH INTEGER,
    IS_DEBET_FROM INTEGER)
AS
  declare variable dat_nakl date;
  declare variable id_nakl_nakl integer;
  declare variable id_manager_nakl integer;
  declare variable transh double precision;
  declare variable dat_transh date;
  declare variable dat_report date;
  declare variable id_transh integer;
  declare variable nds_nepotrach double precision;
begin
  if (is_debet_from is null) then begin
    /*Платёж, а не накладная*/
    is_debet_from=1;
  end
  if (is_debet_from=1) then begin
    dat_report=dat;
    if (dat_report<current_timestamp ) then begin
      dat_report=current_timestamp;
    end
    for
      /*Оплаты*/
      select om.dat, om.id_manager, r.sub4, sum(r.kreditafter)
      from rep_ostatki_pc(:id_schet,:dat_report,
        :id_izg,:id_zak,
        null,null,
        :id_currency,null,
        null,null,
        null,null) r inner join naklo om
        on om.id_nakl=r.sub4
      where r.kreditafter>0
      group by sub4,om.dat,om.id_izg,om.id_zak,om.id_manager
      order by om.dat
      into :dat_nakl, :id_manager_nakl, :id_nakl_nakl, :transh
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

      if ((tip_transh =2) or (tip_transh =-36) or (tip_transh=-102) or (tip_transh=-33)  )
      /*ТРАНШ В РАСЧЕТАХ С ПОСТАВЩИКАМИ УСЛУГ ВОЗВРАТ*/ then
      begin
        /*Возвраты. Предоплата клиента идёт на возврат клиенту. */
        insert into oplnakl  (id_from,id_to,transh,
            opl_data,id_manager,tip, id, id_currency)
          values (:id_nakl_nakl,:id_nakl,minnum(:transh,:nds_nepotrach),
            :dat_transh,:id_manager_nakl,:tip_transh,:id_transh, :id_currency);
        execute procedure oplnakl_post_pc(:id_transh);
      end
      if (tip_transh=1) then begin
        /*Обычные проводки*/
        insert into oplnakl  (id_from,id_to,transh,
            opl_data,id_manager,tip,id, id_currency)
          values (:id_nakl,:id_nakl_nakl,minnum(:transh,:nds_nepotrach),
            :dat_transh,:id_manager_nakl,:tip_transh,:id_transh, :id_currency);
        execute procedure oplnakl_post_pc(:id_transh);
      end      
     end
   end /*if (id_nakl_from=0)*/
  if (is_debet_from=0) then begin
    dat_report=dat;
    if (dat_report<current_timestamp ) then begin
      dat_report=current_timestamp;
    end
    for
      /*Оплаты*/
      select om.dat, om.id_manager, r.sub4, sum(r.debetafter)
      from rep_ostatki_pc(:id_schet,:dat_report,
        :id_izg,:id_zak,
        null,null,
        :id_currency,null,
        null,null,
        null,null) r inner join naklo om
        on om.id_nakl=r.sub4
      where r.debetafter>0
      group by sub4,om.dat,om.id_izg,om.id_zak,om.id_manager
      order by om.dat
      into :dat_nakl, :id_manager_nakl, :id_nakl_nakl, :transh
    do begin
      /*накладная*/
      select sum(r.kreditafter)/*-sum(r.debetafter)*/
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
      if (tip_transh=1) then begin
        insert into oplnakl  (id_from,id_to,transh,
            opl_data,id_manager,tip,id, id_currency)
          values (:id_nakl_nakl,:id_nakl,minnum(:transh,:nds_nepotrach),
            :dat_transh,:id_manager_nakl,:tip_transh,:id_transh, :id_currency);
        execute procedure oplnakl_post_pc(:id_transh);    
      end
      if (tip_transh=3) then begin
        /*Возвраты. Поставщик вернул нам нашу предоплату. */
        insert into oplnakl  (id_from,id_to,transh,
            opl_data,id_manager,tip,id, id_currency)
          values (:id_nakl_nakl,:id_nakl,minnum(:transh,:nds_nepotrach),
            :dat_transh,:id_manager_nakl,:tip_transh,:id_transh, :id_currency);
        execute procedure oplnakl_post_pc(:id_transh);    
      end      
   end
  end /*if (id_nakl_from=1)*/
end^

SET TERM ; ^

DESCRIBE PROCEDURE OPLATY_AUTO_SPEND_PC
'Используется во взаиморасчётах с поставщиками';

GRANT EXECUTE ON PROCEDURE REP_OSTATKI_PC TO PROCEDURE OPLATY_AUTO_SPEND_PC;

GRANT SELECT ON NAKLO TO PROCEDURE OPLATY_AUTO_SPEND_PC;

GRANT INSERT ON OPLNAKL TO PROCEDURE OPLATY_AUTO_SPEND_PC;

GRANT EXECUTE ON PROCEDURE OPLNAKL_POST_PC TO PROCEDURE OPLATY_AUTO_SPEND_PC;

GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO PROCEDURE NAKLPBUX_POST_PC;
GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO PROCEDURE NAKLPU_POST_PC;
GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO PROCEDURE NAKLR_POST_PC;
GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO PROCEDURE OPLATY_POST_PC;
GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO PROCEDURE PLATEGY_POST_PC;
GRANT EXECUTE ON PROCEDURE OPLATY_AUTO_SPEND_PC TO SYSDBA;

