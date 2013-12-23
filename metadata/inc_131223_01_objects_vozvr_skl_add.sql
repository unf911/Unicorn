INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT) VALUES (-110, 101, 0, 'Возврат', 'Возвратная складская', 'ВОЗВРАТНАЯ СКЛАДСКАЯ', NULL);


update naklo om
set tip= -110/*Возврат*/
where exists (
select omp.id_nakl
from naklo omp
where om.parent_id_nakl=omp.id_nakl
and om.tip=1 and omp.tip=-84);


update provodki pr
set pr.tip=-110
where pr.tip=10907 /*ПРИХОДНЫЕ СКЛАДСКИЕ НАКЛАДНЫЕ*/ and
  exists (
    select id_nakl
    from naklo om
    where om.tip =-110
      and om.id_nakl=pr.id_nakl
  );

