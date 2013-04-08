SET TERM ^ ;

CREATE OR ALTER PROCEDURE CHECK_NAKLO_CONSISTENCY_PC(
    ID_NAKL INTEGER)
AS
declare variable str varchar(200);
  declare variable NOMER_TARY VARCHAR(30);
  declare variable KOLOTP NUMERIC(15,4);
  declare variable id_pos integer;
  declare variable id_tara integer;
  declare variable TARA VARCHAR(50);
  declare variable tovar varchar(50);
  declare variable dat date;
  declare variable dat2 date;
  declare variable id_tovar integer;
begin

 for
 select
  ot.id_pos,
  od.nomer_tary,
  od.kolotp,
  od.id_tara
 from
  naklodet od
  inner join naklot ot on ot.id_nakld=od.id_nakld
  /*left join sklostdet sd on od.id_det=sd.id_det*/
 where
  ot.id_nakl=:id_nakl/* and sd.id_ostt is null*/
  and not exists(select sd.id_ostdet from sklostdet sd where sd.id_det=od.id_det and sd.id_type in (22,32))
 into
  :id_pos,
  :nomer_tary,
  :kolotp,
  :id_tara
 do begin
    if (nomer_tary is null) then begin
     nomer_tary ='';
    end
    select t.name from tara_vw t where t.id=:id_tara into :tara;
    if (tara is null) then begin
     tara='неизв';
    end
    str = 'Ошибка в накл№ '|| coalesce(:id_nakl,0) ||' поз №' || coalesce (:id_pos,0) ||
     '. Длина=' ||
     coalesce (cast(kolotp as numeric(9,3)),0) ||
     '. Тара=' || trim(tara) ||'. №тары=' || trim(nomer_tary);
    execute procedure error(str);
  end
  for
    select om2.dat,om.dat,ot.id_tovar,
      od.id_tara,od.kolotp,od.nomer_tary
    from naklo om
      inner join naklot ot on ot.id_nakl=om.id_nakl
      inner join naklodet od on od.id_nakld=ot.id_nakld
      inner join sklostdet sd on sd.id_ostt=od.id_ostt
      inner join naklodet od2 on sd.id_det=od2.id_det
      inner join naklot ot2 on ot2.id_nakld=od2.id_nakld
      inner join naklo om2 on om2.id_nakl=ot2.id_nakl
    where
      om.id_nakl=:id_nakl/*om.dat>'20.05.05' and om.tip=5 and om.id_nakl=144035*/
      and sd.id_type in (11,12)
      and om2.dat>om.dat 
      and om2.tip in (1,103,6) /*добавил. Иначе ошибка будет, если отгрузка раньше посленего излишка*/
        /*Добавил 103,6. обрабатывать не только приход, но и хранение как приход и порезку*/
    into :dat2,:dat,:id_tovar,:id_tara,:kolotp,:nomer_tary
  do begin
    select name from tovar t where t.oid=:id_tovar into :tovar;
    select t.name from tara_vw t where t.id=:id_tara into :tara;
    if (tara is null) then begin
     tara='неизв';
    end
    str = 'Нельзя провести. Приход был ' || DateToStr(:dat2,'%d.%m.%y')
      || '. Товар:' || trim(:tovar) || ' '
      || trim(cast(cast(:kolotp as numeric(9,3))as varchar (7)))
      || ' м. Тара:' || tara ||'. №тары:' || trim(:nomer_tary);
    execute procedure error(str);
  end
  for
    select od.id_tara,ot.id_tovar,od.nomer_tary
      from naklot ot
        inner join naklodet od on od.id_nakld=ot.id_nakld
        inner join sklostdet sd on sd.id_ostt=od.id_ostt
        inner join sklostdet sd2 on sd2.id_ostt=sd.id_ostt
      where ot.id_nakl=:id_nakl and sd.id_type in (21,31)
        and sd2.id_type in (21,31)
        and sd2.id_ostdet<>sd.id_ostdet
      into :id_tara,:id_tovar,:nomer_tary
  do begin
    select name from tovar t where t.oid=:id_tovar into :tovar;
    select t.name from tara_vw t where t.id=:id_tara into :tara;
    if (tara is null) then begin
     tara='неизв';
    end
    str = 'Нельзя дважды отгрузить барабан.'
      || '. Товар:' || trim(:tovar) ||' Тара:' || :tara ||'. №тары:' || trim(:nomer_tary);
    execute procedure error(str);
  end

  for
    select
      od.id_tara,ot.id_tovar,od.nomer_tary
    from
      naklot ot
      inner join naklodet od on od.id_nakld=ot.id_nakld
      left join sklostdet sd on sd.id_det=od.id_det and sd.id_type in (31,21)
    where
      ot.id_nakl=:id_nakl and od.tip in (10,4)
      and sd.id_ostdet is null
    into :id_tara,:id_tovar,:nomer_tary
  do begin
    select name from tovar t where t.oid=:id_tovar into :tovar;
    select t.name from tara_vw t where t.id=:id_tara into :tara;
    if (tara is null) then begin
     tara='неизв';
    end
    str = 'Намотайте заново на барабан.'
      || ' Товар:' || trim(:tovar) ||'. Тара:' || :tara ||'. №тары:' || trim(:nomer_tary);
    execute procedure error(str);
  end

  for
    select om2.dat,om.dat,ot.id_tovar,
      od.id_tara,od.kolotp,od.nomer_tary
    from naklo om
      inner join naklot ot on ot.id_nakl=om.id_nakl
      inner join naklodet od on od.id_nakld=ot.id_nakld
      inner join sklostdet sd on sd.id_det=od.id_det
      inner join sklostdet sd2 on sd2.id_ostt=sd.id_ostt and sd2.id_ostdet<>sd.id_ostdet
      inner join naklodet od2 on sd2.id_det=od2.id_det
      inner join naklot ot2 on ot2.id_nakld=od2.id_nakld
      inner join naklo om2 on om2.id_nakl=ot2.id_nakl
    where
      om.id_nakl=:id_nakl /*om.dat>'20.05.05' and om.tip=5 and om.id_nakl=864490*/
      and od.tip in (4,10,13,16) -- только для намоток, причём со стороны тары
      and sd.id_type in (21,31)   --только для тары
      and sd2.id_type = 11
      and om2.dat>om.dat
      and om2.tip in (1,103,6)  /*добавил. Иначе ошибка будет, если отгрузка раньше посленего излишка*/
        /*Добавил 103,6. обрабатывать не только приход, но и хранение как приход и порезку*/
    into :dat2,:dat,:id_tovar,:id_tara,:kolotp,:nomer_tary
  do begin
    select name from tovar t where t.oid=:id_tovar into :tovar;
    select t.name from tara_vw t where t.id=:id_tara into :tara;
    if (tara is null) then begin
     tara='неизв';
    end
    str = 'Приход тары был ' || DateToStr(:dat2,'%d.%m.%y')
      || '. Товар:' || trim(:tovar) || ' '
      || trim(cast(cast(:kolotp as numeric(9,3))as varchar (7)))
      || ' м. Тара:' || tara ||'. №тары:' || trim(:nomer_tary);
    execute procedure error(str);
  end
