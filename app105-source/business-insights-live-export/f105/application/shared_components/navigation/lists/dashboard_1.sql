prompt --application/shared_components/navigation/lists/dashboard
begin
--   Manifest
--     LIST: Dashboard
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(441488469590062652)
,p_name=>'Dashboard'
,p_static_id=>'dashboard'
,p_version_scn=>'8803030'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(441488701888062652)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'360  View'
,p_static_id=>'360-view'
,p_list_item_link_target=>'f?p=&APP_ID.:519:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2026092309013000)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Business Insights'
,p_static_id=>'business-insights'
,p_list_item_link_target=>'f?p=&APP_ID.:901:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-chart-bar'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(441489086599062652)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Portlet'
,p_static_id=>'portlet'
,p_list_item_link_target=>'f?p=&APP_ID.:500:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(45379765717363784)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Task Dashboard'
,p_static_id=>'task-dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:360:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-ai-sparkle-enlarge'
,p_required_patch=>wwv_flow_imp.id(574059203240959811)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
