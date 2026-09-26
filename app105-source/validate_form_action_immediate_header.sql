whenever sqlerror exit failure rollback
set define off
connect -name IMART

select case
         when dbms_lob.instr(file_content, utl_raw.cast_to_raw('Build in this')) > 0
         then 'IMMEDIATE_BOOT_PRESENT'
         else 'IMMEDIATE_BOOT_MISSING'
       end js_contract
  from apex_application_static_files
 where application_id = 105
   and file_name = 'hspl-theme.js';

select case
         when instr(javascript_file_urls, '#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260925formactions1') = 1
         then 'NEW_JS_FIRST'
         else 'NEW_JS_NOT_FIRST'
       end load_position
  from apex_260100.wwv_flows
 where id = 105;

exit
