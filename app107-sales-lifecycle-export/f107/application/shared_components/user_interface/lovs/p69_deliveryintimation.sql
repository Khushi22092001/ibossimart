prompt --application/shared_components/user_interface/lovs/p69_deliveryintimation
begin
--   Manifest
--     P69_DELIVERYINTIMATION
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
 p_id=>wwv_flow_imp.id(129960967487513513)
,p_lov_name=>'P69_DELIVERYINTIMATION'
,p_static_id=>'p69-deliveryintimation'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'   DeliveryIntimationNo ,',
'   Tno ',
'From DeliveryIntimation',
'where getdocumentstatuscode(''DELIVERYINTIMATION'',TNO) = ''ACTIVE''',
'And PartyCode = :P69_PARTYCODE'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'DELIVERYINTIMATIONNO'
,p_default_sort_column_name=>'DELIVERYINTIMATIONNO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'7944387457'
);
wwv_flow_imp.component_end;
end;
/
