SET TERM ^ ;

CREATE OR ALTER PROCEDURE TEMP22_PROVODKI_REFRESH_PC 
as
declare variable sub1 integer;
declare variable sub2 integer;
declare variable sub3 bigint;
begin
  for
    select sub1,sub2,sub3
      from provodki pr
      where pr.id_schet=8211 and pr.tip=1 and (debet<0 or kredit<0)
      group by sub1,sub2,sub3
      into :sub1,:sub2,:sub3
  do begin
    execute procedure provodki_refresh_pc(8211
      ,:sub1,:sub2,:sub3
      ,null,null
      ,null,null
      ,null,null
      ,null);
  end
end
^

SET TERM ; ^


