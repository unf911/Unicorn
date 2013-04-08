SET TERM ^ ;

CREATE OR ALTER PROCEDURE NAKL_AUTO_OPLAT_PC(
    ID_NAKL INTEGER,
    TIP_TRANSH INTEGER,
    ID_SCHET INTEGER,
    ID_IZG INTEGER,
    ID_ZAK INTEGER)
AS
  declare variable dat_report date;
  declare variable dat_opl date;
  declare variable id_nakl_nakl integer;
  declare variable transh double precision;
  declare variable dat_transh date;
  declare variable nds_neopl double precision;
  declare variable id_transh integer;
  declare variable id_manager integer;
  declare variable dat date;
  declare variable id_currency integer;
  declare variable id_manager_nakl integer;
begin
  if (tip_transh is null) then begin
    tip_transh =1;
  end

  select om.id_manager, om.dat, om.id_currency
    from naklo om
    where om.id_nakl=:id_nakl
    into :id_manager, :dat, :id_currency;

    /*Старые транши при перепроведении удаляются*/
    delete from oplnakl t
      where t.id_to=:id_nakl and t.tip=:tip_transh;
              
      dat_report=:dat;
      /*транши пока не пишутся*/
      if (dat_report<current_timestamp ) then begin
        dat_report=current_timestamp;
      end
      for
        select om.dat, om.id_manager, r.sub4,sum(r.debetafter)-sum(r.kreditafter)
        from rep_ostatki_pc(:id_schet,:dat_report,
          :id_izg,:id_zak,
          null,null,
          null,null,
          null,null,
          null,null) r inner join naklo om
          on om.id_nakl=r.sub4
        where r.debetafter>0
        group by sub4,om.dat,om.id_izg,om.id_zak,om.id_manager
        order by om.dat
        into :dat_opl, :id_manager_nakl, :id_nakl_nakl, :transh
      do begin
        select sum(r.kreditafter)-sum(r.debetafter)
        from rep_ostatki_pc(:id_schet,:dat_report,
          :id_izg,:id_zak,
          :id_manager,:id_nakl,
          null, null,
          null,null,
          null,null) r 
        into :nds_neopl;
        if (nds_neopl<=0) then begin
          leave;
        end
        dat_transh=:dat;
        if (dat_transh<:dat_opl) then begin
          dat_transh=:dat_opl;
        end
        
        id_transh=gen_id(OPLNAKL_GEN, 1);
        insert into oplnakl  (id_from,id_to,transh,
            opl_data,id_manager,tip,id, id_currency)
          values (:id_nakl,:id_nakl_nakl,minnum(:transh,:nds_neopl),
            :dat_transh,:id_manager_nakl,:tip_transh,:id_transh, :id_currency);
        execute procedure oplnakl_post_pc(:id_transh);
      end  /*for naklo*/
end^

SET TERM ; ^

GRANT SELECT ON NAKLO TO PROCEDURE NAKL_AUTO_OPLAT_PC;

GRANT SELECT,INSERT,DELETE ON OPLNAKL TO PROCEDURE NAKL_AUTO_OPLAT_PC;

GRANT EXECUTE ON PROCEDURE REP_OSTATKI_PC TO PROCEDURE NAKL_AUTO_OPLAT_PC;

GRANT EXECUTE ON PROCEDURE OPLNAKL_POST_PC TO PROCEDURE NAKL_AUTO_OPLAT_PC;

GRANT EXECUTE ON PROCEDURE NAKL_AUTO_OPLAT_PC TO PROCEDURE VOZVRAT_POST_PC;
GRANT EXECUTE ON PROCEDURE NAKL_AUTO_OPLAT_PC TO SYSDBA;
