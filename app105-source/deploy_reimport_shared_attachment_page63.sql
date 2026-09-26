set define off verify off feedback on serveroutput on
whenever sqlerror exit sql.sqlcode rollback
connect -name IMART

begin
  apex_util.set_security_group_id(4744311978888504);
end;
/

prompt Reimporting Application 105 shared Attachment Page 63
@app105-source/export/f105/application/pages/page_00063.sql

commit;

select case
         when count(*) = 4
          and sum(case when button_name in ('CANCEL','DELETE') and button_position = 'DELETE' then 1 else 0 end) = 2
          and sum(case when button_name in ('CREATE','SAVE') and button_position = 'NEXT' then 1 else 0 end) = 2
         then 'SHARED_ATTACHMENT_BUTTONS_REBUILT'
         else 'SHARED_ATTACHMENT_BUTTONS_INVALID'
       end deployment_status
  from apex_260100.wwv_flow_step_buttons
 where flow_id = 105
   and flow_step_id = 63
   and security_group_id = 4744311978888504
   and button_name in ('CANCEL','CREATE','DELETE','SAVE');

exit
