prompt --application/pages/page_00503
begin
--   Manifest
--     PAGE: 00503
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
 p_id=>503
,p_name=>'Issue Analysis'
,p_alias=>'ISSUE-ANALYSIS'
,p_step_title=>'Issue Analysis'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var orig = "x";'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'04'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(460152074722136669)
,p_plug_name=>'Button'
,p_static_id=>'button'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(460107705809512206)
,p_plug_name=>'Contractor wise Issue'
,p_static_id=>'contractor-wise-issue'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent13:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>140
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      GetPartyName(a.PartyCode)PartyName,',
'      a.PartyCode,',
'      sum(StockAmount)as Amount,',
'      ''#887BB0'' as Color,',
'      ''CHARGEABLE'' GROUPNAME',
'From  BI_Issue a, FinancialYear fy',
'Where a.FinancialYearCode = fy.FinancialYearCode',
'  and a.IssueDate Between fy.FinancialYearBegin and nvl(:P503_ASONDATE,fy.FinancialYearEnd)',
'  and a.DocTypeCode = ''CHARGEABLE''',
'  and a.PartyCode is not null',
'  and a.DocTypeCode like nvl((Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE),''%'')',
'  and a.LocationCode like nvl((Select LocationCode From Location Where Tno = :P503_LOCATIONCODE),''%'')',
'  and a.DepartmentCode like nvl((Select DepartmentCode From Department Where Tno = :P503_DEPARTMENTCODE),''%'')',
'Group by GetPartyName(a.PartyCode),',
'         a.PartyCode',
'union all',
'Select',
'      GetPartyName(a.PartyCode)PartyName,',
'      a.PartyCode,',
'      sum(StockAmount)as Amount,',
'      ''#76B947'' as Color,',
'      ''NON-CHARGEABLE'' GROUPNAME',
'From  BI_Issue a, FinancialYear fy',
'Where a.FinancialYearCode = fy.FinancialYearCode',
'  and a.IssueDate Between fy.FinancialYearBegin and nvl(:P503_ASONDATE,fy.FinancialYearEnd)',
'  and a.DocTypeCode != ''CHARGEABLE''',
'  and a.PartyCode is not null',
'  and a.DocTypeCode like nvl((Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE),''%'')',
'  and a.LocationCode like nvl((Select LocationCode From Location Where Tno = :P503_LOCATIONCODE),''%'')',
'  and a.DepartmentCode like nvl((Select DepartmentCode From Department Where Tno = :P503_DEPARTMENTCODE),''%'')',
'Group by GetPartyName(a.PartyCode),',
'         a.PartyCode'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P503_DOCTYPECODE,P503_LOCATIONCODE,P503_COSTCENTERCODE'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'1=2'
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(450469832027943534)
,p_region_id=>wwv_flow_imp.id(460107705809512206)
,p_chart_type=>'bar'
,p_height=>'250'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'on'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(450471497990943534)
,p_chart_id=>wwv_flow_imp.id(450469832027943534)
,p_static_id=>'contractor-wise-issue'
,p_seq=>10
,p_name=>'Contractor wise Issue'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_series_name_column_name=>'GROUPNAME'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'PARTYNAME'
,p_color=>'&COLOR.'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_items_label_font_style=>'italic'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P503_PARTYCODE'',&PARTYCODE.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(450470293899943534)
,p_chart_id=>wwv_flow_imp.id(450469832027943534)
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
 p_id=>wwv_flow_imp.id(450470947410943534)
