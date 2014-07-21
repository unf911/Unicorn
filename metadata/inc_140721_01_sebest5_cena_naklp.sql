SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLP_PRICES_NAKLPBUX_PC (
    id_nakl integer)
as
declare variable id_currency_uah integer;
declare variable dat date;
declare variable parent_id_nakl integer;
declare variable tip_naklpbux integer;
declare variable tip_vozvrat integer;
declare variable zatraty double precision;
declare variable id_currency_parent integer;
declare variable nalog_nds_parent double precision;
declare variable parent_kurs double precision;
declare variable serror varchar(250);
declare variable parent_tip integer;
declare variable parent_id_zak integer;
declare variable kurs_from double precision;
declare variable kurs_to double precision;
declare variable kurs_itog double precision;
declare variable parent_tovar integer;
declare variable parent_cena double precision;
declare variable parent_skidka double precision;
declare variable id_tovar integer;
declare variable kolotp double precision;
declare variable tovar varchar(50);
declare variable parent_id_currency_to integer;
declare variable parent_kurs_indirect integer;
declare variable suma_bez_nds double precision;
begin
  select oid from get_oid_objects_pc('ПРИХОДНЫЕ НАКЛАДНЫЕ',-100) into :tip_naklpbux;
  select oid from get_oid_objects_pc('ВОЗВРАТ',-100) into :tip_vozvrat;
  
  select dat,parent_id_nakl
    from naklo om
    where om.id_nakl=:id_nakl
    into :dat,:parent_id_nakl;    
  
  select zatraty,id_currency,nalog_nds,kurs,
    id_zak,tip,p.id_currency_to,p.kurs_indirect
  from naklo p
  where p.posted=1 and
    p.tip in (:tip_naklpbux,:tip_vozvrat) and
    p.id_nakl=:parent_id_nakl
  into :zatraty,:id_currency_parent,
    :nalog_nds_parent,:parent_kurs,
    :parent_id_zak,:parent_tip,:parent_id_currency_to,:parent_kurs_indirect
    /*$$IBEC$$ :parent_dat,:parent_id_izg,:parent_id_zak,:parent_id_manager,
    :parent_kurs_indirect,:parent_id_currency_to,:parent_tip  $$IBEC$$*/;
  if (:parent_id_zak is null) then begin
    sError = 'Ошибка в naklp_prices_pc. НЕ НАЙДЕНА родительская накладная. id_nakl=' || coalesce(:parent_id_nakl,0);
    execute procedure error(sError);
  end
  if ((:zatraty is null) and (:parent_tip=:tip_naklpbux)) then begin
    sError = 'Ошибка в naklp_prices_pc. В родительской накладной не указаны затраты. id_nakl=' || coalesce(:parent_id_nakl,0);
    execute procedure error(sError);
  end 

  

  select oid
    from GET_OID_OBJECTS_PC('ТИП ВАЛЮТ',-100)
    into :id_currency_uah;
  select oid
    from GET_OID_OBJECTS_PC('UAH',:id_currency_uah)
    into :id_currency_uah;
  select k.kurs_from,k.kurs_to
    from kurs_get_pc(:dat, :parent_id_currency_to,:id_currency_uah,1) k
    into :Kurs_from,:kurs_to;
  if (:parent_kurs_indirect=1) then begin
    kurs_itog=1/:parent_kurs;
  end else begin
    kurs_itog=:parent_kurs;    
  end
  /*Была ошибка. Валюты=usd, но курс руками выставлен 5.3,
  так на самом деле курс=1 id_nakl=133548*/
  if (parent_id_currency_to=id_currency_parent) then begin
    kurs_itog=1;
  end
  kurs_itog=kurs_itog*kurs_from/kurs_to;
   /*Затраты данной накладной такие же в процентном соотношении,
    как и затраты родительской бух прих накл*/ 
  update naklo om
    set om.zatraty=:zatraty,
      om.id_currency=:id_currency_parent,
      om.id_currency_to=:id_currency_uah,
      om.nalog_nds=:nalog_nds_parent,
      om.kurs=:kurs_itog
    where om.id_nakl=:id_nakl;
  
   /*Цены данной накладной делаем равными ценам родительской накладной*/
  for
    select ot.id_tovar,ot.kolotp
      from naklot ot
      where ot.id_nakl=:id_nakl
      into :ID_TOVAR,:kolotp
  do begin
    parent_tovar=null;
    if (:kolotp>0) then begin
      /*Вычисляем средневзвешенную цену на товар*/
      select id_tovar,
          Round(dzero(z(sum(cena*kolotp)),z(sum(kolotp)),max(ot.cena)),5),
          Round(dzero(z(sum(skidka*kolotp)),z(sum(kolotp)),0),1)
        from naklot ot
        where ot.id_nakl=:parent_id_nakl and
          ot.id_tovar=:id_tovar
        group by id_tovar
        into :parent_tovar,:parent_cena,:parent_skidka;
      if ((parent_tovar is null) /*$$IBEC$$ and (id_schet is null $$IBEC$$*/) then begin
        select t.name
          from objects t
          where t.oid = :id_tovar
          into :tovar;
        execute procedure error('В родительской накладной не найден товар: ' || trim(tovar));
      end /*(parent_tovar is null)*/
      update naklot ot
        set ot.cena=:parent_cena,
          ot.skidka=:parent_skidka
        where ot.id_nakl=:id_nakl
          and ot.id_tovar=:parent_tovar;
    end /*if (:kolotp>0) */
  end /*for id_tovar*/

  select z(sum(Round(cena*kolotp,5)))
    from naklot ot
    where ot.id_nakl = :id_nakl
    into :suma_bez_nds;

  update naklo
    set nds = (:suma_bez_nds) * (1+z(:nalog_nds_parent))
    where id_nakl = :id_nakl;


end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE NAKLP_PRICES_NAKLPBUX_PC;

GRANT SELECT,UPDATE ON NAKLO TO PROCEDURE NAKLP_PRICES_NAKLPBUX_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE NAKLP_PRICES_NAKLPBUX_PC;

GRANT EXECUTE ON PROCEDURE KURS_GET_PC TO PROCEDURE NAKLP_PRICES_NAKLPBUX_PC;

GRANT SELECT,UPDATE ON NAKLOT TO PROCEDURE NAKLP_PRICES_NAKLPBUX_PC;

GRANT SELECT ON OBJECTS TO PROCEDURE NAKLP_PRICES_NAKLPBUX_PC;

GRANT EXECUTE ON PROCEDURE NAKLP_PRICES_NAKLPBUX_PC TO PROCEDURE NAKLP_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKLP_PRICES_NAKLPBUX_PC TO SYSDBA;

