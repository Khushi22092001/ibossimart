prompt --application/pages/page_00913
begin
--   Manifest
--     PAGE: 00913
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
 p_id=>913
,p_name=>'AR Exceptions and Controls'
,p_alias=>'AR-EXCEPTIONS-CONTROLS'
,p_step_title=>'AR Exceptions and Controls'
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
,p_help_text=>'A control matrix for the Finance Controller and Internal Audit, not a developer debugging page. THE COUNT AND THE DRILL-DOWN CANNOT DISAGREE - both are produced from one Ex CTE, so the matrix is literally a GROUP BY over the same rows the detail repo'
||'rt lists. A control with no findings is reported as PASS with its scope stated; a control whose input data does not exist is reported as DATA MISSING and is never counted as a pass, because absence of information is not evidence of correctness. Only '
||'controls the schema can validate deterministically are implemented - see docs/ar-dashboard/AR_EXCEPTIONS_CONTROL_MATRIX.md for the ones that were rejected and why.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12731616307300761)
,p_name=>'AR Exceptions and Controls'
,p_static_id=>'command-header'
,p_template=>4072358936313175081
,p_display_sequence=>5
,p_region_css_classes=>'ds-ar-headregion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''<div class="ds-ar-head">''',
'    || ''<div class="ds-ar-eyebrow">Receivables &middot; Control and Assurance</div>''',
'    || ''<h1 class="ds-ar-title">AR Exceptions &amp; Controls</h1>''',
'    || ''<div class="ds-ar-sub">Every control is executed against live data. Each row states its result, its exposure and the exact records behind it.</div>''',
'    || ''<div class="ds-ar-context">''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-crosshairs"></span>Tested as at <b>'' || :P913_TODATE || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P913_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P913_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P913_FROMDATE,P913_TODATE,P913_COMPANY,P913_LOCATION,P913_CONTROL'
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
 p_id=>wwv_flow_imp.id(12731711844300762)
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
 p_id=>wwv_flow_imp.id(12731838705300786)
