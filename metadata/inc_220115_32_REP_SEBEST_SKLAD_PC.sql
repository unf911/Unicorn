SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_SEBEST_SKLAD_PC (
    mode integer,
    id_sklad_in integer,
    id_tovar_in integer,
    id_currency_to integer,
    dat_to timestamp)
returns (
    id_sklad integer,
    id_tovar integer,
    id_partiya bigint,
    kolotp double precision,
    sebest double precision,
    sebestsum double precision,
    dat timestamp,
    id_manager integer)
as
begin /*$$IBE$$ 
  select oid
    from get_oid_objects_pc('ТИП СЧЕТА',-100)
    into :id_schet;
 $$IBE$$*/ /*$$IBEC$$   select oid
    from get_oid_objects_pc('СЕБЕСТОИМОСТЬ',:id_schet)
    into :id_schet_sebest; $$IBEC$$*/ /*$$IBE$$ 
  select oid
    from get_oid_objects_pc('ТИП ВАЛЮТ',-100)
    into :id_currency_tip;
  select oid
    from get_oid_objects_pc('USD',:id_currency_tip)
    into :id_currency;
   $$IBE$$*/ /*
    select oid
      from get_oid_objects_pc('ТИП ДЕРЕВЬЯ',-100)
      into :tree_oid;
    select oid
      from get_oid_objects_pc('ИЕРАРХИЯ СКЛАДОВ',:tree_oid)
      into :tree_oid;*/ /*$$IBE$$ 
    select oid
      from get_oid_objects_pc('ТИП НАЗВАНИЯ СКЛАДОВ',-100)
      into :tree_oid_sklad;
  select oid
    from get_oid_objects_pc('ТИП ТОВАРЫ',-100)
    into :tree_oid_tovar;
    
    
    
  $$IBE$$*/ /* mode=1 -  тип отчёта: по складам*/ /*$$IBE$$ 
  if ((mode=1) and (dat_to is null)) then begin
    for
      select pr.sub2,sum(pr.kredit*pr.kredit_kolotp),sum(pr.kredit_kolotp)
      from provodki pr inner join
        get_object_children_pc(:id_sklad_in,:tree_oid_sklad) c
        on c.oid=pr.sub2
      where
        pr.tip=1 and pr.id_nakl=15 and pr.id_schet=:id_schet_sebest
      group by pr.sub2
      into :id_sklad,:sebestsum,:kolotp
    do begin
      sebest=dzero(:sebestsum,:kolotp, 0);
      select id_manager
        from spr_sklad_vw s
        where s.oid=:id_sklad
        into :id_manager;
      suspend;
    end  $$IBE$$*/ /*for select provodki*/ /*$$IBE$$ 
  end
   $$IBE$$*/ /*mode=2 - тип отчёта: по товарам*/ /*$$IBE$$ 
  if ((mode=2) and (dat_to is null)) then begin
    if (id_tovar_in is null) then begin
      for
        select pr.sub1, pr.sub2,sum(pr.kredit*pr.kredit_kolotp),
          sum(pr.kredit_kolotp),min(pr.dat)
        from provodki pr inner join
          get_object_children_pc(:id_sklad_in,:tree_oid_sklad) c
          on c.oid=pr.sub2
     $$IBE$$*/ /*      inner join
          get_object_children_pc(:id_tovar_in,:tree_oid_tovar) t
          on t.oid=pr.sub1*/ /*$$IBE$$ 
        where
          pr.tip=1 and pr.id_nakl=15 and pr.id_schet=:id_schet_sebest
        group by pr.sub1, pr.sub2
        into :id_tovar,:id_sklad,:sebestsum,:kolotp,:dat
      do begin
        sebest=dzero(:sebestsum,:kolotp, 0);
        suspend;
      end  $$IBE$$*/ /*for select provodki*/ /*$$IBE$$ 
    end  $$IBE$$*/ /**if id_tovar_in is null*/
    
    /*Оптимизация под запрос всех складов*/ /*$$IBE$$ 
    if ((id_sklad_in is null) and (id_tovar_in is not null)) then begin
      for
        select pr.sub1, pr.sub2,sum(pr.kredit*pr.kredit_kolotp),
          sum(pr.kredit_kolotp),min(pr.dat)
        from provodki pr  $$IBE$$*/ /*inner join
          get_object_children_pc(:id_sklad_in,:tree_oid_sklad) c
          on c.oid=pr.sub2*/ /*$$IBE$$ 
          inner join
          get_object_children_pc(:id_tovar_in,:tree_oid_tovar) t
          on t.oid=pr.sub1
        where
          pr.tip=1 and pr.id_nakl=15 and pr.id_schet=:id_schet_sebest
        group by pr.sub1, pr.sub2
        into :id_tovar,:id_sklad,:sebestsum,:kolotp,:dat
      do begin
        sebest=dzero(:sebestsum,:kolotp, 0);
        suspend;
      end  $$IBE$$*/ /*for select provodki*/ /*$$IBE$$ 
    end  $$IBE$$*/ /**if id_sklad_in is null*/
    /*Неоптимизированный вариант*/ /*$$IBE$$ 
    if ((id_tovar_in is not null) and (id_sklad_in is not null)) then begin
      for
        select pr.sub1, pr.sub2,sum(pr.kredit*pr.kredit_kolotp),
          sum(pr.kredit_kolotp),min(pr.dat)
        from provodki pr inner join
          get_object_children_pc(:id_sklad_in,:tree_oid_sklad) c
          on c.oid=pr.sub2
          inner join
          get_object_children_pc(:id_tovar_in,:tree_oid_tovar) t
          on t.oid=pr.sub1
        where
          pr.tip=1 and pr.id_nakl=15 and pr.id_schet=:id_schet_sebest
        group by pr.sub1, pr.sub2
        into :id_tovar,:id_sklad,:sebestsum,:kolotp,:dat
      do begin
        sebest=dzero(:sebestsum,:kolotp, 0);
        suspend;
      end  $$IBE$$*/ /*for select provodki*/ /*$$IBE$$ 
    end  $$IBE$$*/ /**if id_tovar_in is not null and id_sklad_in is not null*/ /*$$IBE$$ 

  end  $$IBE$$*/ /*if mode=2 тип отчёта: по товарам*/

  /*mode=2 - тип отчёта: по товарам*/ /*$$IBE$$ 
  if ((mode=2) and (dat_to is not null)) then begin
  
    if (id_tovar_in is null) then begin
      for
        select pr.sub1, pr.sub2,sum(pr.kredit*pr.kredit_kolotp),
          sum(pr.kredit_kolotp),min(pr.dat)
        from provodki pr inner join
          get_object_children_pc(:id_sklad_in,:tree_oid_sklad) c
          on c.oid=pr.sub2
        where
          pr.tip<>1 and  $$IBE$$*/ /*pr.id_nakl=15 and*/ /*$$IBE$$ 
          pr.id_schet=:id_schet_sebest and
          pr.dat<=:dat_to
        group by pr.sub1, pr.sub2
        into :id_tovar,:id_sklad,:sebestsum,:kolotp,:dat
      do begin
        sebest=dzero(:sebestsum,:kolotp, 0);
        suspend;
      end  $$IBE$$*/ /*for select provodki*/ /*$$IBE$$ 
    end  $$IBE$$*/ /**if id_tovar_in is null*/
    
    /*Оптимизация под запрос всех складов*/ /*$$IBE$$ 
    if ((id_sklad_in is null) and (id_tovar_in is not null)) then begin
      for
        select pr.sub1, pr.sub2,sum(pr.kredit*pr.kredit_kolotp),
          sum(pr.kredit_kolotp),min(pr.dat)
        from provodki pr
          inner join
          get_object_children_pc(:id_tovar_in,:tree_oid_tovar) t
          on t.oid=pr.sub1
        where
          pr.tip<>1 and  $$IBE$$*/ /*pr.id_nakl=15 and*/ /*$$IBE$$ 
          pr.id_schet=:id_schet_sebest and
          pr.dat<=:dat_to
        group by pr.sub1, pr.sub2
        into :id_tovar,:id_sklad,:sebestsum,:kolotp,:dat
      do begin
        sebest=dzero(:sebestsum,:kolotp, 0);
        suspend;
      end  $$IBE$$*/ /*for select provodki*/ /*$$IBE$$ 
    end  $$IBE$$*/ /**if id_sklad_in is null*/
    /*Неоптимизированный вариант*/ /*$$IBE$$ 
    if ((id_tovar_in is not null) and (id_sklad_in is not null)) then begin
      for
        select pr.sub1, pr.sub2,sum(pr.kredit*pr.kredit_kolotp),
          sum(pr.kredit_kolotp),min(pr.dat)
        from provodki pr inner join
          get_object_children_pc(:id_sklad_in,:tree_oid_sklad) c
          on c.oid=pr.sub2
          inner join
          get_object_children_pc(:id_tovar_in,:tree_oid_tovar) t
          on t.oid=pr.sub1
        where
          pr.tip<>1 and  $$IBE$$*/ /*pr.id_nakl=15 and*/ /*$$IBE$$ 
          pr.id_schet=:id_schet_sebest and
          pr.dat<=:dat_to
        group by pr.sub1, pr.sub2
        into :id_tovar,:id_sklad,:sebestsum,:kolotp,:dat
      do begin
        sebest=dzero(:sebestsum,:kolotp, 0);
        suspend;
      end  $$IBE$$*/ /*for select provodki*/ /*$$IBE$$ 
    end  $$IBE$$*/ /**if id_tovar_in is not null and id_sklad_in is not null*/ /*$$IBE$$ 
  end  $$IBE$$*/ /*if mode=2 тип отчёта: по товарам на дату*/ /*$$IBE$$ 
  
  
  
  if (mode=3 ) then begin
     $$IBE$$*/ /*тип отчёта: по партиям*/

    /*Неоптимизированный вариант*/
