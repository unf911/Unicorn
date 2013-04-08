update spr_sklad_vw s
set s.isdefault=0
where s.isdefault is null
