update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'PK'
where (RDB$FIELD_NAME = 'OID') and
(RDB$RELATION_NAME = 'TOVAR');


ALTER TABLE TOVAR DROP CONSTRAINT PK_TOVAR;

alter table TOVAR
add constraint PK_TOVAR
primary key (OID);

SET TERM ^ ;

CREATE OR ALTER TRIGGER TOVAR_GEN_BI0 FOR TOVAR
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.oid is null) then begin
    new.oid = gen_id(oid_gen,1);
  end
end
^

SET TERM ; ^


SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_AFTER_CUT_OSTATOK_PC(
    ID_NAKL INTEGER)
RETURNS (
    TOVAR VARCHAR(50),
    TARA VARCHAR(50),
    NOMER_TARY VARCHAR(30),
    KOLOTP NUMERIC(15,4),
    KOLBUXT INTEGER,
    TIP INTEGER,
    ID_TYPE INTEGER,
    ID_OSTT INTEGER,
    KOLOTP_ITOG NUMERIC(15,4),
    KOLBUXT_ITOG INTEGER)
AS
DECLARE VARIABLE DET_COUNT SMALLINT;
DECLARE VARIABLE KOLREZERV_ITOG NUMERIC(15,4);
DECLARE VARIABLE KOLBREZERV_ITOG NUMERIC(15,4);
DECLARE VARIABLE ID_TYPE_ITOG INTEGER;
DECLARE VARIABLE ID_TARA_ITOG INTEGER;
DECLARE VARIABLE MODIFIED DATE;
begin

  for
   /*список бухт в накладной*/
   select
    t2.name,
    t.name as tara,
    od.nomer_tary,
    od.kolotp,
    od.kolbuxt,
    od.tip,
    sd.id_type,
    sd.id_ostt,
    sd.modified
   from
    naklodet od
    inner join naklot ot on ot.id_nakld=od.id_nakld
    inner join tovar t on t.oid=od.id_tara
    inner join tovar t2 on t2.oid=ot.id_tovar
    left join sklostdet sd on od.id_det=sd.id_det
   where
    ot.id_nakl=:id_nakl
    and
    ((sd.id_type in (22,32)) or (sd.id_type is null))
   order by
    ot.id_pos,od.id_det
   into
     :tovar,
     :tara,
     :nomer_tary,
     :kolotp,:kolbuxt,:tip,
     :id_type, :id_ostt,:modified
  do begin
    /*остатки именно после этой отрезки*/
  
    execute procedure sklostdet_ost_pc(
      :id_ostt,
      :modified,
      1
    ) returning_values
    (  :id_tara_itog,
       :kolotp_itog,
       :KOLBUXT_ITOG,
       :KOLREZERV_ITOG,
       :KOLBREZERV_ITOG,
       :DET_COUNT,
       :ID_TYPE_ITOG);
    if (id_ostt is null ) then begin
      tip = 0;
      KOLBUXT_ITOG = null;
      kolotp_itog = null;
    end     
    suspend;     
  end
END
^

SET TERM ; ^






DROP PROCEDURE TEMP28_TOVAR_PC;

ALTER TABLE TOVAR ALTER TOVAR TO TOVAR_OBS;

