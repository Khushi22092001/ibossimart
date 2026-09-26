prompt --application/pages/page_00704
begin
--   Manifest
--     PAGE: 00704
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>99910
,p_default_id_offset=>0
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>704
,p_name=>'Trial Balance Analytics'
,p_alias=>'TRIAL-BALANCE-ANALYTICS'
,p_step_title=>'Trial Balance Analytics'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(9965370353286257)
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Trial Balance Analytics. Detailed analytics for the Trial Balance selection \2014 KPI pulse, monthly movement, doctype breakdown, account-group and account-nature distribution, integrity checks, dormant/abnormal/suspense registers, top movers and the ful')
||unistr('l voucher register. All figures reconcile to the Trial Balance on page 675. Sign convention: VoucherDetail.Amount is a signed column \2014 negative is debit, positive is credit. Opening balances come from the Opening table at financial-year begin plus Vo')
||unistr('ucherDetail movement up to the day before From Date; the OPENING carry-forward vouchers are excluded from period movement. Amounts are base currency (INR) only \2014 no multi-currency or exchange-rate columns in the voucher chain.')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12780497734301077)
,p_plug_name=>'Balances on the Wrong Side'
,p_static_id=>'abnormal'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>64
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The rule is Party.BasicNature - the ERP''s own declaration of which',
'   side an account belongs on - and NOT an assumption drawn from the',
'   group it sits under. 4,647 of 7,235 accounts have no declared',
'   nature; those are listed as "not declared" and never judged, because',
'   calling a balance abnormal against a rule that was never set is how',
'   an exception report becomes noise nobody reads. */',
'With Fy As (',
'       /* Always exactly one row. A From Date outside every defined',
'          financial year would otherwise empty this CTE and, with it,',
'          every aggregate downstream. Falling back to the From Date',
'          itself makes the opening nil and leaves movement intact; the',
'          header chip already says the date is outside any known year. */',
'       Select nvl((Select f.FinancialYearBegin From FinancialYear f',
'                    Where to_date(:P704_FROMDATE,''DD-MM-RRRR'') Between f.FinancialYearBegin And f.FinancialYearEnd),',
'                  to_date(:P704_FROMDATE,''DD-MM-RRRR'')) Fb From dual),',
'     Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'     Op As (Select o.AccountCode Acct, Sum(nvl(o.OpeningAmount,0)) Amt From Opening o, Fy',
'             Where o.OpeningDate = Fy.Fb',
'               And ((Select GetUserPanelAB_apex() From dual) Is Null Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'               And (:P704_PANEL Is Null Or o.Panel = :P704_PANEL)',
'               And (:P704_COMPANY Is Null Or o.CompanyCode = :P704_COMPANY)',
'               And (:P704_LOCATION Is Null Or o.LocationCode = :P704_LOCATION)',
'             Group By o.AccountCode),',
'     Mv As (Select d.AccountCode Acct, Sum(nvl(d.Amount,0)) Amt,',
'                   Max(d.VoucherDate) LastMove,',
'                   Sum(Case When d.VoucherDate >= to_date(:P704_FROMDATE,''DD-MM-RRRR'') Then 1 Else 0 End) PeriodLines',
'              From VoucherDetail d, Fy',
'             Where d.VoucherDate >= Fy.Fb And d.VoucherDate < to_date(:P704_TODATE,''DD-MM-RRRR'') + 1',
'               And d.Tno Not In (Select Tno From Carry)',
'               And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'               And (:P704_PANEL Is Null Or d.Panel = :P704_PANEL)',
'               And (:P704_COMPANY Is Null Or d.CompanyCode = :P704_COMPANY)',
'               And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION)',
'             Group By d.AccountCode),',
'     Bal As (Select nvl(o.Acct,m.Acct) Acct, nvl(o.Amt,0)+nvl(m.Amt,0) Cl,',
'                    m.LastMove, nvl(m.PeriodLines,0) PeriodLines',
'               From Op o Full Outer Join Mv m On m.Acct = o.Acct)',
'Select ''<a href="'' || apex_page.get_url(p_page => 677, p_clear_cache => ''677'',',
'                p_items => ''P677_ACCOUNT,P677_FROMDATE,P677_TODATE,P677_COMPANY,P677_LOCATION,P677_PANEL'',',
'                p_values => b.Acct || '','' || :P704_FROMDATE || '','' || :P704_TODATE || '',''',
'                            || :P704_COMPANY || '','' || :P704_LOCATION || '','' || :P704_PANEL)',
'       || ''">'' || apex_escape.html(p.PartyName) || ''</a>''     As ACCOUNT,',
'       b.Acct                                                 As ACCOUNT_CODE,',
'       apex_escape.html(nvl(g.PartyName,''&mdash;''))           As ACCOUNT_GROUP,',
'       Case p.BasicNature When ''DR'' Then ''Debit'' Else ''Credit'' End As EXPECTED_SIDE,',
'       Case When b.Cl < 0 Then ''Debit'' Else ''Credit'' End      As ACTUAL_SIDE,',
'       Round(Abs(b.Cl),2)                                     As CLOSING_BALANCE,',
'       Case When Abs(b.Cl) >= 10000000',
'                 Then ''<span class="ds-finchip ds-finchip--bad">Critical</span>''',
'            When Abs(b.Cl) >= 500000',
'                 Then ''<span class="ds-finchip ds-finchip--watch">High</span>''',
'            Else      ''<span class="ds-finchip ds-finchip--flat">Low</span>'' End As SEVERITY,',
'       Case When b.PeriodLines = 0',
'                 Then ''Carried in from opening - no movement in this period''',
'            When p.BasicNature = ''DR''',
'                 Then ''A debit-nature account closing on the credit side: typically an over-receipt, an advance taken, or a payment posted against the wrong party''',
'            Else ''A credit-nature account closing on the debit side: typically an advance paid, an over-payment, or a receipt posted against the wrong party''',
'       End                                                    As LIKELY_CAUSE,',
'       b.LastMove                                             As LAST_POSTING',
'  From Bal b',
'  Join Party p On p.PartyCode = b.Acct',
'  Left Join Party g On g.PartyCode = p.ParentCode',
' Where (p.BasicNature = ''DR'' And b.Cl >  0.5)',
'    Or (p.BasicNature = ''CR'' And b.Cl < -0.5)',
' Order By Abs(b.Cl) Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P704_FROMDATE,P704_TODATE,P704_COMPANY,P704_LOCATION,P704_PANEL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(12780518475301077)
,p_no_data_found_message=>'Every account with a declared nature closes on the side the ERP expects.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>43522080850737358
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12780651715301077)
,p_db_column_name=>'ACCOUNT'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Account'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12780765543301077)
,p_db_column_name=>'ACCOUNT_CODE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12780830611301077)
,p_db_column_name=>'ACCOUNT_GROUP'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Group'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12780981937301077)
,p_db_column_name=>'ACTUAL_SIDE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Actual Side'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12781008516301077)
,p_db_column_name=>'CLOSING_BALANCE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Closing Balance (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12781132707301077)
,p_db_column_name=>'EXPECTED_SIDE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Expected Side'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12781248428301077)
,p_db_column_name=>'LAST_POSTING'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Last Posting'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12781350886301077)
,p_db_column_name=>'LIKELY_CAUSE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Likely Cause'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12781440737301078)
,p_db_column_name=>'SEVERITY'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Severity'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12781547599301078)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'ACCOUNT:ACCOUNT_GROUP:EXPECTED_SIDE:ACTUAL_SIDE:CLOSING_BALANCE:SEVERITY:LAST_POSTING:LIKELY_CAUSE'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12781693480301078)
,p_name=>'Trial Balance Analytics'
,p_static_id=>'command-header'
,p_template=>4502917002193490937
,p_display_sequence=>5
,p_region_css_classes=>'ds-fin-headregion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''<div class="ds-fin-head">''',
'    /* Back CTA, pinned to the top-right of the header band the same way',
'       page 703''s Purchase Analytics link is. Round-trips all six filter',
'       values so the reader lands back on the same Trial Balance scope. */',
'    || ''<a class="ds-head-cta" href="''',
'       || apex_page.get_url(',
'            p_page   => 675,',
'            p_clear_cache => ''675'',',
'            p_items  => ''P675_FROMDATE,P675_TODATE,P675_COMPANY,P675_LOCATION,P675_PANEL,P675_ACCOUNTGROUP'',',
'            p_values => :P704_FROMDATE||'',''||:P704_TODATE||'',''||:P704_COMPANY||'',''||:P704_LOCATION',
'                        ||'',''||:P704_PANEL||'',''||:P704_ACCOUNTGROUP)',
'       || ''"><span class="fa fa-arrow-left"></span>Trial Balance <b>&larr;</b></a>''',
'    || ''<div class="ds-fin-eyebrow">Finance &middot; General Ledger &middot; Analytics</div>''',
'    || ''<h1 class="ds-fin-title">Trial Balance Analytics</h1>''',
'    || ''<div class="ds-fin-sub">Ledger pulse, monthly movement, doctype breakdown, group/nature distribution, integrity, dormant, abnormal, suspense, top movers and the voucher register &mdash; on the Trial Balance selection above</div>''',
'    || ''<div class="ds-fin-context">''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-calendar"></span>Period <b>''',
'       || :P704_FROMDATE || '' &rarr; '' || :P704_TODATE || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-calendar-check-o"></span>Financial Year <b>''',
'       || nvl((Select f.FinancialYearCode From FinancialYear f',
'                Where to_date(:P704_FROMDATE,''DD-MM-RRRR'')',
'                      Between f.FinancialYearBegin And f.FinancialYearEnd),''outside any defined year'')',
'       || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P704_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P704_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-shield"></span>Panel <b>''',
'       || Case When (Select GetUserPanelAB_apex() From dual) Is Not Null',
'               Then (Select GetUserPanelAB_apex() From dual) || '' (enforced)''',
'               When :P704_PANEL Is Not Null Then :P704_PANEL',
'               Else ''A + B'' End || ''</b></span>''',
'    || Case When :P704_ACCOUNTGROUP Is Not Null Then',
'            ''<span class="ds-fin-chip"><span class="fa fa-sitemap"></span>Group <b>''',
'            || apex_escape.html(nvl((Select p.PartyName From Party p Where p.PartyCode = :P704_ACCOUNTGROUP),:P704_ACCOUNTGROUP))',
'            || ''</b></span>'' End',
'    || ''<span class="ds-fin-chip"><span class="fa fa-money"></span>Currency <b>INR (base, single-currency ledger)</b></span>''',
'    || ''<span class="ds-fin-chip ds-fin-chip--live"><span class="fa fa-clock-o"></span>Last posting <b>''',
'       || nvl((Select to_char(Max(d.VoucherDate),''DD-MM-RRRR'')',
'                 From VoucherDetail d',
'                Where ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'                  And (:P704_PANEL    Is Null Or d.Panel        = :P704_PANEL)',
'                  And (:P704_COMPANY  Is Null Or d.CompanyCode  = :P704_COMPANY)',
'                  And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION)),''no postings'') || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P704_FROMDATE,P704_TODATE,P704_COMPANY,P704_LOCATION,P704_PANEL,P704_ACCOUNTGROUP'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12781737136301078)
,p_query_column_id=>1
,p_column_alias=>'HEAD'
,p_column_display_sequence=>10
,p_column_heading=>'HEAD'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12781876332301078)
,p_plug_name=>'Movement by Voucher Type'
,p_static_id=>'doctype-bar'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>54
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>5
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select * From (',
'  Select v.DocTypeCode As LABEL,',
'         Round(Sum(Case When nvl(d.Amount,0) < 0 Then -d.Amount Else 0 End)/100000,2) As DEBIT_LAC',
'    From VoucherDetail d',
'    Join Voucher v On v.Tno = d.Tno',
'   Where d.VoucherDate >= to_date(:P704_FROMDATE,''DD-MM-RRRR'')',
'     And d.VoucherDate <  to_date(:P704_TODATE,''DD-MM-RRRR'') + 1',
'     And v.VoucherNo <> ''OPENING''',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'     And (:P704_PANEL    Is Null Or d.Panel        = :P704_PANEL)',
'     And (:P704_COMPANY  Is Null Or d.CompanyCode  = :P704_COMPANY)',
'     And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION)',
'   Group By v.DocTypeCode',
'   Order By 2 Desc)',
' Where rownum <= 10'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P704_FROMDATE,P704_TODATE,P704_COMPANY,P704_LOCATION,P704_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12781916005301078)
,p_region_id=>wwv_flow_imp.id(12781876332301078)
,p_chart_type=>'bar'
,p_height=>'340'
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
,p_no_data_found_message=>'No voucher activity in this period.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12782029564301078)
,p_chart_id=>wwv_flow_imp.id(12781916005301078)
,p_static_id=>'doctype'
,p_seq=>10
,p_name=>unistr('Debit Movement (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'DEBIT_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12782138637301078)
,p_chart_id=>wwv_flow_imp.id(12781916005301078)
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
 p_id=>wwv_flow_imp.id(12782206965301078)
