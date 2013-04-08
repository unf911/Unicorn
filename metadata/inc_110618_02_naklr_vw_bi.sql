SET TERM ^ ;



CREATE OR ALTER TRIGGER NAKLR_VW_BI0 FOR NAKLR_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END
^


CREATE OR ALTER TRIGGER NAKLR_VW_BI0 FOR NAKLR_VW
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id_nakl is null) then begin
    new.id_nakl = gen_id(naklo_gen,1);
  end
/*$$IBEC$$   select oid
    from GET_OID_OBJECTS_PC('–¿—’ŒƒÕ€≈ Õ¿ À¿ƒÕ€≈',-100)
    into :classid;   $$IBEC$$*//*3047*/
  insert into naklo (id_nakl,id,kurs,nds,dat,id_izg,id_zak,
     id_manager,comment, 
     nalog_nds,posted,blocked,delmarked,
     id_currency,id_sklad,id_sklad_to,tip,id_currency_to,
     parent_id_nakl)
    values (new.id_nakl,new.id,new.kurs,new.nds,new.dat,new.id_izg,new.id_zak,
      new.id_manager,new.comment, new.nalog_nds,0/*new.posted*/,new.blocked,new.delmarked,
      new.id_currency,new.id_sklad,new.id_sklad_to,3047,new.id_xoz_oper,
      new.id_reys);
  insert into naklr (id_nakl,sch,dov,ddo,lico,fr) values
   (new.id_nakl,new.sch,new.dov,new.ddo,new.lico,new.fr);
end
^


SET TERM ; ^


/* Privileges of triggers */
GRANT INSERT ON NAKLO TO TRIGGER NAKLR_VW_BI0;
GRANT INSERT ON NAKLR TO TRIGGER NAKLR_VW_BI0;
GRANT UPDATE, REFERENCES ON NAKLR_VW TO TRIGGER NAKLR_VW_BI0;
