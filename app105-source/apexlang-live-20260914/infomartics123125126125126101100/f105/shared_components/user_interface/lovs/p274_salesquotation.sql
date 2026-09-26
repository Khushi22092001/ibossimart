prompt --application/shared_components/user_interface/lovs/p274_salesquotation
begin
--   Manifest
--     P274_SALESQUOTATION
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
 p_id=>wwv_flow_imp.id(166242455269685475)
,p_lov_name=>'P274_SALESQUOTATION'
,p_static_id=>'p274-salesquotation'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'      a.TNO,',
'      a.PARTYQUOTATIONNO,',
'      a.PARTYQUOTATIONDATE,',
'      a.VALIDITYUPTODATE,',
'      a.SALESQUOTATIONNO,',
'      a.SALESQUOTATIONDATE,',
'      a.SALESQUOTATIONAMOUNT,',
'      a.SALESENQUIRYTNO,',
'      c.PartyName',
'FROM SalesQuotation a, DocumentStatusDetail b, Party c',
'where a.TNo = b.ModuleTNo',
'and a.PartyCode = c.PartyCode',
'and b.Modulecode = ''SALESQUOTATION''',
'and b.DocumentStatusCode = ''ACTIVE''',
'and a.SalesQuotationDate <= nvl(:P274_PORECEIPTDATE, sysdate)',
'and a.ValidityUpToDate >= nvl(:P274_PORECEIPTDATE, sysdate)',
'and  a.PartyCode = :P274_PARTYCODE',
'and a.CompanyCode = :global_CompanyCode',
'order by a.SalesQuotationDate, a.SalesQuotationNo'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'SALESQUOTATIONNO'
,p_version_scn=>'37158151'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(166243586632685482)
,p_query_column_name=>'SALESQUOTATIONDATE'
,p_heading=>'Date'
,p_display_sequence=>60
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(166243211929685482)
,p_query_column_name=>'SALESQUOTATIONNO'
,p_heading=>'No.'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(166242748692685482)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
