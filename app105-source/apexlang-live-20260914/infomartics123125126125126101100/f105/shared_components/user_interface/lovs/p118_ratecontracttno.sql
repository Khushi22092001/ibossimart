prompt --application/shared_components/user_interface/lovs/p118_ratecontracttno
begin
--   Manifest
--     P118_RATECONTRACTTNO
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
 p_id=>wwv_flow_imp.id(161908373881236722)
,p_lov_name=>'P118_RATECONTRACTTNO'
,p_static_id=>'p118-ratecontracttno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'a.TNo,',
'a.RatecontractNo,',
'a.RatecontractDate',
'from Ratecontract a, RateContractDetail b, DocumentStatusDetail c',
'where a.TNo = b.TNo',
'and a.CompanyCode = :GLobal_COmpanyCode',
'and a.Ratecontractdate <= :P118_PURCHASEORDERDATE',
'and c.ModuleCode = ''RATECONTRACT''',
'and a.TNo = c.ModuleTNo',
'and c.DocumentStatusCode = ''ACTIVE''',
'and a.PartyCode=:P118_PARTYCODE',
'and a.EXPIRYDATE >= :P118_PURCHASEORDERDATE',
'and :P118_COMPARATIVESTATEMENTTNO is null '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'RATECONTRACTNO'
,p_default_sort_column_name=>'RATECONTRACTNO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'36005711'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(161909597544236722)
,p_query_column_name=>'RATECONTRACTDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(161909207603236722)
,p_query_column_name=>'RATECONTRACTNO'
,p_heading=>'Rate Contract No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(161908757523236722)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
