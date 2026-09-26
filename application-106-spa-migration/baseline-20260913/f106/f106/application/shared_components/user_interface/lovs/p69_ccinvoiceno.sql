prompt --application/shared_components/user_interface/lovs/p69_ccinvoiceno
begin
--   Manifest
--     P69_CCINVOICENO
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
 p_id=>wwv_flow_imp.id(41307728756286110)
,p_lov_name=>'P69_CCINVOICENO'
,p_static_id=>'p69-ccinvoiceno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ccinvoiceno , tno, ccinvoicedate from ccinvoice',
'where locationcode = :P69_LOCATIONCODE',
'and partycode = :P69_PARTYCODE'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'CCINVOICENO'
,p_default_sort_column_name=>'CCINVOICENO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'3924243'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(41309091231290929)
,p_query_column_name=>'CCINVOICEDATE'
,p_heading=>'CCinvoice Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(41308635524290929)
,p_query_column_name=>'CCINVOICENO'
,p_heading=>'CCinvoice No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(41308264366290929)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
