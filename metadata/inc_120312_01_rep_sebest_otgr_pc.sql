SET TERM ^ ;

ALTER PROCEDURE REP_SEBEST_OTGR_PC (
    mode integer,
    dat_from timestamp,
    dat_to timestamp,
    id_izg_in integer,
    id_zak_in integer,
    id_manager_in integer,
    id_sklad_in integer,
    id_tovar_in integer,
    id_uchet_politics_in integer,
    id_currency_to integer)
returns (
    dat timestamp,
    id_nakl integer,
    id varchar(30),
    id_izg integer,
    id_zak integer,
    id_manager integer,
    id_sklad integer,
    id_tovar integer,
    kolotp double precision,
    nds_fact double precision,
    nds_sebest double precision,
    nds_sebest_in_currency double precision,
    doxod double precision,
    rent double precision,
    id_analog integer)
as
declare variable id_schet integer;
declare variable id_schet_sebest integer;
declare variable id_currency_tip integer;
declare variable id_currency integer;
declare variable tree_oid_sklad integer;
declare variable tree_oid_tovar integer;
declare variable id_currency_from integer;
declare variable id_uchet_politics integer;
declare variable id_nakl_in_list integer;
declare variable nalog_nds double precision;
declare variable id_sklad_seb integer;
declare variable kurs double precision;
declare variable kurs2 double precision;
declare variable tara integer;
declare variable id_pos integer;
declare variable om_tip integer;
declare variable tip_in integer;
declare variable id_nakld integer;
declare variable cena double precision;
declare variable skidka double precision;
declare variable cena_sebest double precision;
declare variable kurs_pos double precision;
declare variable cena_grn double precision;
declare variable cena_sebest_grn double precision;
declare variable zatraty double precision;
declare variable old_id_sklad integer;
declare variable dat_old date;
declare variable id_sklad_to integer;
declare variable id_sklad_to_in integer;
begin
  select oid
    from get_oid_objects_pc('��� �����',-100)
    into :id_schet;
  select oid
    from get_oid_objects_pc('������������� �����',:id_schet)
    into :id_schet_sebest;

  select oid
    from get_oid_objects_pc('��� �����',-100)
    into :id_currency_tip;
  select oid
    from get_oid_objects_pc('USD',:id_currency_tip)
    into :id_currency;
  select oid
    from get_oid_objects_pc('UAH',:id_currency_tip)
    into :id_currency_from;

  select oid
    from get_oid_objects_pc('��� �������� �������',-100)
    into :tree_oid_sklad;
  select oid
    from get_oid_objects_pc('��� ������',-100)
    into :tree_oid_tovar;
  select oid
    from get_oid_objects_pc('�������� �������� �������������',-100)
    into :id_uchet_politics;
  select oid
    from get_oid_objects_pc('�������������� �ר�',:id_uchet_politics)
    into :id_uchet_politics;
  id_sklad_to_in=null;
 /* mode=1 -  ��� ������: �� ����������*/
  if ((mode in(1,2,3,4,5,6))) then begin
    if (mode =1 ) then begin
      tip_in=30;
    end
    if (mode=2 ) then begin
      tip_in=2;
    end
    if (mode=3 ) then begin
      tip_in=5;
    end
    if (mode=4 ) then begin
      tip_in=103;
    end
    if (mode=5 ) then begin
      tip_in=1;
    end
    if (mode=6 ) then begin
      tip_in=103;
      id_sklad_to_in=id_sklad_in;
      id_sklad_in=null;
    end    
    old_id_sklad=null;
    
    dat_old=null;
    for
      select om.id_nakl,om.id_sklad,om.nalog_nds,
           om.id_izg,om.id_zak,om.id_manager,om.tip,om.dat,om.kurs,
           om.zatraty,
           t.tara,ot.id_tovar,ot.id_pos,ot.id_nakld,
           ot.cena,ot.skidka,ot.kolotp,t.id_analog,
           om.id_sklad_to, om.id
        from naklo om inner join naklot ot
            on om.id_nakl =ot.id_nakl
          inner join tovar t
            on ot.id_tovar=t.oid
        where om.posted<>0 and
          (ot.id_tovar between coalesce(:id_tovar_in,-2147483648) and
              coalesce(:id_tovar_in, 2147483647)) and
          /*$$IBEC$$  (t.id_analog between coalesce(:id_analog_in,-2000000000) and
              coalesce(:id_analog_in, 2000000000)) and $$IBEC$$*/
          (om.dat between :dat_from and :dat_to) and
          om.tip=:tip_in and
          (om.id_sklad between coalesce(:id_sklad_in,-2147483648) and coalesce(:id_sklad_in, 2147483647)) and
          (om.id_sklad_to between coalesce(:id_sklad_to_in,-2147483648) and coalesce(:id_sklad_to_in, 2147483647)) and
          (om.id_zak between coalesce(:id_zak_in,-2147483648) and coalesce(:id_zak_in, 2147483647)) and
          (om.id_izg between coalesce(:id_izg_in,-2147483648) and coalesce(:id_izg_in, 2147483647)) and
          (om.id_manager between coalesce(:id_manager_in,-2147483648) and coalesce(:id_manager_in, 2147483647))
        order by om.id_sklad
        into :id_nakl_in_list,:id_sklad,:nalog_nds,
          :id_izg,:id_zak,:id_manager,:om_tip,:dat,:kurs,
          :zatraty,
          :tara, :id_tovar,:id_pos,:id_nakld,
          :cena,:skidka,:kolotp,:id_analog,
          :id_sklad_to, :id
    do begin
      if (mode=6) then begin
        id_sklad=id_sklad_to;
      end
      if ((id_sklad<>old_id_sklad) or (old_id_sklad is null))  then begin
        select id_sklad,id_uchet_politics
          from sklad_sebest_settings_pc(:id_sklad, :id_uchet_politics)
          into :id_sklad_seb,:id_uchet_politics;
        old_id_sklad=id_sklad;
      end
      if (Round(kurs,4)=1) then begin
       /*����� ���� ��� ������ ��������� ���������,
         ���� ���� � ��� ���� � �������*/
        if ((dat<>dat_old) or (dat_old is null))  then begin
          select dzero(kurs_to,kurs_from,1)
            from kurs_get_pc (:dat, :id_currency_from,:id_currency,1)
            into :kurs2;
          dat_old=:dat;
        end
      end else begin
        kurs2=:kurs;
      end
        /*���� ��� ������ �������*/
        kurs_pos=kurs;
        if (mode =1 ) then begin
          cena=0;
        end
        if (tara=1) then begin
          kurs_pos=1.0000;
        end
        /*�������������*/ 
        if (mode in (1,3,4)) then begin
          select Round(
              dzero(z(sum(pr.kredit)),
              z(sum(pr.kredit_kolotp)),
              0),
              2)
            from provodki pr
            where pr.id_schet=:id_schet_sebest and
              (pr.sub1=:id_tovar) and
              (pr.sub2=:id_sklad_seb) and
              (pr.attr1=:id_nakld) and
              pr.id_nakl=:id_nakl_in_list and
              pr.tip<>1 and
              pr.kredit_kolotp>0
            into :CENA_SEBEST;
        end /*if mode in 1,3,4*/ 
        if (mode in (2,5,6)) then begin
          select Round(
              dzero(z(sum(pr.debet)),
              z(sum(pr.debet_kolotp)),
              0),
              2)
            from provodki pr
            where pr.id_schet=:id_schet_sebest and
              (pr.sub1=:id_tovar) and
              (pr.sub2=:id_sklad_seb) and
              (pr.attr1=:id_nakld) and
              pr.id_nakl=:id_nakl_in_list and
              pr.tip<>1 and
              pr.debet_kolotp>0
            into :CENA_SEBEST;
        end  /*if mode in 2,5*/

        cena_grn=Round(cena*kurs,2);
        nds_fact=Round(Round(:cena_grn*:kolotp,2)*(1+:nalog_nds),2);
        if (:om_tip=1) then begin
          /*��� �������� �������� ������������� ��������������
           ��-�� ����, ��� ���� �� ����������� �� �������*/
          nds_fact=Round(Round(:cena_grn*(1+:zatraty/100)*:kolotp,2)*(1+:nalog_nds),2);
        end
        cena_sebest_grn=Round(Cena_sebest*kurs2,2);
        nds_sebest=Round(:cena_sebest_grn*:kolotp,2);
        NDS_SEBEST_IN_CURRENCY =Round(:Cena_sebest*:kolotp,2);
        doxod=Round(nds_fact-nds_sebest,2);
        Rent=dzero(doxod*100,nds_sebest,0);
        id_nakl=id_nakl_in_list;
        suspend;
     /*$$IBEC$$  end  $$IBEC$$*/ /*for naklot*/
    end /**/
  end /*if mode=1*/
end
^

SET TERM ; ^



