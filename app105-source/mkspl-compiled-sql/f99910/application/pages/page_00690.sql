prompt --application/pages/page_00690
begin
--   Manifest
--     PAGE: 00690
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
 p_id=>690
,p_name=>'Accounts Receivable Command Centre'
,p_alias=>'AR-COMMAND-CENTRE'
,p_step_title=>'Accounts Receivable Command Centre'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(9965686798286257)
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'Receivables command centre. AR here is the SUNDRYDEBTORS control account of the chart of accounts, not Party.PartyTypeCode - the control account is the only population that ties to the general ledger, and legacy page 618 uses the other one, which omi'
||'ts 60 real debtor accounts and admits 25 non-debtors. An open item is one VoucherDetail line; a DEBIT is a NEGATIVE Amount, so receivable = -(Amount - allocations). DrCrAllocation is the settlement bridge and is counted only when BOTH of its vouchers'
||' are dated on or before the As-of Date, so a bill paid later still shows open at an earlier date. To Date IS the As-of Date for every balance; From Date bounds flows only (receipts, billing, allocations made). Due dates live on the source document, n'
||'ot the ledger, and cover 28% of open receivable value - the ageing basis is therefore selectable and the uncovered share is shown as its own bucket, never hidden.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12687933072300494)
,p_name=>'Ageing Distribution'
,p_static_id=>'ageing-scale'
,p_template=>4073835273271169698
,p_display_sequence=>38
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P690_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Select -(d.Amount - nvl(al.Amt,0)) Recv,',
'              Case When nvl(:P690_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) Is Null Then 7',
'                   When nvl(:P690_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) >= Asof.D Then 0',
'                   When (Case When :P690_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <=  30 Then 1',
'                   When (Case When :P690_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <=  60 Then 2',
'                   When (Case When :P690_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <=  90 Then 3',
'                   When (Case When :P690_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <= 180 Then 4',
'                   When (Case When :P690_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <= 365 Then 5',
'                   Else 6 End Bkt',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P690_PANEL    Is Null Or d.Panel        = :P690_PANEL)',
'          And (:P690_COMPANY  Is Null Or d.CompanyCode  = :P690_COMPANY)',
'          And (:P690_LOCATION Is Null Or d.LocationCode = :P690_LOCATION)),',
'     G As (Select Bkt, Sum(Recv) Amt From Aged Where Recv > 0 Group By Bkt),',
'     Tot As (Select nvl(Sum(Amt),0) T From G)',
'Select ''<div class="ds-arage"><div class="ds-arage-bar">''',
'    || nvl(ListAgg(',
'         Case When g.Amt / Nullif(tot.T,0) >= 0.0005 Then',
'           ''<div class="ds-arage-seg ds-arage-seg--b'' || g.Bkt || ''" style="width:''',
'           || to_char(Round(100 * g.Amt / tot.T,3),''FM990D000'') || ''%" title="''',
'           || Case g.Bkt When 0 Then ''Not Due'' When 1 Then ''1-30 days'' When 2 Then ''31-60 days''',
'                         When 3 Then ''61-90 days'' When 4 Then ''91-180 days'' When 5 Then ''181-365 days''',
'                         When 6 Then ''Over 365 days'' Else ''Cannot Age - no due date on the source document'' End',
'           || '': &#8377;'' || to_char(Round(g.Amt,0),''FM999G99G99G990'') || ''">''',
'           || Case When g.Amt / tot.T >= 0.06',
'                   Then to_char(Round(100 * g.Amt / tot.T,0),''FM990'') || ''%'' End',
'           || ''</div>''',
'         End, '''') Within Group (Order By g.Bkt), '''')',
'    || ''</div><div class="ds-arage-legend">''',
'    || nvl(ListAgg(',
'         ''<span class="ds-arage-key ds-arage-key--b'' || g.Bkt || ''"><i></i>''',
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
,p_ajax_items_to_submit=>'P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL,P690_AGEBASIS'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No open receivable in this scope as at the As-of Date.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12688038901300495)
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
 p_id=>wwv_flow_imp.id(12688166867300495)
,p_name=>'Measurement Basis'
,p_static_id=>'basis-note'
,p_template=>4502917002193490937
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
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P690_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Select -(d.Amount - nvl(al.Amt,0)) Recv,',
'              coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) DueDate',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P690_PANEL    Is Null Or d.Panel        = :P690_PANEL)',
'          And (:P690_COMPANY  Is Null Or d.CompanyCode  = :P690_COMPANY)',
'          And (:P690_LOCATION Is Null Or d.LocationCode = :P690_LOCATION)),',
'     Cov As (',
'       Select nvl(Sum(Case When Recv > 0 Then Recv Else 0 End),0) Gross,',
'              nvl(Sum(Case When Recv > 0 And DueDate Is Null Then Recv Else 0 End),0) NoDue',
'         From Item)',
'Select NOTE From (',
'  /* 1. As-of Date earlier than the ledger itself. Returning a number',
'        here would be worse than returning nothing: it would look real',
'        and be built from whatever the carry-forward happens to hold. */',
'  Select 10 Ord,',
'         ''<div class="ds-arnote ds-arnote--stop"><span class="fa fa-ban"></span><div>''',
'      || ''<b>The As-of Date is before this ledger begins.</b> VoucherDetail holds ''',
'      || to_char((Select Min(VoucherDate) From VoucherDetail),''DD-MM-RRRR'')',
'      || '' onward and prior-year receivables arrive as OPENING journals dated 31-03-2026. ''',
'      || ''A position dated earlier than 01-04-2026 is not a valid historical AR balance and the figures above should not be relied on.''',
'      || ''</div></div>'' NOTE',
'    From dual',
'   Where to_date(:P690_TODATE,''DD-MM-RRRR'') < date ''2026-04-01''',
'  Union All',
'  /* 2. Due-date coverage. Only shown on the Due basis, because on the',
'        Document basis it is not the limitation that bites. */',
'  Select 20,',
'         ''<div class="ds-arnote ds-arnote--warn"><span class="fa fa-hourglass-half"></span><div>''',
'      || ''<b>Ageing basis: Due Date.</b> Due dates exist on the source document, not on the ledger, and this ERP holds no credit terms to derive one from ''',
'      || ''(Party.CreditDays is set on 2 of 954 debtor accounts, Party.CreditAmount on none). ''',
'      || ''In this scope <b>&#8377;'' || to_char(Round(c.NoDue,0),''FM999G99G99G990'') || ''</b> of &#8377;''',
'      || to_char(Round(c.Gross,0),''FM999G99G99G990'') || '' (''',
'      || to_char(Round(100 * c.NoDue / Nullif(c.Gross,0),1),''FM990D0'') || ''%) has no due date. ''',
'      || ''It is shown in its own <b>Cannot Age</b> bucket - not spread across the others, and not dropped. ''',
'      || ''Switch the basis to <b>Document date</b> to age every item by its own age instead of its lateness.''',
'      || ''</div></div>''',
'    From Cov c',
'   Where nvl(:P690_AGEBASIS,''DUE'') = ''DUE'' And c.NoDue > 0',
'  Union All',
'  /* 3. Document basis is age, not lateness. Said plainly, because the',
'        buckets look identical to the Due-basis ones. */',
'  Select 21,',
'         ''<div class="ds-arnote"><span class="fa fa-info-circle"></span><div>''',
'      || ''<b>Ageing basis: Document Date.</b> Buckets measure how <i>old</i> an item is, not how <i>late</i> it is - ''',
'      || ''every open item can be aged this way, so nothing falls into Cannot Age, but an item inside its credit period is counted alongside one that is genuinely overdue. ''',
'      || ''This is the basis every existing iBOSS ageing report uses (pages 618, 170, 463, 495). Switch to <b>Due date</b> for true lateness on the ''',
'      || to_char(Round(100 * (c.Gross - c.NoDue) / Nullif(c.Gross,0),1),''FM990D0'') || ''% of value that carries one.''',
'      || ''</div></div>''',
'    From Cov c',
'   Where :P690_AGEBASIS = ''DOC''',
'  Union All',
'  /* 4. The ageing horizon. Only raised when the reader is actually',
'        looking at the oldest buckets, i.e. always on this page. */',
'  Select 30,',
'         ''<div class="ds-arnote"><span class="fa fa-history"></span><div>''',
'      || ''<b>Ageing beyond 31-03-2026 exists only where the migration kept an original bill date.</b> ''',
'      || ''Prior-year receivables enter as OPENING journals dated at the cutover; 242 of 699 such lines carry an original AccountOpening.BillDate ''',
'      || ''(reaching back to 31-03-2023) and are aged from it. The remaining 457 are floored at the cutover, so their true age is understated - ''',
'      || ''they are listed under control <b>AR-O01</b>.''',
'      || ''</div></div>''',
'    From dual',
'   Where to_date(:P690_TODATE,''DD-MM-RRRR'') >= date ''2026-04-01''',
') Order By Ord'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL,P690_AGEBASIS'
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
 p_id=>wwv_flow_imp.id(12688294843300521)
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
 p_id=>wwv_flow_imp.id(12688399580300521)
,p_plug_name=>'Billing vs Collection'
,p_static_id=>'billing-collection'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>52
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* A flow chart, not a balance chart: it is bounded by From/To, not by',
'   the As-of Date. Billing is the debit side of SALE and SERVICEBILL',
'   vouchers; collection is the credit side of RECEIPT vouchers. Credit',
'   notes are shown separately rather than netted into billing, because',
'   a fall in billing and a credit note are different events. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Mv As (',
'       Select trunc(d.VoucherDate,''MM'') Mth,',
'              Sum(Case When v.DocTypeCode In (''SALE'',''SERVICEBILL'') And d.Amount < 0',
'                       Then -d.Amount Else 0 End) Billing,',
'              Sum(Case When v.DocTypeCode = ''RECEIPT'' And d.Amount > 0',
'                       Then d.Amount Else 0 End) Collection,',
'              Sum(Case When v.DocTypeCode = ''CREDITNOTE'' And d.Amount > 0',
'                       Then d.Amount Else 0 End) CreditNotes',
'         From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate >= to_date(:P690_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P690_TODATE,''DD-MM-RRRR'') + 1',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P690_PANEL    Is Null Or d.Panel        = :P690_PANEL)',
'          And (:P690_COMPANY  Is Null Or d.CompanyCode  = :P690_COMPANY)',
'          And (:P690_LOCATION Is Null Or d.LocationCode = :P690_LOCATION)',
'        Group By trunc(d.VoucherDate,''MM''))',
'Select to_char(Mth,''Mon-RR'') As LABEL,',
'       Round(Billing/100000,2) As BILLING_LAC,',
'       Round(Collection/100000,2) As COLLECTION_LAC,',
'       Round(CreditNotes/100000,2) As CREDITNOTE_LAC',
'  From Mv Order By Mth'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12688428688300521)
,p_region_id=>wwv_flow_imp.id(12688399580300521)
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
,p_no_data_found_message=>'Nothing was billed or collected in this period for the selected scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12688586741300521)
,p_chart_id=>wwv_flow_imp.id(12688428688300521)
,p_static_id=>'billing'
,p_seq=>10
,p_name=>unistr('Billing (\20B9 Lac)')
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
 p_id=>wwv_flow_imp.id(12688661113300521)
