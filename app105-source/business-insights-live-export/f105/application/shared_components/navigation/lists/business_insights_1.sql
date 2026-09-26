prompt --application/shared_components/navigation/lists/business_insights
begin
--   Manifest
--     LIST: Business Insights
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
 p_id=>wwv_flow_imp.id(2026092309011000)
,p_name=>'Business Insights'
,p_static_id=>'business-insights'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2026092309011010)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Accounts'
,p_static_id=>'accounts'
,p_list_item_link_target=>'f?p=&APP_ID.:902:&SESSION.::&DEBUG.:902::'
,p_list_item_icon=>'fa-calculator'
,p_list_item_current_type=>'NEVER'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2026092309011060)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Inventory'
,p_static_id=>'inventory'
,p_list_item_icon=>'fa-cubes'
,p_list_item_current_type=>'NEVER'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2026092309011050)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Payable'
,p_static_id=>'payable'
,p_list_item_link_target=>'f?p=&APP_ID.:920:&SESSION.::&DEBUG.:920::'
,p_list_item_icon=>'fa-arrow-circle-up'
,p_list_item_current_type=>'NEVER'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2026092309011020)
,p_list_item_display_sequence=>15
,p_list_item_link_text=>'Profit and Loss Summary'
,p_static_id=>'profit-loss-summary'
,p_list_item_link_target=>'f?p=&APP_ID.:904:&SESSION.::&DEBUG.:904::'
,p_list_item_icon=>'fa-area-chart'
,p_list_item_current_type=>'NEVER'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2026092309011022)
,p_list_item_display_sequence=>25
,p_list_item_link_text=>'Purchase Analytics'
,p_static_id=>'purchase-analytics'
,p_list_item_link_target=>'f?p=&APP_ID.:940:&SESSION.::&DEBUG.:940::'
,p_list_item_icon=>'fa-line-chart'
,p_list_item_current_type=>'NEVER'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2026092309011021)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Purchase Command Center'
,p_static_id=>'purchase-command-center'
,p_list_item_link_target=>'f?p=&APP_ID.:934:&SESSION.::&DEBUG.:934::'
,p_list_item_icon=>'fa-cart-check'
,p_list_item_current_type=>'NEVER'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2026092309011040)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Receivable'
,p_static_id=>'receivable'
,p_list_item_link_target=>'f?p=&APP_ID.:907:&SESSION.::&DEBUG.:907::'
,p_list_item_icon=>'fa-arrow-circle-down'
,p_list_item_current_type=>'NEVER'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2026092309011030)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sales Lifecycle'
,p_static_id=>'sales-lifecycle'
,p_list_item_link_target=>'f?p=&APP_ID.:721:&SESSION.::&DEBUG.:721::'
,p_list_item_icon=>'fa-line-chart'
,p_list_item_current_type=>'NEVER'
);
wwv_flow_imp.component_end;
end;
/
