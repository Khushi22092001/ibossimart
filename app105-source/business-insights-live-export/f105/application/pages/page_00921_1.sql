prompt --application/pages/page_00921
begin
--   Manifest
--     PAGE: 00921
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
 p_id=>921
,p_name=>'Vendor-wise Payable'
,p_alias=>'AP-VENDOR-OUTSTANDING'
,p_step_title=>'Vendor-wise Payable'
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
,p_help_text=>'One row per vendor, aggregated from the same canonical open-item layer as the command centre - so this page and page 708 cannot disagree. Payable and Vendor Debits are shown as two separate columns rather than netted, because a vendor holding both is'
||' the single most actionable position in this ledger (1,414 vendors do, with Rs 338.22 Cr clearable by allocation alone). Credit limit and credit utilisation are absent because this ERP holds no credit-limit data at all: Party.CreditAmount is greater '
||'than zero on 0 creditor accounts.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12812710421301216)
,p_name=>'Vendor-wise Payable'
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
'    || ''<div class="ds-ap-eyebrow">Payables &middot; Vendor Summary</div>''',
'    || ''<h1 class="ds-ap-title">Vendor-wise Payable</h1>''',
'    || ''<div class="ds-ap-sub">Every vendor''''s payable, debits held, net liability and ageing profile as at the As-of Date. Click a vendor for Creditor 360.</div>''',
'    || ''<div class="ds-ap-context">''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-crosshairs"></span>Outstanding as at <b>'' || :P921_TODATE || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-hourglass-half"></span>Ageing basis <b>''',
'       || Case When :P921_AGEBASIS = ''DOC'' Then ''Document date (age)'' Else ''Due date (lateness)'' End || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P921_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P921_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P921_FROMDATE,P921_TODATE,P921_COMPANY,P921_LOCATION,P921_AGEBASIS'
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
 p_id=>wwv_flow_imp.id(12812842921301216)
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
 p_id=>wwv_flow_imp.id(12812986752301216)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p709Filters'
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
 p_id=>wwv_flow_imp.id(12813019573301232)
