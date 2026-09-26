prompt --application/shared_components/user_interface/lovs/p166_referencetno
begin
--   Manifest
--     P166_REFERENCETNO
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
 p_id=>wwv_flow_imp.id(295552521098364978)
,p_lov_name=>'P166_REFERENCETNO'
,p_static_id=>'p166-referencetno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.InvoiceDate,',
'a.InvoiceNo,',
'a.InvoiceAmount,',
'a.ModuleCode,',
'a.ModuleTNo',
'from TransactionForNote a',
'where a.CompanyCode = :P166_COMPANYCODE',
'and a.PartyCode = :P166_PARTYCODE',
'and a.ModuleCode = :P166_REFERENCEMODULECODE',
'order by 1 desc, 2 desc'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'MODULETNO'
,p_display_column_name=>'INVOICENO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(295554265106370362)
,p_query_column_name=>'INVOICEAMOUNT'
,p_heading=>'Invoiceamount'
,p_display_sequence=>40
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(295553802178370361)
,p_query_column_name=>'INVOICEDATE'
,p_heading=>'Invoicedate'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(295553422038370361)
,p_query_column_name=>'INVOICENO'
,p_heading=>'Invoiceno'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(295554681748370362)
,p_query_column_name=>'MODULECODE'
,p_heading=>'Modulecode'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(295553049540370356)
,p_query_column_name=>'MODULETNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
