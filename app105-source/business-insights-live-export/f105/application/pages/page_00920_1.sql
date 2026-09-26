prompt --application/pages/page_00920
begin
--   Manifest
--     PAGE: 00920
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
 p_id=>920
,p_name=>'Accounts Payable Command Centre'
,p_alias=>'AP-COMMAND-CENTRE'
,p_step_title=>'Accounts Payable Command Centre'
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
,p_help_text=>'Payables command centre. AP here is the SUNDRYCREDITORS control account of the chart of accounts, not Party.PartyTypeCode - the control account is the only population that ties to the general ledger, and legacy page 619 uses the other one, which omit'
||'s 15 in-subtree accounts holding Rs 19 Cr and admits 18 accounts the control account does not contain. An open item is one VoucherDetail line; a CREDIT is a POSITIVE Amount, so payable = +(Amount - allocations) - the exact mirror of the AR pages. DrC'
||'rAllocation is the settlement bridge and is counted only when BOTH of its vouchers are dated on or before the As-of Date, so a bill paid later still shows open at an earlier date. To Date IS the As-of Date for every balance; From Date bounds flows on'
||'ly (payments, bill bookings, debit notes, allocations made). Due dates exist on trade bills (PurchaseBillDate plus the purchase order''s credit days) and on migrated opening items only - about a third of open payable value - so the ageing basis is sel'
||'ectable and the uncovered share is shown as its own bucket, never hidden. GRNI is deliberately NOT in these figures: GRIRACCOUNT sits outside SUNDRYCREDITORS in this chart of accounts, and the unbilled liability has its own page that ties to that acc'
||'ount.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12802333909301179)
,p_name=>'Ageing Distribution'
,p_static_id=>'ageing-scale'
,p_template=>4072358936313175081
,p_display_sequence=>38
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P920_TODATE,''DD-MM-RRRR'') D From dual),',
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
'     Aged As (',
'       Select (d.Amount - nvl(al.Amt,0)) Pay,',
'              Case When nvl(:P920_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) Is Null Then 7',
'                   When nvl(:P920_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) >= Asof.D Then 0',
'                   When (Case When :P920_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <=  30 Then 1',
'                   When (Case When :P920_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <=  60 Then 2',
'                   When (Case When :P920_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <=  90 Then 3',
'                   When (Case When :P920_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <= 180 Then 4',
'                   When (Case When :P920_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <= 365 Then 5',
'                   Else 6 End Bkt',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join (Select pp.Tno Tno,',
'                           coalesce(Max(pb.PartyBillDate), Max(pb.PurchaseBillDate)) DocDt,',
'                           Max(pb.PurchaseBillDate)',
'                             + coalesce(Max(po.CreditDays), Max(pty.CreditDays)) DueDt',
'                      From PBPass pp',
'                      Join PurchaseBill pb On pb.Tno = pp.PurchaseBillTno',
'                      Left Join PurchaseBillDetail pbd On pbd.Tno = pb.Tno',
'                      Left Join PurchaseOrder po On po.Tno = pbd.PurchaseOrderTno',
'                      Left Join Party pty On pty.PartyCode = pb.PartyCode',
'                     Group By pp.Tno) pt On v.ModuleCode = ''PBPASS'' And pt.Tno = v.ModuleTno',
'         Left Join (Select jp.Tno Tno,',
'                           coalesce(Max(jb.PartyBillDate), Max(jb.JobBillDate)) DocDt,',
'                           Max(jb.JobBillDate) + nvl(Max(jo.CreditDays),0) DueDt',
'                      From JBPass jp',
'                      Join JobBill jb On jb.Tno = jp.JobBillTno',
'                      Left Join JobOrder jo On jo.Tno = jb.JobOrderTno',
'                     Group By jp.Tno) jt On v.ModuleCode = ''JBPASS'' And jt.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P920_COMPANY  Is Null Or d.CompanyCode  = :P920_COMPANY)',
'          And (:P920_LOCATION Is Null Or d.LocationCode = :P920_LOCATION)),',
'     G As (Select Bkt, Sum(Pay) Amt From Aged Where Pay > 0 Group By Bkt),',
'     Tot As (Select nvl(Sum(Amt),0) T From G)',
'Select ''<div class="ds-apage"><div class="ds-apage-bar">''',
'    || nvl(ListAgg(',
'         Case When g.Amt / Nullif(tot.T,0) >= 0.0005 Then',
'           ''<div class="ds-apage-seg ds-apage-seg--b'' || g.Bkt || ''" style="width:''',
'           || to_char(Round(100 * g.Amt / tot.T,3),''FM990D000'') || ''%" title="''',
'           || Case g.Bkt When 0 Then ''Not Due'' When 1 Then ''1-30 days'' When 2 Then ''31-60 days''',
'                         When 3 Then ''61-90 days'' When 4 Then ''91-180 days'' When 5 Then ''181-365 days''',
'                         When 6 Then ''Over 365 days'' Else ''Cannot Age - no due date on the source document'' End',
'           || '': &#8377;'' || to_char(Round(g.Amt,0),''FM999G99G99G990'') || ''">''',
'           || Case When g.Amt / tot.T >= 0.06',
'                   Then to_char(Round(100 * g.Amt / tot.T,0),''FM990'') || ''%'' End',
'           || ''</div>''',
'         End, '''') Within Group (Order By g.Bkt), '''')',
'    || ''</div><div class="ds-apage-legend">''',
'    || nvl(ListAgg(',
'         ''<span class="ds-apage-key ds-apage-key--b'' || g.Bkt || ''"><i></i>''',
'         || Case g.Bkt When 0 Then ''Not Due'' When 1 Then ''1-30'' When 2 Then ''31-60''',
'                       When 3 Then ''61-90'' When 4 Then ''91-180'' When 5 Then ''181-365''',
'                       When 6 Then ''&gt;365'' Else ''Cannot Age'' End',
'         || '' <b>&#8377;''',
'         || Case When g.Amt >= 10000000 Then to_char(Round(g.Amt/10000000,2),''FM999G990D00'') || '' Cr''',
'                 When g.Amt >= 100000   Then to_char(Round(g.Amt/100000,2),''FM999G990D00'') || '' Lac''',
'                 Else to_char(Round(g.Amt,0),''FM999G99G99G990'') End',
'         || ''</b></span>'', '''') Within Group (Order By g.Bkt), '''')',
'    || ''</div></div>'' As SCALE',
'  From G g Cross Join Tot tot'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION,P920_AGEBASIS'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No open payable in this scope as at the As-of Date.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12802492184301179)
,p_query_column_id=>1
,p_column_alias=>'SCALE'
,p_column_display_sequence=>10
,p_column_heading=>'SCALE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12802591857301179)
,p_name=>'Measurement Basis'
,p_static_id=>'basis-note'
,p_template=>4072358936313175081
,p_display_sequence=>24
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* A REPORT, not static text. Each note is emitted only when the',
'   condition it describes is actually true in the current scope, so a',
'   reader never sees a caveat that does not apply to what is on screen',
'   - and never misses one that does. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P920_TODATE,''DD-MM-RRRR'') D From dual),',
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
'     Item As (',
'       Select (d.Amount - nvl(al.Amt,0)) Pay,',
'              coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) DueDate',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join (Select pp.Tno Tno,',
'                           coalesce(Max(pb.PartyBillDate), Max(pb.PurchaseBillDate)) DocDt,',
'                           Max(pb.PurchaseBillDate)',
'                             + coalesce(Max(po.CreditDays), Max(pty.CreditDays)) DueDt',
'                      From PBPass pp',
'                      Join PurchaseBill pb On pb.Tno = pp.PurchaseBillTno',
'                      Left Join PurchaseBillDetail pbd On pbd.Tno = pb.Tno',
'                      Left Join PurchaseOrder po On po.Tno = pbd.PurchaseOrderTno',
'                      Left Join Party pty On pty.PartyCode = pb.PartyCode',
'                     Group By pp.Tno) pt On v.ModuleCode = ''PBPASS'' And pt.Tno = v.ModuleTno',
'         Left Join (Select jp.Tno Tno,',
'                           coalesce(Max(jb.PartyBillDate), Max(jb.JobBillDate)) DocDt,',
'                           Max(jb.JobBillDate) + nvl(Max(jo.CreditDays),0) DueDt',
'                      From JBPass jp',
'                      Join JobBill jb On jb.Tno = jp.JobBillTno',
'                      Left Join JobOrder jo On jo.Tno = jb.JobOrderTno',
'                     Group By jp.Tno) jt On v.ModuleCode = ''JBPASS'' And jt.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P920_COMPANY  Is Null Or d.CompanyCode  = :P920_COMPANY)',
'          And (:P920_LOCATION Is Null Or d.LocationCode = :P920_LOCATION)),',
'     Cov As (',
'       Select nvl(Sum(Case When Pay > 0 Then Pay Else 0 End),0) Gross,',
'              nvl(Sum(Case When Pay > 0 And DueDate Is Null Then Pay Else 0 End),0) NoDue',
'         From Item)',
'Select NOTE From (',
'  /* 1. As-of Date earlier than the ledger itself. Returning a number',
'        here would be worse than returning nothing: it would look real',
'        and be built from whatever the carry-forward happens to hold. */',
'  Select 10 Ord,',
'         ''<div class="ds-apnote ds-apnote--stop"><span class="fa fa-ban"></span><div>''',
'      || ''<b>The As-of Date is before this ledger begins.</b> VoucherDetail holds ''',
'      || to_char((Select Min(VoucherDate) From VoucherDetail),''DD-MM-RRRR'')',
'      || '' onward and prior-year payables arrive as OPENING journals dated 31-03-2026. ''',
'      || ''A position dated earlier than 01-04-2026 is not a valid historical AP balance and the figures above should not be relied on.''',
'      || ''</div></div>'' NOTE',
'    From dual',
'   Where to_date(:P920_TODATE,''DD-MM-RRRR'') < date ''2026-04-01''',
'  Union All',
'  /* 2. Due-date coverage. Only shown on the Due basis, because on the',
'        Document basis it is not the limitation that bites. */',
'  Select 20,',
'         ''<div class="ds-apnote ds-apnote--warn"><span class="fa fa-hourglass-half"></span><div>''',
'      || ''<b>Ageing basis: Due Date.</b> A due date exists only where a document supplies one - PurchaseBillDate plus the purchase order&rsquo;s credit days (terms exist on 2,471 of 4,762 orders), the job-bill equivalent, or a migrated AccountOpening'
||'.BillDueDate. Vendor-level terms cannot fill the gap ''',
'      || ''(Party.CreditDays is set on 2 creditor accounts, Party.CreditAmount on none). ''',
'      || ''In this scope <b>&#8377;'' || to_char(Round(c.NoDue,0),''FM999G99G99G990'') || ''</b> of &#8377;''',
'      || to_char(Round(c.Gross,0),''FM999G99G99G990'') || '' (''',
'      || to_char(Round(100 * c.NoDue / Nullif(c.Gross,0),1),''FM990D0'') || ''%) has no due date. ''',
'      || ''It is shown in its own <b>Cannot Age</b> bucket - not spread across the others, and not dropped. ''',
'      || ''Switch the basis to <b>Document date</b> to age every item by its own age instead of its lateness.''',
'      || ''</div></div>''',
'    From Cov c',
'   Where nvl(:P920_AGEBASIS,''DUE'') = ''DUE'' And c.NoDue > 0',
'  Union All',
'  /* 3. Document basis is age, not lateness. Said plainly, because the',
'        buckets look identical to the Due-basis ones. */',
'  Select 21,',
'         ''<div class="ds-apnote"><span class="fa fa-info-circle"></span><div>''',
'      || ''<b>Ageing basis: Document Date.</b> Buckets measure how <i>old</i> an item is, not how <i>late</i> it is - ''',
'      || ''every open item can be aged this way, so nothing falls into Cannot Age, but an item inside its credit period is counted alongside one that is genuinely overdue. ''',
'      || ''This is the basis every existing iBOSS creditors report uses (pages 619, 170, 463, 495). Switch to <b>Due date</b> for true lateness on the ''',
'      || to_char(Round(100 * (c.Gross - c.NoDue) / Nullif(c.Gross,0),1),''FM990D0'') || ''% of value that carries one.''',
'      || ''</div></div>''',
'    From Cov c',
'   Where :P920_AGEBASIS = ''DOC''',
'  Union All',
'  /* 4. The ageing horizon. Only raised when the reader is actually',
'        looking at the oldest buckets, i.e. always on this page. */',
'  Select 30,',
'         ''<div class="ds-apnote"><span class="fa fa-history"></span><div>''',
'      || ''<b>Ageing beyond 31-03-2026 exists only where the migration kept an original bill date.</b> ''',
'      || ''Prior-year payables enter as OPENING journals dated at the cutover; 716 of 2,082 such lines carry an original AccountOpening.BillDate ''',
'      || ''and are aged from it. The remaining 1,366 are floored at the cutover, so their true age is understated - ''',
'      || ''they are listed under control <b>AP-O01</b>.''',
'      || ''</div></div>''',
'    From dual',
'   Where to_date(:P920_TODATE,''DD-MM-RRRR'') >= date ''2026-04-01''',
') Order By Ord'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION,P920_AGEBASIS'
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
 p_id=>wwv_flow_imp.id(12802631565301179)
,p_query_column_id=>1
,p_column_alias=>'NOTE'
,p_column_display_sequence=>10
,p_column_heading=>'NOTE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12802769873301179)
,p_plug_name=>'Bills Booked vs Payments Made'
,p_static_id=>'billing-collection'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>52
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* A flow chart, not a balance chart: it is bounded by From/To, not by',
'   the As-of Date. Bills booked is the credit side of the bill-class',
'   vouchers (purchase, job, freight, cash purchase, necessity, service);',
'   payments is the debit side of PAYMENT/CASHPAYMENT/BANKPAYMENT',
'   vouchers regardless of channel, so bank-statement uploads count too.',
'   Debit notes are shown separately rather than netted into bookings,',
'   because a fall in bookings and a debit note are different events. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Mv As (',
'       Select trunc(d.VoucherDate,''MM'') Mth,',
'              Sum(Case When d.Amount > 0',
'                        And (v.ModuleCode In (''PBPASS'',''JBPASS'',''FREIGHTADVICE'',''CASHPURCHASE'',',
'                                              ''NECESSITYCOMPLETION'',''NECESSITYSLIP'',''EXTERNALSERVICESENTRY'')',
'                             Or v.DocTypeCode = ''SERVICEBILL'')',
'                       Then d.Amount Else 0 End) Billing,',
'              Sum(Case When v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'') And d.Amount < 0',
'                       Then -d.Amount Else 0 End) Collection,',
'              Sum(Case When v.DocTypeCode = ''DEBITNOTE'' And d.Amount < 0',
'                       Then -d.Amount Else 0 End) CreditNotes',
'         From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate >= to_date(:P920_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P920_TODATE,''DD-MM-RRRR'') + 1',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P920_COMPANY  Is Null Or d.CompanyCode  = :P920_COMPANY)',
'          And (:P920_LOCATION Is Null Or d.LocationCode = :P920_LOCATION)',
'        Group By trunc(d.VoucherDate,''MM''))',
'Select to_char(Mth,''Mon-RR'') As LABEL,',
'       Round(Billing/100000,2) As BILLING_LAC,',
'       Round(Collection/100000,2) As COLLECTION_LAC,',
'       Round(CreditNotes/100000,2) As CREDITNOTE_LAC',
'  From Mv Order By Mth'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12802826257301179)
,p_region_id=>wwv_flow_imp.id(12802769873301179)
,p_chart_type=>'bar'
,p_height=>'330'
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
,p_no_data_found_message=>'Nothing was booked or paid in this period for the selected scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12802900655301179)
,p_chart_id=>wwv_flow_imp.id(12802826257301179)
,p_static_id=>'billing'
,p_seq=>10
,p_name=>unistr('Bills Booked (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'BILLING_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12803051436301179)
,p_chart_id=>wwv_flow_imp.id(12802826257301179)
,p_static_id=>'collection'
,p_seq=>20
,p_name=>unistr('Payments Made (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'COLLECTION_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12803101461301179)
,p_chart_id=>wwv_flow_imp.id(12802826257301179)
,p_static_id=>'creditnotes'
,p_seq=>30
,p_name=>unistr('Debit Notes (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'CREDITNOTE_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12803285672301179)
,p_chart_id=>wwv_flow_imp.id(12802826257301179)
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
 p_id=>wwv_flow_imp.id(12803368520301179)
