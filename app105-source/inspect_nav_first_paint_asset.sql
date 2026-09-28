set heading off
set feedback off
connect -name IMART

select id || '|' || file_name
  from apex_260100.wwv_flow_static_files
 where flow_id = 105
   and file_name = 'hspl-nav-hierarchy-v22.css';

select css_file_urls
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

exit
