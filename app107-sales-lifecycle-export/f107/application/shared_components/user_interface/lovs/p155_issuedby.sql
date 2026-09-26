prompt --application/shared_components/user_interface/lovs/p155_issuedby
begin
--   Manifest
--     P155_ISSUEDBY
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
 p_id=>wwv_flow_imp.id(471074188029310752)
,p_lov_name=>'P155_ISSUEDBY'
,p_static_id=>'p155-issuedby'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select partyname , partycode , getcityname(officecitycode) as city from party     ',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'and partytypecode in (''SUPPLIER'',''AGENT'')',
'AND :P155_DOCTYPECODE = ''PURCHASE''',
'UNION ALL',
'select partyname , partycode , getcityname(officecitycode) as city from party     ',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'and partytypecode in (''SUPPLIER'',''CONTRACTOR'',''CUSTOMER'')',
'AND :P155_DOCTYPECODE = ''SALE''',
'UNION ALL',
'select partyname , partycode , getcityname(officecitycode) as city from party     ',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'and partytypecode in (''CUSTOMER'')',
'AND :P155_DOCTYPECODE = ''SALERETURN'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'PARTYCODE'
,p_display_column_name=>'PARTYNAME'
,p_default_sort_column_name=>'PARTYNAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(471076213275317044)
,p_query_column_name=>'CITY'
,p_heading=>'City'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(471075460172317044)
,p_query_column_name=>'PARTYCODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(471075794412317044)
,p_query_column_name=>'PARTYNAME'
,p_heading=>'Party'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
