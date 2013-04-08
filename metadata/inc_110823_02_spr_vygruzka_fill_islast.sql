    update spr_vygruzka_vw
    set is_last=0
    where is_last is null;

    update spr_vygruzka_vw   m
    set is_last=1
    where exists(select count(*) from spr_vygruzka_vw s where s.id_reys=m.id_reys having count(*)=1) ;




