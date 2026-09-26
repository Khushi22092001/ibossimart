whenever sqlerror exit failure rollback
set define off
connect -name IMART

set long 100000
set linesize 32767
select javascript_file_urls, css_file_urls, files_version
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

select file_name, dbms_lob.getlength(file_content) as bytes
  from apex_260100.wwv_flow_static_files
 where application_id = 105
   and security_group_id = 4744311978888504
   and file_name in ('hspl-theme.js', 'hspl-theme.css');

exit