,p_chart_id=>wwv_flow_imp.id(450469832027943534)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_numeric_pattern=>'##,##,###'
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(460104850184512177)
,p_plug_name=>'Cost Center wise Issue'
,p_static_id=>'cost-center-wise-issue'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent6:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CostCentreName,',
'      c.TNo as CostCenterCode,',
'      sum(StockAmount)as Amount',
'From  BI_Issue a, FinancialYear fy, CostCentre c,',
'(Select DepartmentCode,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || DepartmentCode As tree,',
'               Level,',
'               CONNECT_BY_ROOT DepartmentCode As root_id,',
'               ''-'' || LTRIM(SYS_CONNECT_BY_PATH(Departmentcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From Department a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior Departmentcode',
'         Order Siblings By Departmentcode) x',
'Where a.FinancialYearCode = fy.FinancialYearCode',
'  and a.CostCentreCode =c.CostCentreCode',
'  and a.departmentcode = x.departmentcode',
'  and a.IssueDate Between fy.FinancialYearBegin and nvl(:P503_ASONDATE,fy.FinancialYearEnd)',
'  and a.DocTypeCode like nvl((Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE),''%'')',
'  and a.LocationCode like nvl((Select LocationCode From Location Where Tno = :P503_LOCATIONCODE),''%'')',
'  and x.root_id like nvl((Select DepartmentCode From Department Where Tno = :P503_DEPARTMENTCODE),''%'')',
'Group by c.CostCentreName,',
'         c.TNo'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P503_DOCTYPECODE,P503_LOCATIONCODE'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(450461438786943529)
,p_region_id=>wwv_flow_imp.id(460104850184512177)
,p_chart_type=>'pie'
,p_height=>'250'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_numeric_pattern=>'##,##,###'
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(450461959538943529)
,p_chart_id=>wwv_flow_imp.id(450461438786943529)
,p_static_id=>'cost-center-wise'
,p_seq=>10
,p_name=>'Cost Center wise '
,p_location=>'REGION_SOURCE'
,p_series_type=>'pie'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'COSTCENTRENAME'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'COMBO'
,p_items_label_font_style=>'italic'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P503_COSTCENTERCODE'',&COSTCENTERCODE.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(460106652370512195)
,p_plug_name=>'Cost Centre > 12 Months Issue'
,p_static_id=>'cost-centre-12-months-issue'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent7:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    x.Month,',
'    x.MonthCode,',
'    x.Amount',
'From',
'(Select',
'      to_Char(a.IssueDate,''MON-YYYY'') Month,',
'      To_char(a.IssueDate,''YYYYMM'') MonthCode,',
'      sum(StockAmount)as Amount',
'From  BI_Issue a, FinancialYear fy',
'Where a.FinancialYearCode = fy.FinancialYearCode',
'  and a.IssueDate Between fy.FinancialYearBegin and nvl(:P503_ASONDATE,fy.FinancialYearEnd)',
'  and a.DocTypeCode like nvl((Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE),''%'')',
'  and a.LocationCode like nvl((Select LocationCode From Location Where Tno = :P503_LOCATIONCODE),''%'')',
'  and a.CostCentreCode like nvl((Select CostCentreCode From CostCentre Where Tno = :P503_COSTCENTERCODE),''%'')',
'Group by to_Char(a.IssueDate,''MON-YYYY''),',
'         To_char(a.IssueDate,''YYYYMM'')',
'Order by To_char(a.IssueDate,''YYYYMM'')',
')x',
'Where rownum<=12'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P503_DOCTYPECODE,P503_LOCATIONCODE,P503_COSTCENTERCODE'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(450466493290943532)
,p_region_id=>wwv_flow_imp.id(460106652370512195)
,p_chart_type=>'bar'
,p_height=>'250'
,p_animation_on_display=>'zoom'
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
 p_id=>wwv_flow_imp.id(450468205164943533)
,p_chart_id=>wwv_flow_imp.id(450466493290943532)
,p_static_id=>'cost-centre-wise-12-months-issue'
,p_seq=>10
,p_name=>'Cost Centre wise 12 Months Issue'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'MONTH'
,p_color=>'#f4bf1e'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P503_CCMONTH'',&MONTHCODE.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(450467041474943532)
,p_chart_id=>wwv_flow_imp.id(450466493290943532)
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
 p_id=>wwv_flow_imp.id(450467630047943532)
,p_chart_id=>wwv_flow_imp.id(450466493290943532)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_numeric_pattern=>'##,##,###'
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(460155803041136706)
,p_plug_name=>'Cost Centre > Month > Item Group wise Issue'
,p_static_id=>'cost-centre-month-item-group-wise-issue'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent13:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select TO_CHAR(to_date(:P503_DEPTMONTH,''YYYYMM''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(:P503_DEPTMONTH,''YYYYMM'')),''DD-MON-RRRR'') as ToDate,',
'(Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE) AS DOCTYPE,',
'NVL((Select NVL(LocationCode,''CO'') From Location Where Tno = :P503_LOCATIONCODE),''CO'') AS LOCATIONCODE,',
'(Select DepartmentCode From Department Where Tno = :P503_DEPARTMENTCODE) AS DEPARTMENTCODE,',
'(Select CostCentreCode From CostCentre Where Tno = :P503_COSTCENTERCODE) AS COSTCENTRECODE,',
'      GetItemName(e.ParentCode)ItemGroupName,',
'      e.ParentCode,',
'      sum(StockAmount)as Amount',
'From  BI_Issue a, FinancialYear fy, Item e',
'Where a.FinancialYearCode = fy.FinancialYearCode',
'  and a.ItemCode = e.ItemCode',
'  and a.DocTypeCode like nvl((Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE),''%'')',
'  and a.LocationCode like nvl((Select LocationCode From Location Where Tno = :P503_LOCATIONCODE),''%'')',
'  and a.CostCentreCode like nvl((Select CostCentreCode From CostCentre Where Tno = :P503_COSTCENTERCODE),''%'')',
'  --and To_Char(a.IssueDate,''YYYYMM'') like nvl(:P503_CCMONTH,''%'')',
'  --and a.DocTypeCode = (Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE)',
'  --and a.LocationCode = (Select LocationCode From Location Where Tno = :P503_LOCATIONCODE) ',
'  --and a.CostCentreCode = (Select CostCentreCode From CostCentre Where Tno = :P503_COSTCENTERCODE)',
'  and To_Char(a.IssueDate,''YYYYMM'') = :P503_CCMONTH',
'Group by GetItemName(e.ParentCode),',
'      e.ParentCode',
'ORDER BY 9 DESC'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P503_CCMONTH'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'1=2'
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(450441945625943514)
,p_region_id=>wwv_flow_imp.id(460155803041136706)
,p_chart_type=>'bar'
,p_height=>'250'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
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
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(450443581689943515)
,p_chart_id=>wwv_flow_imp.id(450441945625943514)
,p_static_id=>'month-x-item-group-wise-cost-centre'
,p_seq=>10
,p_name=>'Month x Item Group wise (Cost Centre)'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'ITEMGROUPNAME'
,p_color=>'#f4bf1e'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17:P17_COMPANY,P17_COSTCENTRE,P17_DOCTYPE,P17_LOCATION,P17_FROMDATE,P17_TODATE:1,&COSTCENTRECODE.,&DOCTYPE.,&LOCATIONCODE.,&FROMDATE.,&TODATE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(450442411782943514)
,p_chart_id=>wwv_flow_imp.id(450441945625943514)
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
 p_id=>wwv_flow_imp.id(450443043788943514)
