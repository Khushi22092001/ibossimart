prompt --application/pages/page_00904
begin
--   Manifest
--     PAGE: 00904
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
 p_id=>904
,p_name=>'Profit and Loss Summary'
,p_alias=>'PROFIT-AND-LOSS-SUMMARY'
,p_step_title=>'Profit and Loss Summary'
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
,p_help_text=>'Profit and Loss Summary. Derived from the same ledger as the Trial Balance on page 675 and proved against it on every load - iBoss stores no P and L, it computes one at runtime, and so does this. Each subtotal is one clean subtree of the chart: Direc'
||'t Cost is DIRECT EXPENSES, Operating Expense is everything else under EXPENSES bar Depreciation, Finance Cost and Tax, and those three are their own groups directly under EXPENSES. Sign convention - VoucherDetail.Amount is signed, negative is debit a'
||'nd positive is credit, so a cost is the negated sum and reads positive here. OPENING carry-forward vouchers are excluded from period movement. Three figures can legitimately read nil and the Closing Control band above the statement says which and why'
||' - cost of goods sold until periodic closing posts the consumption voucher, depreciation until it is charged, and tax until ledgers exist under INCOME TAX EXPENSES AND PROVISIONS.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12793871068301143)
,p_name=>'Closing Control'
,p_static_id=>'closing-control'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The most important region on the page.',
'',
'   Three figures in the statement below can legitimately read nil, and',
'   each for a different reason. A reader who does not know which will',
'   take the result at face value - and this period the posted result is',
'   a 92% margin, because purchases sit in GR/IR on the balance sheet and',
'   cost of goods sold only reaches the P and L when periodic closing',
'   posts Consumption Dr / Inventory Cr.',
'',
'   So the page states the closing position in words, above the numbers,',
'   before anyone reads them. It compares what was bought against what',
'   was consumed rather than asserting a rule, so it stays true whatever',
'   the accounting team does next. */',
'With Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'     Mv As (',
'       Select d.AccountCode Acct, Sum(nvl(d.Amount,0)) Amt,',
'              Sum(Case When nvl(d.Amount,0) < 0 Then -d.Amount Else 0 End) Dr',
'         From VoucherDetail d',
'        Where d.VoucherDate >= to_date(:P904_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P904_TODATE,''DD-MM-RRRR'') + 1',
'          And d.Tno Not In (Select Tno From Carry)',
'          And (cast(null as varchar2(100)) Is Null Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P904_COMPANY  Is Null Or d.CompanyCode  = :P904_COMPANY)',
'          And (:P904_LOCATION Is Null Or d.LocationCode = :P904_LOCATION)',
'        Group By d.AccountCode),',
'     Sub As (',
'       Select ''CONSUME'' K, m.Amt A From Mv m',
'        Where m.Acct In (Select PartyCode From Party',
'                          Start With PartyCode = ''CONSUMPTIONRAWMATERIAL''',
'                        Connect By Prior PartyCode = ParentCode)',
'       Union All',
'       Select ''DEPN'', m.Amt From Mv m',
'        Where m.Acct In (Select PartyCode From Party',
'                          Start With PartyCode = ''DEPRECIATION''',
'                        Connect By Prior PartyCode = ParentCode)',
'       Union All',
'       Select ''TAX'', m.Amt From Mv m',
'        Where m.Acct In (Select PartyCode From Party',
'                          Start With PartyCode = ''7481''',
'                        Connect By Prior PartyCode = ParentCode)',
'       Union All',
'       /* The DEBIT side of GR/IR, not its net movement. GR/IR is a',
'          clearing account - goods received debit it, invoice booking',
'          credits it - so the net nets out to a small residue (6.53 Cr',
'          this period) while the goods that actually arrived and must',
'          eventually become cost are the gross debit (310.80 Cr).',
'          Quoting the net understated the gap by fifty times. */',
'       Select ''PURCH'', m.Dr From Mv m',
'        Where upper((Select p.PartyName From Party p Where p.PartyCode = m.Acct)) Like ''GR/IR%''),',
'     S As (',
'       Select nvl(Sum(Case When K=''CONSUME'' Then A End),0) Consume,',
'              nvl(Sum(Case When K=''DEPN''    Then A End),0) Depn,',
'              nvl(Sum(Case When K=''TAX''     Then A End),0) Tax,',
'              nvl(Sum(Case When K=''PURCH''   Then A End),0) Purch',
'         From Sub),',
'     X As (',
'       Select s.*,',
'              (Select Count(*) From Party c Where c.ParentCode = ''7481'') TaxLedgers,',
'              (Select Count(*) From Party p Where p.PartyCode = ''7481'')  TaxGroup',
'         From S s)',
'/* Materiality, not an epsilon.',
'',
'   A first version tested Abs(consume) > 0.005 - five paise - and the',
'   ledger duly reported "cost of goods sold is charged" on a few',
'   thousand rupees of consumption against three hundred and ten CRORE',
'   of purchases, while depreciation of one hundred and twenty two',
'   rupees read as "charged". Both were true and both were useless: the',
'   band exists to stop a reader trusting an incomplete result, and it',
'   was doing the opposite.',
'',
'   So consumption is judged against what was actually bought, and',
'   depreciation against a lakh - and both print the real figure, so a',
'   small charge is visible rather than rounded into a claim. */',
'Select ''<div class="ds-pnl-control''',
'    || Case When Abs(x.Consume) >= Abs(x.Purch) * 0.05 And x.TaxLedgers > 0 Then '' ds-ok'' End || ''">''',
'    || ''<div class="ds-pnl-control-h">Closing control &mdash; read this before the numbers</div>''',
'    || ''<div class="ds-pnl-control-b">''',
'    || Case',
'         When Abs(x.Purch) > 10000000 And Abs(x.Consume) < Abs(x.Purch) * 0.05',
'         Then ''Periodic closing has <b>not</b> been posted for this period. Purchases of <b>&#8377;''',
'              || to_char(Round(Abs(x.Purch)/10000000,2),''FM999G990D00'')',
'              || '' Cr</b> are sitting in the GR/IR clearing account on the balance sheet against consumption of only <b>&#8377;''',
'              || to_char(Round(Abs(x.Consume)/100000,2),''FM999G990D00'')',
'              || '' Lac</b>, so <b>the result below excludes cost of goods sold</b> and the margin it shows is not the real margin. ''',
'              || ''It corrects itself when the closing voucher posts Consumption Dr / Inventory Cr.''',
'         When Abs(x.Purch) <= 10000000',
'         Then ''No material purchases in this period, so there is nothing awaiting closing. ''',
'              || ''The result below is complete on that count.''',
'         Else ''Consumption of <b>&#8377;'' || to_char(Round(Abs(x.Consume)/10000000,2),''FM999G990D00'')',
'              || '' Cr</b> has been charged against purchases of <b>&#8377;''',
'              || to_char(Round(Abs(x.Purch)/10000000,2),''FM999G990D00'')',
'              || '' Cr</b>, so cost of goods sold is included below.''',
'       End',
'    || ''</div><div>''',
'    || Case When Abs(x.Purch) > 10000000 And Abs(x.Consume) < Abs(x.Purch) * 0.05',
'            Then ''<span class="ds-pnl-flag">Cost of goods sold &mdash; not yet charged (&#8377;''',
'                 || to_char(Round(Abs(x.Consume)/100000,2),''FM999G990D00'') || '' Lac against &#8377;''',
'                 || to_char(Round(Abs(x.Purch)/10000000,2),''FM999G990D00'') || '' Cr bought)</span>''',
'            Else ''<span class="ds-pnl-flag ds-pnl-flag--ok">Cost of goods sold &mdash; charged</span>'' End',
'    || Case When Abs(x.Depn) < 100000',
'            Then ''<span class="ds-pnl-flag">Depreciation &mdash; not charged this period (&#8377;''',
'                 || to_char(Round(Abs(x.Depn),0),''FM999G999G990'') || '' only)</span>''',
'            Else ''<span class="ds-pnl-flag ds-pnl-flag--ok">Depreciation &mdash; &#8377;''',
'                 || to_char(Round(Abs(x.Depn)/100000,2),''FM999G990D00'') || '' Lac charged</span>'' End',
'    || Case When x.TaxGroup = 0',
'            Then ''<span class="ds-pnl-flag">Tax &mdash; group INCOME TAX EXPENSES AND PROVISIONS does not exist</span>''',
'            When x.TaxLedgers = 0',
'            Then ''<span class="ds-pnl-flag">Tax &mdash; group exists but holds no ledgers, so PAT cannot be computed</span>''',
'            When Abs(x.Tax) < 0.005',
'            Then ''<span class="ds-pnl-flag">Tax &mdash; not booked in this period</span>''',
'            Else ''<span class="ds-pnl-flag ds-pnl-flag--ok">Tax &mdash; booked</span>'' End',
'    || ''</div></div>'' As STATE',
'  From X x'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P904_FROMDATE,P904_TODATE,P904_COMPANY,P904_LOCATION'
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
 p_id=>wwv_flow_imp.id(12793973091301144)
,p_query_column_id=>1
,p_column_alias=>'STATE'
,p_column_display_sequence=>10
,p_column_heading=>'State'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12794040573301144)
,p_name=>'Profit and Loss Summary'
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
'    /* This page is the hub of the three. Back to the Trial Balance it',
'       was derived from, and out to the same statement cut two other',
'       ways - down the calendar, and across the locations. All three',
'       carry the filters so a reader never re-enters them.',
'',
'       Monthly is driven by a financial year rather than a date range,',
'       because the ERP and the budget tables are, so the year holding',
'       From Date is looked up and passed instead of the dates. */',
'    || ''<div class="ds-head-ctas">''',
'    || ''<a class="ds-head-cta" href="''',
'       || apex_page.get_url(',
'            p_page   => 902,',
'            p_clear_cache => ''902'',',
'            p_items  => ''P902_FROMDATE,P902_TODATE,P902_COMPANY,P902_LOCATION'',',
'            p_values => :P904_FROMDATE||'',''||:P904_TODATE||'',''||:P904_COMPANY||'',''',
'                        ||:P904_LOCATION)',
'       || ''"><span class="fa fa-arrow-left"></span>Trial Balance <b>&larr;</b></a>''',
'    || ''<a class="ds-head-cta" href="''',
'       || apex_page.get_url(',
'            p_page   => 905,',
'            p_clear_cache => ''905'',',
'            p_items  => ''P905_FINYEAR,P905_COMPANY,P905_LOCATION'',',
'            p_values => (Select Max(f.FinancialYearCode) From FinancialYear f',
'                          Where to_date(:P904_FROMDATE,''DD-MM-RRRR'')',
'                                Between f.FinancialYearBegin And f.FinancialYearEnd)',
'                        ||'',''||:P904_COMPANY||'',''||:P904_LOCATION)',
'       || ''"><span class="fa fa-calendar"></span>Monthly <b>&rarr;</b></a>''',
'    || ''<a class="ds-head-cta" href="''',
'       || apex_page.get_url(',
'            p_page   => 906,',
'            p_clear_cache => ''906'',',
'            p_items  => ''P906_FROMDATE,P906_TODATE,P906_COMPANY'',',
'            p_values => :P904_FROMDATE||'',''||:P904_TODATE||'',''||:P904_COMPANY)',
'       || ''"><span class="fa fa-map-marker"></span>By Location <b>&rarr;</b></a>''',
'    || ''</div>''',
'    || ''<div class="ds-fin-eyebrow">Finance &middot; General Ledger &middot; Profitability</div>''',
'    || ''<h1 class="ds-fin-title">Profit and Loss Summary</h1>''',
'    || ''<div class="ds-fin-sub">Revenue to PBT on the posted ledger, proved against the Trial Balance on every load</div>''',
'    || ''<div class="ds-fin-context">''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-calendar"></span>Period <b>''',
'       || :P904_FROMDATE || '' &rarr; '' || :P904_TODATE || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-calendar-check-o"></span>Financial Year <b>''',
'       || nvl((Select f.FinancialYearCode From FinancialYear f',
'                Where to_date(:P904_FROMDATE,''DD-MM-RRRR'')',
'                      Between f.FinancialYearBegin And f.FinancialYearEnd),''outside any defined year'')',
'       || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P904_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P904_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P904_FROMDATE,P904_TODATE,P904_COMPANY,P904_LOCATION'
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
 p_id=>wwv_flow_imp.id(12794110959301144)
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
 p_id=>wwv_flow_imp.id(12794246669301144)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p705Filters'
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12794380643301144)
,p_plug_name=>'Reading this statement'
,p_static_id=>'pnl-note'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-finnote">',
'  <span class="fa fa-info-circle"></span>',
'  <b>Reading this statement.</b> Every subtotal is one group of the chart of accounts, so',
'  each line can be opened: click it to see the same period in the Trial Balance, scoped to',
'  that group, and from there down to the account, its ledger and the voucher behind it.',
'  <b>Operating Expense</b> is everything under EXPENSES other than Direct Cost, Depreciation,',
'  Finance Cost and Tax &mdash; taken as a remainder on purpose, so an account group added',
'  later cannot quietly fall out of the P and L.',
'  <b>Percentages</b> are of revenue, and blank rather than zero when there is no revenue.',
'  <b>PAT</b> equals PBT only while no tax is booked; the closing control above says so',
'  rather than letting the equality imply that tax is nil.',
'  Figures are base currency (INR). Opening carry-forward vouchers are excluded from period',
'  movement, the same basis the Trial Balance uses.',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12794418210301160)
,p_name=>'Profit and Loss'
,p_static_id=>'pnl-statement'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_css_classes=>'ds-dash-panel ds-pnl-rows'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The statement.',
'',
'   Every subtotal is one clean subtree of the chart, which is why the',
'   two groups were moved out of INDIRECT EXPENSES: Finance Cost and Tax',
'   used to sit inside it, so counting Indirect Cost and then subtracting',
'   finance cost again would have charged it twice and understated EBITDA',
'   by the same amount.',
'',
'   Operating Expense is deliberately "everything else under EXPENSES"',
'   rather than a named group. FREIGHT OUTWARD, GST PENALTY, PRICE',
'   DIFFERENCE and the SHORTAGE groups sit directly under EXPENSES beside',
'   INDIRECT EXPENSES, and any group added tomorrow would silently vanish',
'   from the P and L if this named one group instead of taking the',
'   remainder.',
'',
'   Sign: Amount is signed, debit negative. Income accounts are credited',
'   so Revenue is the plain sum; costs are debited so a cost is the',
'   negated sum and prints positive. */',
'With Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'     Src As (',
'       Select p.PartyCode Acct,',
'              Connect_By_Root p.NatureOfAccountCode RootNat,',
'              regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,2) L2,',
'              regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,3) Bucket',
'         From Party p Start With p.ParentCode Is Null',
'       Connect By Prior p.PartyCode = p.ParentCode),',
'     Mv As (',
'       Select d.AccountCode Acct, Sum(nvl(d.Amount,0)) Amt',
'         From VoucherDetail d',
'        Where d.VoucherDate >= to_date(:P904_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P904_TODATE,''DD-MM-RRRR'') + 1',
'          And d.Tno Not In (Select Tno From Carry)',
'          And (cast(null as varchar2(100)) Is Null Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P904_COMPANY  Is Null Or d.CompanyCode  = :P904_COMPANY)',
'          And (:P904_LOCATION Is Null Or d.LocationCode = :P904_LOCATION)',
'        Group By d.AccountCode),',
'     /* RootNat is checked as well as the container, so a P and L account',
'        grafted in from outside PROFIT AND LOSS is never silently dropped.',
'        None exists today; the trial balance graft proved that such',
'        accounts do occur in this chart, so the guard stays. */',
'     B As (',
'       Select Case When s.L2 = ''INCOME''       Or s.RootNat = ''INCOME''   Then ''REVENUE''',
'                   When s.Bucket = ''DIRECTCOST''                        Then ''DIRECT''',
'                   When s.Bucket = ''DEPRECIATION''                      Then ''DEPN''',
'                   When s.Bucket = ''4892''                              Then ''FIN''',
'                   When s.Bucket = ''7481''                              Then ''TAX''',
'                   When s.L2 = ''EXPENDITURES'' Or s.RootNat = ''EXPENSES'' Then ''OPEX''',
'              End Bkt, m.Amt',
'         From Mv m Join Src s On s.Acct = m.Acct),',
'     T As (Select Bkt, Sum(Amt) A From B Where Bkt Is Not Null Group By Bkt),',
'     R As (',
'       Select nvl((Select A From T Where Bkt=''REVENUE''),0) Rev,',
'              nvl((Select A From T Where Bkt=''DIRECT''),0)  Dir,',
'              nvl((Select A From T Where Bkt=''OPEX''),0)    Opx,',
'              nvl((Select A From T Where Bkt=''DEPN''),0)    Dep,',
'              nvl((Select A From T Where Bkt=''FIN''),0)     Fin,',
'              nvl((Select A From T Where Bkt=''TAX''),0)     Tax,',
'              (Select Count(*) From Party c Where c.ParentCode=''7481'') TaxLedgers',
'         From dual),',
'     L As (',
'       Select  1 Seq, ''Revenue''                  Lbl, r.Rev                                     V, ''sub''    Cls, ''REVENUE''      Grp From R r',
'       Union All Select  2, ''less  Direct Cost'',      -r.Dir,                                      ''less'',   ''DIRECT''       From R r',
'       Union All Select  3, ''CONTRIBUTION'',            r.Rev + r.Dir,                              ''sub'',    Cast(Null As Varchar2(30)) From R r',
'       Union All Select  4, ''less  Operating Expense'',-r.Opx,                                      ''less'',   ''OPEX''         From R r',
'       Union All Select  5, ''EBITDA'',                  r.Rev + r.Dir + r.Opx,                      ''sub'',    Cast(Null As Varchar2(30)) From R r',
'       Union All Select  6, ''less  Depreciation'',     -r.Dep,                                      ''less'',   ''DEPN''         From R r',
'       Union All Select  7, ''EBIT'',                    r.Rev + r.Dir + r.Opx + r.Dep,              ''sub'',    Cast(Null As Varchar2(30)) From R r',
'       Union All Select  8, ''less  Finance Cost'',     -r.Fin,                                      ''less'',   ''FIN''          From R r',
'       Union All Select  9, ''PBT'',                     r.Rev + r.Dir + r.Opx + r.Dep + r.Fin,      ''sub'',    Cast(Null As Varchar2(30)) From R r',
'       Union All Select 10, ''less  Tax'',              -r.Tax,                                      ''less'',   ''TAX''          From R r',
'       Union All Select 11, ''PAT'',                     r.Rev + r.Dir + r.Opx + r.Dep + r.Fin + r.Tax,''bottom'',Cast(Null As Varchar2(30)) From R r)',
'/* One row per statement line, not one row holding the whole table.',
'',
'   It was assembled in SQL because the template it first used built',
'   div/dl structures and a bare <tr> had no table to belong to. The',
'   plain @/standard template has no such problem, and real columns buy',
'   the thing a single HTML cell could never give: a Download that',
'   produces figures instead of markup.',
'',
'   The amount is a plain number with its unit in the heading, so the',
'   exported file holds something a spreadsheet can add up. Row weight',
'   rides on an empty marker span read by :has() in CSS, because a',
'   report decides its own row markup and gives no way to put a class',
'   on a row. */',
'Select l.Seq                                                   As SEQ,',
'       ''<span class="ds-pnl-rowtag ds-pnl-'' || l.Cls',
'       /* A nil line is marked only where nil means "not yet posted",',
'          which the closing control band explains. A genuine zero on a',
'          line that has no pending reason is left alone. */',
'       || Case When Abs(l.V) < 0.005 And l.Seq In (2,6,10) Then '' ds-pnl-pending'' End',
'       || ''"></span>''',
'       || Case When l.Grp Is Null Then apex_escape.html(l.Lbl)',
'               /* The bucket, not the group, and Ledger Only on. A reader',
'                  who clicks a line wants the accounts that MAKE that line,',
'                  and wants them to add up to it. Sending a group did',
'                  neither. It opened a hierarchy five levels deep that had',
'                  to be read down to reach any ledger, and for Operating',
'                  Expense it opened EXPENDITURES - Rs24.57 Cr against a',
'                  line reading Rs3.22 Cr, because the group also holds',
'                  direct cost, depreciation, finance cost and tax. The',
'                  bucket carries this page''s own definition across, so the',
'                  total ties by construction. */',
'               Else ''<a href="'' || apex_page.get_url(p_page => 902, p_clear_cache => ''902'',',
'                        p_items  => ''P902_PNLBUCKET,P902_LEDGERONLY,P902_ACCOUNTGROUP,P902_FROMDATE,P902_TODATE,P902_COMPANY,P902_LOCATION'',',
'                        p_values => l.Grp || '',Y,,'' || :P904_FROMDATE || '','' || :P904_TODATE || '',''',
'                                    || :P904_COMPANY || '','' || :P904_LOCATION)',
'                    || ''" target="_blank" rel="noopener">'' || apex_escape.html(l.Lbl) || ''</a>'' End',
'                                                               As PARTICULARS,',
'       Round(l.V / 10000000, 2)                                As AMOUNT,',
'       /* Null, not 0.0, when there is no revenue to be a percentage of. */',
'       Case When Abs((Select Rev From R)) > 0.005',
'            Then Round(l.V / (Select Rev From R) * 100, 1) End As PCT_OF_REVENUE',
'  From L l',
' /* Explicit, and load-bearing: this is the only thing deciding row',
'    order, and a statement read out of order is not a statement. A',
'    union does not promise the order it was written in. */',
' Order By l.Seq'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P904_FROMDATE,P904_TODATE,P904_COMPANY,P904_LOCATION'
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
 p_id=>wwv_flow_imp.id(12794550001301160)
,p_query_column_id=>3
,p_column_alias=>'AMOUNT'
,p_column_display_sequence=>30
,p_column_heading=>'Amount (Rs Cr)'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12794621239301160)
,p_query_column_id=>2
,p_column_alias=>'PARTICULARS'
,p_column_display_sequence=>20
,p_column_heading=>'Particulars'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12794765155301160)
,p_query_column_id=>4
,p_column_alias=>'PCT_OF_REVENUE'
,p_column_display_sequence=>40
,p_column_heading=>'% of revenue'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12794805735301160)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'NEVER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12794943586301160)
,p_name=>'Reconciliation'
,p_static_id=>'reconciliation'
,p_template=>4072358936313175081
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The proof. Both sides come from the same ledger on the same basis, so',
'   the difference must be exactly zero - this is not a tolerance check,',
'   it is an identity. If it ever fails the page says the difference',
'   rather than the result, because a P and L that cannot prove itself',
'   should not be read. */',
'With Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'     Src As (',
'       Select p.PartyCode Acct,',
'              Connect_By_Root p.NatureOfAccountCode RootNat,',
'              regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,2) L2,',
'              regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,3) Bucket',
'         From Party p Start With p.ParentCode Is Null',
'       Connect By Prior p.PartyCode = p.ParentCode),',
'     Mv As (',
'       Select d.AccountCode Acct, Sum(nvl(d.Amount,0)) Amt',
'         From VoucherDetail d',
'        Where d.VoucherDate >= to_date(:P904_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P904_TODATE,''DD-MM-RRRR'') + 1',
'          And d.Tno Not In (Select Tno From Carry)',
'          And (cast(null as varchar2(100)) Is Null Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P904_COMPANY  Is Null Or d.CompanyCode  = :P904_COMPANY)',
'          And (:P904_LOCATION Is Null Or d.LocationCode = :P904_LOCATION)',
'        Group By d.AccountCode),',
'     C As (',
'       Select',
'         /* left side: the statement, bucket by bucket */',
'         Sum(Case When s.L2=''INCOME'' Or s.RootNat=''INCOME''',
'                    Or s.Bucket In (''DIRECTCOST'',''DEPRECIATION'',''4892'',''7481'')',
'                    Or s.L2=''EXPENDITURES'' Or s.RootNat=''EXPENSES''',
'                  Then m.Amt Else 0 End) Stmt,',
'         /* right side: every P and L account, however classified */',
'         Sum(Case When Case When s.RootNat Is Not Null Then s.RootNat',
'                            When s.L2=''INCOME'' Then ''INCOME''',
'                            When s.L2=''EXPENDITURES'' Then ''EXPENSES'' End In (''INCOME'',''EXPENSES'')',
'                  Then m.Amt Else 0 End) Tb',
'         From Mv m Join Src s On s.Acct = m.Acct)',
'Select ''<div class="ds-pnl-recon ds-pnl-recon--''',
'    || Case When Abs(c.Stmt - c.Tb) < 0.005 Then ''ok'' Else ''bad'' End || ''">''',
'    || Case When Abs(c.Stmt - c.Tb) < 0.005',
'            Then ''<b>Reconciled.</b> The statement above equals the Trial Balance movement on ''',
'                 || ''INCOME and EXPENSES for this period, company and location &mdash; ''',
'                 || ''&#8377;'' || to_char(Round(c.Tb/10000000,2),''FM999G990D00'') || '' Cr on both sides.''',
'            Else ''<b>DOES NOT RECONCILE.</b> The statement totals &#8377;''',
'                 || to_char(Round(c.Stmt/10000000,2),''FM999G990D00'')',
'                 || '' Cr against a Trial Balance movement of &#8377;''',
'                 || to_char(Round(c.Tb/10000000,2),''FM999G990D00'')',
'                 || '' Cr &mdash; a difference of &#8377;''',
'                 || to_char(Round((c.Stmt-c.Tb)/10000000,2),''FM999G990D00'')',
'                 || '' Cr. Some P and L account is not reaching a bucket. Do not use the figures above ''',
'                 || ''until this reads zero.'' End',
'    || ''</div>'' As RECON',
'  From C c'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P904_FROMDATE,P904_TODATE,P904_COMPANY,P904_LOCATION'
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
 p_id=>wwv_flow_imp.id(12795028771301161)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12796166112301161)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12794246669301144)
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
 p_id=>wwv_flow_imp.id(12796272428301161)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12794418210301160)
