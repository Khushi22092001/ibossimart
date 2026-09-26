prompt --application/pages/page_00931
begin
--   Manifest
--     PAGE: 00719
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
 p_id=>931
,p_name=>'Daily Payment MIS'
,p_alias=>'AP-DAILY-MIS'
,p_step_title=>'Daily Payment MIS'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#hspl-jet-l10n-fallback.js?version=#APP_VERSION#&cb=20260924a'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'One day, closed off. Opening AP is the position at the start of the day, Closing AP the position at the end, and Bookings plus Receipts less Payments less Debit Notes less Contra Sales explains the difference between them - the residual line proves i'
||'t rather than asserting it. Every figure comes from the same canonical open-item layer as the command centre, so this MIS and that dashboard cannot disagree. Due Today and Due Next 7 Days are available only where a due date exists - about a third of '
||'open payable value; the coverage is stated on the page rather than left for a reader to assume.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12872994168301505)
,p_plug_name=>'Payments Today'
,p_static_id=>'collections'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Bank As (',
'       Select Tno, AccountCode Bnk From (',
'         Select o.Tno, o.AccountCode,',
'                Row_Number() Over (Partition By o.Tno Order By o.Amount Desc) Rn',
'           From VoucherDetail o',
'           Join Voucher bv On bv.Tno = o.Tno',
'          Where o.Amount > 0',
'            And bv.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'            And o.AccountCode Not In (Select PartyCode From Sd))',
'        Where Rn = 1)',
'Select v.VoucherNo                                    As RECEIPT_NO,',
'       d.Tno                                          As VOUCHER_TNO,',
'       nvl(p.PartyName, d.AccountCode) As CUSTOMER,',
'       d.AccountCode                                  As PARTY_CODE,',
'       Round(-d.Amount,2)                             As AMOUNT,',
'       nvl(bp.PartyName, b.Bnk)     As BANK_OR_CASH,',
'       v.MoneyTransferReferenceNo   As BANK_REFERENCE,',
'       nvl(l.LocationName, d.LocationCode) As LOCATION,',
'       substr(d.Narration,1,250)    As NARRATION',
'  From VoucherDetail d',
'  Join Voucher v On v.Tno = d.Tno',
'  Left Join Bank b On b.Tno = d.Tno',
'  Left Join Party bp On bp.PartyCode = b.Bnk',
'  Left Join Party p On p.PartyCode = d.AccountCode',
'  Left Join Location l On l.LocationCode = d.LocationCode',
' Where d.AccountCode In (Select PartyCode From Sd)',
'   And v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'   And d.Amount < 0',
'   And d.VoucherDate = to_date(:P931_DAY,''DD-MM-RRRR'')',
'   And (cast(null as varchar2(100)) Is Null',
'        Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'   And (null    Is Null Or cast(null as varchar2(100))        = null)',
'   And (:P931_COMPANY  Is Null Or d.CompanyCode  = :P931_COMPANY)',
'   And (:P931_LOCATION Is Null Or d.LocationCode = :P931_LOCATION)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P931_DAY,P931_COMPANY,P931_LOCATION'
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
 p_id=>wwv_flow_imp.id(12873039599301505)
,p_no_data_found_message=>'No payment was made on this day for the selected scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>70000000000000700
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12873162292301505)
,p_db_column_name=>'AMOUNT'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Amount (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12873231839301505)
,p_db_column_name=>'BANK_OR_CASH'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Bank / Cash'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12873323982301505)
,p_db_column_name=>'BANK_REFERENCE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Bank Reference'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12873476674301505)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vendor'
,p_column_link=>'f?p=&APP_ID.:923:&SESSION.::&DEBUG.:923:P923_PARTY,P923_TODATE:#PARTY_CODE#,&P931_DAY.'
,p_column_linktext=>'#CUSTOMER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12873546348301505)
,p_db_column_name=>'LOCATION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12873680612301505)
,p_db_column_name=>'NARRATION'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12873706444301505)
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
 p_id=>wwv_flow_imp.id(12873873707301505)