,p_chart_id=>wwv_flow_imp.id(450441945625943514)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title_font_size=>'8'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_numeric_pattern=>'##,##,###'
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(460105547067512184)
,p_plug_name=>'Department > 12 Months Issue'
,p_static_id=>'department-12-months-issue'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent9:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    x.Month,',
'    x.MonthCode,',
'    x.Amount',
'From',
'(Select',
'      to_Char(a.IssueDate,''MON-YYYY'') Month,',
'      To_char(a.IssueDate,''YYYYMM'') MonthCode,',
'      sum(StockAmount)as Amount',
'From  BI_Issue a, FinancialYear fy,Department d, Department e,',
'(Select DepartmentCode,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || DepartmentCode As tree,',
'               Level,',
'               CONNECT_BY_ROOT DepartmentCode As root_id,',
'               ''-'' || LTRIM(SYS_CONNECT_BY_PATH(Departmentcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From Department a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior Departmentcode',
'         Order Siblings By Departmentcode) x',
'Where a.FinancialYearCode = fy.FinancialYearCode',
'    and a.DepartmentCode =d.DepartmentCode',
'  and d.DepartmentCode = x.departmentcode',
'  and x.root_id=e.departmentcode',
'',
'  and a.IssueDate Between fy.FinancialYearBegin and nvl(:P503_ASONDATE,fy.FinancialYearEnd)',
'  and a.DocTypeCode like nvl((Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE),''%'')',
'  and a.LocationCode like nvl((Select LocationCode From Location Where Tno = :P503_LOCATIONCODE),''%'')',
'  and e.DepartmentCode like nvl((Select DepartmentCode From Department Where Tno = :P503_DEPARTMENTCODE),''%'')',
'Group by to_Char(a.IssueDate,''MON-YYYY''),',
'         To_char(a.IssueDate,''YYYYMM'')',
'Order by To_char(a.IssueDate,''YYYYMM'')',
')x',
'Where rownum<=12'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P503_DOCTYPECODE,P503_LOCATIONCODE,P503_DEPARTMENTCODE'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(450463265215943530)
,p_region_id=>wwv_flow_imp.id(460105547067512184)
,p_chart_type=>'bar'
,p_height=>'233'
,p_animation_on_display=>'zoom'
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
 p_id=>wwv_flow_imp.id(450464958784943531)
,p_chart_id=>wwv_flow_imp.id(450463265215943530)
,p_static_id=>'department-wise-12-months-issue'
,p_seq=>10
,p_name=>'Department wise 12 Months Issue'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'MONTH'
,p_color=>'#eb5353'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P503_DEPTMONTH'',&MONTHCODE.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(450463734191943530)
,p_chart_id=>wwv_flow_imp.id(450463265215943530)
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
 p_id=>wwv_flow_imp.id(450464287497943531)
