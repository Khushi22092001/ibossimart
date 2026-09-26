prompt --application/shared_components/user_interface/lovs/p118_quotationtno
begin
--   Manifest
--     P118_QUOTATIONTNO
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
 p_id=>wwv_flow_imp.id(169448045971939471)
,p_lov_name=>'P118_QUOTATIONTNO'
,p_static_id=>'p118-quotationtno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'A.TNO,',
'a.QUOTATIONNO,',
'a.QUOTATIONDATE',
'FROM Quotation a, DocumentStatusDetail b,Party c',
'where a.TNo = b.ModuleTNo',
'and b.Modulecode = ''QUOTATION''',
'and b.DocumentStatusCode = ''ACTIVE''',
'and a.QuotationDate <= :P118_PurchaseOrderDate',
'and a.PartyCode=c.VendorCode',
'and c.PartyCode = :P118_PartyCode',
'and a.CompanyCode = :global_CompanyCode',
'and (',
'   :P118_ComparativeStatementTNo is null',
'   or',
'   exists(',
'       select',
'            aa.tno',
'       from Comparativestatementitem aa',
'       where aa.TNO = :P118_ComparativeStatementTNo',
'           and aa.QuotationTNo = a.TNO',
'   )',
')',
'and (:P118_FORMSTATUS =''EDITRECORD'' OR not exists ( select 1 from purchaseorder aa where aa.QuotationTno = a.tno))'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'QUOTATIONNO'
,p_default_sort_column_name=>'QUOTATIONNO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'15108047'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(169449318449939471)
,p_query_column_name=>'QUOTATIONDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(169448927214939471)
,p_query_column_name=>'QUOTATIONNO'
,p_heading=>'Quotation No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(169448517653939471)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
