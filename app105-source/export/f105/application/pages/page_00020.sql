prompt --application/pages/page_00020
begin
--   Manifest
--     PAGE: 00020
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
 p_id=>20
,p_name=>'Item Specification List'
,p_alias=>'ITEM-SPECIFICATION-LIST'
,p_step_title=>'Item Specification List'
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
 p_id=>wwv_flow_imp.id(585394972912631849)
,p_plug_name=>'Item Specification List'
,p_static_id=>'item-specification-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select a.TNO,',
'        b.itemname,',
'       a.SNO,',
'       a.ITEMCHARACTERISTICSCODE,',
'       c.ITEMCHARACTERISTICSNAME,',
'       a.MCVALUESNO,',
'       d.value',
'       --a.VALUE',
'  from ITEMSPECIFICATIONDETAIL a , item b , ITEMCHARACTERISTICS c , mcvalue d',
'  where a.tno = b.tno',
'  and a.ITEMCHARACTERISTICSCODE = c.ITEMCHARACTERISTICSCODE',
'  and a.MCVALUESNO = d.sno */',
'',
'  select ',
'   Case',
'         When ROW_NUMBER()',
'          Over(Partition By a.itemname Order By a.itemname) = 1 Then',
'          a.itemname',
'         Else',
'          Null',
'       End itemname,',
'    Case',
'         When ROW_NUMBER()',
'          Over(Partition By a.itemname , b.itemspecificationname Order By a.itemname , b.itemspecificationname) = 1 Then',
'          b.itemspecificationname',
'         Else',
'          Null',
'       End itemspecificationname,',
'      a.tno , ',
'     -- a.itemname , ',
'     -- b.itemspecificationname , ',
'      b.sno , ',
'      b.multiplyingfactor ',
'  from item a , itemspecification b',
'where a.tno = b.tno'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Item Specification List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(585395117867631849)
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
,p_detail_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:13:P13_ITEMTNO,P13_SNO:#TNO#,#SNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>145008772616705325
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585343474971311244)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>15
,p_column_identifier=>'F'
,p_column_label=>'Item Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585344690963311256)
,p_db_column_name=>'ITEMSPECIFICATIONNAME'
,p_display_order=>25
,p_column_identifier=>'H'
,p_column_label=>'Item Specification'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585344842275311257)
,p_db_column_name=>'MULTIPLYINGFACTOR'
,p_display_order=>35
,p_column_identifier=>'I'
,p_column_label=>'Multiplying Factor'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585395811654631868)
,p_db_column_name=>'SNO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Sno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585395429274631866)
,p_db_column_name=>'TNO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(585397816627643819)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1450115'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ITEMNAME:ITEMSPECIFICATIONNAME:MULTIPLYINGFACTOR'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(585343230143311241)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(585394972912631849)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:13::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(585343385676311243)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(585394972912631849)
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
wwv_flow_imp.component_end;
end;
/
