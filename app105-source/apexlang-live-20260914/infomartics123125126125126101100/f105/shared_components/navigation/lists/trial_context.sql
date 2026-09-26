prompt --application/shared_components/navigation/lists/trial_context
begin
--   Manifest
--     LIST: trial_context
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
 p_id=>wwv_flow_imp.id(287918712133772062)
,p_name=>'trial_context'
,p_static_id=>'trial-context'
,p_version_scn=>'8801418'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(287919393949772093)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Show Daily Summary'
,p_static_id=>'show-daily-summary'
,p_list_item_link_target=>'f?p=&APP_ID.:250:&SESSION.::&DEBUG.:250:P250_CALLEDFROMPAGE:401:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(287918897885772084)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Show Monthly Summary'
,p_static_id=>'show-monthly-summary'
,p_list_item_link_target=>'f?p=&APP_ID.:249:&SESSION.::&DEBUG.:RP,249:P249_CALLEDFROMPAGE:401:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(37837863387649677)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Task Dashboard'
,p_static_id=>'task-dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:360:&SESSION.::&DEBUG.:360:::'
,p_list_item_icon=>'fa-ai-sparkle-enlarge'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