,p_plug_name=>'Affected Records'
,p_static_id=>'detail'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2102002977963900996)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The SAME Ex predicates as the matrix, carrying every identifying',
'   column. Because both regions derive from one definition, the',
'   matrix count and this row count are the same number - the brief''s',
'   section 47 requirement is a property of the design, not a check',
'   somebody has to remember to run. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P913_TODATE,''DD-MM-RRRR'') D From dual),',
'     Alc As (',
'       Select a.DrVoucherTno Tno, a.DrVoucherSno Sno, -Sum(a.Amount) Amt',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'        Group By a.DrVoucherTno, a.DrVoucherSno',
'       Union All',
'       Select a.CrVoucherTno, a.CrVoucherSno, Sum(a.Amount)',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'        Group By a.CrVoucherTno, a.CrVoucherSno),',
'     Al As (Select Tno, Sno, Sum(Amt) Amt From Alc Group By Tno, Sno),',
'     Oi As (',
'       Select d.Tno, d.Sno, d.AccountCode Pty, d.CompanyCode Cmp,',
'              d.LocationCode Loc, cast(null as varchar2(100)) Pnl, d.VoucherDate Vdt,',
'              v.VoucherNo Vno, v.DocTypeCode Dtc, v.ModuleCode Mc,',
'              d.Amount Amt, -(d.Amount - nvl(al.Amt,0)) Recv,',
'              coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) DueDate,',
'              coalesce(i.InvoiceNo, ao.BillNo, v.VoucherNo) BillRef,',
'              ao.BillDate AoBillDate, ao.BillDueDate AoBillDue',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P913_COMPANY  Is Null Or d.CompanyCode  = :P913_COMPANY)',
'          And (:P913_LOCATION Is Null Or d.LocationCode = :P913_LOCATION)),',
'     Ex As (',
'       Select ''AR-B02'' Code, o.Tno, o.Pty, o.Cmp, o.Loc, o.Pnl, o.Vno, o.BillRef Ref,',
'              o.Vdt Dt, Abs(o.Amt) Amt, Abs(o.Recv) Expo,',
'              ''a due date'' Expected, ''none on the source document'' Actual,',
'              ''Source '' || nvl(o.Mc, o.Dtc) || '' carries no due date; ERP holds no credit terms to derive one'' Reason',
'         From Oi o Where o.Recv > 0.005 And o.DueDate Is Null',
'       Union All',
'       Select ''AR-A05'', a.DrVoucherTno, a.AccountCode, Null, Null, cast(null as varchar2(100)),',
'              nvl(to_char(a.DrVoucherTno),''(null)''), nvl(a.ModuleCode,''-''), To_Date(Null), a.Amount, a.Amount,',
'              ''both vouchers to exist'',',
'              Case When Not Exists (Select 1 From Voucher v Where v.Tno = a.DrVoucherTno)',
'                        And Not Exists (Select 1 From Voucher v Where v.Tno = a.CrVoucherTno)',
'                   Then ''both missing''',
'                   When Not Exists (Select 1 From Voucher v Where v.Tno = a.DrVoucherTno)',
'                   Then ''debit voucher missing'' Else ''credit voucher missing'' End,',
'              ''Allocation survives a voucher that was deleted. The canonical AR layer excludes it by joining both voucher headers.''',
'         From DrCrAllocation a',
'        Where Not Exists (Select 1 From Voucher v Where v.Tno = a.DrVoucherTno)',
'           Or Not Exists (Select 1 From Voucher v Where v.Tno = a.CrVoucherTno)',
'       Union All',
'       Select ''AR-A07'', d.Tno, d.AccountCode, d.CompanyCode, d.LocationCode, cast(null as varchar2(100)),',
'              ''line '' || d.Tno || ''/'' || d.Sno, ''-'', d.VoucherDate,',
'              Abs(d.Amount), Abs(al.Amt) - Abs(d.Amount),',
'              ''allocation <= '' || to_char(Round(Abs(d.Amount),2)),',
'              to_char(Round(Abs(al.Amt),2)),',
'              ''Allocated more than the line is worth; the balance has flipped sign.''',
'         From VoucherDetail d Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And Abs(al.Amt) > Abs(d.Amount) + 0.005',
'       Union All',
'       Select ''AR-A08'', a.DrVoucherTno, dd.AccountCode, dd.CompanyCode, dd.LocationCode, cast(null as varchar2(100)),',
'              ''Dr '' || dd.LocationCode || '' / Cr '' || cd.LocationCode, nvl(a.ModuleCode,''-''),',
'              dd.VoucherDate, a.Amount, a.Amount,',
'              ''same location on both sides'', dd.LocationCode || '' vs '' || cd.LocationCode,',
'              ''Receipt taken at a different location from the one that raised the bill. Legitimate; reported for visibility.''',
'         From DrCrAllocation a',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'        Where dd.LocationCode <> cd.LocationCode',
'          And (dd.AccountCode In (Select PartyCode From Sd)',
'            Or cd.AccountCode In (Select PartyCode From Sd))',
'       Union All',
'       Select ''AR-A09'', a.DrVoucherTno, dd.AccountCode, dd.CompanyCode, dd.LocationCode, cast(null as varchar2(100)),',
'              ''Dr co '' || dd.CompanyCode || '' / Cr co '' || cd.CompanyCode, nvl(a.ModuleCode,''-''),',
'              dd.VoucherDate, a.Amount, a.Amount,',
'              ''same company on both sides'', dd.CompanyCode || '' vs '' || cd.CompanyCode,',
'              ''Allocation crosses a company boundary and would break company-level receivables.''',
'         From DrCrAllocation a',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'        Where dd.CompanyCode <> cd.CompanyCode',
'          And (dd.AccountCode In (Select PartyCode From Sd)',
'            Or cd.AccountCode In (Select PartyCode From Sd))',
'       Union All',
'       Select ''AR-B05'', Min(i.Tno), Min(i.PartyCode), i.CompanyCode, Min(i.LocationCode), Min(cast(null as varchar2(100))),',
'              i.InvoiceNo, ''INVOICE'', Min(i.InvoiceDate), Sum(nvl(i.InvoiceAmount,0)), 0,',
'              ''one invoice per number'', to_char(Count(*)) || '' invoices'',',
'              ''The same invoice number was issued '' || Count(*) || '' times inside this company.''',
'         From Invoice i Group By i.CompanyCode, i.InvoiceNo Having Count(*) > 1',
'       Union All',
'       Select ''AR-B06'', i.Tno, i.PartyCode, i.CompanyCode, i.LocationCode, cast(null as varchar2(100)),',
'              i.InvoiceNo, ''INVOICE'', i.InvoiceDate, 0, 0,',
'              ''a non-zero amount'', ''zero or null'',',
'              ''Invoice carries no value.''',
'         From Invoice i Where nvl(i.InvoiceAmount,0) = 0',
'       Union All',
'       Select ''AR-O01'', o.Tno, o.Pty, o.Cmp, o.Loc, o.Pnl, o.BillRef, ''ACCOUNTOPENING'',',
'              o.Vdt, Abs(o.Amt), Abs(o.Recv),',
'              ''original bill date'', ''not preserved at migration'',',
'              ''Aged from the 31-03-2026 cutover instead of its true bill date, so its age is understated.''',
'         From Oi o Where o.Vno = ''OPENING'' And o.AoBillDate Is Null And Abs(o.Recv) > 0.005',
'       Union All',
'       Select ''AR-O02'', o.Tno, o.Pty, o.Cmp, o.Loc, o.Pnl, o.BillRef, ''ACCOUNTOPENING'',',
'              o.Vdt, Abs(o.Amt), Abs(o.Recv),',
'              ''original due date'', ''not preserved at migration'',',
'              ''Can never be aged on the Due Date basis; falls into Cannot Age.''',
'         From Oi o Where o.Vno = ''OPENING'' And o.AoBillDue Is Null And o.Recv > 0.005',
'       Union All',
'       Select ''AR-R03'', o.Tno, o.Pty, o.Cmp, o.Loc, o.Pnl, o.Vno, nvl(o.Mc,''RECEIPT''),',
'              o.Vdt, Abs(o.Amt), -o.Recv,',
'              ''allocated within 90 days'',',
'              to_char((Select D From Asof) - o.Vdt) || '' days unapplied'',',
'              ''Cash received and never applied to a bill. Overstates both receivable and credit, and understates collection performance.''',
'         From Oi o Cross Join Asof',
'        Where o.Dtc = ''RECEIPT'' And o.Recv < -0.005 And Asof.D - o.Vdt > 90',
'       Union All',
'       Select ''AR-C02'', To_Number(Null), g.Pty, Null, Null, Null,',
'              ''party '' || g.Pty, ''-'', To_Date(Null), g.Dr, Least(g.Dr, g.Cr),',
'              ''receivable OR credit, not both'',',
'              ''receivable '' || to_char(Round(g.Dr,0)) || '' and credit '' || to_char(Round(g.Cr,0)),',
'              ''The lesser of the two can be cleared by allocation alone, with no collection effort.''',
'         From (Select Pty, Sum(Case When Recv > 0 Then Recv Else 0 End) Dr,',
'                           Sum(Case When Recv < 0 Then -Recv Else 0 End) Cr',
'                 From Oi Group By Pty) g',
'        Where g.Dr > 0.005 And g.Cr > 0.005',
'       Union All',
'       Select ''AR-UNUSED'', o.Tno, o.Pty, o.Cmp, o.Loc, o.Pnl, o.Vno, nvl(o.Mc,o.Dtc),',
'              o.Vdt, Abs(o.Amt), Abs(o.Recv),',
'              ''A or B'', ''null'',',
'              ''Panel drives row-level security; a null Panel is invisible to a panel-locked login.''',
'         From Oi o Where 1=0',
'       Union All',
'       Select ''AR-M02'', o.Tno, o.Pty, o.Cmp, o.Loc, o.Pnl, o.Vno, nvl(o.Mc,o.Dtc),',
'              o.Vdt, Abs(o.Amt), Abs(o.Recv),',
'              ''an active location'', apex_escape.html(l.LocationName),',
'              ''The location master names this location as unusable, yet receivables are posted to it.''',
'         From Oi o Join Location l On l.LocationCode = o.Loc',
'        Where upper(l.LocationName) Like ''%DO NOT USE%'' And Abs(o.Recv) > 0.005)',
'Select e.Code                                        As CONTROL_CODE,',
'       e.Tno                                         As VOUCHER_TNO,',
'       nvl(p.PartyName, e.Pty)     As CUSTOMER,',
'       e.Pty                                         As PARTY_CODE,',
'       nvl(c.CompanyName, e.Cmp)   As COMPANY,',
'       nvl(l.LocationName, e.Loc)  As LOCATION,',
'       e.Pnl                                         As PANEL,',
'       e.Vno                       As REFERENCE,',
'       e.Ref                                         As SOURCE,',
'       e.Dt                                          As TRANSACTION_DATE,',
'       Round(e.Amt,2)                                As AMOUNT,',
'       Round(e.Expo,2)                               As EXPOSURE,',
'       e.Expected                  As EXPECTED_VALUE,',
'       e.Actual                    As ACTUAL_VALUE,',
'       /* Difference is the exposure only where the control is',
'          value-bearing; for a count-only control (duplicate invoice',
'          number, zero-amount invoice) there is no meaningful numeric',
'          difference and the column stays null rather than showing 0. */',
'       Case When e.Code Not In (''AR-B05'',''AR-B06'') Then Round(e.Expo,2) End As DIFFERENCE,',
'       /* Severity and Category are derived from the control code so',
'          they cannot drift out of step with the matrix''s roster. */',
'       Case When e.Code In (''AR-A05'',''AR-A07'',''AR-A09'',''AR-R03'',''AR-UNUSED'') Then ''Critical''',
'            When e.Code In (''AR-B02'',''AR-B05'',''AR-O01'',''AR-C02'',''AR-M02'') Then ''High''',
'            When e.Code In (''AR-B06'',''AR-O02'') Then ''Medium''',
'            Else ''Info'' End                          As SEVERITY,',
'       Case substr(e.Code,4,1) When ''A'' Then ''Allocation'' When ''B'' Then ''Bill''',
'                               When ''O'' Then ''Opening''    When ''R'' Then ''Receipt''',
'                               When ''C'' Then ''Customer''   When ''M'' Then ''Master''',
'                               Else ''Other'' End      As CATEGORY,',
'       /* This ERP keeps no exception log, so there is no recorded',
'          detection date. The transaction''s own date is used and the',
'          column is named for what it actually is. */',
'       e.Dt                                          As DETECTED_DATE,',
'       Case When e.Dt Is Not Null Then (Select D From Asof) - e.Dt End As EXCEPTION_AGE_DAYS,',
'       Case When e.Tno Is Not Null Then ''VOUCHERDETAIL Tno='' || e.Tno',
'            Else ''PARTY '' || e.Pty End               As SOURCE_RECORD_ID,',
'       e.Reason                    As EXCEPTION_REASON',
'  From Ex e',
'  Left Join Party p    On p.PartyCode = e.Pty',
'  Left Join Company c  On c.CompanyCode = e.Cmp',
'  Left Join Location l On l.LocationCode = e.Loc',
' Where (e.Code = :P913_CONTROL',
'        Or (:P913_CONTROL Is Null And :P913_CATEGORY Is Not Null',
'            And Case substr(e.Code,4,1) When ''A'' Then ''Allocation'' When ''B'' Then ''Bill''',
'                                        When ''O'' Then ''Opening''    When ''R'' Then ''Receipt''',
'                                        When ''C'' Then ''Customer''   When ''M'' Then ''Master''',
'                                        Else ''Other'' End = :P913_CATEGORY)',
'        Or (:P913_CONTROL Is Null And :P913_CATEGORY = ''ALL'')',
'        Or (:P913_CONTROL Is Null And :P913_CATEGORY = ''CRITICAL''',
'            And e.Code In (''AR-A05'',''AR-A07'',''AR-A09'',''AR-R03'',''AR-UNUSED''))',
'        Or (:P913_CONTROL Is Null And :P913_CATEGORY = ''HIGHVALUE'' And e.Expo >= 1000000))'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P913_FROMDATE,P913_TODATE,P913_COMPANY,P913_LOCATION,P913_CONTROL,P913_CATEGORY'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P913_CONTROL Is Not Null Or :P913_CATEGORY Is Not Null'
,p_plug_display_when_cond2=>'PLSQL'
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
 p_id=>wwv_flow_imp.id(12731977666300786)
