prompt --application/shared_components/user_interface/lovs/199_transporter
begin
--   Manifest
--     199_TRANSPORTER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(461701387872517657)
,p_lov_name=>'199_TRANSPORTER'
,p_static_id=>'199-transporter'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select transporter, transportercode , null as city from billforfreight ',
'union  */',
'select partyname as transporter , partycode as transportercode , getcityname(officecitycode) as city from party where partytypecode = ''TRANSPORTER'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TRANSPORTERCODE'
,p_display_column_name=>'TRANSPORTER'
,p_default_sort_column_name=>'TRANSPORTER'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(461702596139519691)
,p_query_column_name=>'CITY'
,p_heading=>'City'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(461702208021519691)
,p_query_column_name=>'TRANSPORTER'
,p_heading=>'Transporter'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(461701798123519691)
,p_query_column_name=>'TRANSPORTERCODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
