prompt --application/shared_components/logic/application_items/global_financialyearend
begin
--   Manifest
--     APPLICATION ITEM: GLOBAL_FINANCIALYEAREND
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
 p_id=>wwv_flow_imp.id(574083200078103807)
,p_name=>'GLOBAL_FINANCIALYEAREND'
,p_protection_level=>'I'
,p_version_scn=>'4307693785'
);
wwv_flow_imp.component_end;
end;
/
