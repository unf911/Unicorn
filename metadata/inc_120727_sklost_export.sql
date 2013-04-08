select
    --st.id_tovar,
    (select name from objects o where o.oid=st.id_tovar)  as tovar_name,
    --st.id_sklad,
    (select name from objects o where o.oid=st.id_sklad)  as sklad_name,

    --st.id_tara,
    (select name from objects o where o.oid=st.id_tara)  as tara_name,
    st.nomer_tary,
    st.kolotp,st.kolbuxt,st.kolrezerv,st.kolbrezerv, st.comment,
    --st.id_izg,
    (select name from objects o where o.oid=st.id_izg)  as izg_name,
    --st.id_type,
    (select c.field_value from const c
      where c.table_name='SKLOSTT' and c.table_field='ID_TYPE' and c.id_field=st.id_type) as baraban,

    st.dat_post,st.kolotp_isx
from temp84_sklad_ostatki_export_pc('25.07.12') st