,p_max_row_count=>'200000'
,p_no_data_found_message=>'This control found nothing in the selected scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>69600000000000696
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12732049847300787)
,p_db_column_name=>'ACTUAL_VALUE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Actual'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12732166162300787)
,p_db_column_name=>'AMOUNT'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Amount (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12732252722300787)
,p_db_column_name=>'CATEGORY'
,p_display_order=>114
,p_column_identifier=>'Q'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12732396106300787)
,p_db_column_name=>'COMPANY'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12732470536300787)
,p_db_column_name=>'CONTROL_CODE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Control'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12732522769300787)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12732658391300787)
,p_db_column_name=>'DETECTED_DATE'
,p_display_order=>118
,p_column_identifier=>'S'
,p_column_label=>'Detected (Transaction Date)'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12732777299300787)
,p_db_column_name=>'DIFFERENCE'
,p_display_order=>116
,p_column_identifier=>'R'
,p_column_label=>unistr('Difference (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12732885954300787)
,p_db_column_name=>'EXCEPTION_AGE_DAYS'
,p_display_order=>120
,p_column_identifier=>'T'
,p_column_label=>'Exception Age (days)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12732992460300787)
,p_db_column_name=>'EXCEPTION_REASON'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Why This Is An Exception'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12733038601300787)
,p_db_column_name=>'EXPECTED_VALUE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Expected'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12733182198300787)
,p_db_column_name=>'EXPOSURE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Exposure (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12733289602300787)
,p_db_column_name=>'LOCATION'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12733386132300787)
,p_db_column_name=>'PANEL'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Internal Scope'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12733484370300787)
,p_db_column_name=>'PARTY_CODE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Party Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12733519916300787)
,p_db_column_name=>'REFERENCE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12733642515300787)
,p_db_column_name=>'SEVERITY'
,p_display_order=>112
,p_column_identifier=>'P'
,p_column_label=>'Severity'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12733780797300787)
,p_db_column_name=>'SOURCE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Source'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12733822579300788)
,p_db_column_name=>'SOURCE_RECORD_ID'
,p_display_order=>122
,p_column_identifier=>'U'
,p_column_label=>'Source Record ID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12733903049300788)
,p_db_column_name=>'TRANSACTION_DATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Transaction Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12734090747300788)
,p_db_column_name=>'VOUCHER_TNO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Voucher'
,p_column_link=>'f?p=&APP_ID.:678:&SESSION.::&DEBUG.:678:P678_TNO:#VOUCHER_TNO#'
,p_column_linktext=>'Open voucher'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12734154038300788)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69601'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CONTROL_CODE:REFERENCE:CUSTOMER:TRANSACTION_DATE:AMOUNT:EXPOSURE:EXPECTED_VALUE:ACTUAL_VALUE:EXCEPTION_REASON'
,p_sum_columns_on_break=>'EXPOSURE'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12734295174300788)
,p_name=>'Exception KPIs'
,p_static_id=>'exception-kpis'
,p_template=>4072358936313175081
,p_display_sequence=>25
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-kpiwrap--5up'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Twelve clickable exception KPIs, every one of them derived from the',
'   SAME Ex CTE the matrix and the drill-down use - so a card, its',
'   matrix row and its detail report are three views of one row set,',
'   not three counts that happen to agree. Each card links back into',
'   this page with a category or severity filter. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P913_TODATE,''DD-MM-RRRR'') D From dual),',
'     Alc As (',
'       Select a.DrVoucherTno Tno, a.DrVoucherSno Sno, -Sum(a.Amount) Amt',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'        Group By a.DrVoucherTno, a.DrVoucherSno',
'       Union All',
'       Select a.CrVoucherTno, a.CrVoucherSno, Sum(a.Amount)',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'        Group By a.CrVoucherTno, a.CrVoucherSno),',
'     Al As (Select Tno, Sno, Sum(Amt) Amt From Alc Group By Tno, Sno),',
'     Oi As (',
'       Select d.Tno, d.AccountCode Pty, d.LocationCode Loc, cast(null as varchar2(100)) Pnl,',
'              d.VoucherDate Vdt, v.VoucherNo Vno, v.DocTypeCode Dtc,',
'              d.Amount Amt, -(d.Amount - nvl(al.Amt,0)) Recv,',
'              coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) DueDate,',
'              ao.BillDate AoBillDate, ao.BillDueDate AoBillDue',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P913_COMPANY  Is Null Or d.CompanyCode  = :P913_COMPANY)',
'          And (:P913_LOCATION Is Null Or d.LocationCode = :P913_LOCATION)),',
'     Ex As (',
'       Select ''AR-B02'' Code, Abs(o.Recv) Expo, o.Vdt Dt From Oi o',
'        Where o.Recv > 0.005 And o.DueDate Is Null',
'       Union All',
'       Select ''AR-A05'', a.Amount, To_Date(Null) From DrCrAllocation a',
'        Where Not Exists (Select 1 From Voucher v Where v.Tno = a.DrVoucherTno)',
'           Or Not Exists (Select 1 From Voucher v Where v.Tno = a.CrVoucherTno)',
'       Union All',
'       Select ''AR-A07'', Abs(al.Amt) - Abs(d.Amount), d.VoucherDate',
'         From VoucherDetail d Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And Abs(al.Amt) > Abs(d.Amount) + 0.005',
'       Union All',
'       Select ''AR-A08'', a.Amount, dd.VoucherDate From DrCrAllocation a',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'        Where dd.LocationCode <> cd.LocationCode',
'          And (dd.AccountCode In (Select PartyCode From Sd)',
'            Or cd.AccountCode In (Select PartyCode From Sd))',
'       Union All',
'       Select ''AR-A09'', a.Amount, dd.VoucherDate From DrCrAllocation a',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'        Where dd.CompanyCode <> cd.CompanyCode',
'          And (dd.AccountCode In (Select PartyCode From Sd)',
'            Or cd.AccountCode In (Select PartyCode From Sd))',
'       Union All',
'       Select ''AR-B05'', 0, Min(InvoiceDate) From Invoice',
'        Group By CompanyCode, InvoiceNo Having Count(*) > 1',
'       Union All',
'       Select ''AR-B06'', 0, InvoiceDate From Invoice Where nvl(InvoiceAmount,0) = 0',
'       Union All',
'       Select ''AR-O01'', Abs(o.Recv), o.Vdt From Oi o',
'        Where o.Vno = ''OPENING'' And o.AoBillDate Is Null And Abs(o.Recv) > 0.005',
'       Union All',
'       Select ''AR-O02'', Abs(o.Recv), o.Vdt From Oi o',
'        Where o.Vno = ''OPENING'' And o.AoBillDue Is Null And o.Recv > 0.005',
'       Union All',
'       Select ''AR-R03'', -o.Recv, o.Vdt From Oi o Cross Join Asof',
'        Where o.Dtc = ''RECEIPT'' And o.Recv < -0.005 And Asof.D - o.Vdt > 90',
'       Union All',
'       Select ''AR-C02'', Least(g.Dr, g.Cr), To_Date(Null) From (',
'         Select Pty, Sum(Case When Recv > 0 Then Recv Else 0 End) Dr,',
'                     Sum(Case When Recv < 0 Then -Recv Else 0 End) Cr',
'           From Oi Group By Pty) g',
'        Where g.Dr > 0.005 And g.Cr > 0.005',
'       Union All',
'       Select ''AR-UNUSED'', Abs(o.Recv), o.Vdt From Oi o Where 1=0',
'       Union All',
'       Select ''AR-M02'', Abs(o.Recv), o.Vdt From Oi o',
'         Join Location l On l.LocationCode = o.Loc',
'        Where upper(l.LocationName) Like ''%DO NOT USE%'' And Abs(o.Recv) > 0.005),',
'     Rec As (',
'       /* Reconciliation failures: levels whose analytical balance does',
'          not equal the ledger. Counted at company, location and party',
'          so the card matches what page 697 lists. */',
'       Select (Select Count(*) From (',
'                 Select d.CompanyCode C From VoucherDetail d',
'                 Left Join Al al On al.Tno=d.Tno And al.Sno=d.Sno Cross Join Asof',
'                 Where d.AccountCode In (Select PartyCode From Sd) And d.VoucherDate<=Asof.D',
'                 Group By d.CompanyCode',
'                 Having Abs(Sum(-(d.Amount-nvl(al.Amt,0))) - Sum(-d.Amount)) >= 0.005)) CmpN,',
'              (Select Count(*) From (',
'                 Select d.LocationCode L From VoucherDetail d',
'                 Left Join Al al On al.Tno=d.Tno And al.Sno=d.Sno Cross Join Asof',
'                 Where d.AccountCode In (Select PartyCode From Sd) And d.VoucherDate<=Asof.D',
'                 Group By d.LocationCode',
'                 Having Abs(Sum(-(d.Amount-nvl(al.Amt,0))) - Sum(-d.Amount)) >= 0.005)) LocN',
'         From dual),',
'     T As (',
'       Select Count(*) Total,',
'              Sum(Case When Code In (''AR-A05'',''AR-A07'',''AR-A09'',''AR-R03'',''AR-UNUSED'') Then 1 Else 0 End) Crit,',
'              Sum(Case When Expo >= 1000000 Then 1 Else 0 End) HighVal,',
'              Sum(Case When Dt >= to_date(:P913_FROMDATE,''DD-MM-RRRR'')',
'                        And Dt <= to_date(:P913_TODATE,''DD-MM-RRRR'') Then 1 Else 0 End) Nw,',
'              Sum(Case When substr(Code,4,1) = ''B'' Then 1 Else 0 End) BillN,',
'              Sum(Case When substr(Code,4,1) = ''R'' Then 1 Else 0 End) RcptN,',
'              Sum(Case When substr(Code,4,1) = ''A'' Then 1 Else 0 End) AllocN,',
'              Sum(Case When substr(Code,4,1) = ''O'' Then 1 Else 0 End) OpenN,',
'              Sum(Case When Code = ''AR-M02'' Then 1 Else 0 End) LocN,',
'              Sum(Case When Code = ''AR-UNUSED'' Then 1 Else 0 End) UnusedN,',
'              nvl(Sum(Expo),0) Expo',
'         From Ex)',
'Select ''<a class="ds-kpi ds-kpi--gold" href="''',
'    || apex_page.get_url(p_page => 913, p_items => ''P913_CONTROL,P913_CATEGORY'', p_values => '',ALL'')',
'    || ''" title="Every finding from every implemented control, at the As-of Date."><span class="ds-kpi-ic fa fa-list"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Total Active Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.Total,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">exposure &#8377;''',
'    || Case When t.Expo >= 10000000 Then to_char(Round(t.Expo/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Expo/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div></div></a>'' As K1,',
'       ''<a class="ds-kpi ds-kpi--risk" href="''',
'    || apex_page.get_url(p_page => 913, p_items => ''P913_CONTROL,P913_CATEGORY'', p_values => '',CRITICAL'')',
'    || ''" title="Findings on controls graded Critical: orphan allocation, over-allocation, cross-company allocation, unapplied cash over 90 days."><span class="ds-kpi-ic fa fa-exclamation-triangle"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Critical Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.Crit,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">must be cleared, not explained</div></div></a>'' As K2,',
'       ''<a class="ds-kpi ds-kpi--amber" href="''',
'    || apex_page.get_url(p_page => 913, p_items => ''P913_CONTROL,P913_CATEGORY'', p_values => '',HIGHVALUE'')',
'    || ''" title="Findings whose own exposure is 10 lakh or more, whatever their severity grade."><span class="ds-kpi-ic fa fa-inr"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">High-Value Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.HighVal,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">exposure &ge; &#8377;10 Lac each</div></div></a>'' As K3,',
'       ''<div class="ds-kpi ds-kpi--struct" title="Findings whose underlying transaction is dated inside the From-To window. This ERP keeps no exception log, so New means recently transacted, not newly detected.">''',
'    || ''<span class="ds-kpi-ic fa fa-plus-circle"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">New in Period</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.Nw,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">by transaction date &mdash; no detection log exists</div></div></div>'' As K4,',
'       /* Unresolved cannot be measured: there is no resolution status',
'          anywhere in this ERP. Saying "equals total" would be a',
'          measurement; saying nothing would let a reader assume one. */',
'       ''<div class="ds-arexcl"><div class="ds-arexcl-h">Unresolved Exceptions &mdash; CANNOT VALIDATE</div>''',
'    || ''<div class="ds-arexcl-b">This ERP stores no exception log and no resolution status, so an exception cannot be marked resolved and none can be counted as unresolved. ''',
'    || ''Every finding above is simply <b>currently true</b>. Reporting all '' || to_char(t.Total,''FM999G999G990'')',
'    || '' as &ldquo;unresolved&rdquo; would state a fact the data does not carry.</div></div>'' As K5,',
'       ''<a class="ds-kpi ds-kpi--'' || Case When rec.CmpN + rec.LocN = 0 Then ''ok'' Else ''risk'' End || ''" href="''',
'    || apex_page.get_url(p_page => 914, p_clear_cache => ''914'',',
'         p_items => ''P914_FROMDATE,P914_TODATE,P914_COMPANY,P914_LOCATION,P914_LEVEL,P914_ONLYBREAKS'',',
'         p_values => :P913_FROMDATE ||'',''|| :P913_TODATE ||'',''|| :P913_COMPANY ||'',''|| :P913_LOCATION ||'',ALL,Y'')',
'    || ''" title="Company and Location levels whose analytical balance does not equal the ledger. Location breaks are usually legitimate cross-location settlement - page 697 says which."><span class="ds-kpi-ic fa fa-balance-scale"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Reconciliation Failures</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(rec.CmpN + rec.LocN,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || to_char(rec.CmpN,''FM999G990'') || '' company &middot; ''',
'    || to_char(rec.LocN,''FM999G990'') || '' location</div></div></a>'' As K6,',
'       ''<a class="ds-kpi ds-kpi--teal" href="''',
'    || apex_page.get_url(p_page => 913, p_items => ''P913_CONTROL,P913_CATEGORY'', p_values => '',Bill'')',
'    || ''" title="Controls AR-B02, AR-B05 and AR-B06."><span class="ds-kpi-ic fa fa-file-text-o"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Bill Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.BillN,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AR-B02 &middot; AR-B05 &middot; AR-B06</div></div></a>'' As K7,',
'       ''<a class="ds-kpi ds-kpi--violet" href="''',
'    || apex_page.get_url(p_page => 913, p_items => ''P913_CONTROL,P913_CATEGORY'', p_values => '',Receipt'')',
'    || ''" title="Control AR-R03 - receipt cash unapplied over 90 days."><span class="ds-kpi-ic fa fa-download"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Receipt Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.RcptN,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AR-R03</div></div></a>'' As K8,',
'       ''<a class="ds-kpi ds-kpi--risk" href="''',
'    || apex_page.get_url(p_page => 913, p_items => ''P913_CONTROL,P913_CATEGORY'', p_values => '',Allocation'')',
'    || ''" title="Controls AR-A05, AR-A07, AR-A08 and AR-A09."><span class="ds-kpi-ic fa fa-link"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Allocation Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.AllocN,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AR-A05 &middot; AR-A07 &middot; AR-A08 &middot; AR-A09</div></div></a>'' As K9,',
'       ''<a class="ds-kpi ds-kpi--gold" href="''',
'    || apex_page.get_url(p_page => 913, p_items => ''P913_CONTROL,P913_CATEGORY'', p_values => '',Opening'')',
'    || ''" title="Controls AR-O01 and AR-O02 - migrated receivables that lost their original dates."><span class="ds-kpi-ic fa fa-history"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Opening Balance Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.OpenN,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AR-O01 &middot; AR-O02</div></div></a>'' As K10,',
'       ''<a class="ds-kpi ds-kpi--amber" href="''',
'    || apex_page.get_url(p_page => 913, p_items => ''P913_CONTROL,P913_CATEGORY'', p_values => ''AR-M02,'')',
'    || ''" title="Control AR-M02 - receivables posted to a location the master marks unusable."><span class="ds-kpi-ic fa fa-map-marker"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Location Mapping Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.LocN,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AR-M02</div></div></a>'' As K11,',
'       cast(null as varchar2(1)) As K12',
'  From T t Cross Join Rec rec'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P913_FROMDATE,P913_TODATE,P913_COMPANY,P913_LOCATION'
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
 p_id=>wwv_flow_imp.id(12734305208300788)
