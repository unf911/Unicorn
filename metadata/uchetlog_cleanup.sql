SET NAMES WIN1251;

/*$$IBEC$$ 
select first 1 t.id
from ibe$log_tables t
where t.date_time >= '01.08.07'
order by t.date_time asc
 $$IBEC$$*/

CONNECT 'progr:uchet_log' USER 'SYSDBA' PASSWORD 'masterkey';

delete from ibe$log_fields f
  where f.log_tables_id>=8472112;
commit;
delete from ibe$log_keys k
  where k.log_tables_id>=8472112;
commit;  
delete from ibe$log_tables t
  where t.id>=8472112;
commit; 

CONNECT 'black2:uchet' USER 'SYSDBA' PASSWORD 'sysdba8#2';

delete from ibe$log_fields f
  where f.log_tables_id<8472112;
commit;
delete from ibe$log_keys k
  where k.log_tables_id<8472112;
commit;  
delete from ibe$log_tables t
  where t.id<8472112;
commit;





