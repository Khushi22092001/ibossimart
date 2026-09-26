prompt --application/shared_components/navigation/lists/daily_summary
begin
--   Manifest
--     LIST: Daily Summary
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>1466918471259373
,p_default_application_id=>100
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(288607816223109140)
,p_name=>'Daily Summary'
,p_static_id=>'daily-summary'
,p_version_scn=>'4388337206'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(288608060718109164)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Show Daily Summary'
,p_static_id=>'show-daily-summary'
,p_list_item_link_target=>'f?p=&APP_ID.:250:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
