
INSERT INTO CLASS_ATTRIBUTES (OID, ATTRIBUTE_ID, ATTRIBUTE_NAME, ATTRIBUTE_TYPE, CLASSID) VALUES (3022, 3, 'Должность', 2, 3022);



/*-------------------------------------------------------------------------*/
/* First procedures with empty bodies */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE CHANGE_MANAGER_POID_PC(
    MANAGER_NAME VARCHAR(50),
    POID_MANAGER_NAME VARCHAR(50),
    VISIBLE_MANAGER_NAME VARCHAR(50))
AS
BEGIN
  EXIT;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE CHANGE_PASSWORD_PC(
    WHAT_TO_DO INTEGER,
    NEW_USER VARCHAR(128),
    MANAGER VARCHAR(50))
RETURNS (
    RESULT INTEGER)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE GET_MANAGER_VISIBLE_AREA(
    ID_MANAGER_IN INTEGER)
RETURNS (
    VISIBLE_AREA INTEGER,
    ID_MANAGER INTEGER)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE HAS_MANAGER_PARENT_KIEV_PC(
    ID_MANAGER INTEGER)
RETURNS (
    HAS_PARENT INTEGER)
AS
BEGIN
  SUSPEND;
END^

/*-------------------------------------------------------------------------*/

ALTER PROCEDURE TEST_GET_MANAGER_LIST
AS
BEGIN
  EXIT;
END^

/*-------------------------------------------------------------------------*/

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Dropping old views */
/*-------------------------------------------------------------------------*/

DROP VIEW MANAGER_VW;

/*-------------------------------------------------------------------------*/
/* Creating new views */
/*-------------------------------------------------------------------------*/

CREATE VIEW MANAGER_VW(
    ID,
    NAME,
    FULLNAME,
    DELMARKED,
    VISIBLE_AREA,
    SIGNATURE,
    POID,
    ID_DOLGNOST)
AS
select
  o.oid,o.name,o.fullname,o.delmarked,
  (select a.value_int
    from attributes a
    where a.oid=o.oid and a.attribute_id=1) as visible_area,
  (select a.value1
    from attributes a
    where a.oid=o.oid and a.attribute_id=2) as signature,
  (select poid from trees t where t.oid=o.oid and t.tree_oid=3022) as poid,
  (select a.value_int
    from attributes a
    where a.oid=o.oid and a.attribute_id=3) as id_dolgnost
from
  objects o, rdb$database
where
  o.classid=3022
;
/*-------------------------------------------------------------------------*/
/* Restoring descriptions for views */
/*-------------------------------------------------------------------------*/

DESCRIBE VIEW MANAGER_VW
'Список менеджеров,
Исп в dmdEx.cdsManager';

/*-------------------------------------------------------------------------*/
/* Restoring descriptions of view columns */
/*-------------------------------------------------------------------------*/

/*-------------------------------------------------------------------------*/
/* Restoring triggers for views */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

CREATE TRIGGER MANAGER_VW_BD FOR MANAGER_VW
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER MANAGER_VW_BI FOR MANAGER_VW
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

CREATE TRIGGER MANAGER_VW_BU FOR MANAGER_VW
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN
  POST_EVENT 'DUMMY_EVENT';
END^

ALTER TRIGGER MANAGER_VW_BD
as
begin
  delete from objects o
    where o.oid=old.id;
/*$$IBEC$$   delete from trees t
    where t.oid=old.id and t.tree_oid=3022; $$IBEC$$*/
end^

ALTER TRIGGER MANAGER_VW_BI
as
  declare variable classid integer;
begin
  if (new.id is null) then begin
    new.id=gen_id(oid_gen,1);
  end
  select oid
    from get_oid_objects_pc('ТИП МЕНЕДЖЕРЫ',-100)
    into :classid;  
  if (new.poid is null or new.poid=0) then begin
    select oid
      from get_oid_objects_pc('Все менеджеры',:classid)
      into new.poid;
  end

  insert into objects (oid,classid,name,fullname,delmarked)
    values(new.id,
       :classid,
       new.name,
       new.fullname,
       new.delmarked
       );
  if (new.visible_area is null) then begin
    new.visible_area=new.id;
  end
  execute procedure attributes_set_pc(new.id,'Область видимости для менеджера',
    cast(new.visible_area as varchar(50)));
  execute procedure attributes_set2_pc(new.id, :classid, 'Подпись',
    cast(new.signature as varchar(50)));
  if (new.poid is not null) then begin
    insert into trees (oid,poid,tree_oid)
      values(new.id,new.poid,:classid);
  end
