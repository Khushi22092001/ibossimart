prompt --application/shared_components/user_interface/lovs/static_lov_answered_not_answered
begin
--   Manifest
--     STATIC LOV (ANSWERED, NOT-ANSWERED)
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>1466918471259373
,p_default_application_id=>100
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(12136781623629052)
,p_lov_name=>'STATIC LOV (ANSWERED, NOT-ANSWERED)'
,p_static_id=>'static-lov-answered-not-answered'
,p_lov_query=>'.'||wwv_flow_imp.id(12136781623629052)||'.'
,p_location=>'STATIC'
,p_version_scn=>'8070226672'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(12137114903629055)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Answered'
,p_lov_return_value=>'A'
,p_static_id=>'answered'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(12137534096629055)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Not-Answered'
,p_lov_return_value=>'NA'
,p_static_id=>'not-answered'
);
wwv_flow_imp.component_end;
end;
/