,p_chart_id=>wwv_flow_imp.id(450463265215943530)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_numeric_pattern=>'##,##,###'
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(460156693415136715)
,p_plug_name=>'Department > Month > Item Group wise Issue'
,p_static_id=>'department-month-item-group-wise-issue'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent9:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select TO_CHAR(to_date(:P503_DEPTMONTH,''YYYYMM''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(:P503_DEPTMONTH,''YYYYMM'')),''DD-MON-RRRR'') as ToDate,',
'(Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE) AS DOCTYPE,',
'NVL((Select NVL(LocationCode,''CO'') From Location Where Tno = :P503_LOCATIONCODE),''CO'') AS LOCATIONCODE,',
'(Select DepartmentCode From Department Where Tno = :P503_DEPARTMENTCODE) AS DEPARTMENTCODE,',
'      x.ItemGroupName,',
'      x.ParentCode,',
'      x.Amount',
'From ',
'(Select',
'      GetItemName(e.ParentCode)ItemGroupName,',
'      e.ParentCode,',
'      sum(StockAmount)as Amount',
'',
'From  BI_Issue a, FinancialYear fy, Item e,',
'(Select DepartmentCode,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || DepartmentCode As tree,',
'               Level,',
'               CONNECT_BY_ROOT DepartmentCode As root_id,',
'               ''-'' || LTRIM(SYS_CONNECT_BY_PATH(Departmentcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From Department a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior Departmentcode',
'         Order Siblings By Departmentcode) x',
'Where a.FinancialYearCode = fy.FinancialYearCode',
'  and a.ItemCode = e.ItemCode',
'  and a.departmentcode = x.departmentcode',
'  and a.DocTypeCode like nvl((Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE),''%'')',
'  and a.LocationCode like nvl((Select LocationCode From Location Where Tno = :P503_LOCATIONCODE),''%'')',
'  and x.root_id like nvl((Select DepartmentCode From Department Where Tno = :P503_DEPARTMENTCODE),''%'')',
'  --and To_Char(a.IssueDate,''YYYYMM'') like nvl(:P503_CCMONTH,''%'')',
'  --and a.DocTypeCode = (Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE)',
'  --and a.LocationCode = (Select LocationCode From Location Where Tno = :P503_LOCATIONCODE) ',
'  --and a.CostCentreCode = (Select CostCentreCode From CostCentre Where Tno = :P503_COSTCENTERCODE)',
'  and To_Char(a.IssueDate,''YYYYMM'') = :P503_DEPTMONTH',
'Group by GetItemName(e.ParentCode),',
'      e.ParentCode',
')x',
'ORDER BY 8 DESC'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P503_DEPTMONTH,P503_DOCTYPECODE,P503_LOCATIONCODE,P503_DEPARTMENTCODE'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'1=2'
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(450444900022943518)
,p_region_id=>wwv_flow_imp.id(460156693415136715)
,p_chart_type=>'bar'
,p_height=>'250'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
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
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(450446582425943520)
,p_chart_id=>wwv_flow_imp.id(450444900022943518)
,p_static_id=>'month-x-item-group-wise-department'
,p_seq=>10
,p_name=>'Month x Item Group wise (Department)'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'ITEMGROUPNAME'
,p_color=>'#eb5353'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RR,17:P17_COMPANY,P17_DOCTYPE,P17_FROMDATE,P17_GROUP,P17_TODATE,P17_LOCATION,P17_DEPARTMENT:1,&DOCTYPE.,&FROMDATE.,&PARENTCODE.,&TODATE.,&LOCATIONCODE.,&DEPARTMENTCODE.'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(450445459134943519)
,p_chart_id=>wwv_flow_imp.id(450444900022943518)
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
 p_id=>wwv_flow_imp.id(450446068491943519)
