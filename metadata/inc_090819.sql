ALTER TRIGGER OTPRAVKIT_VW_BI10
ACTIVE BEFORE INSERT POSITION 10
AS
begin
  if (new.id_nakld is null) then begin
    NEW.ID_NAKLD = GEN_ID(NAKLOT_GEN,1);
  end
  insert into naklot (id_nakl,id_nakld,id_pos,id_tovar,tip)
    values (new.id_nakl,new.id_nakld,new.id_pos,
      (select first 1 id_tara from get_buxtnumber_pc),
      -99 /*oid*/
    );
end