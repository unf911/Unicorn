

ALTER TABLE NAKLRAS
ADD BLOCKED S_0;

DESCRIBE FIELD BLOCKED TABLE NAKLRAS 'Оригинал. Есть ли оригинал налоговой накладной';

update naklras n
set n.blocked=0;

SET TERM ^ ;

CREATE OR ALTER trigger naklras_bu for naklras
active before update position 0
as
  declare variable has_role integer;
  declare variable naklr_modified integer;
begin
  if (trim(new.blocked)<>trim(old.blocked)) then begin
    if (not (current_role in ('BUXG','POWER_USER')) and (not (user='SYSDBA')))  then begin
      execute procedure error('Запрещено менять поле "Оригинал"');
    end    
  end
  if (user='SYSDBA') then begin
    exit;
  end
  select HAS_ROLE from get_roles_pc('MANAGER') into :has_role;
  if (has_role=1) then  begin
    naklr_modified=90;
    if (DaysBetween(old.dat,current_timestamp)>z(naklr_modified)) then begin
      exception too_late;
    end
  end/*has_role*/
end
^

SET TERM ; ^



SET TERM ^ ;

CREATE OR ALTER trigger naklras_bu for naklras
active before update position 0
as
  declare variable has_role integer;
  declare variable naklr_modified integer;
begin
  if (trim(new.blocked)<>trim(old.blocked)) then begin
    if (not (current_role in ('BUXG','POWER_USER')) and (not (user='SYSDBA')))  then begin
      execute procedure error('Запрещено менять поле "Оригинал"');
    end    
  end
  if (user='SYSDBA') then begin
    exit;
  end
  select HAS_ROLE from get_roles_pc('MANAGER') into :has_role;
  if (has_role=1) then  begin
    naklr_modified=90;
    if (DaysBetween(old.dat,current_timestamp)>z(naklr_modified)) then begin
      exception too_late;
    end
  end/*has_role*/
end
^

SET TERM ; ^

