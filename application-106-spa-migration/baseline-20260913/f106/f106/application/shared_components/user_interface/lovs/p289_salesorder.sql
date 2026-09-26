prompt --application/shared_components/user_interface/lovs/p289_salesorder
begin
--   Manifest
--     P289_SALESORDER
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
 p_id=>wwv_flow_imp.id(186223831329992279)
,p_lov_name=>'P289_SALESORDER'
,p_static_id=>'p289-salesorder'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tno , SALESORDERNO , SALESORDERDATE , getpartyname(partycode) from salesorder',
'order by SALESORDERDATE desc'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'SALESORDERNO'
,p_version_scn=>'4404252141'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(186225707370006685)
,p_query_column_name=>'GETPARTYNAME(PARTYCODE)'
,p_heading=>'Party'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(186225270749006685)
,p_query_column_name=>'SALESORDERDATE'
,p_heading=>'SO Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(186224847224006684)
,p_query_column_name=>'SALESORDERNO'
,p_heading=>'SO No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(186224447794006684)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
