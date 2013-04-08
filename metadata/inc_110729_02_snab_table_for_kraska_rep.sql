select
t.id ,
t.id_analog, 
t.name,
(select name from objects o where o.oid=t.id_analog) as analog_name ,
t.gruppa1,
t.gruppa2,
t.gruppa3,
t.gruppa4,
t.weight,
(select sum((st.kolotp+st.kolrezerv)) from sklost st where st.id_tovar=t.id) as sklad_kolvo,
t.delmarked

from tovar_all_vw t
where
Upper(t.gruppa1) like UPPER('краска%') or
Upper(t.gruppa1) like UPPER('краситель%') or
Upper(t.gruppa1) like UPPER('грунтовка%') or
Upper(t.gruppa1) like UPPER('гидроизоляция%') or
Upper(t.gruppa1) like UPPER('штукатурка%') or
Upper(t.gruppa1) like UPPER('затирка%')

