prompt --application/shared_components/user_interface/lovs/p292_party1
begin
--   Manifest
--     P292_PARTY1
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
 p_id=>wwv_flow_imp.id(178090980434772799)
,p_lov_name=>'P292_PARTY1'
,p_static_id=>'p292-party-2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select partyname , partycode , getcityname(officecitycode) as city from party',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'and partytypecode in (''CUSTOMER'',''AGENT'')',
'and :P292_DOCTYPECODE = ''SALE''',
'union all   ',
'select partyname , partycode , getcityname(officecitycode) as city from party',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'and partytypecode in (''SUPPLIER'',''AGENT'')',
'and :P292_DOCTYPECODE = ''PURCHASERETURN'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'PARTYCODE'
,p_display_column_name=>'PARTYNAME'
,p_default_sort_column_name=>'PARTYNAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'35945410'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(178092210115772799)
,p_query_column_name=>'CITY'
,p_heading=>'City'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(178091434624772799)
,p_query_column_name=>'PARTYCODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(178091754095772799)
,p_query_column_name=>'PARTYNAME'
,p_heading=>'Party'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