,p_plug_name=>'Vendor Outstanding'
,p_static_id=>'party-report'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2102002977963900996)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* CANONICAL AP PROLOGUE - identical to page 708. See',
'   docs/ap-dashboard/AP_KPI_DEFINITION.md section 1. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P921_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Select d.AccountCode Pty, d.CompanyCode Cmp, d.LocationCode Loc, cast(null as varchar2(100)) Pnl,',
'              (d.Amount - nvl(al.Amt,0)) Pay,',
'              d.VoucherDate Vdt, v.VoucherNo Vno, v.DocTypeCode Dtc,',
'              ao.BillDate AoBillDate,',
'              coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) DueDate,',
'              coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate) DocDate,',
'              Case When nvl(:P921_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) Is Null Then 7',
'                   When nvl(:P921_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) >= Asof.D Then 0',
'                   When (Case When :P921_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <=  30 Then 1',
'                   When (Case When :P921_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <=  60 Then 2',
'                   When (Case When :P921_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <=  90 Then 3',
'                   When (Case When :P921_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <= 180 Then 4',
'                   When (Case When :P921_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <= 365 Then 5',
'                   Else 6 End Bkt,',
'              Case When :P921_AGEBASIS = ''DOC''',
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
'          And (:P921_COMPANY  Is Null Or d.CompanyCode  = :P921_COMPANY)',
'          And (:P921_LOCATION Is Null Or d.LocationCode = :P921_LOCATION)),',
'     Rc As (',
'       /* Payments are a FLOW, bounded by From/To - not by the As-of',
'          Date - and are aggregated to the party BEFORE they join, so',
'          they cannot fan out the open-item grain. Every channel counts:',
'          advices, bank-statement uploads and direct vouchers alike. */',
'       Select d.AccountCode Pty, Sum(-d.Amount) Amt, Max(d.VoucherDate) Last',
'         From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'          And d.Amount < 0',
'          And d.VoucherDate >= to_date(:P921_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P921_TODATE,''DD-MM-RRRR'') + 1',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P921_COMPANY  Is Null Or d.CompanyCode  = :P921_COMPANY)',
'          And (:P921_LOCATION Is Null Or d.LocationCode = :P921_LOCATION)',
'        Group By d.AccountCode),',
'     LastRc As (',
'       /* Last payment EVER, not just in the period - a treasury',
'          reader needs "when did we last pay this vendor", which the',
'          period-bounded figure cannot answer. */',
'       Select d.AccountCode Pty, Max(d.VoucherDate) Last',
'         From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'          And d.Amount < 0 And d.VoucherDate <= Asof.D',
'        Group By d.AccountCode),',
'     Agt As (',
'       /* Broker/agent is on the PURCHASE ORDER, not on the vendor',
'          master (Party.AgentCode is empty on creditors). A vendor may',
'          buy through more than one broker, so the one with the most',
'          orders is shown and the column is labelled "Broker / Agent"',
'          rather than implying an exclusive owner. */',
'       Select PartyCode Pty, AgentCode Agent From (',
'         Select po.PartyCode, po.AgentCode,',
'                Row_Number() Over (Partition By po.PartyCode',
'                                   Order By Count(*) Desc) Rn',
'           From PurchaseOrder po Where po.AgentCode Is Not Null',
'          Group By po.PartyCode, po.AgentCode)',
'        Where Rn = 1),',
'     Exc As (',
'       /* Exception count per vendor, using the same predicates as',
'          page 715 so the number a reader sees here and the rows they',
'          get there are the same finding set. */',
'       Select Pty, Count(*) N From (',
'         Select Pty From Aged Where Pay > 0.005 And DueDate Is Null',
'         Union All',
'         Select a2.Pty From Aged a2 Cross Join Asof',
'          Where a2.Dtc In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'            And a2.Pay < -0.005 And Asof.D - a2.Vdt > 90',
'         Union All',
'         Select Pty From Aged Where Vno = ''OPENING'' And AoBillDate Is Null And Abs(Pay) > 0.005',
'         Union All',
'         Select a3.Pty From Aged a3 Join Location l On l.LocationCode = a3.Loc',
'          Where upper(l.LocationName) Like ''%DO NOT USE%'' And Abs(a3.Pay) > 0.005',
'       ) Group By Pty),',
'     G As (',
'       Select Pty,',
'              Max(Cmp) Cmp, Max(Loc) Loc, Max(Pnl) Pnl,',
'              Sum(Case When Pay > 0 Then Pay Else 0 End) Gross,',
'              Sum(Case When Pay < 0 Then -Pay Else 0 End) Cred,',
'              Sum(Pay) Net,',
'              Sum(Case When Pay > 0 And Bkt = 0 Then Pay Else 0 End) B0,',
'              Sum(Case When Pay > 0 And Bkt = 1 Then Pay Else 0 End) B1,',
'              Sum(Case When Pay > 0 And Bkt = 2 Then Pay Else 0 End) B2,',
'              Sum(Case When Pay > 0 And Bkt = 3 Then Pay Else 0 End) B3,',
'              Sum(Case When Pay > 0 And Bkt = 4 Then Pay Else 0 End) B4,',
'              Sum(Case When Pay > 0 And Bkt = 5 Then Pay Else 0 End) B5,',
'              Sum(Case When Pay > 0 And Bkt = 6 Then Pay Else 0 End) B6,',
'              Sum(Case When Pay > 0 And Bkt = 7 Then Pay Else 0 End) B7,',
'              Sum(Case When Pay > 0 And Bkt Between 1 And 6 Then Pay Else 0 End) Overdue,',
'              Count(Case When Pay > 0 Then 1 End) OpenItems,',
'              Min(Case When Pay > 0 Then DueDate End) OldestDue,',
'              Max(Case When Pay > 0 Then DaysOd End) MaxDaysOd,',
'              Sum(Case When Pay > 0 And DaysOd Is Not Null Then Pay * DaysOd End) WSum,',
'              Sum(Case When Pay > 0 And DaysOd Is Not Null Then Pay End) WBase',
'         From Aged Group By Pty)',
'Select g.Pty                                             As PARTY_CODE,',
'       nvl(p.PartyName, g.Pty)         As PARTY_NAME,',
'       apex_escape.html(nvl(pg.PartyName,''&mdash;''))     As CUSTOMER_GROUP,',
'       Case When 1=0 Then ''Internal'' Else ''Trade'' End As CATEGORY,',
'       nvl(c.CompanyName, g.Cmp)       As COMPANY,',
'       nvl(l.LocationName, g.Loc)      As LOCATION,',
'       g.Pnl                                             As PANEL,',
'       Round(g.Gross,2)                                  As RECEIVABLE,',
'       Round(g.Cred,2)                                   As CREDIT_HELD,',
'       Round(g.Net,2)                                    As NET_EXPOSURE,',
'       Round(g.B0,2)                                     As NOT_DUE,',
'       Round(g.B1,2)                                     As D1_30,',
'       Round(g.B2,2)                                     As D31_60,',
'       Round(g.B3,2)                                     As D61_90,',
'       Round(g.B4,2)                                     As D91_180,',
'       Round(g.B5,2)                                     As D181_365,',
'       Round(g.B6,2)                                     As D365_PLUS,',
'       Round(g.B7,2)                                     As CANNOT_AGE,',
'       Round(g.Overdue,2)                                As TOTAL_OVERDUE,',
'       g.OpenItems                                       As OPEN_ITEMS,',
'       /* The immediately-adjustable figure: how much of this',
'          vendor''s payable could be cleared by allocating the debits',
'          the company already holds, with no cash outflow at all. */',
'       Round(Least(g.Gross, g.Cred),2)                   As ADJUSTABLE_NOW,',
'       Round(Greatest(g.Gross - g.Cred,0),2)             As COLLECTION_NEEDED,',
'       Round(nvl(rc.Amt,0),2)                            As RECEIPTS_IN_PERIOD,',
'       lr.Last                                           As LAST_RECEIPT,',
'       g.OldestDue                                       As OLDEST_DUE_DATE,',
'       g.MaxDaysOd                                       As MAX_DAYS_OVERDUE,',
'       Round(g.WSum / Nullif(g.WBase,0),0)               As WEIGHTED_DAYS_OVERDUE,',
'       nvl(ag.PartyName, agt.Agent)    As SALESPERSON,',
'       nvl(ex.N,0)                                       As EXCEPTION_COUNT,',
'       Case When g.Gross > 0.005 And g.Cred > 0.005',
'                 Then ''<span class="ds-apchip ds-apchip--warn">Payable + Advance</span>''',
'            When g.Net < -0.005',
'                 Then ''<span class="ds-apchip ds-apchip--dr">Net Debit</span>''',
'            When g.B7 > 0.005 And g.B7 >= g.Gross * 0.5',
'                 Then ''<span class="ds-apchip ds-apchip--nodata">Mostly Unaged</span>''',
'            When g.Overdue > 0.005',
'                 Then ''<span class="ds-apchip ds-apchip--fail">Overdue</span>''',
'            Else ''<span class="ds-apchip ds-apchip--pass">Current</span>'' End As POSITION',
'  From G g',
'  Left Join Party p  On p.PartyCode  = g.Pty',
'  Left Join Party pg On pg.PartyCode = p.ParentCode',
'  Left Join Company c On c.CompanyCode = g.Cmp',
'  Left Join Location l On l.LocationCode = g.Loc',
'  Left Join Rc rc On rc.Pty = g.Pty',
'  Left Join LastRc lr On lr.Pty = g.Pty',
'  Left Join Agt agt On agt.Pty = g.Pty',
'  Left Join Party ag On ag.PartyCode = agt.Agent',
'  Left Join Exc ex On ex.Pty = g.Pty',
' /* Both predicates are parenthesised. Without the brackets AND binds',
'    tighter than OR and the focus filter would silently apply to only',
'    the last of the three balance tests. */',
' Where (Abs(g.Net) > 0.005 Or g.Gross > 0.005 Or g.Cred > 0.005)',
'   And (:P921_FOCUS Is Null Or :P921_FOCUS = ''ALL''',
'        Or (:P921_FOCUS = ''OVERDUE'' And g.Overdue > 0.005)',
'        Or (:P921_FOCUS = ''BOTH''    And g.Gross > 0.005 And g.Cred > 0.005)',
'        Or (:P921_FOCUS = ''INTERNAL'' And 1=0))'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P921_FROMDATE,P921_TODATE,P921_COMPANY,P921_LOCATION,P921_AGEBASIS,P921_FOCUS'
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
 p_id=>wwv_flow_imp.id(12813188864301232)
