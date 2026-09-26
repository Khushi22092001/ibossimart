prompt --application/pages/page_00293
begin
--   Manifest
--     PAGE: 00293
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
 p_id=>293
,p_name=>'Fixed Asset Register'
,p_alias=>'FIXED-ASSET-REGISTER'
,p_step_title=>'Fixed Asset Register'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(234595022220472662)
,p_plug_name=>'Fixed Asset Register'
,p_static_id=>'fixed-asset-register'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--accent4:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(234631246406336156)
,p_plug_name=>'Fixed Asset Register'
,p_static_id=>'fixed-asset-register-2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.TNo,',
' row_number() over(order by a.Tno) SerialNo,',
'f.CompanyName,',
'd.LocationName,',
'e.DocTypeName,',
'c.PartyName as AccountName,',
'a.AssetNo,',
'a.AssetDate,',
'g.VoucherNo,',
'g.VoucherDate,',
'h.ItemName,',
'i.ItemSpecificationName,',
'b.AssetCode,',
'b.AssetValue,',
'b.DepreciatedAmount',
'from Asset a, AssetCodeDetail b, Party c, Location d, DocType e, Company f, Voucher g, Item h, ItemSpecification i',
'where a.tno = b.tno ',
'and a.AccountCode = c.PartyCode',
'and a.LocationCode = d.LocationCode',
'and a.DocTypeCode = e.DocTypeCode',
'and a.CompanyCode = f.CompanyCode',
'and a.TNO = g.ModuleTNo(+)',
'and a.ItemCode = h.ItemCode',
'and a.ItemSpecificationCode = i.ItemSpecificationCode',
'and a.AssetDate Between :P293_FROMDATE and :P293_TODATE',
'and ( :P293_COMPANY IS NULL OR INSTR('':''||:P293_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 ) ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P293_COMPANY,P293_FROMDATE,P293_TODATE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Fixed Asset Register'
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
 p_id=>wwv_flow_imp.id(234631303370336157)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>57232081072742351
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(234631820324336162)
,p_db_column_name=>'ACCOUNTNAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Account Name'
,p_column_html_expression=>'<div style="display:block; width:180px">#ACCOUNTNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(234632716045336171)
,p_db_column_name=>'ASSETCODE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Asset Code'
,p_column_html_expression=>'<div style="display:block; width:110px">#ASSETCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(234632022961336164)
,p_db_column_name=>'ASSETDATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Asset Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#ASSETDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(234631961906336163)
,p_db_column_name=>'ASSETNO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Asset No'
,p_column_html_expression=>'<div style="display:block; width:180px">#ASSETNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(234632070074336165)
,p_db_column_name=>'ASSETVALUE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Asset Value'
,p_column_html_expression=>'<div style="display:block; width:100px">#ASSETVALUE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(234631502716336159)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Company Name'
,p_column_html_expression=>'<div style="display:block; width:180px">#COMPANYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(234632211004336166)
,p_db_column_name=>'DEPRECIATEDAMOUNT'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Depreciated Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#DEPRECIATEDAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(234631745210336161)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Doctype Name'
,p_column_html_expression=>'<div style="display:block; width:80px">#DOCTYPENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(234632508643336169)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Item Name'
,p_column_html_expression=>'<div style="display:block; width:80px">#ITEMNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(234632571612336170)
,p_db_column_name=>'ITEMSPECIFICATIONNAME'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Itemspecification Name'
,p_column_html_expression=>'<div style="display:block; width:120px">#ITEMSPECIFICATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(234631600206336160)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Location Name'
,p_column_html_expression=>'<div style="display:block; width:160px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(199131590680566123)
,p_db_column_name=>'SERIALNO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Serial No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(234631434895336158)
,p_db_column_name=>'TNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(234632382320336168)
,p_db_column_name=>'VOUCHERDATE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Voucher Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#VOUCHERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(234632331953336167)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Voucher No'
,p_column_html_expression=>'<div style="display:block; width:170px">#VOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(234642216456399314)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'232132'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SERIALNO:COMPANYNAME:LOCATIONNAME:DOCTYPENAME:ACCOUNTNAME:ASSETNO:ASSETDATE:ASSETVALUE:DEPRECIATEDAMOUNT:VOUCHERNO:VOUCHERDATE:ITEMNAME:ITEMSPECIFICATIONNAME:ASSETCODE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(194464294169719209)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(234595022220472662)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_grid_new_row=>'Y'
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(234663059610570523)
,p_name=>'P293_COMPANY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(234595022220472662)
,p_prompt=>'Company'
,p_placeholder=>'Enter Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct ',
'  b.CompanyName d,',
'  b.CompanyCode r',
'  From Asset a, Company b',
'  Where a.CompanyCode = b.CompanyCode;'))
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(234601265105472668)
,p_name=>'P293_FROMDATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(234595022220472662)
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(234601495999472670)
,p_name=>'P293_TODATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(234595022220472662)
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(194465799368719210)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(194466293994719210)
,p_event_id=>wwv_flow_imp.id(194465799368719210)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp.component_end;
end;
/
