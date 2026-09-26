prompt --application/pages/page_00692
begin
--   Manifest
--     PAGE: 00692
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
 p_id=>692
,p_name=>'Bill-wise Outstanding'
,p_alias=>'AR-OPEN-ITEMS'
,p_step_title=>'Bill-wise Outstanding'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(9965686798286257)
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'One row per OPEN ITEM. In this ERP an open item is a VoucherDetail line on a SUNDRYDEBTORS account - there is no BillReference table. Bill identity, document date, due date and agent are resolved from the SOURCE DOCUMENT (Invoice, ServiceBill, Credit'
||'Note, or AccountOpening for opening carry-forward), never from the ledger line: VoucherDetail.BillNo is null on 97% of AR rows and is not the bill reference. Every row carries its AR Item Class, because the control account also holds payments made TO'
||' customers, purchases FROM customers and opening carry-forward - none of which are unpaid sales invoices. Voucher No opens the existing Voucher Analysis page; Customer opens Ledger Account Analysis.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12702930742300587)
,p_name=>'Bill-wise Outstanding'
,p_static_id=>'command-header'
,p_template=>4502917002193490937
,p_display_sequence=>5
,p_region_css_classes=>'ds-ar-headregion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''<div class="ds-ar-head">''',
'    || ''<div class="ds-ar-eyebrow">Receivables &middot; Open Items</div>''',
'    || ''<h1 class="ds-ar-title">Bill-wise Outstanding</h1>''',
'    || ''<div class="ds-ar-sub">Every open receivable and customer credit at line level, with its source document, ageing and full traceability into the general ledger</div>''',
'    || ''<div class="ds-ar-context">''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-crosshairs"></span>Open as at <b>'' || :P692_TODATE || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-hourglass-half"></span>Ageing basis <b>''',
'       || Case When :P692_AGEBASIS = ''DOC'' Then ''Document date (age)'' Else ''Due date (lateness)'' End || ''</b></span>''',
'    || Case When nvl(:P692_BUCKET,''ALL'') <> ''ALL'' Then',
'            ''<span class="ds-ar-chip ds-ar-chip--warn"><span class="fa fa-filter"></span>Showing <b>''',
'            || Case :P692_BUCKET When ''0'' Then ''Not Due'' When ''1'' Then ''1-30 days''',
'                                 When ''2'' Then ''31-60 days'' When ''3'' Then ''61-90 days''',
'                                 When ''4'' Then ''91-180 days'' When ''5'' Then ''181-365 days''',
'                                 When ''6'' Then ''over 365 days'' When ''7'' Then ''Cannot Age - no due date''',
'                                 When ''90'' Then ''90+ days'' When ''OD'' Then ''all overdue''',
'                                 When ''D7''  Then ''due within the next 7 days''',
'                                 When ''D30'' Then ''due within the next 30 days''',
'                                 When ''WTD'' Then ''aged items - those carrying a due date''',
'                                 When ''CR'' Then ''customer credits only'' Else :P692_BUCKET End',
'            || ''</b> only</span>'' End',
'    || ''<span class="ds-ar-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P692_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P692_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-shield"></span>Panel <b>''',
'       || Case When (Select GetUserPanelAB_apex() From dual) Is Not Null',
'               Then (Select GetUserPanelAB_apex() From dual) || '' (enforced)''',
'               When :P692_PANEL Is Not Null Then :P692_PANEL Else ''A + B'' End || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P692_FROMDATE,P692_TODATE,P692_COMPANY,P692_LOCATION,P692_PANEL,P692_AGEBASIS,P692_BUCKET'
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
 p_id=>wwv_flow_imp.id(12703000727300587)
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
 p_id=>wwv_flow_imp.id(12703148978300587)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p692Filters'
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
 p_id=>wwv_flow_imp.id(12703239987300616)
