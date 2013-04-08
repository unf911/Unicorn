CREATE EXCEPTION AFTER_7_DAYS 'Запрещено редактирование накладных позднее чем через неделю от даты накладной ';

SET TERM ^ ;

CREATE OR ALTER PROCEDURE CAN_MODIFY_NAKLRAS_PC(
    ID_MANAGER INTEGER,
    DAT TIMESTAMP)
AS
  declare variable has_role integer;
  declare variable naklr_modified integer;
  declare variable has_manager integer;
begin
    /*execute procedure naklo_can_modify_common_pc(:dat,:id_manager); */
    if (user='SYSDBA') then begin
      exit;
    end
    
    select has_role from get_roles_pc('POWER_USER') into :has_role;
    if (has_role=1) then begin
      /*if not admin but power user*/

        /* select cast(p_value as integer)
        from get_param_pc('naklr_modified_power')
        into :naklr_modified;*/
        naklr_modified=90;
        if (DaysBetween(:dat,current_timestamp)>z(naklr_modified)) then begin
          exception too_late;
        end
        exit;
    end  /*power user*/

    select has_role from get_roles_pc('BUXG') into :has_role;
    if (has_role=1) then begin
        naklr_modified=90;
        if (DaysBetween(:dat,current_timestamp)>z(naklr_modified)) then begin
          exception too_late;
        end
        exit;
    end  /*buxg*/

    select has_manager from has_idmanager_pc(:id_manager) into :has_manager;
    if (has_manager=0) then begin
      exception access_denied;
    end else begin
      if ((current_timestamp-:dat)>=8) then begin
        exception AFTER_7_DAYS;
      end
    end/*has_manager*/


end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_ROLES_PC TO PROCEDURE CAN_MODIFY_NAKLRAS_PC;

GRANT EXECUTE ON PROCEDURE HAS_IDMANAGER_PC TO PROCEDURE CAN_MODIFY_NAKLRAS_PC;

GRANT EXECUTE ON PROCEDURE CAN_MODIFY_NAKLRAS_PC TO TRIGGER NAKLRAST_BD;
GRANT EXECUTE ON PROCEDURE CAN_MODIFY_NAKLRAS_PC TO TRIGGER NAKLRAST_BI;
GRANT EXECUTE ON PROCEDURE CAN_MODIFY_NAKLRAS_PC TO TRIGGER NAKLRAST_BU;
GRANT EXECUTE ON PROCEDURE CAN_MODIFY_NAKLRAS_PC TO TRIGGER NAKLRAS_AI;
GRANT EXECUTE ON PROCEDURE CAN_MODIFY_NAKLRAS_PC TO TRIGGER NAKLRAS_BD;
GRANT EXECUTE ON PROCEDURE CAN_MODIFY_NAKLRAS_PC TO TRIGGER NAKLRAS_BU;
GRANT EXECUTE ON PROCEDURE CAN_MODIFY_NAKLRAS_PC TO SYSDBA;

