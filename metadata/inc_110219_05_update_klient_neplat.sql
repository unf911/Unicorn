update klient k
set k.lgoty=2
where (select a.value1 from attributes a where a.oid=k.id and a.attribute_id=1) = 'Неплательщик НДС';

update klient k
set k.lgoty=1
where (select a.value1 from attributes a where a.oid=k.id and a.attribute_id=1) = 'Экспортёр';
