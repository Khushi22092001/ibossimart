prompt --application/shared_components/user_interface/lovs/p118_comparativestatementtno
begin
--   Manifest
--     P118_COMPARATIVESTATEMENTTNO
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
 p_id=>wwv_flow_imp.id(169445361264939461)
,p_lov_name=>'P118_COMPARATIVESTATEMENTTNO'
,p_static_id=>'p118-comparativestatementtno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'  a.ComparativeStatementNo,',
'  a.ComparativeStatementDate,',
'  a.TNO',
'from ComparativeStatement a, ComparativeStatementDetail b, Quotation c,Party d, Comparativestatementitem e',
'where a.TNO = b.TNo',
'  and b.QuotationTNo = c.TNo',
'  and c.PartyCode = d.vendorCode',
'	And a.tno = e.tno',
'	And c.tno = e.quotationtno',
'    and d.PartyCode=:P118_PARTYCODE',
'  and exists(',
'            select',
'                aa.tno',
'            from DocumentStatusDetail aa',
'            where aa.ModuleTNO = a.TNo',
'                and aa.ModuleCode = ''COMPARATIVESTATEMENT''',
'                and aa.DocumentStatusCode = ''ACTIVE''',
'              ',
'        )',
'and (:P118_FORMSTATUS = ''EDITRECORD'' OR not exists ( select 1 from PurchaseOrder aa where aa.ComparativeStatementTno = a.tno))	',
'AND A.LOCATIONCODE = :P118_LOCATIONCODE ',
'AND :P118_RATECONTRACTTNO IS NULL ',
'and a.companycode = :global_companycode',
'order by a.ComparativeStatementDate desc'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'COMPARATIVESTATEMENTNO'
,p_version_scn=>'14947056'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(169446591881939467)
,p_query_column_name=>'COMPARATIVESTATEMENTDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(169446216584939467)
,p_query_column_name=>'COMPARATIVESTATEMENTNO'
,p_heading=>'CS No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(169445830955939466)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