,p_chart_id=>wwv_flow_imp.id(12802826257301179)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('\20B9 Lac')
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
 p_id=>wwv_flow_imp.id(12803478767301194)
,p_plug_name=>'What the Open Balance Is Made Of'
,p_static_id=>'class-mix'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>42
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Gross Payable is the control account, and the control account is',
'   not all trade bills. Payments MADE to a vendor (advances and',
'   unapplied cash), sales TO a vendor (this is a contra-trading',
'   business) and opening carry-forward all sit inside it. Presenting',
'   the total without this breakdown is the fastest way to have a CFO',
'   pay a "bill" that is really an unapplied payment one row away. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P920_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Select (d.Amount - nvl(al.Amt,0)) Pay,',
'              Case When v.VoucherNo = ''OPENING''          Then ''Opening Carry-forward''',
'                   When v.ModuleCode = ''PBPASS''          Then ''Purchase Bill''',
'                   When v.ModuleCode = ''JBPASS''          Then ''Job Bill''',
'                   When v.ModuleCode = ''FREIGHTADVICE''   Then ''Freight Bill''',
'                   When v.ModuleCode = ''CASHPURCHASE''    Then ''Cash Purchase''',
'                   When v.ModuleCode In (''NECESSITYCOMPLETION'',''NECESSITYSLIP'')',
'                                                         Then ''Necessity Expense''',
'                   When v.ModuleCode = ''EXTERNALSERVICESENTRY''',
'                     Or v.DocTypeCode = ''SERVICEBILL''    Then ''Service Bill''',
'                   When v.ModuleCode = ''DEBITNOTE''',
'                     Or v.DocTypeCode = ''DEBITNOTE''      Then ''Debit Note''',
'                   When v.ModuleCode = ''BILLDISCOUNTINGVOUCHER''',
'                                                         Then ''Bill Discounting''',
'                   When v.ModuleCode In (''INVOICE'',''CCINVOICE'')',
'                     Or v.DocTypeCode = ''SALE''           Then ''Contra Sale''',
'                   When v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'                                                         Then ''Payment to Vendor''',
'                   When v.DocTypeCode = ''RECEIPT''        Then ''Receipt / Credit-in''',
'                   Else ''Journal'' End Cls',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P920_COMPANY  Is Null Or d.CompanyCode  = :P920_COMPANY)',
'          And (:P920_LOCATION Is Null Or d.LocationCode = :P920_LOCATION))',
'Select Cls As LABEL,',
'       Round(Sum(Case When Pay > 0 Then Pay Else 0 End)/100000,2) As PAYABLE_LAC,',
'       Round(Sum(Case When Pay < 0 Then -Pay Else 0 End)/100000,2) As DEBIT_LAC',
'  From Oi',
' Group By Cls',
'Having Sum(Abs(Pay)) > 0.005',
' Order By Sum(Abs(Pay)) Desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION,P920_AGEBASIS'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12803572442301195)
,p_region_id=>wwv_flow_imp.id(12803478767301194)
,p_chart_type=>'bar'
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
,p_no_data_found_message=>'No open item in this scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12803680750301195)
,p_chart_id=>wwv_flow_imp.id(12803572442301195)
,p_static_id=>'credit'
,p_seq=>20
,p_name=>unistr('Vendor Debit (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'DEBIT_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12803756141301195)
,p_chart_id=>wwv_flow_imp.id(12803572442301195)
,p_static_id=>'payable'
,p_seq=>10
,p_name=>unistr('Payable (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'PAYABLE_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12803882859301195)
,p_chart_id=>wwv_flow_imp.id(12803572442301195)
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
 p_id=>wwv_flow_imp.id(12803909733301195)
,p_chart_id=>wwv_flow_imp.id(12803572442301195)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('Open Balance (\20B9 Lac)')
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
 p_id=>wwv_flow_imp.id(12804021107301195)
,p_name=>'Accounts Payable Command Centre'
,p_static_id=>'command-header'
,p_template=>4072358936313175081
,p_display_sequence=>5
,p_region_css_classes=>'ds-ap-headregion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''<div class="ds-ap-head">''',
'    || ''<div class="ds-ap-eyebrow">Finance &middot; Accounts Payable</div>''',
'    || ''<h1 class="ds-ap-title">Accounts Payable Command Centre</h1>''',
'    || ''<div class="ds-ap-sub">Outstanding payable, due and overdue, payments, vendor advances, unbilled liability, reconciliation to the general ledger and the control exceptions behind every number</div>''',
'    || ''<div class="ds-ap-context">''',
'    /* Balances are AS AT To Date; flows are BETWEEN the two. Saying',
'       so in the header is the cheapest way to stop a reader assuming',
'       outstanding was filtered to the period, which is the single',
'       most common misreading of an AP dashboard. */',
'    || ''<span class="ds-ap-chip"><span class="fa fa-crosshairs"></span>Outstanding as at <b>''',
'       || :P920_TODATE || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-calendar"></span>Flows <b>''',
'       || :P920_FROMDATE || '' &rarr; '' || :P920_TODATE || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-hourglass-half"></span>Ageing basis <b>''',
'       || Case When :P920_AGEBASIS = ''DOC'' Then ''Document date (age)''',
'               Else ''Due date (lateness)'' End || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P920_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P920_LOCATION),''All locations'')) || ''</b></span>''',
'    /* There is no currency, exchange-rate or conversion column',
'       anywhere in the voucher chain. Stating it beats letting a',
'       reader assume a conversion happened. */',
'    || ''<span class="ds-ap-chip"><span class="fa fa-money"></span>Currency <b>INR (base, single-currency ledger)</b></span>''',
'    || ''<span class="ds-ap-chip ds-ap-chip--live"><span class="fa fa-clock-o"></span>Last posting <b>''',
'       || nvl((Select to_char(Max(d.VoucherDate),''DD-MM-RRRR'')',
'                 From VoucherDetail d',
'                Where d.AccountCode In (Select PartyCode From Party',
'                        Start With PartyCode = ''SUNDRYCREDITORS'' Connect By Prior PartyCode = ParentCode)',
'                  And (cast(null as varchar2(100)) Is Null Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'                  And (null    Is Null Or cast(null as varchar2(100))        = null)',
'                  And (:P920_COMPANY  Is Null Or d.CompanyCode  = :P920_COMPANY)',
'                  And (:P920_LOCATION Is Null Or d.LocationCode = :P920_LOCATION)),''no postings'') || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION,P920_AGEBASIS'
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
 p_id=>wwv_flow_imp.id(12804162087301195)
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
 p_id=>wwv_flow_imp.id(12804291176301195)