,p_chart_id=>wwv_flow_imp.id(12688428688300521)
,p_static_id=>'collection'
,p_seq=>20
,p_name=>unistr('Collection (\20B9 Lac)')
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
 p_id=>wwv_flow_imp.id(12688762562300521)
,p_chart_id=>wwv_flow_imp.id(12688428688300521)
,p_static_id=>'creditnotes'
,p_seq=>30
,p_name=>unistr('Credit Notes (\20B9 Lac)')
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
 p_id=>wwv_flow_imp.id(12688875000300521)
,p_chart_id=>wwv_flow_imp.id(12688428688300521)
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
 p_id=>wwv_flow_imp.id(12688965265300521)
,p_chart_id=>wwv_flow_imp.id(12688428688300521)
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
 p_id=>wwv_flow_imp.id(12689023908300521)
,p_plug_name=>'What the Open Balance Is Made Of'
,p_static_id=>'class-mix'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>42
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Gross Outstanding is the control account, and the control account is',
'   not all trade debt. Payments MADE to a customer, purchases FROM a',
'   customer (this is a contra-trading business) and opening carry-forward',
'   all sit inside it. Presenting the total without this breakdown is the',
'   fastest way to have a CFO chase a receivable that is really a',
'   purchase ledger entry. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P690_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Select -(d.Amount - nvl(al.Amt,0)) Recv,',
'              Case When v.VoucherNo = ''OPENING''      Then ''Opening Carry-forward''',
'                   When v.ModuleCode = ''INVOICE''     Then ''Trade Invoice''',
'                   When v.ModuleCode = ''SERVICEBILL'' Then ''Service Bill''',
'                   When v.ModuleCode = ''CREDITNOTE''  Then ''Credit Note''',
'                   When v.ModuleCode = ''DEBITNOTE''   Then ''Debit Note''',
'                   When v.ModuleCode = ''PBPASS''      Then ''Contra Purchase''',
'                   When v.DocTypeCode = ''RECEIPT''    Then ''Receipt / On-account''',
'                   When v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'                                                     Then ''Payment to Customer''',
'                   Else ''Journal'' End Cls',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P690_PANEL    Is Null Or d.Panel        = :P690_PANEL)',
'          And (:P690_COMPANY  Is Null Or d.CompanyCode  = :P690_COMPANY)',
'          And (:P690_LOCATION Is Null Or d.LocationCode = :P690_LOCATION))',
'Select Cls As LABEL,',
'       Round(Sum(Case When Recv > 0 Then Recv Else 0 End)/100000,2) As RECEIVABLE_LAC,',
'       Round(Sum(Case When Recv < 0 Then -Recv Else 0 End)/100000,2) As CREDIT_LAC',
'  From Oi',
' Group By Cls',
'Having Sum(Abs(Recv)) > 0.005',
' Order By Sum(Abs(Recv)) Desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL,P690_AGEBASIS'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12689146508300522)
,p_region_id=>wwv_flow_imp.id(12689023908300521)
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
 p_id=>wwv_flow_imp.id(12689293911300522)
,p_chart_id=>wwv_flow_imp.id(12689146508300522)
,p_static_id=>'credit'
,p_seq=>20
,p_name=>unistr('Customer Credit (\20B9 Lac)')
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
 p_id=>wwv_flow_imp.id(12689316198300522)
,p_chart_id=>wwv_flow_imp.id(12689146508300522)
,p_static_id=>'receivable'
,p_seq=>10
,p_name=>unistr('Receivable (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'RECEIVABLE_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12689404672300522)
,p_chart_id=>wwv_flow_imp.id(12689146508300522)
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
 p_id=>wwv_flow_imp.id(12689522148300522)
,p_chart_id=>wwv_flow_imp.id(12689146508300522)
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
 p_id=>wwv_flow_imp.id(12689673636300522)
,p_name=>'Accounts Receivable Command Centre'
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
'    || ''<div class="ds-ar-eyebrow">Finance &middot; Accounts Receivable</div>''',
'    || ''<h1 class="ds-ar-title">Accounts Receivable Command Centre</h1>''',
'    || ''<div class="ds-ar-sub">Outstanding, ageing, collections, customer advances, debtor exposure, reconciliation to the general ledger and the control exceptions behind every number</div>''',
'    || ''<div class="ds-ar-context">''',
'    /* Balances are AS AT To Date; flows are BETWEEN the two. Saying',
'       so in the header is the cheapest way to stop a reader assuming',
'       outstanding was filtered to the period, which is the single',
'       most common misreading of an AR dashboard. */',
'    || ''<span class="ds-ar-chip"><span class="fa fa-crosshairs"></span>Outstanding as at <b>''',
'       || :P690_TODATE || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-calendar"></span>Flows <b>''',
'       || :P690_FROMDATE || '' &rarr; '' || :P690_TODATE || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-hourglass-half"></span>Ageing basis <b>''',
'       || Case When :P690_AGEBASIS = ''DOC'' Then ''Document date (age)''',
'               Else ''Due date (lateness)'' End || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P690_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P690_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-shield"></span>Panel <b>''',
'       || Case When (Select GetUserPanelAB_apex() From dual) Is Not Null',
'               Then (Select GetUserPanelAB_apex() From dual) || '' (enforced)''',
'               When :P690_PANEL Is Not Null Then :P690_PANEL',
'               Else ''A + B'' End || ''</b></span>''',
'    /* There is no currency, exchange-rate or conversion column',
'       anywhere in the voucher chain. Stating it beats letting a',
'       reader assume a conversion happened. */',
'    || ''<span class="ds-ar-chip"><span class="fa fa-money"></span>Currency <b>INR (base, single-currency ledger)</b></span>''',
'    || ''<span class="ds-ar-chip ds-ar-chip--live"><span class="fa fa-clock-o"></span>Last posting <b>''',
'       || nvl((Select to_char(Max(d.VoucherDate),''DD-MM-RRRR'')',
'                 From VoucherDetail d',
'                Where d.AccountCode In (Select PartyCode From Party',
'                        Start With PartyCode = ''SUNDRYDEBTORS'' Connect By Prior PartyCode = ParentCode)',
'                  And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'                  And (:P690_PANEL    Is Null Or d.Panel        = :P690_PANEL)',
'                  And (:P690_COMPANY  Is Null Or d.CompanyCode  = :P690_COMPANY)',
'                  And (:P690_LOCATION Is Null Or d.LocationCode = :P690_LOCATION)),''no postings'') || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL,P690_AGEBASIS'
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
 p_id=>wwv_flow_imp.id(12689763293300522)
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
 p_id=>wwv_flow_imp.id(12689806679300522)
