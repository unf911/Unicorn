SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKLP_SEBEST_RECOUNT_PC(
    ID_NAKL_IN INTEGER,
    ID_NAKLD_IN INTEGER,
    ID_SKLAD_IN INTEGER,
    ID_SCHET_IN INTEGER,
    TIP_IN INTEGER,
    DAT_FROM_IN TIMESTAMP,
    MODE_IN INTEGER)
AS
declare variable id_tovar integer;
declare variable dat date;
declare variable id_sklad_seb integer;
declare variable id_uchet_politics integer;
declare variable sebest double precision;
declare variable id_sklad_to integer;
declare variable id_partiya integer;
declare variable id_schet_tip integer;
declare variable tip_name varchar(50);
declare variable id_uchet_politics_in integer;
declare variable id_nakld_depend integer;
declare variable tip_depend integer;
declare variable id_nakl_depend integer;
declare variable tip_depend_name varchar(50);
begin
  if (id_schet_in is null) then begin
    /*Èäåíòèôèêàòîğû*/
    select oid
      from GET_OID_OBJECTS_PC('ÒÈÏ Ñ×ÅÒÀ',-100)
      into :id_schet_tip;
    select oid
      from GET_OID_OBJECTS_PC('ÑÅÁÅÑÒÎÈÌÎÑÒÜ ÁÓÕ',:id_schet_tip)
      into :id_schet_in;
  end

  if (dat_from_in is null) then begin
    dat_from_in='01.01.2000';
  end
  select oid
    from GET_OID_OBJECTS_PC('ÏÎËÈÒÈÊÈ ÑÏÈÑÀÍÈß ÑÅÁÅÑÒÎÈÌÎÑÒÈ',-100)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('ÁÓÕÃÀËÒÅĞÑÊÈÉ Ó×¨Ò',:id_uchet_politics_in)
    into :id_uchet_politics_in;
  select first 1 id_sklad,id_uchet_politics
    from sklad_sebest_settings_pc(:ID_SKLAD_IN, :id_uchet_politics_in)
    into :id_sklad_seb,:id_uchet_politics; 

  if (id_nakl_in is null)  then begin
    select id_nakl
      from naklot ot
      where ot.id_nakld=:id_nakld_in
      into :id_nakl_in;
  end
  if (tip_in is null) then begin
    select tip
      from naklo om
      where om.id_nakl=:id_nakl_in
      into :tip_in;
  end
  select name from get_name_objects_pc(:tip_in,-100) into :tip_name;

  /*Ïåğåñ÷¸ò îäíîé ïîçèöèè*/
  if (mode_in in (1,3,4)) then begin
    /*Ïğè ïåğåñ÷¸òå ïîçèöèè íóæíî óäàëèòü ñòàğûå ïğîâîäêè ïî íåé*/
    delete from provodki pr
    where pr.id_nakl=:id_nakl_in
      and pr.id_schet=:id_schet_in
      and pr.attr1=:id_nakld_in;
    if (tip_name='ÏĞÈÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ') then begin
      select sebest
        from naklot_sebest2_count_pc(:ID_NAKLD_IN,:id_uchet_politics,:id_schet_in,8,1)
        into :sebest;      
    end
    if (tip_name='ĞÀÑÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ') then begin
      select sebest
        from naklot_sebest2_naklr_pc(:ID_NAKLD_IN,:id_uchet_politics,:id_schet_in)
        into :sebest;    
    end
    if (tip_name='ÁÓÕÃÀËÒÅĞÑÊÎÅ ÏÅĞÅÌÅÙÅÍÈÅ') then begin
      select sebest
        from naklot_sebest2_naklr_pc(:ID_NAKLD_IN,:id_uchet_politics,:id_schet_in)
        into :sebest;
      select sebest
        from naklot_sebest2_count_pc(:ID_NAKLD_IN,:id_uchet_politics,:id_schet_in,11,1)
        into :sebest;        
    end
                           
  end
  /*Äëÿ ğàñõîäîâ íåò çàâèñèìûõ íàêëàäíûõ è ïîñëå íèõ ïåğåñ÷èòûâàòü íå íàäî*/
  if (mode_in in (2,3)
    and tip_name in ('ÁÓÕÃÀËÒÅĞÑÊÎÅ ÏÅĞÅÌÅÙÅÍÈÅ','ÏĞÈÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ'))
  then begin
    select id_tovar
      from naklot ot
      where ot.id_nakl=:id_nakl_in and
        ot.id_nakld=:id_nakld_in
      into :id_tovar;
    /*Ïåğâàÿ ïàğòèÿ ïğèõîäà*/
    if (id_partiya is null) then begin
      select first 1 pr.sub3,pr.dat
        from provodki pr
        where pr.id_schet=:id_schet_in and
          pr.attr1=:id_nakld_in and
          pr.id_nakl=:id_nakl_in and
          pr.debet_kolotp>0 and
          pr.dat>=:dat_from_in
        order by pr.dat,pr.sub3
        into :id_partiya,:dat;
    end
    
    for
      select pr.attr1,pr.tip,pr.id_nakl
        from provodki pr
        where 
          pr.id_schet=:id_schet_in and
          pr.sub1=:id_tovar and
          pr.sub2=:id_sklad_seb and
          pr.tip<>1 and
          pr.dat>=:dat and
          pr.attr1<>:id_nakld_in and
          pr.kredit_kolotp>0
        group by pr.dat,pr.attr1,pr.tip,pr.dat,pr.id_nakl
        order by pr.dat,pr.attr1          
        into :id_nakld_depend,:tip_depend,:id_nakl_depend
    do begin
      select name from get_name_objects_pc(:tip_depend,-100) into :tip_depend_name;
      if (tip_depend_name='ĞÀÑÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ') then begin
        execute procedure naklp_sebest_recount_pc(
          :id_nakl_depend,:id_nakld_depend,:id_sklad_in,
          :id_schet_in,:tip_depend,:dat_from_in,3);
      end
      if (tip_depend_name='ÁÓÕÃÀËÒÅĞÑÊÎÅ ÏÅĞÅÌÅÙÅÍÈÅ') then begin
        select id_sklad_to from naklo om where om.id_nakl=:id_nakl_depend into :id_sklad_to;
        execute procedure naklp_sebest_recount_pc(
          :id_nakl_depend,:id_nakld_depend,:id_sklad_to,
          :id_schet_in,:tip_depend,:dat_from_in,3);
      end
    end
  end
  
  /*Äëÿ ğàñõîäîâ íåò çàâèñèìûõ íàêëàäíûõ è ïîñëå íèõ ïåğåñ÷èòûâàòü íå íàäî*/
  if (mode_in in (4)
    and tip_name in ('ÁÓÕÃÀËÒÅĞÑÊÎÅ ÏÅĞÅÌÅÙÅÍÈÅ','ÏĞÈÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ'))
  then begin
    select id_tovar
      from naklot ot
      where ot.id_nakl=:id_nakl_in and
        ot.id_nakld=:id_nakld_in
      into :id_tovar;
    /*Ïåğâàÿ ïàğòèÿ ïğèõîäà*/
    if (id_partiya is null) then begin
      select first 1 pr.sub3,pr.dat
        from provodki pr
        where pr.id_schet=:id_schet_in and
          pr.attr1=:id_nakld_in and
          pr.id_nakl=:id_nakl_in and
          pr.debet_kolotp>0 and
          pr.dat>=:dat_from_in
        order by pr.dat,pr.sub3
        into :id_partiya,:dat;
    end
    
    for
      select pr.attr1,pr.tip,pr.id_nakl
        from provodki pr
        where 
          pr.id_schet=:id_schet_in and
          pr.sub1=:id_tovar and
          pr.sub2=:id_sklad_seb and
          pr.tip<>1 and
          pr.sub3=:id_partiya and
          pr.attr1<>:id_nakld_in and
          pr.kredit_kolotp>0
        group by pr.dat,pr.attr1,pr.tip,pr.dat,pr.id_nakl
        order by pr.dat,pr.attr1          
        into :id_nakld_depend,:tip_depend,:id_nakl_depend
    do begin
      select name from get_name_objects_pc(:tip_depend,-100) into :tip_depend_name;
      if (tip_depend_name='ĞÀÑÕÎÄÍÛÅ ÍÀÊËÀÄÍÛÅ') then begin
        execute procedure naklp_sebest_recount_pc(
          :id_nakl_depend,:id_nakld_depend,:id_sklad_in,
          :id_schet_in,:tip_depend,:dat_from_in,1);
      end
      if (tip_depend_name='ÁÓÕÃÀËÒÅĞÑÊÎÅ ÏÅĞÅÌÅÙÅÍÈÅ') then begin
        select id_sklad_to from naklo om where om.id_nakl=:id_nakl_depend into :id_sklad_to;
        execute procedure naklp_sebest_recount_pc(
          :id_nakl_depend,:id_nakld_depend,:id_sklad_to,
          :id_schet_in,:tip_depend,:dat_from_in,4);
      end
    end
  end  

end
^

SET TERM ; ^


