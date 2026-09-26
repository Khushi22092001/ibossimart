prompt --application/pages/page_00098
begin
--   Manifest
--     PAGE: 00098
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>1466918471259373
,p_default_application_id=>100
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>98
,p_name=>'Service Type Account List'
,p_alias=>'JOB-TYPE-ACCOUNT-LIST'
,p_step_title=>'Service Type Account List'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
':root{',
'    --a-menu-font-size: 1.25rem !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(578816238978579747)
,p_plug_name=>'Service Type Account List'
,p_static_id=>'service-type-account-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select getpartyname(A.ACCOUNTCODE) account,',
'       A.COMPANYCODE,',
'       getpartyname(A.JOBTYPEACCOUNTCODE) jobtypeaccount,',
'       A.JOBTYPEACCOUNTCODE,',
'       A.JOBTYPECODE,',
'       b.JOBTYPENAME,',
'       A.MODULECODE,',
'       A.REMARK,',
'       A.TNO,',
'       getpartyname(A.PARTYCODE) party,',
'       A.CREATOR,',
'       A.LOCATIONCODE,',
'       getdoctypename(A.DOCTYPECODE) doctype,',
'       getpartyname(A.REPORTACCOUNTCODE) reportaccount,',
'       to_char(A.CREATIONTIME,''DD-MM-YYYY HH24:MI:SS'') CREATIONTIME,',
'       A.TRANSACTIONTYPECODE,',
'       c.TRANSACTIONTYPEname,',
'       A.NATUREOFSUPPLYCODE,',
'       d.NATUREOFSUPPLYname',
'  from JOBTYPEACCOUNT A , JOBTYPE b , TRANSACTIONTYPE c , NATUREOFSUPPLY d',
'  where a.JOBTYPECODE = b.JOBTYPECODE(+)',
'  and a.TRANSACTIONTYPECODE = c.TRANSACTIONTYPECODE(+)',
'  and a.NATUREOFSUPPLYCODE = d.NATUREOFSUPPLYCODE(+)',
'  Order By A.TNO Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Job Type Account List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(578816304445579747)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:99:&APP_SESSION.::&DEBUG.:RP:P99_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>145971449003355973
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(190899020495745236)
,p_db_column_name=>'ACCOUNT'
,p_display_order=>35
,p_column_identifier=>'Q'
,p_column_label=>'Account'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578817077983579748)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Company Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578001324520914592)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>25
,p_column_identifier=>'P'
,p_column_label=>'Creation Time'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578819942662579748)
,p_db_column_name=>'CREATOR'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(190899362190745240)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>75
,p_column_identifier=>'U'
,p_column_label=>'Doctype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(190899124454745237)
,p_db_column_name=>'JOBTYPEACCOUNT'
,p_display_order=>45
,p_column_identifier=>'R'
,p_column_label=>'Job type account'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(191058652023837894)
,p_db_column_name=>'JOBTYPEACCOUNTCODE'
,p_display_order=>115
,p_column_identifier=>'Y'
,p_column_label=>'Service type account code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578817884496579748)
,p_db_column_name=>'JOBTYPECODE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Service Type Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(190899132651745238)
,p_db_column_name=>'JOBTYPENAME'
,p_display_order=>55
,p_column_identifier=>'S'
,p_column_label=>'Service type name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578820326255579748)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Location Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578818354919579748)
,p_db_column_name=>'MODULECODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Module Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578822262158579750)
,p_db_column_name=>'NATUREOFSUPPLYCODE'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Nature Of Supply Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(191058578505837893)
,p_db_column_name=>'NATUREOFSUPPLYNAME'
,p_display_order=>105
,p_column_identifier=>'X'
,p_column_label=>'Nature of supply name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(190899249071745239)
,p_db_column_name=>'PARTY'
,p_display_order=>65
,p_column_identifier=>'T'
,p_column_label=>'Party'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578818666082579748)
,p_db_column_name=>'REMARK'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(190899509119745241)
,p_db_column_name=>'REPORTACCOUNT'
,p_display_order=>85
,p_column_identifier=>'V'
,p_column_label=>'Report account'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578819080185579748)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'G'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(578821880303579750)
,p_db_column_name=>'TRANSACTIONTYPECODE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Transaction Type Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(190899543785745242)
,p_db_column_name=>'TRANSACTIONTYPENAME'
,p_display_order=>95
,p_column_identifier=>'W'
,p_column_label=>'Transaction type name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(578831925437604452)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1459871'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'JOBTYPEACCOUNTCODE:MODULECODE:JOBTYPENAME:DOCTYPE:ACCOUNT:NATUREOFSUPPLYNAME:TRANSACTIONTYPENAME:REMARK:CREATOR:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(578822854851579752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(578816238978579747)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:99:&APP_SESSION.::&DEBUG.:99::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(578825912201589753)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(578816238978579747)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:1::'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(578001448378914593)
,p_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(578822854851579752)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(578001553177914594)
,p_event_id=>wwv_flow_imp.id(578001448378914593)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(578816238978579747)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(578823062991579752)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(578816238978579747)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(578823634199579752)
,p_event_id=>wwv_flow_imp.id(578823062991579752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(578816238978579747)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
