SET TERM ^ ;

create procedure temp_naklras_fill_id2 
returns ( id2 integer,
          schet integer)
as
begin

  for
    select n.schet
      from naklras n
      where n.dat>='01.01.2011' and n.id2 =0
      --and n.schet=116930
      -->'01.03.11'
      into :schet
  do begin
    id2=null;
    select cast(n.id as integer) from naklras n
      where n.schet=:schet
      into :id2;

    update naklras
      set id2=:id2
      where schet=:schet;
      
    suspend;
    
    when any do suspend;
  end  /*for naklras*/

end^

SET TERM ; ^

GRANT SELECT,UPDATE ON NAKLRAS TO PROCEDURE TEMP_NAKLRAS_FILL_ID2;

GRANT EXECUTE ON PROCEDURE TEMP_NAKLRAS_FILL_ID2 TO SYSDBA;
