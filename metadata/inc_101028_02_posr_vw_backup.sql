/*-------------------------------------------------------------------------*/
/* First procedures with empty bodies */
/*-------------------------------------------------------------------------*/

set term ^ ;

alter procedure change_manager_poid_pc(
    manager_name varchar(50),
    poid_manager_name varchar(50),
    visible_manager_name varchar(50))
as
begin
  exit;
end^

/*-------------------------------------------------------------------------*/

alter procedure change_password_pc(
    what_to_do integer,
    new_user varchar(128),
    manager varchar(50))
returns (
    result integer)
as
begin
  suspend;
end^

/*-------------------------------------------------------------------------*/

alter procedure get_manager_visible_area(
    id_manager_in integer)
returns (
    visible_area integer,
    id_manager integer)
as
begin
  suspend;
end^

/*-------------------------------------------------------------------------*/

alter procedure has_manager_parent_kiev_pc(
    id_manager integer)
returns (
    has_parent integer)
as
begin
  suspend;
end^

/*-------------------------------------------------------------------------*/

alter procedure test_get_manager_list
as
begin
  exit;
end^

/*-------------------------------------------------------------------------*/

set term ; ^

/*-------------------------------------------------------------------------*/
/* Dropping old views */
/*-------------------------------------------------------------------------*/

drop view posr_vw;

/*-------------------------------------------------------------------------*/
/* Creating new views */
/*-------------------------------------------------------------------------*/

create view posr_vw(
    id,
    name,
    fullname,
    delmarked,
    visible_area,
    signature,
    poid)
as
select
  o.oid,o.name,o.fullname,o.delmarked,
  (select a.value_int
   from attributes a
   where a.oid=o.oid and a.attribute_id=1) as visible_area,
  (select a.value1
   from attributes a
   where a.oid=o.oid and a.attribute_id=2) as signature,
  (select poid from trees t where t.oid=o.oid and t.tree_oid=3022) as poid
from
  objects o, rdb$database
where
  o.classid=3022
;
/*-------------------------------------------------------------------------*/
/* Restoring descriptions for views */
/*-------------------------------------------------------------------------*/

describe view posr_vw
'Ñïèñîê ìåíåäæåğîâ,
Èñï â dmdEx.cdsManager';

/*-------------------------------------------------------------------------*/
/* Restoring descriptions of view columns */
/*-------------------------------------------------------------------------*/

/*-------------------------------------------------------------------------*/
/* Restoring triggers for views */
/*-------------------------------------------------------------------------*/

set term ^ ;

create trigger posr_vw_bd for posr_vw
active before delete position 0
as
begin
  post_event 'DUMMY_EVENT';
end^

create trigger posr_vw_bi for posr_vw
active before insert position 0
as
begin
  post_event 'DUMMY_EVENT';
end^

create trigger posr_vw_bu for posr_vw
active before update position 0
as
begin
  post_event 'DUMMY_EVENT';
end^

alter trigger posr_vw_bd
as
begin
  delete from objects o
    where o.oid=old.id;
/*$$IBEC$$   delete from trees t
    where t.oid=old.id and t.tree_oid=3022; $$IBEC$$*/
end^

alter trigger posr_vw_bi
as
  declare variable classid integer;
begin
  if (new.id is null) then begin
    new.id=gen_id(oid_gen,1);
  end
  select oid
    from get_oid_objects_pc('ÒÈÏ ÌÅÍÅÄÆÅĞÛ',-100)
    into :classid;  
  if (new.poid is null or new.poid=0) then begin
    select oid
      from get_oid_objects_pc('Âñå ìåíåäæåğû',:classid)
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
  execute procedure attributes_set_pc(new.id,'Îáëàñòü âèäèìîñòè äëÿ ìåíåäæåğà',
    cast(new.visible_area as varchar(50)));
  execute procedure attributes_set2_pc(new.id, :classid, 'Ïîäïèñü',
    cast(new.signature as varchar(50)));
  if (new.poid is not null) then begin
    insert into trees (oid,poid,tree_oid)
      values(new.id,new.poid,:classid);
  end
end^

alter trigger posr_vw_bu
as
  declare variable classid integer;