,p_chart_id=>wwv_flow_imp.id(12781916005301078)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('Debit Movement (\20B9 Lac)')
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
 p_id=>wwv_flow_imp.id(12782332799301078)
,p_plug_name=>'Dormant Balances'
,p_static_id=>'dormant'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>68
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Fy As (',
'       /* Always exactly one row. A From Date outside every defined',
'          financial year would otherwise empty this CTE and, with it,',
'          every aggregate downstream. Falling back to the From Date',
'          itself makes the opening nil and leaves movement intact; the',
'          header chip already says the date is outside any known year. */',
'       Select nvl((Select f.FinancialYearBegin From FinancialYear f',
'                    Where to_date(:P704_FROMDATE,''DD-MM-RRRR'') Between f.FinancialYearBegin And f.FinancialYearEnd),',
'                  to_date(:P704_FROMDATE,''DD-MM-RRRR'')) Fb From dual),',
'     Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'     Op As (Select o.AccountCode Acct, Sum(nvl(o.OpeningAmount,0)) Amt From Opening o, Fy',
'             Where o.OpeningDate = Fy.Fb',
'               And ((Select GetUserPanelAB_apex() From dual) Is Null Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'               And (:P704_PANEL Is Null Or o.Panel = :P704_PANEL)',
'               And (:P704_COMPANY Is Null Or o.CompanyCode = :P704_COMPANY)',
'               And (:P704_LOCATION Is Null Or o.LocationCode = :P704_LOCATION)',
'             Group By o.AccountCode),',
'     Mv As (Select d.AccountCode Acct,',
'                   Sum(Case When d.VoucherDate < to_date(:P704_FROMDATE,''DD-MM-RRRR'') Then nvl(d.Amount,0) Else 0 End) Pre,',
'                   Sum(Case When d.VoucherDate >= to_date(:P704_FROMDATE,''DD-MM-RRRR'') Then 1 Else 0 End) PeriodLines,',
'                   Max(d.VoucherDate) LastMove',
'              From VoucherDetail d, Fy',
'             Where d.VoucherDate >= Fy.Fb And d.VoucherDate < to_date(:P704_TODATE,''DD-MM-RRRR'') + 1',
'               And d.Tno Not In (Select Tno From Carry)',
'               And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'               And (:P704_PANEL Is Null Or d.Panel = :P704_PANEL)',
'               And (:P704_COMPANY Is Null Or d.CompanyCode = :P704_COMPANY)',
'               And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION)',
'             Group By d.AccountCode),',
'     Bal As (Select nvl(o.Acct,m.Acct) Acct, nvl(o.Amt,0)+nvl(m.Pre,0) Cl,',
'                    nvl(m.PeriodLines,0) PeriodLines, m.LastMove',
'               From Op o Full Outer Join Mv m On m.Acct = o.Acct)',
'Select ''<a href="'' || apex_page.get_url(p_page => 677, p_clear_cache => ''677'',',
'                p_items => ''P677_ACCOUNT,P677_FROMDATE,P677_TODATE,P677_COMPANY,P677_LOCATION,P677_PANEL'',',
'                p_values => b.Acct || '','' || :P704_FROMDATE || '','' || :P704_TODATE || '',''',
'                            || :P704_COMPANY || '','' || :P704_LOCATION || '','' || :P704_PANEL)',
'       || ''">'' || apex_escape.html(nvl(p.PartyName,b.Acct)) || ''</a>'' As ACCOUNT,',
'       b.Acct                                       As ACCOUNT_CODE,',
'       apex_escape.html(nvl(g.PartyName,''&mdash;'')) As ACCOUNT_GROUP,',
'       Round(Greatest(-b.Cl,0),2)                   As BALANCE_DEBIT,',
'       Round(Greatest( b.Cl,0),2)                   As BALANCE_CREDIT,',
'       b.LastMove                                   As LAST_POSTING_IN_YEAR,',
'       Case When b.LastMove Is Null',
'                 Then ''<span class="ds-finchip ds-finchip--watch">No posting this year</span>''',
'            Else      ''<span class="ds-finchip ds-finchip--flat">No posting in period</span>'' End As STATUS',
'  From Bal b',
'  Left Join Party p On p.PartyCode = b.Acct',
'  Left Join Party g On g.PartyCode = p.ParentCode',
' Where b.PeriodLines = 0 And Abs(b.Cl) > 0.5',
' Order By Abs(b.Cl) Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P704_FROMDATE,P704_TODATE,P704_COMPANY,P704_LOCATION,P704_PANEL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(12782479716301078)
,p_no_data_found_message=>'Every account carrying a balance also moved in this period.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>43524713636737361
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12782506882301079)
,p_db_column_name=>'ACCOUNT'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Account'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12782661165301079)
,p_db_column_name=>'ACCOUNT_CODE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12782730729301109)
,p_db_column_name=>'ACCOUNT_GROUP'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Group'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12782848467301109)
,p_db_column_name=>'BALANCE_CREDIT'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Balance Cr (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12782901831301109)
,p_db_column_name=>'BALANCE_DEBIT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Balance Dr (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12783022646301109)
,p_db_column_name=>'LAST_POSTING_IN_YEAR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Last Posting This Year'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12783131994301109)
,p_db_column_name=>'STATUS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12783217326301109)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'ACCOUNT:ACCOUNT_GROUP:BALANCE_DEBIT:BALANCE_CREDIT:LAST_POSTING_IN_YEAR:STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12783327759301109)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p675Filters'
,p_region_css_classes=>'ds-dash-filters'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12783455935301110)
,p_plug_name=>'Advanced Filters'
,p_static_id=>'filter-drawer'
,p_region_name=>'p675Drawer'
,p_region_css_classes=>'ds-filterdrawer js-dialog-class-t-Drawer--pullOutEnd'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>1662449473392619772
,p_plug_display_sequence=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12783512749301110)
,p_plug_name=>'Top Account Groups by Closing Balance'
,p_static_id=>'group-bar'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>42
,p_plug_grid_column_span=>8
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Fy As (',
'       /* Always exactly one row. A From Date outside every defined',
'          financial year would otherwise empty this CTE and, with it,',
'          every aggregate downstream. Falling back to the From Date',
'          itself makes the opening nil and leaves movement intact; the',
'          header chip already says the date is outside any known year. */',
'       Select nvl((Select f.FinancialYearBegin From FinancialYear f',
'                    Where to_date(:P704_FROMDATE,''DD-MM-RRRR'') Between f.FinancialYearBegin And f.FinancialYearEnd),',
'                  to_date(:P704_FROMDATE,''DD-MM-RRRR'')) Fb From dual),',
'     Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'     /* Level-3 node of the GRAFTED chart - the same hierarchy page 675',
'        draws. A group''s statement comes from its nature, not from a',
'        parent an end user happened to pick, so BALANCE SHEET and PROFIT',
'        AND LOSS are synthetic here too. Walking down from those two',
'        names instead would miss the 42 major groups that were never put',
'        inside either, which is most of the chart by count. */',
'     Grp As (',
'       Select w.Leaf,',
'              regexp_substr(',
'                Case When w.Root In (''BALANCESHEET'',''PROFITANDLOSS'') Then w.Path',
'                     Else ''/'' || Case When w.RootNat In (''ASSETS'',''LIABILITIES'') Then ''BALANCESHEET''',
'                                      When w.RootNat In (''INCOME'',''EXPENSES'')    Then ''PROFITANDLOSS''',
'                                      Else ''NOSTATEMENT'' End || w.Path End,',
'                ''[^/]+'',1,3) Node',
'         From (Select o.PartyCode Leaf,',
'                      Connect_By_Root o.PartyCode           Root,',
'                      Connect_By_Root o.NatureOfAccountCode RootNat,',
'                      Sys_Connect_By_Path(o.PartyCode,''/'')  Path',
'                 From Party o',
'                Start With o.ParentCode Is Null',
'              Connect By Prior o.PartyCode = o.ParentCode) w),',
'     Op As (Select o.AccountCode Acct, Sum(nvl(o.OpeningAmount,0)) Amt From Opening o, Fy',
'             Where o.OpeningDate = Fy.Fb',
'               And ((Select GetUserPanelAB_apex() From dual) Is Null Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'               And (:P704_PANEL Is Null Or o.Panel = :P704_PANEL)',
'               And (:P704_COMPANY Is Null Or o.CompanyCode = :P704_COMPANY)',
'               And (:P704_LOCATION Is Null Or o.LocationCode = :P704_LOCATION)',
'             Group By o.AccountCode),',
'     Mv As (Select d.AccountCode Acct, Sum(nvl(d.Amount,0)) Amt From VoucherDetail d, Fy',
'             Where d.VoucherDate >= Fy.Fb And d.VoucherDate < to_date(:P704_TODATE,''DD-MM-RRRR'') + 1',
'               And d.Tno Not In (Select Tno From Carry)',
'               And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'               And (:P704_PANEL Is Null Or d.Panel = :P704_PANEL)',
'               And (:P704_COMPANY Is Null Or d.CompanyCode = :P704_COMPANY)',
'               And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION)',
'             Group By d.AccountCode),',
'     Bal As (Select nvl(o.Acct,m.Acct) Acct,',
'                    Greatest(-(nvl(o.Amt,0)+nvl(m.Amt,0)),0) ClDr,',
'                    Greatest( (nvl(o.Amt,0)+nvl(m.Amt,0)),0) ClCr',
'               From Op o Full Outer Join Mv m On m.Acct = o.Acct)',
'Select * From (',
'  Select apex_escape.html(nvl(p.PartyName, g.Node)) As LABEL,',
'         Round(Sum(b.ClDr)/100000,2) As DEBIT_LAC,',
'         Round(Sum(b.ClCr)/100000,2) As CREDIT_LAC',
'    From Bal b Join Grp g On g.Leaf = b.Acct',
'    Left Join Party p On p.PartyCode = g.Node',
'   Where g.Node Is Not Null',
'   Group By g.Node, p.PartyName',
'  Having Sum(b.ClDr) + Sum(b.ClCr) > 0.005',
'   Order By Sum(b.ClDr) + Sum(b.ClCr) Desc)',
' Where rownum <= 12'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P704_FROMDATE,P704_TODATE,P704_COMPANY,P704_LOCATION,P704_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12783654538301110)
,p_region_id=>wwv_flow_imp.id(12783512749301110)
,p_chart_type=>'bar'
,p_height=>'360'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
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
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No account group carries a closing balance in this scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12783715122301110)
,p_chart_id=>wwv_flow_imp.id(12783654538301110)
,p_static_id=>'closing-credit'
,p_seq=>20
,p_name=>unistr('Closing Credit (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'CREDIT_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12783809771301110)
,p_chart_id=>wwv_flow_imp.id(12783654538301110)
,p_static_id=>'closing-debit'
,p_seq=>10
,p_name=>unistr('Closing Debit (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'DEBIT_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12783905651301110)
,p_chart_id=>wwv_flow_imp.id(12783654538301110)
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
 p_id=>wwv_flow_imp.id(12784003204301110)
