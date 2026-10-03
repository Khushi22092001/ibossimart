whenever sqlerror exit failure rollback
set define off serveroutput on
connect -name IMART
declare
  l_active number;
begin
  select count(*) into l_active from v$session s join v$sql q on q.sql_id=s.sql_id and q.child_number=s.sql_child_number
  where s.status='ACTIVE' and s.type='USER' and s.audsid<>sys_context('USERENV','SESSIONID') and upper(q.sql_fulltext) like '%WWV_FLOW_IMP%';
  if l_active>0 then raise_application_error(-20001,'An APEX import is active; no changes made.'); end if;
end;
/
@@deploy_ig_height_asset_20260929.sql
update apex_260100.wwv_flows
set javascript_file_urls=regexp_replace(javascript_file_urls,'#APP_FILES#hspl-detail-scroll[.]js[^[:space:]]*','#APP_FILES#hspl-detail-scroll.js?cb=20260929rows4'),
    files_version=files_version+1, version_scn=dbms_flashback.get_system_change_number, last_updated_on=sysdate
where id=105 and security_group_id=4744311978888504;
begin
  apex_util.set_security_group_id(4744311978888504);
  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;
prompt IG_DYNAMIC_HEIGHT_DEPLOYED
exit
