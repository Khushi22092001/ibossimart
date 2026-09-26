prompt --application/shared_components/user_interface/lovs/p705_salesenquirytno
begin
--   Manifest
--     P705_SALESENQUIRYTNO
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
 p_id=>wwv_flow_imp.id(166920521164821450)
,p_lov_name=>'P705_SALESENQUIRYTNO'
,p_static_id=>'p705-salesenquirytno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select SALESENQUIRYNO , SALESENQUIRYDATE , tno from salesenquiry    ',
'where partycode = :P705_PARTYCODE',
'and doctypecode = :P705_DOCTYPECODE',
'and VALIDITYUPTODATE >= :P705_SALESQUOTATIONDATE'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'SALESENQUIRYNO'
,p_default_sort_column_name=>'SALESENQUIRYNO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'37525835'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(166921838020823805)
,p_query_column_name=>'SALESENQUIRYDATE'
,p_heading=>'Salesenquirydate'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(166921443806823805)
,p_query_column_name=>'SALESENQUIRYNO'
,p_heading=>'Salesenquiryno'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(166921030972823803)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
