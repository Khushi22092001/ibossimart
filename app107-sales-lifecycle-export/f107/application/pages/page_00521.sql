prompt --application/pages/page_00521
begin
--   Manifest
--     PAGE: 00521
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
 p_id=>521
,p_name=>'Trade Analysis'
,p_alias=>'TRADE-ANALYSIS'
,p_step_title=>'Trade Analysis'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'/* p521-trade-analysis-full-width-v1 */',
'html.page-521 .hspl-card-canvas > .row > .col:has(#R481604911699978540){',
'  grid-column:1 / -1!important;',
'  width:100%!important;',
'  max-width:none!important;',
'}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'04'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(488664459323505565)
,p_plug_name=>'Agent  Wise Sales'
,p_static_id=>'agent-wise-sales'
,p_parent_plug_id=>wwv_flow_imp.id(491085115531444904)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent10:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_display_column=>5
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451029797790641424)
,p_region_id=>wwv_flow_imp.id(488664459323505565)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'value-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451031550716641424)
,p_chart_id=>wwv_flow_imp.id(451029797790641424)
,p_static_id=>'item-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select TO_CHAR(to_date(:P521_MONTH,''YYYYMM''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(:P521_MONTH,''YYYYMM'')),''DD-MON-RRRR'') as ToDate,',
'''CO'' AS LOCATIONCODE,',
'B.PARTYCODE, B.PARTYNAME, Sum(a.totalamount) Amount',
'  From bi_srevenue a,',
'       PARTY B,',
'       BI_DateTime c,',
'       ITEM D',
' Where A.AGENTCODE = B.PARTYCODE',
'   AND A.ITEMCODE= D.ITEMCODE',
'   AND D.ITEMNATURECODE = ''FINISHEDITEM''',
'   and a.CCInvoiceDate = c.Fin_Date  ',
'   and To_Char(a.CCInvoiceDate,''YYYYMM'') like nvl(:P521_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P521_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P521_FINYEAR,''%'')',
'   and (:P521_TRADETYPE is null or a.tradetypecode in (select tradetypecode from tradetype where tno = :P521_TRADETYPE))',
'  Group By B.PARTYCODE, B.PARTYNAME',
'order by 6 desc',
''))
,p_ajax_items_to_submit=>'P521_ITEM,P521_MONTH,P521_QUARTER'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'PARTYNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:56:&SESSION.::&DEBUG.:RP,56:P56_COMPANY,P56_LOCATION,P56_FROMDATE,P56_TODATE,P56_DOCTYPE,P56_STATUS,P56_AGENTCODE,P56_TRADETYPE:1,&LOCATIONCODE.,&FROMDATE.,&TODATE.,CHALANCUMINVOICE,ACTIVE,&PARTYCODE.,&P521_TRADETYPECODE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(451030920450641424)
,p_chart_id=>wwv_flow_imp.id(451029797790641424)
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
 p_id=>wwv_flow_imp.id(451030370339641424)
