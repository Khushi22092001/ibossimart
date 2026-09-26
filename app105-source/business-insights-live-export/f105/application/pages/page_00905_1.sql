prompt --application/pages/page_00905
begin
--   Manifest
--     PAGE: 00905
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
 p_id=>905
,p_name=>'Monthly Profit and Loss'
,p_alias=>'MONTHLY-PROFIT-AND-LOSS'
,p_step_title=>'Monthly Profit and Loss'
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
,p_help_text=>'Monthly Profit and Loss. The same statement as page 705 spread across the twelve months of one financial year, April to March. It is driven by a financial year rather than a date range on purpose - the ERP is financial-year based, the budget tables a'
||'re held as APR to MAR columns, and a monthly statement that could start mid-month would not line up with either. Each row is one clean subtree of the chart, the same buckets page 705 uses, so the Total column of this page equals the statement on that'
||' page for the same year and scope. Months with no postings are shown as a dash rather than zero: nothing happened is a different statement from it netted to nil. Sign convention - VoucherDetail.Amount is signed, negative is debit, so a cost is the ne'
||'gated sum and reads positive. Years other than the current one will fill in as data arrives; the page reads FinancialYear and needs no change.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12796581653301161)
,p_name=>'Monthly Profit and Loss'
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
'    /* Both doors carry the selected year across as dates, because the',
'       other two pages are driven by a date range and this one by a',
'       financial year. Without the conversion a reader looking at an',
'       earlier year would land on the current one, which reads as the',
'       numbers having changed. To Date is capped at today so a year in',
'       progress opens at today rather than at a March that has not',
'       happened, and floored at the year begin so a future year still',
'       yields a range that makes sense. */',
'    || ''<div class="ds-head-ctas">''',
'    || ''<a class="ds-head-cta" href="''',
'       || apex_page.get_url(',
'            p_page   => 904,',
'            p_clear_cache => ''904'',',
'            p_items  => ''P904_FROMDATE,P904_TODATE,P904_COMPANY,P904_LOCATION'',',
'            p_values => (Select to_char(Max(f.FinancialYearBegin),''DD-MM-RRRR'') From FinancialYear f',
'                          Where f.FinancialYearCode = :P905_FINYEAR)',
'                        ||'',''||',
'                        (Select to_char(Max(least(f.FinancialYearEnd,',
'                                           greatest(trunc(sysdate), f.FinancialYearBegin))),''DD-MM-RRRR'')',
'                           From FinancialYear f Where f.FinancialYearCode = :P905_FINYEAR)',
'                        ||'',''||:P905_COMPANY||'',''||:P905_LOCATION)',
'       || ''"><span class="fa fa-arrow-left"></span>P and L Summary <b>&larr;</b></a>''',
'    || ''<a class="ds-head-cta" href="''',
'       || apex_page.get_url(',
'            p_page   => 906,',
'            p_clear_cache => ''906'',',
'            p_items  => ''P906_FROMDATE,P906_TODATE,P906_COMPANY'',',
'            p_values => (Select to_char(Max(f.FinancialYearBegin),''DD-MM-RRRR'') From FinancialYear f',
'                          Where f.FinancialYearCode = :P905_FINYEAR)',
'                        ||'',''||',
'                        (Select to_char(Max(least(f.FinancialYearEnd,',
'                                           greatest(trunc(sysdate), f.FinancialYearBegin))),''DD-MM-RRRR'')',
'                           From FinancialYear f Where f.FinancialYearCode = :P905_FINYEAR)',
'                        ||'',''||:P905_COMPANY)',
'       || ''"><span class="fa fa-map-marker"></span>By Location <b>&rarr;</b></a>''',
'    || ''</div>''',
'    || ''<div class="ds-fin-eyebrow">Finance &middot; General Ledger &middot; Profitability</div>''',
'    || ''<h1 class="ds-fin-title">Monthly Profit and Loss</h1>''',
'    || ''<div class="ds-fin-sub">The statement month by month across one financial year, April to March</div>''',
'    || ''<div class="ds-fin-context">''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-calendar-check-o"></span>Financial Year <b>''',
'       || apex_escape.html(nvl(:P905_FINYEAR,''not selected'')) || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-calendar"></span>Covers <b>''',
'       || nvl((Select to_char(f.FinancialYearBegin,''DD-MM-RRRR'') || '' &rarr; '' || to_char(f.FinancialYearEnd,''DD-MM-RRRR'')',
'                From FinancialYear f Where f.FinancialYearCode = :P905_FINYEAR),''&mdash;'')',
'       || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P905_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P905_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P905_FINYEAR,P905_COMPANY,P905_LOCATION'
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
 p_id=>wwv_flow_imp.id(12796613351301161)
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
 p_id=>wwv_flow_imp.id(12796787671301161)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p706Filters'
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
 p_id=>wwv_flow_imp.id(12796839015301161)