,p_plug_name=>'Customer Concentration'
,p_static_id=>'concentration'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>47
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Concentration as four mutually exclusive bands that together make the',
'   whole gross receivable - which is what makes a donut legitimate here.',
'   A donut over overlapping or partial measures would be misleading, so',
'   the bands are built to be exhaustive. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P690_TODATE,''DD-MM-RRRR'') D From dual),',
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
'              Sum(Case When -(d.Amount - nvl(al.Amt,0)) > 0',
'                       Then -(d.Amount - nvl(al.Amt,0)) Else 0 End) Dr',
'         From VoucherDetail d',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P690_PANEL    Is Null Or d.Panel        = :P690_PANEL)',
'          And (:P690_COMPANY  Is Null Or d.CompanyCode  = :P690_COMPANY)',
'          And (:P690_LOCATION Is Null Or d.LocationCode = :P690_LOCATION)',
'        Group By d.AccountCode),',
'     R As (Select Pty, Dr, Row_Number() Over (Order By Dr Desc) Rn From G Where Dr > 0.005)',
'Select Band As LABEL, Round(Sum(Dr)/10000000,2) As EXPOSURE_CR',
'  From (Select Case When Rn <= 5  Then ''Top 5 customers''',
'                    When Rn <= 10 Then ''Rank 6-10''',
'                    When Rn <= 25 Then ''Rank 11-25''',
'                    Else ''All other customers'' End Band, Dr',
'          From R)',
' Group By Band',
' Order By Case Band When ''Top 5 customers'' Then 1 When ''Rank 6-10'' Then 2',
'                    When ''Rank 11-25'' Then 3 Else 4 End'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12689967885300522)
,p_region_id=>wwv_flow_imp.id(12689806679300522)
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
,p_no_data_found_message=>'No customer carries an open receivable in this scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12690039440300522)
,p_chart_id=>wwv_flow_imp.id(12689967885300522)
,p_static_id=>'band'
,p_seq=>10
,p_name=>unistr('Gross Receivable (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'donut'
,p_items_value_column_name=>'EXPOSURE_CR'
,p_items_label_column_name=>'LABEL'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12690133551300522)
,p_name=>'Exceptions and Controls'
,p_static_id=>'control-summary'
,p_template=>4502917002193490937
,p_display_sequence=>60
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Headline counts only. Every one of them is a link into page 696,',
'   where the identical predicate produces the row set - the count and',
'   the drill-down cannot disagree because they are the same WHERE',
'   clause, proved in docs/sql/ar-reconciliation.sql section 9. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     C As (',
'       Select',
'         (Select Count(*) From DrCrAllocation a',
'           Where Not Exists (Select 1 From Voucher v Where v.Tno = a.DrVoucherTno)',
'              Or Not Exists (Select 1 From Voucher v Where v.Tno = a.CrVoucherTno)) Orphan,',
'         (Select Count(*) From (Select CompanyCode, InvoiceNo From Invoice',
'                                 Group By CompanyCode, InvoiceNo Having Count(*) > 1)) Dup,',
'         (Select Count(*) From Invoice Where nvl(InvoiceAmount,0) = 0) ZeroAmt,',
'         (Select Count(*) From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
'            Left Join AccountOpening ao On ao.Tno = d.ModuleTno',
'           Where d.AccountCode In (Select PartyCode From Sd)',
'             And v.VoucherNo = ''OPENING'' And ao.BillDate Is Null) OpenNoDate',
'         From dual)',
'Select ''<a class="ds-kpi ds-kpi--risk" href="''',
'    || apex_page.get_url(p_page => 696, p_clear_cache => ''696'',',
'         p_items => ''P696_FROMDATE,P696_TODATE,P696_COMPANY,P696_LOCATION,P696_PANEL,P696_CONTROL'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',AR-A05'')',
'    || ''" title="Allocation rows whose debit or credit voucher no longer exists. This ERP has no reversal mechanism - deletion is it - so a deleted voucher leaves its allocations behind.">''',
'    || ''<span class="ds-kpi-ic fa fa-unlink"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Orphan Allocations</div><div class="ds-kpi-n">'' || to_char(c.Orphan,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AR-A05 &middot; one of them would misstate AR by &#8377;34,119</div></div></a>'' As C1,',
'       ''<a class="ds-kpi ds-kpi--amber" href="''',
'    || apex_page.get_url(p_page => 696, p_clear_cache => ''696'',',
'         p_items => ''P696_FROMDATE,P696_TODATE,P696_COMPANY,P696_LOCATION,P696_PANEL,P696_CONTROL'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',AR-B05'')',
'    || ''" title="The same invoice number issued more than once within one company.">''',
'    || ''<span class="ds-kpi-ic fa fa-copy"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Duplicate Invoice Numbers</div><div class="ds-kpi-n">'' || to_char(c.Dup,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AR-B05 &middot; invoice number groups within a company</div></div></a>'' As C2,',
'       ''<a class="ds-kpi ds-kpi--struct" href="''',
'    || apex_page.get_url(p_page => 696, p_clear_cache => ''696'',',
'         p_items => ''P696_FROMDATE,P696_TODATE,P696_COMPANY,P696_LOCATION,P696_PANEL,P696_CONTROL'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',AR-O01'')',
'    || ''" title="Opening carry-forward receivables whose original bill date did not survive migration. Their age is floored at the 31-03-2026 cutover and is therefore understated.">''',
'    || ''<span class="ds-kpi-ic fa fa-history"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Opening AR, Age Understated</div><div class="ds-kpi-n">'' || to_char(c.OpenNoDate,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AR-O01 &middot; no original bill date preserved</div></div></a>'' As C3,',
'       ''<a class="ds-kpi ds-kpi--teal" href="''',
'    || apex_page.get_url(p_page => 697, p_clear_cache => ''697'',',
'         p_items => ''P697_FROMDATE,P697_TODATE,P697_COMPANY,P697_LOCATION,P697_PANEL'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL)',
'    || ''" title="Analytical AR against the SUNDRYDEBTORS general-ledger control account, executed rather than asserted.">''',
'    || ''<span class="ds-kpi-ic fa fa-balance-scale"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">AR vs GL Reconciliation</div><div class="ds-kpi-n"><span style="font-size:17px">Open</span></div>''',
'    || ''<div class="ds-kpi-sub">full tie-out by company, location and party</div></div></a>'' As C4',
'  From C c'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL'
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
 p_id=>wwv_flow_imp.id(12690209197300522)
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
 p_id=>wwv_flow_imp.id(12690302850300523)
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
 p_id=>wwv_flow_imp.id(12690405762300523)
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
 p_id=>wwv_flow_imp.id(12690550367300523)
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
 p_id=>wwv_flow_imp.id(12690645975300523)
,p_plug_name=>'Exception Trend'
,p_static_id=>'exception-trend'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
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
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P690_TODATE,''DD-MM-RRRR'') D From dual),',
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
'              -(d.Amount - nvl(al.Amt,0)) Recv,',
'              coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) DueDate,',
'              ao.BillDate AoBillDate',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P690_PANEL    Is Null Or d.Panel        = :P690_PANEL)',
'          And (:P690_COMPANY  Is Null Or d.CompanyCode  = :P690_COMPANY)',
'          And (:P690_LOCATION Is Null Or d.LocationCode = :P690_LOCATION))',
'Select to_char(trunc(Vdt,''MM''),''Mon-RR'')                                     As LABEL,',
'       Sum(Case When Recv > 0 And DueDate Is Null Then 1 Else 0 End)         As CANNOT_AGE,',
'       Sum(Case When Dtc = ''RECEIPT'' And Recv < -0.005',
'                 And (Select D From Asof) - Vdt > 90 Then 1 Else 0 End)      As OLD_UNAPPLIED,',
'       Sum(Case When Vno = ''OPENING'' And AoBillDate Is Null',
'                 And Abs(Recv) > 0.005 Then 1 Else 0 End)                    As OPENING_NO_DATE',
'  From Oi',
' Where Vdt >= to_date(:P690_FROMDATE,''DD-MM-RRRR'')',
' Group By trunc(Vdt,''MM'')',
' Order By trunc(Vdt,''MM'')'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12690777280300523)
,p_region_id=>wwv_flow_imp.id(12690645975300523)
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
 p_id=>wwv_flow_imp.id(12690821041300523)
,p_chart_id=>wwv_flow_imp.id(12690777280300523)
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
 p_id=>wwv_flow_imp.id(12690908378300523)
,p_chart_id=>wwv_flow_imp.id(12690777280300523)
,p_static_id=>'oldcash'
,p_seq=>20
,p_name=>'Old Unapplied Cash (items)'
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
 p_id=>wwv_flow_imp.id(12691082228300523)
,p_chart_id=>wwv_flow_imp.id(12690777280300523)
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
 p_id=>wwv_flow_imp.id(12691181284300523)
,p_chart_id=>wwv_flow_imp.id(12690777280300523)
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
 p_id=>wwv_flow_imp.id(12691297231300523)
,p_chart_id=>wwv_flow_imp.id(12690777280300523)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12691322098300524)
,p_name=>'What This ERP Can And Cannot Measure'
,p_static_id=>'excluded'
,p_template=>4502917002193490937
,p_display_sequence=>64
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The coverage figures are counted, not written down. Two of these four',
'   measures used to be listed as impossible; one now has a source, and a',
'   card stating "0 of 954" in fixed text goes stale the moment somebody',
'   approves a limit. Everything quantified here is a live count, so the',
'   page cannot drift away from the data it describes. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P690_TODATE,''DD-MM-RRRR'') D From dual),',
'     P As (',
'       Select Count(*) Deb,',
'              Count(Case When nvl(p.CreditAmount,0) > 0 Then 1 End) MastAmt,',
'              Count(Case When nvl(p.CreditDays,0)   > 0 Then 1 End) MastDays',
'         From Party p Where p.PartyCode In (Select PartyCode From Sd)),',
'     A As (',
'       Select Count(*) InForce,',
'              Count(Case When Amt <= 10000000000 Then 1 End) Capped,',
'              Count(Case When Amt >  10000000000 Then 1 End) Uncapped,',
'              Count(Case When nvl(Days,0) > 0 Then 1 End) WithDays',
'         From (Select c.CreditAmount Amt, c.CreditDays Days,',
'                      Row_Number() Over (Partition By c.PartyCode, c.CompanyCode, c.LocationCode',
'                                         Order By c.CreditLimitApprovalDate Desc, c.Tno Desc) rn',
'                 From CreditLimitApproval c Cross Join Asof',
'                Where c.CreditLimitApprovalDate <= Asof.D',
'                  And (c.TillDate Is Null Or c.TillDate >= Asof.D)',
'                  And (:P690_COMPANY  Is Null Or c.CompanyCode  = :P690_COMPANY)',
'                  And (:P690_LOCATION Is Null Or c.LocationCode = :P690_LOCATION))',
'        Where rn = 1),',
'     E As (Select Count(*) Expired From CreditLimitApproval c Cross Join Asof',
'            Where c.TillDate Is Not Null And c.TillDate < Asof.D)',
'Select ''<div class="ds-arnote"><span class="fa fa-info-circle"></span><div>''',
'    || ''<b>Two measures a receivables dashboard would normally carry cannot be computed from this ERP, ''',
'    || ''and two more are limited by how much has been approved rather than by the data model.</b> ''',
'    || ''Showing any of them as zero would be a lie; omitting them silently would invite someone to ask for them again.''',
'    || ''</div></div>''',
'    || ''<div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(240px,1fr));gap:12px">''',
'    || ''<div class="ds-arexcl"><div class="ds-arexcl-h">Credit Limit &amp; Credit Utilisation %</div>''',
'    || ''<div class="ds-arexcl-b"><code>Party.CreditAmount</code> is set on <b>''',
'       || to_char(p.MastAmt) || '' of '' || to_char(p.Deb) || ''</b> debtor accounts, so the master is not the source. ''',
'    || ''The limit comes from the <b>credit limit approval</b> instead: the latest approval granted by this date whose ''',
'    || ''till-date has not passed, per company and location. A blank till-date never expires. ''',
'    || Case When a.InForce = 0',
'            Then ''No approval is in force on this date, so no utilisation is shown.''',
'            Else ''<b>'' || to_char(a.Capped) || ''</b> customer''',
'                 || Case When a.Capped = 1 Then '' has'' Else ''s have'' End',
'                 || '' a ceiling in force''',
'                 || Case When a.Uncapped > 0',
'                         Then '', and <b>'' || to_char(a.Uncapped) || ''</b> carr''',
'                              || Case When a.Uncapped = 1 Then ''ies'' Else ''y'' End',
'                              || '' a limit above &#8377;1,000 Cr, which records <i>no limit</i> rather than a control ''',
'                              || ''and is reported as no effective ceiling rather than as a comfortable utilisation'' End',
'                 || ''. '' || to_char(e.Expired) || '' further approvals have lapsed and are not counted.'' End',
'    || ''</div></div>''',
'    || ''<div class="ds-arexcl"><div class="ds-arexcl-h">Credit Days / Derived Due Date</div>''',
'    || ''<div class="ds-arexcl-b"><code>Party.CreditDays</code> is set on <b>''',
'       || to_char(p.MastDays) || '' of '' || to_char(p.Deb) || ''</b> debtor accounts. ''',
'    || ''The approval carries credit days too, and <b>'' || to_char(a.WithDays) || ''</b> of the approvals in force do. ''',
'    || ''That covers too little of the book to age it on customer terms, so the due date is still taken from the source ''',
'    || ''document, and an item with none is marked <b>Cannot Age</b> rather than assumed current.''',
'    || ''</div></div>''',
'    || ''<div class="ds-arexcl"><div class="ds-arexcl-h">Receipts by Payment Mode</div>''',
'    || ''<div class="ds-arexcl-b"><code>VoucherDetail.MoneyTransferModeCode</code> is null on every row and the voucher ''',
'    || ''header carries a mode on a small minority of debtor receipts. Bank <i>is</i> reliable and is analysed instead, ''',
'    || ''taken from the contra account on the receipt voucher.</div></div>''',
'    || ''<div class="ds-arexcl"><div class="ds-arexcl-h">Reversed / Cancelled Receipts</div>''',
'    || ''<div class="ds-arexcl-b"><code>VOUCHER</code> carries no approval, posting, draft, cancellation or reversal ''',
'    || ''column, and <code>VoucherReferenceDetailReversal</code> is empty. Deletion is this ERP&rsquo;s only cancellation ''',
'    || ''mechanism, and its trace is the orphan-allocation control <b>AR-A05</b>.</div></div>''',
'    || ''</div>'' As NOTE',
'  From P p Cross Join A a Cross Join E e'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P690_TODATE,P690_COMPANY,P690_LOCATION'
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
 p_id=>wwv_flow_imp.id(12691419591300524)
