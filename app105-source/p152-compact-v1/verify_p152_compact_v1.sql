whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback off pagesize 100 linesize 32767 long 100000 longchunksize 100000
connect -name IMART

select file_name,
       mime_type,
       dbms_lob.getlength(file_content) bytes,
       case when dbms_lob.instr(file_content, utl_i18n.string_to_raw('HSPL_P152_COMPACT_LAYOUT_V1', 'AL32UTF8')) > 0
            then 'YES' else 'NO' end marker_present
  from apex_260100.wwv_flow_static_files
 where flow_id = 105
   and security_group_id = 4744311978888504
   and file_name in ('hspl-p152-compact-v1.js', 'hspl-p152-compact-v1.css')
 order by file_name;

select case when instr(css_file_urls, '#APP_FILES#hspl-p152-compact-v1.css') > 0 then 'YES' else 'NO' end css_linked,
       case when instr(javascript_file_urls, '#APP_FILES#hspl-p152-compact-v1.js') > 0 then 'YES' else 'NO' end js_linked,
       case when instr(css_file_urls, 'cb=20261003v1') > 0 then 'YES' else 'NO' end css_cache_key,
       case when instr(javascript_file_urls, 'cb=20261003v1') > 0 then 'YES' else 'NO' end js_cache_key
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 152
   and security_group_id = 4744311978888504;

exit
