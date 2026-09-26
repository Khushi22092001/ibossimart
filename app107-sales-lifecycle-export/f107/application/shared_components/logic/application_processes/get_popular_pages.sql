prompt --application/shared_components/logic/application_processes/get_popular_pages
begin
--   Manifest
--     APPLICATION PROCESS: GET_POPULAR_PAGES
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(10380203831466507)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_name=>'GET_POPULAR_PAGES'
,p_static_id=>'get-popular-pages'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'declare',
'begin',
'  apex_json.initialize_clob_output;',
'  apex_json.open_object;',
'  apex_json.open_array(''pages'');',
'  for r in (',
'    select target_page_id as page_id,',
'           max(page_name) keep (dense_rank last order by view_timestamp) as page_name,',
'           count(*) as visit_count',
'      from (',
'        select nvl((select max(m.pageno)',
'                      from module m',
'                     where m.entrypageno = a.page_id), a.page_id) as target_page_id,',
'               a.page_name,',
'               a.view_timestamp',
'          from apex_260100.apex_workspace_activity_log a',
'         where a.workspace_id = 4744311978888504',
'           and a.application_id = 105',
'           and upper(a.apex_user) = upper(v(''APP_USER''))',
'           and a.page_id not in (0, 1)',
'           and a.page_name is not null',
'      )',
'     group by target_page_id',
'     order by count(*) desc, max(view_timestamp) desc',
'     fetch first 8 rows only',
'  ) loop',
'    apex_json.open_object;',
'    apex_json.write(''pageId'', r.page_id);',
'    apex_json.write(''pageName'', r.page_name);',
'    apex_json.write(''visitCount'', r.visit_count);',
'    apex_json.close_object;',
'  end loop;',
'  apex_json.close_array;',
'  apex_json.close_object;',
'  sys.htp.prn(apex_json.get_clob_output);',
'  apex_json.free_output;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp.component_end;
end;
/