,p_db_column_name=>'RECEIPT_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Payment Voucher'
,p_column_link=>'f?p=&APP_ID.:678:&SESSION.::&DEBUG.:678:P678_TNO:#VOUCHER_TNO#'
,p_column_linktext=>'#RECEIPT_NO#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12873987387301505)
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
 p_id=>wwv_flow_imp.id(12874010924301505)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'70001'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'RECEIPT_NO:CUSTOMER:AMOUNT:BANK_OR_CASH:BANK_REFERENCE:LOCATION'
,p_sum_columns_on_break=>'AMOUNT'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12874128250301505)
,p_name=>'Daily Payment MIS'
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
'    || ''<div class="ds-ap-eyebrow">Payables &middot; Daily MIS</div>''',
'    || ''<h1 class="ds-ap-title">Daily Payment MIS</h1>''',
'    || ''<div class="ds-ap-sub">Opening, movement and closing payables for a single day, with the dues profile and the payment detail behind it</div>''',
'    || ''<div class="ds-ap-context">''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-calendar-o"></span>Report day <b>'' || :P931_DAY || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P931_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P931_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P931_DAY,P931_COMPANY,P931_LOCATION'
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
 p_id=>wwv_flow_imp.id(12874288051301506)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12874312333301506)
,p_name=>'What Falls Due Next'
,p_static_id=>'due-profile'
,p_template=>4072358936313175081
,p_display_sequence=>22
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_grid_column_span=>5
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     D As (Select to_date(:P931_DAY,''DD-MM-RRRR'') Dy From dual),',
'     Alc As (',
'       Select a.DrVoucherTno Tno, a.DrVoucherSno Sno, -Sum(a.Amount) Amt',
'         From DrCrAllocation a, Voucher dv, Voucher cv, D dd',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= dd.Dy And cv.VoucherDate <= dd.Dy',
'        Group By a.DrVoucherTno, a.DrVoucherSno',
'       Union All',
'       Select a.CrVoucherTno, a.CrVoucherSno, Sum(a.Amount)',
'         From DrCrAllocation a, Voucher dv, Voucher cv, D dd',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= dd.Dy And cv.VoucherDate <= dd.Dy',
'        Group By a.CrVoucherTno, a.CrVoucherSno),',
'     Al As (Select Tno, Sno, Sum(Amt) Amt From Alc Group By Tno, Sno),',
'     Oi As (',
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
'         Cross Join D dd',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= dd.Dy',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P931_COMPANY  Is Null Or d.CompanyCode  = :P931_COMPANY)',
'          And (:P931_LOCATION Is Null Or d.LocationCode = :P931_LOCATION))',
'Select Ord, Bucket, Amt, Note From (',
'  Select 10 Ord, ''Overdue as at the report day'' Bucket,',
'         Round(nvl(Sum(Case When Pay > 0 And DueDate < (Select Dy From D) Then Pay Else 0 End),0),2) Amt,',
'         ''due date already passed'' Note From Oi',
'  Union All',
'  Select 20, ''Due today'',',
'         Round(nvl(Sum(Case When Pay > 0 And DueDate = (Select Dy From D) Then Pay Else 0 End),0),2),',
'         ''falls due on the report day'' From Oi',
'  Union All',
'  Select 30, ''Due in the next 7 days'',',
'         Round(nvl(Sum(Case When Pay > 0 And DueDate > (Select Dy From D)',
'                             And DueDate <= (Select Dy From D) + 7 Then Pay Else 0 End),0),2),',
'         ''collectable this week'' From Oi',
'  Union All',
'  Select 40, ''Due in the next 30 days'',',
'         Round(nvl(Sum(Case When Pay > 0 And DueDate > (Select Dy From D)',
'                             And DueDate <= (Select Dy From D) + 30 Then Pay Else 0 End),0),2),',
'         ''collectable this month'' From Oi',
'  Union All',
'  Select 50, ''Cannot be scheduled - no due date'',',
'         Round(nvl(Sum(Case When Pay > 0 And DueDate Is Null Then Pay Else 0 End),0),2),',
'         ''no due date on the source document, so it appears in none of the lines above'' From Oi',
'  Union All',
'  Select 60, ''Unapplied vendor cash'',',
'         Round(nvl(Sum(Case When Pay < 0 Then -Pay Else 0 End),0),2),',
'         ''money already held that could reduce the above by allocation alone'' From Oi',
') Order By Ord'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P931_DAY,P931_COMPANY,P931_LOCATION'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No open payable as at this day.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12874497913301506)
,p_query_column_id=>3
,p_column_alias=>'AMT'
,p_column_display_sequence=>30
,p_column_heading=>unistr('Amount (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12874520168301506)
,p_query_column_id=>2
,p_column_alias=>'BUCKET'
,p_column_display_sequence=>20
,p_column_heading=>'Bucket'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12874682889301506)
,p_query_column_id=>4
,p_column_alias=>'NOTE'
,p_column_display_sequence=>40
,p_column_heading=>'Meaning'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12874769901301506)
,p_query_column_id=>1
,p_column_alias=>'ORD'
,p_column_display_sequence=>10
,p_column_heading=>'Ord'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'NEVER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12874895647301506)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p719Filters'
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
 p_id=>wwv_flow_imp.id(12874941421301506)
