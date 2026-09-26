prompt --application/shared_components/user_interface/lovs/p79_customerorder
begin
--   Manifest
--     P79_CUSTOMERORDER
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
 p_id=>wwv_flow_imp.id(610270159923527261)
,p_lov_name=>'P79_CUSTOMERORDER'
,p_static_id=>'p79-customerorder'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select tno, a.PoReceiptNo as CustomerOrderNo, a.PoreceiptDate as CustomerOrderDate, a.PartyPoNumber',
'from Poreceipt a',
'where getdocumentstatuscode(''PORECEIPT'',A.TNO) = ''ACTIVE''',
'and a.partycode = :P79_PARTYCODE',
'order by 2'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'CUSTOMERORDERNO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(610271359108527264)
,p_query_column_name=>'CUSTOMERORDERDATE'
,p_heading=>'Customer Order Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(610271010383527264)
,p_query_column_name=>'CUSTOMERORDERNO'
,p_heading=>'Customer Order No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(610271751789527264)
,p_query_column_name=>'PARTYPONUMBER'
,p_heading=>'Party PO Number'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(610270575041527264)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
