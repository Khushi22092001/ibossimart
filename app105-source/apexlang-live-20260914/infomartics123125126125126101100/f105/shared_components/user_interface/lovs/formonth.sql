prompt --application/shared_components/user_interface/lovs/formonth
begin
--   Manifest
--     FORMONTH
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>1466918471259373
,p_default_application_id=>100
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(448309378109366261)
,p_lov_name=>'FORMONTH'
,p_static_id=>'formonth'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT ',
'    TO_CHAR(DAYDATE,''Mon-YYYY'') AS MONTH,',
'    TRUNC(DAYDATE,''MM'') AS FROMDATE,',
'    LAST_DAY(DAYDATE) AS TODATE,',
'    LAST_DAY(DAYDATE)-TRUNC(DAYDATE,''MM'')+1 TOTAL_DAYS',
'FROM DATELIST'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'MONTH'
,p_display_column_name=>'MONTH'
,p_default_sort_column_name=>'MONTH'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4393081241'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(448331566092494476)
,p_query_column_name=>'FROMDATE'
,p_heading=>'Fromdate'
,p_display_sequence=>10
,p_data_type=>'DATE'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(448325881291450690)
,p_query_column_name=>'MONTH'
,p_heading=>'For Month'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(448331945442494477)
,p_query_column_name=>'TODATE'
,p_heading=>'Todate'
,p_display_sequence=>20
,p_data_type=>'DATE'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(453579485642336808)
,p_query_column_name=>'TOTAL_DAYS'
,p_heading=>'Total Days'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
);
wwv_flow_imp.component_end;
end;
/