/*$$IBEC$$     if ((id_tovar_in is not null) and (id_sklad_in is not null)) then begin $$IBEC$$*/ /*$$IBE$$ 
      for
        select pr.sub1, pr.sub2,pr.sub4, sum(pr.kredit*pr.kredit_kolotp),
          sum(pr.kredit_kolotp),min(pr.dat)
        from provodki pr inner join
          get_object_children_pc(:id_sklad_in,:tree_oid_sklad) c
          on c.oid=pr.sub2
          inner join
          get_object_children_pc(:id_tovar_in,:tree_oid_tovar) t
          on t.oid=pr.sub1
        where
          pr.tip=1 and pr.id_nakl=15 and pr.id_schet=:id_schet_sebest
        group by pr.sub1, pr.sub2, pr.sub4
        into :id_tovar,:id_sklad,:id_partiya,:sebestsum,
          :kolotp,:dat
      do begin
        sebest=dzero(:sebestsum,:kolotp, 0);
        suspend;
      end  $$IBE$$*/ /*for select provodki*/
/*$$IBEC$$     end  $$IBEC$$*/ /**if id_tovar_in is not null and id_sklad_in is not null*/ /*$$IBE$$ 

  end  $$IBE$$*/ /*if mode=3 тип отчёта: по партиям*/ /*$$IBE$$ 
  
  if (mode=4) then begin
    for
    select pr.sub4
      from provodki pr
      where pr.tip<>1 and pr.id_nakl=:id_sklad_in
      group by sub4
      into :sub4_in
    do begin
      for
        select pr.sub1, pr.sub2,pr.sub4, sum(pr.kredit*pr.kredit_kolotp),
          sum(pr.kredit_kolotp),min(pr.dat)
        from provodki pr 
        where
          pr.tip<>1 and  $$IBE$$*/ /*pr.id_nakl=15 and*/ /*$$IBE$$ 
          pr.id_schet=:id_schet_sebest and pr.sub4=:sub4_in
        group by pr.sub1, pr.sub2, pr.sub4
        into :id_tovar,:id_sklad,:id_partiya,:sebestsum,
          :kolotp,:dat
      do begin
        sebest=dzero(:sebestsum,:kolotp, 0);
        suspend;
      end  $$IBE$$*/ /*for select provodki*/ /*$$IBE$$ 
    end  $$IBE$$*/ /*for все партии упоминающиеся в данной накладной*/ /*$$IBE$$ 
  end  $$IBE$$*/ /*if mode=4 режим детализации по одной накладной*/ /*$$IBE$$ 
EXIT;
 $$IBE$$*/ SUSPEND;
end
^

SET TERM ; ^


