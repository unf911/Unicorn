SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_REESTR_POLYCH_NNAKL_PC(
    ID_ZAK INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    F2_DAT TIMESTAMP,
    F3_DAT_VYPISKI TIMESTAMP,
    F4_ID VARCHAR(20),
    F5_VIDDOC VARCHAR(20),
    F6_IZG VARCHAR(250),
    F7_IPN VARCHAR(12),
    F8_SUMWITHNDS NUMERIC(15,4),
    F9_BAZANDS NUMERIC(15,4),
    F10_NDS NUMERIC(15,4),
    F12_NDS NUMERIC(15,4),
    F13_BAZANDS NUMERIC(15,4),
    F14_NDS NUMERIC(15,4),
    F16_NDS NUMERIC(15,4),
    TIP INTEGER)
AS
  declare variable vsego_nds numeric(15,4);
  declare variable tmp_gen integer;
  declare variable klient_tip varchar(255);
  declare variable nds numeric (15,4);
  declare variable vsego numeric (15,4);
  declare variable nalog_nds numeric (15,2);
  declare variable ipn varchar(12);
  declare variable id_nnaklp_tip integer;
  declare variable tip_name varchar(50);
begin

  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;

  for
    select
      gen_id(tmp_gen,1),f.id,f.dat,f.DAT_VYPISKI,
      o.fullname as izg,
      k.ipn,f.nds,f.tip,
      f.vsego,f.vsegonds, f.nalog_nds,f.tip,
      (select ab.value1 from attributes ab where ab.oid=f.id_izg) /*,ab.value1 */
    from
      nnaklp_vw f
        inner join klient k on f.id_izg=k.id 
        inner join objects o on o.oid=f.id_izg 
        /*left join attributes ab on ab.oid=f.id_izg    */
    where
      f.dat between :date_from and :date_to and
      f.id_zak=:id_zak and
      f.delmarked=0 /*$$IBEC$$ and
      (ab.attribute_id=1 or ab.attribute_id is null) $$IBEC$$*/ 
    order by
      f.dat,f.id
    into :f1_npp,:f4_id,:f2_dat,:f3_dat_vypiski,:f6_izg,
      :ipn,:nds,:tip,
      :vsego,:vsego_nds,:nalog_nds,:tip,:klient_tip

   do begin

     /*��������� ����������, ���������� �����*/
     f7_ipn = null;
     f8_sumwithnds = null;
     f9_bazands = null; /*for export*/
     f10_nds = null;
     f12_nds=null;
     f13_bazands = null;
     f14_nds = null;
     f16_nds = null;
     select oid
       from get_oid_objects_pc('��� ���������� ��������� ���������',-100)
       into :id_nnaklp_tip;
     select name
       from get_name_objects_pc(:tip,:id_nnaklp_tip)
       into :tip_name;
       
     if (tip_name='��������� ���������') then begin
       f5_viddoc='��';/*��������� ��������*/
     end
     if  (tip_name='��������� �������������') then begin
       f5_viddoc='���';/*�������� ��������� ��������*/
     end
     if (tip_name='���������� ���') then begin
       f5_viddoc='���';/*�������� ����� ����������*/
     end
        
     if (nalog_nds=0) then begin
       if (klient_tip='������������ ���') then begin
         /*f5_ipn='X';*/
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f9_bazands=nds;
         f10_nds=0;
         suspend;
       end else begin /*'������������ ���'*/
         /*���������� ���, �� ������
         ��� ������ ��� �� ����������*/
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f9_bazands=nds;
         f10_nds=0;
         suspend;
       end /*'������������ ���'*/
     end else begin /*������������ ���*/

       /*������� ���������*/
       if  ((tip_name='��������� ���������') or
          (tip_name='��������� �������������') or
          (tip_name='��������� ��������� �� ������ �� �����������'))  then begin
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f9_bazands=vsego;
         f10_nds=vsego_nds;
         suspend;
       end
       if (tip_name='���������� ��������������� ������������') then begin
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f13_bazands=vsego;
         f14_nds=vsego_nds;
         suspend;
       end
       if (tip_name='���������� ���') then begin
         /*�������� � ������ ��������� ��� ����������*/
         f7_ipn='X';
         f8_sumwithnds=nds;
         f9_bazands=vsego;
         f10_nds=vsego_nds;
         suspend;
       end /*if (tip_name='���������� ���')*/
     end /*'������������ ���'*/
   end

  /* SET GENERATOR TMP_GEN TO 0;*/
  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;
end^

SET TERM ; ^

DESCRIBE PROCEDURE REP_REESTR_POLYCH_NNAKL_PC
'������ - ������ ���������� ��������� ���������';

GRANT SELECT ON ATTRIBUTES TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;

GRANT SELECT ON NNAKLP_VW TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;

GRANT SELECT ON KLIENT TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;

GRANT SELECT ON OBJECTS TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;

GRANT EXECUTE ON PROCEDURE GET_NAME_OBJECTS_PC TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;

GRANT EXECUTE ON PROCEDURE REP_REESTR_POLYCH_NNAKL_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE REP_REESTR_POLYCH_NNAKL_PC TO BOSSES;
GRANT EXECUTE ON PROCEDURE REP_REESTR_POLYCH_NNAKL_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE REP_REESTR_POLYCH_NNAKL_PC TO POWER_USER;