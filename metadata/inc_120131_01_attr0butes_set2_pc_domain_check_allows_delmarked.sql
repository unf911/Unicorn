SET TERM ^ ;

CREATE PROCEDURE ATTRIBUTES_SET2_PC (
    oid integer,
    classid integer,
    attribute_name varchar(50),
    attribute_value varchar(250))
as
declare variable attribute_id integer;
declare variable attribute_type integer;
declare variable attribute_classid integer;
declare variable attribute_value_int integer;
declare variable attribute_value_int_old integer;
declare variable attribute_value_date date;
declare variable attribute_value_date_old date;
declare variable serror varchar(100);
declare variable attribute_value_double double precision;
declare variable attribute_value_double_old double precision;
declare variable attribute_value_old varchar(50);
begin


/*$$IBEC$$   Теперь проверяется наличие объекта только если в class_attributes.classid is not null
  т.е. только при проверке типа объекта $$IBEC$$*/
/*$$IBEC$$   select classid
    from objects o
    where o.oid=:oid
    into :classid;
  if (classid is null) then begin
    sError = 'Ошибка в Attributes_set_pc. Объект не найден. oid='||cast(z(oid) as varchar(8));
    execute procedure error(sError);
  end $$IBEC$$*/
  select ca.attribute_id,ca.attribute_type,ca.classid
    from class_attributes ca
    where ca.oid=:classid
      and ca.attribute_name=:attribute_name
    into :attribute_id,:attribute_type,:attribute_classid;
  if (attribute_id is null) then begin
    sError = 'Ошибка в Attributes_set2_pc. Аттрибут не найден. classid='||cast(classid as varchar(8))||'. a_name=' || attribute_name;
    execute procedure error(sError);
  end
  if (:attribute_type=2) then begin
    /*Проверка на принадлежность домену возможна только для целых значений*/
    attribute_value_int = cast (attribute_value as integer);
    if (attribute_classid is not null) then begin
      /*Проверяем принадлежность домену*/
      if (attribute_value is not null) then begin
        /*Только если новое значение не null*/
        if (not exists(select o.oid
          from objects o
          where o.classid=:attribute_classid
            /*and o.delmarked=0*/ --ослабляю проверку, чтобы можно было менять/удалять договора с удалённым контактом
            and o.oid=:attribute_value_int)) then
        begin
          sError = 'Ошибка в Attributes_set2_pc. Значение не в домене. a_value='||trim(attribute_value)||'. classid='||cast(attribute_classid as varchar(8));
          execute procedure error(sError);
        end
      end /*if (attribute_value is not null)*/
    end /*if (attribute_classid is not null)*/
    if (:attribute_value is null) then begin
      delete from attributes a
        where a.oid=:oid and a.attribute_id=:attribute_id;
    end else begin
      /*Новое значение не пустое*/
      select a.value_int
         from attributes a
         where a.oid=:oid and a.attribute_id=:attribute_id
         into :attribute_value_int_old;
      if (:attribute_value_int_old is null) then begin
        /*Старого значения не было*/
        insert into attributes (oid,attribute_id,value_int)
          values(:oid,:attribute_id,:attribute_value_int);
      end else begin
        /*Старое значение было*/
        if (:attribute_value_int_old<>:attribute_value_int) then begin
          /*И оно не совпадало с новым*/
          update attributes a
            set a.value_int=:attribute_value_int
            where a.oid=:oid
              and a.attribute_id=:attribute_id;
        end
      end
    end /*(:attribute_value is null) */
    exit;
  end /* if ((:attribute_type=2)*/
  
  if (:attribute_type=3) then begin
    /*Записываем дату время*/
    attribute_value_date = cast (attribute_value as timestamp);
    if (:attribute_value is null) then begin
      delete from attributes a
        where a.oid=:oid and a.attribute_id=:attribute_id;
    end else begin
      /*Новое значение не пустое*/
      select a.value_date
         from attributes a
         where a.oid=:oid and a.attribute_id=:attribute_id
         into :attribute_value_date_old;
      if (:attribute_value_date_old is null) then begin
        /*Старого значения не было*/
        insert into attributes (oid,attribute_id,value_date)
          values(:oid,:attribute_id,:attribute_value_date);
      end else begin
        /*Старое значение было*/
        if (:attribute_value_date_old<>:attribute_value_date) then begin
          /*И оно не совпадало с новым*/
          update attributes a
            set a.value_date=:attribute_value_date
            where a.oid=:oid
              and a.attribute_id=:attribute_id;
        end
      end
    end /*(:attribute_value is null) */  
    exit;
  end /* if ((:attribute_type=3)*/

  if (:attribute_type=4) then begin
    /*Записываем вещественное число*/
    attribute_value_double = cast (attribute_value as double precision);
    if (:attribute_value is null) then begin
      delete from attributes a
        where a.oid=:oid and a.attribute_id=:attribute_id;
    end else begin
      /*Новое значение не пустое*/
      select a.value_num15_4
         from attributes a
         where a.oid=:oid and a.attribute_id=:attribute_id
         into :attribute_value_double_old;
      if (:attribute_value_double_old is null) then begin
        /*Старого значения не было*/
        insert into attributes (oid,attribute_id,value_num15_4)
          values(:oid,:attribute_id,:attribute_value_double);
      end else begin
        /*Старое значение было*/
        if (:attribute_value_double_old<>:attribute_value_double) then begin
          /*И оно не совпадало с новым*/
          update attributes a
            set a.value_num15_4=:attribute_value_double
            where a.oid=:oid
              and a.attribute_id=:attribute_id;
        end
      end
    end /*(:attribute_value is null) */  
    exit;
  end /* if ((:attribute_type=4)*/
  
  if (:attribute_type=1) then begin
    /*Записываем строку*/
    if (:attribute_value is null) then begin
      delete from attributes a
        where a.oid=:oid and a.attribute_id=:attribute_id;
    end else begin
      /*Новое значение не пустое*/
      select a.value1
         from attributes a
         where a.oid=:oid and a.attribute_id=:attribute_id
         into :attribute_value_old;
      if (:attribute_value_old is null) then begin
        /*Старого значения не было*/
        insert into attributes (oid,attribute_id,value1)
          values(:oid,:attribute_id,:attribute_value);
      end else begin
        /*Старое значение было*/
        if (:attribute_value_old<>:attribute_value) then begin
          /*И оно не совпадало с новым*/
          update attributes a
            set a.value1=:attribute_value
            where a.oid=:oid
              and a.attribute_id=:attribute_id;
        end
      end
    end /*(:attribute_value is null) */  
    exit;
  end /* if ((:attribute_type=4)*/  
  
