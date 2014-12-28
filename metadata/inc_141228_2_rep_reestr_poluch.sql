SET TERM ^ ;

CREATE PROCEDURE REP_REESTR_POLYCH_NNAKL_PC(
    ID_ZAK INTEGER,
    DATE_FROM TIMESTAMP,
    DATE_TO TIMESTAMP)
RETURNS (
    F1_NPP INTEGER,
    F2_DAT TIMESTAMP,
    F3_DAT_VYPISKI TIMESTAMP,
    F4_ID VARCHAR(30),
    F5_VIDDOC VARCHAR(20),
    F53_VIDDOC VARCHAR(1),
    F6_IZG VARCHAR(250),
    F7_IPN VARCHAR(12),
    F8_SUMWITHNDS NUMERIC(15,4),
    F9_BAZANDS NUMERIC(15,4),
    F10_NDS NUMERIC(15,4),
    F11 NUMERIC(15,4),
    F12_NDS NUMERIC(15,4),
    F13_BAZANDS NUMERIC(15,4),
    F14_NDS NUMERIC(15,4),
    F15 NUMERIC(15,4),
    F16_NDS NUMERIC(15,4),
    TIP INTEGER)
AS
declare variable vsego_nds numeric(15,4);
declare variable tmp_gen integer;
declare variable klient_tip varchar(255);
declare variable nds numeric(15,4);
declare variable vsego numeric(15,4);
declare variable nalog_nds numeric(15,2);
declare variable ipn varchar(12);
declare variable id_nnaklp_tip integer;
declare variable tip_name varchar(50);
declare variable event_horizon timestamp;
declare variable tails_last_date timestamp;
declare variable days_of_acceptable_delay integer;
declare variable start_of_month timestamp;
begin

  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;
  days_of_acceptable_delay = 16;
  event_horizon = incdate(:date_to, days_of_acceptable_delay,0,0);  -- i.e 16.05.13
  --tails_last_date = incdate(:date_from, -days_of_acceptable_delay,0,0);

  start_of_month = firstdaymonth(:date_from); --i.e. 01.04.13
  tails_last_date = incdate(:start_of_month, days_of_acceptable_delay,0,0); --i.e. 16.04.13
  for
    select
      gen_id(tmp_gen,1),f.id,f.dat,f.DAT_VYPISKI,
      o.fullname as izg,
      --(select k.ipn from klient k where k.id = f.id_izg) as ipn,
      k.ipn,
      f.nds,f.tip,
      f.vsego,f.vsegonds, f.nalog_nds,f.tip,
      (select ab.value1 from attributes ab where ab.oid=f.id_izg) /*,ab.value1 */
    from
      nnaklp_vw f
        inner join klient k on f.id_izg=k.id
        inner join objects o on o.oid=f.id_izg 
        /*left join attributes ab on ab.oid=f.id_izg    */
    where
      f.dat between :date_from and :event_horizon and
      f.id_zak=:id_zak and
      f.delmarked=0 and
      ((f.dat_vypiski between :date_from and :date_to) or
      (f.dat between :tails_last_date and :date_to and
       f.dat_vypiski < :start_of_month))
    order by
      f.dat,f.id
    into :f1_npp,:f4_id,:f2_dat,:f3_dat_vypiski,:f6_izg,
      :ipn,:nds,:tip,
      :vsego,:vsego_nds,:nalog_nds,:tip,:klient_tip

   do begin
     F53_VIDDOC = null;
     /*îáðàáîòêà èñêëþ÷åíèé, äîáàâëåíèå ïîëåé*/
     f7_ipn = null;
     f8_sumwithnds = null;
     f9_bazands = null; /*for export*/
     f10_nds = null;
     f12_nds=null;
     f13_bazands = null;
     f14_nds = null;
     f16_nds = null;
     F11=0;
     F15=0;
     select oid
       from get_oid_objects_pc('ÒÈÏ ÏÎËÓ×ÅÍÍÛÕ ÍÀËÎÃÎÂÛÕ ÍÀÊËÀÄÍÛÕ',-100)
       into :id_nnaklp_tip;

     select predefined, name
     from objects o
     where o.oid=:tip and o.classid=:id_nnaklp_tip
     into :f5_viddoc, tip_name;

     if (tip_name='ÏÐÈÕÎÄÍÀß ÍÀËÎÃÎÂÀß ÓÒÎ×Í¨ÍÍÀß') then begin
       f5_viddoc='ÏÍÏ';/*Ïîäàòêîâà íàêëàäíà óòî÷íåíà*/
       F53_VIDDOC = 'Ó';
     end

     if (nalog_nds=0) then begin
       if (klient_tip='Íåïëàòåëüùèê ÍÄÑ') then begin
         /*f5_ipn='X';*/
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f9_bazands=nds;
         f10_nds=0;
         suspend;
       end else begin /*'Íåïëàòåëüùèê ÍÄÑ'*/
         /*Ïëàòåëüùèê ÍÄÑ, íî ïðîñòî
         ýòè óñëóãè ÍÄÑ íå îáëàãàþòñÿ*/
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f9_bazands=nds;
         f10_nds=0;
         suspend;
       end /*'Íåïëàòåëüùèê ÍÄÑ'*/
     end else begin /*Íåïëàòåëüùèê ÍÄÑ*/

       /*îáû÷íàÿ íàëîãîâàÿ*/
       if  ((tip_name='ÏÐÈÕÎÄÍÀß ÍÀËÎÃÎÂÀß') or
          (tip_name='ÏÐÈÕÎÄÍÀß ÊÎÐÐÅÊÒÈÐÎÂÊÀ') or
          (tip_name='ÏÐÈÕÎÄÍÀß ÍÀËÎÃÎÂÀß ÍÀ ÓÑËÓÃÈ ÎÒ ÍÅÐÅÇÈÄÅÍÒÀ') or
          (tip_name='ÏÐÈÕÎÄÍÀß ÍÀËÎÃÎÂÀß ÓÒÎ×Í¨ÍÍÀß') or
          (tip_name='ÒÎÂÀÐÍÛÉ ÊÀÑÑÎÂÛÉ ×ÅÊ') or
          (tip_name='ÒÐÀÍÑÏÎÐÒÍÛÉ ÁÈËÅÒ') or
          (tip_name='Ñ×ÅÒ ÇÀ ÓÑËÓÃÈ ÑÂßÇÈ') or
          (tip_name='ÇÀßÂÊÀ ÏËÀÒÅËÜÙÈÊÀ') )  then begin
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f9_bazands=vsego;
         f10_nds=vsego_nds;
         suspend;
       end
       if (tip_name='ÏÎËÓ×ÅÍÍÀß ÍÅÕÎÇßÉÑÒÂÅÍÍÀß ÄÅßÒÅËÜÍÎÑÒÜ') then begin
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f13_bazands=vsego;
         f14_nds=vsego_nds;
         suspend;
       end
       if (tip_name='ÏÎËÓ×ÅÍÍÀß ÃÒÄ') then begin
         /*èìïîðò¸ðû è ïðîñòî íàêëàäíûå òàê ïîìå÷åííûå*/
         f7_ipn=ipn;  /*Èìïîðò ÃÒÄ - ïîëó÷åííûå íàëîãîâûå â ðååñòðå ãðàôà 7 äîëæåí îòîáðàæàòüñÿ ÈÍÍ*/
         f8_sumwithnds=nds;
         f9_bazands=vsego;
         f10_nds=vsego_nds;
         suspend;
       end /*if (tip_name='ÏÎËÓ×ÅÍÍÀß ÃÒÄ')*/

       if (tip_name='ÏÐÈÕÎÄÍÀß ÍÀËÎÃÎÂÀß ÄËß ÑÒÀÂÊÈ 0') then begin
         f7_ipn=ipn;
         f8_sumwithnds=nds;
         f15=vsego;
         F16_NDS=vsego_nds;
       end
     end /*'Íåïëàòåëüùèê ÍÄÑ'*/
   end

  /* SET GENERATOR TMP_GEN TO 0;*/
  select gen_id(tmp_gen,0) from rdb$database into :tmp_gen;
  tmp_gen=-tmp_gen;
  select gen_id(tmp_gen,:tmp_gen) from rdb$database into :tmp_gen;
end^

SET TERM ; ^

DESCRIBE PROCEDURE REP_REESTR_POLYCH_NNAKL_PC
'Îò÷¸òû - Ðååñòð ïîëó÷åííûõ íàëîãîâûõ íàêëàäíûõ';

GRANT SELECT ON ATTRIBUTES TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;

GRANT SELECT ON NNAKLP_VW TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;

GRANT SELECT ON KLIENT TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;

GRANT SELECT ON OBJECTS TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;

GRANT EXECUTE ON PROCEDURE GET_OID_OBJECTS_PC TO PROCEDURE REP_REESTR_POLYCH_NNAKL_PC;

GRANT EXECUTE ON PROCEDURE REP_REESTR_POLYCH_NNAKL_PC TO SYSDBA;
GRANT EXECUTE ON PROCEDURE REP_REESTR_POLYCH_NNAKL_PC TO BOSSES;
GRANT EXECUTE ON PROCEDURE REP_REESTR_POLYCH_NNAKL_PC TO BUXG;
GRANT EXECUTE ON PROCEDURE REP_REESTR_POLYCH_NNAKL_PC TO POWER_USER;