,p_name=>'Cross-check'
,p_static_id=>'monthly-check'
,p_template=>4072358936313175081
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The Total column of this page must equal the P and L Summary for the',
'   same year and scope, and both must equal the Trial Balance movement.',
'   All three come from the same ledger, so a difference means a bucket',
'   has gone missing, not that a number is slightly off. */',
'With Fy As (Select f.FinancialYearBegin Fb, f.FinancialYearEnd Fe',
'              From FinancialYear f Where f.FinancialYearCode = :P905_FINYEAR),',
'     Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'     Src As (',
'       Select p.PartyCode Acct,',
'              Connect_By_Root p.NatureOfAccountCode RootNat,',
'              regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,2) L2,',
'              regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,3) Bucket',
'         From Party p Start With p.ParentCode Is Null',
'       Connect By Prior p.PartyCode = p.ParentCode),',
'     Mv As (',
'       Select d.AccountCode Acct, Sum(nvl(d.Amount,0)) Amt',
'         From VoucherDetail d, Fy',
'        Where d.VoucherDate >= Fy.Fb And d.VoucherDate < Fy.Fe + 1',
'          And d.Tno Not In (Select Tno From Carry)',
'          And (cast(null as varchar2(100)) Is Null Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P905_COMPANY  Is Null Or d.CompanyCode  = :P905_COMPANY)',
'          And (:P905_LOCATION Is Null Or d.LocationCode = :P905_LOCATION)',
'        Group By d.AccountCode),',
'     C As (',
'       Select Sum(Case When s.L2=''INCOME'' Or s.RootNat=''INCOME''',
'                         Or s.Bucket In (''DIRECTCOST'',''DEPRECIATION'',''4892'',''7481'')',
'                         Or s.L2=''EXPENDITURES'' Or s.RootNat=''EXPENSES''',
'                       Then m.Amt Else 0 End) Grid,',
'              Sum(Case When Case When s.RootNat Is Not Null Then s.RootNat',
'                                 When s.L2=''INCOME'' Then ''INCOME''',
'                                 When s.L2=''EXPENDITURES'' Then ''EXPENSES'' End In (''INCOME'',''EXPENSES'')',
'                       Then m.Amt Else 0 End) Tb',
'         From Mv m Join Src s On s.Acct = m.Acct)',
'Select ''<div class="ds-pnl-recon ds-pnl-recon--''',
'    || Case When Abs(c.Grid - c.Tb) < 0.005 Then ''ok'' Else ''bad'' End || ''">''',
'    || Case When Abs(c.Grid - c.Tb) < 0.005',
'            Then ''<b>Reconciled.</b> The Total column foots to the Trial Balance movement on INCOME ''',
'                 || ''and EXPENSES for this financial year and scope &mdash; &#8377;''',
'                 || to_char(Round(c.Tb/10000000,2),''FM999G990D00'') || '' Cr, which is also what the ''',
'                 || ''P and L Summary shows for the same year.''',
'            Else ''<b>DOES NOT RECONCILE.</b> The grid totals &#8377;''',
'                 || to_char(Round(c.Grid/10000000,2),''FM999G990D00'')',
'                 || '' Cr against a Trial Balance movement of &#8377;''',
'                 || to_char(Round(c.Tb/10000000,2),''FM999G990D00'') || '' Cr. Do not use the months above ''',
'                 || ''until this reads zero.'' End',
'    || ''</div>'' As RECON',
'  From C c'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P905_FINYEAR,P905_COMPANY,P905_LOCATION'
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
 p_id=>wwv_flow_imp.id(12796962178301162)
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
 p_id=>wwv_flow_imp.id(12797059625301162)
,p_name=>'Monthly Profit and Loss'
,p_static_id=>'monthly-grid'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_css_classes=>'ds-dash-panel ds-pnl-monthly'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* One row per statement line, one column per month of the financial',
'   year, plus a Total that must equal page 705 for the same year.',
'',
'   Built as a single HTML table rather than fourteen report columns:',
'   the shape is fixed - April to March never varies - and a hand-built',
'   table keeps the subtotal weighting, the frozen first column and the',
'   pending-line styling that a P and L needs and a generic report grid',
'   does not give.',
'',
'   Months run April first because that is the financial year, not the',
'   calendar. The month index is derived from the date rather than from',
'   a hard-coded list, so a year whose FinancialYearBegin is not April',
'   would still line up.',
'',
'   Sign: Amount is signed, debit negative. Revenue is the plain sum;',
'   costs are the negated sum so they print positive. */',
'With Fy As (',
'       Select f.FinancialYearBegin Fb, f.FinancialYearEnd Fe',
'         From FinancialYear f Where f.FinancialYearCode = :P905_FINYEAR),',
'     Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'     Src As (',
'       Select p.PartyCode Acct,',
'              Connect_By_Root p.NatureOfAccountCode RootNat,',
'              regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,2) L2,',
'              regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,3) Bucket',
'         From Party p Start With p.ParentCode Is Null',
'       Connect By Prior p.PartyCode = p.ParentCode),',
'     Mv As (',
'       Select d.AccountCode Acct,',
'              /* months since the year began: 0 for April, 11 for March */',
'              trunc(months_between(trunc(d.VoucherDate,''MM''), trunc(Fy.Fb,''MM''))) M,',
'              Sum(nvl(d.Amount,0)) Amt',
'         From VoucherDetail d, Fy',
'        Where d.VoucherDate >= Fy.Fb',
'          And d.VoucherDate <  Fy.Fe + 1',
'          And d.Tno Not In (Select Tno From Carry)',
'          And (cast(null as varchar2(100)) Is Null Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P905_COMPANY  Is Null Or d.CompanyCode  = :P905_COMPANY)',
'          And (:P905_LOCATION Is Null Or d.LocationCode = :P905_LOCATION)',
'        Group By d.AccountCode,',
'                 trunc(months_between(trunc(d.VoucherDate,''MM''), trunc(Fy.Fb,''MM'')))),',
'     B As (',
'       Select Case When s.L2 = ''INCOME''       Or s.RootNat = ''INCOME''    Then ''REVENUE''',
'                   When s.Bucket = ''DIRECTCOST''                         Then ''DIRECT''',
'                   When s.Bucket = ''DEPRECIATION''                       Then ''DEPN''',
'                   When s.Bucket = ''4892''                               Then ''FIN''',
'                   When s.Bucket = ''7481''                               Then ''TAX''',
'                   When s.L2 = ''EXPENDITURES'' Or s.RootNat = ''EXPENSES'' Then ''OPEX''',
'              End Bkt, m.M, m.Amt',
'         From Mv m Join Src s On s.Acct = m.Acct),',
'     /* one row per bucket per month, and a marker for months that had',
'        no posting at all so a dash can be told from a real nil */',
'     G As (',
'       Select Bkt, M, Sum(Amt) A From B Where Bkt Is Not Null Group By Bkt, M),',
'     Live As (Select Distinct M From G),',
'     P As (',
'       Select M,',
'              nvl(Sum(Case When Bkt=''REVENUE'' Then A End),0) Rev,',
'              nvl(Sum(Case When Bkt=''DIRECT''  Then A End),0) Dir,',
'              nvl(Sum(Case When Bkt=''OPEX''    Then A End),0) Opx,',
'              nvl(Sum(Case When Bkt=''DEPN''    Then A End),0) Dep,',
'              nvl(Sum(Case When Bkt=''FIN''     Then A End),0) Fin,',
'              nvl(Sum(Case When Bkt=''TAX''     Then A End),0) Tax',
'         From G Group By M),',
'     Mn As (Select Level-1 M From dual Connect By Level <= 12),',
'     /* the eleven statement lines, each with the value expression that',
'        builds it - kept in one place so a line cannot drift from the',
'        total column that foots it */',
'     L As (',
'       Select 1 Seq,''Revenue'' Lbl,''sub'' Cls,''REV'' K From dual Union All',
'       Select 2,''less  Direct Cost'',       ''less'',  ''DIR'' From dual Union All',
'       Select 3,''CONTRIBUTION'',            ''sub'',   ''CON'' From dual Union All',
'       Select 4,''less  Operating Expense'', ''less'',  ''OPX'' From dual Union All',
'       Select 5,''EBITDA'',                  ''sub'',   ''EBTD'' From dual Union All',
'       Select 6,''less  Depreciation'',      ''less'',  ''DEP'' From dual Union All',
'       Select 7,''EBIT'',                    ''sub'',   ''EBIT'' From dual Union All',
'       Select 8,''less  Finance Cost'',      ''less'',  ''FIN'' From dual Union All',
'       Select 9,''PBT'',                     ''sub'',   ''PBT'' From dual Union All',
'       Select 10,''less  Tax'',              ''less'',  ''TAX'' From dual Union All',
'       Select 11,''PAT'',                    ''bottom'',''PAT'' From dual),',
'     Cell As (',
'       Select l.Seq, l.Lbl, l.Cls, mn.M,',
'              Case l.K',
'                When ''REV''  Then  nvl(p.Rev,0)',
'                When ''DIR''  Then -nvl(p.Dir,0)',
'                When ''CON''  Then  nvl(p.Rev,0)+nvl(p.Dir,0)',
'                When ''OPX''  Then -nvl(p.Opx,0)',
'                When ''EBTD'' Then  nvl(p.Rev,0)+nvl(p.Dir,0)+nvl(p.Opx,0)',
'                When ''DEP''  Then -nvl(p.Dep,0)',
'                When ''EBIT'' Then  nvl(p.Rev,0)+nvl(p.Dir,0)+nvl(p.Opx,0)+nvl(p.Dep,0)',
'                When ''FIN''  Then -nvl(p.Fin,0)',
'                When ''PBT''  Then  nvl(p.Rev,0)+nvl(p.Dir,0)+nvl(p.Opx,0)+nvl(p.Dep,0)+nvl(p.Fin,0)',
'                When ''TAX''  Then -nvl(p.Tax,0)',
'                Else              nvl(p.Rev,0)+nvl(p.Dir,0)+nvl(p.Opx,0)+nvl(p.Dep,0)+nvl(p.Fin,0)+nvl(p.Tax,0)',
'              End V,',
'              Case When mn.M In (Select M From Live) Then 1 Else 0 End Posted',
'         From L l Cross Join Mn mn Left Join P p On p.M = mn.M)',
'/* Fourteen real report columns, not one HTML blob.',
'',
'   Row weight is carried by an empty marker span in the first column',
'   and applied with :has() in CSS - the same technique the Trial',
'   Balance total row already uses - because a classic report gives no',
'   way to put a class on a row. */',
'Select Min(c.Seq) As SEQ,',
'       ''<span class="ds-pnl-rowtag ds-pnl-'' || Min(c.Cls) || ''"></span>''',
'       || apex_escape.html(Min(c.Lbl))                        As PARTICULARS,',
'       Max(Case When c.M = 0 Then Case When c.Posted = 0 Then ''&mdash;''',
'                Else to_char(Round(c.V/10000000,2),''FM999G990D00'') End End) As M01,',
'       Max(Case When c.M = 1 Then Case When c.Posted = 0 Then ''&mdash;''',
'                Else to_char(Round(c.V/10000000,2),''FM999G990D00'') End End) As M02,',
'       Max(Case When c.M = 2 Then Case When c.Posted = 0 Then ''&mdash;''',
'                Else to_char(Round(c.V/10000000,2),''FM999G990D00'') End End) As M03,',
'       Max(Case When c.M = 3 Then Case When c.Posted = 0 Then ''&mdash;''',
'                Else to_char(Round(c.V/10000000,2),''FM999G990D00'') End End) As M04,',
'       Max(Case When c.M = 4 Then Case When c.Posted = 0 Then ''&mdash;''',
'                Else to_char(Round(c.V/10000000,2),''FM999G990D00'') End End) As M05,',
'       Max(Case When c.M = 5 Then Case When c.Posted = 0 Then ''&mdash;''',
'                Else to_char(Round(c.V/10000000,2),''FM999G990D00'') End End) As M06,',
'       Max(Case When c.M = 6 Then Case When c.Posted = 0 Then ''&mdash;''',
'                Else to_char(Round(c.V/10000000,2),''FM999G990D00'') End End) As M07,',
'       Max(Case When c.M = 7 Then Case When c.Posted = 0 Then ''&mdash;''',
'                Else to_char(Round(c.V/10000000,2),''FM999G990D00'') End End) As M08,',
'       Max(Case When c.M = 8 Then Case When c.Posted = 0 Then ''&mdash;''',
'                Else to_char(Round(c.V/10000000,2),''FM999G990D00'') End End) As M09,',
'       Max(Case When c.M = 9 Then Case When c.Posted = 0 Then ''&mdash;''',
'                Else to_char(Round(c.V/10000000,2),''FM999G990D00'') End End) As M10,',
'       Max(Case When c.M = 10 Then Case When c.Posted = 0 Then ''&mdash;''',
'                Else to_char(Round(c.V/10000000,2),''FM999G990D00'') End End) As M11,',
'       Max(Case When c.M = 11 Then Case When c.Posted = 0 Then ''&mdash;''',
'                Else to_char(Round(c.V/10000000,2),''FM999G990D00'') End End) As M12,',
'       to_char(Round(Sum(c.V)/10000000,2),''FM999G990D00'')     As TOT',
'  From Cell c',
' Group By c.Seq',
' Order By Min(c.Seq)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P905_FINYEAR,P905_COMPANY,P905_LOCATION'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No financial year selected, or that year holds no postings in your scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12797139849301162)
,p_query_column_id=>3
,p_column_alias=>'M01'
,p_column_display_sequence=>20
,p_column_heading=>'Apr'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12797259978301162)
,p_query_column_id=>4
,p_column_alias=>'M02'
,p_column_display_sequence=>30
,p_column_heading=>'May'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12797365981301162)
,p_query_column_id=>5
,p_column_alias=>'M03'
,p_column_display_sequence=>40
,p_column_heading=>'Jun'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12797428588301162)
,p_query_column_id=>6
,p_column_alias=>'M04'
,p_column_display_sequence=>50
,p_column_heading=>'Jul'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12797530403301162)
,p_query_column_id=>7
,p_column_alias=>'M05'
,p_column_display_sequence=>60
,p_column_heading=>'Aug'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12797689732301162)
,p_query_column_id=>8
,p_column_alias=>'M06'
,p_column_display_sequence=>70
,p_column_heading=>'Sep'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12797718057301162)
,p_query_column_id=>9
,p_column_alias=>'M07'
,p_column_display_sequence=>80
,p_column_heading=>'Oct'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12797816762301162)
,p_query_column_id=>10
,p_column_alias=>'M08'
,p_column_display_sequence=>90
,p_column_heading=>'Nov'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12797957852301162)
,p_query_column_id=>11
,p_column_alias=>'M09'
,p_column_display_sequence=>100
,p_column_heading=>'Dec'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12798065271301162)
,p_query_column_id=>12
,p_column_alias=>'M10'
,p_column_display_sequence=>110
,p_column_heading=>'Jan'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12798132393301162)
,p_query_column_id=>13
,p_column_alias=>'M11'
,p_column_display_sequence=>120
,p_column_heading=>'Feb'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12798236863301162)
,p_query_column_id=>14
,p_column_alias=>'M12'
,p_column_display_sequence=>130
,p_column_heading=>'Mar'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12798312338301162)
,p_query_column_id=>2
,p_column_alias=>'PARTICULARS'
,p_column_display_sequence=>10
,p_column_heading=>'Particulars'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12798428326301162)
,p_query_column_id=>15
,p_column_alias=>'TOT'
,p_column_display_sequence=>140
,p_column_heading=>'Total'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12798574347301162)
,p_plug_name=>'Reading this grid'
,p_static_id=>'monthly-note'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-finnote">',
'  <span class="fa fa-info-circle"></span>',
'  <b>Reading this grid.</b> Columns run April to March because the financial year does, not the',
'  calendar. A <b>dash</b> means nothing was posted in that month at all &mdash; distinct from',
'  <b>0.00</b>, which means postings happened and netted to nil.',
'  The <b>Total</b> column equals the P&nbsp;and&nbsp;L Summary for the same year and scope, and the',
'  strip below proves it against the Trial Balance on every load.',
'  Figures are &#8377; crore, base currency. Cost of goods sold, depreciation and tax carry the same',
'  caveats as the Summary page &mdash; open it for the closing control that explains them.',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12799135208301162)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(12796787671301161)
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
 p_id=>wwv_flow_imp.id(12799214019301162)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12797059625301162)
