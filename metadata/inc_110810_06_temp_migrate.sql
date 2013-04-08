SET TERM ^ ;

create procedure temp_migrate_attrib_naklot_pc
as
  declare variable oid integer;
  declare variable attribute_id integer;
  declare variable value1 varchar(250);
  declare variable value_int integer;
  declare variable value_num15_4 numeric(15,4);
  declare variable value_date timestamp;
begin


/*$$IBEC$$ for
  select a.oid,a.attribute_id,a.value1
   $$IBEC$$*//*,a.value_int,a.value_date,a.value_num15_4,a.sql_text*//*$$IBEC$$ 
  from attributes a
  where a.oid in (select id_nakld from naklot ot where ot.tip=8564)
  into :oid, :attribute_id, :value1  $$IBEC$$*//*, :value_int, :value_date, :value_num15_4, :sql_text*//*$$IBEC$$ 
do begin

  insert into attrib_naklot (oid,attribute_id,value1 $$IBEC$$*//*,value_int,value_date,value_num15_4,sql_text*//*$$IBEC$$ )  values
  (:oid, :attribute_id, :value1 $$IBEC$$*//*, :value_int, :value_date, :value_num15_4, :sql_text*//*$$IBEC$$ );
  
  delete from attributes where oid=:oid and attribute_id=:attribute_id;
end
 $$IBEC$$*/

/*$$IBEC$$ for
  select a.oid,a.attribute_id,a.value_int, a.value_num15_4
  from attributes a
  where a.oid in (select id_nakld from naklot ot where ot.tip=-89  $$IBEC$$*//*—–¿¬Õ≈Õ»≈ œ–¿…—Œ¬*//*$$IBEC$$ )
  into :oid, :attribute_id, :value_int , :value_num15_4
do begin

 $$IBEC$$*//*$$IBEC$$   insert into attrib_naklot (oid,attribute_id,value_int,value_num15_4)  values
  (:oid, :attribute_id, :value_int, :value_num15_4); $$IBEC$$*//*$$IBEC$$ 
  
  delete from attributes where oid=:oid and attribute_id=:attribute_id;
end $$IBEC$$*/


for
  select a.oid,a.attribute_id,a.value_date
  from attributes a
  where a.oid in (select id_nakld from naklot ot where ot.tip=(-88) /*—–¿¬Õ≈Õ»≈ œ–¿…—Œ¬ ƒ≈“2*/)
  into :oid, :attribute_id, :value_date
do begin

  insert into attrib_naklot (oid,attribute_id,value1,value_date)  values
  (:oid, :attribute_id, :value1, :value_date);
  
  delete from attributes where oid=:oid and attribute_id=:attribute_id;
end


end^

SET TERM ; ^

GRANT SELECT,DELETE ON ATTRIBUTES TO PROCEDURE TEMP_MIGRATE_ATTRIB_NAKLOT_PC;

GRANT SELECT ON NAKLOT TO PROCEDURE TEMP_MIGRATE_ATTRIB_NAKLOT_PC;

GRANT INSERT ON ATTRIB_NAKLOT TO PROCEDURE TEMP_MIGRATE_ATTRIB_NAKLOT_PC;

GRANT EXECUTE ON PROCEDURE TEMP_MIGRATE_ATTRIB_NAKLOT_PC TO SYSDBA;
