SET TERM ^ ;

CREATE OR ALTER trigger provodki_ad10 for provodki
inactive after delete position 10
AS
begin /*$$IBE$$ 
  execute procedure provodki_post_pc(
    old.id_schet,
    old.tip,
    old.dat, 
    old.sub1,
    old.sub2,
    old.sub3,
    old.sub4, 
    old.sub5, 
    old.sub6,
    old.sub7,
    old.sub8,
    old.sub9,
    old.sub10);
 $$IBE$$*/ POST_EVENT '$$IBE$$';
end
^

SET TERM ; ^


