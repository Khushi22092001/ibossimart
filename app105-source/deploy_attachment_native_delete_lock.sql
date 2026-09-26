set define off verify off feedback on serveroutput on
whenever sqlerror exit sql.sqlcode rollback
connect -name IMART

begin
  apex_util.set_security_group_id(4744311978888504);
end;
/

@app105-source/export/f105/application/pages/page_01063.sql
commit;

select case when count(*) = 2
       then 'NATIVE_ATTACHMENT_DELETE_LOCK_DEPLOYED'
       else 'NATIVE_ATTACHMENT_DELETE_LOCK_INCOMPLETE'
       end deployment_status
  from apex_260100.wwv_flow_step_buttons
 where flow_id = 105
   and flow_step_id = 1063
   and security_group_id = 4744311978888504
   and button_name in ('DELETE','DELETE_LOCKED');

exit
