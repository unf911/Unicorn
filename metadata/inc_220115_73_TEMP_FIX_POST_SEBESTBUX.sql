SET TERM ^ ;

CREATE OR ALTER PROCEDURE TEMP_FIX_POST_SEBESTBUX 
returns (
    sub1 integer,
    sub2 integer,
    sub3 bigint,
    sub4 integer,
    id_schet integer)
as
declare variable id_post integer;
begin
  for
    select sub1, sub2, sub3, sub4 , id_schet
    from provodki pr
    where
      pr.id_schet in (11513,11352)
    group by sub1, sub2, sub3, sub4, id_schet
    having max(sub5)<>min(sub5)
    order by sub3 desc
    into :sub1, :sub2, :sub3, :sub4, :id_schet
  do begin
  
    select
      --sub5
      min(sub5)
    from provodki pr
    where pr.sub1=:sub1 and pr.sub2=:sub2
      and pr.sub3=:sub3 and pr.sub4=:sub4 and pr.id_schet=:id_schet
      and pr.debet>0
    into :id_post;
    
    update provodki
    set sub5=:id_post
    where sub1=:sub1 and sub2=:sub2
      and sub3=:sub3 and sub4=:sub4 and id_schet=:id_schet
      and sub5<>:id_post;

    suspend;
  end
end
^

SET TERM ; ^


