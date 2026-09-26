prompt --application/shared_components/user_interface/lovs/p175_salesorder
begin
--   Manifest
--     P175_SALESORDER
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
 p_id=>wwv_flow_imp.id(462775884570584275)
,p_lov_name=>'P175_SALESORDER'
,p_static_id=>'p175-salesorder'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.salesorderno , A.tno ,A.salesorderdate  from salesorder A',
'where a.locationcode = :P175_LOCATIONCODE'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'SALESORDERNO'
,p_version_scn=>'7895410127'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(462777249357595729)
,p_query_column_name=>'SALESORDERDATE'
,p_heading=>'Date'
,p_display_sequence=>20
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(462776844423595729)
,p_query_column_name=>'SALESORDERNO'
,p_heading=>'Sales Order No'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(462776449262595729)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
