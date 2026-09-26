prompt --application/pages/page_00518
begin
--   Manifest
--     PAGE: 00518
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
 p_id=>518
,p_name=>'Product Dashboard'
,p_alias=>'PRODUCT-DASHBOARD'
,p_step_title=>'Product Dashboard'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.customerinfo{background-color: #CAF279;}',
'.monthsale{height: 349px;border-color:gainsboro;border-width: 3px;}',
'.mytext{font-weight: 500;}',
'.cardtitle{font-size: 30px;font-family:''Calibri'';font-weight: 900;margin-bottom: 20px;}',
'.cardsubtitle{font-size: 25px;font-family:''Calibri'';font-weight: 700;}',
'.color1{background-color: #f84f4f;}',
'.color2{background-color: #b51212}',
'.color3{background-color: #12b5b5}',
'.color4{background-color: #75d9d9}',
'.color5{background-color: #cf98e0}',
'.color6{background-color: #a9e098}',
'.color7{background-color: #fbb1c7}',
'.color8{background-color: #b1fbe5}',
'.color9{background-color: #f48956}',
'.color10{background-color:#fefe69;margin-top: 1em;}',
'.region1{background-color: #82b5d4ca;height: 240px;}',
'.hiddenscroll{overflow: hidden;}',
'.reportheight{height: 350px; overflow: auto !important;}',
'.caption{font-weight: bold;}',
'.captionvalue{font-weight: normal;}',
'.caption2{font-weight: bold;color: white;}',
'.captionvalue2{font-weight: normal;color:white}',
'',
'.t-Form-label{padding-top: 0px;padding-bottom: 0px;margin-top: 0px;margin-bottom: 0px;padding-right: 2px;margin-right:2px;width: 100%;}',
'.reportheight2{height: 349px; overflow: auto !important;}',
'.reportheight3{height: 182px; overflow: auto !important;}',
'',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(450180815701925885)
,p_plug_name=>'12 Months Details'
,p_static_id=>'12-months-details'
,p_parent_plug_id=>wwv_flow_imp.id(462196471922447792)
,p_region_css_classes=>'reportheight2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Select',
'     level',
'From dual',
'connect by level <= 13',
'*/',
'',
'Select',
'     xx.Months,',
'     xx.MONTHSYY,',
'     nvl(sum(Purchase),0) Purchase,',
'     nvl(sum(Sales),0) Sales,',
'     nvl(sum(Production),0) production',
'',
'From ',
'(Select',
'     x.Months,',
'     x.MONTHSYY,',
'     Decode(x.Module,''PURCHASE'',x.Amount) as Purchase,',
'     Decode(x.Module,''SALE'',x.Amount) as Sales,',
'     Decode(x.Module,''PRODUCTION'',x.Amount) as Production',
'From ',
'(select ',
'   ''PURCHASE'' as Module,',
'   TO_CHAR(PBPASSDATE,''MON-YYYY'')AS MONTHS,',
'   TO_CHAR(PBPASSDATE,''YYYYMM'')AS MONTHSYY,',
'   SUM(TOTALAMOUNT) AMOUNT',
'from D_SUPPLIER_360VIEW_ACTIVEPBPASS',
'WHERE ItemSpecificationCode like nvl(:P518_ITEMSPECIFICATIONCODEP,''%'')',
'GROUP BY TO_CHAR(PBPASSDATE,''MON-YYYY''),TO_CHAR(PBPASSDATE,''YYYYMM'')',
'Union All',
'select ',
'   ''SALE'' as Module,',
'   TO_CHAR(CCINVOICEDATE,''MON-YYYY'')AS MONTHS,',
'   TO_CHAR(CCINVOICEDATE,''YYYYMM'')AS MONTHSYY,',
'   SUM(TOTALAMOUNT) AMOUNT',
'from D_CUSTOMER_360VIEW_ACTIVEINVOICE',
'WHERE ItemSpecificationCode like nvl(:P518_ITEMSPECIFICATIONCODEP,''%'')',
'GROUP BY TO_CHAR(CCINVOICEDATE,''MON-YYYY''),TO_CHAR(CCINVOICEDATE,''YYYYMM'')',
'Union All',
'select ',
'   ''PRODUCTION'' as Module,',
'   TO_CHAR(PRODUCTIONDATE,''MON-YYYY'')AS MONTHS,',
'   TO_CHAR(PRODUCTIONDATE,''YYYYMM'')AS MONTHSYY,',
'   SUM(AMOUNT) AMOUNT',
'from D_PRODUCT360VIEW_PRODUCTION',
'WHERE ItemSpecificationCode like nvl(:P518_ITEMSPECIFICATIONCODEP,''%'')',
'GROUP BY TO_CHAR(PRODUCTIONDATE,''MON-YYYY''),TO_CHAR(PRODUCTIONDATE,''YYYYMM'')',
'order by 3 ',
')x',
')xx',
'Where rownum<=12',
'Group by xx.Months,xx.MONTHSYY',
'order by 2',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_header=>'<h3 style="font-family:Calibri;text-align:center;background-color: gainsboro;margin-top: 0em;">12 Months Detail</h3>'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(450181440731925891)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<H2 style="height:215px; text-align:centre"><br>DATA ',
'<br>NOT FOUND'))
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>11196571532227907
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450182316898925900)
,p_db_column_name=>'MONTHS'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>'Months'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450182432322925901)
,p_db_column_name=>'MONTHSYY'
,p_display_order=>20
,p_column_identifier=>'J'
,p_column_label=>'Monthsyy'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450182796461925904)
,p_db_column_name=>'PRODUCTION'
,p_display_order=>50
,p_column_identifier=>'M'
,p_column_label=>'Production'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450182510149925902)
,p_db_column_name=>'PURCHASE'
,p_display_order=>30
,p_column_identifier=>'K'
,p_column_label=>'Purchase'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450182699476925903)
,p_db_column_name=>'SALES'
,p_display_order=>40
,p_column_identifier=>'L'
,p_column_label=>'Sales'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(450282301444581973)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'71976'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MONTHS:PRODUCTION:PURCHASE:SALES'
,p_sum_columns_on_break=>'PRODUCTION:PURCHASE:SALES'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(462197464370447802)
,p_plug_name=>'12 Months Details'
,p_static_id=>'12-months-details-2'
,p_parent_plug_id=>wwv_flow_imp.id(462196471922447792)
,p_region_css_classes=>'monthsale'
,p_region_template_options=>'#DEFAULT#:i-h320:t-Region--textContent:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(441431460184653823)
,p_region_id=>wwv_flow_imp.id(462197464370447802)
,p_chart_type=>'bar'
,p_width=>'786'
,p_height=>'270'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'on'
,p_connect_nulls=>'Y'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(441433698570653824)
,p_chart_id=>wwv_flow_imp.id(441431460184653823)
,p_static_id=>'12-months-detail'
,p_seq=>10
,p_name=>'12 Months Detail'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      x.Module,',
'      x.Months,',
'      x.Monthsyy,',
'      x.Amount,',
'      x.ItemSpecificationCode',
'From ',
'(select ',
'   ''PURCHASE'' as Module,',
'   ItemSpecificationCode,',
'   TO_CHAR(PBPASSDATE,''MON-YYYY'')AS MONTHS,',
'   TO_CHAR(PBPASSDATE,''YYYYMM'')AS MONTHSYY,',
'   SUM(TOTALAMOUNT) AMOUNT',
'from D_SUPPLIER_360VIEW_ACTIVEPBPASS',
'WHERE ItemSpecificationCode like nvl(:P518_ITEMSPECIFICATIONCODEP,''%'')',
'GROUP BY TO_CHAR(PBPASSDATE,''MON-YYYY''),TO_CHAR(PBPASSDATE,''YYYYMM''),ItemSpecificationCode',
'Union All',
'select ',
'   ''SALE'' as Module,',
'   ItemSpecificationCode,',
'   TO_CHAR(CCINVOICEDATE,''MON-YYYY'')AS MONTHS,',
'   TO_CHAR(CCINVOICEDATE,''YYYYMM'')AS MONTHSYY,',
'   SUM(TOTALAMOUNT) AMOUNT',
'from D_CUSTOMER_360VIEW_ACTIVEINVOICE',
'WHERE ItemSpecificationCode like nvl(:P518_ITEMSPECIFICATIONCODEP,''%'')',
'GROUP BY TO_CHAR(CCINVOICEDATE,''MON-YYYY''),TO_CHAR(CCINVOICEDATE,''YYYYMM''),ItemSpecificationCode',
'Union All',
'select ',
'   ''PRODUCTION'' as Module,',
'   ItemSpecificationCode,',
'   TO_CHAR(PRODUCTIONDATE,''MON-YYYY'')AS MONTHS,',
'   TO_CHAR(PRODUCTIONDATE,''YYYYMM'')AS MONTHSYY,',
'   SUM(AMOUNT) AMOUNT',
'from D_PRODUCT360VIEW_PRODUCTION',
'WHERE ItemSpecificationCode like nvl(:P518_ITEMSPECIFICATIONCODEP,''%'')',
'GROUP BY TO_CHAR(PRODUCTIONDATE,''MON-YYYY''),TO_CHAR(PRODUCTIONDATE,''YYYYMM''),ItemSpecificationCode',
')x',
'Where rownum <= 12',
'order by 3 '))
,p_series_type=>'bar'
,p_series_name_column_name=>'MODULE'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'MONTHS'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:540:&SESSION.::&DEBUG.:540:P540_MONTH,P540_MODULE,P540_ITEMSPECIFICATIONCODE:&MONTHS.,&MODULE.,&ITEMSPECIFICATIONCODE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(441431906722653824)
,p_chart_id=>wwv_flow_imp.id(441431460184653823)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(441432543756653824)
,p_chart_id=>wwv_flow_imp.id(441431460184653823)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(441433146647653824)
,p_chart_id=>wwv_flow_imp.id(441431460184653823)
,p_static_id=>'y-2'
,p_axis=>'y2'
,p_is_rendered=>'off'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_split_dual_y=>'auto'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(450312646629780571)
,p_plug_name=>'12 Months Production'
,p_static_id=>'12-months-production'
,p_parent_plug_id=>wwv_flow_imp.id(462196471922447792)
,p_region_css_classes=>'reportheight '
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Select',
'     level',
'From dual',
'connect by level <= 13',
'*/',
'Select',
'     x.Months,',
'     x.Qty,',
'     x.Amount',
'From (',
'select ',
'       TO_CHAR(PRODUCTIONDATE,''MON-YYYY'')AS MONTHS,',
'       TO_CHAR(PRODUCTIONDATE,''YYYYMM'')AS MONTHSYY,',
'       sum(QUANTITY1)Qty,',
'       SUM(AMOUNT) AMOUNT',
'  from D_PRODUCT360VIEW_PRODUCTION',
'  WHERE ItemSpecificationCode like nvl(:P518_ITEMSPECIFICATIONCODEP,''%'')',
'  GROUP BY TO_CHAR(PRODUCTIONDATE,''MON-YYYY''),TO_CHAR(PRODUCTIONDATE,''YYYYMM'')',
'  ORDER BY TO_CHAR(PRODUCTIONDATE,''YYYYMM'')',
'  )x',
'Where rownum <= 12',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_header=>'<h3 style="font-family:Calibri;text-align:center;background-color: gainsboro;margin-top: .7em;">12 Months Production</h3>'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(450312799880780572)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<H2 style="height:200px; text-align:centre"><br>PRODUCTION DATA ',
'<br>NOT FOUND'))
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>11327930681082588
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450313061768780575)
,p_db_column_name=>'AMOUNT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450312870305780573)
,p_db_column_name=>'MONTHS'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Months'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450312984104780574)
,p_db_column_name=>'QTY'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(450327317861802180)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'72427'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MONTHS:QTY:AMOUNT'
,p_sum_columns_on_break=>'QTY:AMOUNT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(462292224061815801)
,p_plug_name=>'12 Months Purchase'
,p_static_id=>'12-months-purchase'
,p_region_name=>'MYID'
,p_parent_plug_id=>wwv_flow_imp.id(462196471922447792)
,p_region_css_classes=>'reportheight '
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Select',
'     level',
'From dual',
'connect by level <= 13',
'*/',
'Select',
'     x.Months,',
'     x.Qty,',
'     x.Amount',
'From (',
'select ',
'       TO_CHAR(PBPASSDATE,''MON-YYYY'')AS MONTHS,',
'       TO_CHAR(PBPASSDATE,''YYYYMM'')AS MONTHSYY,',
'       sum(QUANTITY1)Qty,',
'       SUM(TOTALAMOUNT) AMOUNT',
'  from D_SUPPLIER_360VIEW_ACTIVEPBPASS',
'  WHERE ItemSpecificationCode like nvl(:P518_ITEMSPECIFICATIONCODEP,''%'')',
'  GROUP BY TO_CHAR(PBPASSDATE,''MON-YYYY''),TO_CHAR(PBPASSDATE,''YYYYMM'')',
'  ORDER BY TO_CHAR(PBPASSDATE,''YYYYMM'')',
'  )x',
'Where rownum <= 12',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_header=>'<h3 style="font-family:Calibri;text-align:center;background-color: gainsboro;margin-top: .7em;">12 Months Purchase</h3>'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(462292487543815804)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<H2 style="height:200px; text-align:centre"><br>PURCHASE DATA ',
'<br>NOT FOUND'))
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>23307618344117820
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450229279156003660)
,p_db_column_name=>'AMOUNT'
,p_display_order=>20
,p_column_identifier=>'E'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450228902671003659)
,p_db_column_name=>'MONTHS'
,p_display_order=>10
,p_column_identifier=>'D'
,p_column_label=>'Months'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450182819076925905)
,p_db_column_name=>'QTY'
,p_display_order=>30
,p_column_identifier=>'F'
,p_column_label=>'Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(462521872315642187)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'71449'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MONTHS:QTY:AMOUNT'
,p_sum_columns_on_break=>'AMOUNT:QTY'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(450183911488925916)
,p_plug_name=>'12 Months Sale'
,p_static_id=>'12-months-sale'
,p_parent_plug_id=>wwv_flow_imp.id(462196471922447792)
,p_region_css_classes=>'reportheight '
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Select',
'     level',
'From dual',
'connect by level <= 13',
'*/',
'Select',
'     x.Months,',
'     x.Qty,',
'     x.Amount',
'From (',
'select ',
'       TO_CHAR(CCINVOICEDATE,''MON-YYYY'')AS MONTHS,',
'       TO_CHAR(CCINVOICEDATE,''YYYYMM'')AS MONTHSYY,',
'       sum(QUANTITY1)Qty,',
'       SUM(TOTALAMOUNT) AMOUNT',
'  from D_CUSTOMER_360VIEW_ACTIVEINVOICE',
'  WHERE ItemSpecificationCode like nvl(:P518_ITEMSPECIFICATIONCODEP,''%'')',
'  GROUP BY TO_CHAR(CCINVOICEDATE,''MON-YYYY''),TO_CHAR(CCINVOICEDATE,''YYYYMM'')',
'  ORDER BY TO_CHAR(CCINVOICEDATE,''YYYYMM'')',
'  )x',
'Where rownum <= 12',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_header=>'<h3 style="font-family:Calibri;text-align:center;background-color: gainsboro;margin-top: .7em;">12 Months Sale</h3>'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(450184062509925917)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<H2 style="height:200px; text-align:centre"><br>SALE DATA ',
'<br>NOT FOUND'))
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>11199193310227933
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450312572932780570)
,p_db_column_name=>'AMOUNT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450184207559925918)
,p_db_column_name=>'MONTHS'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Months'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450184275180925919)
,p_db_column_name=>'QTY'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(450319280808780898)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'72346'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MONTHS:QTY:AMOUNT'
,p_sum_columns_on_break=>'QTY:AMOUNT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(462866372332804012)
,p_plug_name=>'Ageing Summary'
,p_static_id=>'ageing-summary'
,p_parent_plug_id=>wwv_flow_imp.id(462196471922447792)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select COMPANYCODE,',
'       COMPANYNAME,',
'       LOCATIONCODE,',
'       LOCATIONNAME,',
'       ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       QTY10030,',
'       QTY20030,',
'       VALUE0030,',
'       QTY13160,',
'       QTY23160,',
'       VALUE3160,',
'       QTY16190,',
'       QTY26190,',
'       VALUE6190,',
'       QTY191120,',
'       QTY291120,',
'       VALUE91120,',
'       QTY1121150,',
'       QTY2121150,',
'       VALUE121150,',
'       QTY1151180,',
'       QTY2151180,',
'       VALUE151180,',
'       ABOVE180QTY1,',
'       ABOVE180QTY2,',
'       ABOVE180VALUE',
'  from D_PRODUCT360VIEW_STOCKAGEWISE',
'  Where ItemSpecificationCode like nvl(:P518_ITEMSPECIFICATIONCODEP,''%'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_header=>'<h3 style="font-family:Calibri;text-align:center;background-color: gainsboro;margin-top: 0em;">Stock Ageing Summary</h3>'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(462866580719804014)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>23881711520106030
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450314569817780590)
,p_db_column_name=>'ABOVE180QTY1'
,p_display_order=>370
,p_column_identifier=>'BG'
,p_column_label=>'P&nbspQty&nbsp(Above_180)'
,p_column_link=>'f?p=&APP_ID.:539:&SESSION.::&DEBUG.:539:P539_ITEMSPECIFICATIONCODE,P539_FROMAGE,P539_TOAGE:#ITEMSPECIFICATIONCODE#,181,99999999'
,p_column_linktext=>'#ABOVE180QTY1#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450314620948780591)
,p_db_column_name=>'ABOVE180QTY2'
,p_display_order=>380
,p_column_identifier=>'BH'
,p_column_label=>'S&nbspQty&nbsp(Above_180)'
,p_column_link=>'f?p=&APP_ID.:539:&SESSION.::&DEBUG.:539:P539_ITEMSPECIFICATIONCODE,P539_FROMAGE,P539_TOAGE:#ITEMSPECIFICATIONCODE#,181,999999'
,p_column_linktext=>'#ABOVE180QTY2#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450223217053003656)
,p_db_column_name=>'ABOVE180VALUE'
,p_display_order=>220
,p_column_identifier=>'AR'
,p_column_label=>'Amount&nbsp(Above_180)'
,p_column_html_expression=>'<div style="display:block; width:80px">#ABOVE180VALUE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450214839977003653)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Companycode'
,p_column_html_expression=>'<div style="display:block; width:80px">#COMPANYCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450215280923003653)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Companyname'
,p_column_html_expression=>'<div style="display:block; width:200px">#COMPANYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450313186048780576)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>230
,p_column_identifier=>'AS'
,p_column_label=>'Itemcode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450313260262780577)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>240
,p_column_identifier=>'AT'
,p_column_label=>'Itemspecificationcode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450215671397003653)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Locationcode'
,p_column_html_expression=>'<div style="display:block; width:80px">#LOCATIONCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450216072558003653)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Locationname'
,p_column_html_expression=>'<div style="display:block; width:80px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450313323902780578)
,p_db_column_name=>'QTY10030'
,p_display_order=>250
,p_column_identifier=>'AU'
,p_column_label=>'P&nbspQty&nbsp(0_30)'
,p_column_link=>'f?p=&APP_ID.:539:&SESSION.::&DEBUG.::P539_ITEMSPECIFICATIONCODE,P539_FROMAGE,P539_TOAGE:#ITEMSPECIFICATIONCODE#,0,30'
,p_column_linktext=>'#QTY10030#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450314202091780586)
,p_db_column_name=>'QTY1121150'
,p_display_order=>330
,p_column_identifier=>'BC'
,p_column_label=>'P&nbspQty&nbsp(121_150)'
,p_column_link=>'f?p=&APP_ID.:539:&SESSION.::&DEBUG.:539:P539_ITEMSPECIFICATIONCODE,P539_FROMAGE,P539_TOAGE:#ITEMSPECIFICATIONCODE#,121,150'
,p_column_linktext=>'#QTY1121150#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450314394058780588)
,p_db_column_name=>'QTY1151180'
,p_display_order=>350
,p_column_identifier=>'BE'
,p_column_label=>'P&nbspQty&nbsp(151_180)'
,p_column_link=>'f?p=&APP_ID.:539:&SESSION.::&DEBUG.:539:P539_ITEMSPECIFICATIONCODE,P539_FROMAGE,P539_TOAGE:#ITEMSPECIFICATIONCODE#,151,180'
,p_column_linktext=>'#QTY1151180#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450313570738780580)
,p_db_column_name=>'QTY13160'
,p_display_order=>270
,p_column_identifier=>'AW'
,p_column_label=>'P&nbspQty&nbsp(31_60)'
,p_column_link=>'f?p=&APP_ID.:539:&SESSION.::&DEBUG.:539:P539_ITEMSPECIFICATIONCODE,P539_FROMAGE,P539_TOAGE:#ITEMSPECIFICATIONCODE#,31,60'
,p_column_linktext=>'#QTY13160#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450313717482780582)
,p_db_column_name=>'QTY16190'
,p_display_order=>290
,p_column_identifier=>'AY'
,p_column_label=>'P&nbspQty&nbsp(61_90)'
,p_column_link=>'f?p=&APP_ID.:539:&SESSION.::&DEBUG.:539:P539_ITEMSPECIFICATIONCODE,P539_FROMAGE,P539_TOAGE:#ITEMSPECIFICATIONCODE#,61,90'
,p_column_linktext=>'#QTY16190#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450313972390780584)
,p_db_column_name=>'QTY191120'
,p_display_order=>310
,p_column_identifier=>'BA'
,p_column_label=>'P&nbspQty&nbsp(91_120)'
,p_column_link=>'f?p=&APP_ID.:539:&SESSION.::&DEBUG.:539:P539_ITEMSPECIFICATIONCODE,P539_FROMAGE,P539_TOAGE:#ITEMSPECIFICATIONCODE#,91,120'
,p_column_linktext=>'#QTY191120#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450313411292780579)
,p_db_column_name=>'QTY20030'
,p_display_order=>260
,p_column_identifier=>'AV'
,p_column_label=>'S&nbspQty&nbsp(0_30)'
,p_column_link=>'f?p=&APP_ID.:539:&SESSION.::&DEBUG.:539:P539_ITEMSPECIFICATIONCODE,P539_FROMAGE,P539_TOAGE:#ITEMSPECIFICATIONCODE#,0,30'
,p_column_linktext=>'#QTY20030#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450314265165780587)
,p_db_column_name=>'QTY2121150'
,p_display_order=>340
,p_column_identifier=>'BD'
,p_column_label=>'S&nbspQty&nbsp(121_150)'
,p_column_link=>'f?p=&APP_ID.:539:&SESSION.::&DEBUG.:539:P539_ITEMSPECIFICATIONCODE,P539_FROMAGE,P539_TOAGE:#ITEMSPECIFICATIONCODE#,121,150'
,p_column_linktext=>'#QTY2121150#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450314454710780589)
,p_db_column_name=>'QTY2151180'
,p_display_order=>360
,p_column_identifier=>'BF'
,p_column_label=>'S&nbspQty&nbsp(151_180)'
,p_column_link=>'f?p=&APP_ID.:539:&SESSION.::&DEBUG.:Y,539:P539_ITEMSPECIFICATIONCODE,P539_FROMAGE,P539_TOAGE:#ITEMSPECIFICATIONCODE#,151,180'
,p_column_linktext=>'#QTY2151180#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450313681207780581)
,p_db_column_name=>'QTY23160'
,p_display_order=>280
,p_column_identifier=>'AX'
,p_column_label=>'S&nbspQty&nbsp(31_60)'
,p_column_link=>'f?p=&APP_ID.:539:&SESSION.::&DEBUG.:539:P539_ITEMSPECIFICATIONCODE,P539_FROMAGE,P539_TOAGE:#ITEMSPECIFICATIONCODE#,31,60'
,p_column_linktext=>'#QTY23160#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450313844209780583)
,p_db_column_name=>'QTY26190'
,p_display_order=>300
,p_column_identifier=>'AZ'
,p_column_label=>'S&nbspQty&nbsp(61_90)'
,p_column_link=>'f?p=&APP_ID.:539:&SESSION.::&DEBUG.:539:P539_ITEMSPECIFICATIONCODE,P539_FROMAGE,P539_TOAGE:#ITEMSPECIFICATIONCODE#,61,90'
,p_column_linktext=>'#QTY26190#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450314012126780585)
,p_db_column_name=>'QTY291120'
,p_display_order=>320
,p_column_identifier=>'BB'
,p_column_label=>'S&nbspQty&nbsp(91_120)'
,p_column_link=>'f?p=&APP_ID.:539:&SESSION.::&DEBUG.:539:P539_ITEMSPECIFICATIONCODE,P539_FROMAGE,P539_TOAGE:#ITEMSPECIFICATIONCODE#,91,120'
,p_column_linktext=>'#QTY291120#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450218462767003654)
,p_db_column_name=>'VALUE0030'
,p_display_order=>100
,p_column_identifier=>'AF'
,p_column_label=>'Amount&nbsp(0_30)'
,p_column_html_expression=>'<div style="display:block; width:80px">#VALUE0030#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450221622489003655)
,p_db_column_name=>'VALUE121150'
,p_display_order=>180
,p_column_identifier=>'AN'
,p_column_label=>'Amount&nbsp(121_150)'
,p_column_html_expression=>'<div style="display:block; width:80px">#VALUE121150#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450222445394003656)
,p_db_column_name=>'VALUE151180'
,p_display_order=>200
,p_column_identifier=>'AP'
,p_column_label=>'Amount&nbsp(151_180)'
,p_column_html_expression=>'<div style="display:block; width:80px">#VALUE151180#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450219296383003655)
,p_db_column_name=>'VALUE3160'
,p_display_order=>120
,p_column_identifier=>'AH'
,p_column_label=>'Amount&nbsp(31_60)'
,p_column_html_expression=>'<div style="display:block; width:80px">#VALUE3160#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450220066044003655)
,p_db_column_name=>'VALUE6190'
,p_display_order=>140
,p_column_identifier=>'AJ'
,p_column_label=>'Amount&nbsp(61_90)'
,p_column_html_expression=>'<div style="display:block; width:80px">#VALUE6190#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450220894068003655)
,p_db_column_name=>'VALUE91120'
,p_display_order=>160
,p_column_identifier=>'AL'
,p_column_label=>'Amount&nbsp(91_120)'
,p_column_html_expression=>'<div style="display:block; width:80px">#VALUE91120#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(463046615343363498)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'71389'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'QTY10030:QTY20030:VALUE0030:QTY13160:QTY23160:VALUE3160:QTY16190:QTY26190:VALUE6190:QTY191120:QTY291120:VALUE91120:QTY1121150:QTY2121150:VALUE121150:QTY1151180:QTY2151180:VALUE151180:ABOVE180QTY1:ABOVE180QTY2:ABOVE180VALUE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(462293437594815814)
,p_plug_name=>'Credit'
,p_static_id=>'credit'
,p_parent_plug_id=>wwv_flow_imp.id(462196471922447792)
,p_region_css_classes=>'region1'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--accent14:t-Region--hiddenOverflow'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(462196471922447792)
,p_plug_name=>'Product Dashboard'
,p_static_id=>'product-dashboard'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(462196893895447796)
,p_plug_name=>'Profile'
,p_static_id=>'profile'
,p_parent_plug_id=>wwv_flow_imp.id(462196471922447792)
,p_region_css_classes=>'customerinfo t-Form-label'
,p_region_template_options=>'#DEFAULT#:i-h240:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(450457771298463208)
,p_plug_name=>'Stock Storage Location'
,p_static_id=>'stock-storage-location'
,p_parent_plug_id=>wwv_flow_imp.id(462196471922447792)
,p_region_css_classes=>'reportheight3'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>100
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       ',
'       ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       STORAGELOCATIONCODE,',
'       ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':538:''||:APP_SESSION||''::''||'':538:P538_ITEMSPECIFICATIONCODE,P538_STORAGELOCATION:''||ITEMSPECIFICATIONCODE||'',''||STORAGELOCATIONCODE,NULL,''SESSION'' )||''">''||STORAGELOCATIONNAME||''</a>'' as St'
||'orageLink,',
'       NVL(SUM(BALANCEQUANTITY1),0)BALANCEQUANTITY1,',
'       NVL(SUM(BALANCEQUANTITY2),0)BALANCEQUANTITY2,',
'       NVL(SUM(STOCKVALUE),0)STOCKVALUE',
'  from D_PRODUCT360VIEW_STOCKSTORAGELOCATIONWISE',
'  where  ITEMSPECIFICATIONCODE like nvl(:P104_ITEMSPECIFICATIONCODE,''%'')',
'  GROUP BY ITEMCODE,',
'           ITEMSPECIFICATIONCODE,',
'           STORAGELOCATIONCODE,',
'           STORAGELOCATIONNAME'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_header=>'<h3 style="font-family:Calibri;text-align:center;background-color: gainsboro;margin-top: .7em;">Stock Storage Location wise</h3>'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(450457952618463210)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<H2 style="height:170px; text-align:centre"><br>STOCK DATA ',
'<br>NOT FOUND'))
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>11473083418765226
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450458424356463215)
,p_db_column_name=>'BALANCEQUANTITY1'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'P QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#BALANCEQUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450458572443463216)
,p_db_column_name=>'BALANCEQUANTITY2'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'S QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#BALANCEQUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450458092570463211)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Itemcode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450458128384463212)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Itemspecificationcode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450458697015463217)
,p_db_column_name=>'STOCKVALUE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#STOCKVALUE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450458375372463214)
,p_db_column_name=>'STORAGELINK'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Storage Location'
,p_column_html_expression=>'<div style="display:block; width:150px">#STORAGELINK#</div>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450458219536463213)
,p_db_column_name=>'STORAGELOCATIONCODE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Storagelocationcode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(450569603070427029)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'74849'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'STORAGELINK:BALANCEQUANTITY1:BALANCEQUANTITY2:STOCKVALUE'
,p_sum_columns_on_break=>'BALANCEQUANTITY1:BALANCEQUANTITY2:STOCKVALUE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463036362373356313)
,p_plug_name=>'Stock Storage Location Wise'
,p_static_id=>'stock-storage-location-wise'
,p_parent_plug_id=>wwv_flow_imp.id(462196471922447792)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>90
,p_plug_grid_column_span=>3
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      ItemSpecificationCode,',
'      round(sum(BALANCEQUANTITY1),3)||'' ''||e.MeasuringUnitcode1 as QUANTITY,',
'      round(sum(STOCKVALUE),3) STOCKVALUE',
'From  D_PRODUCT360VIEW_STOCKSTORAGELOCATIONWISE a, Item e',
'Where ItemSpecificationCode like nvl(:P518_ITEMSPECIFICATIONCODEP,''%'')',
'  and a.ItemCode = e.itemCode',
'Group BY ItemSpecificationCode,e.MeasuringUnitcode1'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(441448261586653834)
,p_region_id=>wwv_flow_imp.id(463036362373356313)
,p_layout_type=>'GRID'
,p_component_css_classes=>'hiddenscroll'
,p_card_css_classes=>'color10'
,p_title_adv_formatting=>false
,p_title_column_name=>'QUANTITY'
,p_title_css_classes=>'cardtitle'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'STOCKVALUE'
,p_sub_title_css_classes=>'cardsubtitle'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<H4 style="font-size:20px; text-align:center"> Stock Detail</H4>'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(441419300676653814)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(462196471922447792)
,p_button_name=>'LASTRUN'
,p_static_id=>'lastrun'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'<p style="text-size:12px; color:#da1b1b;font-weight:bold">Last Run Date : &P113_LASTRUN.</p>'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_grid_column_span=>3
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450250049755003673)
,p_name=>'P518_CONSACC'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(462293437594815814)
,p_prompt=>'Consumption A/c :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450250445441003673)
,p_name=>'P518_CWIPACC'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(462293437594815814)
,p_prompt=>'CWIP A/c :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450237492279003667)
,p_name=>'P518_GROUP'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(462196893895447796)
,p_prompt=>'Group :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450238284116003667)
,p_name=>'P518_HSNCODE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(462196893895447796)
,p_prompt=>'HSN Code :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450248795178003673)
,p_name=>'P518_ISEQUIPMENT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(462293437594815814)
,p_prompt=>'Is Equipment :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450237065264003666)
,p_name=>'P518_ITEMCODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(462196893895447796)
,p_prompt=>'Item Code :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450214724536003652)
,p_name=>'P518_ITEMCODEP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(462196471922447792)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450191178041925891)
,p_name=>'P518_ITEMNAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(462196893895447796)
,p_prompt=>'Item Name :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450237826060003667)
,p_name=>'P518_ITEMSPECIFICATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(462196893895447796)
,p_prompt=>'Specification :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450181527659925882)
,p_name=>'P518_ITEMSPECIFICATIONCODEP'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(462196471922447792)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450215112884003652)
,p_name=>'P518_LASTRUN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(462196471922447792)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'     TO_CHAR(LASTRUNDATE,''DD-MM-YYYY HH:MI AM'') LASTRUNDATE',
'FROM D_SUPPLIER_360VIEW'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450238713034003667)
,p_name=>'P518_NATURE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(462196893895447796)
,p_prompt=>'Item Nature :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450251172772003673)
,p_name=>'P518_ORDERINGPOLICY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(462293437594815814)
,p_prompt=>'Ordering Policy:'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450248002365003672)
,p_name=>'P518_PUOM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(462293437594815814)
,p_prompt=>'Base Unit :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450250834405003673)
,p_name=>'P518_PURCHASEPOLICY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(462293437594815814)
,p_prompt=>'Purchase Policy :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450249168781003673)
,p_name=>'P518_SERIALNOREQUIRED'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(462293437594815814)
,p_prompt=>'Serial No Req :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450249629336003673)
,p_name=>'P518_STOCKACC'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(462293437594815814)
,p_prompt=>'Stock A/c :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450248408823003672)
,p_name=>'P518_SUOM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(462293437594815814)
,p_prompt=>'Sub Unit :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'captionvalue'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_grid_column_css_classes=>'caption'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441607353719243946)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441607695478243946)
,p_event_id=>wwv_flow_imp.id(441607353719243946)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '//$("#t_Body_nav").hide();',
    '//$(this).treeView("collapse", n$)')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(441448919163653835)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch Product Detail'