,p_button_name=>'DOWNLOADPNL'
,p_static_id=>'download-pnl'
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
 p_id=>wwv_flow_imp.id(12795140801301161)
,p_name=>'P904_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12794246669301144)
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
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>'Restrict the statement to one company. The reconciliation control re-proves itself for whatever scope you choose.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12795373817301161)
,p_name=>'P904_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12794246669301144)
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
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Start of the period. Defaults to the beginning of the current financial year, so the page opens on the year to date.'
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
 p_id=>wwv_flow_imp.id(12795581235301161)
,p_name=>'P904_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12794246669301144)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select l.LocationName d, l.LocationCode r',
'  From Location l',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.LocationCode = l.LocationCode',
'                  And (:P904_COMPANY Is Null Or v.CompanyCode = :P904_COMPANY)',
'                  And (cast(null as varchar2(100)) Is Null',
'                       Or cast(null as varchar2(100)) = cast(null as varchar2(100))))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P904_COMPANY'
,p_ajax_items_to_submit=>'P904_COMPANY'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>'Location is the profitability dimension in this ERP - it stands for division, plant or business unit. Department is not carried on the ledger and so cannot be reported.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12795989514301161)
,p_name=>'P904_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12794246669301144)
,p_item_default=>'Select to_char(trunc(sysdate),''DD-MM-RRRR'') From dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'End of the period, inclusive. Defaults to today.'
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
 p_id=>wwv_flow_imp.id(12796377451301161)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Download Profit and Loss'
