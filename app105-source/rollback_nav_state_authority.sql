whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_urls clob;
begin
  select javascript_file_urls into l_urls
    from apex_260100.wwv_flows
   where id=105 and security_group_id=4744311978888504 for update;

  l_urls := regexp_replace(
    l_urls,
    '([[:space:]]*#APP_FILES#hspl-nav-state-authority[.]js[^[:space:]]*)',
    ''
  );

  update apex_260100.wwv_flows
     set javascript_file_urls=rtrim(l_urls),
         files_version=files_version+1,
         version_scn=dbms_flashback.get_system_change_number,
         last_updated_on=sysdate
   where id=105 and security_group_id=4744311978888504;
end;
/
commit;

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30', p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504, p_default_application_id=>105,
    p_default_id_offset=>7541489808702750, p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select case when instr(javascript_file_urls, 'hspl-nav-state-authority.js')=0
            then 'AUTHORITY_ROLLED_BACK' else 'AUTHORITY_STILL_PRESENT' end as status
  from apex_260100.wwv_flows
 where id=105 and security_group_id=4744311978888504;
exit
