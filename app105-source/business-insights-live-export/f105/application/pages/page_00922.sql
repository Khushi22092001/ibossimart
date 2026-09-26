prompt --application/pages/page_00922
begin
--   Manifest
--     PAGE: 00710
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
 p_id=>922
,p_name=>'Bill-wise Payable'
,p_alias=>'AP-OPEN-ITEMS'
,p_step_title=>'Bill-wise Payable'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#hspl-jet-l10n-fallback.js?version=#APP_VERSION#&cb=20260924a'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'One row per OPEN ITEM. In this ERP an open item is a VoucherDetail line on a SUNDRYCREDITORS account - there is no BillReference table. Bill identity, document date, due date and broker are resolved from the SOURCE DOCUMENT (the bill pass and its pur'
||'chase bill, the job-bill chain, a freight advice, a cash purchase, an external service entry, or AccountOpening for opening carry-forward), never from the ledger line: VoucherDetail.BillNo is not the bill reference. Every row carries its AP Item Clas'
||'s, because the control account also holds payments made TO vendors, sales billed TO vendors and opening carry-forward - none of which are unpaid supplier bills. Voucher No opens the existing Voucher Analysis page; the bill reference opens Bill Detail'
||'.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12817519663301234)
,p_name=>'Bill-wise Payable'
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
'    || ''<div class="ds-ap-eyebrow">Payables &middot; Open Items</div>''',
'    || ''<h1 class="ds-ap-title">Bill-wise Payable</h1>''',
'    || ''<div class="ds-ap-sub">Every open payable and vendor debit at line level, with its source document, ageing and full traceability into the general ledger</div>''',
'    || ''<div class="ds-ap-context">''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-crosshairs"></span>Open as at <b>'' || :P922_TODATE || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-hourglass-half"></span>Ageing basis <b>''',
'       || Case When :P922_AGEBASIS = ''DOC'' Then ''Document date (age)'' Else ''Due date (lateness)'' End || ''</b></span>''',
'    || Case When nvl(:P922_BUCKET,''ALL'') <> ''ALL'' Then',
'            ''<span class="ds-ap-chip ds-ap-chip--warn"><span class="fa fa-filter"></span>Showing <b>''',
'            || Case :P922_BUCKET When ''0'' Then ''Not Due'' When ''1'' Then ''1-30 days''',
'                                 When ''2'' Then ''31-60 days'' When ''3'' Then ''61-90 days''',
'                                 When ''4'' Then ''91-180 days'' When ''5'' Then ''181-365 days''',
'                                 When ''6'' Then ''over 365 days'' When ''7'' Then ''Cannot Age - no due date''',
'                                 When ''90'' Then ''90+ days'' When ''OD'' Then ''all overdue''',
'                                 When ''D7''  Then ''due within the next 7 days''',
'                                 When ''D30'' Then ''due within the next 30 days''',
'                                 When ''WTD'' Then ''aged items - those carrying a due date''',
'                                 When ''CR'' Then ''vendor credits only'' Else :P922_BUCKET End',
'            || ''</b> only</span>'' End',
'    || ''<span class="ds-ap-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P922_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P922_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P922_FROMDATE,P922_TODATE,P922_COMPANY,P922_LOCATION,P922_AGEBASIS,P922_BUCKET'
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
 p_id=>wwv_flow_imp.id(12817692748301234)
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
 p_id=>wwv_flow_imp.id(12817744112301234)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p710Filters'
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
 p_id=>wwv_flow_imp.id(12817803046301252)
