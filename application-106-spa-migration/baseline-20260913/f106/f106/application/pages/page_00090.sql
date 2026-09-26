prompt --application/pages/page_00090
begin
--   Manifest
--     PAGE: 00090
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>90
,p_name=>'Company Vehicle List'
,p_alias=>'COMPANY-VEHICLE-LIST'
,p_step_title=>'Company Vehicle List'
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
 p_id=>wwv_flow_imp.id(585482435493463795)
,p_plug_name=>'Company Vehicle List'
,p_static_id=>'company-vehicle-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.TNO,',
'       A.COMPANYVEHICLECODE,',
'       A.COMPANYVEHICLENAME,',
'       A.COMPANYVEHICLESHORTNAME,',
'       A.COMPANYVEHICLENO,',
'       A.VEHICLETYPECODE,',
'       b.VEHICLETYPENAME,',
'       A.PARTYCODE,',
'       A.TAREWEIGHT,',
'       A.CREATOR,',
'       to_char(A.CREATIONTIME,''DD-MM-YYYY HH24:MI:SS'') CREATIONTIME,',
'       A.REMARK,',
'        A.VEHICLEOWNERCODE,',
'        d.partyname as Owner,',
'        A.TRANSPORTERCODE,',
'        c.partyname as Transporter,',
'        A.ENGINENO,',
'        A.CHASISNO,',
'        A.MANUFACTURINGYEAR,',
'        A.MODELNO,',
'        A.TANKSIZE,',
'        A.VEHICLEGROUPCODE',
'  from COMPANYVEHICLE A , VEHICLETYPE b , party c , party d',
'  where A.VEHICLETYPECODE = b.VEHICLETYPECODE(+)',
'  and A.TRANSPORTERCODE = c.partycode(+)',
'  and A.VEHICLEOWNERCODE = d.partycode(+)',
'  Order By A.TNO Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Company Vehicle List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(585482453851463795)
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
,p_detail_link=>'f?p=&APP_ID.:91:&APP_SESSION.::&DEBUG.:RP:P91_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>145096108600537271
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(605323497814850271)
,p_db_column_name=>'CHASISNO'
,p_display_order=>61
,p_column_identifier=>'P'
,p_column_label=>'Chasis No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585483314580463798)
,p_db_column_name=>'COMPANYVEHICLECODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Company Vehicle Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585483708409463798)
,p_db_column_name=>'COMPANYVEHICLENAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Company Vehicle Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585484466748463802)
,p_db_column_name=>'COMPANYVEHICLENO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Company Vehicle No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585484075728463801)
,p_db_column_name=>'COMPANYVEHICLESHORTNAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Company Vehicle Short Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(584489468162406866)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>21
,p_column_identifier=>'L'
,p_column_label=>'Creation Time'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585486111644463803)
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
 p_id=>wwv_flow_imp.id(605323440193850270)
,p_db_column_name=>'ENGINENO'
,p_display_order=>51
,p_column_identifier=>'O'
,p_column_label=>'Engine No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(605323628078850272)
,p_db_column_name=>'MANUFACTURINGYEAR'
,p_display_order=>71
,p_column_identifier=>'Q'
,p_column_label=>'Manufacturing Year'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(605323663558850273)
,p_db_column_name=>'MODELNO'
,p_display_order=>81
,p_column_identifier=>'R'
,p_column_label=>'Model No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(606204888454247832)
,p_db_column_name=>'OWNER'
,p_display_order=>121
,p_column_identifier=>'V'
,p_column_label=>'Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585485294273463803)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Party Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585486930097463803)
,p_db_column_name=>'REMARK'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(605323815391850274)
,p_db_column_name=>'TANKSIZE'
,p_display_order=>91
,p_column_identifier=>'S'
,p_column_label=>'Tank Size'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585485663475463803)
,p_db_column_name=>'TAREWEIGHT'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Tare Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585482926658463797)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(606204946013247833)
,p_db_column_name=>'TRANSPORTER'
,p_display_order=>131
,p_column_identifier=>'W'
,p_column_label=>'Transporter'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(605323296555850269)
,p_db_column_name=>'TRANSPORTERCODE'
,p_display_order=>41
,p_column_identifier=>'N'
,p_column_label=>'Transporter'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(606204223061247825)
,p_db_column_name=>'VEHICLEGROUPCODE'
,p_display_order=>101
,p_column_identifier=>'T'
,p_column_label=>'Vehicle Group'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(605323217806850268)
,p_db_column_name=>'VEHICLEOWNERCODE'
,p_display_order=>31
,p_column_identifier=>'M'
,p_column_label=>'Vehicle Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585484880657463802)
,p_db_column_name=>'VEHICLETYPECODE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Vehicle Type Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(606204826709247831)
,p_db_column_name=>'VEHICLETYPENAME'
,p_display_order=>111
,p_column_identifier=>'U'
,p_column_label=>'Vehicle Type Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(585535493990574440)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1451492'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COMPANYVEHICLENO:VEHICLETYPENAME:VEHICLEGROUPCODE:OWNER:TRANSPORTER:TAREWEIGHT:CHASISNO:ENGINENO:MANUFACTURINGYEAR:MODELNO:TANKSIZE:REMARK:CREATOR:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(585487377917463803)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(585482435493463795)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:91:&APP_SESSION.::&DEBUG.:91::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(585492261491480169)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(585482435493463795)
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
 p_id=>wwv_flow_imp.id(584489583110406867)
,p_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(585487377917463803)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(584489699821406868)
,p_event_id=>wwv_flow_imp.id(584489583110406867)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(585482435493463795)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(585487744808463803)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(585482435493463795)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(585488160792463804)
,p_event_id=>wwv_flow_imp.id(585487744808463803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(585482435493463795)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
