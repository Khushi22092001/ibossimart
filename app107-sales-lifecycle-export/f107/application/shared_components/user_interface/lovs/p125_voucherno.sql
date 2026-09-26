prompt --application/shared_components/user_interface/lovs/p125_voucherno
begin
--   Manifest
--     P125_VOUCHERNO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(461911168748816833)
,p_lov_name=>'P125_VOUCHERNO'
,p_static_id=>'p125-voucherno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DocTypecode, voucherno, tno, VoucherDate',
'from voucher a',
'where ( :P125_FROMDATE is null or a.voucherdate >= :P125_FROMDATE )',
'  and ( :P125_TODATE is null or a.voucherdate <= :P125_TODATE )',
'order by 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'VOUCHERNO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(461911600473821925)
,p_query_column_name=>'DOCTYPECODE'
,p_heading=>'Doc Type'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(461912835948821926)
,p_query_column_name=>'TNO'
,p_display_sequence=>40
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(461912051388821926)
,p_query_column_name=>'VOUCHERDATE'
,p_heading=>'Date'
,p_display_sequence=>20
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(461912432219821926)
,p_query_column_name=>'VOUCHERNO'
,p_heading=>'Voucher No'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
