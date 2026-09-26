prompt --application/shared_components/user_interface/lovs/155_supplier
begin
--   Manifest
--     155_SUPPLIER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(461657604212831780)
,p_lov_name=>'155_SUPPLIER'
,p_static_id=>'155-supplier'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select partyname , partycode , getcityname(officecitycode) as city , officecitycode from party     ',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'AND PARTYTYPECODE IN (''SUPPLIER'' , ''AGENT'')',
'and :P155_DOCTYPECODE != ''SALERETURN''',
'union all',
'select partyname , partycode , getcityname(officecitycode) as city, officecitycode from party     ',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'AND PARTYTYPECODE IN (''CUSTOMER'')',
'and :P155_DOCTYPECODE = ''SALERETURN'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'PARTYCODE'
,p_display_column_name=>'PARTYNAME'
,p_default_sort_column_name=>'PARTYNAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(461659004361835100)
,p_query_column_name=>'CITY'
,p_heading=>'City'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(499125801378055603)
,p_query_column_name=>'OFFICECITYCODE'
,p_heading=>'Officecitycode'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(461658189508835100)
,p_query_column_name=>'PARTYCODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(461658623399835100)
,p_query_column_name=>'PARTYNAME'
,p_heading=>'Party'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