,p_chart_id=>wwv_flow_imp.id(450444900022943518)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title_font_size=>'8'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_numeric_pattern=>'##,##,###'
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(459630496702830611)
,p_plug_name=>'Department wise Issue'
,p_static_id=>'department-wise-issue'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent12:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      e.DepartmentName,',
'      e.TNo as DepartmentCode,',
'      sum(StockAmount)as Amount,',
'      sum(a.quantity1) as Quantity1,',
'      sum(a.quantity2) as Quantity2',
'From  BI_Issue a, FinancialYear fy, Department d, Department e,',
'(Select DepartmentCode,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || DepartmentCode As tree,',
'               Level,',
'               CONNECT_BY_ROOT DepartmentCode As root_id,',
'               ''-'' || LTRIM(SYS_CONNECT_BY_PATH(Departmentcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From Department a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior Departmentcode',
'         Order Siblings By Departmentcode) x',
'Where a.FinancialYearCode = fy.FinancialYearCode',
'  and a.DepartmentCode =d.DepartmentCode',
'  and d.DepartmentCode = x.departmentcode',
'  and x.root_id=e.departmentcode',
'  and a.IssueDate Between fy.FinancialYearBegin and nvl(:P503_ASONDATE,fy.FinancialYearEnd)',
'  and a.DocTypeCode like nvl((Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE),''%'')',
'  and a.LocationCode like nvl((Select LocationCode From Location Where Tno = :P503_LOCATIONCODE),''%'')',
'Group by e.DepartmentName,',
'         e.TNo '))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P503_DOCTYPECODE,P503_LOCATIONCODE'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(450457792664943527)
,p_region_id=>wwv_flow_imp.id(459630496702830611)
,p_chart_type=>'pie'
,p_height=>'250'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withoutRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_numeric_pattern=>'##,##,###'
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(450458348214943527)
,p_chart_id=>wwv_flow_imp.id(450457792664943527)
,p_static_id=>'department-wise'
,p_seq=>10
,p_name=>'Department wise '
,p_location=>'REGION_SOURCE'
,p_series_type=>'pie'
,p_series_name_column_name=>'DEPARTMENTNAME'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'DEPARTMENTNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'insideBarEdge'
,p_items_label_display_as=>'COMBO'
,p_items_label_font_style=>'italic'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P503_DEPARTMENTCODE'',&DEPARTMENTCODE.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(459629208094830599)
,p_plug_name=>'Division wise Issue'
,p_static_id=>'division-wise-issue'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent1:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      lc.LocationName,',
'      lc.TNo as LocationCode,',
'      sum(StockAmount)as Amount',
'From  BI_Issue a, FinancialYear fy, Location lc',
'Where a.FinancialYearCode = fy.FinancialYearCode',
'  and a.LocationCode =lc.LocationCode',
'  and a.IssueDate Between fy.FinancialYearBegin and nvl(:P503_ASONDATE,fy.FinancialYearEnd)',
'  and lc.IsDivision = ''YES''',
'  and a.DocTypeCode like nvl((Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE),''%'')',
'Group by lc.LocationName,',
'      lc.TNo'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P503_DOCTYPECODE'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(450456069045943526)
,p_region_id=>wwv_flow_imp.id(459629208094830599)
,p_chart_type=>'donut'
,p_height=>'250'
,p_animation_on_display=>'zoom'
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
,p_value_numeric_pattern=>'##,##,###'
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(450456542976943526)
,p_chart_id=>wwv_flow_imp.id(450456069045943526)
,p_static_id=>'division-wise'
,p_seq=>10
,p_name=>'Division wise '
,p_location=>'REGION_SOURCE'
,p_series_type=>'donut'
,p_series_name_column_name=>'LOCATIONNAME'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'LOCATIONNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'LABEL'
,p_items_label_font_style=>'italic'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P503_LOCATIONCODE'',&LOCATIONCODE.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(459628697962830593)
,p_plug_name=>'Overall'
,p_static_id=>'overall'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent4:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      dt.DocTypeName,',
'      dt.TNo as  DocTypeCode,',
'      sum(StockAmount)as Amount',
'From  BI_Issue a, FinancialYear fy, DocType dt',
'Where a.FinancialYearCode = fy.FinancialYearCode',
'  and a.DocTypeCode = dt.DocTypeCode',
'  and a.IssueDate Between fy.FinancialYearBegin and nvl(:P503_ASONDATE,fy.FinancialYearEnd)',
'Group by dt.DocTypeName,',
'         dt.TNo'))
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(450459672022943528)
,p_region_id=>wwv_flow_imp.id(459628697962830593)
,p_chart_type=>'donut'
,p_height=>'250'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(450460154616943528)
,p_chart_id=>wwv_flow_imp.id(450459672022943528)
,p_static_id=>'overall-issue'
,p_seq=>10
,p_name=>'OverAll Issue'
,p_location=>'REGION_SOURCE'
,p_series_type=>'donut'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'DOCTYPENAME'
,p_aggregate_function=>'SUM'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'LABEL'
,p_items_label_font_style=>'italic'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javaScript:$s(''P503_DOCTYPECODE'',&DOCTYPECODE.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(469967082087589980)
,p_plug_name=>'Work Centre  > 12 Month Issue'
,p_static_id=>'work-centre-12-month-issue'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent7:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    x.Month,',
'    x.MonthCode,',
'    x.Amount',
'From',
'(Select',
'      to_Char(a.IssueDate,''MON-YYYY'') Month,',
'      To_char(a.IssueDate,''YYYYMM'') MonthCode,',
'      sum(StockAmount)as Amount',
'From  BI_Issue a, FinancialYear fy,',
'(Select DepartmentCode,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || DepartmentCode As tree,',
'               Level,',
'               CONNECT_BY_ROOT DepartmentCode As root_id,',
'               ''-'' || LTRIM(SYS_CONNECT_BY_PATH(Departmentcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From Department a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior Departmentcode',
'         Order Siblings By Departmentcode) x',
'Where a.FinancialYearCode = fy.FinancialYearCode',
'  and a.departmentcode = x.DEPARTMENTCODE',
'  and a.IssueDate Between fy.FinancialYearBegin and nvl(:P503_ASONDATE,fy.FinancialYearEnd)',
'  and a.DocTypeCode like nvl((Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE),''%'')',
'  and a.LocationCode like nvl((Select LocationCode From Location Where Tno = :P503_LOCATIONCODE),''%'')',
'  and a.WorkCentreCode like nvl((Select WorkCentreCode From WorkCentre Where Tno = :P503_WORKCENTRECODE),''%'')',
' ',
'  and x.root_id like nvl((Select DepartMentCode From DepartMent Where Tno = :P503_DEPARTMENTCODE),''%'')',
'',
'Group by to_Char(a.IssueDate,''MON-YYYY''),',
'         To_char(a.IssueDate,''YYYYMM'')',
'Order by To_char(a.IssueDate,''YYYYMM'')',
')x',
'Where rownum <=12'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P503_DOCTYPECODE,P503_LOCATIONCODE,P503_COSTCENTERCODE,P503_WORKCENTRECODE'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'1=2'
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(450452743055943524)
,p_region_id=>wwv_flow_imp.id(469967082087589980)
,p_chart_type=>'bar'
,p_height=>'250'
,p_animation_on_display=>'zoom'
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
 p_id=>wwv_flow_imp.id(450454398767943525)
,p_chart_id=>wwv_flow_imp.id(450452743055943524)
,p_static_id=>'work-centre-wise-12-months-issue'
,p_seq=>10
,p_name=>'Work Centre wise 12 Months Issue'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'MONTH'
,p_color=>'#f4bf1e'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P503_WCMONTH'',&MONTHCODE.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(450453235076943524)
,p_chart_id=>wwv_flow_imp.id(450452743055943524)
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
 p_id=>wwv_flow_imp.id(450453810359943525)
,p_chart_id=>wwv_flow_imp.id(450452743055943524)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_numeric_pattern=>'##,##,###'
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(468426337948628407)
,p_plug_name=>'Work Centre > Month > Item Group wise Issue'
,p_static_id=>'work-centre-month-item-group-wise-issue'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent13:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select TO_CHAR(to_date(:P503_WCMONTH,''YYYYMM''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(:P503_WCMONTH,''YYYYMM'')),''DD-MON-RRRR'') as ToDate,',
'(Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE) AS DOCTYPE,',
'NVL((Select NVL(LocationCode,''CO'') From Location Where Tno = :P503_LOCATIONCODE),''CO'') AS LOCATIONCODE,',
'(Select DepartmentCode From Department Where Tno = :P503_DEPARTMENTCODE) AS DEPARTMENTCODE,',
'(Select WorkCentreCode From WorkCentre Where Tno = :P503_WORKCENTRECODE) AS WORKCENTRECODE,',
'      GetItemName(e.ParentCode)ItemGroupName,',
'      e.ParentCode,',
'      sum(StockAmount)as Amount',
'From  BI_Issue a, FinancialYear fy, Item e',
'Where a.FinancialYearCode = fy.FinancialYearCode',
'  and a.ItemCode = e.ItemCode',
'  and a.DocTypeCode like nvl((Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE),''%'')',
'  and a.LocationCode like nvl((Select LocationCode From Location Where Tno = :P503_LOCATIONCODE),''%'')',
'  and a.WorkCentreCode like nvl((Select WorkCentreCode From WorkCentre Where Tno = :P503_WORKCENTRECODE),''%'')',
'  and To_Char(a.IssueDate,''YYYYMM'') like nvl(:P503_WCMONTH,''%'')',
' Group by GetItemName(e.ParentCode),',
'      e.ParentCode',
'      ORDER BY 9 DESC',
''))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P503_WCMONTH,P503_DOCTYPECODE,P503_LOCATIONCODE,P503_WORKCENTRECODE'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'1=2'
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(450447936780943522)
,p_region_id=>wwv_flow_imp.id(468426337948628407)
,p_chart_type=>'bar'
,p_height=>'250'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
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
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(450449642114943522)
,p_chart_id=>wwv_flow_imp.id(450447936780943522)
,p_static_id=>'month-x-item-group-wise-work-centre'
,p_seq=>10
,p_name=>'Month x Item Group wise (Work Centre)'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'ITEMGROUPNAME'
,p_color=>'#f4bf1e'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17:P17_COMPANY,P17_DEPARTMENT,P17_DOCTYPE,P17_LOCATION,P17_GROUP,P17_FROMDATE,P17_TODATE:1,&DEPARTMENTCODE.,&DOCTYPE.,&LOCATIONCODE.,&PARENTCODE.,&FROMDATE.,&TODATE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(450448402548943522)
,p_chart_id=>wwv_flow_imp.id(450447936780943522)
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
 p_id=>wwv_flow_imp.id(450448979329943522)
