prompt --application/shared_components/navigation/lists/p252_contextmenu
begin
--   Manifest
--     LIST: P252_CONTEXTMENU
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
 p_id=>wwv_flow_imp.id(298076294457446156)
,p_name=>'P252_CONTEXTMENU'
,p_static_id=>'p252-contextmenu'
,p_version_scn=>'4388337206'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(298076829857446176)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Show Daily Summary'
,p_static_id=>'show-daily-summary'
,p_list_item_link_target=>'f?p=&APP_ID.:250:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(298076498569446158)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Show Monthly Summary'
,p_static_id=>'show-monthly-summary'
,p_list_item_link_target=>'f?p=&APP_ID.:249:&SESSION.::&DEBUG.::P249_CALLEDFROMPAGE:252:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
