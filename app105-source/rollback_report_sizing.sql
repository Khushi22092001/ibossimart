whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART
update apex_260100.wwv_flows set
 css_file_urls=regexp_replace(css_file_urls,'([[:space:]]*#APP_FILES#report-column-sizing[.]css[^[:space:]]*)',''),
 javascript_file_urls=regexp_replace(javascript_file_urls,'([[:space:]]*#APP_FILES#report-column-sizing[.]js[^[:space:]]*)',''),
 last_updated_on=sysdate
where id=105 and security_group_id=4744311978888504;
begin
wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
wwv_flow_imp_shared.clear_cache;
wwv_flow_imp.component_end;
end;
/
commit;
exit
