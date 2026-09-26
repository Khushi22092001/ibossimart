prompt --application/pages/page_00307
begin
--   Manifest
--     PAGE: 00307
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
 p_id=>307
,p_name=>'GST Setup List'
,p_alias=>'GST-SETUP-LIST'
,p_step_title=>'GST Setup List'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(189106227408255764)
,p_plug_name=>'GST Setup List'
,p_static_id=>'gst-setup-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       getpartyname(CGSTINPUTACCOUNTCODE) as "CGST Input A/c",',
'       getpartyname(SGSTINPUTACCOUNTCODE) as "SGST Input A/c",',
'       getpartyname(CGSTOUTPUTACCOUNTCODE) as "CGST Output A/c",',
'       getpartyname(SGSTOUTPUTACCOUNTCODE) as "SGST Output A/c",',
'       getpartyname(IGSTINPUTACCOUNTCODE)  as "IGST Input A/c",',
'       getpartyname(IGSTOUTPUTACCOUNTCODE) as "IGST Output A/c",',
'       getpartyname(CGSTRCMPAYABLEACCOUNTCODE) as "CGST RCM Payble A/c",',
'       getpartyname(CGSTPAYABLEACCOUNTCODE) as "CGST Payble A/c",',
'       getpartyname(SGSTPAYABLEACCOUNTCODE) as "SGST Payble A/c",',
'       getpartyname(IGSTPAYABLEACCOUNTCODE) as "IGST Payble A/c",',
'       getpartyname(IGSTRCMPAYABLEACCOUNTCODE) as "IGST RCM Payble A/c",',
'       getpartyname(SGSTRCMPAYABLEACCOUNTCODE) as "SGST RCM Payble A/c",',
'       CREATOR,',
'       CREATIONTIME',
'  from GSTSETUP'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'GST Setup List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(189106351748255764)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:308:&APP_SESSION.::&DEBUG.:RP:P308_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>21187333282128322
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188695135025300261)
,p_db_column_name=>'CGST Input A/c'
,p_display_order=>25
,p_column_identifier=>'P'
,p_column_label=>'Cgst Input A&#x2F;c'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188695357348300263)
,p_db_column_name=>'CGST Output A/c'
,p_display_order=>45
,p_column_identifier=>'R'
,p_column_label=>'Cgst Output A&#x2F;c'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188695842469300268)
,p_db_column_name=>'CGST Payble A/c'
,p_display_order=>95
,p_column_identifier=>'W'
,p_column_label=>'Cgst Payble A&#x2F;c'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188695760541300267)
,p_db_column_name=>'CGST RCM Payble A/c'
,p_display_order=>85
,p_column_identifier=>'V'
,p_column_label=>'Cgst Rcm Payble A&#x2F;c'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189112703401255770)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Creationtime'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189112223546255770)
,p_db_column_name=>'CREATOR'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188695543383300265)
,p_db_column_name=>'IGST Input A/c'
,p_display_order=>65
,p_column_identifier=>'T'
,p_column_label=>'Igst Input A&#x2F;c'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188695646712300266)
,p_db_column_name=>'IGST Output A/c'
,p_display_order=>75
,p_column_identifier=>'U'
,p_column_label=>'Igst Output A&#x2F;c'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188696088065300270)
,p_db_column_name=>'IGST Payble A/c'
,p_display_order=>115
,p_column_identifier=>'Y'
,p_column_label=>'Igst Payble A&#x2F;c'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188696184790300271)
,p_db_column_name=>'IGST RCM Payble A/c'
,p_display_order=>125
,p_column_identifier=>'Z'
,p_column_label=>'Igst Rcm Payble A&#x2F;c'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188695290215300262)
,p_db_column_name=>'SGST Input A/c'
,p_display_order=>35
,p_column_identifier=>'Q'
,p_column_label=>'Sgst Input A&#x2F;c'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188695497890300264)
,p_db_column_name=>'SGST Output A/c'
,p_display_order=>55
,p_column_identifier=>'S'
,p_column_label=>'Sgst Output A&#x2F;c'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188695953342300269)
,p_db_column_name=>'SGST Payble A/c'
,p_display_order=>105
,p_column_identifier=>'X'
,p_column_label=>'Sgst Payble A&#x2F;c'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188696246478300272)
,p_db_column_name=>'SGST RCM Payble A/c'
,p_display_order=>135
,p_column_identifier=>'AA'
,p_column_label=>'Sgst Rcm Payble A&#x2F;c'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189107057287255767)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(189114455240267470)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'211955'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TNO:CREATOR:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(189113132419255770)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(189106227408255764)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:308:&APP_SESSION.::&DEBUG.:308::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(188871530222071250)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(189106227408255764)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(188695041732300260)
,p_name=>'P307_TNO'
,p_item_sequence=>20
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
