prompt --application/pages/page_00635
begin
--   Manifest
--     PAGE: 00635
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>635
,p_name=>'LEAVEREQUEST'
,p_alias=>'LEAVEREQUEST2'
,p_page_mode=>'MODAL'
,p_step_title=>'LEAVEREQUEST'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(468457457504603889)
,p_plug_name=>'Leave Detail'
,p_static_id=>'leave-detail'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT X.MONTH,X.LEAVEFROMDATE,X.LEAVETODATE,X.LEAVECODE,X.LEAVEDAYS',
'FROM',
'(',
'SELECT ',
'        CASE ',
'            WHEN to_char(B.LEAVEFROMDATE, ''Mon-YYYY'') = to_char(B.LEAVETODATE, ''Mon-YYYY'')  THEN',
'                to_char(B.LEAVEFROMDATE, ''Mon-YYYY'')',
'            END AS MONTH,',
'            B.LEAVEFROMDATE,B.LEAVETODATE,B.LEAVECODE,B.LEAVEDAYS',
'FROM LEAVEREQUEST A,LEAVEREQUESTDETAIL B',
'WHERE A.TNO=B.TNO',
'AND A.LOCATIONCODE  =   :P635_LOCATIONCODE',
'AND A.DOCTYPECODE   =   :P635_DOCTYPECODE',
'AND A.DEPARTMENTCODE = :P635_DEPARTMENTCODE',
'AND A.STAFFTYPECODE =  :P635_STAFFTYPECODE',
'AND A.EMPLOYEECODE = :P635_EMPLOYEECODE',
'AND B.LEAVECODE     = :P635_LEAVECODE',
') X',
'WHERE UPPER(X.MONTH)=UPPER(:P635_MONTH)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P635_LOCATIONCODE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Leave Detail'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(468457540182603889)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>19992467151439541
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(468459151501603907)
,p_db_column_name=>'LEAVECODE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Leave'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(468459479525603907)
,p_db_column_name=>'LEAVEDAYS'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Leave Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(468458313385603906)
,p_db_column_name=>'LEAVEFROMDATE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Leave From Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(468458694126603906)
,p_db_column_name=>'LEAVETODATE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Leave To Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(468457922777603906)
,p_db_column_name=>'MONTH'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Month'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(468460353130607676)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'199953'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MONTH:LEAVEFROMDATE:LEAVETODATE:LEAVECODE:LEAVEDAYS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(468461286844611865)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(468457457504603889)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:634:&SESSION.::&DEBUG.:634::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(468460990213610946)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(468457457504603889)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467803511063776268)
,p_name=>'P635_DEPARTMENTCODE'
,p_item_sequence=>50
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467803018847776263)
,p_name=>'P635_DOCTYPECODE'
,p_item_sequence=>30
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467803729304776270)
,p_name=>'P635_EMPLOYEECODE'
,p_item_sequence=>70
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467803847680776271)
,p_name=>'P635_LEAVECODE'
,p_item_sequence=>80
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467802969530776262)
,p_name=>'P635_LOCATIONCODE'
,p_item_sequence=>20
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467803400708776267)
,p_name=>'P635_MONTH'
,p_item_sequence=>40
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467803598656776269)
,p_name=>'P635_STAFFTYPECODE'
,p_item_sequence=>60
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