,p_plug_name=>'Vendor Concentration'
,p_static_id=>'concentration'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>47
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Concentration as four mutually exclusive bands that together make the',
'   whole gross payable - which is what makes a donut legitimate here.',
'   A donut over overlapping or partial measures would be misleading, so',
'   the bands are built to be exhaustive. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P920_TODATE,''DD-MM-RRRR'') D From dual),',
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
'     G As (',
'       Select d.AccountCode Pty,',
'              Sum(Case When (d.Amount - nvl(al.Amt,0)) > 0',
'                       Then (d.Amount - nvl(al.Amt,0)) Else 0 End) Dr',
'         From VoucherDetail d',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P920_COMPANY  Is Null Or d.CompanyCode  = :P920_COMPANY)',
'          And (:P920_LOCATION Is Null Or d.LocationCode = :P920_LOCATION)',
'        Group By d.AccountCode),',
'     R As (Select Pty, Dr, Row_Number() Over (Order By Dr Desc) Rn From G Where Dr > 0.005)',
'Select Band As LABEL, Round(Sum(Dr)/10000000,2) As EXPOSURE_CR',
'  /* The band labels are numbered because a DONUT in this APEX',
'     version always sorts by label ascending - verified against the',
'     live app, where all 40 donuts and all 42 pies read',
'     "Label - Ascending" and not one reads (null), so the',
'     multiSeriesChartData trick that frees a bar chart does not',
'     apply here. Unnumbered, the segments would read "All other',
'     vendors, Rank 11-25, Rank 6-10, Top 5" - alphabetical, and the',
'     exact opposite of the concentration story. Numbering makes the',
'     forced label sort produce the intended rank order. */',
'  From (Select Case When Rn <= 5  Then ''1. Top 5 vendors''',
'                    When Rn <= 10 Then ''2. Rank 6-10''',
'                    When Rn <= 25 Then ''3. Rank 11-25''',
'                    Else ''4. All other vendors'' End Band, Dr',
'          From R)',
' Group By Band',
' Order By Band'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12804345047301195)
,p_region_id=>wwv_flow_imp.id(12804291176301195)
,p_chart_type=>'donut'
,p_height=>'340'
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
,p_no_data_found_message=>'No vendor carries an open payable in this scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12804421698301195)
,p_chart_id=>wwv_flow_imp.id(12804345047301195)
,p_static_id=>'band'
,p_seq=>10
,p_name=>unistr('Gross Payable (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'donut'
,p_items_value_column_name=>'EXPOSURE_CR'
,p_items_label_column_name=>'LABEL'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12804577683301195)
,p_name=>'Exceptions and Controls'
,p_static_id=>'control-summary'
,p_template=>4072358936313175081
,p_display_sequence=>60
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Headline counts only. Every one of them is a link into page 715,',
'   where the identical predicate produces the row set - the count and',
'   the drill-down cannot disagree because they are the same WHERE',
'   clause, proved in docs/sql/ap-reconciliation.sql. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     C As (',
'       Select',
'         (Select Count(*) From PBPass p',
'           Where Not Exists (Select 1 From Voucher v',
'                              Where v.ModuleCode = ''PBPASS'' And v.ModuleTno = p.Tno)) Unposted,',
'         (Select Count(*) From (Select PartyCode, upper(trim(PartyBillNo)) Pb',
'                                  From PurchaseBill Where PartyBillNo Is Not Null',
'                                 Group By PartyCode, upper(trim(PartyBillNo)) Having Count(*) > 1)) Dup,',
'         (Select Count(*) From DrCrAllocation a',
'            Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'            Join VoucherDetail dc On dc.Tno = a.CrVoucherTno And dc.Sno = a.CrVoucherSno',
'           Where dd.CompanyCode <> dc.CompanyCode',
'             And (dd.AccountCode In (Select PartyCode From Sd)',
'                  Or dc.AccountCode In (Select PartyCode From Sd))) CrossCmp,',
'         (Select Count(*) From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
'            Left Join AccountOpening ao On ao.Tno = d.ModuleTno',
'           Where d.AccountCode In (Select PartyCode From Sd)',
'             And v.VoucherNo = ''OPENING'' And ao.BillDate Is Null) OpenNoDate',
'         From dual)',
'Select ''<a class="ds-kpi ds-kpi--risk" href="''',
'    || apex_page.get_url(p_page => 927, p_clear_cache => ''927'',',
'         p_items => ''P927_FROMDATE,P927_TODATE,P927_COMPANY,P927_LOCATION,P927_CONTROL'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',AP-B01'')',
'    || ''" title="Bill passes approved in the ERP but never posted to the ledger - the general ledger understates liability by exactly these documents.">''',
'    || ''<span class="ds-kpi-ic fa fa-chain-broken"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Passes Not Posted</div><div class="ds-kpi-n">'' || to_char(c.Unposted,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AP-B01 &middot; approved liability missing from the GL</div></div></a>'' As C1,',
'       ''<a class="ds-kpi ds-kpi--amber" href="''',
'    || apex_page.get_url(p_page => 927, p_clear_cache => ''927'',',
'         p_items => ''P927_FROMDATE,P927_TODATE,P927_COMPANY,P927_LOCATION,P927_CONTROL'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',AP-B05'')',
'    || ''" title="The same supplier bill number booked more than once for one vendor - the classic duplicate-invoice control. Some groups are legitimate part-series; every one deserves a look.">''',
'    || ''<span class="ds-kpi-ic fa fa-copy"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Duplicate Supplier Bill Numbers</div><div class="ds-kpi-n">'' || to_char(c.Dup,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AP-B05 &middot; bill-number groups within a vendor</div></div></a>'' As C2,',
'       ''<a class="ds-kpi ds-kpi--struct" href="''',
'    || apex_page.get_url(p_page => 927, p_clear_cache => ''927'',',
'         p_items => ''P927_FROMDATE,P927_TODATE,P927_COMPANY,P927_LOCATION,P927_CONTROL'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',AP-O01'')',
'    || ''" title="Opening carry-forward payables whose original bill date did not survive migration. Their age is floored at the 31-03-2026 cutover and is therefore understated.">''',
'    || ''<span class="ds-kpi-ic fa fa-history"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Opening AP, Age Understated</div><div class="ds-kpi-n">'' || to_char(c.OpenNoDate,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AP-O01 &middot; no original bill date preserved</div></div></a>'' As C3,',
'       ''<a class="ds-kpi ds-kpi--teal" href="''',
'    || apex_page.get_url(p_page => 928, p_clear_cache => ''928'',',
'         p_items => ''P928_FROMDATE,P928_TODATE,P928_COMPANY,P928_LOCATION'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION)',
'    || ''" title="Analytical AP against the SUNDRYCREDITORS general-ledger control account, executed rather than asserted. One allocation crosses a company (Rs 3,565) and is named there.">''',
'    || ''<span class="ds-kpi-ic fa fa-balance-scale"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">AP vs GL Reconciliation</div><div class="ds-kpi-n"><span style="font-size:17px">Open</span></div>''',
'    || ''<div class="ds-kpi-sub">full tie-out by company, location and vendor &middot; ''',
'    || to_char(c.CrossCmp,''FM999G990'') || '' cross-company allocation</div></div></a>'' As C4',
'  From C c'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION'
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
 p_id=>wwv_flow_imp.id(12804603279301195)
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
 p_id=>wwv_flow_imp.id(12804773747301195)
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
 p_id=>wwv_flow_imp.id(12804897327301195)
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
 p_id=>wwv_flow_imp.id(12804923818301195)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12805011308301195)
,p_plug_name=>'Exception Trend'
,p_static_id=>'exception-trend'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>49
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Exceptions plotted by the TRANSACTION date of the offending record,',
'   because this ERP keeps no exception log and therefore no detection',
'   date. The chart answers "which months are generating exceptions",',
'   not "when were they found" - and the axis title says so. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P920_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Select d.VoucherDate Vdt, v.DocTypeCode Dtc, v.VoucherNo Vno,',
'              (d.Amount - nvl(al.Amt,0)) Pay,',
'              coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) DueDate,',
'              ao.BillDate AoBillDate',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join (Select pp.Tno Tno,',
'                           coalesce(Max(pb.PartyBillDate), Max(pb.PurchaseBillDate)) DocDt,',
'                           Max(pb.PurchaseBillDate)',
'                             + coalesce(Max(po.CreditDays), Max(pty.CreditDays)) DueDt',
'                      From PBPass pp',
'                      Join PurchaseBill pb On pb.Tno = pp.PurchaseBillTno',
'                      Left Join PurchaseBillDetail pbd On pbd.Tno = pb.Tno',
'                      Left Join PurchaseOrder po On po.Tno = pbd.PurchaseOrderTno',
'                      Left Join Party pty On pty.PartyCode = pb.PartyCode',
'                     Group By pp.Tno) pt On v.ModuleCode = ''PBPASS'' And pt.Tno = v.ModuleTno',
'         Left Join (Select jp.Tno Tno,',
'                           coalesce(Max(jb.PartyBillDate), Max(jb.JobBillDate)) DocDt,',
'                           Max(jb.JobBillDate) + nvl(Max(jo.CreditDays),0) DueDt',
'                      From JBPass jp',
'                      Join JobBill jb On jb.Tno = jp.JobBillTno',
'                      Left Join JobOrder jo On jo.Tno = jb.JobOrderTno',
'                     Group By jp.Tno) jt On v.ModuleCode = ''JBPASS'' And jt.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P920_COMPANY  Is Null Or d.CompanyCode  = :P920_COMPANY)',
'          And (:P920_LOCATION Is Null Or d.LocationCode = :P920_LOCATION))',
'Select to_char(trunc(Vdt,''MM''),''Mon-RR'')                                     As LABEL,',
'       Sum(Case When Pay > 0 And DueDate Is Null Then 1 Else 0 End)         As CANNOT_AGE,',
'       Sum(Case When Dtc In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'') And Pay < -0.005',
'                 And (Select D From Asof) - Vdt > 90 Then 1 Else 0 End)      As OLD_UNAPPLIED,',
'       Sum(Case When Vno = ''OPENING'' And AoBillDate Is Null',
'                 And Abs(Pay) > 0.005 Then 1 Else 0 End)                    As OPENING_NO_DATE',
'  From Oi',
' Where Vdt >= to_date(:P920_FROMDATE,''DD-MM-RRRR'')',
' Group By trunc(Vdt,''MM'')',
' Order By trunc(Vdt,''MM'')'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12805183394301195)
,p_region_id=>wwv_flow_imp.id(12805011308301195)
,p_chart_type=>'bar'
,p_height=>'330'
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
,p_no_data_found_message=>'No exception-bearing transaction in this window.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12805266025301195)
,p_chart_id=>wwv_flow_imp.id(12805183394301195)
,p_static_id=>'cannotage'
,p_seq=>10
,p_name=>'Cannot Age (items)'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'CANNOT_AGE'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12805357558301195)
,p_chart_id=>wwv_flow_imp.id(12805183394301195)
,p_static_id=>'oldcash'
,p_seq=>20
,p_name=>'Old Unapplied Payments (items)'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'OLD_UNAPPLIED'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12805463871301195)
,p_chart_id=>wwv_flow_imp.id(12805183394301195)
,p_static_id=>'opennodate'
,p_seq=>30
,p_name=>'Opening, No Bill Date (items)'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'OPENING_NO_DATE'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12805514255301195)
,p_chart_id=>wwv_flow_imp.id(12805183394301195)
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
 p_id=>wwv_flow_imp.id(12805635928301195)
,p_chart_id=>wwv_flow_imp.id(12805183394301195)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Exception items, by transaction month'
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
 p_id=>wwv_flow_imp.id(12805739141301195)