end^

ALTER TRIGGER MANAGER_VW_BU
as
  declare variable classid integer;
begin
  select oid
    from get_oid_objects_pc('ТИП МЕНЕДЖЕРЫ',-100)
    into :classid;
  update objects o
  set
    o.delmarked=new.delmarked,
    o.name=new.name,
    o.fullname=new.fullname
  where o.oid=old.id;
  execute procedure attributes_set_pc(new.id,'Область видимости для менеджера',
    cast(new.visible_area as varchar(50)));
  execute procedure attributes_set2_pc(new.id, :classid, 'Подпись',
    cast(new.signature as varchar(50)));    
  if ((old.poid is null) and (new.poid is not null)) then begin
    insert into trees (oid,poid,tree_oid)
      values(new.id,new.poid,:classid);
  end else begin
    update trees t
      set t.poid=new.poid,
        t.oid=new.id
      where t.oid=old.id and
        t.tree_oid=:classid;
  end
end^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring bodies of procedures */
/*-------------------------------------------------------------------------*/

SET TERM ^ ;

ALTER PROCEDURE CHANGE_MANAGER_POID_PC(
    MANAGER_NAME VARCHAR(50),
    POID_MANAGER_NAME VARCHAR(50),
    VISIBLE_MANAGER_NAME VARCHAR(50))
AS
  declare variable tip_manager integer;
  declare variable id_manager integer;
  declare variable poid_manager integer;
  declare variable oid_visible integer;
begin
  select oid from get_oid_objects_pc('ТИП МЕНЕДЖЕРЫ',-100) into :tip_manager;
  select oid from get_oid_objects_pc(:manager_name,:tip_manager) into :id_manager;
  select oid from get_oid_objects_pc(:poid_manager_name,:tip_manager) into :poid_manager;
  select oid from get_oid_objects_pc(:visible_manager_name,:tip_manager) into :oid_visible;
  update MANAGER_VW p
    set p.visible_area=:oid_visible,
      p.poid=:poid_manager
    where p.id=:id_manager;
end
^

ALTER PROCEDURE CHANGE_PASSWORD_PC(
    WHAT_TO_DO INTEGER,
    NEW_USER VARCHAR(128),
    MANAGER VARCHAR(50))
RETURNS (
    RESULT INTEGER)
AS
  declare variable classid integer;
  declare variable poid integer;
  declare variable oid integer;
  declare variable tree_oid integer;
begin
  /* to do: add 3 - remove user action  */
  /* nobody should see the text of proc  */
  /* change root password !!! */
  new_user=upper(:new_user);

if (:what_to_do=1) then begin
  if (user='SYSDBA') then begin
    select oid
      from get_oid_objects_pc('ТИП ПОЛЬЗОВАТЕЛИ',-100)
      into :classid;
    insert into objects (classid,name,fullname)
      values (:classid,:new_user,:new_user);
      
    select oid
      from get_oid_objects_pc('ТИП МЕНЕДЖЕРЫ',-100)
      into :poid;
    insert into MANAGER_VW(name, fullname)
      values (:manager,:manager);          
    select oid
      from get_oid_objects_pc(:manager,:poid)
      into :poid;
    select oid
      from get_oid_objects_pc('СВЯЗИ',-100)
      into :tree_oid;      
    select oid
      from get_oid_objects_pc('СВЯЗИ МЕЖДУ МЕНЕДЖЕРАМИ И ПОЛЬЗОВАТЕЛЯМИ',:tree_oid)
      into :tree_oid;
    select oid
      from get_oid_objects_pc(:new_user,:classid)
      into :oid;
    /*раз не менеджера ни пользователя ещё не
    существовало, то новый менеджер является
    менеджером по умолчанию: t.left_b=1*/
    insert into trees (tree_oid,poid,oid,left_b)
      values(:tree_oid,:poid,:oid,1);
    execute procedure trees_work2_pc (
      3,'Все менеджеры','Все менеджеры','ТИП МЕНЕДЖЕРЫ','ТИП МЕНЕДЖЕРЫ',0)
      returning_values result;
  end
  else begin
    result = 255;
  end
