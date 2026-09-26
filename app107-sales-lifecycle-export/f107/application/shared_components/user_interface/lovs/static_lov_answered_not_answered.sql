prompt --application/shared_components/user_interface/lovs/static_lov_answered_not_answered
begin
--   Manifest
--     STATIC LOV (ANSWERED, NOT-ANSWERED)
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
 p_id=>wwv_flow_imp.id(29158475263798166)
,p_lov_name=>'STATIC LOV (ANSWERED, NOT-ANSWERED)'
,p_static_id=>'static-lov-answered-not-answered'
,p_lov_query=>'.'||wwv_flow_imp.id(29158475263798166)||'.'
,p_location=>'STATIC'
,p_version_scn=>'8070226672'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(29158808543798169)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Answered'
,p_lov_return_value=>'A'
,p_static_id=>'answered'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(29159227736798169)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Not-Answered'
,p_lov_return_value=>'NA'
,p_static_id=>'not-answered'
);
wwv_flow_imp.component_end;
end;
/