,p_chart_id=>wwv_flow_imp.id(12783654538301110)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('Closing Balance (\20B9 Lac)')
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12784169319301110)
,p_name=>'Posting Integrity'
,p_static_id=>'integrity'
,p_template=>4502917002193490937
,p_display_sequence=>62
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Every count here is a real control this ERP can actually answer.',
'   There is deliberately NO "unposted vouchers" card: the Voucher table',
'   carries no approval, posting or draft status column at all, so every',
'   row in it is posted by construction. Inventing a status would be the',
'   easiest possible way to make this page lie. */',
'With B As (',
'       Select to_date(:P704_FROMDATE,''DD-MM-RRRR'') Fd, to_date(:P704_TODATE,''DD-MM-RRRR'') Td From dual),',
'     Unbal As (',
'       Select Count(*) N, nvl(Sum(Abs(s)),0) V From (',
'         Select d.Tno, Sum(nvl(d.Amount,0)) s',
'           From VoucherDetail d, B',
'          Where d.VoucherDate >= B.Fd And d.VoucherDate < B.Td + 1',
'            And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'            And (:P704_PANEL Is Null Or d.Panel = :P704_PANEL)',
'            And (:P704_COMPANY Is Null Or d.CompanyCode = :P704_COMPANY)',
'            And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION)',
'          Group By d.Tno Having Abs(Sum(nvl(d.Amount,0))) > 0.005)),',
'     Empty As (',
'       Select Count(*) N From Voucher v, B',
'        Where v.VoucherDate >= B.Fd And v.VoucherDate < B.Td + 1',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or v.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P704_PANEL Is Null Or v.Panel = :P704_PANEL)',
'          And (:P704_COMPANY Is Null Or v.CompanyCode = :P704_COMPANY)',
'          And (:P704_LOCATION Is Null Or v.LocationCode = :P704_LOCATION)',
'          And Not Exists (Select 1 From VoucherDetail d Where d.Tno = v.Tno)),',
'     Nil As (',
'       Select Count(Case When d.Amount Is Null Then 1 End) NullAmt,',
'              Count(Case When d.Amount = 0 Then 1 End) ZeroAmt',
'         From VoucherDetail d, B',
'        Where d.VoucherDate >= B.Fd And d.VoucherDate < B.Td + 1',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P704_PANEL Is Null Or d.Panel = :P704_PANEL)',
'          And (:P704_COMPANY Is Null Or d.CompanyCode = :P704_COMPANY)',
'          And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION)),',
'     Fut As (',
'       Select Count(Distinct d.Tno) N, nvl(Sum(Abs(nvl(d.Amount,0))),0) V',
'         From VoucherDetail d',
'        Where d.VoucherDate > trunc(sysdate)',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P704_PANEL Is Null Or d.Panel = :P704_PANEL)',
'          And (:P704_COMPANY Is Null Or d.CompanyCode = :P704_COMPANY)',
'          And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION)),',
'     /* VoucherDLog is the ERP''s own deletion audit: a voucher that once',
'        existed and no longer does. It is the closest thing this ledger',
'        has to a cancellation, and it is a real control signal.',
'        SCOPE LIMIT: the table carries CompanyCode but NO Panel and NO',
'        LocationCode, and the voucher it refers to is gone, so there is',
'        nothing left to join to for the other two. This count is company-',
'        scoped only, and the card says so rather than implying otherwise. */',
'     Del As (',
'       Select Count(*) N From VoucherDLog dl, B',
'        Where dl.VoucherDate >= B.Fd And dl.VoucherDate < B.Td + 1',
'          And (:P704_COMPANY Is Null Or dl.CompanyCode = :P704_COMPANY)),',
'     Back As (',
'       Select Count(*) N From Voucher v, B',
'        Where v.VoucherDate >= B.Fd And v.VoucherDate < B.Td + 1',
'          And v.CreationTime Is Not Null And v.CreationTime - v.VoucherDate > 30',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or v.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P704_PANEL Is Null Or v.Panel = :P704_PANEL)',
'          And (:P704_COMPANY Is Null Or v.CompanyCode = :P704_COMPANY)',
'          And (:P704_LOCATION Is Null Or v.LocationCode = :P704_LOCATION)),',
'     Off As (',
'       Select Count(*) N, Count(Distinct d.AccountCode) A',
'         From VoucherDetail d, B',
'        Where d.VoucherDate >= B.Fd And d.VoucherDate < B.Td + 1',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P704_PANEL Is Null Or d.Panel = :P704_PANEL)',
'          And (:P704_COMPANY Is Null Or d.CompanyCode = :P704_COMPANY)',
'          And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION)',
'          /* Every account reaches a root now that the walk starts at',
'             ParentCode Is Null, so "hangs off no root" would read zero',
'             for ever and the control would be dead. What still needs',
'             watching is an account that cannot be placed in EITHER',
'             statement because nothing on its branch carries a nature -',
'             the same rows page 675 collects under "Nature not set in',
'             the ERP". Fixing one is a master-data edit, not a code',
'             change, and this is what says how much money is waiting on',
'             it. */',
'          And d.AccountCode In (',
'                Select w.Leaf',
'                  From (Select o.PartyCode Leaf,',
'                               Connect_By_Root o.NatureOfAccountCode RootNat,',
'                               regexp_substr(Sys_Connect_By_Path(o.PartyCode,''/''),''[^/]+'',1,2) L2',
'                          From Party o',
'                         Start With o.ParentCode Is Null',
'                       Connect By Prior o.PartyCode = o.ParentCode) w',
'                 Where w.RootNat Is Null',
'                   And nvl(w.L2,''-'') Not In (''ASSET'',''LIABILITY'',''INCOME'',''EXPENDITURES'')))',
'Select ''<div class="ds-kpi ds-kpi--'' || Case When u.N = 0 Then ''ok'' Else ''risk'' End',
'    || ''" title="Vouchers whose own lines do not net to zero. Source: sum of VoucherDetail.Amount per Tno, tolerance half a paisa.">''',
'    || ''<span class="ds-kpi-ic fa fa-unlink"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Out-of-Balance Vouchers</div><div class="ds-kpi-n">''',
'    || to_char(u.N,''FM999G99G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">''',
'       || Case When u.N = 0 Then ''Every voucher in the period nets to zero''',
'               Else ''&#8377;'' || to_char(u.V,''FM99G99G99G990D00'') || '' unmatched'' End',
'    || ''</div></div></div>'' As C1,',
'',
'       ''<div class="ds-kpi ds-kpi--'' || Case When e.N = 0 Then ''ok'' Else ''exc'' End',
'    || ''" title="Voucher headers with no VoucherDetail line at all. They contribute nothing to the ledger but are incomplete documents.">''',
'    || ''<span class="ds-kpi-ic fa fa-file-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Vouchers With No Lines</div><div class="ds-kpi-n">''',
'    || to_char(e.N,''FM999G99G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">Headers carrying no posting at all</div>''',
'    || ''</div></div>'' As C2,',
'',
'       ''<div class="ds-kpi ds-kpi--'' || Case When n.NullAmt + n.ZeroAmt = 0 Then ''ok'' Else ''exc'' End',
'    || ''" title="Voucher lines with a null or zero amount. Neither moves the ledger; a null amount is a data-quality fault, a zero is usually a cancelled line left in place.">''',
'    || ''<span class="ds-kpi-ic fa fa-ban"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Empty Voucher Lines</div><div class="ds-kpi-n">''',
'    || to_char(n.NullAmt + n.ZeroAmt,''FM999G99G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || to_char(n.NullAmt,''FM999G990'') || '' null &middot; ''',
'       || to_char(n.ZeroAmt,''FM999G990'') || '' zero</div>''',
'    || ''</div></div>'' As C3,',
'',
'       ''<div class="ds-kpi ds-kpi--'' || Case When f.N = 0 Then ''ok'' Else ''exc'' End',
'    || ''" title="Postings dated after today. Legitimate for a forward-dated payment, but they sit in the ledger now.">''',
'    || ''<span class="ds-kpi-ic fa fa-calendar-plus-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Future-Dated Postings</div><div class="ds-kpi-n">''',
'    || to_char(f.N,''FM999G99G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">''',
'       || Case When f.N = 0 Then ''Nothing is dated beyond today''',
'               Else ''&#8377;'' || to_char(f.V,''FM99G99G99G990D00'') || '' beyond today'' End',
'    || ''</div></div></div>'' As C4,',
'',
'       ''<div class="ds-kpi ds-kpi--'' || Case When d.N = 0 Then ''ok'' Else ''exc'' End',
'    || ''" title="Vouchers deleted from this period, from the ERP''''s own VoucherDLog audit table. This ledger has no reversal or cancellation flag - deletion is the mechanism. VoucherDLog carries no panel or location column and the voucher itself is g'
||'one, so this count honours the Company filter only.">''',
'    || ''<span class="ds-kpi-ic fa fa-trash-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Deleted Vouchers</div><div class="ds-kpi-n">''',
'    || to_char(d.N,''FM999G99G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">Audited in VoucherDLog &middot; company scope only</div>''',
'    || ''</div></div>'' As C5,',
'',
'       ''<div class="ds-kpi ds-kpi--'' || Case When b.N = 0 Then ''ok'' Else ''exc'' End',
'    || ''" title="Vouchers entered more than 30 days after their own voucher date. Source: Voucher.CreationTime minus Voucher.VoucherDate.">''',
'    || ''<span class="ds-kpi-ic fa fa-history"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Backdated Over 30 Days</div><div class="ds-kpi-n">''',
'    || to_char(b.N,''FM999G99G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">Posted long after the date they claim</div>''',
'    || ''</div></div>'' As C6,',
'',
'       ''<div class="ds-kpi ds-kpi--'' || Case When o.N = 0 Then ''ok'' Else ''risk'' End',
'    || ''" title="Lines posted to accounts that fall in neither statement because nothing on their branch carries a nature. Real money the Balance Sheet and Profit and Loss both miss. Set NatureOfAccountCode on the major group in the ERP and they plac'
||'e themselves.">''',
'    || ''<span class="ds-kpi-ic fa fa-unlink"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Postings With No Nature</div><div class="ds-kpi-n">''',
'    || to_char(o.N,''FM999G99G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || to_char(o.A,''FM999G990'') || '' account(s) with no nature set</div>''',
'    || ''</div></div>'' As C7,',
'',
'       ''<div class="ds-kpi ds-kpi--slate" title="Not a metric - a statement of scope. The Voucher table has no approval, posting or draft column, so no unposted-voucher control can honestly be built on this ERP.">''',
'    || ''<span class="ds-kpi-ic fa fa-info"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Posting Status</div><div class="ds-kpi-n">Not held</div>''',
'    || ''<div class="ds-kpi-sub">This ERP stores no draft or approval state &mdash; every voucher is posted</div>''',
'    || ''</div></div>'' As C8',
'  From Unbal u Cross Join Empty e Cross Join Nil n Cross Join Fut f',
'  Cross Join Del d Cross Join Back b Cross Join Off o'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P704_FROMDATE,P704_TODATE,P704_COMPANY,P704_LOCATION,P704_PANEL'
,p_lazy_loading=>true
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12784261553301110)
,p_query_column_id=>1
,p_column_alias=>'C1'
,p_column_display_sequence=>10
,p_column_heading=>'C1'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12784342145301110)
,p_query_column_id=>2
,p_column_alias=>'C2'
,p_column_display_sequence=>20
,p_column_heading=>'C2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12784487407301110)
,p_query_column_id=>3
,p_column_alias=>'C3'
,p_column_display_sequence=>30
,p_column_heading=>'C3'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12784505988301111)
,p_query_column_id=>4
,p_column_alias=>'C4'
,p_column_display_sequence=>40
,p_column_heading=>'C4'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12784667255301111)
,p_query_column_id=>5
,p_column_alias=>'C5'
,p_column_display_sequence=>50
,p_column_heading=>'C5'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12784792961301111)
,p_query_column_id=>6
,p_column_alias=>'C6'
,p_column_display_sequence=>60
,p_column_heading=>'C6'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12784854713301111)
,p_query_column_id=>7
,p_column_alias=>'C7'
,p_column_display_sequence=>70
,p_column_heading=>'C7'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12784991013301111)
,p_query_column_id=>8
,p_column_alias=>'C8'
,p_column_display_sequence=>80
,p_column_heading=>'C8'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12785085154301111)
,p_name=>'Ledger Pulse KPIs'
,p_static_id=>'kpi-strip'
,p_template=>4502917002193490937
,p_display_sequence=>22
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Fy As (',
'       /* Always exactly one row. A From Date outside every defined',
'          financial year would otherwise empty this CTE and, with it,',
'          every aggregate downstream. Falling back to the From Date',
'          itself makes the opening nil and leaves movement intact; the',
'          header chip already says the date is outside any known year. */',
'       Select nvl((Select f.FinancialYearBegin From FinancialYear f',
'                    Where to_date(:P704_FROMDATE,''DD-MM-RRRR'') Between f.FinancialYearBegin And f.FinancialYearEnd),',
'                  to_date(:P704_FROMDATE,''DD-MM-RRRR'')) Fb From dual),',
'     Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'     Op As (',
'       Select o.AccountCode Acct, Sum(nvl(o.OpeningAmount,0)) Amt',
'         From Opening o, Fy',
'        Where o.OpeningDate = Fy.Fb',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P704_PANEL    Is Null Or o.Panel        = :P704_PANEL)',
'          And (:P704_COMPANY  Is Null Or o.CompanyCode  = :P704_COMPANY)',
'          And (:P704_LOCATION Is Null Or o.LocationCode = :P704_LOCATION)',
'        Group By o.AccountCode),',
'     Mv As (',
'       Select d.AccountCode Acct,',
'              Sum(Case When d.VoucherDate <  to_date(:P704_FROMDATE,''DD-MM-RRRR'') Then nvl(d.Amount,0) Else 0 End) Pre,',
'              Sum(Case When d.VoucherDate >= to_date(:P704_FROMDATE,''DD-MM-RRRR'') And nvl(d.Amount,0) < 0 Then -d.Amount Else 0 End) Dr,',
'              Sum(Case When d.VoucherDate >= to_date(:P704_FROMDATE,''DD-MM-RRRR'') And nvl(d.Amount,0) > 0 Then  d.Amount Else 0 End) Cr,',
'              Count(Case When d.VoucherDate >= to_date(:P704_FROMDATE,''DD-MM-RRRR'') Then 1 End) Lines',
'         From VoucherDetail d, Fy',
'        Where d.VoucherDate >= Fy.Fb',
'          And d.VoucherDate <  to_date(:P704_TODATE,''DD-MM-RRRR'') + 1',
'          And d.Tno Not In (Select Tno From Carry)',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P704_PANEL    Is Null Or d.Panel        = :P704_PANEL)',
'          And (:P704_COMPANY  Is Null Or d.CompanyCode  = :P704_COMPANY)',
'          And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION)',
'        Group By d.AccountCode),',
'     Bal As (',
'       Select nvl(o.Acct,m.Acct) Acct, nvl(o.Amt,0) + nvl(m.Pre,0) Opn,',
'              nvl(m.Dr,0) Dr, nvl(m.Cr,0) Cr, nvl(m.Lines,0) Lines',
'         From Op o Full Outer Join Mv m On m.Acct = o.Acct),',
'     T As (',
'       Select Sum(Greatest(-Opn,0)) OpDr, Sum(Greatest(Opn,0)) OpCr,',
'              Sum(Dr) PDr, Sum(Cr) PCr,',
'              Sum(Greatest(-(Opn-Dr+Cr),0)) ClDr, Sum(Greatest((Opn-Dr+Cr),0)) ClCr,',
'              Count(*) Accts,',
'              Count(Case When Lines > 0 Then 1 End) Moved,',
'              Count(Case When Abs(Opn-Dr+Cr) < 0.005 Then 1 End) ZeroBal,',
'              Sum(Lines) Lines',
'         From Bal),',
'     /* Prior window of equal length, immediately preceding, clamped to',
'        the year begin so a comparison can never reach back across the',
'        year-end close and pick the carry-forward up as movement. */',
'     Prv As (',
'       Select nvl(Sum(Case When nvl(d.Amount,0) < 0 Then -d.Amount Else 0 End),0) Dr,',
'              nvl(Sum(Case When nvl(d.Amount,0) > 0 Then  d.Amount Else 0 End),0) Cr',
'         From VoucherDetail d, Fy',
'        Where d.VoucherDate >= Greatest(Fy.Fb, to_date(:P704_FROMDATE,''DD-MM-RRRR'')',
'                                  - (to_date(:P704_TODATE,''DD-MM-RRRR'') - to_date(:P704_FROMDATE,''DD-MM-RRRR'') + 1))',
'          And d.VoucherDate <  to_date(:P704_FROMDATE,''DD-MM-RRRR'')',
'          And d.Tno Not In (Select Tno From Carry)',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P704_PANEL    Is Null Or d.Panel        = :P704_PANEL)',
'          And (:P704_COMPANY  Is Null Or d.CompanyCode  = :P704_COMPANY)',
'          And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION)),',
'     /* Abnormal = the closing side contradicts Party.BasicNature, the',
'        ERP''s own declaration of which side an account should sit on.',
'        Accounts where the ERP has not declared a nature are NOT judged. */',
'     Abn As (',
'       Select Count(*) N, nvl(Sum(Abs(b.Opn-b.Dr+b.Cr)),0) V',
'         From Bal b Join Party p On p.PartyCode = b.Acct',
'        Where (p.BasicNature = ''DR'' And (b.Opn-b.Dr+b.Cr) > 0.5)',
'           Or (p.BasicNature = ''CR'' And (b.Opn-b.Dr+b.Cr) < -0.5)),',
'     Vch As (',
'       Select Count(Distinct d.Tno) N, Max(d.VoucherDate) Last',
'         From VoucherDetail d',
'        Where d.VoucherDate >= to_date(:P704_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P704_TODATE,''DD-MM-RRRR'') + 1',
'          And d.Tno Not In (Select Tno From Carry)',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P704_PANEL    Is Null Or d.Panel        = :P704_PANEL)',
'          And (:P704_COMPANY  Is Null Or d.CompanyCode  = :P704_COMPANY)',
'          And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION))',
'Select ''<div class="ds-kpi ds-kpi--dr" title="Sum of the closing debit side, decided per posting account then totalled. Source: Opening + VoucherDetail.">''',
'    || ''<span class="ds-kpi-ic fa fa-arrow-circle-o-left"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Closing Debit</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.ClDr >= 10000000 Then to_char(t.ClDr/10000000,''FM9G99G990D00'')||''<i>Cr</i>''',
'            When t.ClDr >= 100000   Then to_char(t.ClDr/100000,''FM99G990D00'')||''<i>L</i>''',
'            Else to_char(t.ClDr,''FM99G99G990D00'') End || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || to_char(t.Accts,''FM999G990'') || '' accounts in scope as at '' || :P704_TODATE || ''</div>''',
'    || ''</div></div>'' As KPI1,',
'',
'       ''<div class="ds-kpi ds-kpi--cr" title="Sum of the closing credit side, decided per posting account then totalled.">''',
'    || ''<span class="ds-kpi-ic fa fa-arrow-circle-o-right"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Closing Credit</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.ClCr >= 10000000 Then to_char(t.ClCr/10000000,''FM9G99G990D00'')||''<i>Cr</i>''',
'            When t.ClCr >= 100000   Then to_char(t.ClCr/100000,''FM99G990D00'')||''<i>L</i>''',
'            Else to_char(t.ClCr,''FM99G99G990D00'') End || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || to_char(t.ZeroBal,''FM999G990'') || '' of them close at zero</div>''',
'    || ''</div></div>'' As KPI2,',
'',
'       ''<div class="ds-kpi ds-kpi--'' || Case When Abs(t.ClDr-t.ClCr) < 0.005 Then ''ok'' Else ''risk'' End',
'    || ''" title="Closing debit less closing credit, compared at full precision. Anything other than zero means the ledger does not balance for this scope.">''',
'    || ''<span class="ds-kpi-ic fa fa-balance-scale"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Balance Difference</div><div class="ds-kpi-n">&#8377;''',
'    || to_char(Abs(t.ClDr-t.ClCr),''FM99G99G99G990D00'') || ''</div>''',
'    || Case When Abs(t.ClDr-t.ClCr) < 0.005',
'            Then ''<div class="ds-kpi-sub">Debits equal credits &mdash; the books balance</div>''',
'            Else ''<div class="ds-kpi-sub">Carried from an opening difference of &#8377;''',
'                 || to_char(Abs(t.OpDr-t.OpCr),''FM99G99G99G990D00'') || ''</div>'' End',
'    || ''</div></div>'' As KPI3,',
'',
'       ''<div class="ds-kpi ds-kpi--move" title="Debit movement posted between From Date and To Date, excluding the OPENING carry-forward vouchers.">''',
'    || ''<span class="ds-kpi-ic fa fa-sign-in"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Period Debit</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.PDr >= 10000000 Then to_char(t.PDr/10000000,''FM9G99G990D00'')||''<i>Cr</i>''',
'            When t.PDr >= 100000   Then to_char(t.PDr/100000,''FM99G990D00'')||''<i>L</i>''',
'            Else to_char(t.PDr,''FM99G99G990D00'') End || ''</div>''',
'    || Case When nvl(v.Dr,0) = 0',
'            Then ''<span class="ds-delta ds-delta--flat"><span class="fa fa-minus"></span>No prior window</span>''',
'            Else ''<span class="ds-delta ds-delta--''||Case When t.PDr >= v.Dr Then ''up'' Else ''down'' End||''">''',
'                 ||''<span class="fa fa-arrow-''||Case When t.PDr >= v.Dr Then ''up'' Else ''down'' End||''"></span>''',
'                 ||to_char(Abs(t.PDr-v.Dr)/v.Dr*100,''FM990D0'')||''%<small>vs prev period</small></span>'' End',
'    || ''<div class="ds-kpi-sub">'' || to_char(t.Lines,''FM999G99G990'') || '' voucher lines posted</div>''',
'    || ''</div></div>'' As KPI4,',
'',
'       ''<div class="ds-kpi ds-kpi--move" title="Credit movement posted between From Date and To Date. Always equal to period debit: every voucher in this ERP nets to zero.">''',
'    || ''<span class="ds-kpi-ic fa fa-sign-out"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Period Credit</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.PCr >= 10000000 Then to_char(t.PCr/10000000,''FM9G99G990D00'')||''<i>Cr</i>''',
'            When t.PCr >= 100000   Then to_char(t.PCr/100000,''FM99G990D00'')||''<i>L</i>''',
'            Else to_char(t.PCr,''FM99G99G990D00'') End || ''</div>''',
'    || Case When nvl(v.Cr,0) = 0',
'            Then ''<span class="ds-delta ds-delta--flat"><span class="fa fa-minus"></span>No prior window</span>''',
'            Else ''<span class="ds-delta ds-delta--''||Case When t.PCr >= v.Cr Then ''up'' Else ''down'' End||''">''',
'                 ||''<span class="fa fa-arrow-''||Case When t.PCr >= v.Cr Then ''up'' Else ''down'' End||''"></span>''',
'                 ||to_char(Abs(t.PCr-v.Cr)/v.Cr*100,''FM990D0'')||''%<small>vs prev period</small></span>'' End',
'    || ''<div class="ds-kpi-sub">'' || to_char(c.N,''FM999G99G990'') || '' vouchers touched the ledger</div>''',
'    || ''</div></div>'' As KPI5,',
'',
'       ''<div class="ds-kpi ds-kpi--struct" title="Posting accounts carrying an opening balance or a movement in this scope. Group accounts are never posted to in this ERP.">''',
'    || ''<span class="ds-kpi-ic fa fa-sitemap"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Active Ledger Accounts</div><div class="ds-kpi-n">''',
'    || to_char(t.Accts,''FM999G99G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || to_char(t.Moved,''FM999G990'') || '' moved in period &middot; ''',
'       || to_char(t.Accts - t.Moved,''FM999G990'') || '' dormant</div>''',
'    || ''</div></div>'' As KPI6,',
'',
'       ''<div class="ds-kpi ds-kpi--'' || Case When a.N = 0 Then ''ok'' Else ''exc'' End',
'    || ''" title="Accounts whose closing side contradicts Party.BasicNature - the side the ERP itself says the account belongs on. Accounts with no declared nature are not judged.">''',
'    || ''<span class="ds-kpi-ic fa fa-exclamation-triangle"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Abnormal Balances</div><div class="ds-kpi-n">''',
'    || to_char(a.N,''FM999G99G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">''',
'       || Case When a.N = 0 Then ''Every declared account sits on its expected side''',
'               Else ''&#8377;'' || Case When a.V >= 10000000 Then to_char(a.V/10000000,''FM9G99G990D00'')||'' Cr''',
'                                     Else to_char(a.V/100000,''FM99G990D00'')||'' L'' End || '' on the wrong side'' End',
'    || ''</div></div></div>'' As KPI7,',
'',
'       ''<div class="ds-kpi ds-kpi--slate" title="Newest voucher date inside the selected period and scope. This is a posting date, not a system timestamp.">''',
'    || ''<span class="ds-kpi-ic fa fa-clock-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Last Posting in Period</div><div class="ds-kpi-n">''',
'    || nvl(to_char(c.Last,''DD-MM-RRRR''),''&mdash;'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">''',
'       || Case When c.Last Is Null Then ''Nothing posted in this window''',
'               Else to_char(trunc(sysdate) - c.Last,''FM999G990'') || '' day(s) before today'' End',
'    || ''</div></div></div>'' As KPI8',
'  From T t Cross Join Prv v Cross Join Abn a Cross Join Vch c'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P704_FROMDATE,P704_TODATE,P704_COMPANY,P704_LOCATION,P704_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12785171916301111)
,p_query_column_id=>1
,p_column_alias=>'KPI1'
,p_column_display_sequence=>10
,p_column_heading=>'KPI1'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12785231354301111)
,p_query_column_id=>2
,p_column_alias=>'KPI2'
,p_column_display_sequence=>20
,p_column_heading=>'KPI2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12785312125301111)
,p_query_column_id=>3
,p_column_alias=>'KPI3'
,p_column_display_sequence=>30
,p_column_heading=>'KPI3'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12785431560301111)
,p_query_column_id=>4
,p_column_alias=>'KPI4'
,p_column_display_sequence=>40
,p_column_heading=>'KPI4'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12785547951301111)
,p_query_column_id=>5
,p_column_alias=>'KPI5'
,p_column_display_sequence=>50
,p_column_heading=>'KPI5'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12785615945301111)
,p_query_column_id=>6
,p_column_alias=>'KPI6'
,p_column_display_sequence=>60
,p_column_heading=>'KPI6'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12785745042301111)
,p_query_column_id=>7
,p_column_alias=>'KPI7'
,p_column_display_sequence=>70
,p_column_heading=>'KPI7'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12785871411301111)
,p_query_column_id=>8
,p_column_alias=>'KPI8'
,p_column_display_sequence=>80
,p_column_heading=>'KPI8'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12785927994301111)
,p_plug_name=>'Monthly Debit and Credit Movement'
,p_static_id=>'movement-trend'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>52
,p_plug_grid_column_span=>7
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(trunc(d.VoucherDate,''MM''),''Mon RRRR'') As LABEL,',
'       Round(Sum(Case When nvl(d.Amount,0) < 0 Then -d.Amount Else 0 End)/100000,2) As DEBIT_LAC,',
'       Round(Sum(Case When nvl(d.Amount,0) > 0 Then  d.Amount Else 0 End)/100000,2) As CREDIT_LAC',
'  From VoucherDetail d',
' Where d.VoucherDate >= to_date(:P704_FROMDATE,''DD-MM-RRRR'')',
'   And d.VoucherDate <  to_date(:P704_TODATE,''DD-MM-RRRR'') + 1',
'   And d.Tno Not In (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING'')',
'   And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'   And (:P704_PANEL    Is Null Or d.Panel        = :P704_PANEL)',
'   And (:P704_COMPANY  Is Null Or d.CompanyCode  = :P704_COMPANY)',
'   And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION)',
' Group By trunc(d.VoucherDate,''MM'')',
' Order By trunc(d.VoucherDate,''MM'')'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P704_FROMDATE,P704_TODATE,P704_COMPANY,P704_LOCATION,P704_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12786034485301112)
,p_region_id=>wwv_flow_imp.id(12785927994301111)
,p_chart_type=>'line'
,p_height=>'340'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'Nothing was posted in this period for the selected scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12786115993301112)
,p_chart_id=>wwv_flow_imp.id(12786034485301112)
,p_static_id=>'credit'
,p_seq=>20
,p_name=>unistr('Credit (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'line'
,p_items_value_column_name=>'CREDIT_LAC'
,p_items_label_column_name=>'LABEL'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12786214225301112)
,p_chart_id=>wwv_flow_imp.id(12786034485301112)
,p_static_id=>'debit'
,p_seq=>10
,p_name=>unistr('Debit (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'line'
,p_items_value_column_name=>'DEBIT_LAC'
,p_items_label_column_name=>'LABEL'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12786398815301112)
,p_chart_id=>wwv_flow_imp.id(12786034485301112)
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
 p_id=>wwv_flow_imp.id(12786438785301112)
