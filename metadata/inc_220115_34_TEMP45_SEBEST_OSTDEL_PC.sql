SET TERM ^ ;

CREATE OR ALTER PROCEDURE TEMP45_SEBEST_OSTDEL_PC (
    id_sklad_in integer,
    id_tovar_from integer,
    id_tovar_to integer)
as
declare variable id_partiya bigint;
declare variable id_partiya2 bigint;
declare variable id_tovar integer;
declare variable left_over double precision;
declare variable partiya_kolotp2 double precision;
declare variable delta_kolotp double precision;
declare variable id_prov integer;
declare variable serror varchar(250);
declare variable partiya_kolotp double precision;
declare variable id_nakl integer;
declare variable id_nakld integer;
begin /*$$IBE$$ 
  for
    select coalesce(r.id_tovar,r.id_tovar_s) as id_tovar,
        Round(r.kolotp-r.kol_sum_s,4)
      from temp39_sebest_kolotp_compare_pc(:id_sklad_in) r
      where  Round(r.kolotp-r.kol_sum_s,4)>0 and
        coalesce(r.id_tovar,r.id_tovar_s)<=:id_tovar_to and
        coalesce(r.id_tovar,r.id_tovar_s)>=:id_tovar_from
      into :id_tovar,:delta_kolotp
  do begin
      while(delta_kolotp>0) do begin

        select first 1 pr.sub4, pr.kredit_kolotp,pr.id_prov
          from provodki pr
          where pr.id_schet=8416 and
            pr.sub2=:id_sklad_in and
            pr.tip=10719 and
            pr.sub1=:id_tovar
          order by dat desc
          into :id_partiya,:partiya_kolotp,:id_prov;

         $$IBE$$*/ /*select first 1 pr.sub4, pr.kredit_kolotp,pr.id_prov
          from provodki pr
          where pr.id_schet=8416 and
            pr.sub2=:id_sklad_in and
            pr.sub1=:id_tovar and
            pr.tip=10719 and
            pr.sub4=:id_partiya
          into :id_partiya2,:partiya_kolotp2,:id_prov; */ /*$$IBE$$ 
        if ((:partiya_kolotp<=:delta_kolotp) and (:partiya_kolotp is not null)) then begin
          delta_kolotp=Round(z(delta_kolotp)-z(:partiya_kolotp),4);
          delete from provodki pr
              where pr.id_prov=:id_prov;
        end else begin
          partiya_kolotp=Round(z(:partiya_kolotp)-z(:delta_kolotp),4);
          delta_kolotp=0;
          update provodki pr
            set pr.kredit_kolotp=:partiya_kolotp
            where pr.id_prov=:id_prov;
        end
        for
          select pr.sub5, pr.id_nakl
            from provodki pr
            where pr.id_schet=8416 and
              pr.sub2=:id_sklad_in and
              pr.tip<>1 and
              pr.sub1=:id_tovar and
              pr.debet_kolotp>0 and
              pr.sub4=:id_partiya
            into :id_nakld,:id_nakl
        do begin
            execute procedure naklo_sebest_recount_pc(:id_nakld,2);
        end
        id_partiya2 = null;
        partiya_kolotp= null;
      end  $$IBE$$*/ /*while*/
         /* execute procedure provodki_refresh2_pc(8416,'03.10.04',:id_tovar, :id_sklad_in,null,:id_partiya2,
            null, null,null, null,null, null);  */
/*          delete from provodki pr
            where pr.id_schet=8416 and
              pr.sub2=:id_sklad_in and
              pr.sub1=:id_tovar and
              pr.tip=10719 and
              pr.sub4=:id_partiya;*/

   /* end *//*for*/ /*$$IBE$$ 
    delta_kolotp=null;
  end  $$IBE$$*/ /*for*/
EXIT;
end
^

SET TERM ; ^


