delete from ibe$log_fields;
commit;
delete from ibe$log_keys;
commit;
delete from ibe$log_tables;
commit;
delete from schett;
commit;
delete from schet;
commit;
delete from naklras om
where om.dat < incdate(current_timestamp,0,-6,0);
commit;
delete from naklrast ot
where not exists(select from naklras om where om.schet=ot.schet)
commit;


