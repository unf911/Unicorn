
/*******************************************************************************
The next statement causes the following error: 

Invalid insert or update value(s): object columns are
constrained - no 2 table rows can have duplicate column values.
violation of PRIMARY or UNIQUE KEY constraint "UNQ_TOVAR" on table "TOVAR".
*******************************************************************************/
update tovar_all_vw t set t.name='������ 4*10', t.delmarked=0, t.ediz='��', t.id_analog=10778, t.gruppa1='������', t.gruppa2=4, t.gruppa3=10, t.gruppa4=0 where t.id=10778;