end
/*
if (:what_to_do=2) then begin
  select
  modify_User(1, 'server', :new_user, :new_password,
  '', '', '', '', 'SYSDBA', :root_password)
  from
  rdb$database  
  into
  :result;
end
if (:what_to_do=3) then begin
  if (user='SYSDBA') then begin
    select u.id_posr
      from users u
      where u.user_name=:new_user
      into :id_posr;
    delete from posr p where p.id=:id_posr;
    delete from users u where u.user_name=:new_user;
    select
    Delete_User(1, 'server', :new_user, 'SYSDBA', :root_password )
     from
    rdb$database
    into
    :result;
  end else begin
    result =255;
  end
end
*/

/*Менеджер уже существует. Добавлять его не надо.
Дерево менеджеров не перестраивать.  Пользователь существует*/
if (:what_to_do=3) then begin
/* add user  */
  if (user='SYSDBA') then begin
    select oid
      from get_oid_objects_pc('ТИП ПОЛЬЗОВАТЕЛИ',-100)
      into :classid;
   /* insert into objects (classid,name,fullname)
      values (:classid,:new_user,:new_user);*/
      
    select oid
      from get_oid_objects_pc('ТИП МЕНЕДЖЕРЫ',-100)
      into :poid; 
    select oid
      from get_oid_objects_pc(:manager,:poid)
      into :poid;
    select oid
      from get_oid_objects_pc('СВЯЗИ',-100)
      into :tree_oid;      
    select oid
      from get_oid_objects_pc('СВЯЗИ МЕЖДУ МЕНЕДЖЕРАМИ И ПОЛЬЗОВАТЕЛЯМИ',:tree_oid)
      into :tree_oid;
    select oid
      from get_oid_objects_pc(:new_user,:classid)
      into :oid;
    insert into trees (tree_oid,poid,oid)
      values(:tree_oid,:poid,:oid);
  end
  else begin
    result = 255;
  end
end

/*Новый менеджер. Существующий пользователь*/
if (:what_to_do=4) then begin
/* add user  */
  if (user='SYSDBA') then begin
    select oid
      from get_oid_objects_pc('ТИП ПОЛЬЗОВАТЕЛИ',-100)
      into :classid;
/*    insert into objects (classid,name,fullname)
      values (:classid,:new_user,:new_user);
  */
    select oid
      from get_oid_objects_pc('ТИП МЕНЕДЖЕРЫ',-100)
      into :poid;

    insert into objects(classid,name, fullname)
      values (:poid,:manager,:manager);   
    select oid
      from get_oid_objects_pc(:manager,:poid)
      into :poid;
    select oid
      from get_oid_objects_pc('СВЯЗИ',-100)
      into :tree_oid;      
    select oid
      from get_oid_objects_pc('СВЯЗИ МЕЖДУ МЕНЕДЖЕРАМИ И ПОЛЬЗОВАТЕЛЯМИ',:tree_oid)
      into :tree_oid;
    select oid
      from get_oid_objects_pc(:new_user,:classid)
      into :oid;
    insert into trees (tree_oid,poid,oid)
      values(:tree_oid,:poid,:oid);
    execute procedure trees_work2_pc (
      3,'Все менеджеры','Все менеджеры','ТИП МЕНЕДЖЕРЫ','ТИП МЕНЕДЖЕРЫ',0)
      returning_values result;
  end
  else begin
    result = 255;
  end
end

/*Сущ менеджер. Существующий пользователь*/
if (:what_to_do=5) then begin
/* add user  */
  if (user='SYSDBA') then begin
    select oid
      from get_oid_objects_pc('ТИП ПОЛЬЗОВАТЕЛИ',-100)
      into :classid;
