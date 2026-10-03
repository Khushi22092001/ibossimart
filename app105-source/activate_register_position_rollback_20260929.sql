-- Scoped regression rollback: only the first-paint CSS URL changes.
-- Original shared theme geometry, JS, queries, sidebar controller and preferences stay intact.
whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback off
connect -name IMART
begin
 update apex_260100.wwv_flows
 set css_file_urls=replace(css_file_urls,'hspl-register-first-paint.css?cb=20260929v3','hspl-register-first-paint.css?cb=20260929v4positionrollback')
 where id=105 and security_group_id=4744311978888504
 and dbms_lob.instr(css_file_urls,'hspl-register-first-paint.css?cb=20260929v3')>0;
 if sql%rowcount<>1 then raise_application_error(-20001,'Expected v3 first-paint CSS not found; no activation'); end if;
 wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
 wwv_flow_imp_shared.clear_cache;
 wwv_flow_imp.component_end;
end;
/
commit;
prompt POSITION_OVERRIDE_ROLLBACK_ACTIVATED
exit
