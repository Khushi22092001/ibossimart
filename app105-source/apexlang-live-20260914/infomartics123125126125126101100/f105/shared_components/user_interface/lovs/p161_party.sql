prompt --application/shared_components/user_interface/lovs/p161_party
begin
--   Manifest
--     P161_PARTY
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
 p_id=>wwv_flow_imp.id(454081376520545037)
,p_lov_name=>'P161_PARTY'
,p_static_id=>'p161-party'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select partyname, partycode , getcityname(officecitycode) as city from party a',
'where a.partytypecode in (''CUSTOMER'',''AGENT'')',
'and getdocumentstatuscode(''PARTY'',A.TNO)=''ACTIVE''',
'and :P161_DOCTYPECODE = ''SALE''',
'/*and :P161_PARTYTYPECODE = ''AGENT''',
'UNION ALL',
'select partyname, partycode , getcityname(officecitycode) as city from party a',
'where :P161_PARTYTYPECODE != ''AGENT''',
'AND EXISTS ( SELECT 1 FROM SALESORDER AA WHERE AA.TNO = :p161_referencetno)*/',
'union all  ',
'select partyname, partycode , getcityname(officecitycode) as city from party a',
'where a.partytypecode in (''CONTRACTOR'', ''SUPPLIER'')',
'and getdocumentstatuscode(''PARTY'',A.TNO)=''ACTIVE''',
'and :P161_DOCTYPECODE = ''CONVERSIONJOBOUTOFPREMISES''',
'union all  ',
'select partyname, partycode , getcityname(officecitycode) as city from party a',
'where a.partytypecode in (''SUPPLIER'')',
'and getdocumentstatuscode(''PARTY'',A.TNO)=''ACTIVE''',
'and :P161_DOCTYPECODE = ''PURCHASERETURN'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'PARTYCODE'
,p_display_column_name=>'PARTYNAME'
,p_default_sort_column_name=>'PARTYNAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'30156795'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(454082606854549819)
,p_query_column_name=>'CITY'
,p_heading=>'City'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(454081813617549818)
,p_query_column_name=>'PARTYCODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(454082276764549819)
,p_query_column_name=>'PARTYNAME'
,p_heading=>'Party'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
