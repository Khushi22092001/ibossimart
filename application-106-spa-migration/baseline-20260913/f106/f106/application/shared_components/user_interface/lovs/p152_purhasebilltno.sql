prompt --application/shared_components/user_interface/lovs/p152_purhasebilltno
begin
--   Manifest
--     P152_PURHASEBILLTNO
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
 p_id=>wwv_flow_imp.id(605546934254251215)
,p_lov_name=>'P152_PURHASEBILLTNO'
,p_static_id=>'p152-purhasebilltno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.TNO , a.PURCHASEBILLNO , a.PARTYBILLNO , a.PARTYBILLDATE from purchasebill a',
'where a.locationcode = :P152_LOCATIONCODE',
'and a.doctypecode = :P152_DOCTYPECODE',
'and a.partycode = :P152_PARTYCODE',
'AND ( A.TNO = :P152_PURCHASEBILLTNO OR NOT EXISTS ( SELECT 1 FROM PBPASS AA WHERE PURCHASEBILLTNO = A.TNO))'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'PURCHASEBILLNO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605549236123296344)
,p_query_column_name=>'PARTYBILLDATE'
,p_heading=>'Party Bill Date'
,p_display_sequence=>40
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605548840931296343)
,p_query_column_name=>'PARTYBILLNO'
,p_heading=>'Party Bill No'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605548400954296343)
,p_query_column_name=>'PURCHASEBILLNO'
,p_heading=>'Purchase Bill No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605547996724296341)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