,p_query_column_id=>1
,p_column_alias=>'NOTE'
,p_column_display_sequence=>10
,p_column_heading=>'Note'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12691520202300524)
,p_name=>'Receivable Position'
,p_static_id=>'exposure'
,p_template=>4502917002193490937
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* THE CANONICAL AR PROLOGUE. Reproduced verbatim in every region on',
'   every AR page; specified once in docs/ar-dashboard/AR_KPI_DEFINITION.md.',
'   It is a copied CTE and not a view because this repository forbids',
'   DDL absolutely - docs/ar-dashboard/AR_SYSTEM_AUDIT.md section 9.',
'   docs/sql/ar-reconciliation.sql proves every region agrees with it. */',
'With Sd As (',
'       /* AR is the SUNDRYDEBTORS control account. No voucher line ever',
'          posts to a group node in this ERP, so the control account''s',
'          balance IS the sum of its members - which is what makes the',
'          tie-out below possible at all. */',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P690_TODATE,''DD-MM-RRRR'') D From dual),',
'     Alc As (',
'       /* DrCrAllocation.Amount is ALWAYS positive; it is applied as',
'          -Amount to the debit line and +Amount to the credit line.',
'          Joining BOTH voucher headers does two things: it enforces the',
'          as-of rule, and it excludes orphan allocations whose voucher',
'          no longer exists. One such orphan has a NULL DrVoucherTno and',
'          a Cr side inside this control account; honour it and AR',
'          overstates by exactly 34,119.00. */',
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
'       Select d.AccountCode Pty, -(d.Amount - nvl(al.Amt,0)) Recv',
'         From VoucherDetail d',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P690_PANEL    Is Null Or d.Panel        = :P690_PANEL)',
'          And (:P690_COMPANY  Is Null Or d.CompanyCode  = :P690_COMPANY)',
'          And (:P690_LOCATION Is Null Or d.LocationCode = :P690_LOCATION)),',
'     Gl As (',
'       /* The control account taken straight off the ledger, with no',
'          allocation logic at all. Computed INSIDE this statement so',
'          both sides see one read-consistent snapshot - the ERP is',
'          live and two statements minutes apart legitimately differ. */',
'       Select -Sum(d.Amount) Ctl',
'         From VoucherDetail d Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P690_PANEL    Is Null Or d.Panel        = :P690_PANEL)',
'          And (:P690_COMPANY  Is Null Or d.CompanyCode  = :P690_COMPANY)',
'          And (:P690_LOCATION Is Null Or d.LocationCode = :P690_LOCATION)),',
'     T As (',
'       Select nvl(Sum(Case When Recv > 0 Then Recv Else 0 End),0) Gross,',
'              nvl(Sum(Case When Recv < 0 Then -Recv Else 0 End),0) Cred,',
'              nvl(Sum(Recv),0) Net,',
'              Count(Distinct Case When Recv > 0 Then Pty End) DrPty,',
'              Count(Distinct Case When Recv < 0 Then Pty End) CrPty',
'         From Oi)',
'Select ''<div class="ds-arexp">''',
'    || ''<div class="ds-arexp-cell ds-arexp-cell--recv">''',
'    || ''<dl><dt>Gross Outstanding</dt><dd>&#8377;''',
'    || Case When t.Gross >= 10000000 Then to_char(Round(t.Gross/10000000,2),''FM999G990D00'') || '' Cr''',
'            When t.Gross >= 100000   Then to_char(Round(t.Gross/100000,2),''FM999G990D00'') || '' Lac''',
'            Else to_char(Round(t.Gross,0),''FM999G99G99G990'') End',
'    || ''</dd><div class="ds-arexp-sub">''',
'    || to_char(t.DrPty,''FM999G990'') || '' customers owe &middot; open debit items only</div></dl></div>''',
'    /* A customer credit is NOT a negative receivable to be netted',
'       away in the headline. It is money we hold that is not applied',
'       to any bill, and at 442 Cr against 478 Cr of debits it is the',
'       largest single fact on this page. It gets its own cell. */',
'    || ''<div class="ds-arexp-cell ds-arexp-cell--cred">''',
'    || ''<dl><dt>Customer Credits Held</dt><dd>&#8377;''',
'    || Case When t.Cred >= 10000000 Then to_char(Round(t.Cred/10000000,2),''FM999G990D00'') || '' Cr''',
'            When t.Cred >= 100000   Then to_char(Round(t.Cred/100000,2),''FM999G990D00'') || '' Lac''',
'            Else to_char(Round(t.Cred,0),''FM999G99G99G990'') End',
'    || ''</dd><div class="ds-arexp-sub">''',
'    || to_char(t.CrPty,''FM999G990'') || '' customers in credit &middot; advances, unapplied receipts and contra</div></dl></div>''',
'    || ''<div class="ds-arexp-cell ds-arexp-cell--net">''',
'    || ''<dl><dt>Net Customer Exposure</dt><dd>&#8377;''',
'    || Case When Abs(t.Net) >= 10000000 Then to_char(Round(t.Net/10000000,2),''FM999G990D00'') || '' Cr''',
'            When Abs(t.Net) >= 100000   Then to_char(Round(t.Net/100000,2),''FM999G990D00'') || '' Lac''',
'            Else to_char(Round(t.Net,0),''FM999G99G99G990'') End',
'    || ''</dd><div class="ds-arexp-sub">Gross outstanding less customer credits</div>''',
'    /* The tie-out is executed, not asserted. Difference is compared at',
'       full precision with a half-paisa tolerance and printed in full',
'       when it breaks - a receivables ledger out by four paise is out. */',
'    || Case When Abs(t.Net - g.Ctl) < 0.005',
'            Then ''<span class="ds-arexp-tie ds-arexp-tie--ok"><span class="fa fa-check"></span>Ties to SUNDRYDEBTORS GL control</span>''',
'            Else ''<span class="ds-arexp-tie ds-arexp-tie--bad"><span class="fa fa-exclamation-triangle"></span>GL control differs by &#8377;''',
'                 || to_char(Round(t.Net - g.Ctl,2),''FM999G99G99G990D00'') || ''</span>'' End',
'    || ''</dl></div></div>'' As BAND',
'  From T t Cross Join Gl g'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL,P690_AGEBASIS'
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
 p_id=>wwv_flow_imp.id(12691620487300524)
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
 p_id=>wwv_flow_imp.id(12691747386300524)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p690Filters'
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
 p_id=>wwv_flow_imp.id(12691881971300524)