,p_chart_id=>wwv_flow_imp.id(450447936780943522)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title_font_size=>'8'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_numeric_pattern=>'##,##,###'
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(469966688520589976)
,p_plug_name=>'Work Centre wise Issue'
,p_static_id=>'work-centre-wise-issue'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent12:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>4
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      d.WorkCentreName,',
'      d.TNo as WorkCentreCode,',
'      sum(StockAmount)as Amount,',
'      sum(a.quantity1) as Quantity1,',
'      sum(a.quantity2) as Quantity2',
'From  BI_Issue a, FinancialYear fy, WorkCentre d,(Select DepartmentCode,',
'       parentcode,',
'       RPAD(''.'', (Level - 1) * 2, ''.'') || DepartmentCode As tree,',
'       Level,',
'       CONNECT_BY_ROOT DepartmentCode As root_id,',
'       ''-'' || LTRIM(SYS_CONNECT_BY_PATH(Departmentcode, ''-''), ''-'') || ''-'' As path,',
'       CONNECT_BY_ISLEAF As leaf',
'  From Department a',
' Start With parentcode Is Null',
'Connect By parentcode = Prior Departmentcode',
' Order Siblings By Departmentcode) x',
'Where a.FinancialYearCode = fy.FinancialYearCode',
'  and a.WorkCentreCode = d.WorkCentreCode',
'  and a.DEPARTMENTCODE = x.departmentcode',
'  and x.root_id like nvl((Select DepartmentCode From Department Where Tno = :P503_DEPARTMENTCODE),''%'')',
'  and a.IssueDate Between fy.FinancialYearBegin and nvl(:P503_ASONDATE,fy.FinancialYearEnd)',
'  and a.DocTypeCode like nvl((Select DocTypeCode From DocType Where Tno = :P503_DOCTYPECODE),''%'')',
'  and a.LocationCode like nvl((Select LocationCode From Location Where Tno = :P503_LOCATIONCODE),''%'')',
'Group by d.WorkCentreName,',
'         d.TNo '))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P503_DOCTYPECODE,P503_LOCATIONCODE'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'1=2'
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(450450885423943523)
,p_region_id=>wwv_flow_imp.id(469966688520589976)
,p_chart_type=>'pie'
,p_height=>'250'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withoutRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_numeric_pattern=>'##,##,###'
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlightAndExplode'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(450451444976943523)
,p_chart_id=>wwv_flow_imp.id(450450885423943523)
,p_static_id=>'work-centre-wise'
,p_seq=>10
,p_name=>'Work Centre wise '
,p_location=>'REGION_SOURCE'
,p_series_type=>'pie'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'WORKCENTRENAME'
,p_items_label_rendered=>true
,p_items_label_position=>'insideBarEdge'
,p_items_label_display_as=>'COMBO'
,p_items_label_font_style=>'italic'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P503_WORKCENTRECODE'',&WORKCENTRECODE.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(450472833441943535)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(460152074722136669)
,p_button_name=>'CLEAR'
,p_static_id=>'clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Clear'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(450473196634943535)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(460152074722136669)
,p_button_name=>'Submit'
,p_static_id=>'submit'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_icon_css_classes=>'fa-arrow-right-alt'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460184862302136696)
,p_name=>'P503_ASONDATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(460152074722136669)
,p_prompt=>'As on Date'
,p_placeholder=>'As on Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>2
,p_grid_label_column_span=>1
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(460159418866136715)
,p_name=>'P503_CCITEMGROUPCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(460155803041136706)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460134258484512216)
,p_name=>'P503_CCMONTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(460106652370512195)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460126205055512195)
,p_name=>'P503_COSTCENTERCODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(460104850184512177)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460182393944136717)
,p_name=>'P503_COSTCENTRENAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(460106652370512195)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459648168060830627)
,p_name=>'P503_DEPARTMENTCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(459630496702830611)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460176935404136694)
,p_name=>'P503_DEPARTMENTNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(460105547067512184)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Department Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460129831065512203)
,p_name=>'P503_DEPTMONTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(460105547067512184)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459648595386830614)
,p_name=>'P503_DOCTYPECODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(459628697962830593)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460162669875136724)
,p_name=>'P503_DPITEMGROUPCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(460156693415136715)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459645195913830613)
,p_name=>'P503_LOCATIONCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(459629208094830599)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460138731812512229)
,p_name=>'P503_PARTYCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(460107705809512206)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(468435429660628418)
,p_name=>'P503_WCITEMGROUPCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(468426337948628407)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(469980886547589993)
,p_name=>'P503_WCMONTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(469967082087589980)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(469977433271589988)
,p_name=>'P503_WORKCENTRECODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(469966688520589976)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(469980981564589994)
,p_name=>'P503_WORKCENTRENAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(469967082087589980)
,p_prompt=>'Work Centre Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(450491461928943542)
,p_name=>'Change Region Name'
,p_static_id=>'change-region-name'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P503_CC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450491942730943543)
,p_event_id=>wwv_flow_imp.id(450491461928943542)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if (orig == "x")',
    '    orig = $(''#MYID h1'').text();',
    '',
    '$(''#MYID h1'').text(orig + '' ('' + $(''#P503_CC option:selected'').text() + '')'');')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(450495145992943544)