,p_name=>'Daily Position'
,p_static_id=>'mis-summary'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_grid_column_span=>7
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Opening and closing are POSITIONS re-derived at two dates; bookings,',
'   payments and debit notes are FLOWS inside the day. The movement',
'   line then reconciles the two positions against the flows, and the',
'   residual is shown rather than suppressed - anything landing there',
'   is a posting type this MIS does not name. A CREDIT is positive in',
'   this ledger, so net payable is +Sum(Amount). */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     D As (Select to_date(:P931_DAY,''DD-MM-RRRR'') Dy From dual),',
'     Pos As (',
'       /* Both positions in one pass: the previous day close and the',
'          report-day close, so they see one snapshot of the ledger. */',
'       Select Sum(Case When d.VoucherDate <  dd.Dy Then d.Amount Else 0 End) OpenNet,',
'              Sum(Case When d.VoucherDate <= dd.Dy Then d.Amount Else 0 End) CloseNet',
'         From VoucherDetail d Cross Join D dd',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= dd.Dy',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P931_COMPANY  Is Null Or d.CompanyCode  = :P931_COMPANY)',
'          And (:P931_LOCATION Is Null Or d.LocationCode = :P931_LOCATION)),',
'     Flow As (',
'       Select nvl(Sum(Case When d.Amount > 0',
'                            And (v.ModuleCode In (''PBPASS'',''JBPASS'',''FREIGHTADVICE'',''CASHPURCHASE'',',
'                                                  ''NECESSITYCOMPLETION'',''NECESSITYSLIP'',''EXTERNALSERVICESENTRY'')',
'                                 Or v.DocTypeCode = ''SERVICEBILL'')',
'                           Then d.Amount Else 0 End),0) Billing,',
'              nvl(Sum(Case When v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'') And d.Amount < 0',
'                           Then -d.Amount Else 0 End),0) Collection,',
'              nvl(Count(Distinct Case When v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'                                       And d.Amount < 0 Then d.Tno End),0) RcptCount,',
'              nvl(Sum(Case When v.DocTypeCode = ''DEBITNOTE'' And d.Amount < 0',
'                           Then -d.Amount Else 0 End),0) CreditNotes,',
'              nvl(Sum(Case When v.DocTypeCode = ''RECEIPT'' And d.Amount > 0',
'                           Then d.Amount Else 0 End),0) PaidOut,',
'              nvl(Sum(Case When v.DocTypeCode = ''SALE'' And d.Amount < 0',
'                           Then -d.Amount Else 0 End),0) ContraS,',
'              nvl(Sum(Case When v.DocTypeCode = ''JOURNAL'' Then d.Amount Else 0 End),0) Journals',
'         From VoucherDetail d Join Voucher v On v.Tno = d.Tno Cross Join D dd',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate = dd.Dy',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P931_COMPANY  Is Null Or d.CompanyCode  = :P931_COMPANY)',
'          And (:P931_LOCATION Is Null Or d.LocationCode = :P931_LOCATION))',
'Select Ord, Line, Amt, Note From (',
'  Select 10 Ord, ''Opening AP (net) at start of day'' Line, Round(p.OpenNet,2) Amt,',
'         ''position carried in from the previous day'' Note From Pos p',
'  Union All',
'  Select 20, ''Add: Bills booked today'', Round(f.Billing,2),',
'         ''bill-class credits: purchase, job, freight, cash purchase, necessity, service'' From Flow f',
'  Union All',
'  Select 25, ''Add: Receipts credited today'', Round(f.PaidOut,2),',
'         ''RECEIPT credits into vendor accounts - refunds and other money in'' From Flow f',
'  Union All',
'  Select 30, ''Less: Payments made today'', Round(-f.Collection,2),',
'         to_char(f.RcptCount,''FM999G990'') || '' payment vouchers, all channels - actual transactions, not a fall in balance'' From Flow f',
'  Union All',
'  Select 40, ''Less: Debit notes issued today'', Round(-f.CreditNotes,2),',
'         ''DEBITNOTE debits'' From Flow f',
'  Union All',
'  Select 45, ''Less: Contra sales billed today'', Round(-f.ContraS,2),',
'         ''SALE debits to parties who are also vendors'' From Flow f',
'  Union All',
'  Select 60, ''Net journal and other movement'', Round(f.Journals,2),',
'         ''JOURNAL postings to the control account, net'' From Flow f',
'  Union All',
'  Select 70, ''Closing AP (net) at end of day'', Round(p.CloseNet,2),',
'         ''position as at the report day'' From Pos p',
'  Union All',
'  Select 80, ''Unexplained residual'',',
'         Round(p.CloseNet - p.OpenNet - f.Billing - f.PaidOut + f.Collection + f.CreditNotes + f.ContraS - f.Journals,2),',
'         ''closing less opening less the movements above - anything here is a posting type this MIS does not name''',
'    From Pos p Cross Join Flow f',
') Order By Ord'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P931_DAY,P931_COMPANY,P931_LOCATION'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No ledger activity on this day for the selected scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12875033408301506)
,p_query_column_id=>3
,p_column_alias=>'AMT'
,p_column_display_sequence=>30
,p_column_heading=>unistr('Amount (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12875181849301506)
,p_query_column_id=>2
,p_column_alias=>'LINE'
,p_column_display_sequence=>20
,p_column_heading=>'Line'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12875265069301506)
,p_query_column_id=>4
,p_column_alias=>'NOTE'
,p_column_display_sequence=>40
,p_column_heading=>'Basis'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12875333834301506)
,p_query_column_id=>1
,p_column_alias=>'ORD'
,p_column_display_sequence=>10
,p_column_heading=>'Ord'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'NEVER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12875413697301507)
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
'                          Then :P931_DAY ||'',''|| :P931_COMPANY ||'',''|| :P931_LOCATION',
'                          Else :P931_DAY ||'',''|| :P931_DAY ||'',''|| :P931_COMPANY ||'',''|| :P931_LOCATION End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 931',
' Order By Pg.Id'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P931_DAY,P931_COMPANY,P931_LOCATION'
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
 p_id=>wwv_flow_imp.id(12875577826301507)
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
 p_id=>wwv_flow_imp.id(12875675712301507)
