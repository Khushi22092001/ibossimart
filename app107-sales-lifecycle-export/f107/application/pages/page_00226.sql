prompt --application/pages/page_00226
begin
--   Manifest
--     PAGE: 00226
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
 p_id=>226
,p_name=>'Show Blob_1'
,p_alias=>'SHOW-BLOB-1'
,p_page_mode=>'MODAL'
,p_step_title=>'Show Blob_1'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'td[headers="VIMAGE"] img { width: 500px;    border: 1px solid #999;    background: #f6f6f6;   }',
''))
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(566116309029637152)
,p_plug_name=>'Show Blob'
,p_static_id=>'show-blob'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-Region--removeHeader js-removeLandmark'
,p_plug_template=>2322115667525957943
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'  select ',
'A.MODULETNO,',
'A.MODULESNO,',
'A.ATTRIBUTECODE,',
'A.ATTRIBUTEVALUE,',
'dbms_lob.getlength(a.ATTACHMENTBLOB) AS ATTACHMENTBLOB,',
'FILENAME,',
'MIMETYPE',
'from moduleattachment A',
'where a.MODULETNO = :P226_TNO',
'  AND a.MODULESNO = :P226_SNO'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P226_TNO,P226_SNO'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(566116390453637152)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>117651317422472804
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(566121082614757240)
,p_db_column_name=>'ATTACHMENTBLOB'
,p_display_order=>90
,p_column_identifier=>'M'
,p_column_label=>'Filename'
,p_report_label=>'&P226_FILENAME.'
,p_sync_form_label=>'N'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'IMAGE:MODULEATTACHMENT:ATTACHMENTBLOB:MODULESNO::MIMETYPE:FILENAME:'
,p_static_id=>'VIMAGE'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(566120548570757234)
,p_db_column_name=>'ATTRIBUTECODE'
,p_display_order=>30
,p_column_identifier=>'G'
,p_column_label=>'Attributecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(566120665585757235)
,p_db_column_name=>'ATTRIBUTEVALUE'
,p_display_order=>40
,p_column_identifier=>'H'
,p_column_label=>'Attributevalue'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(566120902268757238)
,p_db_column_name=>'FILENAME'
,p_display_order=>70
,p_column_identifier=>'K'
,p_column_label=>'Filename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_static_id=>'Filename'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(566121048646757239)
,p_db_column_name=>'MIMETYPE'
,p_display_order=>80
,p_column_identifier=>'L'
,p_column_label=>'Mimetype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(507155120177339756)
,p_db_column_name=>'MODULESNO'
,p_display_order=>110
,p_column_identifier=>'O'
,p_column_label=>'Modulesno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(507155038154339755)
,p_db_column_name=>'MODULETNO'
,p_display_order=>100
,p_column_identifier=>'N'
,p_column_label=>'Moduletno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(566119648959668287)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'586335'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ATTACHMENTBLOB'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(557359980844635990)
,p_name=>'P226_FILENAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(566116309029637152)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(557359869486635989)
,p_name=>'P226_SNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(566116309029637152)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(557359801533635988)
,p_name=>'P226_TNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(566116309029637152)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
