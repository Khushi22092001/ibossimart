whenever sqlerror exit sql.sqlcode rollback
set pagesize 100
set linesize 320
set long 100000
set longchunksize 100000
connect -name IMART

select inline_css
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 708
   and security_group_id = 4744311978888504;

exit