,p_chart_id=>wwv_flow_imp.id(451029797790641424)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(488208678438170685)
,p_plug_name=>'F.G. Sales'
,p_static_id=>'f-g-sales'
,p_parent_plug_id=>wwv_flow_imp.id(491085115531444904)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent9:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_plug_grid_column_span=>4
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451026184373641420)
,p_region_id=>wwv_flow_imp.id(488208678438170685)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_legend_font_size=>'8'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451026724862641420)
,p_chart_id=>wwv_flow_imp.id(451026184373641420)
,p_static_id=>'item-group-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Group Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select e.tno as ROOT_ID,',
'       e.tradetypecode ,',
'       e.TradeTypeName As RootName,',
'       Sum(a.totalamount) Amount',
'  From bi_srevenue a,',
'       bi_datetime c,',
'       item        d,',
'       TradeType   e,',
'       ',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               ''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   And a.CCInvoiceDate = c.Fin_Date',
'   And a.itemcode = d.itemcode',
'   And a.TradeTypeCode = e.TradeTypeCode',
'   And d.itemnaturecode = ''FINISHEDITEM''',
'--	 And :P521_tradetype Is Null Or A.TradeTypeCode = :P521_TradeType',
'  and To_Char(a.CCInvoiceDate,''YYYYMM'') like nvl(:P521_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P521_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P521_FINYEAR,''%'')',
'',
' Group By e.tradetypecode, e.TradeTypeName, e.tno',
''))
,p_ajax_items_to_submit=>'P521_TRADETYPE,P521_ITEM'
,p_series_type=>'donut'
,p_series_name_column_name=>'ROOTNAME'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'ROOTNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'COMBO'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P521_TRADETYPE'',&ROOT_ID.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(491085378141444906)
,p_plug_name=>'HalfYearly F.G. Sales '
,p_static_id=>'halfyearly-f-g-sales'
,p_parent_plug_id=>wwv_flow_imp.id(491085115531444904)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--accent3:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_column=>5
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451033094701641425)
,p_region_id=>wwv_flow_imp.id(491085378141444906)
,p_chart_type=>'pie'
,p_height=>'250'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'smooth'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlightAndExplode'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451033603137641425)
,p_chart_id=>wwv_flow_imp.id(451033094701641425)
,p_static_id=>'halfyear-pie-chart'
,p_seq=>10
,p_name=>'HalfYear Pie Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select a.FIN_HALF_YEAR_NAME, ',
'       a.FIN_HALF_YEAR, ',
'	   Sum(c.TotalAmount) Amount',
'  From BI_DateTime a, BI_Srevenue c, Item b',
' Where a.Fin_Date = c.CCInvoiceDate',
'   and c.itemcode = b.itemcode',
'   and b.itemnaturecode = ''FINISHEDITEM''',
'   And Replace(a.Fin_Year, ''-'', '''') Like nvl(:P521_FINYEAR, ''%'')',
' Group By a.FIN_HALF_YEAR_NAME, a.FIN_HALF_YEAR',
' Order By 2'))
,p_ajax_items_to_submit=>'P521_FINYEAR'
,p_series_type=>'pie'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'FIN_HALF_YEAR_NAME'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'COMBO'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P521_FIN_HALFYEAR'',&FIN_HALF_YEAR.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(488664958438505570)
,p_plug_name=>'Item Cutomer Revenue'
,p_static_id=>'item-cutomer-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(491085115531444904)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent10:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>130
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451038229849641428)
,p_region_id=>wwv_flow_imp.id(488664958438505570)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'value-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451039888211641429)
,p_chart_id=>wwv_flow_imp.id(451038229849641428)
,p_static_id=>'item-customer-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Customer Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select TO_CHAR(to_date(:P521_MONTH,''YYYYMM''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(:P521_MONTH,''YYYYMM'')),''DD-MON-RRRR'') as ToDate,',
'''CO'' AS LOCATIONCODE,B.PARTYCODE, B.PARTYNAME, Sum(a.totalamount) Amount',
'  From bi_srevenue a,',
'       PARTY B,',
'       BI_DateTime c,',
'       ITEM D,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               ''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   AND A.ITEMCODE = D.ITEMCODE',
'   AND D.ITEMNATURECODE = ''FINISHEDITEM''',
'   And A.AGENTCODE = B.PARTYCODE',
'   and a.CCInvoiceDate = c.Fin_Date  ',
'   and To_Char(a.CCInvoiceDate,''YYYYMM'') like nvl(:P521_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P521_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P521_FINYEAR,''%'')',
'   And (:P521_ITEM Is Null Or NVL(X.PARENTCODE,X.ITEMCODE) = :P521_ITEM)',
'   AND (:P521_TRADETYPE IS NULL OR A.TRADETYPECODE = ( select tradetypecode from tradetype where tno =:P521_TRADETYPE ))',
' Group By B.PARTYCODE, B.PARTYNAME',
' order by 6 desc'))
,p_ajax_items_to_submit=>'P521_ITEM,P521_MONTH,P521_QUARTER'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'PARTYNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:56:&SESSION.::&DEBUG.:56:P56_COMPANY,P56_DOCTYPE,P56_LOCATION,P56_STATUS,P56_FROMDATE,P56_TODATE,P56_AGENTCODE,P56_TRADETYPE:1,CHALANCUMINVOICE,&LOCATIONCODE.,ACTIVE,&FROMDATE.,&TODATE.,&PARTYCODE.,&P521_TRADETYPECODE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(451038691546641429)
,p_chart_id=>wwv_flow_imp.id(451038229849641428)
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
 p_id=>wwv_flow_imp.id(451039285188641429)
