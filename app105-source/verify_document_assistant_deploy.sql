whenever sqlerror exit sql.sqlcode rollback
set define off
set heading on feedback on pagesize 100 linesize 240
connect -name IMART

column javascript_file_urls format a100
column css_file_urls format a100
select files_version,
       javascript_file_urls,
       css_file_urls
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

exit
