prompt --application/shared_components/user_interface/lovs/p168_party
begin
--   Manifest
--     P168_PARTY
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
 p_id=>wwv_flow_imp.id(454084241468570623)
,p_lov_name=>'P168_PARTY'
,p_static_id=>'p168-party'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.PartyName d,',
'a.PartyCode r ,',
'getcityname(a.officecitycode) as city',
'from Party a',
'where  a.PartyTypeCode in ( ''CUSTOMER'', ''SUPPLIER'')',
'and getdocumentstatuscode(''PARTY'',A.TNO)=''ACTIVE''',
'ORDER BY 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(454085574949574547)
,p_query_column_name=>'CITY'
,p_heading=>'City'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(454085127188574547)
,p_query_column_name=>'D'
,p_heading=>'Party'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(454084717229574547)
,p_query_column_name=>'R'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
