set define off
set pages 100
set lines 240
connect -name IMART

select dbms_lob.getlength(file_content) as javascript_bytes,
       dbms_lob.instr(file_content, utl_i18n.string_to_raw('HSPL_P118_RUNTIME_LAYOUT_V4', 'AL32UTF8')) as general_layout_marker,
       dbms_lob.instr(file_content, utl_i18n.string_to_raw('HSPL_P118_QUANTITY_VERTICAL_ALIGNMENT_V2', 'AL32UTF8')) as quantity_marker,
       dbms_lob.instr(file_content, utl_i18n.string_to_raw('HSPL_P118_DETAIL_TOTALS_HORIZONTAL_V1', 'AL32UTF8')) as detail_totals_marker
  from apex_260100.wwv_flow_static_files
 where flow_id = 105
   and security_group_id = 4744311978888504
   and file_name = 'hspl-theme.js';

select javascript_file_urls, files_version
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

select count(*) as active_apex_imports
  from v$session session_info
  join v$sql sql_text
    on sql_text.sql_id = session_info.sql_id
   and sql_text.child_number = session_info.sql_child_number
 where session_info.status = 'ACTIVE'
   and session_info.type = 'USER'
   and session_info.audsid <> sys_context('USERENV', 'SESSIONID')
   and upper(sql_text.sql_fulltext) like '%WWV_FLOW_IMP%';

exit