,p_query_column_id=>1
,p_column_alias=>'K1'
,p_column_display_sequence=>10
,p_column_heading=>'K1'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12734440338300788)
,p_query_column_id=>10
,p_column_alias=>'K10'
,p_column_display_sequence=>100
,p_column_heading=>'K10'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12734547391300788)
,p_query_column_id=>11
,p_column_alias=>'K11'
,p_column_display_sequence=>110
,p_column_heading=>'K11'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12734617110300788)
,p_query_column_id=>12
,p_column_alias=>'K12'
,p_column_display_sequence=>120
,p_column_heading=>'K12'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'HIDDEN'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12734786154300789)
,p_query_column_id=>2
,p_column_alias=>'K2'
,p_column_display_sequence=>20
,p_column_heading=>'K2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12734844833300789)
,p_query_column_id=>3
,p_column_alias=>'K3'
,p_column_display_sequence=>30
,p_column_heading=>'K3'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12734935473300789)
,p_query_column_id=>4
,p_column_alias=>'K4'
,p_column_display_sequence=>40
,p_column_heading=>'K4'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12735099735300789)
,p_query_column_id=>5
,p_column_alias=>'K5'
,p_column_display_sequence=>50
,p_column_heading=>'K5'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12735152279300789)
,p_query_column_id=>6
,p_column_alias=>'K6'
,p_column_display_sequence=>60
,p_column_heading=>'K6'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12735261425300789)
,p_query_column_id=>7
,p_column_alias=>'K7'
,p_column_display_sequence=>70
,p_column_heading=>'K7'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12735314416300789)
,p_query_column_id=>8
,p_column_alias=>'K8'
,p_column_display_sequence=>80
,p_column_heading=>'K8'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12735497152300789)
,p_query_column_id=>9
,p_column_alias=>'K9'
,p_column_display_sequence=>90
,p_column_heading=>'K9'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12735546002300789)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p696Filters'
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
 p_id=>wwv_flow_imp.id(12735694699300789)
