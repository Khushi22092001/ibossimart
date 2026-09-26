prompt --application/pages/page_00144
begin
--   Manifest
--     PAGE: 00144
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
 p_id=>144
,p_name=>'Stock Storage Location Wise'
,p_alias=>'STOCK-STORAGE-LOCATION-WISE'
,p_step_title=>'Stock Storage Location Wise'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(621797608849646465)
,p_plug_name=>'Stock Stock Storage Location Wise'
,p_static_id=>'stock-stock-storage-location-wise'
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:is-collapsed:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs'
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
 p_id=>wwv_flow_imp.id(621797707773646466)
,p_plug_name=>'Stock Stock Storage Location Wise'
,p_static_id=>'stock-stock-storage-location-wise-2'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select  ',
'         row_number() over(order by x.Itemcode) SerialNo,',
'        x.Itemcode,',
'        x.ItemSpecificationCode,',
'        x.companycode,',
'        getcompanyname(x.companycode) as Company,',
'        /*Case',
'         When ROW_NUMBER()',
'          Over(Partition By x.Itemcode Order By x.Itemcode) = 1 Then',
'          x.Itemcode',
'         Else',
'          Null',
'       End Itemcode,*/',
'       Case',
'         When ROW_NUMBER()',
'          Over(Partition By x.Itemcode Order By x.Itemcode) = 1 Then',
'          x.ItemName',
'         Else',
'          Null',
'       End ItemName,',
'       /*Case',
'         When ROW_NUMBER()',
'          Over(Partition By x.Itemcode,ItemSpecificationCode Order By x.Itemcode,ItemSpecificationCode) = 1 Then',
'          x.ItemSpecificationCode',
'         Else',
'          Null',
'       End ItemSpecificationCode,',
'       */',
'       Case',
'         When ROW_NUMBER()',
'          Over(Partition By x.Itemcode,ItemSpecificationCode Order By x.Itemcode,ItemSpecificationCode) = 1 Then',
'          x.ItemSpecificationName',
'         Else',
'          Null',
'       End ItemSpecificationName,',
'       ',
'    /* ,',
'     x.ItemName,',
'     x.ItemSpecificationCode,',
'       x.ItemSpecificationName,*/',
'       x.storagelocationcode,',
'       x.storagelocationname,',
'       getSTLLItemOpeningQuantity1(:P144_LOCATION,',
'                                   x.storagelocationcode,',
'                                   x.ItemCode,',
'                                   x.ItemSpecificationCode,',
'                                   x.COMPANYCODE,',
'                                   :P144_ASONDATE) As ClosingQty',
'  From (Select Distinct A.ITEMCODE,',
'                        A.ITEMNAME,',
'                        B.ITEMSPECIFICATIONCODE,',
'                        B.ITEMSPECIFICATIONNAME,',
'                        e.storagelocationcode,',
'                        e.storagelocationname,',
'                        C.COMPANYCODE',
'          From ITEM               A,',
'               ITEMSPECIFICATION  B,',
'               stock              c,',
'               stockstoragedetail d,',
'               Storagelocation    e,',
'               Location           f',
'         Where A.TNO = B.TNO',
'           And a.itemcode = c.itemcode',
'           And b.itemspecificationcode = c.itemspecificationcode',
'           And c.tno = d.tno',
'           And d.storagelocationcode = e.storagelocationcode',
'           ---- Filter',
'           AND LENGTH(:P144_ASONDATE) > 0 ',
'          AND ( INSTR('':''||:P144_COMPANY||'':'','':''||C.COMPANYCODE||'':'') > 0)',
'          AND ( INSTR('':''||:P144_LOCATION||'':'','':''||C.LOCATIONCODE||'':'') > 0)',
'          AND ( :P144_ITEM IS NULL OR INSTR('':''||:P144_ITEM||'':'','':''||A.ITEMCODE||'':'') > 0 )',
'          AND ( :P144_ITEMSPECIFICATION IS NULL OR INSTR('':''||:P144_ITEMSPECIFICATION||'':'','':''||B.ITEMSPECIFICATIONCODE||'':'') > 0 )',
'          AND ( :P144_ITEMNATURE IS NULL OR INSTR('':''||:P144_ITEMNATURE||'':'','':''||a.itemnatureCODE||'':'') > 0 )',
'          AND ( :P144_STORAGELOCATION IS NULL OR INSTR('':''||:P144_STORAGELOCATION||'':'','':''||E.STORAGELOCATIONCODE||'':'') > 0 ) ',
'           ) x',
'  Where getSTLLItemOpeningQuantity1(:P144_LOCATION,',
'                                   x.storagelocationcode,',
'                                   x.ItemCode,',
'                                   x.ItemSpecificationCode,',
'                                   X.COMPANYCODE,',
'                                   :P144_ASONDATE) > 0',
'                                   ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P144_COMPANY,P144_LOCATION,P144_ASONDATE,P144_FROMDATE,P144_TODATE,P144_STORAGELOCATION,P144_ITEM,P144_ITEMNATURE,P144_ITEMSPECIFICATION'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Stock Stock Storage Location Wise'
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
 p_id=>wwv_flow_imp.id(504910521882991107)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>65925652683293123
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(504911255120991114)
,p_db_column_name=>'CLOSINGQTY'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Closing Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(440789338926291259)
,p_db_column_name=>'COMPANY'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(440789212380291258)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Companycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(504910610637991108)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Itemcode'
,p_column_html_expression=>'<div style="display:block; width:80px">#ITEMCODE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(504910729187991109)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Item Name'
,p_column_link=>'f?p=&APP_ID.:407:&SESSION.::&DEBUG.:407:P407_COMPANY,P407_FROMDATE,P407_TODATE,P407_ITEM,P407_LOCATION:&P144_COMPANY.,&GLOBAL_FINANCIALYEARBEGIN.,&P144_ASONDATE.,#ITEMCODE#,&P144_LOCATION.'
,p_column_linktext=>'#ITEMNAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(504910824589991110)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Itemspecificationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(504910900648991111)
,p_db_column_name=>'ITEMSPECIFICATIONNAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Item Specification'
,p_column_link=>'f?p=&APP_ID.:407:&SESSION.::&DEBUG.:407:P407_COMPANY,P407_FROMDATE,P407_ITEM,P407_ITEMSPECIFICATION,P407_TODATE,P407_LOCATION:&P144_COMPANY.,&GLOBAL_FINANCIALYEARBEGIN.,#ITEMCODE#,#ITEMSPECIFICATIONCODE#,&P144_ASONDATE.,&P144_LOCATION.'
,p_column_linktext=>'#ITEMSPECIFICATIONNAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189650228115099748)
,p_db_column_name=>'SERIALNO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Serial No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(504911031021991112)
,p_db_column_name=>'STORAGELOCATIONCODE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Storagelocationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(504911113522991113)
,p_db_column_name=>'STORAGELOCATIONNAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Storage Location'
,p_column_link=>'f?p=&APP_ID.:407:&SESSION.::&DEBUG.:407:P407_COMPANY,P407_LOCATION,P407_FROMDATE,P407_TODATE,P407_ITEM,P407_ITEMSPECIFICATION,P407_STORAGELOCATION:&P144_COMPANY.,&P144_LOCATION.,&GLOBAL_FINANCIALYEARBEGIN.,&P144_ASONDATE.,#ITEMCODE#,#ITEMSPECIFICATIO'
||'NCODE#,#STORAGELOCATIONCODE#'
,p_column_linktext=>'#STORAGELOCATIONNAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(506224591084755802)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'672398'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SERIALNO:ITEMNAME:ITEMSPECIFICATIONNAME:STORAGELOCATIONNAME:CLOSINGQTY'
,p_sum_columns_on_break=>'CLOSINGQTY'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(506163234187266720)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(621797707773646466)
,p_button_name=>'CUSTOM'
,p_static_id=>'custom'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Custom'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/StockStatus.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P144_FROMDATE=&P144_FROMDATE.&P144_TODATE=&P144_TODATE.&P144_LOCATION=&P144_LOCATION.&P144_ITEM=&P144_ITEM.&'
,p_button_condition=>'P144_ITEM'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(506163533669266720)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(621797707773646466)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Pdf'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/StockStatus.xdo?id=weblogic&passwd=webboss123&_xpt=1&_xmode=1&P144_FROMDATE=&P144_FROMDATE.&P144_TODATE=&P144_TODATE.&P144_LOCATION=&P144_LOCATION.&P144_ITEM=&P144_ITEM.&_xf=pdf'
,p_button_condition=>'P144_ITEM'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(506150213059266529)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(621797608849646465)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'N'
,p_grid_column_span=>3
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(504909576074991098)
,p_name=>'P144_ASONDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(621797608849646465)
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'As On Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>45
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(530294261472570435)
,p_name=>'P144_COMPANY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(621797608849646465)
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      c.CompanyName d,',
'      c.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''STOCKSTATEMENT''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
'  ;',
''))
,p_cSize=>30
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(530369087597725348)
,p_name=>'P144_FROMDATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(621797608849646465)
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(530370207543725349)
,p_name=>'P144_ITEM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(621797608849646465)
,p_prompt=>'Item '
,p_placeholder=>'Material List'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select DISTINCT',
'      e.ItemName d,',
'      e.ItemCode r',
'From  Item e, ItemSpecification ee',
'Where e.itemclassificationcode = ''MATERIAL''',
'Order by 1'))
,p_cSize=>74
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '3',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(530371028112725349)
,p_name=>'P144_ITEMNATURE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(621797608849646465)
,p_prompt=>'Item  Nature'
,p_placeholder=>'Select Material Group Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  Select a.ItemnatureName As d,',
'       a.ItemNatureCode As r',
'  From ItemNature a',
'  order by 1',
'/*',
'select ',
'distinct ',
'getitemname(a.parentcode) as d,',
'a.parentcode as r',
'from item a',
'order by 1',
'*/'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(530294573588570438)
,p_name=>'P144_ITEMSPECIFICATION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(621797608849646465)
,p_prompt=>'Specification'
,p_placeholder=>'Select Item Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      ee.ItemSpecificationName as d,',
'      ee.ItemSpecificationCode as r',
'From  Item e, ItemSpecification ee',
'Where e.TNo = ee.TNo',
'  and e.ItemCode = :P144_ITEM',
'Order by 1'))
,p_lov_cascade_parent_items=>'P144_ITEM'
,p_ajax_items_to_submit=>'P144_ITEMSPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>74
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '3',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(530369875792725348)
,p_name=>'P144_LOCATION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(621797608849646465)
,p_prompt=>'Location'
,p_placeholder=>'Enter Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT l.LocationName d,l.LocationCode r FROM LOCATION L  WHERE L.LOCATIONCODE IN (SELECT LOCATIONCODE FROM STOCK)',
'/*Select',
'      l.LocationName d,',
'      l.LocationCode r',
'From  ModulePrivilege a, ModulePrivilegeLocation b, Location l, BossUser bu, MODULELOCATION ML, MODULELOCATIONDETAIL MD',
'Where a.TNo = b.TNo(+)',
'  AND A.MODULECODE = ML.MODULECODE',
'  AND ML.TNO = MD.TNO',
'  AND (B.LOCATIONCODE = L.LOCATIONCODE OR B.LOCATIONCODE IS NULL)',
'  and (MD.LocationCode = l.LocationCode )',
'  and a.ModuleCode = ''GRN''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
';',
'*/'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(530370659662725349)
,p_name=>'P144_STORAGELOCATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(621797608849646465)
,p_prompt=>'Storage Loc'
,p_placeholder=>'Select Storage Location Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT STORAGELOCATIONNAME AS D,',
'STORAGELOCATIONCODE AS R',
'FROM STORAGELOCATION ',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(530369411684725348)
,p_name=>'P144_TODATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(621797608849646465)
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(189702859803580080)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(189703218964580080)
,p_event_id=>wwv_flow_imp.id(189702859803580080)
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