,p_chart_id=>wwv_flow_imp.id(451038229849641428)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(491085536169444908)
,p_plug_name=>'Item Revenue'
,p_static_id=>'item-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(491085115531444904)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent9:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>120
,p_plug_grid_column_span=>4
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451042772186641430)
,p_region_id=>wwv_flow_imp.id(491085536169444908)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_legend_font_size=>'8'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451043214683641431)
,p_chart_id=>wwv_flow_imp.id(451042772186641430)
,p_static_id=>'item-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select TO_CHAR(to_date(:P521_MONTH,''YYYYMM''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(:P521_MONTH,''YYYYMM'')),''DD-MON-RRRR'') as ToDate,',
'''CO'' AS LOCATIONCODE, ',
'Nvl(X.PARENTCODE, X.ITEMCODE) As PARENTCODE,',
'       getitemname(Nvl(X.PARENTCODE, X.ITEMCODE)) As RootName,',
'       Sum(a.totalamount) Amount',
'  From bi_srevenue a,',
'       bi_datetime c,',
'       item d,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               ''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   and a.itemcode = d.itemcode',
'   and d.itemnaturecode = ''FINISHEDITEM''',
'   and a.CCInvoiceDate = c.Fin_Date  ',
'   and To_Char(a.CCInvoiceDate,''YYYYMM'') like nvl(:P521_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P521_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P521_FINYEAR,''%'')',
'   and (:P521_TRADETYPE IS NULL OR A.TRADETYPECODE = (select tradetypecode from tradetype where tno =:P521_TRADETYPE))',
'',
' Group By Nvl(X.PARENTCODE, X.ITEMCODE)',
''))
,p_ajax_items_to_submit=>'P521_ITEM,P521_TRADETYPE'
,p_series_type=>'donut'
,p_series_name_column_name=>'ROOTNAME'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'ROOTNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'COMBO'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P521_ITEM'',&PARENTCODE.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(491136571627201607)
,p_plug_name=>'item spec Cutomer Revenue'
,p_static_id=>'item-spec-cutomer-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(491085115531444904)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent10:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>150
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451046304523641432)
,p_region_id=>wwv_flow_imp.id(491136571627201607)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451048042144641433)
,p_chart_id=>wwv_flow_imp.id(451046304523641432)
,p_static_id=>'item-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select TO_CHAR(to_date(:P521_MONTH,''YYYYMM''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(:P521_MONTH,''YYYYMM'')),''DD-MON-RRRR'') as ToDate,',
'''CO'' AS LOCATIONCODE,B.PARTYCODE, B.PARTYNAME, Sum(a.totalamount) Amount',
'  From bi_srevenue a,',
'       PARTY B,',
'       BI_DateTime c,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               ''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   And A.AGENTCODE = B.PARTYCODE',
'   and a.CCInvoiceDate = c.Fin_Date  ',
'   and To_Char(a.CCInvoiceDate,''YYYYMM'') like nvl(:P521_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P521_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P521_FINYEAR,''%'')',
'   And (:P521_TRADETYPE Is Null    Or A.TRADETYPECODE = ( select tradetypecode from tradetype where tno = :P521_TRADETYPE))',
'   And (:P521_ITEM Is Null Or NVL(X.PARENTCODE,X.ITEMCODE) = :P521_ITEM)',
'   and (:P521_ITEMSPECIFICATION IS NULL OR A.ITEMSPECIFICATIONCODE = :P521_ITEMSPECIFICATION)',
' Group By B.PARTYCODE, B.PARTYNAME',
' order by 6 desc'))
,p_ajax_items_to_submit=>'P521_ITEMSPECIFICATION'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'PARTYNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:56:&SESSION.::&DEBUG.:56:P56_COMPANY,P56_DOCTYPE,P56_STATUS,P56_LOCATION,P56_FROMDATE,P56_TODATE,P56_ITEMSPECIFICATION,P56_AGENTCODE,P56_TRADETYPE:1,CHALANCUMINVOICE,ACTIVE,&LOCATIONCODE.,&FROMDATE.,&TODATE.,&P521_ITEMSPECIFICATION.,&PAR'
||'TYCODE.,&P521_TRADETYPECODE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(451046820127641433)
,p_chart_id=>wwv_flow_imp.id(451046304523641432)
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
 p_id=>wwv_flow_imp.id(451047449296641433)
,p_chart_id=>wwv_flow_imp.id(451046304523641432)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(488209036309170689)
,p_plug_name=>'Item Specification Revenue'
,p_static_id=>'item-specification-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(491085115531444904)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent9:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>140
,p_plug_grid_column_span=>4
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451028064856641421)
,p_region_id=>wwv_flow_imp.id(488209036309170689)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_legend_font_size=>'8'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451028525478641423)
,p_chart_id=>wwv_flow_imp.id(451028064856641421)
,p_static_id=>'item-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select A.ITEMSPECIFICATIONCODE As ITEMSPECIFICATIONCODE,',
'       getitemSPECIFICATIONNAME(A.ITEMCODE, A.ITEMSPECIFICATIONCODE) As ItemSpecificationName,',
'       Sum(a.totalamount) Amount',
'  From bi_srevenue a,',
'       bi_datetime c,',
'       item d,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               ''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   and a.itemcode = d.itemcode',
'   and d.itemnaturecode = ''FINISHEDITEM''',
'   and a.CCInvoiceDate = c.Fin_Date  ',
'   and To_Char(a.CCInvoiceDate,''YYYYMM'') like nvl(:P521_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P521_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P521_FINYEAR,''%'')',
'',
'   AND (:P521_TRADETYPE IS NULL OR A.TRADETYPECODE = ( select tradetypecode from tradetype where tno = :P521_TRADETYPE))',
'   And (:P521_ITEM Is Null',
'    Or NVL(X.PARENTCODE,X.ITEMCODE) = :P521_ITEM)',
'--   And (&P521_ITEMGROUP Is Null Or',
'--instr('':'' || &P521_ITEMGROUP || '':'', '':'' || X.PATH || '':'') > 0)',
' Group By a.itemcode, a.itemspecificationcode',
''))
,p_ajax_items_to_submit=>'P521_ITEMSPECIFICATION,P521_TRADETYPE,P521_ITEM'
,p_series_type=>'donut'
,p_series_name_column_name=>'ITEMSPECIFICATIONNAME'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'ITEMSPECIFICATIONNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'COMBO'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P521_ITEMSPECIFICATION'',&ITEMSPECIFICATIONCODE.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(491085487357444907)
,p_plug_name=>'Monthly F.G. Sales '
,p_static_id=>'monthly-f-g-sales'
,p_parent_plug_id=>wwv_flow_imp.id(491085115531444904)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent1:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P521_MONTH,P521_FIN_HALFYEAR,P521_FINYEAR,P521_ITEM'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451034912403641426)
,p_region_id=>wwv_flow_imp.id(491085487357444907)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withoutRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_time_axis_type=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451036621642641427)
,p_chart_id=>wwv_flow_imp.id(451034912403641426)
,p_static_id=>'finished-goods'
,p_seq=>10
,p_name=>'Finished Goods'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select --APEX_UTIL.PREPARE_URL',
'--(''f?p=&APP_ID.:56:&APP_SESSION.::::P56_COMPANY,P56_FROMDATE,P56_TODATE:1,'' || to_date(xx.month,''MON-YYYY'')|| '','' ||LAST_DAY(to_date(xx.month,''MON-YYYY''))) AS LINK ,',
'TO_CHAR(to_date(xx.month,''MON-YYYY''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(xx.month,''MON-YYYY'')),''DD-MON-RRRR'') as ToDate,',
'''CO'' AS LOCATIONCODE,',
'xx.*',
'  From (Select b.Fin_Qtr,',
'               b.Fin_Month,',
'               x.root_id,',
'               getitemname(x.root_id) As item,',
'               To_Char(a.CCInvoiceDate, ''MON-YYYY'') As Month,',
'               To_Char(a.CCInvoiceDate, ''YYYYMM'') As Monthyy,',
'               Sum(a.TotalAmount) Amount',
'          From BI_SRevenue a,',
'               BI_DateTime b,',
'               (Select ITEMCODE,',
'                       parentcode,',
'                       RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'                       Level,',
'                       CONNECT_BY_ROOT itemcode As root_id,',
'                       ''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'                       CONNECT_BY_ISLEAF As leaf',
'                  From item a',
'                 Start With parentcode Is Null',
'                Connect By parentcode = Prior itemcode',
'                 Order Siblings By itemcode) x',
'         Where A.ITEMCODE = X.ITEMCODE',
'           And a.CCInvoiceDate = b.Fin_date',
'        --and b.Fin_Qtr like nvl(:P521_FIN_QTR,''%'')',
'        --and b.Fin_year like nvl(:P521_FINYEAR,''%'')',
'           and (b.Fin_Qtr = :P521_FIN_QTR or :P521_FIN_QTR is null)',
'          and (replace(b.Fin_year,''-'','''') = :P521_FINYEAR or :P521_FINYEAR is null)',
'        ',
'         Group By b.Fin_Qtr,',
'                  b.Fin_Month,',
'                  To_Char(a.CCInvoiceDate, ''MON-YYYY''),',
'                  To_Char(a.CCInvoiceDate, ''YYYYMM''),',
'                  getitemname(x.root_id),',
'                  x.root_id',
'',
'         Order By To_Char(a.CCInvoiceDate, ''YYYYMM'')) xx',
'where root_id=''223''',
' Order By to_date(xx.month,''MON-YYYY''),root_id',
''))
,p_ajax_items_to_submit=>'P521_FIN_HALFYEAR'
,p_series_type=>'bar'
,p_series_name_column_name=>'ITEM'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'MONTH'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P521_MONTH'',&MONTHYY.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(451035392904641426)
,p_chart_id=>wwv_flow_imp.id(451034912403641426)
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
 p_id=>wwv_flow_imp.id(451036030602641426)
