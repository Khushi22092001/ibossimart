whenever sqlerror exit failure rollback
set define off
begin
  update apex_260100.wwv_flow_step_buttons
     set button_redirect_url = 'f?p=&APP_ID.:167:&SESSION.::&DEBUG.:::'
   where id = 609837714546597233
     and flow_id = 105
     and flow_step_id = 168
     and button_name = 'CANCEL';
  if sql%rowcount != 1 then
    raise_application_error(-20001, 'Expected exactly one Material Out Cancel button.');
  end if;
  commit;
end;
/
exit