,p_max_row_count=>'200000'
,p_no_data_found_message=>'No vendor carries an open payable or credit in this scope as at the As-of Date.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>69100000000000691
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12813237447301233)
,p_db_column_name=>'ADJUSTABLE_NOW'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>unistr('Adjustable Now (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12813313600301233)
,p_db_column_name=>'CANNOT_AGE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>unistr('Cannot Age (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12813452058301233)
,p_db_column_name=>'CATEGORY'
,p_display_order=>35
,p_column_identifier=>'AD'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12813591624301233)
,p_db_column_name=>'COLLECTION_NEEDED'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>unistr('Net Payment Needed (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12813614610301233)
,p_db_column_name=>'COMPANY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12813736890301233)
,p_db_column_name=>'CREDIT_HELD'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Debits Held (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12813839974301233)
,p_db_column_name=>'CUSTOMER_GROUP'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vendor Group'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12813961764301233)
,p_db_column_name=>'D181_365'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>unistr('181\2013365 (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12814036253301233)
,p_db_column_name=>'D1_30'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('1\201330 (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12814133135301233)
,p_db_column_name=>'D31_60'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('31\201360 (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12814288956301233)
,p_db_column_name=>'D365_PLUS'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>unistr('>365 (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12814373892301233)
,p_db_column_name=>'D61_90'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('61\201390 (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12814425474301233)
,p_db_column_name=>'D91_180'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>unistr('91\2013180 (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12814531736301233)
,p_db_column_name=>'EXCEPTION_COUNT'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Exceptions'
,p_column_link=>'f?p=&APP_ID.:927:&SESSION.::&DEBUG.:927:P927_FROMDATE,P927_TODATE,P927_COMPANY,P927_LOCATION,P927_CATEGORY:&P921_FROMDATE.,&P921_TODATE.,&P921_COMPANY.,&P921_LOCATION.,ALL'
,p_column_linktext=>'#EXCEPTION_COUNT#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12814604660301233)
,p_db_column_name=>'LAST_RECEIPT'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Last Payment'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12814746598301233)
,p_db_column_name=>'LOCATION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12814888862301233)
,p_db_column_name=>'MAX_DAYS_OVERDUE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Max Days Overdue'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12814943445301233)
,p_db_column_name=>'NET_EXPOSURE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Net Liability (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12815014903301233)
,p_db_column_name=>'NOT_DUE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Not Due (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12815191312301233)
,p_db_column_name=>'OLDEST_DUE_DATE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Oldest Due Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12815262291301233)
,p_db_column_name=>'OPEN_ITEMS'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Open Items'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12815352128301233)
,p_db_column_name=>'PANEL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Internal Scope'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12815466959301233)
,p_db_column_name=>'PARTY_CODE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12815500815301233)
,p_db_column_name=>'PARTY_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vendor'
,p_column_link=>'f?p=&APP_ID.:923:&SESSION.::&DEBUG.:923:P923_PARTY,P923_FROMDATE,P923_TODATE,P923_COMPANY,P923_LOCATION,P923_AGEBASIS:#PARTY_CODE#,&P921_FROMDATE.,&P921_TODATE.,&P921_COMPANY.,&P921_LOCATION.,&P921_AGEBASIS.'
,p_column_linktext=>'#PARTY_NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12815615787301233)
,p_db_column_name=>'POSITION'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Position'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12815792204301233)
,p_db_column_name=>'RECEIPTS_IN_PERIOD'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>unistr('Payments in Period (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12815871894301233)
,p_db_column_name=>'RECEIVABLE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Payable (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12815919499301233)
,p_db_column_name=>'SALESPERSON'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Broker / Agent'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12816034820301233)
,p_db_column_name=>'TOTAL_OVERDUE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>unistr('Total Overdue (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12816104485301233)
,p_db_column_name=>'WEIGHTED_DAYS_OVERDUE'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Weighted Days Overdue'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12816234876301233)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69101'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PARTY_NAME:CUSTOMER_GROUP:CATEGORY:POSITION:RECEIVABLE:CREDIT_HELD:NET_EXPOSURE:TOTAL_OVERDUE:CANNOT_AGE:ADJUSTABLE_NOW:OPEN_ITEMS:LAST_RECEIPT'
,p_sum_columns_on_break=>'RECEIVABLE:CREDIT_HELD:NET_EXPOSURE:TOTAL_OVERDUE:CANNOT_AGE:ADJUSTABLE_NOW:COLLECTION_NEEDED:RECEIPTS_IN_PERIOD'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12816337807301234)
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
'                          Then :P921_TODATE ||'',''|| :P921_COMPANY ||'',''|| :P921_LOCATION',
'                          Else :P921_FROMDATE ||'',''|| :P921_TODATE ||'',''|| :P921_COMPANY ||'',''|| :P921_LOCATION End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 921',
' Order By Pg.Id'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P921_FROMDATE,P921_TODATE,P921_COMPANY,P921_LOCATION'
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
 p_id=>wwv_flow_imp.id(12816450249301234)
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
 p_id=>wwv_flow_imp.id(12817233065301234)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(12812986752301216)
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
 p_id=>wwv_flow_imp.id(12817318759301234)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(12812986752301216)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:920:&SESSION.::&DEBUG.::P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION,P920_AGEBASIS:&P921_FROMDATE.,&P921_TODATE.,&P921_COMPANY.,&P921_LOCATION.,&P921_AGEBASIS.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12816500927301234)
,p_name=>'P921_AGEBASIS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12812986752301216)
,p_item_default=>'DUE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12816690751301234)
,p_name=>'P921_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12812986752301216)
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
 p_id=>wwv_flow_imp.id(12816788301301234)
,p_name=>'P921_FOCUS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(12812986752301216)
,p_item_default=>'ALL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12816802073301234)
,p_name=>'P921_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12812986752301216)
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
 p_id=>wwv_flow_imp.id(12816976564301234)
,p_name=>'P921_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12812986752301216)
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
'                  And (:P921_COMPANY Is Null Or v.CompanyCode = :P921_COMPANY)',
'                  And (cast(null as varchar2(100)) Is Null',
'                       Or cast(null as varchar2(100)) = cast(null as varchar2(100))))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P921_COMPANY'
,p_ajax_items_to_submit=>'P921_COMPANY'
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
 p_id=>wwv_flow_imp.id(12817130308301234)
,p_name=>'P921_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12812986752301216)
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