,p_name=>'CHANGE WORKCENTRECODE'
,p_static_id=>'change-workcentrecode'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P503_WORKCENTRECODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450495640848943544)
,p_event_id=>wwv_flow_imp.id(450495145992943544)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(469967082087589980)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(450486699597943541)
,p_name=>'Clear All Item available on PAGE'
,p_static_id=>'clear-all-item-available-on-page'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(450472833441943535)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450487198877943541)
,p_event_id=>wwv_flow_imp.id(450486699597943541)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P503_DOCTYPECODE,P503_LOCATIONCODE,P503_DEPARTMENTCODE,P503_COSTCENTERCODE,P503_DEPTMONTH,P503_CCMONTH,P503_PARTYCODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451108749370781236)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>130
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451109100170781237)
,p_event_id=>wwv_flow_imp.id(451108749370781236)
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
 p_id=>wwv_flow_imp.id(450496031466943544)
,p_name=>'REFRESH'
,p_static_id=>'refresh'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P503_WCMONTH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450496493096943544)
,p_event_id=>wwv_flow_imp.id(450496031466943544)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P503_WCITEMGROUPCODE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450496979996943544)
,p_event_id=>wwv_flow_imp.id(450496031466943544)
,p_event_result=>'TRUE'
,p_action_sequence=>15
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(468426337948628407)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(450493719139943543)
,p_name=>'Refresh Month x Item (Department)'
,p_static_id=>'refresh-month-x-item-department'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P503_DEPTMONTH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450494217825943543)
,p_event_id=>wwv_flow_imp.id(450493719139943543)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P503_DPITEMGROUPCODE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450494694819943544)
,p_event_id=>wwv_flow_imp.id(450493719139943543)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460156693415136715)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(450481438651943539)
,p_name=>'Refresh on Cost Center Region'
,p_static_id=>'refresh-on-cost-center-region'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P503_COSTCENTERCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450481959642943539)
,p_event_id=>wwv_flow_imp.id(450481438651943539)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P503_CCMONTH'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450482439489943539)
,p_event_id=>wwv_flow_imp.id(450481438651943539)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460106652370512195)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(450482812610943539)
,p_name=>'Refresh on Department Region'
,p_static_id=>'refresh-on-department-region'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P503_DEPARTMENTCODE'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450483297558943539)
,p_event_id=>wwv_flow_imp.id(450482812610943539)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(469966688520589976)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450483778138943540)
,p_event_id=>wwv_flow_imp.id(450482812610943539)
,p_event_result=>'TRUE'
,p_action_sequence=>15
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(469967082087589980)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450484367564943540)
,p_event_id=>wwv_flow_imp.id(450482812610943539)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460105547067512184)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450484824667943540)
,p_event_id=>wwv_flow_imp.id(450482812610943539)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460107705809512206)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450485294913943540)
,p_event_id=>wwv_flow_imp.id(450482812610943539)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-5'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460104850184512177)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450485778375943540)
,p_event_id=>wwv_flow_imp.id(450482812610943539)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-6'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460106652370512195)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450486346141943541)
,p_event_id=>wwv_flow_imp.id(450482812610943539)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-7'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460155803041136706)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(450474156320943536)
,p_name=>'Refresh on DocType Region'
,p_static_id=>'refresh-on-doctype-region'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P503_DOCTYPECODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450474615768943536)
,p_event_id=>wwv_flow_imp.id(450474156320943536)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P503_LOCATIONCODE,P503_DEPARTMENTCODE,P503_COSTCENTERCODE,P503_DEPTMONTH,P503_CCMONTH,P503_PARTYCODE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450475126560943536)
,p_event_id=>wwv_flow_imp.id(450474156320943536)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(459629208094830599)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450475575903943536)
,p_event_id=>wwv_flow_imp.id(450474156320943536)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(459630496702830611)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450476129028943537)
,p_event_id=>wwv_flow_imp.id(450474156320943536)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460104850184512177)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450476666669943537)
,p_event_id=>wwv_flow_imp.id(450474156320943536)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460105547067512184)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450477168897943537)
,p_event_id=>wwv_flow_imp.id(450474156320943536)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-5'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460106652370512195)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450477578097943537)
,p_event_id=>wwv_flow_imp.id(450474156320943536)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-6'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460107705809512206)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(450478041960943537)
,p_name=>'Refresh on Location Region'
,p_static_id=>'refresh-on-location-region'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P503_LOCATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450478562399943538)
,p_event_id=>wwv_flow_imp.id(450478041960943537)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P503_DEPARTMENTCODE,P503_COSTCENTERCODE,P503_DEPTMONTH,P503_CCMONTH,P503_PARTYCODE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450479004948943538)
,p_event_id=>wwv_flow_imp.id(450478041960943537)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(459630496702830611)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450479492224943538)
,p_event_id=>wwv_flow_imp.id(450478041960943537)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460104850184512177)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450480029627943538)
,p_event_id=>wwv_flow_imp.id(450478041960943537)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460105547067512184)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450480542330943538)
,p_event_id=>wwv_flow_imp.id(450478041960943537)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460106652370512195)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450481038466943539)
,p_event_id=>wwv_flow_imp.id(450478041960943537)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-5'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460107705809512206)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(450492292334943543)
,p_name=>'Refresh the Month x Item (Cost Centre)'
,p_static_id=>'refresh-the-month-x-item-cost-centre'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P503_CCMONTH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450492869499943543)
,p_event_id=>wwv_flow_imp.id(450492292334943543)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P503_CCITEMGROUPCODE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450493305143943543)
,p_event_id=>wwv_flow_imp.id(450492292334943543)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460155803041136706)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(450489544864943542)
,p_name=>'Set Value for Cost Centre Month Region'
,p_static_id=>'set-value-for-cost-centre-month-region'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P503_COSTCENTERCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450490037501943542)
,p_event_id=>wwv_flow_imp.id(450489544864943542)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P503_COSTCENTRENAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450491048735943542)
,p_event_id=>wwv_flow_imp.id(450489544864943542)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P503_COSTCENTRENAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450490504568943542)
,p_event_id=>wwv_flow_imp.id(450489544864943542)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P503_COSTCENTRENAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'N',
  'items_to_submit', 'P503_COSTCENTERCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select',
    'CostCentreName',
    'From CostCentre',
    'Where Tno = :P503_COSTCENTERCODE')),
  'suppress_change_event', 'Y',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(450487667609943541)
