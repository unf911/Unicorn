SET TERM ^ ;

CREATE OR ALTER PROCEDURE MAKE_TRANSH(
    TYPE1 INTEGER,
    ID1 INTEGER,
    TYPE2 INTEGER,
    ID2 INTEGER,
    WHAT_ID INTEGER,
    SUMA DOUBLE PRECISION)
RETURNS (
    RESULT DOUBLE PRECISION)
AS
DECLARE VARIABLE OPLACH2 NUMERIC(15,2);
DECLARE VARIABLE SUM2 NUMERIC(15,2);
DECLARE VARIABLE DAT2 DATE;
DECLARE VARIABLE DAT1 DATE;
DECLARE VARIABLE TRANSH NUMERIC(15,2);
DECLARE VARIABLE POTRACH1 NUMERIC(15,2);
DECLARE VARIABLE OPL_ID INTEGER;
DECLARE VARIABLE NAKL_ID INTEGER;
DECLARE VARIABLE SUM1 NUMERIC(15,2);
Declare variable tip_opl integer;
Declare variable tip_nakl integer;
declare variable id_manager integer;
declare variable id_manager_opl integer;
declare variable str varchar(50);
declare variable tip_transh integer;
begin
  select oid from get_oid_objects_pc('ÎÏËÀÒÛ',-100) into :tip_opl;
  select oid from get_oid_objects_pc('ĞÀÑÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ',-100) into :tip_nakl;
  /* type 1=1 - id1 from oplaty  */
  /* type 1=2 - id1 from naklr_*/
  /* type 2=3 - id1 from naklru_vw */
  /*Ïî óìîë÷àíèş*/
  tip_transh=0;
  SUMA = round(SUMA,2);
  if (type2=3) then begin
    /*Îïëàòà óñëóã*/
    select oid from get_oid_objects_pc('ĞÀÑÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ ÍÀ ÓÑËÓÃÈ',-100) into :tip_nakl;
    type2=2;
    select oid from get_oid_objects_pc('ÕÎÇßÉÑÒÂÅÍÍÛÅ ÎÏÅĞÀÖÈÈ',-100) into :tip_transh;
    select oid from get_oid_objects_pc('ÒĞÀÍØ Â ÄÎËÃÀÕ ÇÀ ÓÑËÓÃÈ',:tip_transh) into :tip_transh;
    /*tip_transh=-50;*/
  end
  if (type2=4) then begin
    /*Îïëàòà ôèíóñëóã*/
    select oid from get_oid_objects_pc('ĞÀÑÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ ÍÀ ÔÈÍÓÑËÓÃÈ',-100) into :tip_nakl;
    type2=2;
    select oid from get_oid_objects_pc('ÕÎÇßÉÑÒÂÅÍÍÛÅ ÎÏÅĞÀÖÈÈ',-100) into :tip_transh;
    select oid from get_oid_objects_pc('ÒĞÀÍØ Â ÄÎËÃÀÕ ÇÀ ÔÈÍÓÑËÓÃÈ',:tip_transh) into :tip_transh;
    /*tip_transh=-28;*/
  end  

  /* what_id=1 -max transh  */
  /* what_id=2 -partial transh */
  /* what_id=4 -clear oplaty,naklr,oplnakl */
  /* what_id=5 -clear last transh  */
  /* what_id=6 -recalculate field oplaty,naklr  */
  if (type1=1) then begin

  select dat,nds,
    (select cast(z(sum(t.transh)) as numeric(15,4))
      from oplnakl t
      where t.id_from=o.id_nakl
      ) as potracheno,o.id_manager
    from naklo o
    where tip=:tip_opl and id_nakl=:id1
    into :dat1,:sum1,:potrach1,:id_manager_opl;
    if (id_manager_opl is null) then begin
      str='Óêàæèòå ìåíåäæåğà êîòîğîìó èä¸ò ïğåäîïëàòà';
      execute procedure error (str);
    end
  end
  if (type1=2) then begin
    select  n.dat,n.nds,
      (select cast(z(sum(t.transh)) as numeric(15,4))
        from oplnakl t
        where t.id_to=n.id_nakl and t.tip in (0,2,-50)
        ) , n.id_manager
    from naklo n
    where n.tip=:tip_nakl and n.id_nakl=:id1
    into :dat1,:sum1,:potrach1,:id_manager;
  end
  if (type2=2) then begin
    select  n.dat,n.nds,
      (select cast(z(sum(t.transh)) as numeric(15,4))
        from oplnakl t
        where t.id_to=n.id_nakl and t.tip in (0,2,-50)
        ) , n.id_manager
    from naklo n
    where n.tip=:tip_nakl and n.id_nakl=:id2
    into :dat2,:sum2,:oplach2,:id_manager;
  end

  /* partial transh  */
  if ((what_id=2) and (type1=1) and (type2=2)) then begin
    if ((z(sum1)-z(potrach1))>(z(sum2)-z(oplach2))) then begin
      transh=z(sum2)-z(oplach2);
    end
    else begin
      transh=z(sum1)-z(potrach1);
    end
    transh=round(transh,2);
    if ((transh>0) and (transh>=suma)) then begin
      transh=round(suma,2);
      if (:dat1<:dat2) then begin
        dat1=dat2;
      end
      insert into oplnakl  (id_from,id_to,transh,opl_data,id_manager,tip)
        values (:id1,:id2,:transh,:dat1,:id_manager,:tip_transh);
    end
    result = transh;
  end   /* partial transh  */

  /* transfer money from 1 to 2 maximum amount  */
  if ((what_id=1) and (type1=1) and  (type2=2)) then begin
    if ((z(sum1)-z(potrach1))>(z(sum2)-z(oplach2))) then begin
      transh=z(sum2)-z(oplach2);
    end
    else begin
      transh=z(sum1)-z(potrach1);
    end
    transh=round(transh,2);
    if (transh>0) then begin
      if (:dat1<:dat2) then begin
        dat1=dat2;
      end
      insert into oplnakl  (id_from,id_to,transh,opl_data,id_manager,tip)
        values (:id1,:id2,:transh,:dat1,:id_manager,:tip_transh);
      result = transh;
    end
  end   /* maximum transh  */

  /* clear oplaty  */
  if ((what_id=4) and (type1=1)) then begin
    result =0;
    for
      select id_to,transh from oplnakl
        where id_from=:id1 into :nakl_id,:transh
    do begin
      delete from oplnakl where id_from=:id1 and id_to=:nakl_id;
      result=result+1;
    end
  end /* clear oplaty  */

  /* clear naklr */
  if ((what_id=4) and (type1=2)) then begin
    result =0;
    for
      select id_from,transh from oplnakl
        where id_to=:id1 into :opl_id,:transh
    do begin
      delete from oplnakl where id_to=:id1 and id_from=:opl_id;
      result=result+1;
    end
  end /* clear naklr */

  /* clear last transh naklr  */
  if ((what_id=5) and (type1=2)) then begin
    select max(id) from oplnakl where id_to=:id1 into :id2;
    if (:id2 is not null) then  begin
      select t.id_to,t.id_from
        from oplnakl t
        where t.id=:id2
        into :NAKL_ID,:OPL_ID;
      delete from oplnakl t where id=:id2;
      result = 1;
    end
  end /* clear last transh naklr  */


END^

SET TERM ; ^

DESCRIBE PROCEDURE MAKE_TRANSH
'Ïğîâîäèò îïëàòó íàêëàäíûõ ñ ïëàòåæåé
Èñïîëüçóåòñÿ â Ôîğìû ââîäà-Ïëàòåæè-Îïëàòèòü';

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE MAKE_TRANSH;

GRANT SELECT,INSERT,DELETE ON OPLNAKL TO PROCEDURE MAKE_TRANSH;

GRANT SELECT ON NAKLO TO PROCEDURE MAKE_TRANSH;

GRANT EXECUTE ON PROCEDURE ERROR TO PROCEDURE MAKE_TRANSH;

GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO TRIGGER NAKLR_OPLNAKL_AU;
GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO PROCEDURE MAKE_FIN_TRASH;
GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO PROCEDURE MAKE_TRANSH;
GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO SYSDBA;
GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO BOSSES;
GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO BUXG;
GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO MANAGER;
GRANT EXECUTE ON PROCEDURE MAKE_TRANSH TO POWER_USER;

