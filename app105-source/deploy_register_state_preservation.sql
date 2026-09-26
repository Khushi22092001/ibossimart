whenever sqlerror exit failure rollback
set define off
connect -name IMART

/*
 * APEX-native return-state preservation: a return to a register must not
 * include that register in Clear Cache. APEX retains page item, IR and IG
 * state in the current application session when this URL has no clear-cache
 * or report-reset directive.
 */
begin
  update apex_260100.wwv_flow_step_buttons
     set button_redirect_url = 'f?p=&APP_ID.:414:&SESSION.::&DEBUG.:::'
   where flow_id = 105
     and flow_step_id = 415
     and button_name = 'CANCEL'
     and button_redirect_url = 'f?p=&APP_ID.:414:&SESSION.::&DEBUG.:414::';

  if sql%rowcount > 1 then
    raise_application_error(-20001,
      'Expected exactly one Schedule Cancel return target with Clear Cache.');
  end if;

  update apex_260100.wwv_flow_step_buttons
     set button_redirect_url = 'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:::'
   where flow_id = 105
     and flow_step_id = 32
     and button_name = 'CANCEL'
     and button_redirect_url = 'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:31::';
  if sql%rowcount > 1 then
    raise_application_error(-20002, 'Expected exactly one TDS Tax Category Cancel return target with Clear Cache.');
  end if;

  update apex_260100.wwv_flow_step_buttons
     set button_redirect_url = 'f?p=&APP_ID.:165:&SESSION.::&DEBUG.:::'
   where flow_id = 105
     and flow_step_id = 166
     and button_name = 'CANCEL'
     and button_redirect_url = 'f?p=&APP_ID.:165:&SESSION.::&DEBUG.:165::';
  if sql%rowcount > 1 then
    raise_application_error(-20003, 'Expected exactly one Credit Note Cancel return target with Clear Cache.');
  end if;

  update apex_260100.wwv_flow_step_buttons
     set button_redirect_url = 'f?p=&APP_ID.:316:&SESSION.::&DEBUG.:::'
   where flow_id = 105
     and flow_step_id = 317
     and button_name = 'CANCEL'
     and button_redirect_url = 'f?p=&APP_ID.:316:&SESSION.::&DEBUG.:167::';
  if sql%rowcount > 1 then
    raise_application_error(-20004, 'Expected exactly one Import Cancel return target with Clear Cache.');
  end if;
  commit;
end;
/
exit
