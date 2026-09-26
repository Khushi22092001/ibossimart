prompt --application/shared_components/logic/application_items/trial_partycode
begin
--   Manifest
--     APPLICATION ITEM: TRIAL_PARTYCODE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(297676262107517349)
,p_name=>'TRIAL_PARTYCODE'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>'4380520827'
);
wwv_flow_imp.component_end;
end;
/