,p_plug_name=>'Open Items'
,p_static_id=>'items'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* CANONICAL AR PROLOGUE - identical to pages 690 and 691.',
'   docs/ar-dashboard/AR_KPI_DEFINITION.md section 1. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P692_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       /* Number of receipts allocated to this item, and the date of the',
'          latest one. Aggregated to (Tno,Sno) BEFORE it is joined - a',
'          bill is settled by many receipts, so joining the bridge raw',
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
'          rather than invented. An allocation against a RECEIPT is a',
'          collection, not an adjustment, and is excluded from both. */',
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
'              d.LocationCode Loc, d.Panel Pnl, d.VoucherDate Vdt, d.Narration Nrt,',
'              v.VoucherNo Vno, v.DocTypeCode Dtc, v.ModuleCode Mc,',
'              d.Amount Amt, nvl(al.Amt,0) Alloc,',
'              -(d.Amount - nvl(al.Amt,0)) Recv,',
'              coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate) DocDate,',
'              coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) DueDate,',
'              coalesce(i.InvoiceNo, sb.ServiceBillNo, cn.CreditNoteNo, ao.BillNo, v.VoucherNo) BillRef,',
'              ao.BillDate AoBillDate,',
'              i.AgentCode Agent,',
'              Case When v.VoucherNo = ''OPENING''      Then ''Opening Carry-forward''',
'                   When v.ModuleCode = ''INVOICE''     Then ''Trade Invoice''',
'                   When v.ModuleCode = ''SERVICEBILL'' Then ''Service Bill''',
'                   When v.ModuleCode = ''CREDITNOTE''  Then ''Credit Note''',
'                   When v.ModuleCode = ''DEBITNOTE''   Then ''Debit Note''',
'                   When v.ModuleCode = ''PBPASS''      Then ''Contra Purchase''',
'                   When v.DocTypeCode = ''RECEIPT''    Then ''Receipt / On-account''',
'                   When v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'                                                     Then ''Payment to Customer''',
'                   Else ''Journal'' End Cls,',
'              Case When nvl(:P692_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) Is Null Then 7',
'                   When nvl(:P692_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) >= Asof.D Then 0',
'                   When (Case When :P692_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <=  30 Then 1',
'                   When (Case When :P692_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <=  60 Then 2',
'                   When (Case When :P692_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <=  90 Then 3',
'                   When (Case When :P692_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <= 180 Then 4',
'                   When (Case When :P692_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <= 365 Then 5',
'                   Else 6 End Bkt,',
'              Case When :P692_AGEBASIS = ''DOC''',
'                   Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                   When coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) Is Not Null',
'                   Then Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0)',
'              End DaysOd',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join CreditNote  cn On v.ModuleCode = ''CREDITNOTE''  And cn.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P692_PANEL    Is Null Or d.Panel        = :P692_PANEL)',
'          And (:P692_COMPANY  Is Null Or d.CompanyCode  = :P692_COMPANY)',
'          And (:P692_LOCATION Is Null Or d.LocationCode = :P692_LOCATION))',
'Select a.Tno                                             As VOUCHER_TNO,',
'       a.Sno                                             As VOUCHER_SNO,',
'       a.Vno                                             As VOUCHER_NO,',
'       nvl(p.PartyName, a.Pty)         As CUSTOMER,',
'       a.Pty                                             As PARTY_CODE,',
'       ''<span class="ds-arclass">'' || a.Cls || ''</span>'' As ITEM_CLASS,',
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
'       (Case When a.Recv > 0.005 And a.DueDate Is Null Then 1 Else 0 End',
'      + Case When a.Dtc = ''RECEIPT'' And a.Recv < -0.005',
'                  And (Select D From Asof) - a.Vdt > 90 Then 1 Else 0 End',
'      + Case When a.Vno = ''OPENING'' And a.AoBillDate Is Null',
'                  And Abs(a.Recv) > 0.005 Then 1 Else 0 End',
'      + Case When a.Pnl Is Null Then 1 Else 0 End)       As EXCEPTION_COUNT,',
'       Round(Case When a.Recv > 0 Then a.Recv Else 0 End,2)  As OUTSTANDING,',
'       Round(Case When a.Recv < 0 Then -a.Recv Else 0 End,2) As CREDIT_OPEN,',
'       a.DaysOd                                          As DAYS_OVERDUE,',
'       Case a.Bkt When 0 Then ''Not Due'' When 1 Then ''1-30'' When 2 Then ''31-60''',
'                  When 3 Then ''61-90'' When 4 Then ''91-180'' When 5 Then ''181-365''',
'                  When 6 Then ''>365''',
'                  Else ''<span class="ds-archip ds-archip--nodata">Cannot Age</span>'' End As AGEING_BUCKET,',
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
' Where Round(a.Recv,2) <> 0',
'   /* The bucket filter is what makes every KPI on page 690 land on',
'      exactly its own rows. Each branch mirrors one card''s predicate. */',
'   And (nvl(:P692_BUCKET,''ALL'') = ''ALL''',
'        Or (:P692_BUCKET = ''OD'' And a.Recv > 0 And a.Bkt Between 1 And 6)',
'        Or (:P692_BUCKET = ''90'' And a.Recv > 0 And a.Bkt Between 4 And 6)',
'        Or (:P692_BUCKET = ''CR'' And a.Recv < 0)',
'        /* D7 / D30 / WTD exist so the three forward-looking cards on',
'           page 690 can drill. Bucket 0 (Not Due) is far wider than',
'           either window, so it cannot stand in for them. The windows',
'           are open at the lower bound - an item due exactly on the',
'           As-of Date is already overdue, not "due next 7 days" - which',
'           is what the card sums, so the two must agree. */',
'        Or (:P692_BUCKET = ''D7''  And a.Recv > 0',
'            And a.DueDate >  (Select D From Asof)',
'            And a.DueDate <= (Select D From Asof) + 7)',
'        Or (:P692_BUCKET = ''D30'' And a.Recv > 0',
'            And a.DueDate >  (Select D From Asof)',
'            And a.DueDate <= (Select D From Asof) + 30)',
'        /* WTD is the population the Weighted Days Overdue average runs',
'           over - every open receivable that HAS a due date, due and',
'           overdue alike. Items with no due date are excluded from both',
'           the numerator and the denominator, so they are excluded here. */',
'        Or (:P692_BUCKET = ''WTD'' And a.Recv > 0 And a.DueDate Is Not Null)',
'        Or (:P692_BUCKET In (''0'',''1'',''2'',''3'',''4'',''5'',''6'',''7'')',
'            And a.Recv > 0 And a.Bkt = to_number(:P692_BUCKET)))'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P692_FROMDATE,P692_TODATE,P692_COMPANY,P692_LOCATION,P692_PANEL,P692_AGEBASIS,P692_BUCKET'
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
 p_id=>wwv_flow_imp.id(12703319940300617)
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
 p_id=>wwv_flow_imp.id(12703438021300617)
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
 p_id=>wwv_flow_imp.id(12703532776300617)
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
 p_id=>wwv_flow_imp.id(12703692593300617)
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
 p_id=>wwv_flow_imp.id(12703781891300617)
