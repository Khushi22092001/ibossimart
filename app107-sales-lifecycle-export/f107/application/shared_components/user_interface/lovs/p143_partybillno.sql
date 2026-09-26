prompt --application/shared_components/user_interface/lovs/p143_partybillno
begin
--   Manifest
--     P143_PARTYBILLNO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(457842790466221876)
,p_lov_name=>'P143_PARTYBILLNO'
,p_static_id=>'p143-partybillno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct a.REFDOCNO as Partybillno ,a.REFDOCDATE as Partybilldate, a.REFDOCNO r from grn a',
'where a.LOCATIONCODE = :P143_LOCATIONCODE',
'and a.REFDOCTYPECODE = ''BILL''',
'and a.PARTYCODE = :P143_PARTYCODE',
'AND ( A.REFDOCNO = :P143_PARTYBILLNO OR ',
'        NOT EXISTS ( SELECT 1 FROM purchasebill AA WHERE PARTYBILLNO = A.REFDOCNO))'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'PARTYBILLNO'
,p_default_sort_column_name=>'PARTYBILLNO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(457844417073225006)
,p_query_column_name=>'PARTYBILLDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(457843987827225006)
,p_query_column_name=>'PARTYBILLNO'
,p_heading=>'Bill No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(457843653217225003)
,p_query_column_name=>'R'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
