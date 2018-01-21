CREATE OR ALTER trigger tovar_all_vw_au0 for tovar_all_vw
active after update position 0
AS
  declare variable classid integer;
  declare variable count_dependent_tovar integer;
begin
  select oid
    from GET_OID_OBJECTS_PC('ТИП ТОВАРЫ',-100)
    into :classid;
  if (new.id <> new.id_analog) then begin
    select z(count(*))
    from tovar t
    where t.id_analog=new.id and t.oid<>new.id
      and t.delmarked=0
    into :count_dependent_tovar;
    if (count_dependent_tovar>0) then begin
      execute procedure error ('У товара есть зависимые. Он должен быть главным аналогом');
    end
  end
  update objects o
    set
      o.name=substr(new.name,1,50),
      o.delmarked=new.delmarked,
      o.oid=new.id,
      o.fullname=new.fullname
    where
      o.oid=old.id and o.classid=:classid;
 
  update tovar t
    set t.ediz = new.ediz,
      t.id_ediz = new.id_ediz, 
      t.tara=new.tara,
      t.name=new.name,
      t.delmarked=new.delmarked,
      t.skladskaya=new.skladskaya,
      t.id_analog=new.id_analog,
      t.oid=new.id,
      t.weight=new.weight,
      t.gruppa1=upper(new.gruppa1),
      t.gruppa2=new.gruppa2,
      t.gruppa3=new.gruppa3,
      t.gruppa4=new.gruppa4,
      t.COPPERPERKM=new.copperperkm,
      t.kodved=new.kodved,
      t.import = new.import,
      t.kodusl=new.kodusl
    where
      t.oid=old.id;

end

