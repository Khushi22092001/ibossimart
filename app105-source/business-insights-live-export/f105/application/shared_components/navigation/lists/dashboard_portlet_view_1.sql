prompt --application/shared_components/navigation/lists/dashboard_portlet_view
begin
--   Manifest
--     LIST: Dashboard Portlet View
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
 p_id=>wwv_flow_imp.id(441319732137631757)
,p_name=>'Dashboard Portlet View'
,p_static_id=>'dashboard-portlet-view'
,p_version_scn=>'4388337206'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(441322412972631759)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Account Dashboard'
,p_static_id=>'account-dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:520:&SESSION.::&DEBUG.:520:::'
,p_list_item_icon=>'fa-money'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(441322003781631759)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'HR Dashboard'
,p_static_id=>'hr-dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:509:&SESSION.::&DEBUG.:509:::'
,p_list_item_icon=>'fa-venus-double'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(441321574536631759)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Issue Analysis'
,p_static_id=>'issue-analysis'
,p_list_item_link_target=>'f?p=&APP_ID.:503:&SESSION.::&DEBUG.:503:::'
,p_list_item_icon=>'fa-donut-chart'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(441320426921631759)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Purchase'
,p_static_id=>'purchase'
,p_list_item_link_target=>'f?p=&APP_ID.:502:&SESSION.::&DEBUG.:502:::'
,p_list_item_icon=>'fa-cart-check'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(441321178105631759)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Purchase Dashboard'
,p_static_id=>'purchase-dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:506:&SESSION.::&DEBUG.:506:::'
,p_list_item_icon=>'fa-cart-arrow-down'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(441320026589631758)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Revenue'
,p_static_id=>'revenue'
,p_list_item_link_target=>'f?p=&APP_ID.:501:&SESSION.::&DEBUG.:501:::'
,p_list_item_icon=>'fa-area-chart'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(441320769492631759)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sales Dashboard'
,p_static_id=>'sales-dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:504:&SESSION.::&DEBUG.:504:::'
,p_list_item_icon=>'fa-crosshairs'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(441322835434631759)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Trade Analysis'
,p_static_id=>'trade-analysis'
,p_list_item_link_target=>'f?p=&APP_ID.:521:&SESSION.::&DEBUG.:RP,521:::'
,p_list_item_icon=>'fa-area-chart'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