,p_plug_name=>'Open Items'
,p_static_id=>'items'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* CANONICAL AP PROLOGUE - identical to pages 708 and 709.',
'   docs/ap-dashboard/AP_KPI_DEFINITION.md section 1. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P922_TODATE,''DD-MM-RRRR'') D From dual),',
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
'     Nr As (',
'       /* Number of settlements allocated to this item, and the date of',
'          the latest one. Aggregated to (Tno,Sno) BEFORE it is joined - a',
'          bill is settled by many payments, so joining the bridge raw',
'          would duplicate the outstanding amount on every row. */',
'       Select a.DrVoucherTno Tno, a.DrVoucherSno Sno,',
'              Count(*) N, Max(cv.VoucherDate) Last',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'        Group By a.DrVoucherTno, a.DrVoucherSno),',
'     Adj As (',
'       /* Debit and Credit Adjustment, split by what was on the OTHER',
'          side of each allocation. This ERP has no bill-level link from',
'          a credit note to the invoice it adjusts - the allocation',
'          bridge is the only place that relationship is recorded - so',
'          the split is derived from the counterpart voucher''s DocTypeCode',
'          rather than invented. An allocation against a PAYMENT is a',
'          settlement, not an adjustment, and is excluded from both. */',
'       Select a.DrVoucherTno Tno, a.DrVoucherSno Sno,',
'              Sum(Case When cv.DocTypeCode = ''CREDITNOTE'' Then a.Amount Else 0 End) CrAdj,',
'              Sum(Case When cv.DocTypeCode = ''DEBITNOTE''  Then a.Amount Else 0 End) DrAdj',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'          And cv.DocTypeCode In (''CREDITNOTE'',''DEBITNOTE'')',
'        Group By a.DrVoucherTno, a.DrVoucherSno),',
'     Aged As (',
'       Select d.Tno, d.Sno, d.AccountCode Pty, d.CompanyCode Cmp,',
'              d.LocationCode Loc, cast(null as varchar2(100)) Pnl, d.VoucherDate Vdt, d.Narration Nrt,',
'              v.VoucherNo Vno, v.DocTypeCode Dtc, v.ModuleCode Mc,',
'              d.Amount Amt, nvl(al.Amt,0) Alloc,',
'              (d.Amount - nvl(al.Amt,0)) Pay,',
'              coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate) DocDate,',
'              coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) DueDate,',
'              coalesce(pt.Pbn, jt.Pbn, fa.PartyBillNo,',
'                       ese.BillNo, dn.DebitNoteNo, ao.BillNo, v.VoucherNo) BillRef,',
'              ao.BillDate AoBillDate,',
'              pt.Agt Agent,',
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
'                   Else ''Journal'' End Cls,',
'              Case When nvl(:P922_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) Is Null Then 7',
'                   When nvl(:P922_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) >= Asof.D Then 0',
'                   When (Case When :P922_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <=  30 Then 1',
'                   When (Case When :P922_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <=  60 Then 2',
'                   When (Case When :P922_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <=  90 Then 3',
'                   When (Case When :P922_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <= 180 Then 4',
'                   When (Case When :P922_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0) End) <= 365 Then 5',
'                   Else 6 End Bkt,',
'              Case When :P922_AGEBASIS = ''DOC''',
'                   Then Asof.D - coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate)',
'                   When coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) Is Not Null',
'                   Then Greatest(Asof.D - coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate),0)',
'              End DaysOd',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join (Select pp.Tno Tno,',
'                           Max(pb.PartyBillNo) Pbn,',
'                           Max(po.AgentCode) Agt,',
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
'                           Max(jb.PartyBillNo) Pbn,',
'                           coalesce(Max(jb.PartyBillDate), Max(jb.JobBillDate)) DocDt,',
'                           Max(jb.JobBillDate) + nvl(Max(jo.CreditDays),0) DueDt',
'                      From JBPass jp',
'                      Join JobBill jb On jb.Tno = jp.JobBillTno',
'                      Left Join JobOrder jo On jo.Tno = jb.JobOrderTno',
'                     Group By jp.Tno) jt On v.ModuleCode = ''JBPASS'' And jt.Tno = v.ModuleTno',
'         Left Join FreightAdvice fa On v.ModuleCode = ''FREIGHTADVICE'' And fa.Tno = v.ModuleTno',
'         /* HSPL has CASHPURCHASE as a module code but no CashPurchase',
'            source table. For those vouchers BillRef therefore falls',
'            through to Voucher.VoucherNo instead of failing the page. */',
'         Left Join ExternalServicesEntry ese',
'                On v.ModuleCode = ''EXTERNALSERVICESENTRY'' And ese.Tno = v.ModuleTno',
'         Left Join DebitNote dn On v.ModuleCode = ''DEBITNOTE'' And dn.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P922_COMPANY  Is Null Or d.CompanyCode  = :P922_COMPANY)',
'          And (:P922_LOCATION Is Null Or d.LocationCode = :P922_LOCATION))',
'Select a.Tno                                             As VOUCHER_TNO,',
'       a.Sno                                             As VOUCHER_SNO,',
'       a.Vno                                             As VOUCHER_NO,',
'       nvl(p.PartyName, a.Pty)         As CUSTOMER,',
'       a.Pty                                             As PARTY_CODE,',
'       ''<span class="ds-apclass">'' || a.Cls || ''</span>'' As ITEM_CLASS,',
'       a.BillRef                       As BILL_REFERENCE,',
'       nvl(a.Mc, a.Dtc)                                  As SOURCE_MODULE,',
'       a.DocDate                                         As DOCUMENT_DATE,',
'       a.Vdt                                             As POSTING_DATE,',
'       a.DueDate                                         As DUE_DATE,',
'       Round(Abs(a.Amt),2)                               As ORIGINAL_AMOUNT,',
'       Round(Abs(a.Alloc),2)                             As ALLOCATED,',
'       Round(nvl(adj.DrAdj,0),2)                         As DEBIT_ADJUSTMENT,',
'       Round(nvl(adj.CrAdj,0),2)                         As CREDIT_ADJUSTMENT,',
'       /* Per-item exception count, using the same predicates as page',
'          696 so this number and that report''s rows are one finding set. */',
'       (Case When a.Pay > 0.005 And a.DueDate Is Null Then 1 Else 0 End',
'      + Case When a.Dtc In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'') And a.Pay < -0.005',
'                  And (Select D From Asof) - a.Vdt > 90 Then 1 Else 0 End',
'      + Case When a.Vno = ''OPENING'' And a.AoBillDate Is Null',
'                  And Abs(a.Pay) > 0.005 Then 1 Else 0 End',
'      + Case When a.Pnl Is Null Then 1 Else 0 End)       As EXCEPTION_COUNT,',
'       Round(Case When a.Pay > 0 Then a.Pay Else 0 End,2)  As OUTSTANDING,',
'       Round(Case When a.Pay < 0 Then -a.Pay Else 0 End,2) As CREDIT_OPEN,',
'       a.DaysOd                                          As DAYS_OVERDUE,',
'       Case a.Bkt When 0 Then ''Not Due'' When 1 Then ''1-30'' When 2 Then ''31-60''',
'                  When 3 Then ''61-90'' When 4 Then ''91-180'' When 5 Then ''181-365''',
'                  When 6 Then ''>365''',
'                  Else ''<span class="ds-apchip ds-apchip--nodata">Cannot Age</span>'' End As AGEING_BUCKET,',
'       nvl(nr.N,0)                                       As SETTLEMENTS,',
'       nr.Last                                           As LAST_SETTLEMENT,',
'       nvl(ag.PartyName, a.Agent)      As AGENT,',
'       nvl(c.CompanyName, a.Cmp)       As COMPANY,',
'       nvl(l.LocationName, a.Loc)      As LOCATION,',
'       a.Pnl                                             As PANEL,',
'       substr(a.Nrt,1,300)             As NARRATION',
'  From Aged a',
'  Left Join Party p On p.PartyCode = a.Pty',
'  Left Join Party ag On ag.PartyCode = a.Agent',
'  Left Join Company c On c.CompanyCode = a.Cmp',
'  Left Join Location l On l.LocationCode = a.Loc',
'  Left Join Nr nr On nr.Tno = a.Tno And nr.Sno = a.Sno',
'  Left Join Adj adj On adj.Tno = a.Tno And adj.Sno = a.Sno',
' Where Round(a.Pay,2) <> 0',
'   /* The bucket filter is what makes every KPI on page 708 land on',
'      exactly its own rows. Each branch mirrors one card''s predicate. */',
'   And (nvl(:P922_BUCKET,''ALL'') = ''ALL''',
'        Or (:P922_BUCKET = ''OD'' And a.Pay > 0 And a.Bkt Between 1 And 6)',
'        Or (:P922_BUCKET = ''90'' And a.Pay > 0 And a.Bkt Between 4 And 6)',
'        Or (:P922_BUCKET = ''CR'' And a.Pay < 0)',
'        /* DT / D7 / D30 / WTD exist so the forward-looking cards on',
'           page 708 can drill. Bucket 0 (Not Due) is far wider than',
'           any of these windows, so it cannot stand in for them. The',
'           7/30-day windows are open at the lower bound - an item due',
'           exactly on the As-of Date belongs to Due Today (DT), not to',
'           "due next 7 days" - which is what each card sums, so card',
'           and drill-down must agree. */',
'        Or (:P922_BUCKET = ''DT''  And a.Pay > 0',
'            And a.DueDate = (Select D From Asof))',
'        Or (:P922_BUCKET = ''D7''  And a.Pay > 0',
'            And a.DueDate >  (Select D From Asof)',
'            And a.DueDate <= (Select D From Asof) + 7)',
'        Or (:P922_BUCKET = ''D30'' And a.Pay > 0',
'            And a.DueDate >  (Select D From Asof)',
'            And a.DueDate <= (Select D From Asof) + 30)',
'        /* Band windows for the cash-requirement strip on page 718 -',
'           bands, not cumulative windows, so the six cells add up to',
'           the 90-day requirement without double counting. */',
'        Or (:P922_BUCKET = ''B815'' And a.Pay > 0',
'            And a.DueDate >  (Select D From Asof) + 7',
'            And a.DueDate <= (Select D From Asof) + 15)',
'        Or (:P922_BUCKET = ''B1630'' And a.Pay > 0',
'            And a.DueDate >  (Select D From Asof) + 15',
'            And a.DueDate <= (Select D From Asof) + 30)',
'        Or (:P922_BUCKET = ''B3160'' And a.Pay > 0',
'            And a.DueDate >  (Select D From Asof) + 30',
'            And a.DueDate <= (Select D From Asof) + 60)',
'        Or (:P922_BUCKET = ''B6190'' And a.Pay > 0',
'            And a.DueDate >  (Select D From Asof) + 60',
'            And a.DueDate <= (Select D From Asof) + 90)',
'        /* WTD is the population the Weighted Days Overdue average runs',
'           over - every open payable that HAS a due date, due and',
'           overdue alike. Items with no due date are excluded from both',
'           the numerator and the denominator, so they are excluded here. */',
'        Or (:P922_BUCKET = ''WTD'' And a.Pay > 0 And a.DueDate Is Not Null)',
'        Or (:P922_BUCKET In (''0'',''1'',''2'',''3'',''4'',''5'',''6'',''7'')',
'            And a.Pay > 0 And a.Bkt = to_number(:P922_BUCKET)))'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P922_FROMDATE,P922_TODATE,P922_COMPANY,P922_LOCATION,P922_AGEBASIS,P922_BUCKET'
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
 p_id=>wwv_flow_imp.id(12817956198301252)
,p_max_row_count=>'200000'
,p_no_data_found_message=>'No open item matches this scope and bucket as at the As-of Date.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>69200000000000692
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12818002424301252)
,p_db_column_name=>'AGEING_BUCKET'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Ageing Bucket'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12818196229301253)
,p_db_column_name=>'AGENT'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Agent'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12818277464301253)
,p_db_column_name=>'ALLOCATED'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Allocated (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12818306220301253)
,p_db_column_name=>'BILL_REFERENCE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Bill Reference'
,p_column_link=>'f?p=&APP_ID.:929:&SESSION.::&DEBUG.:929:P929_TNO,P929_SNO,P929_TODATE,P929_FROMDATE,P929_PARTY:#VOUCHER_TNO#,#VOUCHER_SNO#,&P922_TODATE.,&P922_FROMDATE.,#PARTY_CODE#'
,p_column_linktext=>'#BILL_REFERENCE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12818440133301253)
,p_db_column_name=>'COMPANY'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12818556003301253)
,p_db_column_name=>'CREDIT_ADJUSTMENT'
,p_display_order=>124
,p_column_identifier=>'Z'
,p_column_label=>unistr('Credit Adjustment (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12818600059301253)
,p_db_column_name=>'CREDIT_OPEN'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('Debit Open (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12818711453301253)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vendor'
,p_column_link=>'f?p=&APP_ID.:923:&SESSION.::&DEBUG.:923:P923_PARTY,P923_FROMDATE,P923_TODATE,P923_COMPANY,P923_LOCATION,P923_AGEBASIS:#PARTY_CODE#,&P922_FROMDATE.,&P922_TODATE.,&P922_COMPANY.,&P922_LOCATION.,&P922_AGEBASIS.'
,p_column_linktext=>'#CUSTOMER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12818888865301253)
,p_db_column_name=>'DAYS_OVERDUE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Days Overdue'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12818907413301253)
,p_db_column_name=>'DEBIT_ADJUSTMENT'
,p_display_order=>122
,p_column_identifier=>'Y'
,p_column_label=>unistr('Debit Adjustment (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12819002204301253)
,p_db_column_name=>'DOCUMENT_DATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Document Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12819146579301253)
,p_db_column_name=>'DUE_DATE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Due Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12819295737301253)
,p_db_column_name=>'EXCEPTION_COUNT'
,p_display_order=>126
,p_column_identifier=>'AA'
,p_column_label=>'Exceptions'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12819328482301253)
,p_db_column_name=>'ITEM_CLASS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'AP Item Class'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12819429204301253)
,p_db_column_name=>'LAST_SETTLEMENT'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Last Settlement'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12819525352301253)
,p_db_column_name=>'LOCATION'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12819621890301253)
,p_db_column_name=>'NARRATION'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12819750933301253)
,p_db_column_name=>'ORIGINAL_AMOUNT'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Original (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12819862773301253)
,p_db_column_name=>'OUTSTANDING'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('Outstanding (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12819969249301253)
,p_db_column_name=>'PANEL'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Internal Scope'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12820036276301253)
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
 p_id=>wwv_flow_imp.id(12820144801301253)
,p_db_column_name=>'POSTING_DATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Posting Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12820271621301253)
,p_db_column_name=>'SETTLEMENTS'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Settlements'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12820388384301253)
,p_db_column_name=>'SOURCE_MODULE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Source'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12820434284301253)
,p_db_column_name=>'VOUCHER_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Voucher No'
,p_column_link=>'f?p=&APP_ID.:678:&SESSION.::&DEBUG.:678:P678_TNO:#VOUCHER_TNO#'
,p_column_linktext=>'#VOUCHER_NO#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12820580090301253)
,p_db_column_name=>'VOUCHER_SNO'
,p_display_order=>65
,p_column_identifier=>'X'
,p_column_label=>'Sno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12820611556301253)
,p_db_column_name=>'VOUCHER_TNO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12820753630301253)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69201'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VOUCHER_NO:CUSTOMER:ITEM_CLASS:BILL_REFERENCE:DOCUMENT_DATE:DUE_DATE:ORIGINAL_AMOUNT:ALLOCATED:OUTSTANDING:CREDIT_OPEN:DAYS_OVERDUE:AGEING_BUCKET'
,p_sum_columns_on_break=>'ORIGINAL_AMOUNT:ALLOCATED:OUTSTANDING:CREDIT_OPEN'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12820894004301253)
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
'                          Then :P922_TODATE ||'',''|| :P922_COMPANY ||'',''|| :P922_LOCATION',
'                          Else :P922_FROMDATE ||'',''|| :P922_TODATE ||'',''|| :P922_COMPANY ||'',''|| :P922_LOCATION End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 922',
' Order By Pg.Id'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P922_FROMDATE,P922_TODATE,P922_COMPANY,P922_LOCATION'
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
 p_id=>wwv_flow_imp.id(12820988676301253)
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
 p_id=>wwv_flow_imp.id(12821820515301254)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(12817744112301234)
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
 p_id=>wwv_flow_imp.id(12821986654301254)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(12817744112301234)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:920:&SESSION.::&DEBUG.::P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION,P920_AGEBASIS:&P922_FROMDATE.,&P922_TODATE.,&P922_COMPANY.,&P922_LOCATION.,&P922_AGEBASIS.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12821096519301253)