,p_plug_name=>'Measures This ERP Cannot Support'
,p_static_id=>'excluded'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>64
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-apnote"><span class="fa fa-info-circle"></span><div>',
'  <b>Four measures a payables dashboard would normally carry are not shown here, because the data to compute them does not exist.</b>',
'  Showing them as zero would be a lie; omitting them silently would invite someone to ask for them again.',
'</div></div>',
'<div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(240px,1fr));gap:12px">',
'  <div class="ds-apexcl">',
'    <div class="ds-apexcl-h">Credit Limit &amp; Credit Utilisation %</div>',
'    <div class="ds-apexcl-b"><code>Party.CreditAmount</code> is greater than zero on <b>0</b> creditor accounts. There is no limit to compare exposure against, so no utilisation percentage and no &ldquo;vendors above credit limit&rdquo; control is of'
||'fered.</div>',
'  </div>',
'  <div class="ds-apexcl">',
'    <div class="ds-apexcl-h">Vendor-Level Credit Days</div>',
'    <div class="ds-apexcl-b"><code>Party.CreditDays</code> is greater than zero on <b>2</b> creditor accounts. Due dates therefore come from the documents - PurchaseBillDate plus the purchase order&rsquo;s credit days (terms on 2,471 of 4,762 orders)'
||' or a migrated opening due date - and everything else is marked <b>Cannot Age</b>, never &ldquo;due tomorrow&rdquo;.</div>',
'  </div>',
'  <div class="ds-apexcl">',
'    <div class="ds-apexcl-h">Payment Mode Across All Channels</div>',
'    <div class="ds-apexcl-b"><code>MoneyTransferModeCode</code> exists only on <code>PaymentAdvice</code> (99.7% coverage there) - but advices carry only ~30% of payment value; bank-statement uploads (<b>&#8377;114 Cr</b>) and direct vouchers carry n'
||'one. The Payments page therefore shows mode for advice-routed payments with the coverage stated, and analyses <b>Bank</b> - derived from the payment voucher&rsquo;s contra line - across 100% of payments.</div>',
'  </div>',
'  <div class="ds-apexcl">',
'    <div class="ds-apexcl-h">Reversed / Cancelled Payments</div>',
'    <div class="ds-apexcl-b"><code>VOUCHER</code> carries no approval, posting, draft, cancellation or reversal column, and <code>VoucherReferenceDetailReversal</code> is empty. Deletion is this ERP&rsquo;s only cancellation mechanism; its trace is o'
||'rphan allocations, of which <b>zero</b> touch the creditors control account today - the exceptions page keeps watching for one.</div>',
'  </div>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12805834540301196)
,p_name=>'Payable Position'
,p_static_id=>'exposure'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* THE CANONICAL AP PROLOGUE. Reproduced verbatim in every region on',
'   every AP page; specified once in docs/ap-dashboard/AP_KPI_DEFINITION.md.',
'   It is a copied CTE and not a view because this repository forbids',
'   DDL absolutely - docs/ap-dashboard/AP_SYSTEM_AUDIT.md.',
'   docs/sql/ap-reconciliation.sql proves every region agrees with it. */',
'With Sd As (',
'       /* AP is the SUNDRYCREDITORS control account. No voucher line ever',
'          posts to a group node in this ERP, so the control account''s',
'          balance IS the sum of its members - which is what makes the',
'          tie-out below possible at all. */',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P920_TODATE,''DD-MM-RRRR'') D From dual),',
'     Alc As (',
'       /* DrCrAllocation.Amount is ALWAYS positive; it is applied as',
'          -Amount to the debit line and +Amount to the credit line.',
'          Joining BOTH voucher headers does two things: it enforces the',
'          as-of rule, and it excludes orphan allocations whose voucher',
'          no longer exists. Unlike the AR side, ZERO of the 25 orphans',
'          touch this control account (measured 17-08-2026), so the AP',
'          tie needs no exclusion caveat - the join is kept because it',
'          is what keeps the tie safe if an orphan ever appears here. */',
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
'       Select d.AccountCode Pty, (d.Amount - nvl(al.Amt,0)) Pay',
'         From VoucherDetail d',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P920_COMPANY  Is Null Or d.CompanyCode  = :P920_COMPANY)',
'          And (:P920_LOCATION Is Null Or d.LocationCode = :P920_LOCATION)),',
'     Gl As (',
'       /* The control account taken straight off the ledger, with no',
'          allocation logic at all. Computed INSIDE this statement so',
'          both sides see one read-consistent snapshot - the ERP is',
'          live and two statements minutes apart legitimately differ. */',
'       Select Sum(d.Amount) Ctl',
'         From VoucherDetail d Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P920_COMPANY  Is Null Or d.CompanyCode  = :P920_COMPANY)',
'          And (:P920_LOCATION Is Null Or d.LocationCode = :P920_LOCATION)),',
'     T As (',
'       Select nvl(Sum(Case When Pay > 0 Then Pay Else 0 End),0) Gross,',
'              nvl(Sum(Case When Pay < 0 Then -Pay Else 0 End),0) Cred,',
'              nvl(Sum(Pay),0) Net,',
'              Count(Distinct Case When Pay > 0 Then Pty End) DrPty,',
'              Count(Distinct Case When Pay < 0 Then Pty End) CrPty',
'         From Oi)',
'Select ''<div class="ds-apexp">''',
'    || ''<div class="ds-apexp-cell ds-apexp-cell--pay">''',
'    || ''<dl><dt>Gross Outstanding Payable</dt><dd>&#8377;''',
'    || Case When t.Gross >= 10000000 Then to_char(Round(t.Gross/10000000,2),''FM999G990D00'') || '' Cr''',
'            When t.Gross >= 100000   Then to_char(Round(t.Gross/100000,2),''FM999G990D00'') || '' Lac''',
'            Else to_char(Round(t.Gross,0),''FM999G99G99G990'') End',
'    || ''</dd><div class="ds-apexp-sub">''',
'    || to_char(t.DrPty,''FM999G990'') || '' vendors are owed &middot; open credit items only</div></dl></div>''',
'    /* A vendor debit is NOT a negative payable to be netted away',
'       in the headline. It is money already paid or recoverable that',
'       is not applied to any bill - 241 Cr of unapplied payments plus',
'       contra sales and debit notes against 549 Cr of credits - the',
'       largest single fact on this page. It gets its own cell. */',
'    || ''<div class="ds-apexp-cell ds-apexp-cell--dr">''',
'    || ''<dl><dt>Vendor Debits Held</dt><dd>&#8377;''',
'    || Case When t.Cred >= 10000000 Then to_char(Round(t.Cred/10000000,2),''FM999G990D00'') || '' Cr''',
'            When t.Cred >= 100000   Then to_char(Round(t.Cred/100000,2),''FM999G990D00'') || '' Lac''',
'            Else to_char(Round(t.Cred,0),''FM999G99G99G990'') End',
'    || ''</dd><div class="ds-apexp-sub">''',
'    || to_char(t.CrPty,''FM999G990'') || '' vendors in debit &middot; advances, unapplied payments and contra sales</div></dl></div>''',
'    || ''<div class="ds-apexp-cell ds-apexp-cell--net">''',
'    || ''<dl><dt>Net Vendor Liability</dt><dd>&#8377;''',
'    || Case When Abs(t.Net) >= 10000000 Then to_char(Round(t.Net/10000000,2),''FM999G990D00'') || '' Cr''',
'            When Abs(t.Net) >= 100000   Then to_char(Round(t.Net/100000,2),''FM999G990D00'') || '' Lac''',
'            Else to_char(Round(t.Net,0),''FM999G99G99G990'') End',
'    || ''</dd><div class="ds-apexp-sub">Gross payable less vendor debits</div>''',
'    /* The tie-out is executed, not asserted. Difference is compared at',
'       full precision with a half-paisa tolerance and printed in full',
'       when it breaks - a payables ledger out by four paise is out. */',
'    || Case When Abs(t.Net - g.Ctl) < 0.005',
'            Then ''<span class="ds-apexp-tie ds-apexp-tie--ok"><span class="fa fa-check"></span>Ties to SUNDRYCREDITORS GL control</span>''',
'            Else ''<span class="ds-apexp-tie ds-apexp-tie--bad"><span class="fa fa-exclamation-triangle"></span>GL control differs by &#8377;''',
'                 || to_char(Round(t.Net - g.Ctl,2),''FM999G99G99G990D00'') || ''</span>'' End',
'    || ''</dl></div></div>'' As BAND',
'  From T t Cross Join Gl g'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION,P920_AGEBASIS'
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
 p_id=>wwv_flow_imp.id(12805953882301196)
,p_query_column_id=>1
,p_column_alias=>'BAND'
,p_column_display_sequence=>10
,p_column_heading=>'BAND'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12806096557301196)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p708Filters'
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
 p_id=>wwv_flow_imp.id(12806182793301196)