,p_db_column_name=>'BILL_REFERENCE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Bill Reference'
,p_column_link=>'f?p=&APP_ID.:698:&SESSION.::&DEBUG.:698:P698_TNO,P698_SNO,P698_TODATE,P698_FROMDATE,P698_PARTY:#VOUCHER_TNO#,#VOUCHER_SNO#,&P692_TODATE.,&P692_FROMDATE.,#PARTY_CODE#'
,p_column_linktext=>'#BILL_REFERENCE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12703869368300617)
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
 p_id=>wwv_flow_imp.id(12703935508300617)
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
 p_id=>wwv_flow_imp.id(12704099601300617)
,p_db_column_name=>'CREDIT_OPEN'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('Credit Open (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12704126429300617)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Customer'
,p_column_link=>'f?p=&APP_ID.:693:&SESSION.::&DEBUG.:693:P693_PARTY,P693_FROMDATE,P693_TODATE,P693_COMPANY,P693_LOCATION,P693_PANEL,P693_AGEBASIS:#PARTY_CODE#,&P692_FROMDATE.,&P692_TODATE.,&P692_COMPANY.,&P692_LOCATION.,&P692_PANEL.,&P692_AGEBASIS.'
,p_column_linktext=>'#CUSTOMER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12704264678300617)
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
 p_id=>wwv_flow_imp.id(12704311570300617)
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
 p_id=>wwv_flow_imp.id(12704472286300617)
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
 p_id=>wwv_flow_imp.id(12704594405300617)
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
 p_id=>wwv_flow_imp.id(12704682351300618)
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
 p_id=>wwv_flow_imp.id(12704705265300618)
,p_db_column_name=>'ITEM_CLASS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'AR Item Class'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12704876644300618)
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
 p_id=>wwv_flow_imp.id(12704963198300618)
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
 p_id=>wwv_flow_imp.id(12705017138300618)
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
 p_id=>wwv_flow_imp.id(12705142470300618)
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
 p_id=>wwv_flow_imp.id(12705277731300618)
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
 p_id=>wwv_flow_imp.id(12705363318300618)
,p_db_column_name=>'PANEL'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Panel'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12705432469300618)
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
 p_id=>wwv_flow_imp.id(12705527053300618)
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
 p_id=>wwv_flow_imp.id(12705654000300618)
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
 p_id=>wwv_flow_imp.id(12705736543300618)
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
 p_id=>wwv_flow_imp.id(12705807844300618)
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
 p_id=>wwv_flow_imp.id(12705964517300618)
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
 p_id=>wwv_flow_imp.id(12706039320300618)
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
 p_id=>wwv_flow_imp.id(12706152827300618)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69201'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VOUCHER_NO:CUSTOMER:ITEM_CLASS:BILL_REFERENCE:DOCUMENT_DATE:DUE_DATE:ORIGINAL_AMOUNT:ALLOCATED:OUTSTANDING:CREDIT_OPEN:DAYS_OVERDUE:AGEING_BUCKET'
,p_sum_columns_on_break=>'ORIGINAL_AMOUNT:ALLOCATED:OUTSTANDING:CREDIT_OPEN'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12706262617300619)
,p_name=>'Go to'
,p_static_id=>'quick-links'
,p_template=>4502917002193490937
,p_display_sequence=>900
,p_region_css_classes=>'ds-kpiwrap ds-arnavwrap'
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
'  Select 690 Id, ''AR Command Centre''          Nm, ''Exposure, ageing, collections and the exceptions behind every number'' Sub, ''fa-dashboard''              Ic From dual Union All',
'  Select 691,    ''Party-wise Outstanding'',        ''One row per customer, with ageing and the contact position'',           ''fa-users''                  From dual Union All',
'  Select 692,    ''Bill-wise Outstanding'',         ''Every open item at line level, with its source document'',              ''fa-list-alt''               From dual Union All',
'  Select 693,    ''Debtor 360'',                    ''One customer from every angle - bills, receipts, credits, statement'',  ''fa-user''                   From dual Union All',
'  Select 694,    ''Receipts and Collections'',      ''Cash actually received, which bank took it, how much is applied'',      ''fa-download''               From dual Union All',
'  Select 695,    ''Advances and Unapplied Cash'',   ''Customer money already held, and the receivable it could clear'',       ''fa-hand-o-up''              From dual Union All',
'  Select 696,    ''Exceptions and Controls'',       ''Every control, what it tests, and the records that fail it'',           ''fa-exclamation-triangle''   From dual Union All',
'  Select 697,    ''Reconciliation and Data Health'',''The open-item register against the general-ledger control account'',    ''fa-balance-scale''          From dual Union All',
'  Select 699,    ''Trend Analysis'',                ''How the position moved, month by month'',                               ''fa-line-chart''             From dual Union All',
'  Select 700,    ''Daily Collection MIS'',          ''One day: position, movement, and what remains unexplained'',            ''fa-calendar-o''             From dual Union All',
'  Select 701,    ''Weekly AR Review'',              ''Opening against closing, and the controls that failed in the week'',    ''fa-calendar''               From dual Union All',
'  Select 702,    ''Monthly Management MIS'',        ''The nine-section management pack'',                                     ''fa-file-text-o''            From dual)',
'Select ''<a class="ds-kpi ds-kpi--link ds-kpi--teal" href="''',
'    || apex_page.get_url(',
'         p_page        => Pg.Id,',
'         p_clear_cache => to_char(Pg.Id),',
'         /* Page 700 is a single-day report and has no From/To pair -',
'            naming an item that does not exist on the target page',
'            fails at run time, so its filter list is built separately. */',
'         p_items  => Case When Pg.Id = 700',
'                          Then ''P700_DAY,P700_COMPANY,P700_LOCATION,P700_PANEL''',
'                          Else ''P''||Pg.Id||''_FROMDATE,P''||Pg.Id||''_TODATE,P''',
'                               ||Pg.Id||''_COMPANY,P''||Pg.Id||''_LOCATION,P''||Pg.Id||''_PANEL'' End,',
'         p_values => Case When Pg.Id = 700',
'                          Then :P692_TODATE ||'',''|| :P692_COMPANY ||'',''|| :P692_LOCATION ||'',''|| :P692_PANEL',
'                          Else :P692_FROMDATE ||'',''|| :P692_TODATE ||'',''|| :P692_COMPANY ||'',''|| :P692_LOCATION ||'',''|| :P692_PANEL End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 692',
'   And (APEX_CUSTOM_AUTH.GET_USERNAME = ''BOSS''',
'        Or Exists (',
'             Select 1',
'               From ApexReportPrivilege a',
'               Join ApexReportPrivilegeDetail b On b.Tno = a.Tno',
'               Join BossUser c On c.BossUserCode = a.BossUserCode',
'              Where b.PageID = Pg.Id',
'                And (upper(c.BossUserName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)',
'                     Or upper(c.LoginName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME))))',
' Order By Pg.Id'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Render nothing rather than an empty panel when the reader has',
'   privilege on no other page in the section. */',
'Select 1 From dual',
' Where APEX_CUSTOM_AUTH.GET_USERNAME = ''BOSS''',
'    Or Exists (',
'         Select 1',
'           From ApexReportPrivilege a',
'           Join ApexReportPrivilegeDetail b On b.Tno = a.Tno',
'           Join BossUser c On c.BossUserCode = a.BossUserCode',
'          Where b.PageID Between 690 And 702',
'            And b.PageID <> 692',
'            And (upper(c.BossUserName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)',
'                 Or upper(c.LoginName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)))'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P692_FROMDATE,P692_TODATE,P692_COMPANY,P692_LOCATION,P692_PANEL'
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
 p_id=>wwv_flow_imp.id(12706334758300619)
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
 p_id=>wwv_flow_imp.id(12707290110300620)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(12703148978300587)
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
 p_id=>wwv_flow_imp.id(12707352506300620)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(12703148978300587)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:690:&SESSION.::&DEBUG.::P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL,P690_AGEBASIS:&P692_FROMDATE.,&P692_TODATE.,&P692_COMPANY.,&P692_LOCATION.,&P692_PANEL.,&P692_AGEBASIS.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12706428722300619)
