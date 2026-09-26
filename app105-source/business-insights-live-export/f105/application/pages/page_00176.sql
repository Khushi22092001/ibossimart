prompt --application/pages/page_00176
begin
--   Manifest
--     PAGE: 00176
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>176
,p_name=>'Tax Rule List'
,p_alias=>'TAX-RULE-LIST'
,p_step_title=>'Tax Rule List'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(611150870194606774)
,p_plug_name=>'Tax Rule List'
,p_static_id=>'tax-rule-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'* ',
'from (',
'select a.TNO,',
'       a.TAXRULECODE,',
'       a.TAXRULENAME,',
'       b.HSNCODE,',
'       null as SACCODE,',
'       a.TAXREGISTRATIONTYPECODE,',
'       a.TRANSACTIONTYPECODE,',
'       a.EFFECTIVEFROM,',
'       a.REMARK,',
'       a.CREATOR,',
'       a.CREATIONTIME',
'  from TAXRULE a, taxrulehsn b',
'  where a.tno = b.tno(+)',
'',
'  union all',
'  select a.TNO,',
'       a.TAXRULECODE,',
'       a.TAXRULENAME,',
'       null as HSNCODE,',
'       b.SACCODE,',
'       a.TAXREGISTRATIONTYPECODE,',
'       a.TRANSACTIONTYPECODE,',
'       a.EFFECTIVEFROM,',
'       a.REMARK,',
'       a.CREATOR,',
'       a.CREATIONTIME',
'  from TAXRULE a, taxrulesac b',
'  where a.tno = b.tno(+)',
') x ',
'order by 1'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Tax Rule List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(611150983851606774)
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
,p_detail_link=>'f?p=&APP_ID.:177:&APP_SESSION.::&DEBUG.:RP:P177_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>170764638600680250
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(611155394229606790)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Creation Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(611154978324606790)
,p_db_column_name=>'CREATOR'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(611154225682606789)
,p_db_column_name=>'EFFECTIVEFROM'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Effective From'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(611152603702606789)
,p_db_column_name=>'HSNCODE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'HSN Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(611154588928606790)
,p_db_column_name=>'REMARK'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(611152952265606789)
,p_db_column_name=>'SACCODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'SAC Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(611153432333606789)
,p_db_column_name=>'TAXREGISTRATIONTYPECODE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Tax Registration Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(611151793064606789)
,p_db_column_name=>'TAXRULECODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Tax Rule Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(611152157455606789)
,p_db_column_name=>'TAXRULENAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Tax Rule Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(611151351500606782)
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
 p_id=>wwv_flow_imp.id(611153798670606789)
,p_db_column_name=>'TRANSACTIONTYPECODE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Transaction Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(611251172620979119)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1708649'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TNO:TAXRULECODE:TAXRULENAME:HSNCODE:SACCODE:TAXREGISTRATIONTYPECODE:TRANSACTIONTYPECODE:EFFECTIVEFROM:REMARK:CREATOR:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(611155887335606790)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(611150870194606774)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:177:&APP_SESSION.::&DEBUG.:177::'
);
wwv_flow_imp.component_end;
end;
/