end^

SET TERM ; ^

DESCRIBE PROCEDURE CHECK_NAKLO_CONSISTENCY_PC
'Данная процедура проверяет отгузку со склада
и если обнаруживается, что хоть одна позиция накладной
не упоминается в остатках на складе, то генерируется
ошибка подсказывающая пользователю, какую позицию нужно исправить
прежде чем распечатать накладную.

Применяется в процедуре распечатки отгрузок со склада.';

GRANT SELECT ON NAKLODET TO PROCEDURE CHECK_NAKLO_CONSISTENCY_PC;

GRANT SELECT ON NAKLOT TO PROCEDURE CHECK_NAKLO_CONSISTENCY_PC;

GRANT SELECT ON SKLOSTDET TO PROCEDURE CHECK_NAKLO_CONSISTENCY_PC;

GRANT SELECT ON TARA_VW TO PROCEDURE CHECK_NAKLO_CONSISTENCY_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE CHECK_NAKLO_CONSISTENCY_PC;

GRANT SELECT ON NAKLO TO PROCEDURE CHECK_NAKLO_CONSISTENCY_PC;

GRANT SELECT ON TOVAR TO PROCEDURE CHECK_NAKLO_CONSISTENCY_PC;

GRANT EXECUTE ON PROCEDURE CHECK_NAKLO_CONSISTENCY_PC TO PROCEDURE NAKLO_POST_PC;
GRANT EXECUTE ON PROCEDURE CHECK_NAKLO_CONSISTENCY_PC TO PROCEDURE REP_ACT_PC;
GRANT EXECUTE ON PROCEDURE CHECK_NAKLO_CONSISTENCY_PC TO PROCEDURE REP_NAKLO_PC;
GRANT EXECUTE ON PROCEDURE CHECK_NAKLO_CONSISTENCY_PC TO PROCEDURE REP_OTPRAVKI_PC;
GRANT EXECUTE ON PROCEDURE CHECK_NAKLO_CONSISTENCY_PC TO SYSDBA;

