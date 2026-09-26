prompt --application/shared_components/user_interface/lovs/p184_pendingccinvoice
begin
--   Manifest
--     P184_PENDINGCCINVOICE
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
 p_id=>wwv_flow_imp.id(605639231247194264)
,p_lov_name=>'P184_PENDINGCCINVOICE'
,p_static_id=>'p184-pendingccinvoice'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select a.ccinvoiceno,',
'       a.ccinvoicedate,',
'       getpartyname(a.partycode) As PartyName,',
'       c.CityName,',
'       A.TNO',
'  From ccinvoice a, Party b, City C',
' Where Not Exists',
' (Select aa.tno From salesgrn aa Where aa.ccinvoicetno = a.tno)',
'      And a.companycode = :Global_CompanyCode',
'  and a.partycode = b.PartyCode  ',
'	And getdocumentstatuscode(''CCINVOICE'',a.tno)=''ACTIVE''',
'	',
' and nvl(b.WorksCityCode,b.OfficeCityCode) = c.CityCode ',
' Order By a.CCInvoiceDate Desc, a.CCInvoiceNo',
'',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'CCINVOICENO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605640521766195908)
,p_query_column_name=>'CCINVOICEDATE'
,p_heading=>'Ccinvoicedate'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605640219402195908)
,p_query_column_name=>'CCINVOICENO'
,p_heading=>'Ccinvoiceno'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605641336573195909)
,p_query_column_name=>'CITYNAME'
,p_heading=>'Cityname'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605640898270195908)
,p_query_column_name=>'PARTYNAME'
,p_heading=>'Partyname'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605639788095195906)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