,p_chart_id=>wwv_flow_imp.id(451034912403641426)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'off'
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(488800559346592165)
,p_plug_name=>'Quarterly F.G.Sales '
,p_static_id=>'quarterly-f-g-sales'
,p_parent_plug_id=>wwv_flow_imp.id(491085115531444904)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--accent5:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_column=>9
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451040893032641430)
,p_region_id=>wwv_flow_imp.id(488800559346592165)
,p_chart_type=>'pie'
,p_height=>'250'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'smooth'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlightAndExplode'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451041419195641430)
,p_chart_id=>wwv_flow_imp.id(451040893032641430)
,p_static_id=>'quater-pie-chart'
,p_seq=>10
,p_name=>'Quater Pie Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      a.Fin_Qtr_Name,',
'      a.Fin_Qtr,',
'      sum(c.TotalAmount)Amount',
'From  BI_DateTime a, BI_Srevenue c, Item b',
'Where a.Fin_Date = c.CCInvoiceDate',
'  and c.itemcode = b.itemcode',
'  and b.itemnaturecode = ''FINISHEDITEM''',
'  and replace(a.Fin_Year,''-'','''') like nvl(:P521_FINYEAR,''%'')',
'  and (:P521_FIN_HALFYEAR IS NULL OR A.FIN_HALF_YEAR = :P521_FIN_HALFYEAR)',
'Group by a.Fin_Qtr_Name,',
'         a.Fin_Qtr',
'Order by 2'))
,p_ajax_items_to_submit=>'P521_FINYEAR'
,p_series_type=>'pie'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'FIN_QTR_NAME'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'COMBO'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P521_FIN_QTR'',&FIN_QTR.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(491085115531444904)
,p_plug_name=>'Trade Analysis'
,p_static_id=>'trade-analysis'
,p_region_template_options=>'#DEFAULT#:t-Region--showIcon:t-Region--accent14:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs:margin-top-none:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(491087428335444927)
,p_plug_name=>'Yearly Sales of F.G.'
,p_static_id=>'yearly-sales-of-f-g'
,p_parent_plug_id=>wwv_flow_imp.id(491085115531444904)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--accent1:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(451044570472641431)
,p_region_id=>wwv_flow_imp.id(491087428335444927)
,p_chart_type=>'pie'
,p_height=>'250'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(451044989009641432)
,p_chart_id=>wwv_flow_imp.id(451044570472641431)
,p_static_id=>'yearly-revenue'
,p_seq=>10
,p_name=>'Yearly Revenue'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select a.Fin_Year FYNAME,',
'       Replace(a.Fin_Year, ''-'', '''') FYCODE,',
'       Sum(TotalAmount) Amount',
'  From BI_DateTime a, BI_SRevenue b, Item c',
' Where a.Fin_Date = b.CCInvoiceDate',
'   And B.itemcode = c.itemcode',
'   And c.itemnaturecode = ''FINISHEDITEM''',
' Group By a.Fin_Year'))
,p_series_type=>'pie'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'FYNAME'
,p_items_short_desc_column_name=>'FYNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'COMBO'
,p_threshold_display=>'onIndicator'
,p_link_target=>'JavaScript:$s(''P521_FINYEAR'' ,&FYCODE. );'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471474633308389573)
,p_name=>'P521_FINYEAR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(491087428335444927)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471454939671389562)
,p_name=>'P521_FIN_HALFYEAR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(491085378141444906)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471459210097389564)
,p_name=>'P521_FIN_QTR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(488800559346592165)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471470976140389571)
,p_name=>'P521_ITEM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(491085536169444908)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471466640808389569)
,p_name=>'P521_ITEMGROUPNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(488664459323505565)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471467273457389569)
,p_name=>'P521_ITEMSPECIFICATION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(488209036309170689)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471462157296389566)
,p_name=>'P521_MONTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(491085487357444907)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471462600604389566)
,p_name=>'P521_QUARTER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(491085487357444907)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471463662052389566)
,p_name=>'P521_TRADETYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(488208678438170685)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471528181890012195)
,p_name=>'P521_TRADETYPECODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(488664459323505565)
,p_prompt=>'Tradetypecode'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451053153481641435)
,p_name=>'Change Month'
,p_static_id=>'change-month'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P521_MONTH'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451053635291641435)
,p_event_id=>wwv_flow_imp.id(451053153481641435)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P521_ITEM,P521_TRADETYPE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451054122265641435)
,p_event_id=>wwv_flow_imp.id(451053153481641435)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(488208678438170685)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451054605070641436)
,p_event_id=>wwv_flow_imp.id(451053153481641435)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(491136571627201607)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451055138582641436)
,p_event_id=>wwv_flow_imp.id(451053153481641435)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(491085536169444908)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451055588299641436)
,p_event_id=>wwv_flow_imp.id(451053153481641435)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(488209036309170689)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451056041190641436)
,p_name=>'CLEAR'
,p_static_id=>'clear'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P521_TRADETYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451056544416641436)
,p_event_id=>wwv_flow_imp.id(451056041190641436)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P521_SUBGROUP'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451066971055641440)
,p_name=>'CLICK SUBGROUP'
,p_static_id=>'click-subgroup'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P521_SUBGROUP'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451089910914712536)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>180
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451090320827712537)
,p_event_id=>wwv_flow_imp.id(451089910914712536)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '//$("#t_Body_nav").hide();',
    '//$(this).treeView("collapse", n$)')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451056917278641436)
