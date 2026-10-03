whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on
connect -name IMART

begin
  apex_util.set_security_group_id(4744311978888504);

  update apex_260100.wwv_flow_steps
     set css_file_urls = trim(regexp_replace(css_file_urls,
           '[[:space:]]*#APP_FILES#hspl-p118-compact-v2[.]css[^[:space:]]*', '')),
         javascript_file_urls = trim(regexp_replace(javascript_file_urls,
           '[[:space:]]*#APP_FILES#hspl-p118-compact-v2[.]js[^[:space:]]*', '')),
         last_updated_on = sysdate,
         last_updated_by = 'CODEX'
   where flow_id = 105
     and id = 118
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Expected exactly one Page 118 rollback update');
  end if;

  delete from apex_260100.wwv_flow_static_files
   where flow_id = 105
     and security_group_id = 4744311978888504
     and file_name in ('hspl-p118-compact-v2.js', 'hspl-p118-compact-v2.css');

  update apex_260100.wwv_flows
     set files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate,
         last_updated_by = 'CODEX'
   where id = 105
     and security_group_id = 4744311978888504;

  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30', p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504, p_default_application_id=>105,
    p_default_id_offset=>7541489808702750, p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
  commit;
end;
/

prompt P118_COMPACT_LAYOUT_V2_ROLLED_BACK
exit
