set pages 1000
set lines 4000
set long 100000
set feedback on
connect -name IMART
select files_version, css_file_urls, javascript_file_urls
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

select table_name
  from all_tables
 where owner = 'APEX_260100'
   and table_name like '%FILE%'
 order by table_name;

select column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_STATIC_FILES'
 order by column_id;

select id, file_name, dbms_lob.getlength(file_content) as bytes, last_updated_on
  from apex_260100.wwv_flow_static_files
 where flow_id = 105
   and security_group_id = 4744311978888504
   and file_name in ('hspl-theme.js', 'hspl-theme.css', 'hspl-dummy-button-guard.js')
 order by file_name, id;
exit
