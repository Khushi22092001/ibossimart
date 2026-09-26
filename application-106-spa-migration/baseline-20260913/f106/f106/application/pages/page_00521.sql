prompt --application/pages/page_00521
begin
--   Manifest
--     PAGE: 00521
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
 p_id=>521
,p_name=>'Trade Analysis'
,p_alias=>'TRADE-ANALYSIS'
,p_step_title=>'Trade Analysis'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'04'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(479184255492039201)
,p_plug_name=>'Agent  Wise Sales'
,p_static_id=>'agent-wise-sales'
,p_parent_plug_id=>wwv_flow_imp.id(481604911699978540)
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
 p_id=>wwv_flow_imp.id(441549593959175060)
,p_region_id=>wwv_flow_imp.id(479184255492039201)
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
 p_id=>wwv_flow_imp.id(441551346885175060)
,p_chart_id=>wwv_flow_imp.id(441549593959175060)
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
 p_id=>wwv_flow_imp.id(441550716619175060)
,p_chart_id=>wwv_flow_imp.id(441549593959175060)
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
 p_id=>wwv_flow_imp.id(441550166508175060)
,p_chart_id=>wwv_flow_imp.id(441549593959175060)
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
 p_id=>wwv_flow_imp.id(478728474606704321)
,p_plug_name=>'F.G. Sales'
,p_static_id=>'f-g-sales'
,p_parent_plug_id=>wwv_flow_imp.id(481604911699978540)
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
 p_id=>wwv_flow_imp.id(441545980542175056)
,p_region_id=>wwv_flow_imp.id(478728474606704321)
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
 p_id=>wwv_flow_imp.id(441546521031175056)
,p_chart_id=>wwv_flow_imp.id(441545980542175056)
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
 p_id=>wwv_flow_imp.id(481605174309978542)
,p_plug_name=>'HalfYearly F.G. Sales '
,p_static_id=>'halfyearly-f-g-sales'
,p_parent_plug_id=>wwv_flow_imp.id(481604911699978540)
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
 p_id=>wwv_flow_imp.id(441552890870175061)
,p_region_id=>wwv_flow_imp.id(481605174309978542)
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
 p_id=>wwv_flow_imp.id(441553399306175061)
,p_chart_id=>wwv_flow_imp.id(441552890870175061)
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
 p_id=>wwv_flow_imp.id(479184754607039206)
,p_plug_name=>'Item Cutomer Revenue'
,p_static_id=>'item-cutomer-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(481604911699978540)
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
 p_id=>wwv_flow_imp.id(441558026018175064)
,p_region_id=>wwv_flow_imp.id(479184754607039206)
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
 p_id=>wwv_flow_imp.id(441559684380175065)
,p_chart_id=>wwv_flow_imp.id(441558026018175064)
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
 p_id=>wwv_flow_imp.id(441558487715175065)
,p_chart_id=>wwv_flow_imp.id(441558026018175064)
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
 p_id=>wwv_flow_imp.id(441559081357175065)
,p_chart_id=>wwv_flow_imp.id(441558026018175064)
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
 p_id=>wwv_flow_imp.id(481605332337978544)
,p_plug_name=>'Item Revenue'
,p_static_id=>'item-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(481604911699978540)
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
 p_id=>wwv_flow_imp.id(441562568355175066)
,p_region_id=>wwv_flow_imp.id(481605332337978544)
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
 p_id=>wwv_flow_imp.id(441563010852175067)
,p_chart_id=>wwv_flow_imp.id(441562568355175066)
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
 p_id=>wwv_flow_imp.id(481656367795735243)
,p_plug_name=>'item spec Cutomer Revenue'
,p_static_id=>'item-spec-cutomer-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(481604911699978540)
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
 p_id=>wwv_flow_imp.id(441566100692175068)
,p_region_id=>wwv_flow_imp.id(481656367795735243)
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
 p_id=>wwv_flow_imp.id(441567838313175069)
,p_chart_id=>wwv_flow_imp.id(441566100692175068)
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
 p_id=>wwv_flow_imp.id(441566616296175069)
