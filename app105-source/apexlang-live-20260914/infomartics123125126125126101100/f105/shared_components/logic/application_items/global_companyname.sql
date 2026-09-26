prompt --application/shared_components/logic/application_items/global_companyname
begin
--   Manifest
--     APPLICATION ITEM: GLOBAL_COMPANYNAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>1466918471259373
,p_default_application_id=>100
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(566541121845393643)
,p_name=>'GLOBAL_COMPANYNAME'
,p_protection_level=>'I'
,p_version_scn=>'4307693785'
);
wwv_flow_imp.component_end;
end;
/
