delete from attributes a
where a.attribute_id=1 and
exists (select id from klient k where k.id=a.oid)
