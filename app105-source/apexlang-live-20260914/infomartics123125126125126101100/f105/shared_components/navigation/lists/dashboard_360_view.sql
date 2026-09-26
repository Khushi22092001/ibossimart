prompt --application/shared_components/navigation/lists/dashboard_360_view
begin
--   Manifest
--     LIST: DASHBOARD 360 VIEW
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
 p_id=>wwv_flow_imp.id(433783546718933484)
,p_name=>'DASHBOARD 360 VIEW'
,p_static_id=>'dashboard-360-view'
,p_version_scn=>'4388337206'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(433783825588933484)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Customer'
,p_static_id=>'customer'
,p_list_item_link_target=>'f?p=&APP_ID.:510:&SESSION.::&DEBUG.:RP,510:::'
,p_list_item_icon=>'fa-shopping-bag'
,p_list_item_disp_cond_type=>'ALWAYS'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(433948752968371773)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Product'
,p_static_id=>'product'
,p_list_item_link_target=>'f?p=&APP_ID.:516:&SESSION.::&DEBUG.:RP,516:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(433784249308933484)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Supplier'
,p_static_id=>'supplier'
,p_list_item_link_target=>'f?p=&APP_ID.:513:&SESSION.::&DEBUG.:513:::'
,p_list_item_icon=>'fa-cart-arrow-down'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
