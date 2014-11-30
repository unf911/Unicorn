CREATE OR ALTER PROCEDURE GENERATE_TARA (
    id_nakl integer)
returns (
    id_tara integer,
    kolotp_old double precision,
    kolotp double precision)
as
declare variable oidtara integer;
declare variable max_id_pos integer;
declare variable id_nakld integer;
declare variable id_tara2 integer;
declare variable kolotp2 double precision;
declare variable id_nakld_2 integer;
declare variable counter integer;
begin
  select oid from get_oid_objects_pc('���� � ��������� �����',-100) into :oidTara;
  select max(ot.id_pos)
    from naklot ot
    where ot.id_nakl=:id_nakl
    into :max_id_pos;
  for
    select od.id_tara,count(*)
    from naklot ot
      inner join naklodet od on ot.id_nakld=od.id_nakld
      inner join tovar t on t.oid=od.id_tara
    where ot.id_nakl=:id_nakl
      and t.nothing is null
    group by od.id_tara
      
    union
    
    select ot.id_tovar,cast (ot.kolotp as integer)
    from naklot ot
      left join naklodet od on od.id_nakld=ot.id_nakld
    where
      ot.id_nakl=:id_nakl
      and od.id_nakld is null
      /*��������� � ��� ���������������� ��������� "�����" �� ���������������*/
    into :id_tara2,:kolotp2
  do begin
    id_nakld = null;
    kolotp_old = null;
    kolotp=null;
    select od.id_tara,count(*)
      from naklot ot
        inner join naklodet od on ot.id_nakld=od.id_nakld
        inner join tovar t on t.oid=od.id_tara
      where ot.id_nakl=:id_nakl and od.id_tara=:id_tara2
        and t.nothing is null
      group by od.id_tara
    into :id_tara,:kolotp;
    /*���� ���� ����� ��� ���� �������, �� ��� ����� ������ �������*/
    counter=0;
    for
      select ot.id_nakld,ot.kolotp
      from naklot ot
      where ot.id_nakl=:id_nakl and ot.id_tovar=:id_tara2
      into :id_nakld_2,:kolotp_old
    do begin
      counter=counter+1;
      if (counter>=2) then begin
        delete from naklot ot where ot.id_nakld=:id_nakld_2;
      end else begin
        id_nakld=:id_nakld_2;
      end
    end
    /*����������� ������� � ����*/
    if (id_nakld is not null) then begin
      if (z(kolotp)>0) then begin
        update naklot ot
          set ot.kolotp=:kolotp,
            ot.tip=:oidTara
          where ot.id_nakld=:id_nakld and
            Round(:kolotp_old,5)<>Round(:kolotp,5);
        if (Round(kolotp_old,5)<>Round(kolotp,5)) then begin
          suspend;
        end /*����� ���� ������� ������� ���� � �������� � �����������*/
      end else begin
        /*���� ���� ��������� ����, ������� ��� � ���������*/
        /*������ id_nakl=134331 ��� �������� ������� 10�, �.�. id_tovar=5768*/
        delete from naklot ot where ot.id_nakl=:id_nakl  and ot.id_nakld=:id_nakld;
        id_tara=id_tara2;
        suspend;
      end
    end else begin /*if id_nakld is not null*/
      max_id_pos = z(max_id_pos)+1;
      insert into naklot (id_nakl,id_pos,tip,id_tovar,kolotp)
        values (:id_nakl,:max_id_pos,:oidTara,:id_tara2,:kolotp2);
      suspend; /*����� �� ���� ����� �������*/
    end /*if id_nakld is not null*/
  end /*for*/
  
  for
    select Round(sum(od.kolotp*od.kolbuxt),3),ot.kolotp,ot.id_nakld,ot.id_tovar
    from naklot ot inner join naklodet od
      on ot.id_nakld=od.id_nakld
    where ot.id_nakl=:id_nakl
    group by ot.id_nakld,ot.kolotp,ot.id_nakld,ot.id_tovar
    having Round(Round(sum(od.kolotp*od.kolbuxt),3)-ot.kolotp,4)<>0
    into :kolotp,:kolotp_old,:id_nakld,:id_tara
  do begin
    update naklot ot
    set ot.kolotp=:kolotp
    where ot.id_nakld=:id_nakld;
    suspend;
  end /*for */
end