,p_name=>'Refresh Customer Region'
,p_static_id=>'refresh-customer-region'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P521_ITEM'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451057441135641437)
,p_event_id=>wwv_flow_imp.id(451056917278641436)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(491136571627201607)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451061958810641438)
,p_name=>'Refresh item Customer '
,p_static_id=>'refresh-item-customer'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P521_TRADETYPE'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451062921230641438)
,p_event_id=>wwv_flow_imp.id(451061958810641438)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(488664958438505570)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451063439887641439)
,p_event_id=>wwv_flow_imp.id(451061958810641438)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(491136571627201607)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451062402713641438)
,p_event_id=>wwv_flow_imp.id(451061958810641438)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P521_ITEM'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P521_ITEM',
  'sql_query', 'select null FROM DUAL;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451057796390641437)
,p_name=>'Refresh Item  Region'
,p_static_id=>'refresh-item-region'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P521_ITEM'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451058319086641437)
,p_event_id=>wwv_flow_imp.id(451057796390641437)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(488664958438505570)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451059989985641437)
,p_name=>'Refresh item Region'
,p_static_id=>'refresh-item-region-2'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P521_TRADETYPE'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451061006036641438)
,p_event_id=>wwv_flow_imp.id(451059989985641437)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(491085536169444908)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451061566383641438)
,p_event_id=>wwv_flow_imp.id(451059989985641437)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(488664459323505565)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451060501984641438)
,p_event_id=>wwv_flow_imp.id(451059989985641437)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P521_ITEM'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P521_ITEM',
  'sql_query', 'select null FROM DUAL;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451065990607641440)