,p_button_name=>'DOWNLOADMPNL'
,p_static_id=>'download-mpnl'
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
 p_id=>wwv_flow_imp.id(12798630193301162)
,p_name=>'P905_COMPANY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12796787671301161)
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
 p_id=>wwv_flow_imp.id(12798764095301162)
,p_name=>'P905_FINYEAR'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12796787671301161)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select FinancialYearCode',
'  From FinancialYear',
' Where trunc(sysdate) Between FinancialYearBegin And FinancialYearEnd',
'   And rownum = 1'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Financial Year'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select f.FinancialYearCode d, f.FinancialYearCode r',
'  From FinancialYear f',
' Order By f.FinancialYearBegin Desc'))
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>'The year drives the twelve columns. Only 26-27 carries postings today - 25-26 holds 79 lines that are really this year''s opening, and 24-25 is empty - so the other years will read as dashes until data is loaded.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12798909344301162)
,p_name=>'P905_LOCATION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12796787671301161)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select l.LocationName d, l.LocationCode r',
'  From Location l',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.LocationCode = l.LocationCode',
'                  And (:P905_COMPANY Is Null Or v.CompanyCode = :P905_COMPANY)',
'                  And (cast(null as varchar2(100)) Is Null',
'                       Or cast(null as varchar2(100)) = cast(null as varchar2(100))))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P905_COMPANY'
,p_ajax_items_to_submit=>'P905_COMPANY'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12799362828301177)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Download Monthly Profit and Loss'
,p_static_id=>'download-mpnl'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The grid as a file, headed and styled like the Trial Balance download.',
'   The particulars are the plain label, not the on-screen marker span,',
'   and an unposted month is blank rather than the &mdash; the screen',
'   shows - both were leaking into the CSV as HTML. Styles inline, number',
'   format single-quoted so the style attribute survives. */',
'Declare',
'    Cursor cG Is',
'    With Fy As (',
'           Select f.FinancialYearBegin Fb, f.FinancialYearEnd Fe',
'             From FinancialYear f Where f.FinancialYearCode = :P905_FINYEAR),',
'         Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'         Src As (',
'           Select p.PartyCode Acct,',
'                  Connect_By_Root p.NatureOfAccountCode RootNat,',
'                  regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,2) L2,',
'                  regexp_substr(Sys_Connect_By_Path(p.PartyCode,''/''),''[^/]+'',1,3) Bucket',
'             From Party p Start With p.ParentCode Is Null',
'           Connect By Prior p.PartyCode = p.ParentCode),',
'         Mv As (',
'           Select d.AccountCode Acct,',
'                  /* months since the year began: 0 for April, 11 for March */',
'                  trunc(months_between(trunc(d.VoucherDate,''MM''), trunc(Fy.Fb,''MM''))) M,',
'                  Sum(nvl(d.Amount,0)) Amt',
'             From VoucherDetail d, Fy',
'            Where d.VoucherDate >= Fy.Fb',
'              And d.VoucherDate <  Fy.Fe + 1',
'              And d.Tno Not In (Select Tno From Carry)',
'              And (cast(null as varchar2(100)) Is Null Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'              And (null    Is Null Or cast(null as varchar2(100))        = null)',
'              And (:P905_COMPANY  Is Null Or d.CompanyCode  = :P905_COMPANY)',
'              And (:P905_LOCATION Is Null Or d.LocationCode = :P905_LOCATION)',
'            Group By d.AccountCode,',
'                     trunc(months_between(trunc(d.VoucherDate,''MM''), trunc(Fy.Fb,''MM'')))),',
'         B As (',
'           Select Case When s.L2 = ''INCOME''       Or s.RootNat = ''INCOME''    Then ''REVENUE''',
'                       When s.Bucket = ''DIRECTCOST''                         Then ''DIRECT''',
'                       When s.Bucket = ''DEPRECIATION''                       Then ''DEPN''',
'                       When s.Bucket = ''4892''                               Then ''FIN''',
'                       When s.Bucket = ''7481''                               Then ''TAX''',
'                       When s.L2 = ''EXPENDITURES'' Or s.RootNat = ''EXPENSES'' Then ''OPEX''',
'                  End Bkt, m.M, m.Amt',
'             From Mv m Join Src s On s.Acct = m.Acct),',
'         /* one row per bucket per month, and a marker for months that had',
'            no posting at all so a dash can be told from a real nil */',
'         G As (',
'           Select Bkt, M, Sum(Amt) A From B Where Bkt Is Not Null Group By Bkt, M),',
'         Live As (Select Distinct M From G),',
'         P As (',
'           Select M,',
'                  nvl(Sum(Case When Bkt=''REVENUE'' Then A End),0) Rev,',
'                  nvl(Sum(Case When Bkt=''DIRECT''  Then A End),0) Dir,',
'                  nvl(Sum(Case When Bkt=''OPEX''    Then A End),0) Opx,',
'                  nvl(Sum(Case When Bkt=''DEPN''    Then A End),0) Dep,',
'                  nvl(Sum(Case When Bkt=''FIN''     Then A End),0) Fin,',
'                  nvl(Sum(Case When Bkt=''TAX''     Then A End),0) Tax',
'             From G Group By M),',
'         Mn As (Select Level-1 M From dual Connect By Level <= 12),',
'         /* the eleven statement lines, each with the value expression that',
'            builds it - kept in one place so a line cannot drift from the',
'            total column that foots it */',
'         L As (',
'           Select 1 Seq,''Revenue'' Lbl,''sub'' Cls,''REV'' K From dual Union All',
'           Select 2,''less  Direct Cost'',       ''less'',  ''DIR'' From dual Union All',
'           Select 3,''CONTRIBUTION'',            ''sub'',   ''CON'' From dual Union All',
'           Select 4,''less  Operating Expense'', ''less'',  ''OPX'' From dual Union All',
'           Select 5,''EBITDA'',                  ''sub'',   ''EBTD'' From dual Union All',
'           Select 6,''less  Depreciation'',      ''less'',  ''DEP'' From dual Union All',
'           Select 7,''EBIT'',                    ''sub'',   ''EBIT'' From dual Union All',
'           Select 8,''less  Finance Cost'',      ''less'',  ''FIN'' From dual Union All',
'           Select 9,''PBT'',                     ''sub'',   ''PBT'' From dual Union All',
'           Select 10,''less  Tax'',              ''less'',  ''TAX'' From dual Union All',
'           Select 11,''PAT'',                    ''bottom'',''PAT'' From dual),',
'         Cell As (',
'           Select l.Seq, l.Lbl, l.Cls, mn.M,',
'                  Case l.K',
'                    When ''REV''  Then  nvl(p.Rev,0)',
'                    When ''DIR''  Then -nvl(p.Dir,0)',
'                    When ''CON''  Then  nvl(p.Rev,0)+nvl(p.Dir,0)',
'                    When ''OPX''  Then -nvl(p.Opx,0)',
'                    When ''EBTD'' Then  nvl(p.Rev,0)+nvl(p.Dir,0)+nvl(p.Opx,0)',
'                    When ''DEP''  Then -nvl(p.Dep,0)',
'                    When ''EBIT'' Then  nvl(p.Rev,0)+nvl(p.Dir,0)+nvl(p.Opx,0)+nvl(p.Dep,0)',
'                    When ''FIN''  Then -nvl(p.Fin,0)',
'                    When ''PBT''  Then  nvl(p.Rev,0)+nvl(p.Dir,0)+nvl(p.Opx,0)+nvl(p.Dep,0)+nvl(p.Fin,0)',
'                    When ''TAX''  Then -nvl(p.Tax,0)',
'                    Else              nvl(p.Rev,0)+nvl(p.Dir,0)+nvl(p.Opx,0)+nvl(p.Dep,0)+nvl(p.Fin,0)+nvl(p.Tax,0)',
'                  End V,',
'                  Case When mn.M In (Select M From Live) Then 1 Else 0 End Posted',
'             From L l Cross Join Mn mn Left Join P p On p.M = mn.M)',
'    Select Min(c.Seq) Seq, Min(c.Lbl) Lbl,',
'           Max(Case When c.M = 0 Then Case When c.Posted = 0 Then Null Else Round(c.V/10000000,2) End End) M01,',
'           Max(Case When c.M = 1 Then Case When c.Posted = 0 Then Null Else Round(c.V/10000000,2) End End) M02,',
'           Max(Case When c.M = 2 Then Case When c.Posted = 0 Then Null Else Round(c.V/10000000,2) End End) M03,',
'           Max(Case When c.M = 3 Then Case When c.Posted = 0 Then Null Else Round(c.V/10000000,2) End End) M04,',
'           Max(Case When c.M = 4 Then Case When c.Posted = 0 Then Null Else Round(c.V/10000000,2) End End) M05,',
'           Max(Case When c.M = 5 Then Case When c.Posted = 0 Then Null Else Round(c.V/10000000,2) End End) M06,',
'           Max(Case When c.M = 6 Then Case When c.Posted = 0 Then Null Else Round(c.V/10000000,2) End End) M07,',
'           Max(Case When c.M = 7 Then Case When c.Posted = 0 Then Null Else Round(c.V/10000000,2) End End) M08,',
'           Max(Case When c.M = 8 Then Case When c.Posted = 0 Then Null Else Round(c.V/10000000,2) End End) M09,',
'           Max(Case When c.M = 9 Then Case When c.Posted = 0 Then Null Else Round(c.V/10000000,2) End End) M10,',
'           Max(Case When c.M = 10 Then Case When c.Posted = 0 Then Null Else Round(c.V/10000000,2) End End) M11,',
'           Max(Case When c.M = 11 Then Case When c.Posted = 0 Then Null Else Round(c.V/10000000,2) End End) M12,',
'           Round(Sum(c.V)/10000000,2) Tot',
'      From Cell c Group By c.Seq Order By Min(c.Seq);',
'    cB  Constant Varchar2(200) := ''font-family:Calibri,Arial,sans-serif;font-size:11pt;border:0.5pt solid #E3E8EF;'';',
'    cT  Constant Varchar2(240) := cB || ''mso-number-format:''''\@'''';'';',
'    cN  Constant Varchar2(240) := cB || ''mso-number-format:''''\#\,\#\#0\.00'''';text-align:right;'';',
'    cH  Constant Varchar2(300) := cB || ''background:#1F2A3B;color:#FFFFFF;font-weight:bold;text-align:center;'';',
'Begin',
'    owa_util.mime_header(''application/vnd.ms-excel'', FALSE);',
'    htp.p(''Content-Disposition: attachment; filename="monthly-profit-and-loss-''',
'          || to_char(sysdate,''YYYYMMDD-HH24MI'') || ''.xls"'');',
'    owa_util.http_header_close();',
'    htp.prn(''<html xmlns:x="urn:schemas-microsoft-com:office:excel"><head>'');',
'    htp.prn(''<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>'');',
'    htp.prn(''<!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>''',
'            || ''<x:Name>Monthly P and L</x:Name><x:WorksheetOptions><x:Selected/>''',
'            || ''<x:FreezePanes/><x:FrozenNoSplit/><x:SplitHorizontalPosition>4</x:SplitHorizontalPosition>''',
'            || ''<x:TopRowBottomPane>4</x:TopRowBottomPane><x:ActivePane>2</x:ActivePane>''',
'            || ''<x:Panes><x:Pane><x:Number>3</x:Number></x:Pane>''',
'            || ''<x:Pane><x:Number>2</x:Number></x:Pane></x:Panes>''',
'            || ''</x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]-->'');',
'    htp.prn(''</head><body><table cellspacing="0">'');',
'    htp.prn(''<tr><td style="font-family:Calibri,Arial,sans-serif;font-size:15pt;font-weight:bold;color:#1F2A3B;" colspan="14">Monthly Profit and Loss</td></tr>'');',
'    htp.prn(''<tr><td style="font-family:Calibri,Arial,sans-serif;font-size:9pt;color:#4A5568;" colspan="14">''',
'            || ''Financial Year '' || apex_escape.html(:P905_FINYEAR)',
'            || '' &middot; Rs Cr &middot; base currency (INR)</td></tr>'');',
'    htp.prn(''<tr><td colspan="14"></td></tr>'');',
'    htp.prn(''<tr><th style="'' || cH || ''">Particulars</th>''',
'            || ''<th style="'' || cH || ''">Apr</th>''',
'            || ''<th style="'' || cH || ''">May</th>''',
'            || ''<th style="'' || cH || ''">Jun</th>''',
'            || ''<th style="'' || cH || ''">Jul</th>''',
'            || ''<th style="'' || cH || ''">Aug</th>''',
'            || ''<th style="'' || cH || ''">Sep</th>''',
'            || ''<th style="'' || cH || ''">Oct</th>''',
'            || ''<th style="'' || cH || ''">Nov</th>''',
'            || ''<th style="'' || cH || ''">Dec</th>''',
'            || ''<th style="'' || cH || ''">Jan</th>''',
'            || ''<th style="'' || cH || ''">Feb</th>''',
'            || ''<th style="'' || cH || ''">Mar</th>''',
'            || ''<th style="'' || cH || ''">Total</th></tr>'');',
'    For r In cG Loop',
'        htp.prn(''<tr>'');',
'        htp.prn(''<td style="'' || cT || ''">'' || apex_escape.html(trim(r.Lbl)) || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || Case When r.M01 Is Not Null Then to_char(r.M01,''FM99999990.00'') End || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || Case When r.M02 Is Not Null Then to_char(r.M02,''FM99999990.00'') End || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || Case When r.M03 Is Not Null Then to_char(r.M03,''FM99999990.00'') End || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || Case When r.M04 Is Not Null Then to_char(r.M04,''FM99999990.00'') End || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || Case When r.M05 Is Not Null Then to_char(r.M05,''FM99999990.00'') End || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || Case When r.M06 Is Not Null Then to_char(r.M06,''FM99999990.00'') End || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || Case When r.M07 Is Not Null Then to_char(r.M07,''FM99999990.00'') End || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || Case When r.M08 Is Not Null Then to_char(r.M08,''FM99999990.00'') End || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || Case When r.M09 Is Not Null Then to_char(r.M09,''FM99999990.00'') End || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || Case When r.M10 Is Not Null Then to_char(r.M10,''FM99999990.00'') End || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || Case When r.M11 Is Not Null Then to_char(r.M11,''FM99999990.00'') End || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || Case When r.M12 Is Not Null Then to_char(r.M12,''FM99999990.00'') End || ''</td>'');',
'        htp.prn(''<td style="'' || cN || ''">'' || to_char(r.Tot,''FM99999990.00'') || ''</td>'');',
'        htp.prn(''</tr>'');',
'    End Loop;',
'    htp.prn(''</table></body></html>'');',
'    apex_application.stop_apex_engine;',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12799214019301162)
,p_internal_uid=>72544905409689570
);
wwv_flow_imp.component_end;
end;
/