,p_plug_name=>'Advanced Filters'
,p_static_id=>'filter-drawer'
,p_region_name=>'p708Drawer'
,p_region_css_classes=>'ds-filterdrawer js-dialog-class-t-Drawer--pullOutEnd'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(1662449473392619772)
,p_plug_display_sequence=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12806275648301196)
,p_name=>'Secondary KPIs'
,p_static_id=>'kpi-secondary'
,p_template=>4072358936313175081
,p_display_sequence=>32
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-kpiwrap--5up'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The brief''s secondary KPI set. Every card is derived from the SAME',
'   Aged CTE as the primary strip, so the two strips cannot disagree.',
'   Vendors Above Credit Limit is present as a stated exclusion rather',
'   than omitted - Party.CreditAmount is greater than zero on 0 of the',
'   vendor accounts, so the measure has no input. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P920_TODATE,''DD-MM-RRRR'') D From dual),',
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
'     Aged As (',
'       Select d.AccountCode Pty, d.VoucherDate Vdt, v.DocTypeCode Dtc,',
'              (d.Amount - nvl(al.Amt,0)) Pay,',
'              coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) DueDate,',
'              coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate) DocDate',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join (Select pp.Tno Tno,',
'                           coalesce(Max(pb.PartyBillDate), Max(pb.PurchaseBillDate)) DocDt,',
'                           Max(pb.PurchaseBillDate)',
'                             + coalesce(Max(po.CreditDays), Max(pty.CreditDays)) DueDt',
'                      From PBPass pp',
'                      Join PurchaseBill pb On pb.Tno = pp.PurchaseBillTno',
'                      Left Join PurchaseBillDetail pbd On pbd.Tno = pb.Tno',
'                      Left Join PurchaseOrder po On po.Tno = pbd.PurchaseOrderTno',
'                      Left Join Party pty On pty.PartyCode = pb.PartyCode',
'                     Group By pp.Tno) pt On v.ModuleCode = ''PBPASS'' And pt.Tno = v.ModuleTno',
'         Left Join (Select jp.Tno Tno,',
'                           coalesce(Max(jb.PartyBillDate), Max(jb.JobBillDate)) DocDt,',
'                           Max(jb.JobBillDate) + nvl(Max(jo.CreditDays),0) DueDt',
'                      From JBPass jp',
'                      Join JobBill jb On jb.Tno = jp.JobBillTno',
'                      Left Join JobOrder jo On jo.Tno = jb.JobOrderTno',
'                     Group By jp.Tno) jt On v.ModuleCode = ''JBPASS'' And jt.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P920_COMPANY  Is Null Or d.CompanyCode  = :P920_COMPANY)',
'          And (:P920_LOCATION Is Null Or d.LocationCode = :P920_LOCATION)),',
'     Pty As (',
'       Select Pty, Sum(Case When Pay > 0 Then Pay Else 0 End) Dr',
'         From Aged Group By Pty),',
'     Conc As (Select nvl(Sum(Dr),0) Top10 From (',
'       Select Dr From Pty Where Dr > 0.005 Order By Dr Desc Fetch First 10 Rows Only)),',
'     T As (',
'       Select nvl(Sum(Case When Pay > 0 Then Pay Else 0 End),0) Gross,',
'              nvl(Sum(Case When Pay > 0 And DueDate Is Not Null',
'                            And (Select D From Asof) - DueDate > 180 Then Pay Else 0 End),0) D180,',
'              nvl(Sum(Case When Pay > 0 And DueDate Is Not Null',
'                            And (Select D From Asof) - DueDate > 365 Then Pay Else 0 End),0) D365,',
'              Count(Distinct Case When Pay <> 0 Then Pty End) ActPty,',
'              Count(Distinct Case When Pay > 0 And DueDate < (Select D From Asof) Then Pty End) OdPty,',
'              nvl(Sum(Case When Pay > 0 And DueDate > (Select D From Asof)',
'                            And DueDate <= (Select D From Asof) + 7 Then Pay Else 0 End),0) Due7,',
'              nvl(Sum(Case When Pay > 0 And DueDate > (Select D From Asof)',
'                            And DueDate <= (Select D From Asof) + 30 Then Pay Else 0 End),0) Due30,',
'              nvl(Sum(Case When Pay > 0 And DueDate Is Not Null',
'                       Then Pay * Greatest((Select D From Asof) - DueDate,0) End),0) WSum,',
'              nvl(Sum(Case When Pay > 0 And DueDate Is Not Null Then Pay End),0) WBase,',
'              nvl(Sum(Case When Pay < 0 And Dtc In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'                            And (Select D From Asof) - Vdt > 90 Then -Pay Else 0 End),0) OldCash,',
'              nvl(Sum(Case When Pay > 0 And DueDate = (Select D From Asof) Then Pay Else 0 End),0) DueTdy',
'         From Aged),',
'     Grni As (Select 0 N, 0 Amt From dual),',
'     Appr As (',
'       Select Count(*) N, nvl(Sum(nvl(a.AmountCr,0)),0) Amt',
'         From PaymentAdvice a',
'        Where nvl(a.PaymentDone,''NO'') <> ''YES''',
'          And a.PaymentAdviceDate <= (Select D From Asof)',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P920_COMPANY  Is Null Or a.CompanyCode  = :P920_COMPANY)',
'          And (:P920_LOCATION Is Null Or a.LocationCode = :P920_LOCATION)),',
'     Ex As (',
'       /* COUNTS EXACTLY THE CRITICAL-SEVERITY CONTROLS THIS CARD',
'          LINKS TO, and nothing else. The inherited version added the',
'          Cannot-Age population to this total, which made the card read',
'          8,176 while the drill-down it opens - page 715 filtered to',
'          CRITICAL - returned about 2,400. That is the KPI-versus-',
'          drill-down mismatch the brief forbids and that page 715',
'          claims to make impossible; the claim only holds if the card',
'          counts the same controls the link selects.',
'',
'          Cannot Age is High, not Critical (AP_EXCEPTIONS_CONTROL_MATRIX)',
'          and already has its own card, KPI4, worth Rs 362.80 Cr - so',
'          including it here also double-counted it on the same page.',
'',
'          Critical controls: AP-P03 unapplied over 90 days, AP-B01',
'          pass never posted, AP-A09 cross-company allocation, AP-A07',
'          over-allocation, AP-A05 orphan touching AP (0 today),',
'           */',
'       Select (Select Count(*) From Aged a2 Cross Join Asof',
'                Where a2.Dtc In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'                  And a2.Pay < -0.005 And Asof.D - a2.Vdt > 90)',
'            + (Select Count(*) From PBPass p',
'                Where Not Exists (Select 1 From Voucher v',
'                                   Where v.ModuleCode = ''PBPASS'' And v.ModuleTno = p.Tno))',
'            + (Select Count(*) From DrCrAllocation a',
'                Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'                Join VoucherDetail dc On dc.Tno = a.CrVoucherTno And dc.Sno = a.CrVoucherSno',
'               Where dd.CompanyCode <> dc.CompanyCode',
'                 And (dd.AccountCode In (Select PartyCode From Sd)',
'                   Or dc.AccountCode In (Select PartyCode From Sd)))',
'                  N',
'         From dual)',
'Select ''<a class="ds-kpi ds-kpi--amber" href="''',
'    || apex_page.get_url(p_page => 922, p_clear_cache => ''922'',',
'         p_items => ''P922_FROMDATE,P922_TODATE,P922_COMPANY,P922_LOCATION,P922_AGEBASIS,P922_BUCKET'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',DUE,5'')',
'    || ''" title="Open payable more than 180 days past its due date."><span class="ds-kpi-ic fa fa-hourglass-end"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">180+ Days</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.D180 >= 10000000 Then to_char(Round(t.D180/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.D180/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">past due, not merely old</div></div></a>'' As S1,',
'       ''<a class="ds-kpi ds-kpi--risk" href="''',
'    || apex_page.get_url(p_page => 922, p_clear_cache => ''922'',',
'         p_items => ''P922_FROMDATE,P922_TODATE,P922_COMPANY,P922_LOCATION,P922_AGEBASIS,P922_BUCKET'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',DUE,6'')',
'    || ''" title="Open payable more than 365 days past its due date."><span class="ds-kpi-ic fa fa-fire"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">365+ Days</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.D365 >= 10000000 Then to_char(Round(t.D365/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.D365/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">the oldest exposure carried</div></div></a>'' As S2,',
'       ''<a class="ds-kpi ds-kpi--teal" href="''',
'    || apex_page.get_url(p_page => 921, p_clear_cache => ''921'',',
'         p_items => ''P921_FROMDATE,P921_TODATE,P921_COMPANY,P921_LOCATION,P921_AGEBASIS,P921_FOCUS'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',DUE,ALL'')',
'    || ''" title="Vendors carrying any non-zero position - debit, credit or both."><span class="ds-kpi-ic fa fa-users"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Active Vendors</div><div class="ds-kpi-n">''',
'    || to_char(t.ActPty,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">with a live position</div></div></a>'' As S3,',
'       ''<a class="ds-kpi ds-kpi--amber" href="''',
'    || apex_page.get_url(p_page => 921, p_clear_cache => ''921'',',
'         p_items => ''P921_FROMDATE,P921_TODATE,P921_COMPANY,P921_LOCATION,P921_AGEBASIS,P921_FOCUS'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',DUE,OVERDUE'')',
'    || ''" title="Vendors with at least one item past its due date."><span class="ds-kpi-ic fa fa-user-times"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Overdue Vendors</div><div class="ds-kpi-n">''',
'    || to_char(t.OdPty,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">of '' || to_char(t.ActPty,''FM999G990'') || '' active</div></div></a>'' As S4,',
'       ''<a class="ds-kpi ds-kpi--ok" href="''',
'    || apex_page.get_url(p_page => 922, p_clear_cache => ''922'',',
'         p_items => ''P922_FROMDATE,P922_TODATE,P922_COMPANY,P922_LOCATION,P922_AGEBASIS,P922_BUCKET'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',DUE,D7'')',
'    || ''" title="Payable whose due date falls within seven days of the As-of Date. Due-date basis only. Opens the bills behind it."><span class="ds-kpi-ic fa fa-calendar-o"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Due Next 7 Days</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Due7 >= 10000000 Then to_char(Round(t.Due7/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Due7/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">cash needed this week</div></div></a>'' As S5,',
'       ''<a class="ds-kpi ds-kpi--ok" href="''',
'    || apex_page.get_url(p_page => 922, p_clear_cache => ''922'',',
'         p_items => ''P922_FROMDATE,P922_TODATE,P922_COMPANY,P922_LOCATION,P922_AGEBASIS,P922_BUCKET'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',DUE,D30'')',
'    || ''" title="Payable whose due date falls within thirty days of the As-of Date. Due-date basis only. Opens the bills behind it."><span class="ds-kpi-ic fa fa-calendar"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Due Next 30 Days</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Due30 >= 10000000 Then to_char(Round(t.Due30/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Due30/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">cash needed this month</div></div></a>'' As S6,',
'       ''<a class="ds-kpi ds-kpi--struct" href="''',
'    || apex_page.get_url(p_page => 922, p_clear_cache => ''922'',',
'         p_items => ''P922_FROMDATE,P922_TODATE,P922_COMPANY,P922_LOCATION,P922_AGEBASIS,P922_BUCKET'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',DUE,WTD'')',
'    || ''" title="Days overdue weighted by amount. Items with no due date are excluded from BOTH sides of the average, so it is not diluted by what cannot be aged. Opens exactly that population - read the Days Overdue column."><span class="ds-kpi-ic f'
||'a fa-balance-scale"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Weighted Days Overdue</div><div class="ds-kpi-n">''',
'    || nvl(to_char(Round(t.WSum / Nullif(t.WBase,0),0),''FM999G990''),''&mdash;'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">over aged items only</div></div></a>'' As S7,',
'       ''<a class="ds-kpi ds-kpi--gold" href="''',
'    || apex_page.get_url(p_page => 921, p_clear_cache => ''921'',',
'         p_items => ''P921_FROMDATE,P921_TODATE,P921_COMPANY,P921_LOCATION,P921_AGEBASIS,P921_FOCUS'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',DUE,ALL'')',
'    || ''" title="Share of gross payable held by the ten largest vendors."><span class="ds-kpi-ic fa fa-pie-chart"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Top 10 Concentration</div><div class="ds-kpi-n">''',
'    || nvl(to_char(Round(100 * c.Top10 / Nullif(t.Gross,0),1),''FM990D0''),''&mdash;'') || ''%</div>''',
'    || ''<div class="ds-kpi-sub">&#8377;''',
'    || Case When c.Top10 >= 10000000 Then to_char(Round(c.Top10/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(c.Top10/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || '' of gross</div></div></a>'' As S8,',
'       ''<a class="ds-kpi ds-kpi--violet" href="''',
'    || apex_page.get_url(p_page => 927, p_clear_cache => ''927'',',
'         p_items => ''P927_FROMDATE,P927_TODATE,P927_COMPANY,P927_LOCATION,P927_CONTROL'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',AP-P03'')',
'    || ''" title="Payments made over 90 days ago and never applied to any bill - control AP-P03. The single largest actionable item in this ledger."><span class="ds-kpi-ic fa fa-hourglass-half"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Old Unapplied Payments</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.OldCash >= 10000000 Then to_char(Round(t.OldCash/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.OldCash/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">paid, never applied, over 90 days</div></div></a>'' As S9,',
'       ''<a class="ds-kpi ds-kpi--risk" href="''',
'    || apex_page.get_url(p_page => 927, p_clear_cache => ''927'',',
'         p_items => ''P927_FROMDATE,P927_TODATE,P927_COMPANY,P927_LOCATION,P927_CATEGORY'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',CRITICAL'')',
'    || ''" title="Findings on the Critical-severity controls only, so this count equals exactly what the drill-down lists: payments unapplied over 90 days, bill passes never posted to the ledger, cross-company allocation, over-allocation, orphan alloc'
||'ation. Payable that cannot be aged is High severity, not Critical, and has its own card above."><span class="ds-kpi-ic fa fa-exclamation-triangle"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Critical Exceptions</div><div class="ds-kpi-n">''',
'    || to_char(e.N,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AP-P03 &middot; AP-B01 &middot; AP-A09 &middot; AP-A05</div></div></a>'' As S10,',
'       ''<a class="ds-kpi ds-kpi--teal" href="''',
'    || apex_page.get_url(p_page => 926, p_clear_cache => ''926'',',
'         p_items => ''P926_FROMDATE,P926_TODATE,P926_COMPANY,P926_LOCATION'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION)',
'    || ''" title="Goods received and credited to the GR/IR clearing account with no supplier bill passed yet. This liability sits OUTSIDE the vendor payable above - GRIRACCOUNT is not under SUNDRYCREDITORS in this chart of accounts - and its page ties'
||' to that GL account. The GRIR population is scoped through the underlying GRN.">''',
'    || ''<span class="ds-kpi-ic fa fa-truck"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Unbilled Liability (GRNI)</div><div class="ds-kpi-n">&#8377;''',
'    || Case When g.Amt >= 10000000 Then to_char(Round(g.Amt/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(g.Amt/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">'' || to_char(g.N,''FM999G990'')',
'    || '' GRNs awaiting bills &middot; separate from vendor AP</div></div></a>'' As S11,',
'       ''<a class="ds-kpi ds-kpi--amber" href="''',
'    || apex_page.get_url(p_page => 924, p_clear_cache => ''924'',',
'         p_items => ''P924_FROMDATE,P924_TODATE,P924_COMPANY,P924_LOCATION'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION)',
'    || ''" title="Payment advices raised but not marked done (PaymentAdvice.PaymentDone) - approved liability queued for execution as at the As-of Date.">''',
'    || ''<span class="ds-kpi-ic fa fa-clock-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Payment Approval Pending</div><div class="ds-kpi-n">&#8377;''',
'    || Case When ap.Amt >= 10000000 Then to_char(Round(ap.Amt/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(ap.Amt/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">'' || to_char(ap.N,''FM999G990'')',
'    || '' advices awaiting execution</div></div></a>'' As S12,',
'       ''<a class="ds-kpi ds-kpi--ok" href="''',
'    || apex_page.get_url(p_page => 922, p_clear_cache => ''922'',',
'         p_items => ''P922_FROMDATE,P922_TODATE,P922_COMPANY,P922_LOCATION,P922_AGEBASIS,P922_BUCKET'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',DUE,DT'')',
'    || ''" title="Payable whose due date is exactly the As-of Date. Due-date basis only. Opens the bills behind it.">''',
'    || ''<span class="ds-kpi-ic fa fa-bell-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Due Today</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.DueTdy >= 10000000 Then to_char(Round(t.DueTdy/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.DueTdy/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">falls due on '' || :P920_TODATE || ''</div></div></a>'' As S13,',
'       ''<div class="ds-apexcl"><div class="ds-apexcl-h">Vendors Above Credit Limit &mdash; NOT MEASURABLE</div>''',
'    || ''<div class="ds-apexcl-b"><code>Party.CreditAmount</code> is greater than zero on <b>0</b> creditor accounts. ''',
'    || ''There is no limit to compare exposure against, so this KPI has no input and is not shown as a number. ''',
'    || ''It is listed here so its absence is a stated measurement rather than an omission.</div></div>'' As S14',
'  From T t Cross Join Conc c Cross Join Ex e Cross Join Grni g Cross Join Appr ap'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION,P920_AGEBASIS'
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
 p_id=>wwv_flow_imp.id(12806370352301196)
