/*Лишние барабаны в излишках, где был только намотки кабеля, а не приход барабанов*/
select
   *
   from naklot ot inner join naklo om on  om.id_nakl=ot.id_nakl
   inner join naklodet od on od.id_nakld=ot.id_nakld
   inner join sklostdet sd on sd.id_det=od.id_det
   inner join naklot ot2 on ot2.id_nakl=om.id_nakl
   where om.tip=2   and od.tip=5  and od.id_tara<>6828 and sd.id_type=12 and ot2.id_tovar=od.id_tara
   and (not exists(select * from sklostdet sd2 where sd2.id_det=od.id_det and sd2.id_type=11))