,p_plug_name=>'Advanced Filters'
,p_static_id=>'filter-drawer'
,p_region_name=>'p690Drawer'
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12691953630300525)
,p_name=>'Secondary KPIs'
,p_static_id=>'kpi-secondary'
,p_template=>4502917002193490937
,p_display_sequence=>32
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-kpiwrap--5up'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The brief''s secondary KPI set. Every card is derived from the SAME',
'   Aged CTE as the primary strip, so the two strips cannot disagree.',
'   Customers Above Credit Limit is a real measure now: it reads the',
'   credit limit APPROVAL, not Party.CreditAmount, which is set on none of',
'   the 954 debtor accounts. Coverage is small and the card says so on its',
'   face rather than implying the whole book is capped. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P690_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Select d.AccountCode Pty, d.LocationCode Loc, d.VoucherDate Vdt, v.DocTypeCode Dtc,',
'              -(d.Amount - nvl(al.Amt,0)) Recv,',
'              coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) DueDate,',
'              coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate) DocDate',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P690_PANEL    Is Null Or d.Panel        = :P690_PANEL)',
'          And (:P690_COMPANY  Is Null Or d.CompanyCode  = :P690_COMPANY)',
'          And (:P690_LOCATION Is Null Or d.LocationCode = :P690_LOCATION)),',
'     Pty As (',
'       Select Pty, Sum(Case When Recv > 0 Then Recv Else 0 End) Dr',
'         From Aged Group By Pty),',
'     Conc As (Select nvl(Sum(Dr),0) Top10 From (',
'       Select Dr From Pty Where Dr > 0.005 Order By Dr Desc Fetch First 10 Rows Only)),',
'     T As (',
'       Select nvl(Sum(Case When Recv > 0 Then Recv Else 0 End),0) Gross,',
'              nvl(Sum(Case When Recv > 0 And DueDate Is Not Null',
'                            And (Select D From Asof) - DueDate > 180 Then Recv Else 0 End),0) D180,',
'              nvl(Sum(Case When Recv > 0 And DueDate Is Not Null',
'                            And (Select D From Asof) - DueDate > 365 Then Recv Else 0 End),0) D365,',
'              Count(Distinct Case When Recv <> 0 Then Pty End) ActPty,',
'              Count(Distinct Case When Recv > 0 And DueDate < (Select D From Asof) Then Pty End) OdPty,',
'              nvl(Sum(Case When Recv > 0 And DueDate > (Select D From Asof)',
'                            And DueDate <= (Select D From Asof) + 7 Then Recv Else 0 End),0) Due7,',
'              nvl(Sum(Case When Recv > 0 And DueDate > (Select D From Asof)',
'                            And DueDate <= (Select D From Asof) + 30 Then Recv Else 0 End),0) Due30,',
'              nvl(Sum(Case When Recv > 0 And DueDate Is Not Null',
'                       Then Recv * Greatest((Select D From Asof) - DueDate,0) End),0) WSum,',
'              nvl(Sum(Case When Recv > 0 And DueDate Is Not Null Then Recv End),0) WBase,',
'              nvl(Sum(Case When Recv < 0 And Dtc = ''RECEIPT''',
'                            And (Select D From Asof) - Vdt > 90 Then -Recv Else 0 End),0) OldCash',
'         From Aged),',
'     Ex As (',
'       Select (Select Count(*) From Aged Where Recv > 0 And DueDate Is Null)',
'            + (Select Count(*) From Aged a2 Cross Join Asof',
'                Where a2.Dtc = ''RECEIPT'' And a2.Recv < -0.005 And Asof.D - a2.Vdt > 90)',
'            + (Select Count(*) From DrCrAllocation a',
'                Where Not Exists (Select 1 From Voucher v Where v.Tno = a.DrVoucherTno)',
'                   Or Not Exists (Select 1 From Voucher v Where v.Tno = a.CrVoucherTno)) N',
'         From dual),',
'     /* THE EFFECTIVE APPROVED CREDIT LIMIT.',
'',
'        Party.CreditAmount and Party.CreditDays would take precedence,',
'        but they are set on 0 and 2 of 954 debtor accounts. The working',
'        source is CREDITLIMITAPPROVAL: one row per approval, per company',
'        and location, where TillDate null means it never expires. The',
'        approval in force is the latest one granted by the date whose',
'        TillDate has not passed.',
'',
'        As on the To Date rather than as on today, so a historical view',
'        is judged against the limit that was in force then.',
'',
'        No ERP code resolves this. The table carries only panel triggers,',
'        and GETCREDITLIMITASON, despite the name, derives a limit from the',
'        last thirty days of CC invoices - a different measure for a',
'        different purpose. The rule is therefore stated here.',
'',
'        A limit above Rs1,000 crore is not counted as a ceiling. The',
'        largest real limit in this data is Rs100 Cr and the two',
'        placeholders are Rs1,00,000 Cr and Rs2,00,000 Cr - a thousandfold',
'        gap with nothing inside it - so a figure that size records "no',
'        limit" rather than a control. Counting it would report a',
'        comfortable utilisation on a customer nobody is capping. */',
'     Lim As (',
'       Select Pty, Loc, Days, Amt From (',
'         Select c.PartyCode Pty, c.LocationCode Loc,',
'                c.CreditDays Days, c.CreditAmount Amt,',
'                Row_Number() Over (Partition By c.PartyCode, c.CompanyCode, c.LocationCode',
'                                   Order By c.CreditLimitApprovalDate Desc, c.Tno Desc) rn',
'           From CreditLimitApproval c Cross Join Asof',
'          Where c.CreditLimitApprovalDate <= Asof.D',
'            And (c.TillDate Is Null Or c.TillDate >= Asof.D)',
'            And (:P690_COMPANY  Is Null Or c.CompanyCode  = :P690_COMPANY)',
'            And (:P690_LOCATION Is Null Or c.LocationCode = :P690_LOCATION))',
'        Where rn = 1),',
'     Expo As (Select a.Pty, a.Loc, Sum(a.Recv) Owed From Aged a Group By a.Pty, a.Loc),',
'     Cl As (',
'       Select Count(*) WithLimit,',
'              Count(Case When l.Amt <= 10000000000 Then 1 End) Capped,',
'              Count(Case When l.Amt >  10000000000 Then 1 End) Uncapped,',
'              Count(Case When l.Amt <= 10000000000',
'                          And nvl(e.Owed,0) > l.Amt Then 1 End) Above',
'         From Lim l Left Join Expo e On e.Pty = l.Pty And e.Loc = l.Loc)',
'Select ''<a class="ds-kpi ds-kpi--amber" href="''',
'    || apex_page.get_url(p_page => 692, p_clear_cache => ''692'',',
'         p_items => ''P692_FROMDATE,P692_TODATE,P692_COMPANY,P692_LOCATION,P692_PANEL,P692_AGEBASIS,P692_BUCKET'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',DUE,5'')',
'    || ''" title="Open receivable more than 180 days past its due date."><span class="ds-kpi-ic fa fa-hourglass-end"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">180+ Days</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.D180 >= 10000000 Then to_char(Round(t.D180/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.D180/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">past due, not merely old</div></div></a>'' As S1,',
'       ''<a class="ds-kpi ds-kpi--risk" href="''',
'    || apex_page.get_url(p_page => 692, p_clear_cache => ''692'',',
'         p_items => ''P692_FROMDATE,P692_TODATE,P692_COMPANY,P692_LOCATION,P692_PANEL,P692_AGEBASIS,P692_BUCKET'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',DUE,6'')',
'    || ''" title="Open receivable more than 365 days past its due date."><span class="ds-kpi-ic fa fa-fire"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">365+ Days</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.D365 >= 10000000 Then to_char(Round(t.D365/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.D365/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">the oldest exposure carried</div></div></a>'' As S2,',
'       ''<a class="ds-kpi ds-kpi--teal" href="''',
'    || apex_page.get_url(p_page => 691, p_clear_cache => ''691'',',
'         p_items => ''P691_FROMDATE,P691_TODATE,P691_COMPANY,P691_LOCATION,P691_PANEL,P691_AGEBASIS,P691_FOCUS'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',DUE,ALL'')',
'    || ''" title="Customers carrying any non-zero position - debit, credit or both."><span class="ds-kpi-ic fa fa-users"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Active Debtors</div><div class="ds-kpi-n">''',
'    || to_char(t.ActPty,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">with a live position</div></div></a>'' As S3,',
'       ''<a class="ds-kpi ds-kpi--amber" href="''',
'    || apex_page.get_url(p_page => 691, p_clear_cache => ''691'',',
'         p_items => ''P691_FROMDATE,P691_TODATE,P691_COMPANY,P691_LOCATION,P691_PANEL,P691_AGEBASIS,P691_FOCUS'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',DUE,OVERDUE'')',
'    || ''" title="Customers with at least one item past its due date."><span class="ds-kpi-ic fa fa-user-times"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Overdue Debtors</div><div class="ds-kpi-n">''',
'    || to_char(t.OdPty,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">of '' || to_char(t.ActPty,''FM999G990'') || '' active</div></div></a>'' As S4,',
'       ''<a class="ds-kpi ds-kpi--ok" href="''',
'    || apex_page.get_url(p_page => 692, p_clear_cache => ''692'',',
'         p_items => ''P692_FROMDATE,P692_TODATE,P692_COMPANY,P692_LOCATION,P692_PANEL,P692_AGEBASIS,P692_BUCKET'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',DUE,D7'')',
'    || ''" title="Receivable whose due date falls within seven days of the As-of Date. Due-date basis only. Opens the bills behind it."><span class="ds-kpi-ic fa fa-calendar-o"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Due Next 7 Days</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Due7 >= 10000000 Then to_char(Round(t.Due7/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Due7/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">collectable this week</div></div></a>'' As S5,',
'       ''<a class="ds-kpi ds-kpi--ok" href="''',
'    || apex_page.get_url(p_page => 692, p_clear_cache => ''692'',',
'         p_items => ''P692_FROMDATE,P692_TODATE,P692_COMPANY,P692_LOCATION,P692_PANEL,P692_AGEBASIS,P692_BUCKET'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',DUE,D30'')',
'    || ''" title="Receivable whose due date falls within thirty days of the As-of Date. Due-date basis only. Opens the bills behind it."><span class="ds-kpi-ic fa fa-calendar"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Due Next 30 Days</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Due30 >= 10000000 Then to_char(Round(t.Due30/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Due30/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">collectable this month</div></div></a>'' As S6,',
'       ''<a class="ds-kpi ds-kpi--struct" href="''',
'    || apex_page.get_url(p_page => 692, p_clear_cache => ''692'',',
'         p_items => ''P692_FROMDATE,P692_TODATE,P692_COMPANY,P692_LOCATION,P692_PANEL,P692_AGEBASIS,P692_BUCKET'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',DUE,WTD'')',
'    || ''" title="Days overdue weighted by amount. Items with no due date are excluded from BOTH sides of the average, so it is not diluted by what cannot be aged. Opens exactly that population - read the Days Overdue column."><span class="ds-kpi-ic f'
||'a fa-balance-scale"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Weighted Days Overdue</div><div class="ds-kpi-n">''',
'    || nvl(to_char(Round(t.WSum / Nullif(t.WBase,0),0),''FM999G990''),''&mdash;'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">over aged items only</div></div></a>'' As S7,',
'       ''<a class="ds-kpi ds-kpi--gold" href="''',
'    || apex_page.get_url(p_page => 691, p_clear_cache => ''691'',',
'         p_items => ''P691_FROMDATE,P691_TODATE,P691_COMPANY,P691_LOCATION,P691_PANEL,P691_AGEBASIS,P691_FOCUS'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',DUE,ALL'')',
'    || ''" title="Share of gross receivable held by the ten largest debtors."><span class="ds-kpi-ic fa fa-pie-chart"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Top 10 Concentration</div><div class="ds-kpi-n">''',
'    || nvl(to_char(Round(100 * c.Top10 / Nullif(t.Gross,0),1),''FM990D0''),''&mdash;'') || ''%</div>''',
'    || ''<div class="ds-kpi-sub">&#8377;''',
'    || Case When c.Top10 >= 10000000 Then to_char(Round(c.Top10/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(c.Top10/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || '' of gross</div></div></a>'' As S8,',
'       ''<a class="ds-kpi ds-kpi--violet" href="''',
'    || apex_page.get_url(p_page => 696, p_clear_cache => ''696'',',
'         p_items => ''P696_FROMDATE,P696_TODATE,P696_COMPANY,P696_LOCATION,P696_PANEL,P696_CONTROL'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',AR-R03'')',
'    || ''" title="Receipt cash unapplied for more than 90 days - control AR-R03."><span class="ds-kpi-ic fa fa-hourglass-half"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Old Unapplied Cash</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.OldCash >= 10000000 Then to_char(Round(t.OldCash/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.OldCash/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">over 90 days on account</div></div></a>'' As S9,',
'       ''<a class="ds-kpi ds-kpi--risk" href="''',
'    || apex_page.get_url(p_page => 696, p_clear_cache => ''696'',',
'         p_items => ''P696_FROMDATE,P696_TODATE,P696_COMPANY,P696_LOCATION,P696_PANEL,P696_CATEGORY'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',CRITICAL'')',
'    || ''" title="Findings on Critical-severity controls: orphan allocation, over-allocation, cross-company allocation, old unapplied cash, null Panel."><span class="ds-kpi-ic fa fa-exclamation-triangle"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Critical Exceptions</div><div class="ds-kpi-n">''',
'    || to_char(e.N,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">unaged items, old cash and orphan allocations</div></div></a>'' As S10,',
'       ''<div class="ds-kpi ds-kpi--risk"><span class="ds-kpi-ic fa fa-hand-paper-o"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Customers Above Credit Limit</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(cl.Above,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">''',
'    || Case When cl.WithLimit = 0',
'            Then ''no approved limit is in force on this date''',
'            Else ''of '' || to_char(cl.Capped) || '' with a ceiling in force''',
'                 || Case When cl.Uncapped > 0',
'                         Then '', and '' || to_char(cl.Uncapped) || '' approved with no effective ceiling'' End',
'       End',
'    || ''</div></div></div>'' As S11',
'  From T t Cross Join Conc c Cross Join Ex e Cross Join Cl cl'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL,P690_AGEBASIS'
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
 p_id=>wwv_flow_imp.id(12692084627300525)
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
 p_id=>wwv_flow_imp.id(12692119722300525)
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
 p_id=>wwv_flow_imp.id(12692205790300525)
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
 p_id=>wwv_flow_imp.id(12692352747300525)
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
 p_id=>wwv_flow_imp.id(12692444013300525)
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
 p_id=>wwv_flow_imp.id(12692562526300525)
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
 p_id=>wwv_flow_imp.id(12692687916300525)
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
 p_id=>wwv_flow_imp.id(12692760542300525)
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
 p_id=>wwv_flow_imp.id(12692894400300525)
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
 p_id=>wwv_flow_imp.id(12692953333300525)
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
 p_id=>wwv_flow_imp.id(12693088319300525)
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
 p_id=>wwv_flow_imp.id(12693149821300552)