,p_query_column_id=>1
,p_column_alias=>'S1'
,p_column_display_sequence=>10
,p_column_heading=>'S1'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12806448447301196)
,p_query_column_id=>10
,p_column_alias=>'S10'
,p_column_display_sequence=>100
,p_column_heading=>'S10'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12806506641301196)
,p_query_column_id=>11
,p_column_alias=>'S11'
,p_column_display_sequence=>110
,p_column_heading=>'S11'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12806697705301196)
,p_query_column_id=>12
,p_column_alias=>'S12'
,p_column_display_sequence=>120
,p_column_heading=>'S12'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12806788337301196)
,p_query_column_id=>13
,p_column_alias=>'S13'
,p_column_display_sequence=>130
,p_column_heading=>'S13'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12806831034301196)
,p_query_column_id=>14
,p_column_alias=>'S14'
,p_column_display_sequence=>140
,p_column_heading=>'S14'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12806982200301196)
,p_query_column_id=>2
,p_column_alias=>'S2'
,p_column_display_sequence=>20
,p_column_heading=>'S2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12807049145301196)
,p_query_column_id=>3
,p_column_alias=>'S3'
,p_column_display_sequence=>30
,p_column_heading=>'S3'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12807196905301196)
,p_query_column_id=>4
,p_column_alias=>'S4'
,p_column_display_sequence=>40
,p_column_heading=>'S4'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12807264178301196)
,p_query_column_id=>5
,p_column_alias=>'S5'
,p_column_display_sequence=>50
,p_column_heading=>'S5'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12807302990301196)
,p_query_column_id=>6
,p_column_alias=>'S6'
,p_column_display_sequence=>60
,p_column_heading=>'S6'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12807431720301196)
,p_query_column_id=>7
,p_column_alias=>'S7'
,p_column_display_sequence=>70
,p_column_heading=>'S7'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12807502171301196)
,p_query_column_id=>8
,p_column_alias=>'S8'
,p_column_display_sequence=>80
,p_column_heading=>'S8'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12807696087301196)
,p_query_column_id=>9
,p_column_alias=>'S9'
,p_column_display_sequence=>90
,p_column_heading=>'S9'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12807713981301214)
,p_name=>'Payables KPIs'
,p_static_id=>'kpi-strip'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-kpiwrap--5up'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P920_TODATE,''DD-MM-RRRR'') D From dual),',
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
'     Aged As (',
'       Select d.AccountCode Pty,',
'              cast(null as varchar2(1)) IsCo,',
'              (d.Amount - nvl(al.Amt,0)) Pay,',
'              coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) DueDate,',
'              Case When v.VoucherNo = ''OPENING''  Then ''Opening Carry-forward''',
'                   When v.ModuleCode = ''PBPASS''  Then ''Purchase Bill''',
'                   When v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'                                                 Then ''Payment to Vendor''',
'                   Else ''Other'' End Cls,',
'              /* Bucket 0 = Not Due, 1..6 = ranges, 7 = Cannot Age.',
'                 Identical expression on every AP region. */',
'              Case When nvl(:P920_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) Is Null Then 7',
'                   When nvl(:P920_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) >= Asof.D Then 0',
'                   When (Case When :P920_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <=  30 Then 1',
'                   When (Case When :P920_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <=  60 Then 2',
'                   When (Case When :P920_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <=  90 Then 3',
'                   When (Case When :P920_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <= 180 Then 4',
'                   When (Case When :P920_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <= 365 Then 5',
'                   Else 6 End Bkt,',
'              Case When :P920_AGEBASIS = ''DOC''',
'                   Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                   When coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) Is Not Null',
'                   Then Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0)',
'              End DaysOd',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join (Select pp.Tno Tno,',
'                           coalesce(Max(pb.PartyBillDate), Max(pb.PurchaseBillDate)) DocDt,',
'                           Max(pb.PurchaseBillDate)',
'                             + coalesce(Max(po.CreditDays), Max(pty.CreditDays)) DueDt',
'                      From PBPass pp',
'                      Join PurchaseBill pb On pb.Tno = pp.PurchaseBillTno',
'                      Left Join PurchaseBillDetail pbd On pbd.Tno = pb.Tno',
'                      Left Join PurchaseOrder po On po.Tno = pbd.PurchaseOrderTno',
'                      Left Join Party pty On pty.PartyCode = pb.PartyCode',
'                     Group By pp.Tno) pt On v.ModuleCode = ''PBPASS'' And pt.Tno = v.ModuleTno',
'         Left Join (Select jp.Tno Tno,',
'                           coalesce(Max(jb.PartyBillDate), Max(jb.JobBillDate)) DocDt,',
'                           Max(jb.JobBillDate) + nvl(Max(jo.CreditDays),0) DueDt',
'                      From JBPass jp',
'                      Join JobBill jb On jb.Tno = jp.JobBillTno',
'                      Left Join JobOrder jo On jo.Tno = jb.JobOrderTno',
'                     Group By jp.Tno) jt On v.ModuleCode = ''JBPASS'' And jt.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P920_COMPANY  Is Null Or d.CompanyCode  = :P920_COMPANY)',
'          And (:P920_LOCATION Is Null Or d.LocationCode = :P920_LOCATION)),',
'     Rc As (',
'       /* Payments are ACTUAL PAYMENT TRANSACTIONS in the period -',
'          every channel, so bank-statement uploads and direct vouchers',
'          count alongside payment advices. Never a fall in outstanding:',
'          that also happens through debit notes and allocation. */',
'       Select nvl(Sum(-d.Amount),0) Amt, Count(Distinct d.Tno) N',
'         From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'          And d.Amount < 0',
'          And d.VoucherDate >= to_date(:P920_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P920_TODATE,''DD-MM-RRRR'') + 1',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P920_COMPANY  Is Null Or d.CompanyCode  = :P920_COMPANY)',
'          And (:P920_LOCATION Is Null Or d.LocationCode = :P920_LOCATION)),',
'     P As (',
'       Select Pty,',
'              Sum(Case When Pay > 0 Then Pay Else 0 End) Dr,',
'              Sum(Case When Pay < 0 Then -Pay Else 0 End) Cr',
'         From Aged Group By Pty),',
'     T As (',
'       Select nvl(Sum(Case When Pay > 0 Then Pay Else 0 End),0) Gross,',
'              nvl(Sum(Case When Pay > 0 And Bkt = 0 Then Pay Else 0 End),0) NotDue,',
'              nvl(Sum(Case When Pay > 0 And Bkt Between 1 And 6 Then Pay Else 0 End),0) Overdue,',
'              nvl(Sum(Case When Pay > 0 And Bkt >= 4 And Bkt <= 6 Then Pay Else 0 End),0) D90,',
'              nvl(Sum(Case When Pay > 0 And Bkt >= 5 And Bkt <= 6 Then Pay Else 0 End),0) D180,',
'              nvl(Sum(Case When Pay > 0 And Bkt = 7 Then Pay Else 0 End),0) NoAge,',
'              nvl(Sum(Case When Pay < 0 And Cls = ''Payment to Vendor'' Then -Pay Else 0 End),0) Unapp,',
'              nvl(Sum(Case When Pay < 0 Then -Pay Else 0 End),0) Cred,',
'              nvl(Sum(Pay),0) Net,',
'              Count(Distinct Case When Pay > 0 And Bkt Between 1 And 6 Then Pty End) OdPty,',
'              Count(Distinct Case When Pay <> 0 Then Pty End) ActPty,',
'              nvl(Sum(Case When Pay > 0 And DaysOd Is Not Null Then Pay * DaysOd End),0) WSum,',
'              nvl(Sum(Case When Pay > 0 And DaysOd Is Not Null Then Pay End),0) WBase',
'              ,Count(Distinct Case When Pay <> 0 And IsCo = ''YES'' Then Pty End) IntPty',
'              ,nvl(Sum(Case When Pay > 0 And IsCo = ''YES'' Then Pay Else 0 End),0) IntGross',
'         From Aged),',
'     B As (Select Count(*) N From P Where Dr > 0.005 And Cr > 0.005)',
'Select /* Card 1 - the headline, drills to the party summary */',
'       ''<a class="ds-kpi ds-kpi--gold" href="''',
'    || apex_page.get_url(p_page => 921, p_clear_cache => ''921'',',
'         p_items => ''P921_FROMDATE,P921_TODATE,P921_COMPANY,P921_LOCATION,P921_AGEBASIS,P921_FOCUS'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',''|| nvl(:P920_AGEBASIS,''DUE'') ||'',ALL'')',
'    || ''" title="Sum of open credit items on the SUNDRYCREDITORS control account as at the As-of Date. Open = original amount less allocations whose both vouchers are dated on or before that date.">''',
'    || ''<span class="ds-kpi-ic fa fa-inbox"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Gross Outstanding Payable</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Gross >= 10000000 Then to_char(Round(t.Gross/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Gross/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">as at '' || :P920_TODATE || '' &middot; '' || to_char(t.ActPty,''FM999G990'') || '' active vendors</div>''',
'    || ''</div></a>'' As KPI1,',
'       /* Card 2 */',
'       ''<a class="ds-kpi ds-kpi--ok" href="''',
'    || apex_page.get_url(p_page => 922, p_clear_cache => ''922'',',
'         p_items => ''P922_FROMDATE,P922_TODATE,P922_COMPANY,P922_LOCATION,P922_AGEBASIS,P922_BUCKET'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',''|| nvl(:P920_AGEBASIS,''DUE'') ||'',0'')',
'    || ''" title="Open payable whose due date falls on or after the As-of Date. Available on the Due Date basis only.">''',
'    || ''<span class="ds-kpi-ic fa fa-calendar-check-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Not Yet Due</div><div class="ds-kpi-n">''',
'    || Case When nvl(:P920_AGEBASIS,''DUE'') = ''DOC'' Then ''<span style="font-size:15px">Due basis only</span>''',
'            Else ''&#8377;'' || Case When t.NotDue >= 10000000 Then to_char(Round(t.NotDue/10000000,2),''FM999G990D00'') || '' Cr''',
'                                  Else to_char(Round(t.NotDue/100000,2),''FM999G990D00'') || '' Lac'' End End',
'    || ''</div><div class="ds-kpi-sub">''',
'    || Case When nvl(:P920_AGEBASIS,''DUE'') = ''DOC'' Then ''Document-date ageing measures age, not lateness''',
'            Else to_char(Round(100 * t.NotDue / Nullif(t.Gross,0),1),''FM990D0'') || ''% of gross outstanding'' End',
'    || ''</div></div></a>'' As KPI2,',
'       /* Card 3 */',
'       ''<a class="ds-kpi ds-kpi--'' || Case When t.Overdue > t.Gross * 0.5 Then ''risk'' Else ''amber'' End || ''" href="''',
'    || apex_page.get_url(p_page => 922, p_clear_cache => ''922'',',
'         p_items => ''P922_FROMDATE,P922_TODATE,P922_COMPANY,P922_LOCATION,P922_AGEBASIS,P922_BUCKET'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',''|| nvl(:P920_AGEBASIS,''DUE'') ||'',OD'')',
'    || ''" title="Open payable past its due date (Due basis) or aged beyond zero days (Document basis). Items that cannot be aged are NOT counted here - they have their own card.">''',
'    || ''<span class="ds-kpi-ic fa fa-exclamation-circle"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Total Overdue</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Overdue >= 10000000 Then to_char(Round(t.Overdue/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Overdue/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">''',
'    || Case When t.Gross > 0 Then to_char(Round(100 * t.Overdue / t.Gross,1),''FM990D0'') || ''% of gross'' Else ''no outstanding'' End',
'    || '' &middot; '' || to_char(t.OdPty,''FM999G990'') || '' vendors</div></div></a>'' As KPI3,',
'       /* Card 4 - the honesty card. It exists because on the Due basis',
'          72% of value lands here, and a dashboard that hides that is',
'          worse than one that has no ageing at all. */',
'       ''<a class="ds-kpi ds-kpi--struct" href="''',
'    || apex_page.get_url(p_page => 922, p_clear_cache => ''922'',',
'         p_items => ''P922_FROMDATE,P922_TODATE,P922_COMPANY,P922_LOCATION,P922_AGEBASIS,P922_BUCKET'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',DUE,7'')',
'    || ''" title="Open payable with no due date on its source document and no credit terms to derive one from. Never given an arbitrary bucket and never dropped.">''',
'    || ''<span class="ds-kpi-ic fa fa-question-circle"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Cannot Age &mdash; No Due Date</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.NoAge >= 10000000 Then to_char(Round(t.NoAge/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.NoAge/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">''',
'    || Case When t.Gross > 0 Then to_char(Round(100 * t.NoAge / t.Gross,1),''FM990D0'') || ''% of gross'' Else ''&mdash;'' End',
'    || '' &middot; control AP-B02</div></div></a>'' As KPI4,',
'       /* Card 5 */',
'       ''<a class="ds-kpi ds-kpi--risk" href="''',
'    || apex_page.get_url(p_page => 922, p_clear_cache => ''922'',',
'         p_items => ''P922_FROMDATE,P922_TODATE,P922_COMPANY,P922_LOCATION,P922_AGEBASIS,P922_BUCKET'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',''|| nvl(:P920_AGEBASIS,''DUE'') ||'',90'')',
'    || ''" title="Open payable in the 91-180, 181-365 and over-365 buckets combined.">''',
'    || ''<span class="ds-kpi-ic fa fa-fire"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">90+ Days</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.D90 >= 10000000 Then to_char(Round(t.D90/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.D90/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">180+ &#8377;''',
'    || Case When t.D180 >= 10000000 Then to_char(Round(t.D180/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.D180/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || '' &middot; weighted '' || to_char(Round(t.WSum / Nullif(t.WBase,0),0),''FM999G990'') || '' days overdue</div></div></a>'' As KPI5,',
'       /* Card 6 */',
'       ''<a class="ds-kpi ds-kpi--teal" href="''',
'    || apex_page.get_url(p_page => 924, p_clear_cache => ''924'',',
'         p_items => ''P924_FROMDATE,P924_TODATE,P924_COMPANY,P924_LOCATION'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION)',
'    || ''" title="Actual payment voucher lines (PAYMENT, CASHPAYMENT, BANKPAYMENT - every channel including bank-statement uploads) debited to a vendor account between From Date and To Date. This is a transaction measure, never a movement in outstandi'
||'ng.">''',
'    || ''<span class="ds-kpi-ic fa fa-upload"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Payments in Period</div><div class="ds-kpi-n">&#8377;''',
'    || Case When rc.Amt >= 10000000 Then to_char(Round(rc.Amt/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(rc.Amt/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">'' || to_char(rc.N,''FM999G990'') || '' payment vouchers &middot; ''',
'    || :P920_FROMDATE || '' to '' || :P920_TODATE || ''</div></div></a>'' As KPI6,',
'       /* Card 7 - the largest actionable item in this dataset */',
'       ''<a class="ds-kpi ds-kpi--violet" href="''',
'    || apex_page.get_url(p_page => 925, p_clear_cache => ''925'',',
'         p_items => ''P925_FROMDATE,P925_TODATE,P925_COMPANY,P925_LOCATION'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION)',
'    || ''" title="Payment lines carrying an open debit balance - money already paid to the vendor and never applied to a bill. Only a third of AP lines in this ledger have ever been allocated, so gross payable overstates what actually needs paying.">''',
'    || ''<span class="ds-kpi-ic fa fa-hand-o-up"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Vendor Advances / Unapplied</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Unapp >= 10000000 Then to_char(Round(t.Unapp/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Unapp/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">of &#8377;''',
'    || Case When t.Cred >= 10000000 Then to_char(Round(t.Cred/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Cred/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || '' total vendor debits</div></div></a>'' As KPI7,',
'       /* Card 8 - vendors who owe AND hold credit at the same time */',
'       ''<a class="ds-kpi ds-kpi--amber" href="''',
'    || apex_page.get_url(p_page => 925, p_clear_cache => ''925'',',
'         p_items => ''P925_FROMDATE,P925_TODATE,P925_COMPANY,P925_LOCATION,P925_BOTH'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',Y'')',
'    || ''" title="Vendors holding an open credit AND an open debit simultaneously. Their payable can be reduced by allocation alone - bookkeeping, not cash.">''',
'    || ''<span class="ds-kpi-ic fa fa-random"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Payable + Advance Together</div><div class="ds-kpi-n">''',
'    || to_char(b.N,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">vendors whose bills could be settled by allocation</div>''',
'    || ''</div></a>'' As KPI8,',
'       /* Internal Vendors - the Active Vendors count, but only parties',
'          flagged Is Company Account in the master. Opens the same',
'          Vendor-wise Payable list, filtered to Internal. */',
'       ''<a class="ds-kpi ds-kpi--slate" href="''',
'    || apex_page.get_url(p_page => 921, p_clear_cache => ''921'',',
'         p_items => ''P921_FROMDATE,P921_TODATE,P921_COMPANY,P921_LOCATION,P921_AGEBASIS,P921_FOCUS'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',''|| nvl(:P920_AGEBASIS,''DUE'') ||'',INTERNAL'')',
'    || ''" title="Active vendors (a live position as at the As-of Date) whose account master carries Is Company Account = YES. Opens Vendor-wise Payable filtered to Internal.">''',
'    || ''<span class="ds-kpi-ic fa fa-building-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Internal Vendors</div><div class="ds-kpi-n">''',
'    || to_char(t.IntPty,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">company accounts with a live position</div>''',
'    || ''</div></a>'' As KPI9,',
'       /* Internal Payable - Gross Outstanding Payable restricted to those',
'          same company accounts, so it foots to the Internal view. */',
'       ''<a class="ds-kpi ds-kpi--gold" href="''',
'    || apex_page.get_url(p_page => 921, p_clear_cache => ''921'',',
'         p_items => ''P921_FROMDATE,P921_TODATE,P921_COMPANY,P921_LOCATION,P921_AGEBASIS,P921_FOCUS'',',
'         p_values => :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION ||'',''|| nvl(:P920_AGEBASIS,''DUE'') ||'',INTERNAL'')',
'    || ''" title="Gross Outstanding Payable (open credit items as at the As-of Date) for parties flagged Is Company Account = YES. Opens Vendor-wise Payable filtered to Internal.">''',
'    || ''<span class="ds-kpi-ic fa fa-inbox"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Internal Payable</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.IntGross >= 10000000 Then to_char(Round(t.IntGross/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.IntGross/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">of company-account vendors &middot; gross</div>''',
'    || ''</div></a>'' As KPI10',
'',
'  From T t Cross Join Rc rc Cross Join B b'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION,P920_AGEBASIS'
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
 p_id=>wwv_flow_imp.id(12807801013301214)
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
 p_id=>wwv_flow_imp.id(12807973893301214)