/*$$IBEC$$   if (:attribute_type=5) then begin
     $$IBEC$$*/ /*Записываем вещественное число без проверки существования объекта
    используется в триггерах usl_postavka_change_det_vw*/ /*$$IBEC$$ 
    attribute_value_double = cast (attribute_value as double precision);
    if (:attribute_value is null) then begin
      delete from attributes a
        where a.oid=:oid and a.attribute_id=:attribute_id;
    end else begin
       $$IBEC$$*/ /*Новое значение не пустое*/ /*$$IBEC$$ 
      select a.value_num15_4
         from attributes a
         where a.oid=:oid and a.attribute_id=:attribute_id
         into :attribute_value_double_old;
      if (:attribute_value_double_old is null) then begin
         $$IBEC$$*/ /*Старого значения не было*/ /*$$IBEC$$ 
        insert into attributes (oid,attribute_id,value_num15_4)
          values(:oid,:attribute_id,:attribute_value_double);
      end else begin
         $$IBEC$$*/ /*Старое значение было*/ /*$$IBEC$$ 
        if (:attribute_value_double_old<>:attribute_value_double) then begin
           $$IBEC$$*/ /*И оно не совпадало с новым*/ /*$$IBEC$$ 
          update attributes a
            set a.value_num15_4=:attribute_value_double
            where a.oid=:oid
              and a.attribute_id=:attribute_id;
        end
      end
    end  $$IBEC$$*/ /*(:attribute_value is null) */ /*$$IBEC$$   
    exit;
  end  $$IBEC$$*/ /* if ((:attribute_type=5)*/
  
  sError='Ошибка в Attributes_set2_pc. Пока обрабатываются только целые, даты, вещественные, строки';
  execute procedure error(sError);

end^

SET TERM ; ^

DESCRIBE PROCEDURE ATTRIBUTES_SET2_PC
'В отличии от attributes_set_pc,
oid не должен быть из objects.oid, а является любым числом
например naklot.id_nakld,';

GRANT SELECT ON CLASS_ATTRIBUTES TO PROCEDURE ATTRIBUTES_SET2_PC;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE ATTRIBUTES_SET2_PC;

GRANT SELECT ON OBJECTS TO PROCEDURE ATTRIBUTES_SET2_PC;

GRANT SELECT,INSERT,DELETE,UPDATE ON ATTRIBUTES TO PROCEDURE ATTRIBUTES_SET2_PC;

GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER DOGOVOR_VW_AU;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER DOGOVOR_VW_BI;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER MANAGER_VW_BI;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER MANAGER_VW_BU;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER POSR_VW_BI;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER POSR_VW_BU;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER SPR_REYS_VW_AI;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER SPR_REYS_VW_AU;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER SRAVN_PRICE_DET2_VW_BD;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER SRAVN_PRICE_DET2_VW_BI;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER SRAVN_PRICE_DET2_VW_BU;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER ZAKAZ_DET_VW_AI;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER ZAKAZ_DET_VW_AU;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER ZAKAZ_DET_VW_BD;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER ZAKAZ_VW_AI;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO TRIGGER ZAKAZ_VW_AU;
GRANT EXECUTE ON PROCEDURE ATTRIBUTES_SET2_PC TO SYSDBA;