,p_chart_id=>wwv_flow_imp.id(441566100692175068)
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
 p_id=>wwv_flow_imp.id(441567245465175069)
,p_chart_id=>wwv_flow_imp.id(441566100692175068)
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
 p_id=>wwv_flow_imp.id(478728832477704325)
,p_plug_name=>'Item Specification Revenue'
,p_static_id=>'item-specification-revenue'
,p_parent_plug_id=>wwv_flow_imp.id(481604911699978540)
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
 p_id=>wwv_flow_imp.id(441547861025175057)
,p_region_id=>wwv_flow_imp.id(478728832477704325)
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
 p_id=>wwv_flow_imp.id(441548321647175059)
,p_chart_id=>wwv_flow_imp.id(441547861025175057)
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
 p_id=>wwv_flow_imp.id(481605283525978543)
,p_plug_name=>'Monthly F.G. Sales '
,p_static_id=>'monthly-f-g-sales'
,p_parent_plug_id=>wwv_flow_imp.id(481604911699978540)
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
 p_id=>wwv_flow_imp.id(441554708572175062)
,p_region_id=>wwv_flow_imp.id(481605283525978543)
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
 p_id=>wwv_flow_imp.id(441556417811175063)
,p_chart_id=>wwv_flow_imp.id(441554708572175062)
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
 p_id=>wwv_flow_imp.id(441555189073175062)
,p_chart_id=>wwv_flow_imp.id(441554708572175062)
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
 p_id=>wwv_flow_imp.id(441555826771175062)
,p_chart_id=>wwv_flow_imp.id(441554708572175062)
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
 p_id=>wwv_flow_imp.id(479320355515125801)
,p_plug_name=>'Quarterly F.G.Sales '
,p_static_id=>'quarterly-f-g-sales'
,p_parent_plug_id=>wwv_flow_imp.id(481604911699978540)
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
 p_id=>wwv_flow_imp.id(441560689201175066)
,p_region_id=>wwv_flow_imp.id(479320355515125801)
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
 p_id=>wwv_flow_imp.id(441561215364175066)
,p_chart_id=>wwv_flow_imp.id(441560689201175066)
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
 p_id=>wwv_flow_imp.id(481604911699978540)
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
 p_id=>wwv_flow_imp.id(481607224503978563)
,p_plug_name=>'Yearly Sales of F.G.'
,p_static_id=>'yearly-sales-of-f-g'
,p_parent_plug_id=>wwv_flow_imp.id(481604911699978540)
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
 p_id=>wwv_flow_imp.id(441564366641175067)
,p_region_id=>wwv_flow_imp.id(481607224503978563)
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
 p_id=>wwv_flow_imp.id(441564785178175068)
,p_chart_id=>wwv_flow_imp.id(441564366641175067)
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
 p_id=>wwv_flow_imp.id(461994429476923209)
,p_name=>'P521_FINYEAR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(481607224503978563)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(461974735839923198)
,p_name=>'P521_FIN_HALFYEAR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(481605174309978542)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(461979006265923200)
,p_name=>'P521_FIN_QTR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(479320355515125801)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(461990772308923207)
,p_name=>'P521_ITEM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(481605332337978544)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(461986436976923205)
,p_name=>'P521_ITEMGROUPNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(479184255492039201)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(461987069625923205)
,p_name=>'P521_ITEMSPECIFICATION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(478728832477704325)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(461981953464923202)
,p_name=>'P521_MONTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(481605283525978543)
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
 p_id=>wwv_flow_imp.id(461982396772923202)
,p_name=>'P521_QUARTER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(481605283525978543)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(461983458220923202)
,p_name=>'P521_TRADETYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(478728474606704321)
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
 p_id=>wwv_flow_imp.id(462047978058545831)
,p_name=>'P521_TRADETYPECODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(479184255492039201)
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
 p_id=>wwv_flow_imp.id(441572949650175071)
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
 p_id=>wwv_flow_imp.id(441573431460175071)