/*    insert into objects (classid,name,fullname)
      values (:classid,:new_user,:new_user);
  */
    select oid
      from get_oid_objects_pc('ТИП МЕНЕДЖЕРЫ',-100)
      into :poid;

 /*   insert into objects(classid,name, fullname)
      values (:poid,:manager,:manager); */
    select oid
      from get_oid_objects_pc(:manager,:poid)
      into :poid;
    select oid
      from get_oid_objects_pc('СВЯЗИ',-100)
      into :tree_oid;      
    select oid
      from get_oid_objects_pc('СВЯЗИ МЕЖДУ МЕНЕДЖЕРАМИ И ПОЛЬЗОВАТЕЛЯМИ',:tree_oid)
      into :tree_oid;
    select oid
      from get_oid_objects_pc(:new_user,:classid)
      into :oid;
      
    insert into trees (tree_oid,poid,oid)
      values(:tree_oid,:poid,:oid);
    execute procedure trees_work2_pc (
      3,'Все менеджеры','Все менеджеры','ИЕРАРХИЯ МЕНЕДЖЕРОВ','ТИП МЕНЕДЖЕРЫ',0)
      returning_values result;
  end
  else begin
    result = 255;
  end
end

/*Сущ менеджер. Новый пользователь*/
if (:what_to_do=6) then begin
/* add user  */
  if (user='SYSDBA') then begin
    select oid
      from get_oid_objects_pc('ТИП ПОЛЬЗОВАТЕЛИ',-100)
      into :classid;
    insert into objects (classid,name,fullname)
      values (:classid,:new_user,:new_user);      
    select oid
      from get_oid_objects_pc('ТИП МЕНЕДЖЕРЫ',-100)
      into :poid;
    select oid
      from get_oid_objects_pc(:manager,:poid)
      into :poid;
    select oid
      from get_oid_objects_pc('СВЯЗИ',-100)
      into :tree_oid;      
    select oid
      from get_oid_objects_pc('СВЯЗИ МЕЖДУ МЕНЕДЖЕРАМИ И ПОЛЬЗОВАТЕЛЯМИ',:tree_oid)
      into :tree_oid;
    select oid
      from get_oid_objects_pc(:new_user,:classid)
      into :oid;
    insert into trees (tree_oid,poid,oid,left_b)
      values(:tree_oid,:poid,:oid,1);
  end
  else begin
    result = 255;
  end
end

suspend;
end
^

ALTER PROCEDURE GET_MANAGER_VISIBLE_AREA(
    ID_MANAGER_IN INTEGER)
RETURNS (
    VISIBLE_AREA INTEGER,
    ID_MANAGER INTEGER)
AS
begin
  /*Если не менеджер то видит всех менеджеров*/
  visible_area=null;
  if (id_manager_in is null) then begin
    select id_manager
      from get_id_manager_pc
      into :id_manager;
  end else begin
    id_manager=:id_manager_in;
  end
  select p.visible_area
    from MANAGER_VW p
    where p.id=:id_manager
    into :visible_area;
  suspend;
end
^

ALTER PROCEDURE HAS_MANAGER_PARENT_KIEV_PC(
    ID_MANAGER INTEGER)
RETURNS (
    HAS_PARENT INTEGER)
AS
declare variable tree_oid integer;
  declare variable parent_oid integer;
begin
  if (id_manager is null) then begin
    select id_manager from get_id_manager_pc into :id_manager;
  end
  select oid
    from get_oid_objects_pc('ТИП МЕНЕДЖЕРЫ',-100)
    into :tree_oid;
  select id from MANAGER_VW p where p.name='Все менеджеры УКК Киев' into :parent_oid;
  has_parent=0;
  if (parent_oid is not null) then begin
   select has_parent
    from has_object_parent_pc(:id_manager, :tree_oid,:parent_oid)
    into :has_parent ;
  end
  suspend;
end
^

ALTER PROCEDURE TEST_GET_MANAGER_LIST
AS
  declare variable list_count integer;
  declare variable posr_count integer;
  declare variable serror varchar(200);
  declare variable tip integer;
  declare variable id_manager integer;
begin
  select oid
    from get_oid_objects_pc('ТИП МЕНЕДЖЕРЫ',-100)
    into :tip;
  select oid
    from get_oid_objects_pc('Тест',:tip)
    into :id_manager;
  select z(count(*))
    from get_manager_list_pc(:id_manager)
    into list_count;
  select z(count(*))
    from MANAGER_VW
    into :posr_count;
  if ((posr_count-1)<>list_count) then begin
    serror ='test_get_manager_list. #1';
    execute procedure error (serror);
  end
