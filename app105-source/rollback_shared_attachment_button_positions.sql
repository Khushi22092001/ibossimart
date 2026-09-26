whenever sqlerror exit failure rollback
set define off
connect -name IMART

update apex_260100.wwv_flow_step_buttons
   set button_position = case button_name
                           when 'CANCEL' then 'PREVIOUS'
                           when 'DELETE' then 'PREVIOUS'
                           when 'CREATE' then 'CREATE'
                           when 'SAVE'   then 'CREATE'
                         end,
       last_updated_on = sysdate
 where flow_id = 105
   and flow_step_id = 63
   and button_name in ('CANCEL', 'DELETE', 'CREATE', 'SAVE')
   and security_group_id = 4744311978888504;

commit;
exit
