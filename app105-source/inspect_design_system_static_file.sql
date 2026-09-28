set define off
whenever sqlerror exit sql.sqlcode rollback
connect -name IMART

set pagesize 100
set linesize 260
column file_name format a40
column css_file_urls format a220
select id, file_name
  from apex_260100.wwv_flow_static_files
 where flow_id = 105
   and file_name = 'design-system.css';

select css_file_urls
  from apex_260100.wwv_flows
 where id = 105;
exit
