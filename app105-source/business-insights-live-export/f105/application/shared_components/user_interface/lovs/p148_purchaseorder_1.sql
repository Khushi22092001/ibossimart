prompt --application/shared_components/user_interface/lovs/p148_purchaseorder
begin
--   Manifest
--     P148_PURCHASEORDER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(457936036762756792)
,p_lov_name=>'P148_PURCHASEORDER'
,p_static_id=>'p148-purchaseorder'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'        A.PURCHASEORDERNO, ',
'        A.PURCHASEORDERDATE, ',
'        A.TNO  ,',
'        getpartyname(a.partycode) as partyname,',
'        getdoctypename(a.doctypecode) as DocType',
'        FROM purchaseorder A ',
'        where a.locationcode = :P148_LOCATIONCODE ',
'          --  And a.doctypecode = :P148_DOCTYPECODE',
'          and a.partycode = :P148_PARTYCODE'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'PURCHASEORDERNO'
,p_default_sort_column_name=>'PURCHASEORDERNO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4389112625'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(466243681730153150)
,p_query_column_name=>'PARTYNAME'
,p_heading=>'Party'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(457937260639761231)
,p_query_column_name=>'PURCHASEORDERDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(457936844224761231)
,p_query_column_name=>'PURCHASEORDERNO'
,p_heading=>'Purchase No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(457936565261761229)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