end
^

SET TERM ; ^

/*-------------------------------------------------------------------------*/
/* Restoring privileges */
/*-------------------------------------------------------------------------*/

GRANT SELECT ON ATTRIBUTES TO VIEW MANAGER_VW;
GRANT SELECT ON OBJECTS TO VIEW MANAGER_VW;
GRANT SELECT ON TREES TO VIEW MANAGER_VW;
GRANT UPDATE, REFERENCES ON MANAGER_VW TO TRIGGER MANAGER_VW_BU;
GRANT SELECT, UPDATE ON MANAGER_VW TO PROCEDURE CHANGE_MANAGER_POID_PC;
GRANT INSERT ON MANAGER_VW TO PROCEDURE CHANGE_PASSWORD_PC;
GRANT SELECT ON MANAGER_VW TO PROCEDURE GET_MANAGER_LIST_PC;
GRANT SELECT ON MANAGER_VW TO PROCEDURE GET_MANAGER_VISIBLE_AREA;
GRANT SELECT ON MANAGER_VW TO PROCEDURE HAS_MANAGER_PARENT_KIEV_PC;
GRANT SELECT ON MANAGER_VW TO PROCEDURE TEST_GET_MANAGER_LIST;
GRANT SELECT, REFERENCES ON MANAGER_VW TO "PUBLIC";
GRANT SELECT, REFERENCES ON MANAGER_VW TO MANAGER;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON MANAGER_VW TO POWER_USER;


GRANT SELECT,DELETE ON OBJECTS TO TRIGGER MANAGER_VW_BD;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER MANAGER_VW_BI;
GRANT INSERT ON OBJECTS TO TRIGGER MANAGER_VW_BI;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET_PC TO TRIGGER MANAGER_VW_BI;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER MANAGER_VW_BI;
GRANT INSERT ON TREES TO TRIGGER MANAGER_VW_BI;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO TRIGGER MANAGER_VW_BU;
GRANT SELECT,UPDATE ON OBJECTS TO TRIGGER MANAGER_VW_BU;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET_PC TO TRIGGER MANAGER_VW_BU;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER MANAGER_VW_BU;
GRANT SELECT,INSERT,UPDATE ON TREES TO TRIGGER MANAGER_VW_BU;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE CHANGE_MANAGER_POID_PC;
GRANT SELECT,UPDATE ON MANAGER_VW TO PROCEDURE CHANGE_MANAGER_POID_PC;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE CHANGE_PASSWORD_PC;
GRANT INSERT ON OBJECTS TO PROCEDURE CHANGE_PASSWORD_PC;
GRANT INSERT ON MANAGER_VW TO PROCEDURE CHANGE_PASSWORD_PC;
GRANT INSERT ON TREES TO PROCEDURE CHANGE_PASSWORD_PC;
GRANT EXECUTE ON PROCEDURE TREES_WORK2_PC TO PROCEDURE CHANGE_PASSWORD_PC;
GRANT EXECUTE ON PROCEDURE GET_ID_MANAGER_PC TO PROCEDURE GET_MANAGER_VISIBLE_AREA;
GRANT SELECT ON MANAGER_VW TO PROCEDURE GET_MANAGER_VISIBLE_AREA;
GRANT EXECUTE ON PROCEDURE GET_ID_MANAGER_PC TO PROCEDURE HAS_MANAGER_PARENT_KIEV_PC;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE HAS_MANAGER_PARENT_KIEV_PC;
GRANT SELECT ON MANAGER_VW TO PROCEDURE HAS_MANAGER_PARENT_KIEV_PC;
GRANT EXECUTE ON PROCEDURE HAS_OBJECT_PARENT_PC TO PROCEDURE HAS_MANAGER_PARENT_KIEV_PC;
GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE TEST_GET_MANAGER_LIST;
GRANT EXECUTE ON PROCEDURE GET_MANAGER_LIST_PC TO PROCEDURE TEST_GET_MANAGER_LIST;
GRANT SELECT ON MANAGER_VW TO PROCEDURE TEST_GET_MANAGER_LIST;
GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE TEST_GET_MANAGER_LIST;