,p_static_id=>'download-pnl'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The statement as a file, headed and styled like the Trial Balance',
'   download. The particulars come from L.Lbl - the plain label - so the',
'   file holds "Revenue", not the row''s on-screen span and drill anchor.',
'   HTML that Excel opens, styles inline (Excel ignores a stylesheet), and',
'   the number format is single-quoted so the style attribute survives. */',
'Declare',
'    Cursor cPnl Is',
'    With Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'                         Src As (',
'                           Select p.PartyCode Acct,',
'                                  Connect_By_Root p.NatureOfAccountCode RootNat,',
'                                  regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,2) L2,',
'                                  regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,3) Bucket',
'                             From Party p Start With p.ParentCode Is Null',
'                           Connect By Prior p.PartyCode = p.ParentCode),',
'                         Mv As (',
'                           Select d.AccountCode Acct, Sum(nvl(d.Amount,0)) Amt',
'                             From VoucherDetail d',
'                            Where d.VoucherDate >= to_date(:P904_FROMDATE,''DD-MM-RRRR'')',
'                              And d.VoucherDate <  to_date(:P904_TODATE,''DD-MM-RRRR'') + 1',
'                              And d.Tno Not In (Select Tno From Carry)',
'                              And (cast(null as varchar2(100)) Is Null Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'                              And (null    Is Null Or cast(null as varchar2(100))        = null)',
'                              And (:P904_COMPANY  Is Null Or d.CompanyCode  = :P904_COMPANY)',
'                              And (:P904_LOCATION Is Null Or d.LocationCode = :P904_LOCATION)',
'                            Group By d.AccountCode),',
'                         /* RootNat is checked as well as the container, so a P and L account',
'                            grafted in from outside PROFIT AND LOSS is never silently dropped.',
'                            None exists today; the trial balance graft proved that such',
'                            accounts do occur in this chart, so the guard stays. */',
'                         B As (',
'                           Select Case When s.L2 = ''INCOME''       Or s.RootNat = ''INCOME''   Then ''REVENUE''',
'                                       When s.Bucket = ''DIRECTCOST''                        Then ''DIRECT''',
'                                       When s.Bucket = ''DEPRECIATION''                      Then ''DEPN''',
'                                       When s.Bucket = ''4892''                              Then ''FIN''',
'                                       When s.Bucket = ''7481''                              Then ''TAX''',
'                                       When s.L2 = ''EXPENDITURES'' Or s.RootNat = ''EXPENSES'' Then ''OPEX''',
'                                  End Bkt, m.Amt',
'                             From Mv m Join Src s On s.Acct = m.Acct),',
'                         T As (Select Bkt, Sum(Amt) A From B Where Bkt Is Not Null Group By Bkt),',
'                         R As (',
'                           Select nvl((Select A From T Where Bkt=''REVENUE''),0) Rev,',
'                                  nvl((Select A From T Where Bkt=''DIRECT''),0)  Dir,',
'                                  nvl((Select A From T Where Bkt=''OPEX''),0)    Opx,',
'                                  nvl((Select A From T Where Bkt=''DEPN''),0)    Dep,',
'                                  nvl((Select A From T Where Bkt=''FIN''),0)     Fin,',
'                                  nvl((Select A From T Where Bkt=''TAX''),0)     Tax,',
'                                  (Select Count(*) From Party c Where c.ParentCode=''7481'') TaxLedgers',
'                             From dual),',
'                         L As (',
'                           Select  1 Seq, ''Revenue''                  Lbl, r.Rev                                     V, ''sub''    Cls, ''REVENUE''      Grp From R r',
'                           Union All Select  2, ''less  Direct Cost'',      -r.Dir,                                      ''less'',   ''DIRECT''       From R r',
'                           Union All Select  3, ''CONTRIBUTION'',            r.Rev + r.Dir,                              ''sub'',    Cast(Null As Varchar2(30)) From R r',
'                           Union All Select  4, ''less  Operating Expense'',-r.Opx,                                      ''less'',   ''OPEX''         From R r',
'                           Union All Select  5, ''EBITDA'',                  r.Rev + r.Dir + r.Opx,                      ''sub'',    Cast(Null As Varchar2(30)) From R r',
'                           Union All Select  6, ''less  Depreciation'',     -r.Dep,                                      ''less'',   ''DEPN''         From R r',
'                           Union All Select  7, ''EBIT'',                    r.Rev + r.Dir + r.Opx + r.Dep,              ''sub'',    Cast(Null As Varchar2(30)) From R r',
'                           Union All Select  8, ''less  Finance Cost'',     -r.Fin,                                      ''less'',   ''FIN''          From R r',
'                           Union All Select  9, ''PBT'',                     r.Rev + r.Dir + r.Opx + r.Dep + r.Fin,      ''sub'',    Cast(Null As Varchar2(30)) From R r',
'                           Union All Select 10, ''less  Tax'',              -r.Tax,                                      ''less'',   ''TAX''          From R r',
'                           Union All Select 11, ''PAT'',                     r.Rev + r.Dir + r.Opx + r.Dep + r.Fin + r.Tax,''bottom'',Cast(Null As Varchar2(30)) From R r)',
'    Select l.Lbl,',
'           Round(l.V/10000000,2) Amt,',
'           Case When Abs((Select Rev From R)) > 0.005',
'                Then Round(l.V/(Select Rev From R)*100,1) End Pct',
'      From L l Order By l.Seq;',
'    cB  Constant Varchar2(200) := ''font-family:Calibri,Arial,sans-serif;font-size:11pt;border:0.5pt solid #E3E8EF;'';',
'    cT  Constant Varchar2(240) := cB || ''mso-number-format:''''\@'''';'';',
'    cN  Constant Varchar2(240) := cB || ''mso-number-format:''''\#\,\#\#0\.00'''';text-align:right;'';',
'    cH  Constant Varchar2(300) := cB || ''background:#1F2A3B;color:#FFFFFF;font-weight:bold;text-align:center;'';',
'Begin',
'    owa_util.mime_header(''application/vnd.ms-excel'', FALSE);',
'    htp.p(''Content-Disposition: attachment; filename="profit-and-loss-''',
'          || to_char(sysdate,''YYYYMMDD-HH24MI'') || ''.xls"'');',
'    owa_util.http_header_close();',
'    htp.prn(''<html xmlns:x="urn:schemas-microsoft-com:office:excel"><head>'');',
'    htp.prn(''<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>'');',
'    htp.prn(''<!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>''',
'            || ''<x:Name>Profit and Loss</x:Name><x:WorksheetOptions><x:Selected/>''',
'            || ''<x:FreezePanes/><x:FrozenNoSplit/><x:SplitHorizontalPosition>4</x:SplitHorizontalPosition>''',
'            || ''<x:TopRowBottomPane>4</x:TopRowBottomPane><x:ActivePane>2</x:ActivePane>''',
'            || ''<x:Panes><x:Pane><x:Number>3</x:Number></x:Pane>''',
'            || ''<x:Pane><x:Number>2</x:Number></x:Pane></x:Panes>''',
'            || ''</x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]-->'');',
'    htp.prn(''</head><body><table cellspacing="0">'');',
'    htp.prn(''<tr><td style="font-family:Calibri,Arial,sans-serif;font-size:15pt;font-weight:bold;color:#1F2A3B;" colspan="3">Profit and Loss Summary</td></tr>'');',
'    htp.prn(''<tr><td style="font-family:Calibri,Arial,sans-serif;font-size:9pt;color:#4A5568;" colspan="3">''',
'            || apex_escape.html(:P904_FROMDATE) || '' to '' || apex_escape.html(:P904_TODATE)',
'            || '' &middot; base currency (INR)</td></tr>'');',
'    htp.prn(''<tr><td colspan="3"></td></tr>'');',
'    htp.prn(''<tr><th style="'' || cH || ''">Particulars</th><th style="'' || cH',
'            || ''">Amount (Rs Cr)</th><th style="'' || cH || ''">% of revenue</th></tr>'');',
'    For r In cPnl Loop',
'        htp.prn(''<tr>'');',
'        htp.prn(''<td style="'' || cT || ''">'' || apex_escape.html(trim(r.Lbl)) || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || to_char(r.Amt,''FM99999990.00'') || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">''',
'                || Case When r.Pct Is Not Null Then to_char(r.Pct,''FM9990.0'') End || ''</td>'');',
'        htp.prn(''</tr>'');',
'    End Loop;',
'    htp.prn(''</table></body></html>'');',
'    apex_application.stop_apex_engine;',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12796272428301161)
,p_internal_uid=>72544535571689568
);
wwv_flow_imp.component_end;
end;
/
