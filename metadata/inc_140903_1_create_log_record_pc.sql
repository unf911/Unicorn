CREATE OR ALTER PROCEDURE CREATE_LOG_RECORD_UNPOST_PC (
    id_nakl integer,
    id_det integer)
as
declare variable id_posr_to integer;
declare variable id_nakl_p integer;
declare variable id_zak integer;
declare variable dat timestamp;
declare variable id varchar(30);
declare variable zak varchar(50);
declare variable logmessage varchar(252);
declare variable reason varchar(252);
begin
     /*Сделать запись в журнале*/
     select id_manager
       from naklo om
       where om.id_nakl=:id_nakl
       into :id_posr_to;

     select ot.id_nakl
       from  naklot ot
         inner join naklodet od on od.id_nakld=ot.id_nakld
       where od.id_det=:id_det
       into :id_nakl_p;

     select dat,id_zak,id
       from naklo om
       where om.id_nakl=:id_nakl
       into :dat,:id_zak,:id;

     select name from klient k where k.id=:id_zak into :zak;
     reason = 'Возвращена накладная №'||trim(:id_nakl_p);
     logmessage = 'Возвращена накладная №'|| trim(:ID) || ' Дата: '
       || DateToStr(:dat,'%d.%m.%y') || ' Покупатель: ' || trim(:zak) || ' Идентификатор ' || trim(:id_nakl_p);

     execute procedure create_log_record_pc(:reason,:logmessage,:id_posr_to);
end

