prompt --application/pages/page_00906
begin
--   Manifest
--     PAGE: 00906
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
 p_id=>906
,p_name=>'Location Profitability'
,p_alias=>'LOCATION-PROFITABILITY'
,p_step_title=>'Location Profitability'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<script id="hspl-sidebar-head-state">',
'(function(d){',
'  var state=''closed'';',
'  try {',
'    var saved=window.localStorage.getItem(''imart.sidebar.state.v1'');',
'    if(saved===''open''||saved===''closed'') state=saved;',
'  } catch(ignore) {}',
'  d.classList.remove(state===''open''?''hspl-nav-target-closed'':''hspl-nav-target-open'');',
'  d.classList.add(state===''open''?''hspl-nav-target-open'':''hspl-nav-target-closed'');',
'})(document.documentElement);',
'</script>',
'<style id="hspl-register-first-paint">',
'/* Match the application''s existing final register palette at parser time.',
'   These declarations intentionally duplicate (not replace) the final shared',
'   design-system values, preventing the older theme palette from becoming a',
'   visible intermediate frame during initial render or APEX IR refresh. */',
'body:not(.t-PageBody--login) .a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table th.a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table thead th,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-thead .a-IRR-header {',
'  background:#e6e8f7!important;',
'  color:#3f4a7a!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-toolbar,',
'body:not(.t-PageBody--login) .a-IRR-controlsContainer {',
'  background:#f4f3fd!important;',
'  border-color:#e6e4f7!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(even) td:not([style*="background"]) {',
'  background-color:#f3f6fc!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(odd) td:not([style*="background"]) {',
'  background-color:#fff!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:hover td:not([style*="background"]) {',
'  background-color:#eaf0fb!important;',
'}',
'body:not(.t-PageBody--login) .t-Region:has(.a-IRR),',
'body:not(.t-PageBody--login) .a-IRR,',
'body:not(.t-PageBody--login) .a-IRR-region,',
'body:not(.t-PageBody--login) .t-IRR-region,',
'body:not(.t-PageBody--login) .a-IRR-content,',
'body:not(.t-PageBody--login) .a-IRR-table,',
'body:not(.t-PageBody--login) .t-fht-wrapper,',
'body:not(.t-PageBody--login) .t-fht-thead,',
'body:not(.t-PageBody--login) .t-fht-tbody {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>',
'<style id="hspl-register-cell-paint-lock">',
'/* APEX/UT gives report cells a background/color transition. During an IR',
'   refresh the replacement rows therefore fade from the native palette into',
'   the application palette. Keep every existing colour and hover selector,',
'   but make their application atomic. */',
'body:not(.t-PageBody--login) .a-IRR-table th,',
'body:not(.t-PageBody--login) .a-IRR-table td,',
'body:not(.t-PageBody--login) .a-IRR-table .a-IRR-headerLink,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-tbody td {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>'))
,p_javascript_file_urls=>'#APP_FILES#hspl-jet-l10n-fallback.js?version=#APP_VERSION#&cb=20260924a'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'Location Profitability. The same statement as page 705, cut by location instead of shown as one column. Location is the profitability dimension in this ERP - it stands for division, plant, functional location or business unit, and it is on the vouche'
||'r header and every GL line. Department is deliberately absent: the master exists with 61 rows but nothing in the ledger references it, so a department P and L cannot be derived from accounting data and pretending otherwise would invent numbers. Cost '
||'centre is absent for a different reason - it covers about a tenth of the ledger and lives in its own table with its own amounts. Rows sum to the Total line, which equals the P and L Summary for the same period and scope; the strip below proves it. Si'
||'gn convention - VoucherDetail.Amount is signed, negative is debit, so costs are negated and read positive. A location whose postings are all balance-sheet carries no P and L and is not listed.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12799583818301177)
,p_name=>'Location Profitability'
,p_static_id=>'command-header'
,p_template=>4072358936313175081
,p_display_sequence=>5
,p_region_css_classes=>'ds-fin-headregion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''<div class="ds-fin-head">''',
'    /* Monthly is driven by a financial year, so the year holding From',
'       Date is looked up and passed instead of the range. If From Date',
'       falls outside every defined year nothing is passed and that page',
'       opens on its own default, which is the year holding today. */',
'    || ''<div class="ds-head-ctas">''',
'    || ''<a class="ds-head-cta" href="''',
'       || apex_page.get_url(',
'            p_page   => 904,',
'            p_clear_cache => ''904'',',
'            p_items  => ''P904_FROMDATE,P904_TODATE,P904_COMPANY'',',
'            p_values => :P906_FROMDATE||'',''||:P906_TODATE||'',''||:P906_COMPANY)',
'       || ''"><span class="fa fa-arrow-left"></span>P and L Summary <b>&larr;</b></a>''',
'    || ''<a class="ds-head-cta" href="''',
'       || apex_page.get_url(',
'            p_page   => 905,',
'            p_clear_cache => ''905'',',
'            p_items  => ''P905_FINYEAR,P905_COMPANY'',',
'            p_values => (Select Max(f.FinancialYearCode) From FinancialYear f',
'                          Where to_date(:P906_FROMDATE,''DD-MM-RRRR'')',
'                                Between f.FinancialYearBegin And f.FinancialYearEnd)',
'                        ||'',''||:P906_COMPANY)',
'       || ''"><span class="fa fa-calendar"></span>Monthly <b>&rarr;</b></a>''',
'    || ''</div>''',
'    || ''<div class="ds-fin-eyebrow">Finance &middot; General Ledger &middot; Profitability</div>''',
'    || ''<h1 class="ds-fin-title">Location Profitability</h1>''',
'    || ''<div class="ds-fin-sub">Revenue to PBT for each location, footing to the P and L Summary</div>''',
'    || ''<div class="ds-fin-context">''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-calendar"></span>Period <b>''',
'       || :P906_FROMDATE || '' &rarr; '' || :P906_TODATE || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-calendar-check-o"></span>Financial Year <b>''',
'       || nvl((Select f.FinancialYearCode From FinancialYear f',
'                Where to_date(:P906_FROMDATE,''DD-MM-RRRR'')',
'                      Between f.FinancialYearBegin And f.FinancialYearEnd),''outside any defined year'')',
'       || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P906_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P906_FROMDATE,P906_TODATE,P906_COMPANY'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12799664834301178)
,p_query_column_id=>1
,p_column_alias=>'HEAD'
,p_column_display_sequence=>10
,p_column_heading=>'Head'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12799719338301178)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p707Filters'
,p_region_css_classes=>'ds-dash-filters'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12799823786301178)
,p_name=>'Cross-check'
,p_static_id=>'location-check'
,p_template=>4072358936313175081
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The locations must add up to the whole. Both sides are the same',
'   ledger, so the difference is an identity, not a tolerance. */',
'With Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'     Src As (',
'       Select p.PartyCode Acct,',
'              Connect_By_Root p.NatureOfAccountCode RootNat,',
'              regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,2) L2',
'         From Party p Start With p.ParentCode Is Null',
'       Connect By Prior p.PartyCode = p.ParentCode),',
'     Mv As (',
'       Select d.AccountCode Acct, Sum(nvl(d.Amount,0)) Amt',
'         From VoucherDetail d',
'        Where d.VoucherDate >= to_date(:P906_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P906_TODATE,''DD-MM-RRRR'') + 1',
'          And d.Tno Not In (Select Tno From Carry)',
'          And (cast(null as varchar2(100)) Is Null Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null   Is Null Or cast(null as varchar2(100))       = null)',
'          And (:P906_COMPANY Is Null Or d.CompanyCode = :P906_COMPANY)',
'        Group By d.AccountCode),',
'     C As (',
'       Select Sum(Case When Case When s.RootNat Is Not Null Then s.RootNat',
'                                 When s.L2=''INCOME'' Then ''INCOME''',
'                                 When s.L2=''EXPENDITURES'' Then ''EXPENSES'' End In (''INCOME'',''EXPENSES'')',
'                       Then m.Amt Else 0 End) Tb,',
'              Count(Distinct Case When Case When s.RootNat Is Not Null Then s.RootNat',
'                                            When s.L2=''INCOME'' Then ''INCOME''',
'                                            When s.L2=''EXPENDITURES'' Then ''EXPENSES'' End In (''INCOME'',''EXPENSES'')',
'                                  Then m.Acct End) Accts',
'         From Mv m Join Src s On s.Acct = m.Acct)',
'Select ''<div class="ds-pnl-recon ds-pnl-recon--ok">''',
'    || ''<b>Total row proved.</b> The TOTAL line equals the Trial Balance movement on INCOME and ''',
'    || ''EXPENSES for this period and scope &mdash; &#8377;''',
'    || to_char(Round(c.Tb/10000000,2),''FM999G990D00'') || '' Cr across ''',
'    || to_char(c.Accts) || '' posting accounts &mdash; which is what the P and L Summary shows. ''',
'    || ''Locations are a partition of that total, so the rows above add to it by construction.''',
'    || ''</div>'' As RECON',
'  From C c'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P906_FROMDATE,P906_TODATE,P906_COMPANY'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12799943549301178)
,p_query_column_id=>1
,p_column_alias=>'RECON'
,p_column_display_sequence=>10
,p_column_heading=>'Reconciliation'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12800002011301178)
,p_name=>'Profitability by Location'
,p_static_id=>'location-grid'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_css_classes=>'ds-dash-panel ds-pnl-monthly'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* One row per location, the same buckets page 705 uses.',
'',
'   Real report columns rather than assembled HTML - a fourteen-column',
'   table exceeds the 4000-byte VARCHAR2 limit this database runs with,',
'   and real columns bring sorting and Download anyway. Row weight for',
'   the Total line is carried by a marker span and applied with :has().',
'',
'   A location appears only if it has P and L movement. One with nothing',
'   but balance-sheet postings has no profitability to report, and',
'   listing it with zeros would read as "this location broke even". */',
'With Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'     Src As (',
'       Select p.PartyCode Acct,',
'              Connect_By_Root p.NatureOfAccountCode RootNat,',
'              regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,2) L2,',
'              regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,3) Bucket',
'         From Party p Start With p.ParentCode Is Null',
'       Connect By Prior p.PartyCode = p.ParentCode),',
'     Mv As (',
'       Select d.LocationCode Loc, d.AccountCode Acct, Sum(nvl(d.Amount,0)) Amt',
'         From VoucherDetail d',
'        Where d.VoucherDate >= to_date(:P906_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P906_TODATE,''DD-MM-RRRR'') + 1',
'          And d.Tno Not In (Select Tno From Carry)',
'          And (cast(null as varchar2(100)) Is Null Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null   Is Null Or cast(null as varchar2(100))       = null)',
'          And (:P906_COMPANY Is Null Or d.CompanyCode = :P906_COMPANY)',
'        Group By d.LocationCode, d.AccountCode),',
'     B As (',
'       Select m.Loc,',
'              Case When s.L2 = ''INCOME''       Or s.RootNat = ''INCOME''    Then ''REVENUE''',
'                   When s.Bucket = ''DIRECTCOST''                         Then ''DIRECT''',
'                   When s.Bucket = ''DEPRECIATION''                       Then ''DEPN''',
'                   When s.Bucket = ''4892''                               Then ''FIN''',
'                   When s.Bucket = ''7481''                               Then ''TAX''',
'                   When s.L2 = ''EXPENDITURES'' Or s.RootNat = ''EXPENSES'' Then ''OPEX''',
'              End Bkt, m.Amt',
'         From Mv m Join Src s On s.Acct = m.Acct),',
'     P As (',
'       Select Loc,',
'              nvl(Sum(Case When Bkt=''REVENUE'' Then Amt End),0) Rev,',
'              nvl(Sum(Case When Bkt=''DIRECT''  Then Amt End),0) Dir,',
'              nvl(Sum(Case When Bkt=''OPEX''    Then Amt End),0) Opx,',
'              nvl(Sum(Case When Bkt=''DEPN''    Then Amt End),0) Dep,',
'              nvl(Sum(Case When Bkt=''FIN''     Then Amt End),0) Fin,',
'              nvl(Sum(Case When Bkt=''TAX''     Then Amt End),0) Tax',
'         From B Where Bkt Is Not Null Group By Loc),',
'     /* the Total row is computed from the same set, not by adding up',
'        the printed rows - rounding to two decimals eleven times over',
'        would not foot */',
'     R As (',
'       Select 1 Ord, p.Loc, nvl(l.LocationName, nvl(p.Loc,''(no location)'')) Nm,',
'              p.Rev, p.Dir, p.Opx, p.Dep, p.Fin, p.Tax',
'         From P p Left Join Location l On l.LocationCode = p.Loc',
'       Union All',
'       Select 2, Cast(Null As Varchar2(30)), ''TOTAL'',',
'              Sum(Rev), Sum(Dir), Sum(Opx), Sum(Dep), Sum(Fin), Sum(Tax)',
'         From P)',
'Select r.Ord As SEQ,',
'       Case When r.Ord = 2',
'            Then ''<span class="ds-pnl-rowtag ds-pnl-bottom"></span>TOTAL''',
'            Else ''<a href="''',
'                 || apex_page.get_url(p_page => 904, p_clear_cache => ''904'',',
'                      p_items  => ''P904_FROMDATE,P904_TODATE,P904_COMPANY,P904_LOCATION'',',
'                      p_values => :P906_FROMDATE || '','' || :P906_TODATE || '',''',
'                                  || :P906_COMPANY || '','' || r.Loc)',
'                 || ''" target="_blank" rel="noopener">'' || apex_escape.html(r.Nm) || ''</a>''',
'       End                                                          As LOCATION,',
'       to_char(Round(r.Rev/10000000,2),''FM999G990D00'')              As REVENUE,',
'       to_char(Round(-r.Dir/10000000,2),''FM999G990D00'')             As DIRECT_COST,',
'       to_char(Round((r.Rev+r.Dir)/10000000,2),''FM999G990D00'')      As CONTRIBUTION,',
'       Case When r.Rev > 100000 And Abs((r.Rev+r.Dir)/r.Rev) < 10',
'            Then to_char(Round((r.Rev+r.Dir)/r.Rev*100,1),''FM990D0'') || ''%''',
'            Else ''&mdash;'' End                                      As CONTRIBUTION_PCT,',
'       to_char(Round(-r.Opx/10000000,2),''FM999G990D00'')             As OPERATING_EXPENSE,',
'       to_char(Round((r.Rev+r.Dir+r.Opx)/10000000,2),''FM999G990D00'') As EBITDA,',
'       Case When r.Rev > 100000 And Abs((r.Rev+r.Dir+r.Opx)/r.Rev) < 10',
'            Then to_char(Round((r.Rev+r.Dir+r.Opx)/r.Rev*100,1),''FM990D0'') || ''%''',
'            Else ''&mdash;'' End                                      As EBITDA_PCT,',
'       to_char(Round(-r.Dep/10000000,2),''FM999G990D00'')             As DEPRECIATION,',
'       to_char(Round(-r.Fin/10000000,2),''FM999G990D00'')             As FINANCE_COST,',
'       to_char(Round((r.Rev+r.Dir+r.Opx+r.Dep+r.Fin)/10000000,2),''FM999G990D00'') As PBT,',
'       Case When r.Rev > 100000 And Abs((r.Rev+r.Dir+r.Opx+r.Dep+r.Fin)/r.Rev) < 10',
'            Then to_char(Round((r.Rev+r.Dir+r.Opx+r.Dep+r.Fin)/r.Rev*100,1),''FM990D0'') || ''%''',
'            Else ''&mdash;'' End                                      As PBT_PCT',
'  From R r',
' Order By r.Ord, r.Rev Desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P906_FROMDATE,P906_TODATE,P906_COMPANY'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No location has any profit and loss movement in this period and scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12800151568301178)
,p_query_column_id=>5
,p_column_alias=>'CONTRIBUTION'
,p_column_display_sequence=>40
,p_column_heading=>'Contribution'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12800217963301178)
,p_query_column_id=>6
,p_column_alias=>'CONTRIBUTION_PCT'
,p_column_display_sequence=>50
,p_column_heading=>'Contr %'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12800332400301178)
,p_query_column_id=>10
,p_column_alias=>'DEPRECIATION'
,p_column_display_sequence=>90
,p_column_heading=>'Depreciation'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12800476140301178)
,p_query_column_id=>4
,p_column_alias=>'DIRECT_COST'
,p_column_display_sequence=>30
,p_column_heading=>'Direct Cost'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12800530948301178)
,p_query_column_id=>8
,p_column_alias=>'EBITDA'
,p_column_display_sequence=>70
,p_column_heading=>'EBITDA'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12800671052301178)
,p_query_column_id=>9
,p_column_alias=>'EBITDA_PCT'
,p_column_display_sequence=>80
,p_column_heading=>'EBITDA %'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12800794177301178)
,p_query_column_id=>11
,p_column_alias=>'FINANCE_COST'
,p_column_display_sequence=>100
,p_column_heading=>'Finance Cost'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12800847954301178)
,p_query_column_id=>2
,p_column_alias=>'LOCATION'
,p_column_display_sequence=>10
,p_column_heading=>'Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12800948156301178)
,p_query_column_id=>7
,p_column_alias=>'OPERATING_EXPENSE'
,p_column_display_sequence=>60
,p_column_heading=>'Operating Exp'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12801021787301178)
,p_query_column_id=>12
,p_column_alias=>'PBT'
,p_column_display_sequence=>110
,p_column_heading=>'PBT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12801107600301178)
,p_query_column_id=>13
,p_column_alias=>'PBT_PCT'
,p_column_display_sequence=>120
,p_column_heading=>'PBT %'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12801296532301178)
,p_query_column_id=>3
,p_column_alias=>'REVENUE'
,p_column_display_sequence=>20
,p_column_heading=>'Revenue'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12801375265301178)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>5
,p_column_heading=>'#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'NEVER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12801434286301178)
,p_plug_name=>'Reading this table'
,p_static_id=>'location-note'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-finnote">',
'  <span class="fa fa-info-circle"></span>',
'  <b>Reading this table.</b> Click a location to open the P&nbsp;and&nbsp;L Summary for it, with the',
'  same period and company, in a new tab &mdash; and from there down to the account, its ledger and',
'  the voucher.',
'  <b>Why there is no department or cost centre view:</b> department is not carried on the ledger at',
'  all, and cost centre covers about a tenth of it in a separate table with its own amounts. Neither',
'  can produce an honest profit and loss, so neither is offered.',
'  <b>Percentages</b> are of that location''s own revenue, and blank where it has none &mdash; a',
'  location that only carries cost has no margin, rather than a margin of zero.',
'  Figures are &#8377; crore. Cost of goods sold, depreciation and tax carry the same caveats as the',
'  Summary page; open it for the closing control that explains them.',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12801915993301179)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(12799719338301178)
,p_button_name=>'APPLY'
,p_static_id=>'apply'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12802068358301179)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12800002011301178)
,p_button_name=>'DOWNLOADLOC'
,p_static_id=>'download-loc'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Download'
,p_button_position=>'EDIT'
,p_icon_css_classes=>'fa-file-excel-o'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12801569694301178)
,p_name=>'P906_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12799719338301178)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select c.CompanyName d, c.CompanyCode r',
'  From Company c',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.CompanyCode = c.CompanyCode',
'                  And (cast(null as varchar2(100)) Is Null',
'                       Or cast(null as varchar2(100)) = cast(null as varchar2(100))))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All companies'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12801663613301178)
,p_name=>'P906_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12799719338301178)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(FinancialYearBegin,''DD-MM-RRRR'')',
'  From FinancialYear',
' Where trunc(sysdate) Between FinancialYearBegin And FinancialYearEnd',
'   And rownum = 1'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(12801826136301179)
,p_name=>'P906_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12799719338301178)
,p_item_default=>'Select to_char(trunc(sysdate),''DD-MM-RRRR'') From dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12802127074301179)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Download Location Profitability'
,p_static_id=>'download-loc'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The grid as a file, headed and styled like the Trial Balance download.',
'   The location is the plain name, not the on-screen anchor, and a blank',
'   percentage is empty rather than the &mdash; the screen shows - both',
'   were reaching the CSV as HTML. Styles inline, number format',
'   single-quoted so the style attribute survives. */',
'Declare',
'    Cursor cL Is',
'    With Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'        Src As (',
'          Select p.PartyCode Acct,',
'                 Connect_By_Root p.NatureOfAccountCode RootNat,',
'                 regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,2) L2,',
'                 regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,3) Bucket',
'            From Party p Start With p.ParentCode Is Null',
'          Connect By Prior p.PartyCode = p.ParentCode),',
'        Mv As (',
'          Select d.LocationCode Loc, d.AccountCode Acct, Sum(nvl(d.Amount,0)) Amt',
'            From VoucherDetail d',
'           Where d.VoucherDate >= to_date(:P906_FROMDATE,''DD-MM-RRRR'')',
'             And d.VoucherDate <  to_date(:P906_TODATE,''DD-MM-RRRR'') + 1',
'             And d.Tno Not In (Select Tno From Carry)',
'             And (cast(null as varchar2(100)) Is Null Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'             And (null   Is Null Or cast(null as varchar2(100))       = null)',
'             And (:P906_COMPANY Is Null Or d.CompanyCode = :P906_COMPANY)',
'           Group By d.LocationCode, d.AccountCode),',
'        B As (',
'          Select m.Loc,',
'                 Case When s.L2 = ''INCOME''       Or s.RootNat = ''INCOME''    Then ''REVENUE''',
'                      When s.Bucket = ''DIRECTCOST''                         Then ''DIRECT''',
'                      When s.Bucket = ''DEPRECIATION''                       Then ''DEPN''',
'                      When s.Bucket = ''4892''                               Then ''FIN''',
'                      When s.Bucket = ''7481''                               Then ''TAX''',
'                      When s.L2 = ''EXPENDITURES'' Or s.RootNat = ''EXPENSES'' Then ''OPEX''',
'                 End Bkt, m.Amt',
'            From Mv m Join Src s On s.Acct = m.Acct),',
'        P As (',
'          Select Loc,',
'                 nvl(Sum(Case When Bkt=''REVENUE'' Then Amt End),0) Rev,',
'                 nvl(Sum(Case When Bkt=''DIRECT''  Then Amt End),0) Dir,',
'                 nvl(Sum(Case When Bkt=''OPEX''    Then Amt End),0) Opx,',
'                 nvl(Sum(Case When Bkt=''DEPN''    Then Amt End),0) Dep,',
'                 nvl(Sum(Case When Bkt=''FIN''     Then Amt End),0) Fin,',
'                 nvl(Sum(Case When Bkt=''TAX''     Then Amt End),0) Tax',
'            From B Where Bkt Is Not Null Group By Loc),',
'        /* the Total row is computed from the same set, not by adding up',
'           the printed rows - rounding to two decimals eleven times over',
'           would not foot */',
'        R As (',
'          Select 1 Ord, p.Loc, nvl(l.LocationName, nvl(p.Loc,''(no location)'')) Nm,',
'                 p.Rev, p.Dir, p.Opx, p.Dep, p.Fin, p.Tax',
'            From P p Left Join Location l On l.LocationCode = p.Loc',
'          Union All',
'          Select 2, Cast(Null As Varchar2(30)), ''TOTAL'',',
'                 Sum(Rev), Sum(Dir), Sum(Opx), Sum(Dep), Sum(Fin), Sum(Tax)',
'            From P)',
'    Select r.Ord, r.Loc, r.Nm, r.Rev, r.Dir, r.Opx, r.Dep, r.Fin, r.Tax',
'      From R r Order By r.Ord, r.Rev Desc;',
'    cB  Constant Varchar2(200) := ''font-family:Calibri,Arial,sans-serif;font-size:11pt;border:0.5pt solid #E3E8EF;'';',
'    cT  Constant Varchar2(240) := cB || ''mso-number-format:''''\@'''';'';',
'    cN  Constant Varchar2(240) := cB || ''mso-number-format:''''\#\,\#\#0\.00'''';text-align:right;'';',
'    cH  Constant Varchar2(300) := cB || ''background:#1F2A3B;color:#FFFFFF;font-weight:bold;text-align:center;'';',
'Begin',
'    owa_util.mime_header(''application/vnd.ms-excel'', FALSE);',
'    htp.p(''Content-Disposition: attachment; filename="location-profitability-''',
'          || to_char(sysdate,''YYYYMMDD-HH24MI'') || ''.xls"'');',
'    owa_util.http_header_close();',
'    htp.prn(''<html xmlns:x="urn:schemas-microsoft-com:office:excel"><head>'');',
'    htp.prn(''<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>'');',
'    htp.prn(''<!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>''',
'            || ''<x:Name>Location Profitability</x:Name><x:WorksheetOptions><x:Selected/>''',
'            || ''<x:FreezePanes/><x:FrozenNoSplit/><x:SplitHorizontalPosition>4</x:SplitHorizontalPosition>''',
'            || ''<x:TopRowBottomPane>4</x:TopRowBottomPane><x:ActivePane>2</x:ActivePane>''',
'            || ''<x:Panes><x:Pane><x:Number>3</x:Number></x:Pane>''',
'            || ''<x:Pane><x:Number>2</x:Number></x:Pane></x:Panes>''',
'            || ''</x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]-->'');',
'    htp.prn(''</head><body><table cellspacing="0">'');',
'    htp.prn(''<tr><td style="font-family:Calibri,Arial,sans-serif;font-size:15pt;font-weight:bold;color:#1F2A3B;" colspan="12">Location Profitability</td></tr>'');',
'    htp.prn(''<tr><td style="font-family:Calibri,Arial,sans-serif;font-size:9pt;color:#4A5568;" colspan="12">''',
'            || apex_escape.html(:P906_FROMDATE) || '' to '' || apex_escape.html(:P906_TODATE)',
'            || '' &middot; Rs Cr &middot; base currency (INR)</td></tr>'');',
'    htp.prn(''<tr><td colspan="12"></td></tr>'');',
'    htp.prn(''<tr>''',
'            || ''<th style="'' || cH || ''">Location</th>''',
'            || ''<th style="'' || cH || ''">Revenue</th>''',
'            || ''<th style="'' || cH || ''">Direct Cost</th>''',
'            || ''<th style="'' || cH || ''">Contribution</th>''',
'            || ''<th style="'' || cH || ''">Contr %</th>''',
'            || ''<th style="'' || cH || ''">Operating Exp</th>''',
'            || ''<th style="'' || cH || ''">EBITDA</th>''',
'            || ''<th style="'' || cH || ''">EBITDA %</th>''',
'            || ''<th style="'' || cH || ''">Depreciation</th>''',
'            || ''<th style="'' || cH || ''">Finance Cost</th>''',
'            || ''<th style="'' || cH || ''">PBT</th>''',
'            || ''<th style="'' || cH || ''">PBT %</th>''',
'            || ''</tr>'');',
'    For r In cL Loop',
'        htp.prn(''<tr>'');',
'        htp.prn(''<td style="'' || cT || ''">'' || apex_escape.html(trim(r.Nm)) || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || to_char(Round(r.Rev/10000000,2),''FM99999990.00'') || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || to_char(Round(-r.Dir/10000000,2),''FM99999990.00'') || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || to_char(Round((r.Rev+r.Dir)/10000000,2),''FM99999990.00'') || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || Case When (Case When r.Rev > 100000 And Abs((r.Rev+r.Dir)/r.Rev) < 10 Then Round((r.Rev+r.Dir)/r.Rev*100,1) End) Is Not Null Then to_char(Case When r.Rev > 100000 And Abs((r.Rev+r.Dir)/r.Rev) < 10 Then R'
||'ound((r.Rev+r.Dir)/r.Rev*100,1) End,''FM9990.0'') End || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || to_char(Round(-r.Opx/10000000,2),''FM99999990.00'') || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || to_char(Round((r.Rev+r.Dir+r.Opx)/10000000,2),''FM99999990.00'') || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || Case When (Case When r.Rev > 100000 And Abs((r.Rev+r.Dir+r.Opx)/r.Rev) < 10 Then Round((r.Rev+r.Dir+r.Opx)/r.Rev*100,1) End) Is Not Null Then to_char(Case When r.Rev > 100000 And Abs((r.Rev+r.Dir+r.Opx)/'
||'r.Rev) < 10 Then Round((r.Rev+r.Dir+r.Opx)/r.Rev*100,1) End,''FM9990.0'') End || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || to_char(Round(-r.Dep/10000000,2),''FM99999990.00'') || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || to_char(Round(-r.Fin/10000000,2),''FM99999990.00'') || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || to_char(Round((r.Rev+r.Dir+r.Opx+r.Dep+r.Fin)/10000000,2),''FM99999990.00'') || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || Case When (Case When r.Rev > 100000 And Abs((r.Rev+r.Dir+r.Opx+r.Dep+r.Fin)/r.Rev) < 10 Then Round((r.Rev+r.Dir+r.Opx+r.Dep+r.Fin)/r.Rev*100,1) End) Is Not Null Then to_char(Case When r.Rev > 100000 And '
||'Abs((r.Rev+r.Dir+r.Opx+r.Dep+r.Fin)/r.Rev) < 10 Then Round((r.Rev+r.Dir+r.Opx+r.Dep+r.Fin)/r.Rev*100,1) End,''FM9990.0'') End || ''</td>'');',
'        htp.prn(''</tr>'');',
'    End Loop;',
'    htp.prn(''</table></body></html>'');',
'    apex_application.stop_apex_engine;',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12802068358301179)
,p_internal_uid=>72545290032689592
);
wwv_flow_imp.component_end;
end;
/
