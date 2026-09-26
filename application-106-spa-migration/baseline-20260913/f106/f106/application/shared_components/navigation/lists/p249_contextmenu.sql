prompt --application/shared_components/navigation/lists/p249_contextmenu
begin
--   Manifest
--     LIST: P249_CONTEXTMENU
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(297637733663841030)
,p_name=>'P249_CONTEXTMENU'
,p_static_id=>'p249-contextmenu'
,p_version_scn=>'4388337206'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(297637940839841107)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Show Ledger'
,p_static_id=>'show-ledger'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
