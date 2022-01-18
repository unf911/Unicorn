SET TERM ^ ;

CREATE OR ALTER trigger provodki_ai10 for provodki
active after insert position 10
AS
begin
  execute procedure provodki_post_pc(
    new.id_schet,
    new.tip,
    new.dat, 
    new.sub1,
    new.sub2,
    new.sub3,
    new.sub4, 
    new.sub5, 
    new.sub6,
    new.sub7,
    new.sub8,
    new.sub9,
    new.sub10);
end
^

SET TERM ; ^