,p_plug_name=>'Detail'
,p_static_id=>'rule-detail'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>28
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Payments Made Today</h2>',
'  <p>Every payment posted on the report day, largest first</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12875717815301507)
,p_name=>'Largest Overdue Positions'
,p_static_id=>'top-overdue'
,p_template=>4072358936313175081
,p_display_sequence=>40
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Capped at 20 and the cap is stated in the heading - a silently',
'   truncated "top" list reads as a complete one. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     D As (Select to_date(:P931_DAY,''DD-MM-RRRR'') Dy From dual),',
'     Alc As (',
'       Select a.DrVoucherTno Tno, a.DrVoucherSno Sno, -Sum(a.Amount) Amt',
'         From DrCrAllocation a, Voucher dv, Voucher cv, D dd',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= dd.Dy And cv.VoucherDate <= dd.Dy',
'        Group By a.DrVoucherTno, a.DrVoucherSno',
'       Union All',
'       Select a.CrVoucherTno, a.CrVoucherSno, Sum(a.Amount)',
'         From DrCrAllocation a, Voucher dv, Voucher cv, D dd',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= dd.Dy And cv.VoucherDate <= dd.Dy',
'        Group By a.CrVoucherTno, a.CrVoucherSno),',
'     Al As (Select Tno, Sno, Sum(Amt) Amt From Alc Group By Tno, Sno),',
'     G As (',
'       Select d.AccountCode Pty,',
'              Sum(Case When (d.Amount - nvl(al.Amt,0)) > 0',
'                        And coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) < (Select Dy From D)',
'                       Then (d.Amount - nvl(al.Amt,0)) Else 0 End) Overdue,',
'              Sum(Case When (d.Amount - nvl(al.Amt,0)) > 0',
'                       Then (d.Amount - nvl(al.Amt,0)) Else 0 End) Gross,',
'              Sum(Case When (d.Amount - nvl(al.Amt,0)) < 0',
'                       Then  (d.Amount - nvl(al.Amt,0)) Else 0 End) Credit',
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
'         Cross Join D dd',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= dd.Dy',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P931_COMPANY  Is Null Or d.CompanyCode  = :P931_COMPANY)',
'          And (:P931_LOCATION Is Null Or d.LocationCode = :P931_LOCATION)',
'        Group By d.AccountCode)',
'Select * From (',
'  Select apex_escape.html(nvl(p.PartyName, g.Pty)) As CUSTOMER,',
'         g.Pty                                     As PARTY_CODE,',
'         Round(g.Overdue,2)                        As OVERDUE,',
'         Round(g.Gross,2)                          As GROSS,',
'         Round(g.Credit,2)                         As CREDIT_HELD,',
'         Round(Least(g.Gross, g.Credit),2)         As ADJUSTABLE_NOW',
'    From G g Left Join Party p On p.PartyCode = g.Pty',
'   Where g.Overdue > 0.005',
'   Order By g.Overdue Desc)',
' Where rownum <= 20'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P931_DAY,P931_COMPANY,P931_LOCATION'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No vendor is overdue as at this day, on the due-date basis.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12875896207301507)
,p_query_column_id=>6
,p_column_alias=>'ADJUSTABLE_NOW'
,p_column_display_sequence=>60
,p_column_heading=>unistr('Adjustable Now (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12875934122301507)
,p_query_column_id=>5
,p_column_alias=>'CREDIT_HELD'
,p_column_display_sequence=>50
,p_column_heading=>unistr('Credit Held (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12876031278301507)
,p_query_column_id=>1
,p_column_alias=>'CUSTOMER'
,p_column_display_sequence=>10
,p_column_heading=>'Vendor (top 20 by overdue)'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12876192214301507)
,p_query_column_id=>4
,p_column_alias=>'GROSS'
,p_column_display_sequence=>40
,p_column_heading=>unistr('Gross Payable (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12876237168301507)
,p_query_column_id=>3
,p_column_alias=>'OVERDUE'
,p_column_display_sequence=>30
,p_column_heading=>unistr('Overdue (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12876329323301507)
,p_query_column_id=>2
,p_column_alias=>'PARTY_CODE'
,p_column_display_sequence=>20
,p_column_heading=>'Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12876818099301508)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(12874895647301506)
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
 p_id=>wwv_flow_imp.id(12876997631301508)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12874895647301506)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:920:&SESSION.::&DEBUG.::P920_TODATE,P920_COMPANY,P920_LOCATION:&P931_DAY.,&P931_COMPANY.,&P931_LOCATION.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12876407306301507)
,p_name=>'P931_COMPANY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12874895647301506)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select c.CompanyName d, c.CompanyCode r',
'  From Company c',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.CompanyCode = c.CompanyCode',
'                  And v.AccountCode In (Select PartyCode From Party',
'                        Start With PartyCode = ''SUNDRYCREDITORS'' Connect By Prior PartyCode = ParentCode))',
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
 p_id=>wwv_flow_imp.id(12876549024301507)
,p_name=>'P931_DAY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12874895647301506)
,p_item_default=>'Select to_char(trunc(sysdate),''DD-MM-RRRR'') From dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Report Day'
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
 p_id=>wwv_flow_imp.id(12876649042301508)
,p_name=>'P931_LOCATION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12874895647301506)
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
'                  And (:P931_COMPANY Is Null Or v.CompanyCode = :P931_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P931_COMPANY'
,p_ajax_items_to_submit=>'P931_COMPANY'
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
wwv_flow_imp.component_end;
end;
/
