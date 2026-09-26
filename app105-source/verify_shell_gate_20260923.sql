whenever sqlerror exit failure rollback
set define off
connect -name IMART
set lines 240 pages 100

select files_version, javascript_file_urls, css_file_urls
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

select file_name,
       dbms_lob.getlength(file_content) bytes
  from apex_260100.wwv_flow_static_files
 where flow_id = 105
   and security_group_id = 4744311978888504
   and file_name in ('hspl-theme.js','hspl-theme.css')
 order by file_name;

select name, grid_column, colspan, grid_label_column_span
  from apex_260100.wwv_flow_step_items
 where flow_id = 105
   and flow_step_id = 902
   and name in ('P902_LEVEL','P902_ACCOUNTGROUP','P902_LEDGERONLY','P902_ZERO','P902_NOMOVE')
 order by name;

exit
