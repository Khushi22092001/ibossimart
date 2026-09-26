whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

select case when instr(javascript_file_urls,
         'hspl-theme.js?version=#APP_VERSION#&cb=20260925registerpaint1') > 0
       then 'YES' else 'NO' end as js_registerpaint1
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

select case when dbms_lob.instr(file_content,
         utl_raw.cast_to_raw('same parser task')) > 0
       then 'YES' else 'NO' end as synchronous_shell,
       case when dbms_lob.instr(file_content,
         utl_raw.cast_to_raw('two-requestAnimationFrame delay')) > 0
       then 'YES' else 'NO' end as synchronous_header_geometry,
       case when dbms_lob.instr(file_content,
         utl_raw.cast_to_raw('document.fonts.ready.then(attachNativeScrollSync)')) = 0
       then 'YES' else 'NO' end as no_late_font_geometry
  from apex_260100.wwv_flow_static_files
 where flow_id = 105
   and security_group_id = 4744311978888504
   and file_name = 'hspl-theme.js';

exit