begin
  select oid
    from get_oid_objects_pc('ÒÈÏ ÌÅÍÅÄÆÅĞÛ',-100)
    into :classid;
  update objects o
  set
    o.delmarked=new.delmarked,
    o.name=new.name,
    o.fullname=new.fullname
  where o.oid=old.id;
  execute procedure attributes_set_pc(new.id,'Îáëàñòü âèäèìîñòè äëÿ ìåíåäæåğà',
    cast(new.visible_area as varchar(50)));
  execute procedure attributes_set2_pc(new.id, :classid, 'Ïîäïèñü',
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

set term ; ^

/*-------------------------------------------------------------------------*/
/* Restoring bodies of procedures */
/*-------------------------------------------------------------------------*/

set term ^ ;

alter procedure change_manager_poid_pc(
    manager_name varchar(50),
    poid_manager_name varchar(50),
    visible_manager_name varchar(50))
as
  declare variable tip_manager integer;
  declare variable id_manager integer;
  declare variable poid_manager integer;
  declare variable oid_visible integer;
begin
  select oid from get_oid_objects_pc('ÒÈÏ ÌÅÍÅÄÆÅĞÛ',-100) into :tip_manager;
  select oid from get_oid_objects_pc(:manager_name,:tip_manager) into :id_manager;
  select oid from get_oid_objects_pc(:poid_manager_name,:tip_manager) into :poid_manager;
  select oid from get_oid_objects_pc(:visible_manager_name,:tip_manager) into :oid_visible;
  update posr_vw p
    set p.visible_area=:oid_visible,
      p.poid=:poid_manager
    where p.id=:id_manager;
end
^

alter procedure change_password_pc(
    what_to_do integer,
    new_user varchar(128),
    manager varchar(50))
returns (
    result integer)
as
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
      from get_oid_objects_pc('ÒÈÏ ÏÎËÜÇÎÂÀÒÅËÈ',-100)
      into :classid;
    insert into objects (classid,name,fullname)
      values (:classid,:new_user,:new_user);
      
    select oid
      from get_oid_objects_pc('ÒÈÏ ÌÅÍÅÄÆÅĞÛ',-100)
      into :poid;
    insert into posr_vw(name, fullname)
      values (:manager,:manager);          
    select oid
      from get_oid_objects_pc(:manager,:poid)
      into :poid;
    select oid
      from get_oid_objects_pc('ÑÂßÇÈ',-100)
      into :tree_oid;      
    select oid
      from get_oid_objects_pc('ÑÂßÇÈ ÌÅÆÄÓ ÌÅÍÅÄÆÅĞÀÌÈ È ÏÎËÜÇÎÂÀÒÅËßÌÈ',:tree_oid)
      into :tree_oid;
    select oid
      from get_oid_objects_pc(:new_user,:classid)
      into :oid;
    /*ğàç íå ìåíåäæåğà íè ïîëüçîâàòåëÿ åù¸ íå
    ñóùåñòâîâàëî, òî íîâûé ìåíåäæåğ ÿâëÿåòñÿ
    ìåíåäæåğîì ïî óìîë÷àíèş: t.left_b=1*/
    insert into trees (tree_oid,poid,oid,left_b)
      values(:tree_oid,:poid,:oid,1);
    execute procedure trees_work2_pc (
      3,'Âñå ìåíåäæåğû','Âñå ìåíåäæåğû','ÒÈÏ ÌÅÍÅÄÆÅĞÛ','ÒÈÏ ÌÅÍÅÄÆÅĞÛ',0)
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

/*Ìåíåäæåğ óæå ñóùåñòâóåò. Äîáàâëÿòü åãî íå íàäî.
Äåğåâî ìåíåäæåğîâ íå ïåğåñòğàèâàòü.  Ïîëüçîâàòåëü ñóùåñòâóåò*/
if (:what_to_do=3) then begin
/* add user  */
  if (user='SYSDBA') then begin
    select oid
      from get_oid_objects_pc('ÒÈÏ ÏÎËÜÇÎÂÀÒÅËÈ',-100)
      into :classid;
   /* insert into objects (classid,name,fullname)
      values (:classid,:new_user,:new_user);*/
      
    select oid
      from get_oid_objects_pc('ÒÈÏ ÌÅÍÅÄÆÅĞÛ',-100)
      into :poid; 
    select oid
      from get_oid_objects_pc(:manager,:poid)
      into :poid;
    select oid
      from get_oid_objects_pc('ÑÂßÇÈ',-100)
      into :tree_oid;      
    select oid
      from get_oid_objects_pc('ÑÂßÇÈ ÌÅÆÄÓ ÌÅÍÅÄÆÅĞÀÌÈ È ÏÎËÜÇÎÂÀÒÅËßÌÈ',:tree_oid)
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

/*Íîâûé ìåíåäæåğ. Ñóùåñòâóşùèé ïîëüçîâàòåëü*/
if (:what_to_do=4) then begin
/* add user  */
  if (user='SYSDBA') then begin
    select oid
      from get_oid_objects_pc('ÒÈÏ ÏÎËÜÇÎÂÀÒÅËÈ',-100)
      into :classid;
/*    insert into objects (classid,name,fullname)
      values (:classid,:new_user,:new_user);
  */
    select oid
      from get_oid_objects_pc('ÒÈÏ ÌÅÍÅÄÆÅĞÛ',-100)
      into :poid;

    insert into objects(classid,name, fullname)
      values (:poid,:manager,:manager);   
    select oid
      from get_oid_objects_pc(:manager,:poid)
      into :poid;
    select oid
      from get_oid_objects_pc('ÑÂßÇÈ',-100)
      into :tree_oid;      
    select oid
      from get_oid_objects_pc('ÑÂßÇÈ ÌÅÆÄÓ ÌÅÍÅÄÆÅĞÀÌÈ È ÏÎËÜÇÎÂÀÒÅËßÌÈ',:tree_oid)
      into :tree_oid;
    select oid
      from get_oid_objects_pc(:new_user,:classid)
      into :oid;
    insert into trees (tree_oid,poid,oid)
      values(:tree_oid,:poid,:oid);
    execute procedure trees_work2_pc (
      3,'Âñå ìåíåäæåğû','Âñå ìåíåäæåğû','ÒÈÏ ÌÅÍÅÄÆÅĞÛ','ÒÈÏ ÌÅÍÅÄÆÅĞÛ',0)
      returning_values result;
  end
  else begin
    result = 255;
  end
end

/*Ñóù ìåíåäæåğ. Ñóùåñòâóşùèé ïîëüçîâàòåëü*/
if (:what_to_do=5) then begin
/* add user  */
  if (user='SYSDBA') then begin
    select oid
      from get_oid_objects_pc('ÒÈÏ ÏÎËÜÇÎÂÀÒÅËÈ',-100)
      into :classid;
/*    insert into objects (classid,name,fullname)
      values (:classid,:new_user,:new_user);
  */
    select oid
      from get_oid_objects_pc('ÒÈÏ ÌÅÍÅÄÆÅĞÛ',-100)
      into :poid;

 /*   insert into objects(classid,name, fullname)
      values (:poid,:manager,:manager); */
    select oid
      from get_oid_objects_pc(:manager,:poid)
      into :poid;
    select oid
      from get_oid_objects_pc('ÑÂßÇÈ',-100)
      into :tree_oid;      
    select oid
      from get_oid_objects_pc('ÑÂßÇÈ ÌÅÆÄÓ ÌÅÍÅÄÆÅĞÀÌÈ È ÏÎËÜÇÎÂÀÒÅËßÌÈ',:tree_oid)
      into :tree_oid;
    select oid
      from get_oid_objects_pc(:new_user,:classid)
      into :oid;
      
    insert into trees (tree_oid,poid,oid)
      values(:tree_oid,:poid,:oid);
    execute procedure trees_work2_pc (
      3,'Âñå ìåíåäæåğû','Âñå ìåíåäæåğû','ÈÅĞÀĞÕÈß ÌÅÍÅÄÆÅĞÎÂ','ÒÈÏ ÌÅÍÅÄÆÅĞÛ',0)
      returning_values result;
  end
  else begin
    result = 255;
  end
end

/*Ñóù ìåíåäæåğ. Íîâûé ïîëüçîâàòåëü*/
if (:what_to_do=6) then begin
/* add user  */
  if (user='SYSDBA') then begin
    select oid
      from get_oid_objects_pc('ÒÈÏ ÏÎËÜÇÎÂÀÒÅËÈ',-100)
      into :classid;
    insert into objects (classid,name,fullname)
      values (:classid,:new_user,:new_user);      
    select oid
      from get_oid_objects_pc('ÒÈÏ ÌÅÍÅÄÆÅĞÛ',-100)
      into :poid;
    select oid
      from get_oid_objects_pc(:manager,:poid)
      into :poid;
    select oid
      from get_oid_objects_pc('ÑÂßÇÈ',-100)
      into :tree_oid;      
    select oid
      from get_oid_objects_pc('ÑÂßÇÈ ÌÅÆÄÓ ÌÅÍÅÄÆÅĞÀÌÈ È ÏÎËÜÇÎÂÀÒÅËßÌÈ',:tree_oid)
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

alter procedure get_manager_visible_area(
    id_manager_in integer)
returns (
    visible_area integer,
    id_manager integer)
as
begin
  /*Åñëè íå ìåíåäæåğ òî âèäèò âñåõ ìåíåäæåğîâ*/
  visible_area=null;
  if (id_manager_in is null) then begin
    select id_manager
      from get_id_manager_pc
      into :id_manager;
  end else begin
    id_manager=:id_manager_in;
  end
  select p.visible_area
    from posr_vw p
    where p.id=:id_manager
    into :visible_area;
  suspend;
end
^

alter procedure has_manager_parent_kiev_pc(
    id_manager integer)
returns (
    has_parent integer)
as
declare variable tree_oid integer;
  declare variable parent_oid integer;
begin
  if (id_manager is null) then begin
    select id_manager from get_id_manager_pc into :id_manager;
  end
  select oid
    from get_oid_objects_pc('ÒÈÏ ÌÅÍÅÄÆÅĞÛ',-100)
    into :tree_oid;
  select id from posr_vw p where p.name='Âñå ìåíåäæåğû ÓÊÊ Êèåâ' into :parent_oid;
  has_parent=0;
  if (parent_oid is not null) then begin
   select has_parent
    from has_object_parent_pc(:id_manager, :tree_oid,:parent_oid)
    into :has_parent ;
  end
  suspend;
end
^

alter procedure test_get_manager_list
as
  declare variable list_count integer;
  declare variable posr_count integer;
  declare variable serror varchar(200);
  declare variable tip integer;
  declare variable id_manager integer;
begin
  select oid
    from get_oid_objects_pc('ÒÈÏ ÌÅÍÅÄÆÅĞÛ',-100)
    into :tip;
  select oid
    from get_oid_objects_pc('Òåñò',:tip)
    into :id_manager;
  select z(count(*))
    from get_manager_list_pc(:id_manager)
    into list_count;
  select z(count(*))
    from posr_vw
    into :posr_count;
  if ((posr_count-1)<>list_count) then begin
    serror ='test_get_manager_list. #1';
    execute procedure error (serror);
  end
end
^

set term ; ^

/*-------------------------------------------------------------------------*/
/* Restoring privileges */
/*-------------------------------------------------------------------------*/

grant select on attributes to view posr_vw;
grant select on objects to view posr_vw;
grant select on trees to view posr_vw;
grant update, references on posr_vw to trigger posr_vw_bi;
grant update, references on posr_vw to trigger posr_vw_bu;
grant select, update on posr_vw to procedure change_manager_poid_pc;
grant insert on posr_vw to procedure change_password_pc;
grant select on posr_vw to procedure get_manager_list_pc;
grant select on posr_vw to procedure get_manager_visible_area;
grant select on posr_vw to procedure has_manager_parent_kiev_pc;
grant select on posr_vw to procedure test_get_manager_list;
grant select, references on posr_vw to "PUBLIC";
grant select, references on posr_vw to manager;
grant select, references on posr_vw to power_user;


grant select,delete on objects to trigger posr_vw_bd;
grant execute on procedure get_oid_objects_pc to trigger posr_vw_bi;
grant insert on objects to trigger posr_vw_bi;
grant execute on procedure attributes_set_pc to trigger posr_vw_bi;
grant execute on procedure attributes_set2_pc to trigger posr_vw_bi;
grant insert on trees to trigger posr_vw_bi;
grant execute on procedure get_oid_objects_pc to trigger posr_vw_bu;
grant select,update on objects to trigger posr_vw_bu;
grant execute on procedure attributes_set_pc to trigger posr_vw_bu;
grant execute on procedure attributes_set2_pc to trigger posr_vw_bu;
grant select,insert,update on trees to trigger posr_vw_bu;
grant execute on procedure get_oid_objects_pc to procedure change_manager_poid_pc;
grant select,update on posr_vw to procedure change_manager_poid_pc;
grant execute on procedure get_oid_objects_pc to procedure change_password_pc;
grant insert on objects to procedure change_password_pc;
grant insert on posr_vw to procedure change_password_pc;
grant insert on trees to procedure change_password_pc;
grant execute on procedure trees_work2_pc to procedure change_password_pc;
grant execute on procedure get_id_manager_pc to procedure get_manager_visible_area;
grant select on posr_vw to procedure get_manager_visible_area;
grant execute on procedure get_id_manager_pc to procedure has_manager_parent_kiev_pc;
grant execute on procedure get_oid_objects_pc to procedure has_manager_parent_kiev_pc;
grant select on posr_vw to procedure has_manager_parent_kiev_pc;
grant execute on procedure has_object_parent_pc to procedure has_manager_parent_kiev_pc;
grant execute on procedure get_oid_objects_pc to procedure test_get_manager_list;
grant execute on procedure get_manager_list_pc to procedure test_get_manager_list;
grant select on posr_vw to procedure test_get_manager_list;
grant execute on procedure error to procedure test_get_manager_list;

