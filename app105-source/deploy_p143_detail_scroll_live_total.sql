whenever sqlerror exit sql.sqlcode rollback
set define off
set verify off
set feedback on
set serveroutput on

connect -name IMART

prompt Importing Purchase Bill Page 143 vertical scroll and live total display...
@export/f105/application/pages/page_00143.sql

commit;

prompt Verifying Purchase Bill Page 143 deployment...
select case
         when dbms_lob.instr(javascript_code, 'P143_DETAIL_SCROLL_LIVE_TOTAL_V1') > 0
         then 'P143_DETAIL_SCROLL_LIVE_TOTAL_DEPLOYED'
         else 'P143_DETAIL_SCROLL_LIVE_TOTAL_MISSING'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 143
   and security_group_id = 4744311978888504;

exit