,p_event_id=>wwv_flow_imp.id(441572949650175071)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P521_ITEM,P521_TRADETYPE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441573918434175071)
,p_event_id=>wwv_flow_imp.id(441572949650175071)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(478728474606704321)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441574401239175072)
,p_event_id=>wwv_flow_imp.id(441572949650175071)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(481656367795735243)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441574934751175072)
,p_event_id=>wwv_flow_imp.id(441572949650175071)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(481605332337978544)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441575384468175072)
,p_event_id=>wwv_flow_imp.id(441572949650175071)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(478728832477704325)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441575837359175072)
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
 p_id=>wwv_flow_imp.id(441576340585175072)
,p_event_id=>wwv_flow_imp.id(441575837359175072)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P521_SUBGROUP'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441586767224175076)
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
 p_id=>wwv_flow_imp.id(441609707083246172)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>180
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441610116996246173)
,p_event_id=>wwv_flow_imp.id(441609707083246172)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441576713447175072)
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
 p_id=>wwv_flow_imp.id(441577237304175073)
,p_event_id=>wwv_flow_imp.id(441576713447175072)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(481656367795735243)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441581754979175074)
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
 p_id=>wwv_flow_imp.id(441582717399175074)
,p_event_id=>wwv_flow_imp.id(441581754979175074)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(479184754607039206)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441583236056175075)
,p_event_id=>wwv_flow_imp.id(441581754979175074)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(481656367795735243)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441582198882175074)
,p_event_id=>wwv_flow_imp.id(441581754979175074)
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
 p_id=>wwv_flow_imp.id(441577592559175073)
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
 p_id=>wwv_flow_imp.id(441578115255175073)
,p_event_id=>wwv_flow_imp.id(441577592559175073)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(479184754607039206)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441579786154175073)
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
 p_id=>wwv_flow_imp.id(441580802205175074)
,p_event_id=>wwv_flow_imp.id(441579786154175073)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(481605332337978544)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441581362552175074)
,p_event_id=>wwv_flow_imp.id(441579786154175073)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(479184255492039201)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441580298153175074)
,p_event_id=>wwv_flow_imp.id(441579786154175073)
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
 p_id=>wwv_flow_imp.id(441585786776175076)
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
 p_id=>wwv_flow_imp.id(441586364277175076)
,p_event_id=>wwv_flow_imp.id(441585786776175076)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(481656367795735243)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441583988907175075)
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
 p_id=>wwv_flow_imp.id(441584542993175075)
,p_event_id=>wwv_flow_imp.id(441583988907175075)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(478728832477704325)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441584934594175075)
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
 p_id=>wwv_flow_imp.id(441585407140175075)
,p_event_id=>wwv_flow_imp.id(441584934594175075)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(478728832477704325)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441578510557175073)
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
 p_id=>wwv_flow_imp.id(441579062867175073)
,p_event_id=>wwv_flow_imp.id(441578510557175073)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(478728474606704321)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441568633597175069)
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
 p_id=>wwv_flow_imp.id(441569131122175070)
,p_event_id=>wwv_flow_imp.id(441568633597175069)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P521_MONTH,P521_ITEM,P521_FIN_QTR'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441569569360175070)
,p_event_id=>wwv_flow_imp.id(441568633597175069)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(479320355515125801)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441570135510175070)
,p_event_id=>wwv_flow_imp.id(441568633597175069)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(481605283525978543)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441570624596175070)
,p_event_id=>wwv_flow_imp.id(441568633597175069)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(481605332337978544)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441571107661175070)
,p_event_id=>wwv_flow_imp.id(441568633597175069)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(481656367795735243)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441571556761175071)
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
 p_id=>wwv_flow_imp.id(441572009116175071)
,p_event_id=>wwv_flow_imp.id(441571556761175071)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P521_FIN_HALFYEAR,P521_MONTH,P521_ITEM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441572496345175071)
,p_event_id=>wwv_flow_imp.id(441571556761175071)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(481605174309978542)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441583662440175075)
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
 p_id=>wwv_flow_imp.id(441579402370175073)
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
 p_id=>wwv_flow_imp.id(441587125603175076)
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
 p_id=>wwv_flow_imp.id(441587631370175076)
,p_event_id=>wwv_flow_imp.id(441587125603175076)
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
