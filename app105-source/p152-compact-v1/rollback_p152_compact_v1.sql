whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on
connect -name IMART

begin
  apex_util.set_security_group_id(4744311978888504);
  delete from apex_260100.wwv_flow_static_files
   where flow_id = 105
     and security_group_id = 4744311978888504
     and file_name in ('hspl-p152-compact-v1.js','hspl-p152-compact-v1.css');

  update apex_260100.wwv_flow_steps
     set css_file_urls = trim(regexp_replace(css_file_urls, '[[:space:]]*#APP_FILES#hspl-p152-compact-v1[.]css[^[:space:]]*', '')),
         javascript_file_urls = trim(regexp_replace(javascript_file_urls, '[[:space:]]*#APP_FILES#hspl-p152-compact-v1[.]js[^[:space:]]*', '')),
         last_updated_on = sysdate,
         last_updated_by = 'CODEX'
   where flow_id = 105
     and id = 152
     and security_group_id = 4744311978888504;

  update apex_260100.wwv_flows
     set files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate,
         last_updated_by = 'CODEX'
   where id = 105
     and security_group_id = 4744311978888504;

  wwv_flow_imp_shared.clear_cache;
  commit;
end;
/
prompt P152_COMPACT_LAYOUT_V1_ROLLED_BACK
exit