,p_chart_id=>wwv_flow_imp.id(12786034485301112)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('Movement (\20B9 Lac)')
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
 p_id=>wwv_flow_imp.id(12786539553301112)
,p_plug_name=>'Closing Balance by Account Nature'
,p_static_id=>'nature-donut'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>44
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* A donut is legitimate here and only here: the four natures are',
'   mutually exclusive and together account for every classified',
'   balance, so the slices really are parts of one whole. Debit and',
'   credit are NOT drawn as a pie anywhere on this page - they are two',
'   sides of one entry, not two parts of one total. */',
'With Fy As (',
'       /* Always exactly one row. A From Date outside every defined',
'          financial year would otherwise empty this CTE and, with it,',
'          every aggregate downstream. Falling back to the From Date',
'          itself makes the opening nil and leaves movement intact; the',
'          header chip already says the date is outside any known year. */',
'       Select nvl((Select f.FinancialYearBegin From FinancialYear f',
'                    Where to_date(:P704_FROMDATE,''DD-MM-RRRR'') Between f.FinancialYearBegin And f.FinancialYearEnd),',
'                  to_date(:P704_FROMDATE,''DD-MM-RRRR'')) Fb From dual),',
'     Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'     /* Nature is derived, not read off four hardcoded nodes. 42 major',
'        groups sit outside ASSET / LIABILITY / INCOME / EXPENDITURES and',
'        carry NatureOfAccountCode themselves; those four containers carry',
'        none, so inside them the level-2 node''s identity supplies it.',
'        Nine accounts have no nature by either route and fall out below',
'        rather than being silently counted as Expenses. */',
'     Nat As (',
'       Select w.Leaf,',
'              Case When w.RootNat Is Not Null Then w.RootNat',
'                   When w.L2 = ''ASSET''        Then ''ASSETS''',
'                   When w.L2 = ''LIABILITY''    Then ''LIABILITIES''',
'                   When w.L2 = ''INCOME''       Then ''INCOME''',
'                   When w.L2 = ''EXPENDITURES'' Then ''EXPENSES'' End Root',
'         From (Select o.PartyCode Leaf,',
'                      Connect_By_Root o.NatureOfAccountCode RootNat,',
'                      regexp_substr(Sys_Connect_By_Path(o.PartyCode,''/''),''[^/]+'',1,2) L2',
'                 From Party o',
'                Start With o.ParentCode Is Null',
'              Connect By Prior o.PartyCode = o.ParentCode) w),',
'     Op As (Select o.AccountCode Acct, Sum(nvl(o.OpeningAmount,0)) Amt From Opening o, Fy',
'             Where o.OpeningDate = Fy.Fb',
'               And ((Select GetUserPanelAB_apex() From dual) Is Null Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'               And (:P704_PANEL Is Null Or o.Panel = :P704_PANEL)',
'               And (:P704_COMPANY Is Null Or o.CompanyCode = :P704_COMPANY)',
'               And (:P704_LOCATION Is Null Or o.LocationCode = :P704_LOCATION)',
'             Group By o.AccountCode),',
'     Mv As (Select d.AccountCode Acct, Sum(nvl(d.Amount,0)) Amt From VoucherDetail d, Fy',
'             Where d.VoucherDate >= Fy.Fb And d.VoucherDate < to_date(:P704_TODATE,''DD-MM-RRRR'') + 1',
'               And d.Tno Not In (Select Tno From Carry)',
'               And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'               And (:P704_PANEL Is Null Or d.Panel = :P704_PANEL)',
'               And (:P704_COMPANY Is Null Or d.CompanyCode = :P704_COMPANY)',
'               And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION)',
'             Group By d.AccountCode),',
'     Bal As (Select nvl(o.Acct,m.Acct) Acct, Abs(nvl(o.Amt,0)+nvl(m.Amt,0)) Cl',
'               From Op o Full Outer Join Mv m On m.Acct = o.Acct)',
'Select Case n.Root When ''ASSETS'' Then ''Assets'' When ''LIABILITIES'' Then ''Liabilities''',
'                   When ''INCOME'' Then ''Income'' Else ''Expenses'' End As LABEL,',
'       Round(Sum(b.Cl)/100000,2) As VALUE_LAC',
'  From Bal b Join Nat n On n.Leaf = b.Acct',
' Where n.Root Is Not Null',
' Group By n.Root',
'Having Sum(b.Cl) > 0.005',
' Order By 2 Desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P704_FROMDATE,P704_TODATE,P704_COMPANY,P704_LOCATION,P704_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12786691449301112)
,p_region_id=>wwv_flow_imp.id(12786539553301112)
,p_chart_type=>'donut'
,p_height=>'360'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_no_data_found_message=>'No classified balance in this scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12786779462301112)
,p_chart_id=>wwv_flow_imp.id(12786691449301112)
,p_static_id=>'nature'
,p_seq=>10
,p_name=>unistr('Closing Balance (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'donut'
,p_items_value_column_name=>'VALUE_LAC'
,p_items_label_column_name=>'LABEL'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12786887886301112)
,p_plug_name=>'Control and Exceptions'
,p_static_id=>'rule-control'
,p_region_css_classes=>'ds-fin-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-fin-section">',
'  <h2>What Needs Investigating</h2>',
'  <p>Posting integrity, balances on the wrong side, unresolved clearing accounts and dormant money</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12786919197301112)
,p_plug_name=>'Account Group Analysis'
,p_static_id=>'rule-groups'
,p_region_css_classes=>'ds-fin-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-fin-section">',
'  <h2>Where the Balance Sits</h2>',
'  <p>Closing position by account group and the split across the four natures of the chart of accounts</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12787024132301112)
,p_plug_name=>'Period Movement'
,p_static_id=>'rule-movement'
,p_region_css_classes=>'ds-fin-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-fin-section">',
'  <h2>What Moved</h2>',
'  <p>Posting activity month by month, the voucher types behind it, and the accounts that moved most</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12787139374301113)
,p_plug_name=>'Ledger Pulse'
,p_static_id=>'rule-pulse'
,p_region_css_classes=>'ds-fin-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-fin-section">',
'  <h2>Ledger Pulse</h2>',
'  <p>Headline position for the selected scope, with period movement compared against the immediately preceding window of equal length</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12787218369301113)
,p_plug_name=>'Voucher Register'
,p_static_id=>'rule-register'
,p_region_css_classes=>'ds-fin-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-fin-section">',
'  <h2>Every Number Back to a Voucher</h2>',
'  <p>The vouchers behind the movement above. Open one to see its lines and the source module that raised it</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12787335447301113)
,p_plug_name=>'Suspense, Clearing and Difference Accounts'
,p_static_id=>'suspense'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>66
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The roster is taken from the chart of accounts by code and by name,',
'   not from a guess about what a clearing account is called elsewhere.',
'   Every code below was confirmed to exist in Party before it was',
'   listed, and the balances are computed the same way as the trial',
'   balance itself, so a figure here can be tied straight back to it. */',
'With Fy As (',
'       /* Always exactly one row. A From Date outside every defined',
'          financial year would otherwise empty this CTE and, with it,',
'          every aggregate downstream. Falling back to the From Date',
'          itself makes the opening nil and leaves movement intact; the',
'          header chip already says the date is outside any known year. */',
'       Select nvl((Select f.FinancialYearBegin From FinancialYear f',
'                    Where to_date(:P704_FROMDATE,''DD-MM-RRRR'') Between f.FinancialYearBegin And f.FinancialYearEnd),',
'                  to_date(:P704_FROMDATE,''DD-MM-RRRR'')) Fb From dual),',
'     Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'     Roster As (',
'       Select p.PartyCode, p.PartyName, p.ParentCode,',
'              Case When p.PartyCode = ''OPENINGDIFFERENCE'' Then ''Opening difference''',
'                   When p.PartyCode = ''GRIRACCOUNT''       Then ''Goods received, not invoiced''',
'                   When p.PartyCode Like ''UNBILLED%''      Then ''Unbilled / accrual''',
'                   When upper(p.PartyName) Like ''%SUSPENS%'' Then ''Suspense''',
'                   Else ''Clearing / difference'' End Kind',
'         From Party p',
'        Where p.PartyCode In (''OPENINGDIFFERENCE'',''GRIRACCOUNT'',''PRICEDIFFERENCEACCOUNT'',',
'                              ''SHORTAGEDEDUCTIONACCOUNT'',''UNBILLEDFUELPAYABLE'',''UNBILLEDTPAYABLE'',',
'                              ''UNBILLEDFUELCHARGEABLE'',''UNBILLEDRECEIVABLE'',''UNBILLEDREVENUE'',',
'                              ''UNBILLEDTEXPENSES'')',
'           Or upper(p.PartyName) Like ''%SUSPENS%''',
'           Or upper(p.PartyName) Like ''%CLEARING%''),',
'     Op As (Select o.AccountCode Acct, Sum(nvl(o.OpeningAmount,0)) Amt From Opening o, Fy',
'             Where o.OpeningDate = Fy.Fb',
'               And ((Select GetUserPanelAB_apex() From dual) Is Null Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'               And (:P704_PANEL Is Null Or o.Panel = :P704_PANEL)',
'               And (:P704_COMPANY Is Null Or o.CompanyCode = :P704_COMPANY)',
'               And (:P704_LOCATION Is Null Or o.LocationCode = :P704_LOCATION)',
'             Group By o.AccountCode),',
'     Mv As (Select d.AccountCode Acct,',
'                   Sum(Case When d.VoucherDate < to_date(:P704_FROMDATE,''DD-MM-RRRR'') Then nvl(d.Amount,0) Else 0 End) Pre,',
'                   Sum(Case When d.VoucherDate >= to_date(:P704_FROMDATE,''DD-MM-RRRR'') And nvl(d.Amount,0) < 0 Then -d.Amount Else 0 End) Dr,',
'                   Sum(Case When d.VoucherDate >= to_date(:P704_FROMDATE,''DD-MM-RRRR'') And nvl(d.Amount,0) > 0 Then  d.Amount Else 0 End) Cr,',
'                   Max(d.VoucherDate) LastMove,',
'                   Min(Case When Abs(nvl(d.Amount,0)) > 0.005 Then d.VoucherDate End) OldestItem',
'              From VoucherDetail d, Fy',
'             Where d.VoucherDate >= Fy.Fb And d.VoucherDate < to_date(:P704_TODATE,''DD-MM-RRRR'') + 1',
'               And d.Tno Not In (Select Tno From Carry)',
'               And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'               And (:P704_PANEL Is Null Or d.Panel = :P704_PANEL)',
'               And (:P704_COMPANY Is Null Or d.CompanyCode = :P704_COMPANY)',
'               And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION)',
'             Group By d.AccountCode)',
'Select ''<a href="'' || apex_page.get_url(p_page => 677, p_clear_cache => ''677'',',
'                p_items => ''P677_ACCOUNT,P677_FROMDATE,P677_TODATE,P677_COMPANY,P677_LOCATION,P677_PANEL'',',
'                p_values => r.PartyCode || '','' || :P704_FROMDATE || '','' || :P704_TODATE || '',''',
'                            || :P704_COMPANY || '','' || :P704_LOCATION || '','' || :P704_PANEL)',
'       || ''">'' || apex_escape.html(r.PartyName) || ''</a>''   As ACCOUNT,',
'       r.PartyCode                                          As ACCOUNT_CODE,',
'       r.Kind                                               As KIND,',
'       Round(nvl(o.Amt,0) + nvl(m.Pre,0),2) * -1            As OPENING_NET_DEBIT,',
'       Round(nvl(m.Dr,0),2)                                 As PERIOD_DEBIT,',
'       Round(nvl(m.Cr,0),2)                                 As PERIOD_CREDIT,',
'       Round((nvl(o.Amt,0)+nvl(m.Pre,0)-nvl(m.Dr,0)+nvl(m.Cr,0)),2) * -1 As CLOSING_NET_DEBIT,',
'       Case When Abs(nvl(o.Amt,0)+nvl(m.Pre,0)-nvl(m.Dr,0)+nvl(m.Cr,0)) < 0.005',
'                 Then ''<span class="ds-finchip ds-finchip--ok">Cleared</span>''',
'            When Abs(nvl(o.Amt,0)+nvl(m.Pre,0)-nvl(m.Dr,0)+nvl(m.Cr,0)) >= 10000000',
'                 Then ''<span class="ds-finchip ds-finchip--bad">Unresolved</span>''',
'            Else      ''<span class="ds-finchip ds-finchip--watch">Open</span>'' End As STATUS,',
'       m.OldestItem                                         As OLDEST_ITEM_IN_YEAR,',
'       m.LastMove                                           As LAST_POSTING,',
'       Case When m.OldestItem Is Not Null',
'            Then to_date(:P704_TODATE,''DD-MM-RRRR'') - m.OldestItem End As AGEING_DAYS',
'  From Roster r',
'  Left Join Op o On o.Acct = r.PartyCode',
'  Left Join Mv m On m.Acct = r.PartyCode',
' Order By Abs(nvl(o.Amt,0)+nvl(m.Pre,0)-nvl(m.Dr,0)+nvl(m.Cr,0)) Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P704_FROMDATE,P704_TODATE,P704_COMPANY,P704_LOCATION,P704_PANEL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(12787491729301113)
,p_no_data_found_message=>'No suspense, clearing or difference account exists in this chart of accounts.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>43523262621737359
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12787516975301113)
,p_db_column_name=>'ACCOUNT'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Account'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12787653110301113)
,p_db_column_name=>'ACCOUNT_CODE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12787742708301113)
,p_db_column_name=>'AGEING_DAYS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Ageing (days)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12787890931301113)
,p_db_column_name=>'CLOSING_NET_DEBIT'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Closing Net Dr (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12787956350301113)
,p_db_column_name=>'KIND'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Kind'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12788068743301113)
,p_db_column_name=>'LAST_POSTING'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Last Posting'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12788104396301113)
,p_db_column_name=>'OLDEST_ITEM_IN_YEAR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Oldest Item This Year'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12788285087301114)
,p_db_column_name=>'OPENING_NET_DEBIT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Opening Net Dr (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12788320069301141)
,p_db_column_name=>'PERIOD_CREDIT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Period Cr (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12788424690301141)
,p_db_column_name=>'PERIOD_DEBIT'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Period Dr (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12788575251301141)
,p_db_column_name=>'STATUS'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12788676916301141)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'ACCOUNT:KIND:OPENING_NET_DEBIT:PERIOD_DEBIT:PERIOD_CREDIT:CLOSING_NET_DEBIT:STATUS:AGEING_DAYS:LAST_POSTING'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12788714655301141)
,p_plug_name=>'Suspense Basis'
,p_static_id=>'suspense-note'
,p_region_css_classes=>'ds-fin-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>67
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-finnote">',
'  <span class="fa fa-info-circle"></span>',
'  <b>Net debit convention.</b> The two balance columns above are shown as a single signed',
'  <em>net debit</em> because a clearing account is read as one running position, not as two sides:',
'  positive is a debit balance, negative a credit balance. <b>Ageing</b> is measured from the oldest',
'  posting inside the current financial year, so an item carried in from a prior year ages from the',
'  year begin, not from the day it was first booked &mdash; the ledger holds no open-item date to age',
'  from. <code>OPENINGDIFFERENCE</code> is the ERP''s own balancing account for the year-opening entry',
'  and is expected to carry a balance; the others are not.',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12788827959301141)
,p_plug_name=>'Accounts That Moved Most'
,p_static_id=>'top-movers'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>56
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Mv As (',
'       Select d.AccountCode Acct,',
'              Sum(Case When nvl(d.Amount,0) < 0 Then -d.Amount Else 0 End) Dr,',
'              Sum(Case When nvl(d.Amount,0) > 0 Then  d.Amount Else 0 End) Cr,',
'              Count(*) Lines, Count(Distinct d.Tno) Vch, Max(d.VoucherDate) LastMove',
'         From VoucherDetail d',
'        Where d.VoucherDate >= to_date(:P704_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P704_TODATE,''DD-MM-RRRR'') + 1',
'          And d.Tno Not In (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING'')',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P704_PANEL    Is Null Or d.Panel        = :P704_PANEL)',
'          And (:P704_COMPANY  Is Null Or d.CompanyCode  = :P704_COMPANY)',
'          And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION)',
'        Group By d.AccountCode)',
'Select * From (',
'  Select ''<a href="'' || apex_page.get_url(p_page => 677, p_clear_cache => ''677'',',
'                  p_items => ''P677_ACCOUNT,P677_FROMDATE,P677_TODATE,P677_COMPANY,P677_LOCATION,P677_PANEL'',',
'                  p_values => m.Acct || '','' || :P704_FROMDATE || '','' || :P704_TODATE || '',''',
'                              || :P704_COMPANY || '','' || :P704_LOCATION || '','' || :P704_PANEL)',
'         || ''">'' || apex_escape.html(nvl(p.PartyName, m.Acct)) || ''</a>'' As ACCOUNT,',
'         m.Acct                            As ACCOUNT_CODE,',
'         apex_escape.html(nvl(g.PartyName,''&mdash;'')) As ACCOUNT_GROUP,',
'         Round(m.Dr,2)                     As PERIOD_DEBIT,',
'         Round(m.Cr,2)                     As PERIOD_CREDIT,',
'         Round(Abs(m.Dr - m.Cr),2)         As NET_MOVEMENT,',
'         Case When m.Dr >= m.Cr',
'              Then ''<span class="ds-finchip ds-finchip--dr">Net debit</span>''',
'              Else ''<span class="ds-finchip ds-finchip--cr">Net credit</span>'' End As DIRECTION,',
'         m.Vch                             As VOUCHERS,',
'         m.Lines                           As LINES,',
'         m.LastMove                        As LAST_POSTING',
'    From Mv m',
'    Left Join Party p On p.PartyCode = m.Acct',
'    Left Join Party g On g.PartyCode = p.ParentCode',
'   Order By m.Dr + m.Cr Desc)',
' Where rownum <= 100'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P704_FROMDATE,P704_TODATE,P704_COMPANY,P704_LOCATION,P704_PANEL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(12788955416301141)
,p_no_data_found_message=>'No account moved in this period for the selected scope.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>43519747756737329
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12789046328301142)
,p_db_column_name=>'ACCOUNT'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Account'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12789133628301142)
,p_db_column_name=>'ACCOUNT_CODE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12789287428301142)
,p_db_column_name=>'ACCOUNT_GROUP'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Group'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12789316266301142)
,p_db_column_name=>'DIRECTION'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Direction'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12789453177301142)
,p_db_column_name=>'LAST_POSTING'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Last Posting'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12789580687301142)
,p_db_column_name=>'LINES'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Lines'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12789624051301142)
,p_db_column_name=>'NET_MOVEMENT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Net Movement (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12789714317301142)
,p_db_column_name=>'PERIOD_CREDIT'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Period Cr (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12789822220301142)
,p_db_column_name=>'PERIOD_DEBIT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Period Dr (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12789949773301142)
,p_db_column_name=>'VOUCHERS'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Vouchers'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12790080623301142)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'ACCOUNT:ACCOUNT_GROUP:PERIOD_DEBIT:PERIOD_CREDIT:NET_MOVEMENT:DIRECTION:VOUCHERS:LAST_POSTING'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12790139509301142)
,p_plug_name=>'Voucher Register'
,p_static_id=>'voucher-register'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>72
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Lines are aggregated to the voucher BEFORE the header is joined, so',
'   a voucher can never be counted once per line. Source-document tables',
'   are deliberately not joined in: ModuleCode/ModuleTno point at',
'   thirty-odd different modules and joining them here would multiply',
'   the grain and wreck the totals. The module and its document number',
'   are carried as traceability text instead. */',
'With L As (',
'       Select d.Tno,',
'              Sum(Case When nvl(d.Amount,0) < 0 Then -d.Amount Else 0 End) Dr,',
'              Sum(Case When nvl(d.Amount,0) > 0 Then  d.Amount Else 0 End) Cr,',
'              Sum(nvl(d.Amount,0)) Net, Count(*) Lines,',
'              Min(d.CompanyCode) Co, Min(d.LocationCode) Loc',
'         From VoucherDetail d',
'        Where d.VoucherDate >= to_date(:P704_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P704_TODATE,''DD-MM-RRRR'') + 1',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P704_PANEL    Is Null Or d.Panel        = :P704_PANEL)',
'          And (:P704_COMPANY  Is Null Or d.CompanyCode  = :P704_COMPANY)',
'          And (:P704_LOCATION Is Null Or d.LocationCode = :P704_LOCATION)',
'        Group By d.Tno)',
'Select ''<a href="'' || apex_page.get_url(p_page => 678, p_clear_cache => ''678'',',
'                p_items => ''P678_TNO'', p_values => to_char(v.Tno))',
'       || ''">'' || apex_escape.html(v.VoucherNo) || ''</a>''  As VOUCHER_NO,',
'       v.Tno                                               As TNO,',
'       v.DocTypeCode                                       As VOUCHER_TYPE,',
'       v.VoucherDate                                       As VOUCHER_DATE,',
'       apex_escape.html(nvl(c.CompanyName, l.Co))          As COMPANY,',
'       apex_escape.html(nvl(lo.LocationName, l.Loc))       As LOCATION,',
'       nvl(v.ModuleCode,''Direct entry'')                    As SOURCE_MODULE,',
'       v.ModuleTno                                         As SOURCE_DOCUMENT_ID,',
'       Round(l.Dr,2)                                       As DEBIT,',
'       Round(l.Cr,2)                                       As CREDIT,',
'       l.Lines                                             As LINES,',
'       Case When Abs(l.Net) < 0.005',
'                 Then ''<span class="ds-finchip ds-finchip--ok">Balanced</span>''',
'            Else      ''<span class="ds-finchip ds-finchip--bad">Out by &#8377;''',
'                      || to_char(Abs(l.Net),''FM999G99G990D00'') || ''</span>'' End As INTEGRITY,',
'       v.Creator                                           As CREATED_BY,',
'       v.CreationTime                                      As CREATED_ON,',
'       Case When v.CreationTime Is Not Null And v.CreationTime - v.VoucherDate > 30',
'                 Then ''<span class="ds-finchip ds-finchip--watch">Backdated</span>''',
'            When v.VoucherDate > trunc(sysdate)',
'                 Then ''<span class="ds-finchip ds-finchip--watch">Future dated</span>''',
'            Else      ''<span class="ds-finchip ds-finchip--flat">In period</span>'' End As TIMING,',
'       substr(v.Narration,1,140)                           As NARRATION',
'  From L l',
'  Join Voucher v On v.Tno = l.Tno',
'  Left Join Company c  On c.CompanyCode  = l.Co',
'  Left Join Location lo On lo.LocationCode = l.Loc',
' Where v.VoucherNo <> ''OPENING''',
' Order By v.VoucherDate Desc, v.Tno Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P704_FROMDATE,P704_TODATE,P704_COMPANY,P704_LOCATION,P704_PANEL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(12790266408301142)
,p_no_data_found_message=>'No voucher touched the ledger in this period for the selected scope.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>43525802522737362
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12790378090301142)
,p_db_column_name=>'COMPANY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12790473257301142)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12790520251301142)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Created On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-RRRR HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12790640576301142)
,p_db_column_name=>'CREDIT'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Credit (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12790731044301142)
,p_db_column_name=>'DEBIT'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Debit (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12790861504301142)
,p_db_column_name=>'INTEGRITY'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Integrity'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12790900186301142)
,p_db_column_name=>'LINES'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Lines'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12791007463301142)
,p_db_column_name=>'LOCATION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12791144543301142)
,p_db_column_name=>'NARRATION'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12791298094301142)
,p_db_column_name=>'SOURCE_DOCUMENT_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Source Doc Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12791392112301142)
,p_db_column_name=>'SOURCE_MODULE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Source Module'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12791449191301142)
,p_db_column_name=>'TIMING'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Timing'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12791529986301142)
,p_db_column_name=>'TNO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12791651924301143)
,p_db_column_name=>'VOUCHER_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Voucher Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12791709860301143)
,p_db_column_name=>'VOUCHER_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Voucher No'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12791895247301143)
,p_db_column_name=>'VOUCHER_TYPE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12791910326301143)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'VOUCHER_DATE:VOUCHER_NO:VOUCHER_TYPE:COMPANY:LOCATION:SOURCE_MODULE:DEBIT:CREDIT:INTEGRITY:TIMING:NARRATION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12793435627301143)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12783327759301109)
,p_button_name=>'APPLY'
,p_static_id=>'apply'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2084305881903810008
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12793510017301143)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12783327759301109)
,p_button_name=>'OPENFILTERS'
,p_static_id=>'open-filters'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Advanced Filters'
,p_button_redirect_url=>'javascript:apex.theme.openRegion(''p675Drawer'');'
,p_button_execute_validations=>'N'
,p_button_css_classes=>'ds-filter-trigger'
,p_icon_css_classes=>'fa-sliders'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12793658189301143)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(12783455935301110)
,p_button_name=>'RESETFILTERS'
,p_static_id=>'reset-filters'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Reset All Filters'
,p_button_redirect_url=>'f?p=&APP_ID.:704:&SESSION.::&DEBUG.:704'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-times'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12792016518301143)
,p_name=>'P704_ACCOUNTGROUP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12783455935301110)
,p_prompt=>'Account Group'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select p.PartyName d, p.PartyCode r',
'  From Party p',
' Where Exists (Select 1 From Party c Where c.ParentCode = p.PartyCode)',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Whole chart of accounts'
,p_colspan=>12
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>'Restrict the trial balance to one group and everything beneath it. Only accounts that actually have children are listed.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12792297597301143)
,p_name=>'P704_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12783327759301109)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select c.CompanyName d, c.CompanyCode r',
'  From Company c',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.CompanyCode = c.CompanyCode',
'                  And ((Select GetUserPanelAB_apex() From dual) Is Null',
'                       Or v.Panel = (Select GetUserPanelAB_apex() From dual)))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All companies'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12792367311301143)
,p_name=>'P704_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12783327759301109)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(FinancialYearBegin,''DD-MM-RRRR'')',
'  From FinancialYear',
' Where trunc(sysdate) Between FinancialYearBegin And FinancialYearEnd',
'   And rownum = 1'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_colspan=>2
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'The first day of the movement window. Everything before it becomes the opening balance.'
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
 p_id=>wwv_flow_imp.id(12792537512301143)