,p_query_column_id=>10
,p_column_alias=>'KPI10'
,p_column_display_sequence=>100
,p_column_heading=>'KPI10'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12808022176301214)
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
 p_id=>wwv_flow_imp.id(12808190127301214)
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
 p_id=>wwv_flow_imp.id(12808205885301214)
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
 p_id=>wwv_flow_imp.id(12808369401301214)
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
 p_id=>wwv_flow_imp.id(12808450478301214)
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
 p_id=>wwv_flow_imp.id(12808554932301214)
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
 p_id=>wwv_flow_imp.id(12808611360301214)
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
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12808719232301214)
,p_query_column_id=>9
,p_column_alias=>'KPI9'
,p_column_display_sequence=>90
,p_column_heading=>'KPI9'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12808890442301214)
,p_plug_name=>'Overdue Movement'
,p_static_id=>'overdue-movement'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>48
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Overdue re-derived at each month end, so the line shows how the',
'   overdue book actually moved rather than the net of period postings.',
'   The month spine is cross-joined into the open-item layer, the same',
'   construction page 699 uses and for the same reason. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Spine As (',
'       Select Me From (',
'         Select Least(Last_Day(Add_Months(trunc(to_date(:P920_FROMDATE,''DD-MM-RRRR''),''MM''), Level - 1)),',
'                      to_date(:P920_TODATE,''DD-MM-RRRR'')) Me',
'           From dual',
'        Connect By Level <= Months_Between(trunc(to_date(:P920_TODATE,''DD-MM-RRRR''),''MM''),',
'                                           trunc(to_date(:P920_FROMDATE,''DD-MM-RRRR''),''MM'')) + 1)',
'        Where Me >= date ''2026-04-01''),',
'     Ln As (',
'       Select d.Tno, d.Sno, d.Amount Amt, d.VoucherDate Vdt,',
'              coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) DueDate',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join (Select pp.Tno Tno,',
'                           coalesce(Max(pb.PartyBillDate), Max(pb.PurchaseBillDate)) DocDt,',
'                           Max(pb.PurchaseBillDate)',
'                             + coalesce(Max(po.CreditDays), Max(pty.CreditDays)) DueDt',
'                      From PBPass pp',
'                      Join PurchaseBill pb On pb.Tno = pp.PurchaseBillTno',
'                      Left Join PurchaseBillDetail pbd On pbd.Tno = pb.Tno',
'                      Left Join PurchaseOrder po On po.Tno = pbd.PurchaseOrderTno',
'                      Left Join Party pty On pty.PartyCode = pb.PartyCode',
'                     Group By pp.Tno) pt On v.ModuleCode = ''PBPASS'' And pt.Tno = v.ModuleTno',
'         Left Join (Select jp.Tno Tno,',
'                           coalesce(Max(jb.PartyBillDate), Max(jb.JobBillDate)) DocDt,',
'                           Max(jb.JobBillDate) + nvl(Max(jo.CreditDays),0) DueDt',
'                      From JBPass jp',
'                      Join JobBill jb On jb.Tno = jp.JobBillTno',
'                      Left Join JobOrder jo On jo.Tno = jb.JobOrderTno',
'                     Group By jp.Tno) jt On v.ModuleCode = ''JBPASS'' And jt.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P920_COMPANY  Is Null Or d.CompanyCode  = :P920_COMPANY)',
'          And (:P920_LOCATION Is Null Or d.LocationCode = :P920_LOCATION)),',
'     AlSpine As (',
'       Select s.Me, a.DrVoucherTno Tno, a.DrVoucherSno Sno, -Sum(a.Amount) Amt',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Spine s',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= s.Me And cv.VoucherDate <= s.Me',
'        Group By s.Me, a.DrVoucherTno, a.DrVoucherSno',
'       Union All',
'       Select s.Me, a.CrVoucherTno, a.CrVoucherSno, Sum(a.Amount)',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Spine s',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= s.Me And cv.VoucherDate <= s.Me',
'        Group By s.Me, a.CrVoucherTno, a.CrVoucherSno),',
'     Al As (Select Me, Tno, Sno, Sum(Amt) Amt From AlSpine Group By Me, Tno, Sno),',
'     P As (',
'       Select s.Me, (l.Amt - nvl(al.Amt,0)) Pay, l.DueDate,',
'              Case When l.DueDate Is Null Then Null Else s.Me - l.DueDate End Od',
'         From Ln l',
'         Join Spine s On l.Vdt <= s.Me',
'         Left Join Al al On al.Me = s.Me And al.Tno = l.Tno And al.Sno = l.Sno)',
'Select to_char(Me,''Mon-RR'')                                                    As LABEL,',
'       Round(Sum(Case When Pay > 0 And Od > 0 Then Pay Else 0 End)/10000000,2) As OVERDUE_CR,',
'       Round(Sum(Case When Pay > 0 And Od > 90 Then Pay Else 0 End)/10000000,2) As OVER90_CR,',
'       Round(Sum(Case When Pay > 0 And DueDate Is Null Then Pay Else 0 End)/10000000,2) As CANNOT_AGE_CR',
'  From P Group By Me Order By Me'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12808991143301214)
,p_region_id=>wwv_flow_imp.id(12808890442301214)
,p_chart_type=>'line'
,p_height=>'330'
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
,p_no_data_found_message=>'No month end in this window falls on or after 01-04-2026, so no position can be reconstructed.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12809020993301214)
,p_chart_id=>wwv_flow_imp.id(12808991143301214)
,p_static_id=>'cannotage'
,p_seq=>30
,p_name=>unistr('Cannot Age (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'line'
,p_items_value_column_name=>'CANNOT_AGE_CR'
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
 p_id=>wwv_flow_imp.id(12809137394301214)
,p_chart_id=>wwv_flow_imp.id(12808991143301214)
,p_static_id=>'over90'
,p_seq=>20
,p_name=>unistr('90+ Days (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'line'
,p_items_value_column_name=>'OVER90_CR'
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
 p_id=>wwv_flow_imp.id(12809214774301214)
,p_chart_id=>wwv_flow_imp.id(12808991143301214)
,p_static_id=>'overdue'
,p_seq=>10
,p_name=>unistr('Overdue (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'line'
,p_items_value_column_name=>'OVERDUE_CR'
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
 p_id=>wwv_flow_imp.id(12809369796301214)
,p_chart_id=>wwv_flow_imp.id(12808991143301214)
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
 p_id=>wwv_flow_imp.id(12809447534301214)
,p_chart_id=>wwv_flow_imp.id(12808991143301214)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('\20B9 Crore')
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
 p_id=>wwv_flow_imp.id(12809548310301214)
,p_name=>'Go to'
,p_static_id=>'quick-links'
,p_template=>4072358936313175081
,p_display_sequence=>900
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-apnavwrap'
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
'  Select 920 Id, ''AP Command Centre''          Nm, ''Payable, due and overdue, payments, advances and the exceptions behind every number'' Sub, ''fa-dashboard''              Ic From dual Union All',
'  Select 921,    ''Vendor-wise Payable'',           ''One row per vendor, with ageing and the netting position'',             ''fa-users''                  From dual Union All',
'  Select 922,    ''Bill-wise Payable'',             ''Every open item at line level, with its source document'',              ''fa-list-alt''               From dual Union All',
'  Select 923,    ''Creditor 360'',                  ''One vendor from every angle - bills, payments, advances, statement'',   ''fa-user''                   From dual Union All',
'  Select 924,    ''Payments and Settlement'',       ''Cash actually paid, which bank paid it, how much is applied'',          ''fa-upload''                 From dual Union All',
'  Select 925,    ''Advances and Unapplied Payments'',''Money already with vendors, and the payable it could clear'',          ''fa-hand-o-up''              From dual Union All',
'  Select 926,    ''Unbilled Liability (GRNI)'',     ''Goods received, no supplier bill yet - tied to the GR/IR account'',     ''fa-truck''                  From dual Union All',
'  Select 927,    ''Exceptions and Controls'',       ''Every control, what it tests, and the records that fail it'',           ''fa-exclamation-triangle''   From dual Union All',
'  Select 928,    ''Reconciliation and Data Health'',''The open-item register against the general-ledger control account'',    ''fa-balance-scale''          From dual Union All',
'  Select 930,    ''Trends and Cash Forecast'',      ''How the position moved, and the cash the due dates demand'',            ''fa-line-chart''             From dual Union All',
'  Select 931,    ''Daily Payment MIS'',             ''One day: position, movement, dues and what remains unexplained'',       ''fa-calendar-o''             From dual Union All',
'  Select 932,    ''Weekly AP Review'',              ''Opening against closing, and the controls that failed in the week'',    ''fa-calendar''               From dual Union All',
'  Select 933,    ''Monthly Management MIS'',        ''The management pack, reconciled to the GL at the foot'',                ''fa-file-text-o''            From dual)',
'Select ''<a class="ds-kpi ds-kpi--link ds-kpi--teal" href="''',
'    || apex_page.get_url(',
'         p_page        => Pg.Id,',
'         p_clear_cache => to_char(Pg.Id),',
'         /* Page 700 is a single-day report and has no From/To pair -',
'            naming an item that does not exist on the target page',
'            fails at run time, so its filter list is built separately. */',
'         p_items  => Case When Pg.Id = 931',
'                          Then ''P931_DAY,P931_COMPANY,P931_LOCATION''',
'                          Else ''P''||Pg.Id||''_FROMDATE,P''||Pg.Id||''_TODATE,P''',
'                               ||Pg.Id||''_COMPANY,P''||Pg.Id||''_LOCATION'' End,',
'         p_values => Case When Pg.Id = 931',
'                          Then :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION',
'                          Else :P920_FROMDATE ||'',''|| :P920_TODATE ||'',''|| :P920_COMPANY ||'',''|| :P920_LOCATION End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 920',
' Order By Pg.Id'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION'
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
 p_id=>wwv_flow_imp.id(12809648809301215)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12809776995301215)
,p_plug_name=>'Ageing'
,p_static_id=>'rule-ageing'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>36
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Ageing</h2>',
'  <p>Every bucket, including the one that cannot be aged, and what the money is actually made of</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12809877298301215)
,p_plug_name=>'Control and Traceability'
,p_static_id=>'rule-control'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>58
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Control and Traceability</h2>',
'  <p>What the data cannot support, and where the exceptions are</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12809948868301215)
,p_plug_name=>'Payables Pulse'
,p_static_id=>'rule-pulse'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>28
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Payables Pulse</h2>',
'  <p>Every card is clickable and lands on the exact rows behind it</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12810070767301215)
,p_plug_name=>'Top Overdue Vendors'
,p_static_id=>'top-overdue'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>46
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P920_TODATE,''DD-MM-RRRR'') D From dual),',
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
'     G As (',
'       Select d.AccountCode Pty,',
'              Sum(Case When (d.Amount - nvl(al.Amt,0)) > 0',
'                        And coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) < (Select D From Asof)',
'                       Then (d.Amount - nvl(al.Amt,0)) Else 0 End) Overdue,',
'              Sum(Case When (d.Amount - nvl(al.Amt,0)) > 0',
'                        And coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) < (Select D From Asof) - 90',
'                       Then (d.Amount - nvl(al.Amt,0)) Else 0 End) Over90',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join (Select pp.Tno Tno,',
'                           coalesce(Max(pb.PartyBillDate), Max(pb.PurchaseBillDate)) DocDt,',
'                           Max(pb.PurchaseBillDate)',
'                             + coalesce(Max(po.CreditDays), Max(pty.CreditDays)) DueDt',
'                      From PBPass pp',
'                      Join PurchaseBill pb On pb.Tno = pp.PurchaseBillTno',
'                      Left Join PurchaseBillDetail pbd On pbd.Tno = pb.Tno',
'                      Left Join PurchaseOrder po On po.Tno = pbd.PurchaseOrderTno',
'                      Left Join Party pty On pty.PartyCode = pb.PartyCode',
'                     Group By pp.Tno) pt On v.ModuleCode = ''PBPASS'' And pt.Tno = v.ModuleTno',
'         Left Join (Select jp.Tno Tno,',
'                           coalesce(Max(jb.PartyBillDate), Max(jb.JobBillDate)) DocDt,',
'                           Max(jb.JobBillDate) + nvl(Max(jo.CreditDays),0) DueDt',
'                      From JBPass jp',
'                      Join JobBill jb On jb.Tno = jp.JobBillTno',
'                      Left Join JobOrder jo On jo.Tno = jb.JobOrderTno',
'                     Group By jp.Tno) jt On v.ModuleCode = ''JBPASS'' And jt.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P920_COMPANY  Is Null Or d.CompanyCode  = :P920_COMPANY)',
'          And (:P920_LOCATION Is Null Or d.LocationCode = :P920_LOCATION)',
'        Group By d.AccountCode)',
'Select * From (',
'  Select nvl(p.PartyName, g.Pty) As LABEL,',
'         Round(g.Overdue/100000,2)                 As OVERDUE_LAC,',
'         Round(g.Over90/100000,2)                  As OVER90_LAC,',
'         g.Pty                                     As PARTY_CODE',
'    From G g Left Join Party p On p.PartyCode = g.Pty',
'   Where g.Overdue > 0.005',
'   Order By g.Overdue Desc)',
' Where rownum <= 12',
' /* The inner Order By only decides WHICH twelve rows rownum keeps -',
'    Oracle does not carry that order out to the caller. The chart no',
'    longer re-sorts by label, so without this outer Order By the bars',
'    would come back in whatever order the plan produced. */',
' Order By OVERDUE_LAC Desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION,P920_AGEBASIS'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12810120588301215)
,p_region_id=>wwv_flow_imp.id(12810070767301215)
,p_chart_type=>'bar'
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
,p_no_data_found_message=>'No vendor is overdue in this scope on the due-date basis.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12810240745301215)
,p_chart_id=>wwv_flow_imp.id(12810120588301215)
,p_static_id=>'over90'
,p_seq=>20
,p_name=>unistr('Of which 90+ (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'OVER90_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12810360173301215)
,p_chart_id=>wwv_flow_imp.id(12810120588301215)
,p_static_id=>'overdue'
,p_seq=>10
,p_name=>unistr('Overdue (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'OVERDUE_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:923:&SESSION.::&DEBUG.::P923_PARTY,P923_FROMDATE,P923_TODATE,P923_COMPANY,P923_LOCATION,P923_AGEBASIS:&PARTY_CODE.,&P920_FROMDATE.,&P920_TODATE.,&P920_COMPANY.,&P920_LOCATION.,&P920_AGEBASIS.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12810462015301215)
,p_chart_id=>wwv_flow_imp.id(12810120588301215)
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
 p_id=>wwv_flow_imp.id(12810546691301215)
