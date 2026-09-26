prompt --application/pages/page_00269
begin
--   Manifest
--     PAGE: 00269
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
 p_id=>269
,p_name=>'Bonus Scheme List'
,p_alias=>'BONUS-SCHEME-LIST'
,p_step_title=>'Bonus Scheme List'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(310794046380173947)
,p_plug_name=>'Bonus Scheme List'
,p_static_id=>'bonus-scheme-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       BONUSSCHEMECODE,',
'       BONUSSCHEMENAME,',
'       APPLIEDONWARD,',
'       CATEGORYCODE,',
'       STAFFTYPECODE,',
'       ATTENDENCEVALUEMINIMUM,',
'       SERVICEDAYSMINIMUM,',
'       BONUSAMOUNTMAXIMUM,',
'       REMARK,',
'       BONUSPERCENT,',
'       CREATIONTIME,',
'       CREATOR',
'  from BONUSSCHEME'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Bonus Scheme List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(310794164603173947)
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
,p_detail_link=>'f?p=&APP_ID.:270:&APP_SESSION.::&DEBUG.:RP:P270_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>108795278211506328
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(310795826924173961)
,p_db_column_name=>'APPLIEDONWARD'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Appliedonward'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(310796991868173961)
,p_db_column_name=>'ATTENDENCEVALUEMINIMUM'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Attendencevalueminimum'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(310797795381173961)
,p_db_column_name=>'BONUSAMOUNTMAXIMUM'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Bonusamountmaximum'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(310798585102173962)
,p_db_column_name=>'BONUSPERCENT'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Bonuspercent'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(310794980378173960)
,p_db_column_name=>'BONUSSCHEMECODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Bonusschemecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(310795387283173960)
,p_db_column_name=>'BONUSSCHEMENAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Bonusschemename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(310796144386173961)
,p_db_column_name=>'CATEGORYCODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Categorycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(310798994453173963)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Creationtime'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(310799340994173963)
,p_db_column_name=>'CREATOR'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(310798185285173961)
,p_db_column_name=>'REMARK'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(310797406799173961)
,p_db_column_name=>'SERVICEDAYSMINIMUM'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Servicedaysminimum'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(310796607952173961)
,p_db_column_name=>'STAFFTYPECODE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Stafftypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(310794612425173957)
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
 p_id=>wwv_flow_imp.id(310800202591174777)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'903487'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TNO:BONUSSCHEMECODE:BONUSSCHEMENAME:APPLIEDONWARD:CATEGORYCODE:STAFFTYPECODE:ATTENDENCEVALUEMINIMUM:SERVICEDAYSMINIMUM:BONUSAMOUNTMAXIMUM:REMARK:BONUSPERCENT:CREATIONTIME:CREATOR'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(211583616750969752)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(310794046380173947)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:270:&APP_SESSION.::&DEBUG.:270::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(211583222044969752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(310794046380173947)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(211582797556969752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(310794046380173947)
,p_button_name=>'Pdf'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'PDF'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(310857305962346122)
,p_name=>'P269_TNO'
,p_item_sequence=>20
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