,p_name=>'P704_LEVEL'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12783455935301110)
,p_item_default=>'3'
,p_prompt=>'Hierarchy Depth'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:1 - Nature only;1,2 - Nature and group;2,3 - Down to subgroup;3,4 - Four levels;4,5 - Five levels;5,6 - Six levels;6,7 - Seven levels;7,8 - Every level, ledger accounts included;8'
,p_colspan=>12
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>'How deep the trial balance is drawn. The chart of accounts is eight levels deep; level 8 lists every posting account, which is thousands of rows. Start shallow and click a group to go deeper.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12792724699301143)
,p_name=>'P704_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12783327759301109)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select l.LocationName d, l.LocationCode r',
'  From Location l',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.LocationCode = l.LocationCode',
'                  And (:P704_COMPANY Is Null Or v.CompanyCode = :P704_COMPANY)',
'                  And ((Select GetUserPanelAB_apex() From dual) Is Null',
'                       Or v.Panel = (Select GetUserPanelAB_apex() From dual)))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P704_COMPANY'
,p_ajax_items_to_submit=>'P704_COMPANY'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12792851723301143)
,p_name=>'P704_NOMOVE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12783455935301110)
,p_item_default=>'Y'
,p_prompt=>'Accounts With No Movement'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Include them - a carried balance is still a balance;Y,Only accounts that moved in the period;N'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>'A dormant account still holds money and still belongs in a trial balance, so it is included by default.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12793045020301143)
,p_name=>'P704_PANEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12783327759301109)
,p_prompt=>'Panel'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:A;A,B;B'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'A + B'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'GetUserPanelAB_apex() Is Null'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12793135114301143)
,p_name=>'P704_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12783327759301109)
,p_item_default=>'to_char(trunc(sysdate),''DD-MM-RRRR'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'The last day of the movement window, and the as-on date of the closing balance.'
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
 p_id=>wwv_flow_imp.id(12793345144301143)
,p_name=>'P704_ZERO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12783455935301110)
,p_item_default=>'N'
,p_prompt=>'Zero-Balance Accounts'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Hide accounts that close at zero;N,Show every account;Y'
,p_colspan=>6
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp.component_end;
end;
/
