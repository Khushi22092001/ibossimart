prompt --application/shared_components/navigation/lists/dashboard
begin
--   Manifest
--     LIST: Dashboard
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
 p_id=>wwv_flow_imp.id(433946979781359902)
,p_name=>'Dashboard'
,p_static_id=>'dashboard'
,p_version_scn=>'8803030'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(433947212079359902)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'360  View'
,p_static_id=>'360-view'
,p_list_item_link_target=>'f?p=&APP_ID.:519:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(433947596790359902)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Portlet'
,p_static_id=>'portlet'
,p_list_item_link_target=>'f?p=&APP_ID.:500:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(37838275908661034)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Task Dashboard'
,p_static_id=>'task-dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:360:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-ai-sparkle-enlarge'
,p_required_patch=>wwv_flow_imp.id(566517713432257061)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