,p_name=>'P922_AGEBASIS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(12817744112301234)
,p_item_default=>'DUE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12821151283301254)
,p_name=>'P922_BUCKET'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12817744112301234)
,p_item_default=>'ALL'
,p_prompt=>'Show'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Everything open;ALL,All overdue;OD,90+ days;90,Not Due;0,Due next 7 days;D7,Due next 30 days;D30,1-30;1,31-60;2,61-90;3,91-180;4,181-365;5,Over 365;6,Cannot Age;7,Aged items - due date known;WTD,Vendor credits;CR'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>'Mirrors the KPI cards on the command centre. Each option is the same predicate the card counted, so a card and this report can never disagree.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12821394862301254)
,p_name=>'P922_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12817744112301234)
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
 p_id=>wwv_flow_imp.id(12821484718301254)
,p_name=>'P922_FROMDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12817744112301234)
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
 p_id=>wwv_flow_imp.id(12821550987301254)
,p_name=>'P922_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12817744112301234)
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
'                  And (:P922_COMPANY Is Null Or v.CompanyCode = :P922_COMPANY)',
'                  And (cast(null as varchar2(100)) Is Null',
'                       Or cast(null as varchar2(100)) = cast(null as varchar2(100))))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P922_COMPANY'
,p_ajax_items_to_submit=>'P922_COMPANY'
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
 p_id=>wwv_flow_imp.id(12821731533301254)
,p_name=>'P922_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12817744112301234)
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
