prompt --application/shared_components/navigation/lists/company
begin
--   Manifest
--     LIST: Company
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
 p_id=>wwv_flow_imp.id(568304926503255102)
,p_name=>'Company'
,p_static_id=>'company'
,p_version_scn=>'4388337206'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(568316871007255118)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Attributes'
,p_static_id=>'attributes'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(568306223564255109)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'General'
,p_static_id=>'general'
,p_list_item_link_target=>'f?p=&APP_ID.:14:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(568309269439255115)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Office Address'
,p_static_id=>'office-address'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(568313058065255117)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Work Address'
,p_static_id=>'work-address'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