,p_name=>'P692_AGEBASIS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(12703148978300587)
,p_item_default=>'DUE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12706530290300619)
,p_name=>'P692_BUCKET'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12703148978300587)
,p_item_default=>'ALL'
,p_prompt=>'Show'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Everything open;ALL,All overdue;OD,90+ days;90,Not Due;0,Due next 7 days;D7,Due next 30 days;D30,1-30;1,31-60;2,61-90;3,91-180;4,181-365;5,Over 365;6,Cannot Age;7,Aged items - due date known;WTD,Customer credits;CR'
,p_colspan=>2
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>'Mirrors the KPI cards on the command centre. Each option is the same predicate the card counted, so a card and this report can never disagree.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12706736682300619)
,p_name=>'P692_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12703148978300587)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select c.CompanyName d, c.CompanyCode r',
'  From Company c',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.CompanyCode = c.CompanyCode',
'                  And v.AccountCode In (Select PartyCode From Party',
'                        Start With PartyCode = ''SUNDRYDEBTORS'' Connect By Prior PartyCode = ParentCode)',
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
 p_id=>wwv_flow_imp.id(12706818511300619)
,p_name=>'P692_FROMDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12703148978300587)
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
 p_id=>wwv_flow_imp.id(12706976595300619)
,p_name=>'P692_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12703148978300587)
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
'                  And (:P692_COMPANY Is Null Or v.CompanyCode = :P692_COMPANY)',
'                  And ((Select GetUserPanelAB_apex() From dual) Is Null',
'                       Or v.Panel = (Select GetUserPanelAB_apex() From dual)))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P692_COMPANY'
,p_ajax_items_to_submit=>'P692_COMPANY'
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
 p_id=>wwv_flow_imp.id(12707070289300619)
,p_name=>'P692_PANEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12703148978300587)
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
 p_id=>wwv_flow_imp.id(12707118393300620)
,p_name=>'P692_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12703148978300587)
,p_item_default=>'Select to_char(trunc(sysdate),''DD-MM-RRRR'') From dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date / As-of'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>3033038003750078790
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