,p_name=>'Set Value for Department Month region'
,p_static_id=>'set-value-for-department-month-region'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P503_DEPARTMENTCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450488165894943541)
,p_event_id=>wwv_flow_imp.id(450487667609943541)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P503_DEPARTMENTNAME'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P503_DEPARTMENTCODE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450489156276943542)
,p_event_id=>wwv_flow_imp.id(450487667609943541)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460105547067512184)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P503_DEPARTMENTCODE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450488614074943541)
,p_event_id=>wwv_flow_imp.id(450487667609943541)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P503_DEPARTMENTNAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P503_DEPARTMENTCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select',
    'DepartmentName',
    'From Department',
    'Where Tno = :P503_DEPARTMENTCODE')),
  'suppress_change_event', 'Y',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(450497374774943545)
,p_name=>'SET VALUE FOR WORKCENTRE NAME'
,p_static_id=>'set-value-for-workcentre-name'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P503_WORKCENTRECODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450497901561943545)
,p_event_id=>wwv_flow_imp.id(450497374774943545)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P503_WORKCENTRENAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450498878253943545)
,p_event_id=>wwv_flow_imp.id(450497374774943545)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P503_WORKCENTRENAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450498435308943545)
,p_event_id=>wwv_flow_imp.id(450497374774943545)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P503_WORKCENTRENAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P503_WORKCENTRECODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select',
    'WorkCentreName',
    'From WorkCentre',
    'Where Tno = :P503_WORKCENTRECODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