,p_chart_id=>wwv_flow_imp.id(12810120588301215)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('Overdue (\20B9 Lac)')
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
 p_id=>wwv_flow_imp.id(12810676599301215)
,p_plug_name=>'Top Vendors by Net Exposure'
,p_static_id=>'top-vendors'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>44
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P920_TODATE,''DD-MM-RRRR'') D From dual),',
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
'     P As (',
'       Select d.AccountCode Pty,',
'              Sum(Case When (d.Amount - nvl(al.Amt,0)) > 0 Then (d.Amount - nvl(al.Amt,0)) Else 0 End) Dr,',
'              Sum(Case When (d.Amount - nvl(al.Amt,0)) < 0 Then -(d.Amount - nvl(al.Amt,0)) Else 0 End) Cr',
'         From VoucherDetail d',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P920_COMPANY  Is Null Or d.CompanyCode  = :P920_COMPANY)',
'          And (:P920_LOCATION Is Null Or d.LocationCode = :P920_LOCATION)',
'        Group By d.AccountCode)',
'Select * From (',
'  Select nvl(pa.PartyName, p.Pty) As LABEL,',
'         Round(p.Dr/100000,2) As PAYABLE_LAC,',
'         Round(p.Cr/100000,2) As DEBIT_LAC,',
'         p.Pty As PARTY_CODE',
'    From P p Left Join Party pa On pa.PartyCode = p.Pty',
'   Where p.Dr > 0.005',
'   Order By p.Dr Desc)',
' Where rownum <= 12',
' /* Outer Order By is required: the inner one only picks the twelve',
'    rows, it does not survive to the result set. */',
' Order By PAYABLE_LAC Desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION,P920_AGEBASIS'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12810715766301215)
,p_region_id=>wwv_flow_imp.id(12810676599301215)
,p_chart_type=>'bar'
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
,p_no_data_found_message=>'No vendor carries an open payable in this scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12810869896301215)
,p_chart_id=>wwv_flow_imp.id(12810715766301215)
,p_static_id=>'credit'
,p_seq=>20
,p_name=>unistr('Vendor Debit Held (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'DEBIT_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12810914968301215)
,p_chart_id=>wwv_flow_imp.id(12810715766301215)
,p_static_id=>'payable'
,p_seq=>10
,p_name=>unistr('Payable (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'PAYABLE_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:923:&SESSION.::&DEBUG.::P923_PARTY,P923_FROMDATE,P923_TODATE,P923_COMPANY,P923_LOCATION,P923_AGEBASIS:&PARTY_CODE.,&P920_FROMDATE.,&P920_TODATE.,&P920_COMPANY.,&P920_LOCATION.,&P920_AGEBASIS.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12811099670301215)
,p_chart_id=>wwv_flow_imp.id(12810715766301215)
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
 p_id=>wwv_flow_imp.id(12811100797301215)
,p_chart_id=>wwv_flow_imp.id(12810715766301215)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('Open Balance (\20B9 Lac)')
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
 p_id=>wwv_flow_imp.id(12811282576301215)
,p_plug_name=>'Longer-run trend'
,p_static_id=>'trend-link'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-apnote"><span class="fa fa-line-chart"></span><div>',
'  <b>Outstanding Trend, Ageing Mix Trend, Payment Application and the Due-Date Cash Forecast</b>',
'  are on the dedicated <b>AP Trends &amp; Cash Forecast</b> page, where each series is re-derived',
'  at every month end rather than compressed onto this dashboard. Open it from the navigation menu,',
'  or from the Overdue Movement chart above, which uses the same month-end construction.',
'</div></div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12812383902301216)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12806096557301196)
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
 p_id=>wwv_flow_imp.id(12812416015301216)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12806096557301196)
,p_button_name=>'OPENFILTERS'
,p_static_id=>'open-filters'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Ageing Basis'
,p_button_redirect_url=>'javascript:apex.theme.openRegion(''p708Drawer'');'
,p_button_execute_validations=>'N'
,p_button_css_classes=>'ds-filter-trigger'
,p_icon_css_classes=>'fa-sliders'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12812506815301216)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(12806182793301196)
,p_button_name=>'RESETFILTERS'
,p_static_id=>'reset-filters'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reset All Filters'
,p_button_redirect_url=>'f?p=&APP_ID.:920:&SESSION.::&DEBUG.:708'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-times'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12811343293301215)
,p_name=>'P920_AGEBASIS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12806182793301196)
,p_item_default=>'DUE'
,p_prompt=>'Ageing Basis'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Due Date (lateness);DUE,Document Date (age);DOC'
,p_colspan=>12
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Due Date measures LATENESS and is the accounting-correct basis, but due dates exist on only about a third of open payable value here (93% of trade purchase bills, almost none of the opening carry-forward) - the rest lands in an explicit Cannot Age bu'
||'cket. Document Date measures AGE, covers every item, and is the basis every existing iBOSS creditors report uses. Neither is hidden and neither is presented as the only answer.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12811557759301216)
,p_name=>'P920_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12806096557301196)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select c.CompanyName d, c.CompanyCode r',
'  From Company c',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.CompanyCode = c.CompanyCode',
'                  And v.AccountCode In (Select PartyCode From Party',
'                        Start With PartyCode = ''SUNDRYCREDITORS'' Connect By Prior PartyCode = ParentCode)',
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
 p_id=>wwv_flow_imp.id(12811606187301216)
,p_name=>'P920_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12806096557301196)
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
,p_help_text=>'Start of the FLOW window. It bounds payments, bill bookings and debit notes. It does NOT affect outstanding, ageing or advances - those are point-in-time balances measured at the To Date.'
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
 p_id=>wwv_flow_imp.id(12811831098301216)
,p_name=>'P920_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12806096557301196)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select l.LocationName d, l.LocationCode r',
'  From Location l',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.LocationCode = l.LocationCode',
'                  And v.AccountCode In (Select PartyCode From Party',
'                        Start With PartyCode = ''SUNDRYCREDITORS'' Connect By Prior PartyCode = ParentCode)',
'                  And (:P920_COMPANY Is Null Or v.CompanyCode = :P920_COMPANY)',
'                  And (cast(null as varchar2(100)) Is Null',
'                       Or cast(null as varchar2(100)) = cast(null as varchar2(100))))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P920_COMPANY'
,p_ajax_items_to_submit=>'P920_COMPANY'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>'"Location" is the business term throughout this dashboard; the underlying column is LocationCode and is never renamed, only relabelled. The list shows only locations that actually carry a payable, narrowed by the selected Company. NOTE FOR MAINTAINER'
||'S - an LOV query must begin with SELECT. A leading /* */ comment here makes APEX fail the item at render time with "Error during rendering of page item P920_LOCATION", which apex validate does not catch. Rationale for an LOV therefore belongs in this'
||' help text, not above its SQL.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12812111962301216)
,p_name=>'P920_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12806096557301196)
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
,p_help_text=>'End of the flow window AND the As-of Date for every balance on the page. Outstanding, ageing, advances and net liability are all measured as at this date, reconstructed from effective transactions - not rolled back from today.'
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
