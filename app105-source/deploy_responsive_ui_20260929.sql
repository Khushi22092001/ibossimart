whenever sqlerror exit sql.sqlcode rollback
set define off serveroutput on
connect -name IMART
declare
  l_conflicts number;
begin
  select count(*) into l_conflicts from apex_application_static_files
   where application_id=105 and application_file_id=15254479808702854
     and file_name<>'hspl-responsive-ui.css';
  if l_conflicts>0 then raise_application_error(-20001,'Static component ID already belongs to another file.'); end if;
  select count(*) into l_conflicts
    from v$session s join v$sql q on q.sql_id=s.sql_id and q.child_number=s.sql_child_number
   where s.status='ACTIVE' and s.type='USER'
     and s.audsid<>sys_context('USERENV','SESSIONID')
     and upper(q.sql_fulltext) like '%WWV_FLOW_IMP%';
  if l_conflicts>0 then raise_application_error(-20002,'An APEX import is active; no changes made.'); end if;
end;
/
@@deploy_responsive_ui_css_20260929.sql
update apex_260100.wwv_flows
   set css_file_urls=case when instr(css_file_urls,'#APP_FILES#hspl-responsive-ui.css')>0
       then regexp_replace(css_file_urls,'(#APP_FILES#hspl-responsive-ui[.]css)[^[:space:]]*','\1?cb=20260929responsive8')
       else rtrim(css_file_urls) || chr(10) || '#APP_FILES#hspl-responsive-ui.css?cb=20260929responsive8' end,
       files_version=files_version+1,
       version_scn=dbms_flashback.get_system_change_number,
       last_updated_on=sysdate
 where id=105 and security_group_id=4744311978888504;
commit;
begin
  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;
prompt RESPONSIVE_UI_CSS_DEPLOYED
exit
