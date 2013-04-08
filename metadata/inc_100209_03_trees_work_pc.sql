SET TERM ^ ;

CREATE OR ALTER PROCEDURE TREES_WORK_PC(
    WHAT INTEGER,
    OID INTEGER,
    POID INTEGER,
    TREE_OID INTEGER,
    LEFT_OID INTEGER,
    MODE INTEGER)
RETURNS (
    RESULT INTEGER)
AS
  declare variable str varchar(80);
  declare variable oid_item integer;
  declare variable poid_old integer;
  declare variable sError varchar(200);
  declare variable is_ancestor_error smallint;
begin
  result=0;
  /*создать дерево с корнем oid, тип дерева poid*/
  if (what =1) then begin
  /*
    if not exists(
      select oid
        from objects o
        where o.oid:=oid) then begin
        str='«апрещено добавл€ть в дерево несуществующий объект'
    end
  */
    insert into trees (oid,poid,tree_oid,left_b,right_b)
      values (:oid,0,:tree_oid,1,2);
  end
  /*добавить узел oid с родителем poid*/
  if (what =2) then begin
    execute procedure
      trees_work_pc(4,:oid,:poid,:tree_oid, :left_oid, :mode)
      returning_values :result;
      
    if (not exists (select *
     from trees t
     where t.oid=:oid and t.tree_oid=:tree_oid
     and t.poid=:poid)) then begin
     
      poid_old = null;
      select t.poid
        from trees t
        where t.oid=:oid and t.tree_oid=:tree_oid
        into :poid_old;
      if (poid_old is not null) then begin
        delete from trees t
          where t.oid=:oid and t.tree_oid=:tree_oid
            and t.poid=:poid_old;
      end /*if poid_old*/
      select has_parent
        from has_object_parent_pc(:oid, :tree_oid,:poid)
        into :is_ancestor_error;
      /*
      select result
        from trees_is_ancestor_pc(:poid,:oid,:tree_oid)
        into :is_ancestor_error;
      */
      if (is_ancestor_error=0) then begin
        insert into trees (poid,oid,tree_oid)
          values(:poid, :oid, :tree_oid);
      end else begin
        sError='TREES_WORK_PC. ÷иклическа€ св€зь.';
        execute procedure error(sError);
      end

    end /*if exists*/
  end   /*what=2*/
  
  /*построить дерево дл€ типа данных left_oid с родителем poid*/
  /*если mode=1 то записать этого родител€ как*/
  if (what=3) then begin
    /*execute procedure trees_work_pc(4,:oid,:poid,:tree_oid, :left_oid, :mode);*/
    for
      select oid
        from objects o
        where o.classid=:left_oid and o.delmarked=0
        into :oid_item
    do begin
      if (not exists (
        select *
        from trees t
        where t.tree_oid=:tree_oid and
          t.oid=:oid_item and t.poid=0))
        /*только вставлен, но в дерево не подв€зан*/
      then begin
        if (not exists (
         select * from trees t
         where t.oid=:oid_item and
           t.tree_oid=:tree_oid)) then begin
         
          /*все невс€занные в дерево объекты подв€зать к родителю*/
          execute procedure
            trees_work_pc(2,:oid_item,:poid, :tree_oid,:left_oid,:mode)
            returning_values :result;
            
        end /*if exists*/
      end /*if not root*/
    end /*for objecst*/
  end /*if what=3*/
  
  /* ѕроверка на существование*/
  if (what=4) then begin
    if (not exists(
      select oid
        from objects o
        where o.oid=:oid)) then begin
        str='«апрещено добавл€ть в дерево несуществующий объект';
        execute procedure error(str);
    end
    if (not exists(
      select oid
        from objects o
        where o.oid=:poid)) then begin
        str='«апрещено добавл€ть в дерево c несуществующим родителем';
        execute procedure error(str);
    end
    if (not exists(
      select oid
        from objects o
        where o.oid=:tree_oid)) then begin
        str='Ќеизвестный идентификатор дерева';
        execute procedure error(str);
    end      
  end /*what=4*/
  /*”даление записи из дерева*/
  if (what=5) then begin
    delete from trees t
      where t.oid=:oid and t.tree_oid=:tree_oid
        and t.poid=:poid;  
  end /*if what=5*/
end^

SET TERM ; ^

DESCRIBE PROCEDURE TREES_WORK_PC
'–абота с деревь€ми
what=3 построить дерево дл€ типа данных left_oid с родителем poid
если mode=1 то записать этого родител€ как';

GRANT SELECT,INSERT,DELETE ON TREES TO PROCEDURE TREES_WORK_PC;

GRANT EXECUTE ON PROCEDURE TREES_WORK_PC TO PROCEDURE TREES_WORK_PC;

GRANT EXECUTE ON PROCEDURE HAS_OBJECT_PARENT_PC TO PROCEDURE TREES_WORK_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE TREES_WORK_PC;

GRANT SELECT ON OBJECTS TO PROCEDURE TREES_WORK_PC;

GRANT EXECUTE ON PROCEDURE TREES_WORK_PC TO TRIGGER SPR_SKLAD2_VW_AI10;
GRANT EXECUTE ON PROCEDURE TREES_WORK_PC TO TRIGGER SPR_SKLAD2_VW_AU10;
GRANT EXECUTE ON PROCEDURE TREES_WORK_PC TO TRIGGER SPR_SKLAD_VW_AI10;
GRANT EXECUTE ON PROCEDURE TREES_WORK_PC TO TRIGGER SPR_SKLAD_VW_AU10;
GRANT EXECUTE ON PROCEDURE TREES_WORK_PC TO PROCEDURE TREES_WORK_PC;
GRANT EXECUTE ON PROCEDURE TREES_WORK_PC TO SYSDBA;

