prompt --application/shared_components/navigation/search_config/transaction_search
begin
--   Manifest
--     SEARCH CONFIG: Transaction Search
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_search_config(
 p_id=>wwv_flow_imp.id(58490105996856991)
,p_label=>'Transaction Search'
,p_static_id=>'transaction_search'
,p_search_prefix=>'TNO'
,p_search_type=>'SIMPLE'
,p_location=>'LOCAL'
,p_query_type=>'SQL'
,p_query_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'     x.TNO,',
'     x.TRANSACTION_NO,',
'     x.TRANSACTION_DATE,',
'     x.BADGE_VALUE,',
'     GetDocumentStatusCode(x.BADGE_VALUE,x.TNO) AS STATUS,',
'     M.ENTRYPAGENO AS ENTRYPAGENO,',
'     ''P''||M.ENTRYPAGENO||''_TNO'' AS TARGETPAGEITEM,',
'     ''u-color-'' || MOD(rownum, 20 + 1) as MY_COLOR_CLASS    ',
'FROM ERP_GLOBAL_SEARCH_VW x ',
'LEFT JOIN MODULE M ON X.BADGE_VALUE = M.MODULECODE',
'LEFT JOIN MODULEPRIVILEGE mp ON mp.MODULECODE = m.MODULECODE',
'WHERE MP.BOSSUSERCODE       = :GLOBAL_BOSSUSERCODE',
'  AND MP.COMPANYCODE        = :GLOBAL_COMPANYCODE',
'  AND MP.VIEWPRIVILEGE      = ''YES''',
'  AND x.FINANCIALYEARCODE   = :GLOBAL_FINANCIALYEARCODE',
'  AND x.COMPANYCODE         = :GLOBAL_COMPANYCODE'))
,p_searchable_columns=>'TRANSACTION_NO'
,p_pk_column_name=>'TNO'
,p_title_column_name=>'TRANSACTION_NO'
,p_subtitle_column_name=>'TRANSACTION_DATE'
,p_badge_column_name=>'BADGE_VALUE'
,p_custom_01_column_name=>'STATUS'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:&ENTRYPAGENO.:&APP_SESSION.::&DEBUG.::&TARGETPAGEITEM.:&TNO.'
,p_result_css_classes=>'&MY_COLOR_CLASS.'
,p_version_scn=>'37013683'
);
wwv_flow_imp.component_end;
end;
/