,p_name=>'Control Matrix'
,p_static_id=>'matrix'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* THE CONTROL MATRIX IS A GROUP BY OVER THE DETAIL SET.',
'   The Ex CTE below is byte-identical to the one in the drill-down',
'   region, so summary count == detail row count is a property of the',
'   query, not something a reviewer has to verify by counting.',
'   The roster supplies every control that SHOULD run, so a control',
'   finding nothing renders as PASS rather than silently disappearing. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P913_TODATE,''DD-MM-RRRR'') D From dual),',
'     Alc As (',
'       Select a.DrVoucherTno Tno, a.DrVoucherSno Sno, -Sum(a.Amount) Amt',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'        Group By a.DrVoucherTno, a.DrVoucherSno',
'       Union All',
'       Select a.CrVoucherTno, a.CrVoucherSno, Sum(a.Amount)',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'        Group By a.CrVoucherTno, a.CrVoucherSno),',
'     Al As (Select Tno, Sno, Sum(Amt) Amt From Alc Group By Tno, Sno),',
'     Oi As (',
'       Select d.Tno, d.Sno, d.AccountCode Pty, d.CompanyCode Cmp,',
'              d.LocationCode Loc, cast(null as varchar2(100)) Pnl, d.VoucherDate Vdt,',
'              v.VoucherNo Vno, v.DocTypeCode Dtc, v.ModuleCode Mc,',
'              d.Amount Amt, -(d.Amount - nvl(al.Amt,0)) Recv,',
'              coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) DueDate,',
'              ao.BillDate AoBillDate, ao.BillDueDate AoBillDue',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P913_COMPANY  Is Null Or d.CompanyCode  = :P913_COMPANY)',
'          And (:P913_LOCATION Is Null Or d.LocationCode = :P913_LOCATION)),',
'     Ex As (',
'       /* AR-B02 - open receivable that cannot be aged */',
'       Select ''AR-B02'' Code, Abs(o.Recv) Expo From Oi o',
'        Where o.Recv > 0.005 And o.DueDate Is Null',
'       Union All',
'       /* AR-A05 - allocation pointing at a voucher that no longer',
'          exists. This ERP has no reversal flag; deletion is its only',
'          cancellation mechanism, and this is the residue. */',
'       Select ''AR-A05'', a.Amount From DrCrAllocation a',
'        Where Not Exists (Select 1 From Voucher v Where v.Tno = a.DrVoucherTno)',
'           Or Not Exists (Select 1 From Voucher v Where v.Tno = a.CrVoucherTno)',
'       Union All',
'       /* AR-A07 - allocation exceeds the line it settles */',
'       Select ''AR-A07'', Abs(al.Amt) - Abs(d.Amount)',
'         From VoucherDetail d Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And Abs(al.Amt) > Abs(d.Amount) + 0.005',
'       Union All',
'       /* AR-A08 - cross-location settlement. Informational, not a',
'          failure: a receipt legitimately occurs at a location other',
'          than the one that raised the bill. */',
'       Select ''AR-A08'', a.Amount',
'         From DrCrAllocation a',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'        Where dd.LocationCode <> cd.LocationCode',
'          And (dd.AccountCode In (Select PartyCode From Sd)',
'            Or cd.AccountCode In (Select PartyCode From Sd))',
'       Union All',
'       /* AR-A09 - allocation crossing a company boundary */',
'       Select ''AR-A09'', a.Amount',
'         From DrCrAllocation a',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'        Where dd.CompanyCode <> cd.CompanyCode',
'          And (dd.AccountCode In (Select PartyCode From Sd)',
'            Or cd.AccountCode In (Select PartyCode From Sd))',
'       Union All',
'       /* AR-B05 - the same invoice number issued twice in one company */',
'       Select ''AR-B05'', 0 From Invoice',
'        Group By CompanyCode, InvoiceNo Having Count(*) > 1',
'       Union All',
'       /* AR-B06 - invoice carrying no value */',
'       Select ''AR-B06'', 0 From Invoice Where nvl(InvoiceAmount,0) = 0',
'       Union All',
'       /* AR-O01 - opening receivable whose original bill date did not',
'          survive migration, so its age is floored at the cutover */',
'       Select ''AR-O01'', Abs(o.Recv) From Oi o',
'        Where o.Vno = ''OPENING'' And o.AoBillDate Is Null And Abs(o.Recv) > 0.005',
'       Union All',
'       /* AR-O02 - opening receivable with no original due date */',
'       Select ''AR-O02'', Abs(o.Recv) From Oi o',
'        Where o.Vno = ''OPENING'' And o.AoBillDue Is Null And o.Recv > 0.005',
'       Union All',
'       /* AR-R03 - receipt cash held unapplied for more than 90 days.',
'          The largest actionable balance in this ledger. */',
'       Select ''AR-R03'', -o.Recv From Oi o Cross Join Asof',
'        Where o.Dtc = ''RECEIPT'' And o.Recv < -0.005 And Asof.D - o.Vdt > 90',
'       Union All',
'       /* AR-C02 - customer owing and holding credit at the same time */',
'       Select ''AR-C02'', Least(g.Dr, g.Cr) From (',
'         Select Pty, Sum(Case When Recv > 0 Then Recv Else 0 End) Dr,',
'                     Sum(Case When Recv < 0 Then -Recv Else 0 End) Cr',
'           From Oi Group By Pty) g',
'        Where g.Dr > 0.005 And g.Cr > 0.005',
'       Union All',
'       /* AR-M01 - AR posted with no Panel */',
'       Select ''AR-UNUSED'', Abs(o.Recv) From Oi o Where 1=0',
'       Union All',
'       /* AR-M02 - AR posted to a location the master marks unusable */',
'       Select ''AR-M02'', Abs(o.Recv) From Oi o',
'         Join Location l On l.LocationCode = o.Loc',
'        Where upper(l.LocationName) Like ''%DO NOT USE%'' And Abs(o.Recv) > 0.005),',
'     Agg As (Select Code, Count(*) N, nvl(Sum(Expo),0) Expo From Ex Group By Code),',
'     Roster As (',
'       Select ''AR-B02'' Code, ''Open receivable that cannot be aged'' Nm, ''High'' Sev, ''Bill'' Cat,',
'              ''The source document carries no due date and this ERP holds no credit terms to derive one from. Shown in its own Cannot Age bucket, never given an arbitrary one.'' Dsc, ''Y'' Amt From dual',
'       Union All Select ''AR-A05'',''Orphan allocation - voucher no longer exists'',''Critical'',''Allocation'',',
'              ''The allocation references a Dr or Cr voucher that is not in the ledger. Deletion is this ERP''''s only cancellation mechanism. The canonical AR layer excludes these; one of them carries Rs 34,119 against the AR control account.'',''Y'' From'
||' dual',
'       Union All Select ''AR-A07'',''Allocation exceeds the item it settles'',''Critical'',''Allocation'',',
'              ''Allocated amount is greater than the original line amount, so the balance has flipped sign.'',''Y'' From dual',
'       Union All Select ''AR-A08'',''Cross-location settlement'',''Info'',''Allocation'',',
'              ''A receipt at one location settling a bill raised at another. Legitimate in this business and reported for visibility, not as a failure.'',''Y'' From dual',
'       Union All Select ''AR-A09'',''Cross-company allocation'',''Critical'',''Allocation'',',
'              ''An allocation crossing a company boundary would break company-level receivables.'',''Y'' From dual',
'       Union All Select ''AR-B05'',''Duplicate invoice number within a company'',''High'',''Bill'',',
'              ''The same InvoiceNo issued more than once inside one CompanyCode.'',''N'' From dual',
'       Union All Select ''AR-B06'',''Invoice with zero or null amount'',''Medium'',''Bill'',',
'              ''An invoice carrying no value.'',''N'' From dual',
'       Union All Select ''AR-O01'',''Opening AR with no original bill date'',''High'',''Opening'',',
'              ''Migrated receivable whose pre-cutover bill date was not preserved, so its age is floored at 31-03-2026 and is understated.'',''Y'' From dual',
'       Union All Select ''AR-O02'',''Opening AR with no original due date'',''Medium'',''Opening'',',
'              ''Migrated receivable that can never be aged on the Due Date basis.'',''Y'' From dual',
'       Union All Select ''AR-R03'',''Receipt cash unapplied over 90 days'',''Critical'',''Receipt'',',
'              ''Cash received, never allocated to a bill, and now more than 90 days old. Reduces reported collection performance and overstates both sides of the ledger.'',''Y'' From dual',
'       Union All Select ''AR-C02'',''Customer with receivable AND credit'',''High'',''Customer'',',
'              ''The customer owes and is owed at the same time. The lesser of the two can be cleared by allocation alone, with no collection effort.'',''Y'' From dual',
'       Union All Select ''AR-M02'',''AR posted to a location marked DO NOT USE'',''High'',''Master'',',
'              ''The location master names this location as unusable, yet receivables are posted to it.'',''Y'' From dual),',
'     /* Controls whose INPUT does not exist. These are reported as DATA',
'        MISSING and are deliberately NOT counted as passes - the brief',
'        is explicit that lack of information is not a pass. */',
'     Missing As (',
'       Select ''AR-C01'' Code, ''Credit limit exceeded'' Nm, ''Customer'' Cat,',
'              ''Party.CreditAmount is greater than zero on 0 of 954 debtor accounts. There is no limit to test exposure against.'' Dsc From dual',
'       Union All Select ''AR-C03'',''Credit terms not declared'',''Customer'',',
'              ''Party.CreditDays is greater than zero on 2 of 954 debtor accounts, so a due date cannot be derived from customer terms.'' From dual',
'       Union All Select ''AR-R05'',''Reversed or cancelled receipt still allocated'',''Receipt'',',
'              ''VOUCHER carries no approval, posting, draft, cancellation or reversal column and VoucherReferenceDetailReversal is empty. The nearest real evidence is AR-A05.'' From dual',
'       Union All Select ''AR-X02'',''Subledger vs GL'',''Reconciliation'',',
'              ''There is no independent customer subledger table in this ERP. AccountOpening is a migration register, not a running subledger. The honest two-way test is on the Reconciliation page.'' From dual)',
'Select r.Cat                                          As CATEGORY,',
'       r.Code                                         As CONTROL_CODE,',
'       Case When nvl(a.N,0) = 0 Then apex_escape.html(r.Nm)',
'            Else ''<a href="'' || apex_page.get_url(p_page => 913,',
'                   p_items => ''P913_CONTROL'', p_values => r.Code)',
'                 || ''">'' || apex_escape.html(r.Nm) || ''</a>'' End As CONTROL_NAME,',
'       Case r.Sev When ''Critical'' Then ''<span class="ds-archip ds-archip--fail">Critical</span>''',
'                  When ''High''     Then ''<span class="ds-archip ds-archip--warn">High</span>''',
'                  When ''Medium''   Then ''<span class="ds-archip ds-archip--info">Medium</span>''',
'                  Else ''<span class="ds-archip ds-archip--na">Info</span>'' End As SEVERITY,',
'       nvl(a.N,0)                                     As FINDINGS,',
'       Case When r.Amt = ''Y'' And nvl(a.N,0) > 0 Then Round(a.Expo,2) End As EXPOSURE,',
'       /* Six deterministic states, per the brief. NOT APPLICABLE is',
'          reserved for a control that cannot fire because the FILTER',
'          puts it out of scope - not for one that simply found nothing,',
'          which is a PASS. Confusing the two would let a narrowed scope',
'          masquerade as a clean result. */',
'       Case When r.Code = ''AR-A09'' And :P913_COMPANY Is Not Null',
'                 Then ''<span class="ds-archip ds-archip--na">NOT APPLICABLE</span>''',
'            When nvl(a.N,0) = 0',
'                 Then ''<span class="ds-archip ds-archip--pass">PASS</span>''',
'            When r.Sev = ''Info''',
'                 Then ''<span class="ds-archip ds-archip--na">REPORTED</span>''',
'            When r.Sev = ''Critical''',
'                 Then ''<span class="ds-archip ds-archip--fail">FAIL</span>''',
'            Else ''<span class="ds-archip ds-archip--warn">WARNING</span>'' End As RESULT,',
'       Case When r.Code = ''AR-A09'' And :P913_COMPANY Is Not Null',
'            Then ''Scope is a single company, so a cross-company allocation cannot arise within it. Clear the Company filter to test this control.''',
'            Else r.Dsc End                            As WHAT_IT_TESTS',
'  From Roster r Left Join Agg a On a.Code = r.Code',
'Union All',
'Select m.Cat, m.Code, apex_escape.html(m.Nm),',
'       ''<span class="ds-archip ds-archip--na">n/a</span>'',',
'       To_Number(Null), To_Number(Null),',
'       ''<span class="ds-archip ds-archip--nodata">DATA MISSING</span>'',',
'       apex_escape.html(m.Dsc)',
'  From Missing m',
'Union All',
'/* CANNOT VALIDATE is distinct from DATA MISSING: the input columns',
'   exist and hold values, but they cannot settle the question the',
'   control asks. Both are reported; neither is ever a PASS. */',
'Select x.Cat, x.Code, apex_escape.html(x.Nm),',
'       ''<span class="ds-archip ds-archip--na">n/a</span>'',',
'       To_Number(Null), To_Number(Null),',
'       ''<span class="ds-archip ds-archip--nodata">CANNOT VALIDATE</span>'',',
'       apex_escape.html(x.Dsc)',
'  From (',
'    Select ''AR-A10'' Code, ''Duplicate allocation'' Nm, ''Allocation'' Cat,',
'           ''Two allocations of the same amount between the same bill and receipt are a legitimate part-payment pattern here. DrCrAllocation carries no key that distinguishes a duplicate from a genuine second instalment, so the test cannot be made det'
||'erministic.'' Dsc From dual',
'    Union All Select ''AR-X03'',''Exception resolution status'',''Reconciliation'',',
'           ''This ERP stores no exception log, so no finding can be marked resolved. Every result on this page is what is currently true, not a backlog with an age and an owner.'' From dual',
'    Union All Select ''AR-B07'',''Cancelled bill still in AR'',''Bill'',',
'           ''VOUCHER has no cancellation, approval or posting-status column and VoucherReferenceDetailReversal is empty. Deletion is this ERP''''s only cancellation mechanism and it leaves no cancelled row to test - only the orphan allocations AR-A05 fi'
||'nds.'' From dual',
'  ) x',
' Order By 1, 2'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P913_FROMDATE,P913_TODATE,P913_COMPANY,P913_LOCATION'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No control could be evaluated in this scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12735768197300789)
,p_query_column_id=>1
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>10
,p_column_heading=>'Category'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12735899517300789)
,p_query_column_id=>2
,p_column_alias=>'CONTROL_CODE'
,p_column_display_sequence=>20
,p_column_heading=>'Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12735931519300790)
,p_query_column_id=>3
,p_column_alias=>'CONTROL_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Control'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12736028150300790)
,p_query_column_id=>6
,p_column_alias=>'EXPOSURE'
,p_column_display_sequence=>60
,p_column_heading=>unistr('Exposure (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12736155600300790)
,p_query_column_id=>5
,p_column_alias=>'FINDINGS'
,p_column_display_sequence=>50
,p_column_heading=>'Findings'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12736227091300790)
,p_query_column_id=>7
,p_column_alias=>'RESULT'
,p_column_display_sequence=>70
,p_column_heading=>'Result'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12736339235300790)
,p_query_column_id=>4
,p_column_alias=>'SEVERITY'
,p_column_display_sequence=>40
,p_column_heading=>'Severity'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12736419203300790)
,p_query_column_id=>8
,p_column_alias=>'WHAT_IT_TESTS'
,p_column_display_sequence=>80
,p_column_heading=>'What It Tests'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12736576721300790)
,p_plug_name=>'How to read this page'
,p_static_id=>'matrix-note'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-arnote"><span class="fa fa-check-square-o"></span><div>',
'  <b>The count in the matrix and the row count in the drill-down are the same number by construction</b> &mdash;',
'  both are produced from one query, so a control cannot show 12 exceptions and then list 11 rows.',
'  <b>PASS</b> means the control ran and found nothing.',
'  <b>DATA MISSING</b> means the input this control needs does not exist in this ERP, and is deliberately not shown as a pass.',
'</div></div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12736670534300820)
,p_name=>'Go to'
,p_static_id=>'quick-links'
,p_template=>4072358936313175081
,p_display_sequence=>900
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-arnavwrap'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The quick-links strip: one card per sibling page in this section.',
'   One report ROW per card, so the report''s own tbody becomes the',
'   grid (see `.ds-kpiwrap` in design-system.css) and the number of',
'   cards can vary with the reader''s privileges without the layout',
'   caring.',
'',
'   AUTHORISATION. The menu gates each entry on',
'   GetApexReportPrivilege, but that function returns a PL/SQL',
'   BOOLEAN and therefore cannot be called from SQL. Its logic is',
'   reproduced below against the same three tables, INCLUDING the',
'   hard-coded ''BOSS'' bypass it carries, so a card appears only',
'   where the menu entry would. A reader never sees a card for a',
'   page they cannot open. If that function''s rule changes, this',
'   predicate has to change with it - that duplication is the price',
'   of the boolean return type.',
'',
'   Page 698 (Bill Detail) is deliberately absent: it is keyed on a',
'   specific (Tno, Sno) and is meaningless without one, so it is',
'   reached by clicking a bill, never from a menu. */',
'With Pg As (',
'  Select 907 Id, ''AR Command Centre''          Nm, ''Exposure, ageing, collections and the exceptions behind every number'' Sub, ''fa-dashboard''              Ic From dual Union All',
'  Select 908,    ''Party-wise Outstanding'',        ''One row per customer, with ageing and the contact position'',           ''fa-users''                  From dual Union All',
'  Select 909,    ''Bill-wise Outstanding'',         ''Every open item at line level, with its source document'',              ''fa-list-alt''               From dual Union All',
'  Select 910,    ''Debtor 360'',                    ''One customer from every angle - bills, receipts, credits, statement'',  ''fa-user''                   From dual Union All',
'  Select 911,    ''Receipts and Collections'',      ''Cash actually received, which bank took it, how much is applied'',      ''fa-download''               From dual Union All',
'  Select 912,    ''Advances and Unapplied Cash'',   ''Customer money already held, and the receivable it could clear'',       ''fa-hand-o-up''              From dual Union All',
'  Select 913,    ''Exceptions and Controls'',       ''Every control, what it tests, and the records that fail it'',           ''fa-exclamation-triangle''   From dual Union All',
'  Select 914,    ''Reconciliation and Data Health'',''The open-item register against the general-ledger control account'',    ''fa-balance-scale''          From dual Union All',
'  Select 916,    ''Trend Analysis'',                ''How the position moved, month by month'',                               ''fa-line-chart''             From dual Union All',
'  Select 917,    ''Daily Collection MIS'',          ''One day: position, movement, and what remains unexplained'',            ''fa-calendar-o''             From dual Union All',
'  Select 918,    ''Weekly AR Review'',              ''Opening against closing, and the controls that failed in the week'',    ''fa-calendar''               From dual Union All',
'  Select 919,    ''Monthly Management MIS'',        ''The nine-section management pack'',                                     ''fa-file-text-o''            From dual)',
'Select ''<a class="ds-kpi ds-kpi--link ds-kpi--teal" href="''',
'    || apex_page.get_url(',
'         p_page        => Pg.Id,',
'         p_clear_cache => to_char(Pg.Id),',
'         /* Page 700 is a single-day report and has no From/To pair -',
'            naming an item that does not exist on the target page',
'            fails at run time, so its filter list is built separately. */',
'         p_items  => Case When Pg.Id = 917',
'                          Then ''P917_DAY,P917_COMPANY,P917_LOCATION''',
'                          Else ''P''||Pg.Id||''_FROMDATE,P''||Pg.Id||''_TODATE,P''',
'                               ||Pg.Id||''_COMPANY,P''||Pg.Id||''_LOCATION'' End,',
'         p_values => Case When Pg.Id = 917',
'                          Then :P913_TODATE ||'',''|| :P913_COMPANY ||'',''|| :P913_LOCATION',
'                          Else :P913_FROMDATE ||'',''|| :P913_TODATE ||'',''|| :P913_COMPANY ||'',''|| :P913_LOCATION End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 913',
' Order By Pg.Id'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P913_FROMDATE,P913_TODATE,P913_COMPANY,P913_LOCATION'
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
 p_id=>wwv_flow_imp.id(12736703709300821)
