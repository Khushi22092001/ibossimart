prompt --application/shared_components/logic/application_processes/open_inbound_workflow_module
begin
--   Manifest
--     APPLICATION PROCESS: OPEN_INBOUND_WORKFLOW_MODULE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(900000000000144)
,p_process_sequence=>11
,p_process_point=>'ON_DEMAND'
,p_process_name=>'OPEN_INBOUND_WORKFLOW_MODULE'
,p_static_id=>'open-inbound-workflow-module'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'declare',
'  l_module_code module.modulecode%type := upper(trim(apex_application.g_x01));',
'  l_page_id     number;',
'begin',
'  select m.pageno',
'    into l_page_id',
'    from module m',
'   where m.modulecode = l_module_code',
'     and upper(nvl(m.isactive, ''NO'')) = ''YES''',
'     and exists (',
'       select 1',
'         from moduleprivilege mp',
'         join bossuser bu on bu.bossusercode = mp.bossusercode',
'        where mp.modulecode = m.modulecode',
'          and upper(bu.bossusername) = upper(v(''APP_USER''))',
'          and mp.companycode = v(''GLOBAL_COMPANYCODE'')',
'          and upper(nvl(mp.viewprivilege, ''NO'')) = ''YES''',
'     );',
'',
'  apex_json.open_object;',
'  apex_json.write(''allowed'', true);',
'  apex_json.write(''pageId'', l_page_id);',
'  apex_json.close_object;',
'exception',
'  when no_data_found then',
'    apex_json.open_object;',
'    apex_json.write(''allowed'', false);',
'    apex_json.close_object;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp.component_end;
end;
/
