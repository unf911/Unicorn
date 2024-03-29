SET TERM ^ ;

CREATE OR ALTER PROCEDURE TEST_NAKLOT_SEBEST2_VOZVRAT_PC 
as
declare variable id_nakl integer;
declare variable id_nakld integer;
declare variable id_uchet_politics_in integer;
declare variable id_schet_tip integer;
declare variable id_schet_bux integer;
declare variable sebest double precision;
declare variable id_partiya bigint;
declare variable tip integer;
declare variable sebest_test double precision;
begin
  select oid
    from GET_OID_OBJECTS_PC('�������� �������� �������������',-100)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('������������� �ר�',:id_uchet_politics_in)
    into :id_uchet_politics_in;
  select oid
    from GET_OID_OBJECTS_PC('��� �����',-100)
    into :id_schet_tip;    
  select oid
    from GET_OID_OBJECTS_PC('������������� ���',:id_schet_tip)
    into :id_schet_bux;
  select oid
    from get_oid_objects_pc('�������',-100)
    into :tip;
  /*358825*/
    
  id_nakl=gen_id(naklo_gen, 1);
  INSERT INTO naklo (ID_NAKL, DAT, ID,
      ID_IZG, ID_ZAK, ID_MANAGER, ID_CURRENCY, NALOG_NDS, ID_SKLAD,
      DELMARKED, BLOCKED, POSTED, TIP, ID_SKLAD_TO, NDS, KURS, COMMENT,
      PARENT_ID_NAKL, ZATRATY, KURS_INDIRECT, ID_CURRENCY_TO, NDS_FROM)
    VALUES (:id_nakl, '18-DEC-2006 00:00:00', '367020',
      2669, 1267, 3096, 3036, 0.2,
      0, 0, 0, 1, :tip, NULL, 11440, 1, NULL,
      358825/*367009*/, 0, 0, 3036, 11440);
  
  id_nakld=gen_id(naklot_gen, 1);
 /*$$IBEC$$  INSERT INTO naklot (ID_NAKLD, ID_NAKL, ID_POS, ID_TOVAR,
      CENA, KOLOTP, KODCN, SKIDKA, ID_SEBEST, TIP)
    VALUES (:id_nakld, :id_nakl, 1, 14165,
      73333.34, 0.13, NULL, 20, NULL, :tip); $$IBEC$$*/
      

/*$$IBEC$$   INSERT INTO naklot  (ID_NAKLD, ID_NAKL, ID_POS, ID_TOVAR,
      CENA, KOLOTP, KODCN, SKIDKA, ID_SEBEST, TIP)
    VALUES (:id_nakld, :id_nakl, 1, 6026,
      53468.33, 1.73, NULL, 0, NULL, :tip); $$IBEC$$*/
  INSERT INTO naklot  (ID_NAKLD, ID_NAKL, ID_POS, ID_TOVAR,
      CENA, KOLOTP, KODCN, SKIDKA, ID_SEBEST, TIP)
    VALUES (:id_nakld, :id_nakl, 1, 6026,
      53468.33, 1.70, NULL, 0, NULL, :tip);
           
  execute procedure naklot_sebest2_vozvrat_pc(:id_nakld,:id_uchet_politics_in,:id_schet_bux)
    returning_values :sebest,:id_partiya;

  select  Round(dzero(sum(pr.kredit),sum(pr.kredit_kolotp),0),2)
    from provodki pr
    where 
      pr.tip<>1 and
      pr.id_schet=:id_schet_bux and
      pr.sub2=0 and
      pr.id_nakl=358825 and
      pr.attr1=564599 
    into :sebest_test;
  if (Round(sebest_test-sebest,2)<>0) then begin
    execute procedure error('test_naklot_sebest2_vozvrat_pc. #1');
  end
  if (id_partiya<>611141826) then begin
    execute procedure error('test_naklot_sebest2_vozvrat_pc. #2');
  end  
  delete from provodki pr where pr.id_nakl=:id_nakl;
  delete from naklot ot where ot.id_nakl=:id_nakl;
  delete from naklo om where om.id_nakl=:id_nakl;
end
^

SET TERM ; ^