,p_static_id=>'fetch-product-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      e.ItemCode,',
'      e.ItemName,',
'      i.ItemName,',
'      inn.ItemNatureName,',
'      ee.ItemSpecificationName,',
'      ee.HSNCode,',
'      mu1.MeasuringUnitName UOM1,',
'      mu2.MeasuringUnitName UOM2,',
'      e.IsEquipment,',
'      e.SerialNoRequired,',
'      i.ProcurementStrategy,',
'      i.OrderingPolicy,',
'      GetPartyName(e.StockAccountCode),',
'      GetPartyName(e.ConsumptionAccountCode),',
'      GetPartyName(e.CWIPAccountCode)',
'      into',
'      :P518_ITEMCODE,',
'      :P518_ITEMNAME,',
'      :P518_GROUP,',
'      :P518_NATURE,',
'      :P518_ITEMSPECIFICATION,',
'      :P518_HSNCODE,',
'      :P518_PUOM,',
'      :P518_SUOM,',
'      :P518_ISEQUIPMENT,',
'      :P518_SERIALNOREQUIRED,',
'      :P518_PURCHASEPOLICY,',
'      :P518_ORDERINGPOLICY,',
'      :P518_STOCKACC,',
'      :P518_CONSACC,',
'      :P518_CWIPACC',
'',
'From  Item e, ItemSpecification ee, ItemNature inn, MeasuringUnit mu1, MeasuringUnit mu2, Item i',
'Where e.TNo = ee.TNo',
'  and e.ItemNatureCode = inn.ItemNatureCode(+)',
'  and e.MeasuringUnitCode1 = mu1.MeasuringUnitCode(+)',
'  and e.MeasuringUnitCode2 = mu2.MeasuringUnitCode(+)',
'  and e.ParentCode = i.ItemCode(+)',
'  and ee.ItemSpecificationCode like nvl(:P518_ITEMSPECIFICATIONCODEP,''%'')',
'  ;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2464049963955851
);
wwv_flow_imp.component_end;
end;
/