,p_name=>'REFRESH ITEM SPEC CUSTOMER'
,p_static_id=>'refresh-item-spec-customer'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P521_ITEMSPECIFICATION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451066568108641440)
,p_event_id=>wwv_flow_imp.id(451065990607641440)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(491136571627201607)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451064192738641439)
,p_name=>'Refresh Item Specification Region'
,p_static_id=>'refresh-item-specification-region'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P521_ITEM'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451064746824641439)
,p_event_id=>wwv_flow_imp.id(451064192738641439)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(488209036309170689)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451065138425641439)
,p_name=>'Refresh  Item Specification Region'
,p_static_id=>'refresh-item-specification-region-2'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P521_TRADETYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451065610971641439)
,p_event_id=>wwv_flow_imp.id(451065138425641439)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(488209036309170689)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451058714388641437)
,p_name=>'REFRESH ITEMGROUP'
,p_static_id=>'refresh-itemgroup'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P521_TRADETYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451059266698641437)
,p_event_id=>wwv_flow_imp.id(451058714388641437)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(488208678438170685)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451048837428641433)
,p_name=>'Refresh Month Chart'
,p_static_id=>'refresh-month-chart'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P521_FIN_HALFYEAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451049334953641434)
,p_event_id=>wwv_flow_imp.id(451048837428641433)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P521_MONTH,P521_ITEM,P521_FIN_QTR'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451049773191641434)
,p_event_id=>wwv_flow_imp.id(451048837428641433)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(488800559346592165)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451050339341641434)
,p_event_id=>wwv_flow_imp.id(451048837428641433)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(491085487357444907)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451050828427641434)
,p_event_id=>wwv_flow_imp.id(451048837428641433)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(491085536169444908)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451051311492641434)
,p_event_id=>wwv_flow_imp.id(451048837428641433)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(491136571627201607)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451051760592641435)
,p_name=>'Refresh Quarter Chart'
,p_static_id=>'refresh-quarter-chart'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P521_FINYEAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451052212947641435)
,p_event_id=>wwv_flow_imp.id(451051760592641435)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P521_FIN_HALFYEAR,P521_MONTH,P521_ITEM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451052700176641435)
,p_event_id=>wwv_flow_imp.id(451051760592641435)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(491085378141444906)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451063866271641439)
,p_name=>'Refresh Sub Group Customer'
,p_static_id=>'refresh-sub-group-customer'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P521_TRADETYPE'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451059606201641437)
,p_name=>'REFRESH SUBGROUP'
,p_static_id=>'refresh-subgroup'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P521_TRADETYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451067329434641440)
,p_name=>'SET TRADETYPE CODE'
,p_static_id=>'set-tradetype-code'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P521_TRADETYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451067835201641440)
,p_event_id=>wwv_flow_imp.id(451067329434641440)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P521_TRADETYPECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P521_TRADETYPE,P521_TRADETYPECODE',
  'sql_query', 'SELECT TRADETYPECODE FROM TRADETYPE WHERE TNO = :P521_TRADETYPE',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
