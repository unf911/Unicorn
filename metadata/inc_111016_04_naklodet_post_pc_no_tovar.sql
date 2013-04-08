CREATE OR ALTER PROCEDURE NAKLODET_POST_PC(
    ID_DET INTEGER)
AS
DECLARE VARIABLE OM_TIP INTEGER;
DECLARE VARIABLE ID_OSTT INTEGER;
DECLARE VARIABLE TIP INTEGER;

DECLARE VARIABLE  TOVAR VARCHAR(50);
DECLARE VARIABLE  TARA VARCHAR(50);
DECLARE VARIABLE  NOMER_TARY VARCHAR(30);
DECLARE VARIABLE  KOLOTP NUMERIC(15,4);

Declare variable str varchar(150);

begin
  /* резервирование */
/*  for*/
    select od.id_det,od.tip,od.id_ostt
      from naklodet od /*left join sklostdet sd
        on od.id_det=sd.id_det*/
      where od.id_det=:id_det /*and*/
      /*  sd.id_type between 20 and 39*/
      /*group by od.id_ostt,od.id_det,od.tip*/
      into :id_det,:tip,:id_ostt;
/*  do begin*/
    if ((id_ostt is null) or (tip=0)) then begin
      select
          t.name,od.kolotp,od.nomer_tary,t2.name as tara
        from naklodet od
          inner join  naklot ot on ot.id_nakld=od.id_nakld
          inner join  tovar t on t.oid=ot.id_tovar
          inner join  tovar t2 on t2.oid=od.id_tara
        where
          od.id_det=:id_det
        into
          :tovar,:kolotp,:nomer_tary,:tara;
      str = 'Ошибочная позиция: ' || tovar || ' ; ' || cast (cast(kolotp as numeric(9,3)) as varchar (9)) || ' ; ' ||  nomer_tary || ' ; ' || tara ;
      execute procedure error (str);
    end /*if*/

    select om.tip
      from naklo om
        inner join naklot ot on om.id_nakl=ot.id_nakl
        inner join naklodet od on od.id_nakld=ot.id_nakld
      where od.id_det=:id_det
      into :om_tip;
    /*при намотке нельзя удалять связь данной
     позиции накладной с позицией барабана на
     складе, sklostdet.tip=31*/
    if (tip not in (4,10,13,16)) then begin
      delete
      from sklostdet sd
      where sd.id_det=:id_det;
    end

    if (om_tip=5) then begin
      /*если накладная отгрузочная*/
      update naklodet od
      set od.tip=od.tip+6
      where (od.tip between 2 and 4) and
        od.id_det=:id_det;
    end/*od_tip=5*/

    if (om_tip=6) then begin
      /*если накладная на порезку*/
      update naklodet od
      set od.tip=od.tip+9
      where (od.tip between 2 and 4) and
        od.id_det=:id_det;
    end/*od_tip=6*/

    if (om_tip=103) then begin
      /*если накладная на хранение*/
      update naklodet od
      set od.tip=od.tip+12
      where (od.tip between 2 and 4) and
        od.id_det=:id_det;
    end/*od_tip=103*/

    if (om_tip=30) then begin
      /*если накладная на недостачу*/
      update naklodet od
      set od.tip=od.tip+6
      where (od.tip between 2 and 4) and
        od.id_det=:id_det;
    end/*od_tip=30*/

    execute procedure naklodet_process_pc (:id_det);
/*  end */ /*for naklodet*/
  execute procedure sklostdet_recalc_pc(:id_ostt);
END

