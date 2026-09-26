prompt --application/shared_components/navigation/search_config/imart_module_search
begin
--   Manifest
--     SEARCH CONFIG: Imart_Module_search
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_search_config(
 p_id=>wwv_flow_imp.id(49009379762382066)
,p_label=>'Imart_Module_search'
,p_static_id=>'imart_module_search'
,p_search_type=>'SIMPLE'
,p_location=>'LOCAL'
,p_query_type=>'SQL'
,p_query_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'     M.MODULECODE,',
'     M.MODULENAME as TITLE,',
'     ''f?p=&APP_ID.:'' || TO_CHAR(M.PAGENO) || '':&SESSION.:::::'' TARGET,',
'     M.PAGENO,',
'     ''Module --> ''||MG.MODULEGROUPNAME as BADGE_VALUE,',
'     ''YES'' As IS_CURRENT,',
'     ''u-color-'' || MOD(rownum, 20 + 1) as MY_COLOR_CLASS,',
'     MG.MODULEGROUPNAME',
'FROM MODULE M ',
'LEFT JOIN MODULEGROUP MG ON M.MODULEGROUPCODE = MG.MODULEGROUPCODE',
'WHERE EXISTS (',
'  SELECT 1',
'    FROM MODULEPRIVILEGE mp',
'   WHERE mp.MODULECODE       = m.MODULECODE',
'     AND mp.BOSSUSERCODE     = :GLOBAL_BOSSUSERCODE',
'     AND mp.COMPANYCODE      = :GLOBAL_COMPANYCODE',
'     AND mp.VIEWPRIVILEGE    = ''YES''',
')'))
,p_searchable_columns=>'TITLE:MODULECODE'
,p_pk_column_name=>'MODULECODE'
,p_title_column_name=>'TITLE'
,p_badge_column_name=>'BADGE_VALUE'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:&PAGENO.:&APP_SESSION.::&DEBUG.:::'
,p_result_css_classes=>'&MY_COLOR_CLASS.'
,p_version_scn=>'42867216'
);
wwv_flow_imp.component_end;
end;
/
