SET TERM ^ ;

CREATE OR ALTER PROCEDURE SKLOSTT_RECALC2_PC(
    ID_TOVAR INTEGER,
    ID_SKLAD INTEGER,
    ID_TARA INTEGER)
AS
  declare variable nothing integer;
  declare variable id_ost integer;
  declare variable kolotp double precision;
  declare variable kolrezerv double precision;
  declare variable kolotp2 double precision;
  declare variable kolrezerv2 double precision;
  declare variable id_ost_new integer;
begin
  /* Procedure Text */
  select z(sum(Round(st.kolotp*st.kolbuxt,4))),
       z(sum(Round(st.kolbrezerv*st.kolrezerv,4)))
    from sklostt st
    where st.id_tovar=:id_tovar and
      st.id_sklad=:id_sklad
    into :kolotp,:kolrezerv;
  select sm.id_ost
    from sklost sm
    where sm.id_tovar=:id_tovar
      and sm.id_sklad=:id_sklad
    into :id_ost;
  if (id_ost is not null) then begin
    update sklost sm
      set sm.kolotp=:kolotp,
        sm.kolrezerv=:kolrezerv
      where sm.id_tovar=:id_tovar and
        sm.id_sklad=:id_sklad;
/*$$IBEC$$
      –аскоментировать если
      select t.* from sklostt t left join sklost m on t.id_ost=m.id_ost
where t.kolotp>0 and m.id_ost is null
      возвращает строки
      update sklostt s
      set s.id_ost=:id_ost
      where s.id_tovar=:id_tovar
        and s.id_sklad=:id_sklad
        and s.id_ost<>:id_ost; $$IBEC$$*/
  end else begin
    if (:id_sklad is not null) then begin
      id_ost_new=gen_id(sklost_gen,1);
      insert into sklost (
          id_sklad,id_tovar,kolotp, kolrezerv,id_ost)
        values (
          :id_sklad,:id_tovar, :kolotp,:kolrezerv,:id_ost_new);
/*$$IBEC$$       update sklostt s
        set s.id_ost=:id_ost_new
        where s.id_tovar=:id_tovar
          and s.id_sklad=:id_sklad
          and s.id_ost<>:id_ost_new; $$IBEC$$*/
    end 
  end
  
  
  /*ѕересчитать тару на складе*/
  select nothing
    from tovar t
    where t.oid=:id_tara
    into :nothing;
  if (z(nothing)<>1) then begin
    /*¬ поле sklost.kolotp хранитьс€ колво свободных барабанов*/
    select z(sum(Round(st.kolbuxt,0)))
      from sklostt st
      where st.id_tara=:id_tara and
        st.id_sklad=:id_sklad and
        st.id_type=1 /*—вободные барабаны*/
      into :kolotp2;
    select
      sum(Round(
        case
        when st.kolbuxt = 1 and st.kolbrezerv = 1 then 1
        else z(st.kolbuxt) + z(st.kolbrezerv)
        end
      ,0))
      from  sklostt st
      where st.id_tara=:id_tara and
        st.id_sklad=:id_sklad and
        st.id_type in( 2,4,6) /* ќтложенный, целый, порезанный*/
      into :kolrezerv2;
    if (exists(
      select id_ost
        from sklost sm
        where sm.id_tovar=:id_tara and
          sm.id_sklad=:id_sklad
    )) then begin
      update sklost sm
        set sm.kolotp=:kolotp2,
          sm.kolrezerv=:kolrezerv2
        where sm.id_tovar=:id_tara and
          sm.id_sklad=:id_sklad;
    end else begin
      if (:id_sklad is not null) then
      insert into sklost (
          id_sklad,id_tovar,kolotp, kolrezerv)
        values (
          :id_sklad,:id_tara, :kolotp2,:kolrezerv2);
    end /*if позици€ тары уже была в остатках по складу*/
  end /*if z(nothing)<>1*/
/* пересчитать себестоимость*/
END^

SET TERM ; ^

DESCRIBE PROCEDURE SKLOSTT_RECALC2_PC
'пересчЄт себестоимости и количества
одной позиции в остатках на складе
при приходе

¬ложенные склады не видны в родительском';

GRANT SELECT ON SKLOSTT TO PROCEDURE SKLOSTT_RECALC2_PC;

GRANT SELECT,INSERT,UPDATE ON SKLOST TO PROCEDURE SKLOSTT_RECALC2_PC;

GRANT SELECT ON TOVAR TO PROCEDURE SKLOSTT_RECALC2_PC;

GRANT EXECUTE ON PROCEDURE SKLOSTT_RECALC2_PC TO PROCEDURE NAKLPDET_UNPOST_PC;
GRANT EXECUTE ON PROCEDURE SKLOSTT_RECALC2_PC TO PROCEDURE NAKLP_POST2_PC;
GRANT EXECUTE ON PROCEDURE SKLOSTT_RECALC2_PC TO PROCEDURE NAKLP_POST_PC;
GRANT EXECUTE ON PROCEDURE SKLOSTT_RECALC2_PC TO PROCEDURE NAKLP_UNPOST_PC;
GRANT EXECUTE ON PROCEDURE SKLOSTT_RECALC2_PC TO PROCEDURE SKLOSTDET_RECALC_PC;
GRANT EXECUTE ON PROCEDURE SKLOSTT_RECALC2_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE SKLOSTT_RECALC2_PC TO MANAGER;
GRANT EXECUTE ON PROCEDURE SKLOSTT_RECALC2_PC TO POWER_USER;
GRANT EXECUTE ON PROCEDURE SKLOSTT_RECALC2_PC TO SKLAD;

