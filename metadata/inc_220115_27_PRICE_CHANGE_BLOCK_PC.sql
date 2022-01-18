SET TERM ^ ;

CREATE OR ALTER PROCEDURE PRICE_CHANGE_BLOCK_PC (
    id_nakl integer,
    id_schet integer)
as
declare variable schet_name varchar(50);
declare variable id_schet_prem integer;
declare variable id_schet_tip integer;
declare variable id_schet_sebest_sklad integer;
declare variable tip smallint;
declare variable posted smallint;
declare variable id_det integer;
declare variable delmarked smallint;
declare variable id_tovar integer;
declare variable id_nakld integer;
declare variable id_sklad integer;
declare variable dat date;
declare variable nds double precision;
declare variable kolotp double precision;
declare variable cena double precision;
declare variable parent_id_nakl integer;
declare variable tara integer;
declare variable tara_cur_pos double precision;
declare variable tara_sum double precision;
declare variable kurs double precision;
declare variable nalog_nds double precision;
declare variable id_izg integer;
declare variable id_zak integer;
declare variable id_manager integer;
declare variable id_sklad_seb integer;
declare variable id_uchet_politics integer;
declare variable sebest double precision;
declare variable id_sklad_to integer;
declare variable id_sklad_seb_to integer;
declare variable id_uchet_politics_in integer;
declare variable parent_delmarked integer;
declare variable parent_manager integer;
declare variable id_registr integer;
declare variable id_price integer;
declare variable dat_to date;
declare variable blocked integer;
begin
  select
      n.posted,n.delmarked,n.id_sklad,n.dat,
      n.parent_id_nakl,n.nds,n.kurs,n.nalog_nds,
      n.id_izg,n.id_zak,n.id_manager,n.id_sklad_to,
      n.blocked
    from
      naklo n
    where
      n.id_nakl = :id_nakl
    into
      :posted,:delmarked,:id_sklad,:dat,
      :parent_id_nakl,:nds,:kurs,:nalog_nds,
      :id_izg,:id_zak,:id_manager,:id_sklad_to,
      :blocked;
   
  select oid
    from GET_OID_OBJECTS_PC('�������� ��������',-100)
    into :id_registr;
  select oid
    from GET_OID_OBJECTS_PC('������� �������',:id_registr)
    into :id_registr;
  select oid
    from GET_OID_OBJECTS_PC('��������� ������',-100)
    into :tip;
  if (delmarked<>0) then begin
    execute procedure error ('������ �������� ���������� ��������� ���������');
  end
  if (id_schet =0 ) then begin
    id_schet = null;
  end    
  if (id_schet is not null) then begin
    select name
      from get_name_objects_pc(:id_schet,:id_schet_tip)
      into schet_name;
  end
/*$$IBEC$$   if (blocked=0) then begin
     $$IBEC$$*/ /*������ �������� � ���������*/ /*$$IBEC$$ 
    if (posted=0) then begin
       $$IBEC$$*/ /*� ����� �������� ��� ��������, �� �������� ��� ����*/ /*$$IBEC$$ 
      for
        select t.id_tovar,t.id_nakld,t.cena,t.id_sebest
        from price_change_det_vw t
        where t.id_nakl = :id_nakl
        into :id_tovar,:id_nakld,:cena,:id_price
      do begin
        insert into registry (id_registr,dat,
          id_nakl,tip,sub1,sub2,resurs1 )
         values(:id_registr,:dat,
          :id_nakld,:tip,:id_tovar,:id_price,:cena);
      end  $$IBEC$$*/ /*for tovar*/ /*$$IBEC$$ 
    end  $$IBEC$$*/ /*if (posted=0)*/ /*$$IBEC$$ 
    if (id_schet is null) then begin
       $$IBEC$$*/ /*������ 1 � blocked ��� ������� ��������������� ���������*/ /*$$IBEC$$ 
      update naklo n
        set n.blocked=1
        where n.id_nakl=:id_nakl and n.blocked=0;
    end     
  end else begin $$IBEC$$*/ /*if blocked*/
    /*������� �������� � ������������*/ /*$$IBEC$$ 
    for
      select t.id_tovar,t.id_nakld,t.cena,t.id_sebest
      from price_change_det_vw t
      where t.id_nakl = :id_nakl
      into :id_tovar,:id_nakld,:cena,:id_price
    do begin
      delete from registry pr
        where pr.id_registr=:id_registr
          and pr.tip=:tip
          and pr.id_nakl=:id_nakld;
    end  $$IBEC$$*/ /*for tovar*/
    if (id_schet is null) then begin
     /*������ 0 � blocked ��� ������� ������������������ ���������*/
      update naklo n
        set n.blocked=0
        where n.id_nakl=:id_nakl and n.blocked<>0;
    end      
/*$$IBEC$$   end  $$IBEC$$*/ /*if blocked*/


  /*�������� �������� �� ��������� ������ �� ������ �����. ��� ��������������*/
/*$$IBEC$$   if (id_schet is not null) then begin
    delete from provodki pr
      where pr.id_nakl=:id_nakl
        and pr.tip=:tip
        and pr.id_schet=:id_schet;
  end $$IBEC$$*/
end
^

SET TERM ; ^


