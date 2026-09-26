prompt --application/shared_components/user_interface/lovs/p315_enquiry
begin
--   Manifest
--     P315_ENQUIRY
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
 p_id=>wwv_flow_imp.id(169021905051352008)
,p_lov_name=>'P315_ENQUIRY'
,p_static_id=>'p315-enquiry'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EnquiryNo, tno ,Enquirydate  from Enquiry ',
'where tno = :P712_ENQUIRYTNO',
'and :P712_FORMSTATUS = ''EDITRECORD''',
'union all',
'select a.EnquiryNo, a.tno ,a.Enquirydate  from Enquiry a',
'where  not exists (select 1 from COMPARATIVESTATEMENT aa',
'                    where aa.enquirytno = a.tno    )',
'and :P712_FORMSTATUS = ''NEWRECORD'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'ENQUIRYNO'
,p_default_sort_column_name=>'ENQUIRYNO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'37524377'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(169023043924352008)
,p_query_column_name=>'ENQUIRYDATE'
,p_heading=>'Enquiry date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(169022694062352008)
,p_query_column_name=>'ENQUIRYNO'
,p_heading=>'Enquiry no'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(169022298474352008)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
