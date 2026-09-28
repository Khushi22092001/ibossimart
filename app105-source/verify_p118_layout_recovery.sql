set pagesize 100
set linesize 220
connect -name IMART

select dbms_lob.instr(file_content, utl_i18n.string_to_raw('HSPL_P118_LAYOUT_RECOVERY_V1', 'AL32UTF8')) as p118_recovery_marker,
       dbms_lob.getlength(file_content) as javascript_bytes
  from apex_260100.wwv_flow_static_files
 where flow_id = 105
   and security_group_id = 4744311978888504
   and file_name = 'hspl-theme.js';
