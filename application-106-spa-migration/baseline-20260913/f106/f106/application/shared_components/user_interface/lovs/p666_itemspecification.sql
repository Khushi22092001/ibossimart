prompt --application/shared_components/user_interface/lovs/p666_itemspecification
begin
--   Manifest
--     P666_ITEMSPECIFICATION
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
 p_id=>wwv_flow_imp.id(469419556719540092)
,p_lov_name=>'P666_ITEMSPECIFICATION'
,p_static_id=>'p666-itemspecification'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   a.ItemSpecificationName,',
'  a.ItemSpecificationCode,',
'  b.MEASURINGUNITCODE1,',
'  a.MultiplyingFactor',
'from ItemSpecification a, Item b',
'where a.TNo = b.Tno',
'--  and b.ItemCode = :P666_ITEMCODE',
'  and a.Tno =   :P666_ITEMTNO'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_column_name=>'ITEMSPECIFICATIONNAME'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(469419934781550436)
,p_query_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(469420226810550438)
,p_query_column_name=>'ITEMSPECIFICATIONNAME'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