,p_name=>'Receivables KPIs'
,p_static_id=>'kpi-strip'
,p_template=>4502917002193490937
,p_display_sequence=>30
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-kpiwrap--5up'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P690_TODATE,''DD-MM-RRRR'') D From dual),',
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
'              (Select p2.IsCompanyAccount From Party p2',
'               Where p2.PartyCode = d.AccountCode) IsCo,',
'              -(d.Amount - nvl(al.Amt,0)) Recv,',
'              coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) DueDate,',
'              Case When v.VoucherNo = ''OPENING''  Then ''Opening Carry-forward''',
'                   When v.ModuleCode = ''INVOICE'' Then ''Trade Invoice''',
'                   When v.DocTypeCode = ''RECEIPT'' Then ''Receipt / On-account''',
'                   Else ''Other'' End Cls,',
'              /* Bucket 0 = Not Due, 1..6 = ranges, 7 = Cannot Age.',
'                 Identical expression on every AR region. */',
'              Case When nvl(:P690_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) Is Null Then 7',
'                   When nvl(:P690_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) >= Asof.D Then 0',
'                   When (Case When :P690_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <=  30 Then 1',
'                   When (Case When :P690_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <=  60 Then 2',
'                   When (Case When :P690_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <=  90 Then 3',
'                   When (Case When :P690_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <= 180 Then 4',
'                   When (Case When :P690_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <= 365 Then 5',
'                   Else 6 End Bkt,',
'              Case When :P690_AGEBASIS = ''DOC''',
'                   Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                   When coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) Is Not Null',
'                   Then Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0)',
'              End DaysOd',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P690_PANEL    Is Null Or d.Panel        = :P690_PANEL)',
'          And (:P690_COMPANY  Is Null Or d.CompanyCode  = :P690_COMPANY)',
'          And (:P690_LOCATION Is Null Or d.LocationCode = :P690_LOCATION)),',
'     Rc As (',
'       /* Collections are ACTUAL RECEIPT TRANSACTIONS in the period.',
'          Never a fall in outstanding - a fall in outstanding also',
'          happens through credit notes, write-backs and allocation. */',
'       Select nvl(Sum(d.Amount),0) Amt, Count(Distinct d.Tno) N',
'         From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And v.DocTypeCode = ''RECEIPT''',
'          And d.VoucherDate >= to_date(:P690_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P690_TODATE,''DD-MM-RRRR'') + 1',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P690_PANEL    Is Null Or d.Panel        = :P690_PANEL)',
'          And (:P690_COMPANY  Is Null Or d.CompanyCode  = :P690_COMPANY)',
'          And (:P690_LOCATION Is Null Or d.LocationCode = :P690_LOCATION)),',
'     P As (',
'       Select Pty,',
'              Sum(Case When Recv > 0 Then Recv Else 0 End) Dr,',
'              Sum(Case When Recv < 0 Then -Recv Else 0 End) Cr',
'         From Aged Group By Pty),',
'     T As (',
'       Select nvl(Sum(Case When Recv > 0 Then Recv Else 0 End),0) Gross,',
'              nvl(Sum(Case When Recv > 0 And Bkt = 0 Then Recv Else 0 End),0) NotDue,',
'              nvl(Sum(Case When Recv > 0 And Bkt Between 1 And 6 Then Recv Else 0 End),0) Overdue,',
'              nvl(Sum(Case When Recv > 0 And Bkt >= 4 And Bkt <= 6 Then Recv Else 0 End),0) D90,',
'              nvl(Sum(Case When Recv > 0 And Bkt >= 5 And Bkt <= 6 Then Recv Else 0 End),0) D180,',
'              nvl(Sum(Case When Recv > 0 And Bkt = 7 Then Recv Else 0 End),0) NoAge,',
'              nvl(Sum(Case When Recv < 0 And Cls = ''Receipt / On-account'' Then -Recv Else 0 End),0) Unapp,',
'              nvl(Sum(Case When Recv < 0 Then -Recv Else 0 End),0) Cred,',
'              nvl(Sum(Recv),0) Net,',
'              Count(Distinct Case When Recv > 0 And Bkt Between 1 And 6 Then Pty End) OdPty,',
'              Count(Distinct Case When Recv <> 0 Then Pty End) ActPty,',
'              nvl(Sum(Case When Recv > 0 And DaysOd Is Not Null Then Recv * DaysOd End),0) WSum,',
'              nvl(Sum(Case When Recv > 0 And DaysOd Is Not Null Then Recv End),0) WBase',
'              ,Count(Distinct Case When Recv <> 0 And IsCo = ''YES'' Then Pty End) IntPty',
'              ,nvl(Sum(Case When Recv > 0 And IsCo = ''YES'' Then Recv Else 0 End),0) IntGross',
'         From Aged),',
'     B As (Select Count(*) N From P Where Dr > 0.005 And Cr > 0.005)',
'Select /* Card 1 - the headline, drills to the party summary */',
'       ''<a class="ds-kpi ds-kpi--gold" href="''',
'    || apex_page.get_url(p_page => 691, p_clear_cache => ''691'',',
'         p_items => ''P691_FROMDATE,P691_TODATE,P691_COMPANY,P691_LOCATION,P691_PANEL,P691_AGEBASIS,P691_FOCUS'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',''|| nvl(:P690_AGEBASIS,''DUE'') ||'',ALL'')',
'    || ''" title="Sum of open debit items on the SUNDRYDEBTORS control account as at the As-of Date. Open = original amount less allocations whose both vouchers are dated on or before that date.">''',
'    || ''<span class="ds-kpi-ic fa fa-inbox"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Gross Outstanding</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Gross >= 10000000 Then to_char(Round(t.Gross/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Gross/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">as at '' || :P690_TODATE || '' &middot; '' || to_char(t.ActPty,''FM999G990'') || '' active debtors</div>''',
'    || ''</div></a>'' As KPI1,',
'       /* Card 2 */',
'       ''<a class="ds-kpi ds-kpi--ok" href="''',
'    || apex_page.get_url(p_page => 692, p_clear_cache => ''692'',',
'         p_items => ''P692_FROMDATE,P692_TODATE,P692_COMPANY,P692_LOCATION,P692_PANEL,P692_AGEBASIS,P692_BUCKET'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',''|| nvl(:P690_AGEBASIS,''DUE'') ||'',0'')',
'    || ''" title="Open receivable whose due date falls on or after the As-of Date. Available on the Due Date basis only.">''',
'    || ''<span class="ds-kpi-ic fa fa-calendar-check-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Not Yet Due</div><div class="ds-kpi-n">''',
'    || Case When nvl(:P690_AGEBASIS,''DUE'') = ''DOC'' Then ''<span style="font-size:15px">Due basis only</span>''',
'            Else ''&#8377;'' || Case When t.NotDue >= 10000000 Then to_char(Round(t.NotDue/10000000,2),''FM999G990D00'') || '' Cr''',
'                                  Else to_char(Round(t.NotDue/100000,2),''FM999G990D00'') || '' Lac'' End End',
'    || ''</div><div class="ds-kpi-sub">''',
'    || Case When nvl(:P690_AGEBASIS,''DUE'') = ''DOC'' Then ''Document-date ageing measures age, not lateness''',
'            Else to_char(Round(100 * t.NotDue / Nullif(t.Gross,0),1),''FM990D0'') || ''% of gross outstanding'' End',
'    || ''</div></div></a>'' As KPI2,',
'       /* Card 3 */',
'       ''<a class="ds-kpi ds-kpi--'' || Case When t.Overdue > t.Gross * 0.5 Then ''risk'' Else ''amber'' End || ''" href="''',
'    || apex_page.get_url(p_page => 692, p_clear_cache => ''692'',',
'         p_items => ''P692_FROMDATE,P692_TODATE,P692_COMPANY,P692_LOCATION,P692_PANEL,P692_AGEBASIS,P692_BUCKET'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',''|| nvl(:P690_AGEBASIS,''DUE'') ||'',OD'')',
'    || ''" title="Open receivable past its due date (Due basis) or aged beyond zero days (Document basis). Items that cannot be aged are NOT counted here - they have their own card.">''',
'    || ''<span class="ds-kpi-ic fa fa-exclamation-circle"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Total Overdue</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Overdue >= 10000000 Then to_char(Round(t.Overdue/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Overdue/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">''',
'    || Case When t.Gross > 0 Then to_char(Round(100 * t.Overdue / t.Gross,1),''FM990D0'') || ''% of gross'' Else ''no outstanding'' End',
'    || '' &middot; '' || to_char(t.OdPty,''FM999G990'') || '' debtors</div></div></a>'' As KPI3,',
'       /* Card 4 - the honesty card. It exists because on the Due basis',
'          72% of value lands here, and a dashboard that hides that is',
'          worse than one that has no ageing at all. */',
'       ''<a class="ds-kpi ds-kpi--struct" href="''',
'    || apex_page.get_url(p_page => 692, p_clear_cache => ''692'',',
'         p_items => ''P692_FROMDATE,P692_TODATE,P692_COMPANY,P692_LOCATION,P692_PANEL,P692_AGEBASIS,P692_BUCKET'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',DUE,7'')',
'    || ''" title="Open receivable with no due date on its source document and no credit terms to derive one from. Never given an arbitrary bucket and never dropped.">''',
'    || ''<span class="ds-kpi-ic fa fa-question-circle"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Cannot Age &mdash; No Due Date</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.NoAge >= 10000000 Then to_char(Round(t.NoAge/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.NoAge/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">''',
'    || Case When t.Gross > 0 Then to_char(Round(100 * t.NoAge / t.Gross,1),''FM990D0'') || ''% of gross'' Else ''&mdash;'' End',
'    || '' &middot; control AR-B02</div></div></a>'' As KPI4,',
'       /* Card 5 */',
'       ''<a class="ds-kpi ds-kpi--risk" href="''',
'    || apex_page.get_url(p_page => 692, p_clear_cache => ''692'',',
'         p_items => ''P692_FROMDATE,P692_TODATE,P692_COMPANY,P692_LOCATION,P692_PANEL,P692_AGEBASIS,P692_BUCKET'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',''|| nvl(:P690_AGEBASIS,''DUE'') ||'',90'')',
'    || ''" title="Open receivable in the 91-180, 181-365 and over-365 buckets combined.">''',
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
'    || apex_page.get_url(p_page => 694, p_clear_cache => ''694'',',
'         p_items => ''P694_FROMDATE,P694_TODATE,P694_COMPANY,P694_LOCATION,P694_PANEL'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL)',
'    || ''" title="Actual RECEIPT voucher lines posted to a debtor account between From Date and To Date. This is a transaction count, never a movement in outstanding.">''',
'    || ''<span class="ds-kpi-ic fa fa-download"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Receipts in Period</div><div class="ds-kpi-n">&#8377;''',
'    || Case When rc.Amt >= 10000000 Then to_char(Round(rc.Amt/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(rc.Amt/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">'' || to_char(rc.N,''FM999G990'') || '' receipts &middot; ''',
'    || :P690_FROMDATE || '' to '' || :P690_TODATE || ''</div></div></a>'' As KPI6,',
'       /* Card 7 - the largest actionable item in this dataset */',
'       ''<a class="ds-kpi ds-kpi--violet" href="''',
'    || apex_page.get_url(p_page => 695, p_clear_cache => ''695'',',
'         p_items => ''P695_FROMDATE,P695_TODATE,P695_COMPANY,P695_LOCATION,P695_PANEL'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL)',
'    || ''" title="Receipt lines carrying an open credit balance - cash received and never applied to a bill. Only 31% of AR lines in this ledger have ever been allocated.">''',
'    || ''<span class="ds-kpi-ic fa fa-hand-o-up"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Unapplied Cash</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Unapp >= 10000000 Then to_char(Round(t.Unapp/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Unapp/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">of &#8377;''',
'    || Case When t.Cred >= 10000000 Then to_char(Round(t.Cred/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Cred/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || '' total customer credits</div></div></a>'' As KPI7,',
'       /* Card 8 - customers who owe AND hold credit at the same time */',
'       ''<a class="ds-kpi ds-kpi--amber" href="''',
'    || apex_page.get_url(p_page => 695, p_clear_cache => ''695'',',
'         p_items => ''P695_FROMDATE,P695_TODATE,P695_COMPANY,P695_LOCATION,P695_PANEL,P695_BOTH'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',Y'')',
'    || ''" title="Customers holding an open debit AND an open credit simultaneously. Their receivable can be reduced by allocation alone, with no collection effort.">''',
'    || ''<span class="ds-kpi-ic fa fa-random"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">AR + Advance Together</div><div class="ds-kpi-n">''',
'    || to_char(b.N,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">customers whose bills could be settled by allocation</div>''',
'    || ''</div></a>'' As KPI8,',
'       /* Internal Debtors - the Active Debtors count, but only parties',
'          flagged Is Company Account in the master. Opens the same',
'          Party-wise Outstanding list, filtered to Internal. */',
'       ''<a class="ds-kpi ds-kpi--slate" href="''',
'    || apex_page.get_url(p_page => 691, p_clear_cache => ''691'',',
'         p_items => ''P691_FROMDATE,P691_TODATE,P691_COMPANY,P691_LOCATION,P691_PANEL,P691_AGEBASIS,P691_FOCUS'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',''|| nvl(:P690_AGEBASIS,''DUE'') ||'',INTERNAL'')',
'    || ''" title="Active debtors (a live position as at the As-of Date) whose account master carries Is Company Account = YES. Opens Party-wise Outstanding filtered to Internal.">''',
'    || ''<span class="ds-kpi-ic fa fa-building-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Internal Debtors</div><div class="ds-kpi-n">''',
'    || to_char(t.IntPty,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">company accounts with a live position</div>''',
'    || ''</div></a>'' As KPI9,',
'       /* Internal Outstanding - Gross Outstanding restricted to those',
'          same company accounts, so it foots to the Internal view. */',
'       ''<a class="ds-kpi ds-kpi--gold" href="''',
'    || apex_page.get_url(p_page => 691, p_clear_cache => ''691'',',
'         p_items => ''P691_FROMDATE,P691_TODATE,P691_COMPANY,P691_LOCATION,P691_PANEL,P691_AGEBASIS,P691_FOCUS'',',
'         p_values => :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL ||'',''|| nvl(:P690_AGEBASIS,''DUE'') ||'',INTERNAL'')',
'    || ''" title="Gross Outstanding (open debit items as at the As-of Date) for parties flagged Is Company Account = YES. Opens Party-wise Outstanding filtered to Internal.">''',
'    || ''<span class="ds-kpi-ic fa fa-inbox"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Internal Outstanding</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.IntGross >= 10000000 Then to_char(Round(t.IntGross/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.IntGross/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">of company-account parties &middot; gross</div>''',
'    || ''</div></a>'' As KPI10',
'',
'  From T t Cross Join Rc rc Cross Join B b'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL,P690_AGEBASIS'
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
 p_id=>wwv_flow_imp.id(12693216968300553)
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
 p_id=>wwv_flow_imp.id(12693346808300553)
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
 p_id=>wwv_flow_imp.id(12693441054300553)
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
 p_id=>wwv_flow_imp.id(12693544723300553)
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
 p_id=>wwv_flow_imp.id(12693686942300553)
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
 p_id=>wwv_flow_imp.id(12693741358300553)
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
 p_id=>wwv_flow_imp.id(12693841135300553)
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
 p_id=>wwv_flow_imp.id(12693955471300553)
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
 p_id=>wwv_flow_imp.id(12694051017300553)
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
 p_id=>wwv_flow_imp.id(12694134709300553)
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
 p_id=>wwv_flow_imp.id(12694207658300553)
