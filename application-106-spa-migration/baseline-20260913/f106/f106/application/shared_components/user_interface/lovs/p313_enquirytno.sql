prompt --application/shared_components/user_interface/lovs/p313_enquirytno
begin
--   Manifest
--     P313_ENQUIRYTNO
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
 p_id=>wwv_flow_imp.id(168901515624336277)
,p_lov_name=>'P313_ENQUIRYTNO'
,p_static_id=>'p313-enquirytno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.ENQUIRYNO , a.TNO , a.enquirydate, b.partycode,getpartyname(b.partycode) as partyname',
' from enquiry A ,Enquirypartydetail b ',
'where a.tno = b.tno(+) ',
'and NVL(GETMYPARAMETERVALUE(''VENDORAPPLICABLEINPURCHASE''),''NO'')= ''NO''',
'and a.locationcode  = :P710_LOCATIONCODE',
'and a.doctypecode = :P710_DOCTYPECODE',
'and (:P710_FORMSTATUS=''EDITRECORD'' OR not exists (select 1 from quotation aa where aa.enquirytno = a.tno and aa.partycode = b.partycode))',
'union all',
'select a.ENQUIRYNO , a.TNO , a.enquirydate, b.partycode,C.VENDORNAME as partyname',
' from enquiry A ,Enquirypartydetail b , VENDOR C',
'where a.tno = b.tno(+) ',
'AND B.PARTYCODE = C.VENDORCODE(+)',
'and NVL(GETMYPARAMETERVALUE(''VENDORAPPLICABLEINPURCHASE''),''NO'')= ''YES''',
'and a.locationcode  = :P710_LOCATIONCODE',
'and a.doctypecode = :P710_DOCTYPECODE',
'and (:P710_FORMSTATUS=''EDITRECORD'' OR not exists (select 1 from quotation aa where aa.enquirytno = a.tno and aa.partycode = b.partycode))'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'ENQUIRYNO'
,p_version_scn=>'14549785'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(34799258898206719)
,p_query_column_name=>'ENQUIRYDATE'
,p_heading=>'Enquirydate'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(34798821279206719)
,p_query_column_name=>'ENQUIRYNO'
,p_heading=>'Enquiryno'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(34799703490206719)
,p_query_column_name=>'PARTYCODE'
,p_heading=>'Partycode'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(34800061493206719)
,p_query_column_name=>'PARTYNAME'
,p_heading=>'Partyname'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(34798562651206719)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
