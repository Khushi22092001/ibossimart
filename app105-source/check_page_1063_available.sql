whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

select count(*) page_count
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 1063
   and security_group_id = 4744311978888504;

exit