,p_plug_name=>'Overdue Movement'
,p_static_id=>'overdue-movement'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
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
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Spine As (',
'       Select Me From (',
'         Select Least(Last_Day(Add_Months(trunc(to_date(:P690_FROMDATE,''DD-MM-RRRR''),''MM''), Level - 1)),',
'                      to_date(:P690_TODATE,''DD-MM-RRRR'')) Me',
'           From dual',
'        Connect By Level <= Months_Between(trunc(to_date(:P690_TODATE,''DD-MM-RRRR''),''MM''),',
'                                           trunc(to_date(:P690_FROMDATE,''DD-MM-RRRR''),''MM'')) + 1)',
'        Where Me >= date ''2026-04-01''),',
'     Ln As (',
'       Select d.Tno, d.Sno, d.Amount Amt, d.VoucherDate Vdt,',
'              coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) DueDate',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P690_PANEL    Is Null Or d.Panel        = :P690_PANEL)',
'          And (:P690_COMPANY  Is Null Or d.CompanyCode  = :P690_COMPANY)',
'          And (:P690_LOCATION Is Null Or d.LocationCode = :P690_LOCATION)),',
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
'       Select s.Me, -(l.Amt - nvl(al.Amt,0)) Recv, l.DueDate,',
'              Case When l.DueDate Is Null Then Null Else s.Me - l.DueDate End Od',
'         From Ln l',
'         Join Spine s On l.Vdt <= s.Me',
'         Left Join Al al On al.Me = s.Me And al.Tno = l.Tno And al.Sno = l.Sno)',
'Select to_char(Me,''Mon-RR'')                                                    As LABEL,',
'       Round(Sum(Case When Recv > 0 And Od > 0 Then Recv Else 0 End)/10000000,2) As OVERDUE_CR,',
'       Round(Sum(Case When Recv > 0 And Od > 90 Then Recv Else 0 End)/10000000,2) As OVER90_CR,',
'       Round(Sum(Case When Recv > 0 And DueDate Is Null Then Recv Else 0 End)/10000000,2) As CANNOT_AGE_CR',
'  From P Group By Me Order By Me'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12694398474300553)
,p_region_id=>wwv_flow_imp.id(12694207658300553)
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
 p_id=>wwv_flow_imp.id(12694451996300554)