,p_query_column_id=>1
,p_column_alias=>'CARD'
,p_column_display_sequence=>10
,p_column_heading=>'CARD'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12737661251300822)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12735546002300789)
,p_button_name=>'APPLY'
,p_static_id=>'apply'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12737710044300822)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(12735546002300789)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:907:&SESSION.::&DEBUG.::P907_FROMDATE,P907_TODATE,P907_COMPANY,P907_LOCATION:&P913_FROMDATE.,&P913_TODATE.,&P913_COMPANY.,&P913_LOCATION.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12737861403300822)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(12735546002300789)
,p_button_name=>'CLEARCONTROL'
,p_static_id=>'clear-control'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Clear Selected Control'
,p_button_redirect_url=>'f?p=&APP_ID.:913:&SESSION.::&DEBUG.::P913_FROMDATE,P913_TODATE,P913_COMPANY,P913_LOCATION,P913_CONTROL:&P913_FROMDATE.,&P913_TODATE.,&P913_COMPANY.,&P913_LOCATION.,'
,p_button_condition=>'P913_CONTROL'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-times'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12736825262300821)
,p_name=>'P913_CATEGORY'
,p_item_sequence=>62
,p_item_plug_id=>wwv_flow_imp.id(12735546002300789)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Set by the exception KPI cards. Accepts a control category (Bill, Receipt, Allocation, Opening, Customer, Master), or ALL for every finding, CRITICAL for critical-severity controls, or HIGHVALUE for findings whose own exposure is 10 lakh or more.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12737070479300821)
,p_name=>'P913_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12735546002300789)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select c.CompanyName d, c.CompanyCode r',
'  From Company c',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.CompanyCode = c.CompanyCode',
'                  And v.AccountCode In (Select PartyCode From Party',
'                        Start With PartyCode = ''SUNDRYDEBTORS'' Connect By Prior PartyCode = ParentCode))',
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
 p_id=>wwv_flow_imp.id(12737123925300821)
,p_name=>'P913_CONTROL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12735546002300789)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12737243364300821)
,p_name=>'P913_FROMDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12735546002300789)
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
 p_id=>wwv_flow_imp.id(12737315059300821)
,p_name=>'P913_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12735546002300789)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select l.LocationName d, l.LocationCode r',
'  From Location l',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.LocationCode = l.LocationCode',
'                  And v.AccountCode In (Select PartyCode From Party',
'                        Start With PartyCode = ''SUNDRYDEBTORS'' Connect By Prior PartyCode = ParentCode)',
'                  And (:P913_COMPANY Is Null Or v.CompanyCode = :P913_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P913_COMPANY'
,p_ajax_items_to_submit=>'P913_COMPANY'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12737551981300821)
,p_name=>'P913_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12735546002300789)
,p_item_default=>'Select to_char(trunc(sysdate),''DD-MM-RRRR'') From dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date / As-of'
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
wwv_flow_imp.component_end;
end;
/
