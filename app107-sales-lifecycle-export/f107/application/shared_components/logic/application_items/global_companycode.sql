prompt --application/shared_components/logic/application_items/global_companycode
begin
--   Manifest
--     APPLICATION ITEM: GLOBAL_COMPANYCODE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(583562625722562167)
,p_name=>'GLOBAL_COMPANYCODE'
,p_protection_level=>'I'
,p_version_scn=>'4307693785'
);
wwv_flow_imp.component_end;
end;
/