,p_chart_id=>wwv_flow_imp.id(12694398474300553)
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
 p_id=>wwv_flow_imp.id(12694594408300554)
,p_chart_id=>wwv_flow_imp.id(12694398474300553)
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
 p_id=>wwv_flow_imp.id(12694601356300554)
,p_chart_id=>wwv_flow_imp.id(12694398474300553)
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
 p_id=>wwv_flow_imp.id(12694761513300554)
,p_chart_id=>wwv_flow_imp.id(12694398474300553)
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
 p_id=>wwv_flow_imp.id(12694819412300554)
,p_chart_id=>wwv_flow_imp.id(12694398474300553)
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
 p_id=>wwv_flow_imp.id(12694966633300554)
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
'                          Then :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL',
'                          Else :P690_FROMDATE ||'',''|| :P690_TODATE ||'',''|| :P690_COMPANY ||'',''|| :P690_LOCATION ||'',''|| :P690_PANEL End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 690',
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
'            And b.PageID <> 690',
'            And (upper(c.BossUserName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)',
'                 Or upper(c.LoginName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)))'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL'
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
 p_id=>wwv_flow_imp.id(12695016710300555)
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
 p_id=>wwv_flow_imp.id(12695119449300555)
,p_plug_name=>'Ageing'
,p_static_id=>'rule-ageing'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
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
 p_id=>wwv_flow_imp.id(12695207579300555)
,p_plug_name=>'Control and Traceability'
,p_static_id=>'rule-control'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
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
 p_id=>wwv_flow_imp.id(12695317820300555)
,p_plug_name=>'Receivables Pulse'
,p_static_id=>'rule-pulse'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>28
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Receivables Pulse</h2>',
'  <p>Every card is clickable and lands on the exact rows behind it</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12695454326300556)
,p_plug_name=>'Top Debtors by Net Exposure'
,p_static_id=>'top-debtors'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>44
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P690_TODATE,''DD-MM-RRRR'') D From dual),',
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
'              Sum(Case When -(d.Amount - nvl(al.Amt,0)) > 0 Then -(d.Amount - nvl(al.Amt,0)) Else 0 End) Dr,',
'              Sum(Case When -(d.Amount - nvl(al.Amt,0)) < 0 Then  (d.Amount - nvl(al.Amt,0)) Else 0 End) Cr',
'         From VoucherDetail d',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P690_PANEL    Is Null Or d.Panel        = :P690_PANEL)',
'          And (:P690_COMPANY  Is Null Or d.CompanyCode  = :P690_COMPANY)',
'          And (:P690_LOCATION Is Null Or d.LocationCode = :P690_LOCATION)',
'        Group By d.AccountCode)',
'Select * From (',
'  Select nvl(pa.PartyName, p.Pty) As LABEL,',
'         Round(p.Dr/100000,2) As RECEIVABLE_LAC,',
'         Round(p.Cr/100000,2) As CREDIT_LAC,',
'         p.Pty As PARTY_CODE',
'    From P p Left Join Party pa On pa.PartyCode = p.Pty',
'   Where p.Dr > 0.005',
'   Order By p.Dr Desc)',
' Where rownum <= 12',
' /* Outer Order By is required: the inner one only picks the twelve',
'    rows, it does not survive to the result set. */',
' Order By RECEIVABLE_LAC Desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL,P690_AGEBASIS'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12695521220300556)
,p_region_id=>wwv_flow_imp.id(12695454326300556)
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
,p_no_data_found_message=>'No customer carries an open receivable in this scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12695694351300556)
,p_chart_id=>wwv_flow_imp.id(12695521220300556)
,p_static_id=>'credit'
,p_seq=>20
,p_name=>unistr('Credit Held (\20B9 Lac)')
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
 p_id=>wwv_flow_imp.id(12695716927300556)
,p_chart_id=>wwv_flow_imp.id(12695521220300556)
,p_static_id=>'receivable'
,p_seq=>10
,p_name=>unistr('Receivable (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'RECEIVABLE_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:693:&SESSION.::&DEBUG.::P693_PARTY,P693_FROMDATE,P693_TODATE,P693_COMPANY,P693_LOCATION,P693_PANEL,P693_AGEBASIS:&PARTY_CODE.,&P690_FROMDATE.,&P690_TODATE.,&P690_COMPANY.,&P690_LOCATION.,&P690_PANEL.,&P690_AGEBASIS.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12695865986300556)
,p_chart_id=>wwv_flow_imp.id(12695521220300556)
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
 p_id=>wwv_flow_imp.id(12695994190300556)
,p_chart_id=>wwv_flow_imp.id(12695521220300556)
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
 p_id=>wwv_flow_imp.id(12696020381300556)
,p_plug_name=>'Top Overdue Debtors'
,p_static_id=>'top-overdue'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>46
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P690_TODATE,''DD-MM-RRRR'') D From dual),',
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
'              Sum(Case When -(d.Amount - nvl(al.Amt,0)) > 0',
'                        And coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) < (Select D From Asof)',
'                       Then -(d.Amount - nvl(al.Amt,0)) Else 0 End) Overdue,',
'              Sum(Case When -(d.Amount - nvl(al.Amt,0)) > 0',
'                        And coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) < (Select D From Asof) - 90',
'                       Then -(d.Amount - nvl(al.Amt,0)) Else 0 End) Over90',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P690_PANEL    Is Null Or d.Panel        = :P690_PANEL)',
'          And (:P690_COMPANY  Is Null Or d.CompanyCode  = :P690_COMPANY)',
'          And (:P690_LOCATION Is Null Or d.LocationCode = :P690_LOCATION)',
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
,p_ajax_items_to_submit=>'P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL,P690_AGEBASIS'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12696114778300556)
,p_region_id=>wwv_flow_imp.id(12696020381300556)
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
,p_no_data_found_message=>'No customer is overdue in this scope on the due-date basis.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12696224925300556)
,p_chart_id=>wwv_flow_imp.id(12696114778300556)
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
 p_id=>wwv_flow_imp.id(12696364745300556)
,p_chart_id=>wwv_flow_imp.id(12696114778300556)
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
,p_link_target=>'f?p=&APP_ID.:693:&SESSION.::&DEBUG.::P693_PARTY,P693_FROMDATE,P693_TODATE,P693_COMPANY,P693_LOCATION,P693_PANEL,P693_AGEBASIS:&PARTY_CODE.,&P690_FROMDATE.,&P690_TODATE.,&P690_COMPANY.,&P690_LOCATION.,&P690_PANEL.,&P690_AGEBASIS.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12696456029300556)
,p_chart_id=>wwv_flow_imp.id(12696114778300556)
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
 p_id=>wwv_flow_imp.id(12696518189300556)
,p_chart_id=>wwv_flow_imp.id(12696114778300556)
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
 p_id=>wwv_flow_imp.id(12696601512300557)
,p_plug_name=>'Longer-run trend'
,p_static_id=>'trend-link'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-arnote"><span class="fa fa-line-chart"></span><div>',
'  <b>Outstanding Trend, Ageing Mix Trend and Receipt Application</b> are on the dedicated',
'  <b>AR Trend Analysis</b> page, where each series is re-derived at every month end rather than',
'  compressed onto this dashboard. Open it from the navigation menu, or from the Overdue Movement',
'  chart above, which uses the same month-end construction.',
'</div></div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12697739612300558)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12691747386300524)
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
 p_id=>wwv_flow_imp.id(12697885077300558)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12691747386300524)
,p_button_name=>'OPENFILTERS'
,p_static_id=>'open-filters'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Ageing Basis'
,p_button_redirect_url=>'javascript:apex.theme.openRegion(''p690Drawer'');'
,p_button_execute_validations=>'N'
,p_button_css_classes=>'ds-filter-trigger'
,p_icon_css_classes=>'fa-sliders'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12697908752300558)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(12691881971300524)
,p_button_name=>'RESETFILTERS'
,p_static_id=>'reset-filters'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Reset All Filters'
,p_button_redirect_url=>'f?p=&APP_ID.:690:&SESSION.::&DEBUG.:690'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-times'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12696767089300557)
,p_name=>'P690_AGEBASIS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12691881971300524)
,p_item_default=>'DUE'
,p_prompt=>'Ageing Basis'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Due Date (lateness);DUE,Document Date (age);DOC'
,p_colspan=>12
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Due Date measures LATENESS and is the accounting-correct basis, but due dates exist on only 28% of open receivable value here - the rest lands in an explicit Cannot Age bucket. Document Date measures AGE, covers every item, and is the basis every exi'
||'sting iBOSS ageing report uses. Neither is hidden and neither is presented as the only answer.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12696962199300557)
,p_name=>'P690_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12691747386300524)
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
 p_id=>wwv_flow_imp.id(12697074595300557)
,p_name=>'P690_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12691747386300524)
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
,p_help_text=>'Start of the FLOW window. It bounds receipts, billing and credit notes. It does NOT affect outstanding, ageing or advances - those are point-in-time balances measured at the To Date.'
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
 p_id=>wwv_flow_imp.id(12697294863300557)
,p_name=>'P690_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12691747386300524)
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
'                  And (:P690_COMPANY Is Null Or v.CompanyCode = :P690_COMPANY)',
'                  And ((Select GetUserPanelAB_apex() From dual) Is Null',
'                       Or v.Panel = (Select GetUserPanelAB_apex() From dual)))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P690_COMPANY'
,p_ajax_items_to_submit=>'P690_COMPANY'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>'"Location" is the business term throughout this dashboard; the underlying column is LocationCode and is never renamed, only relabelled. The list shows only locations that actually carry a receivable, narrowed by the selected Company. NOTE FOR MAINTAI'
||'NERS - an LOV query must begin with SELECT. A leading /* */ comment here makes APEX fail the item at render time with "Error during rendering of page item P690_LOCATION", which apex validate does not catch. Rationale for an LOV therefore belongs in t'
||'his help text, not above its SQL.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12697490500300557)
,p_name=>'P690_PANEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12691747386300524)
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
 p_id=>wwv_flow_imp.id(12697509708300557)
,p_name=>'P690_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12691747386300524)
,p_item_default=>'Select to_char(trunc(sysdate),''DD-MM-RRRR'') From dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date / As-of'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'End of the flow window AND the As-of Date for every balance on the page. Outstanding, ageing, advances and net exposure are all measured as at this date, reconstructed from effective transactions - not rolled back from today.'
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
