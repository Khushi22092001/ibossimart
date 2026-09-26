prompt --application/pages/page_00718
begin
--   Manifest
--     PAGE: 00718
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
 p_id=>718
,p_name=>'AP Trends and Cash Forecast'
,p_alias=>'AP-TREND-ANALYSIS'
,p_step_title=>'AP Trends and Cash Forecast'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(9965433630286257)
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'Every series here is a POINT-IN-TIME position re-derived at each month end, not a running total of period movements - outstanding at 30-Jun is what was actually open on that date, with allocations counted only if both their vouchers were dated on or '
||'before it. That is why the month spine is cross-joined into the open-item layer rather than the layer being summed by month. Month ends before 01-04-2026 are not shown: VoucherDetail begins 01-03-2026 and prior-year AP arrives as OPENING journals dat'
||'ed 31-03-2026, so an earlier point would be reconstructed from a carry-forward that does not represent a real position.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12867537484301473)
,p_plug_name=>'Ageing Mix Trend'
,p_static_id=>'ageing-mix'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Composition of the open payable at each month end. Ageing here is',
'   on the DOCUMENT basis deliberately: on the Due basis 72% of value',
'   would land in Cannot Age at every point and the chart would say',
'   nothing about how the mix is moving. The document basis ages every',
'   item, which is what a mix chart needs. The page says so. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Spine As (',
'       Select Me From (',
'         Select Least(Last_Day(Add_Months(trunc(to_date(:P718_FROMDATE,''DD-MM-RRRR''),''MM''), Level - 1)),',
'                      to_date(:P718_TODATE,''DD-MM-RRRR'')) Me',
'           From dual',
'        Connect By Level <= Months_Between(trunc(to_date(:P718_TODATE,''DD-MM-RRRR''),''MM''),',
'                                           trunc(to_date(:P718_FROMDATE,''DD-MM-RRRR''),''MM'')) + 1)',
'        Where Me >= date ''2026-04-01''),',
'     Ln As (',
'       Select d.Tno, d.Sno, d.Amount Amt, d.VoucherDate Vdt,',
'              coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate) DocDate',
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
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING'' And ao.Tno = d.ModuleTno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P718_PANEL    Is Null Or d.Panel        = :P718_PANEL)',
'          And (:P718_COMPANY  Is Null Or d.CompanyCode  = :P718_COMPANY)',
'          And (:P718_LOCATION Is Null Or d.LocationCode = :P718_LOCATION)),',
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
'       Select s.Me, (l.Amt - nvl(al.Amt,0)) Pay, s.Me - l.DocDate Age',
'         From Ln l',
'         Join Spine s On l.Vdt <= s.Me',
'         Left Join Al al On al.Me = s.Me And al.Tno = l.Tno And al.Sno = l.Sno)',
'Select to_char(Me,''Mon-RR'')                                                  As LABEL,',
'       Round(Sum(Case When Pay > 0 And Age <=  30 Then Pay Else 0 End)/10000000,2) As D0_30,',
'       Round(Sum(Case When Pay > 0 And Age >  30 And Age <=  60 Then Pay Else 0 End)/10000000,2) As D31_60,',
'       Round(Sum(Case When Pay > 0 And Age >  60 And Age <=  90 Then Pay Else 0 End)/10000000,2) As D61_90,',
'       Round(Sum(Case When Pay > 0 And Age >  90 And Age <= 180 Then Pay Else 0 End)/10000000,2) As D91_180,',
'       Round(Sum(Case When Pay > 0 And Age > 180 Then Pay Else 0 End)/10000000,2) As D180_PLUS',
'  From P Group By Me Order By Me'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P718_FROMDATE,P718_TODATE,P718_COMPANY,P718_LOCATION,P718_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12867672193301473)
,p_region_id=>wwv_flow_imp.id(12867537484301473)
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
,p_no_data_found_message=>'No open payable at any month end in this window.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12867707747301473)
,p_chart_id=>wwv_flow_imp.id(12867672193301473)
,p_static_id=>'b1'
,p_seq=>10
,p_name=>unistr('0\201330 (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'D0_30'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12867878376301473)
,p_chart_id=>wwv_flow_imp.id(12867672193301473)
,p_static_id=>'b2'
,p_seq=>20
,p_name=>unistr('31\201360 (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'D31_60'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12867905327301473)
,p_chart_id=>wwv_flow_imp.id(12867672193301473)
,p_static_id=>'b3'
,p_seq=>30
,p_name=>unistr('61\201390 (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'D61_90'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12868007423301473)
,p_chart_id=>wwv_flow_imp.id(12867672193301473)
,p_static_id=>'b4'
,p_seq=>40
,p_name=>unistr('91\2013180 (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'D91_180'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12868111242301473)
,p_chart_id=>wwv_flow_imp.id(12867672193301473)
,p_static_id=>'b5'
,p_seq=>50
,p_name=>unistr('Over 180 (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'D180_PLUS'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12868275673301474)
,p_chart_id=>wwv_flow_imp.id(12867672193301473)
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
 p_id=>wwv_flow_imp.id(12868344336301474)
,p_chart_id=>wwv_flow_imp.id(12867672193301473)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('Open Payable (\20B9 Cr)')
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
 p_id=>wwv_flow_imp.id(12868425595301474)
,p_plug_name=>'How these series are built'
,p_static_id=>'basis-note'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-apnote"><span class="fa fa-line-chart"></span><div>',
'  <b>Each point is a position, not a movement.</b> Outstanding at a month end is re-derived from the',
'  open-item layer as at that date, counting an allocation only when <i>both</i> of its vouchers are dated',
'  on or before it &mdash; so a bill paid in July still shows open at the end of June.',
'  Bills Booked and Payments Made are the exception: those two <i>are</i> flows, summed within each month.',
'  <br><br>',
'  Month ends before <b>01-04-2026</b> are not plotted. <code>VoucherDetail</code> begins 01-03-2026 and',
'  prior-year payables arrive as <code>OPENING</code> journals dated 31-03-2026, so any earlier point',
'  would be an artefact of the carry-forward rather than a real position.',
'</div></div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12868595541301474)
,p_plug_name=>'Bills Booked vs Payments Made'
,p_static_id=>'billing-collection'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* These two ARE flows and are summed within each month - the one place',
'   on this page where that is the correct treatment. Payments are the',
'   debit side of payment vouchers on every channel, never a fall in',
'   outstanding. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode)',
'Select to_char(trunc(d.VoucherDate,''MM''),''Mon-RR'') As LABEL,',
'       Round(Sum(Case When d.Amount > 0',
'                       And (v.ModuleCode In (''PBPASS'',''JBPASS'',''FREIGHTADVICE'',''CASHPURCHASE'',',
'                                             ''NECESSITYCOMPLETION'',''NECESSITYSLIP'',''EXTERNALSERVICESENTRY'')',
'                            Or v.DocTypeCode = ''SERVICEBILL'')',
'                      Then d.Amount Else 0 End)/10000000,2)  As BILLING_CR,',
'       Round(Sum(Case When v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'') And d.Amount < 0',
'                      Then -d.Amount Else 0 End)/10000000,2) As COLLECTION_CR,',
'       Round(Sum(Case When v.DocTypeCode = ''DEBITNOTE'' And d.Amount < 0',
'                      Then -d.Amount Else 0 End)/10000000,2) As CREDITNOTE_CR',
'  From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
' Where d.AccountCode In (Select PartyCode From Sd)',
'   And d.VoucherDate >= to_date(:P718_FROMDATE,''DD-MM-RRRR'')',
'   And d.VoucherDate <  to_date(:P718_TODATE,''DD-MM-RRRR'') + 1',
'   And ((Select GetUserPanelAB_apex() From dual) Is Null',
'        Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'   And (:P718_PANEL    Is Null Or d.Panel        = :P718_PANEL)',
'   And (:P718_COMPANY  Is Null Or d.CompanyCode  = :P718_COMPANY)',
'   And (:P718_LOCATION Is Null Or d.LocationCode = :P718_LOCATION)',
' Group By trunc(d.VoucherDate,''MM'')',
' Order By trunc(d.VoucherDate,''MM'')'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P718_FROMDATE,P718_TODATE,P718_COMPANY,P718_LOCATION,P718_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12868662131301474)
,p_region_id=>wwv_flow_imp.id(12868595541301474)
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
,p_no_data_found_message=>'Nothing was billed or collected in this window.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12868792093301474)
,p_chart_id=>wwv_flow_imp.id(12868662131301474)
,p_static_id=>'billing'
,p_seq=>10
,p_name=>unistr('Bills Booked (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'BILLING_CR'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12868844221301474)
,p_chart_id=>wwv_flow_imp.id(12868662131301474)
,p_static_id=>'collection'
,p_seq=>20
,p_name=>unistr('Payments Made (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'COLLECTION_CR'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12868975582301474)
,p_chart_id=>wwv_flow_imp.id(12868662131301474)
,p_static_id=>'creditnote'
,p_seq=>30
,p_name=>unistr('Credit Notes (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'CREDITNOTE_CR'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12869049244301474)
,p_chart_id=>wwv_flow_imp.id(12868662131301474)
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
 p_id=>wwv_flow_imp.id(12869165208301474)
,p_chart_id=>wwv_flow_imp.id(12868662131301474)
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
 p_id=>wwv_flow_imp.id(12869262510301474)
,p_name=>'Cash Requirement by Due Date'
,p_static_id=>'cash-forecast'
,p_template=>4502917002193490937
,p_display_sequence=>22
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The treasury strip: what the due dates demand, in bands that add up',
'   without double counting. Only payables that CARRY a due date can',
'   enter a due-date forecast - the uncovered share is stated in the',
'   last cell rather than silently pretended to be zero. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P718_TODATE,''DD-MM-RRRR'') D From dual),',
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
'              Case When v.ModuleCode = ''PBPASS''   Then pt.DueDt',
'                   When v.ModuleCode = ''JBPASS''   Then jt.DueDt',
'                   When v.VoucherNo  = ''OPENING''  Then ao.BillDueDate',
'              End DueDate',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join (Select pp.Tno Tno,',
'                           Max(pb.PurchaseBillDate)',
'                             + coalesce(Max(po.CreditDays), Max(pty.CreditDays)) DueDt',
'                      From PBPass pp',
'                      Join PurchaseBill pb On pb.Tno = pp.PurchaseBillTno',
'                      Left Join PurchaseBillDetail pbd On pbd.Tno = pb.Tno',
'                      Left Join PurchaseOrder po On po.Tno = pbd.PurchaseOrderTno',
'                      Left Join Party pty On pty.PartyCode = pb.PartyCode',
'                     Group By pp.Tno) pt On v.ModuleCode = ''PBPASS'' And pt.Tno = v.ModuleTno',
'         Left Join (Select jp.Tno Tno,',
'                           Max(jb.JobBillDate) + nvl(Max(jo.CreditDays),0) DueDt',
'                      From JBPass jp',
'                      Join JobBill jb On jb.Tno = jp.JobBillTno',
'                      Left Join JobOrder jo On jo.Tno = jb.JobOrderTno',
'                     Group By jp.Tno) jt On v.ModuleCode = ''JBPASS'' And jt.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING'' And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P718_PANEL    Is Null Or d.Panel        = :P718_PANEL)',
'          And (:P718_COMPANY  Is Null Or d.CompanyCode  = :P718_COMPANY)',
'          And (:P718_LOCATION Is Null Or d.LocationCode = :P718_LOCATION)),',
'     T As (',
'       Select nvl(Sum(Case When Pay > 0 Then Pay Else 0 End),0) Gross,',
'              nvl(Sum(Case When Pay > 0 And DueDate Is Not Null Then Pay Else 0 End),0) Covered,',
'              nvl(Sum(Case When Pay > 0 And DueDate <= Asof.D Then Pay Else 0 End),0) OverdueNow,',
'              nvl(Sum(Case When Pay > 0 And DueDate = Asof.D Then Pay Else 0 End),0) DueToday,',
'              nvl(Sum(Case When Pay > 0 And DueDate > Asof.D     And DueDate <= Asof.D + 7  Then Pay Else 0 End),0) D7,',
'              nvl(Sum(Case When Pay > 0 And DueDate > Asof.D + 7 And DueDate <= Asof.D + 15 Then Pay Else 0 End),0) D15,',
'              nvl(Sum(Case When Pay > 0 And DueDate > Asof.D + 15 And DueDate <= Asof.D + 30 Then Pay Else 0 End),0) D30,',
'              nvl(Sum(Case When Pay > 0 And DueDate > Asof.D + 30 And DueDate <= Asof.D + 60 Then Pay Else 0 End),0) D60,',
'              nvl(Sum(Case When Pay > 0 And DueDate > Asof.D + 60 And DueDate <= Asof.D + 90 Then Pay Else 0 End),0) D90',
'         From Oi Cross Join Asof)',
'Select ''<a class="ds-kpi ds-kpi--risk" href="''',
'    || apex_page.get_url(p_page => 710, p_clear_cache => ''710'',',
'         p_items => ''P710_FROMDATE,P710_TODATE,P710_COMPANY,P710_LOCATION,P710_PANEL,P710_AGEBASIS,P710_BUCKET'',',
'         p_values => :P718_FROMDATE ||'',''|| :P718_TODATE ||'',''|| :P718_COMPANY ||'',''|| :P718_LOCATION ||'',''|| :P718_PANEL ||'',DUE,DT'')',
'    || ''" title="Payable whose due date is exactly the As-of Date.">''',
'    || ''<span class="ds-kpi-ic fa fa-bell-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Due Today</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.DueToday >= 10000000 Then to_char(Round(t.DueToday/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.DueToday/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">'' || :P718_TODATE || ''</div></div></a>'' As F1,',
'       ''<a class="ds-kpi ds-kpi--amber" href="''',
'    || apex_page.get_url(p_page => 710, p_clear_cache => ''710'',',
'         p_items => ''P710_FROMDATE,P710_TODATE,P710_COMPANY,P710_LOCATION,P710_PANEL,P710_AGEBASIS,P710_BUCKET'',',
'         p_values => :P718_FROMDATE ||'',''|| :P718_TODATE ||'',''|| :P718_COMPANY ||'',''|| :P718_LOCATION ||'',''|| :P718_PANEL ||'',DUE,D7'')',
'    || ''" title="Payable falling due in the next seven days.">''',
'    || ''<span class="ds-kpi-ic fa fa-calendar-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Next 7 Days</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.D7 >= 10000000 Then to_char(Round(t.D7/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.D7/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">days 1&ndash;7</div></div></a>'' As F2,',
'       ''<a class="ds-kpi ds-kpi--gold" href="''',
'    || apex_page.get_url(p_page => 710, p_clear_cache => ''710'',',
'         p_items => ''P710_FROMDATE,P710_TODATE,P710_COMPANY,P710_LOCATION,P710_PANEL,P710_AGEBASIS,P710_BUCKET'',',
'         p_values => :P718_FROMDATE ||'',''|| :P718_TODATE ||'',''|| :P718_COMPANY ||'',''|| :P718_LOCATION ||'',''|| :P718_PANEL ||'',DUE,B815'')',
'    || ''" title="Payable falling due 8 to 15 days out.">''',
'    || ''<span class="ds-kpi-ic fa fa-calendar"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Days 8&ndash;15</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.D15 >= 10000000 Then to_char(Round(t.D15/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.D15/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">band, not cumulative</div></div></a>'' As F3,',
'       ''<a class="ds-kpi ds-kpi--teal" href="''',
'    || apex_page.get_url(p_page => 710, p_clear_cache => ''710'',',
'         p_items => ''P710_FROMDATE,P710_TODATE,P710_COMPANY,P710_LOCATION,P710_PANEL,P710_AGEBASIS,P710_BUCKET'',',
'         p_values => :P718_FROMDATE ||'',''|| :P718_TODATE ||'',''|| :P718_COMPANY ||'',''|| :P718_LOCATION ||'',''|| :P718_PANEL ||'',DUE,B1630'')',
'    || ''" title="Payable falling due 16 to 30 days out.">''',
'    || ''<span class="ds-kpi-ic fa fa-calendar"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Days 16&ndash;30</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.D30 >= 10000000 Then to_char(Round(t.D30/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.D30/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">band, not cumulative</div></div></a>'' As F4,',
'       ''<a class="ds-kpi ds-kpi--struct" href="''',
'    || apex_page.get_url(p_page => 710, p_clear_cache => ''710'',',
'         p_items => ''P710_FROMDATE,P710_TODATE,P710_COMPANY,P710_LOCATION,P710_PANEL,P710_AGEBASIS,P710_BUCKET'',',
'         p_values => :P718_FROMDATE ||'',''|| :P718_TODATE ||'',''|| :P718_COMPANY ||'',''|| :P718_LOCATION ||'',''|| :P718_PANEL ||'',DUE,B3160'')',
'    || ''" title="Payable falling due 31 to 60 days out.">''',
'    || ''<span class="ds-kpi-ic fa fa-calendar"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Days 31&ndash;60</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.D60 >= 10000000 Then to_char(Round(t.D60/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.D60/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">band, not cumulative</div></div></a>'' As F5,',
'       ''<a class="ds-kpi ds-kpi--violet" href="''',
'    || apex_page.get_url(p_page => 710, p_clear_cache => ''710'',',
'         p_items => ''P710_FROMDATE,P710_TODATE,P710_COMPANY,P710_LOCATION,P710_PANEL,P710_AGEBASIS,P710_BUCKET'',',
'         p_values => :P718_FROMDATE ||'',''|| :P718_TODATE ||'',''|| :P718_COMPANY ||'',''|| :P718_LOCATION ||'',''|| :P718_PANEL ||'',DUE,B6190'')',
'    || ''" title="Payable falling due 61 to 90 days out.">''',
'    || ''<span class="ds-kpi-ic fa fa-calendar"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Days 61&ndash;90</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.D90 >= 10000000 Then to_char(Round(t.D90/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.D90/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">band, not cumulative</div></div></a>'' As F6,',
'       ''<div class="ds-apexcl"><div class="ds-apexcl-h">What this forecast can and cannot see</div>''',
'    || ''<div class="ds-apexcl-b">Only payables carrying a due date can enter a due-date forecast: <b>&#8377;''',
'    || Case When t.Covered >= 10000000 Then to_char(Round(t.Covered/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Covered/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</b> of &#8377;''',
'    || Case When t.Gross >= 10000000 Then to_char(Round(t.Gross/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Gross/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || '' ('' || nvl(to_char(Round(100 * t.Covered / Nullif(t.Gross,0),1),''FM990D0''),''0'') || ''%). ''',
'    || ''Already overdue &#8377;''',
'    || Case When t.OverdueNow >= 10000000 Then to_char(Round(t.OverdueNow/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.OverdueNow/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || '' is payable now and sits in the ageing, not in these bands. The uncovered share is the Cannot Age bucket.</div></div>'' As F7',
'  From T t'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P718_FROMDATE,P718_TODATE,P718_COMPANY,P718_LOCATION,P718_PANEL'
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
 p_id=>wwv_flow_imp.id(12869306406301474)
,p_query_column_id=>1
,p_column_alias=>'F1'
,p_column_display_sequence=>10
,p_column_heading=>'F1'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12869469937301474)
,p_query_column_id=>2
,p_column_alias=>'F2'
,p_column_display_sequence=>20
,p_column_heading=>'F2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12869524952301474)
,p_query_column_id=>3
,p_column_alias=>'F3'
,p_column_display_sequence=>30
,p_column_heading=>'F3'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12869695961301474)
,p_query_column_id=>4
,p_column_alias=>'F4'
,p_column_display_sequence=>40
,p_column_heading=>'F4'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12869765006301474)
,p_query_column_id=>5
,p_column_alias=>'F5'
,p_column_display_sequence=>50
,p_column_heading=>'F5'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12869805096301474)
,p_query_column_id=>6
,p_column_alias=>'F6'
,p_column_display_sequence=>60
,p_column_heading=>'F6'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12869960012301474)
,p_query_column_id=>7
,p_column_alias=>'F7'
,p_column_display_sequence=>70
,p_column_heading=>'F7'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12870085103301475)
,p_plug_name=>'Cash Requirement'
,p_static_id=>'cash-forecast-rule'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>21
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Cash Requirement</h2>',
'  <p>What the due dates demand of treasury, in bands that add up &mdash; and what share of the book the forecast can actually see</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12870143575301475)
,p_name=>'AP Trends and Cash Forecast'
,p_static_id=>'command-header'
,p_template=>4502917002193490937
,p_display_sequence=>5
,p_region_css_classes=>'ds-ap-headregion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''<div class="ds-ap-head">''',
'    || ''<div class="ds-ap-eyebrow">Payables &middot; Trend</div>''',
'    || ''<h1 class="ds-ap-title">AP Trends and Cash Forecast</h1>''',
'    || ''<div class="ds-ap-sub">Outstanding, ageing mix, bookings against payments, payment application and the due-date cash forecast, each re-derived at every month end in the window</div>''',
'    || ''<div class="ds-ap-context">''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-calendar"></span>Window <b>''',
'       || :P718_FROMDATE || '' &rarr; '' || :P718_TODATE || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-crosshairs"></span>Each point is a <b>position at that month end</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P718_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P718_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-shield"></span>Panel <b>''',
'       || Case When (Select GetUserPanelAB_apex() From dual) Is Not Null',
'               Then (Select GetUserPanelAB_apex() From dual) || '' (enforced)''',
'               When :P718_PANEL Is Not Null Then :P718_PANEL Else ''A + B'' End || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P718_FROMDATE,P718_TODATE,P718_COMPANY,P718_LOCATION,P718_PANEL'
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
 p_id=>wwv_flow_imp.id(12870268657301475)
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
 p_id=>wwv_flow_imp.id(12870339138301475)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p718Filters'
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
 p_id=>wwv_flow_imp.id(12870426357301475)
,p_plug_name=>'Outstanding Trend'
,p_static_id=>'outstanding-trend'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* THE MONTH SPINE IS CROSS-JOINED INTO THE OPEN-ITEM LAYER.',
'   Summing period movements would give a running total, which is a',
'   different (and wrong) thing: it cannot show a bill that was open in',
'   June and settled in July as open in June. The cost is one pass over',
'   the AR grain per month end - about 9,700 lines x 6 months here,',
'   which is small enough to do honestly. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Spine As (',
'       Select Me From (',
'         Select Least(Last_Day(Add_Months(trunc(to_date(:P718_FROMDATE,''DD-MM-RRRR''),''MM''), Level - 1)),',
'                      to_date(:P718_TODATE,''DD-MM-RRRR'')) Me',
'           From dual',
'        Connect By Level <= Months_Between(trunc(to_date(:P718_TODATE,''DD-MM-RRRR''),''MM''),',
'                                           trunc(to_date(:P718_FROMDATE,''DD-MM-RRRR''),''MM'')) + 1)',
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
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P718_PANEL    Is Null Or d.Panel        = :P718_PANEL)',
'          And (:P718_COMPANY  Is Null Or d.CompanyCode  = :P718_COMPANY)',
'          And (:P718_LOCATION Is Null Or d.LocationCode = :P718_LOCATION)),',
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
'       Select s.Me, (l.Amt - nvl(al.Amt,0)) Pay,',
'              Case When l.DueDate Is Null Then Null',
'                   Else Greatest(s.Me - l.DueDate,0) End DaysOd',
'         From Ln l',
'         Join Spine s On l.Vdt <= s.Me',
'         Left Join Al al On al.Me = s.Me And al.Tno = l.Tno And al.Sno = l.Sno)',
'Select to_char(Me,''Mon-RR'')                                                       As LABEL,',
'       Round(Sum(Case When Pay > 0 Then Pay Else 0 End)/10000000,2)             As GROSS_CR,',
'       Round(Sum(Case When Pay > 0 And DaysOd > 0 Then Pay Else 0 End)/10000000,2) As OVERDUE_CR,',
'       Round(Sum(Case When Pay > 0 And DaysOd > 90 Then Pay Else 0 End)/10000000,2) As OVER90_CR,',
'       Round(Sum(Case When Pay < 0 Then -Pay Else 0 End)/10000000,2)            As CREDITS_CR,',
'       Round(Sum(Pay)/10000000,2)                                                As NET_CR',
'  From P Group By Me Order By Me'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P718_FROMDATE,P718_TODATE,P718_COMPANY,P718_LOCATION,P718_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12870564049301475)
,p_region_id=>wwv_flow_imp.id(12870426357301475)
,p_chart_type=>'line'
,p_height=>'360'
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
 p_id=>wwv_flow_imp.id(12870619205301475)
,p_chart_id=>wwv_flow_imp.id(12870564049301475)
,p_static_id=>'credits'
,p_seq=>40
,p_name=>unistr('Vendor Credits (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'line'
,p_items_value_column_name=>'CREDITS_CR'
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
 p_id=>wwv_flow_imp.id(12870769840301475)
,p_chart_id=>wwv_flow_imp.id(12870564049301475)
,p_static_id=>'gross'
,p_seq=>10
,p_name=>unistr('Gross Outstanding (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'line'
,p_items_value_column_name=>'GROSS_CR'
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
 p_id=>wwv_flow_imp.id(12870830653301475)
,p_chart_id=>wwv_flow_imp.id(12870564049301475)
,p_static_id=>'net'
,p_seq=>50
,p_name=>unistr('Net Exposure (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'line'
,p_items_value_column_name=>'NET_CR'
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
 p_id=>wwv_flow_imp.id(12870981971301475)
,p_chart_id=>wwv_flow_imp.id(12870564049301475)
,p_static_id=>'over90'
,p_seq=>30
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
 p_id=>wwv_flow_imp.id(12871066810301475)
,p_chart_id=>wwv_flow_imp.id(12870564049301475)
,p_static_id=>'overdue'
,p_seq=>20
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
 p_id=>wwv_flow_imp.id(12871173149301475)
,p_chart_id=>wwv_flow_imp.id(12870564049301475)
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
 p_id=>wwv_flow_imp.id(12871202873301475)
,p_chart_id=>wwv_flow_imp.id(12870564049301475)
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
 p_id=>wwv_flow_imp.id(12871365271301475)
,p_name=>'Go to'
,p_static_id=>'quick-links'
,p_template=>4502917002193490937
,p_display_sequence=>900
,p_region_css_classes=>'ds-kpiwrap ds-apnavwrap'
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
'  Select 708 Id, ''AP Command Centre''          Nm, ''Payable, due and overdue, payments, advances and the exceptions behind every number'' Sub, ''fa-dashboard''              Ic From dual Union All',
'  Select 709,    ''Vendor-wise Payable'',           ''One row per vendor, with ageing and the netting position'',             ''fa-users''                  From dual Union All',
'  Select 710,    ''Bill-wise Payable'',             ''Every open item at line level, with its source document'',              ''fa-list-alt''               From dual Union All',
'  Select 711,    ''Creditor 360'',                  ''One vendor from every angle - bills, payments, advances, statement'',   ''fa-user''                   From dual Union All',
'  Select 712,    ''Payments and Settlement'',       ''Cash actually paid, which bank paid it, how much is applied'',          ''fa-upload''                 From dual Union All',
'  Select 713,    ''Advances and Unapplied Payments'',''Money already with vendors, and the payable it could clear'',          ''fa-hand-o-up''              From dual Union All',
'  Select 714,    ''Unbilled Liability (GRNI)'',     ''Goods received, no supplier bill yet - tied to the GR/IR account'',     ''fa-truck''                  From dual Union All',
'  Select 715,    ''Exceptions and Controls'',       ''Every control, what it tests, and the records that fail it'',           ''fa-exclamation-triangle''   From dual Union All',
'  Select 716,    ''Reconciliation and Data Health'',''The open-item register against the general-ledger control account'',    ''fa-balance-scale''          From dual Union All',
'  Select 718,    ''Trends and Cash Forecast'',      ''How the position moved, and the cash the due dates demand'',            ''fa-line-chart''             From dual Union All',
'  Select 719,    ''Daily Payment MIS'',             ''One day: position, movement, dues and what remains unexplained'',       ''fa-calendar-o''             From dual Union All',
'  Select 720,    ''Weekly AP Review'',              ''Opening against closing, and the controls that failed in the week'',    ''fa-calendar''               From dual Union All',
'  Select 721,    ''Monthly Management MIS'',        ''The management pack, reconciled to the GL at the foot'',                ''fa-file-text-o''            From dual)',
'Select ''<a class="ds-kpi ds-kpi--link ds-kpi--teal" href="''',
'    || apex_page.get_url(',
'         p_page        => Pg.Id,',
'         p_clear_cache => to_char(Pg.Id),',
'         /* Page 700 is a single-day report and has no From/To pair -',
'            naming an item that does not exist on the target page',
'            fails at run time, so its filter list is built separately. */',
'         p_items  => Case When Pg.Id = 719',
'                          Then ''P719_DAY,P719_COMPANY,P719_LOCATION,P719_PANEL''',
'                          Else ''P''||Pg.Id||''_FROMDATE,P''||Pg.Id||''_TODATE,P''',
'                               ||Pg.Id||''_COMPANY,P''||Pg.Id||''_LOCATION,P''||Pg.Id||''_PANEL'' End,',
'         p_values => Case When Pg.Id = 719',
'                          Then :P718_TODATE ||'',''|| :P718_COMPANY ||'',''|| :P718_LOCATION ||'',''|| :P718_PANEL',
'                          Else :P718_FROMDATE ||'',''|| :P718_TODATE ||'',''|| :P718_COMPANY ||'',''|| :P718_LOCATION ||'',''|| :P718_PANEL End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 718',
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
'          Where b.PageID Between 708 And 721',
'            And b.PageID <> 699',
'            And (upper(c.BossUserName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)',
'                 Or upper(c.LoginName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)))'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P718_FROMDATE,P718_TODATE,P718_COMPANY,P718_LOCATION,P718_PANEL'
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
 p_id=>wwv_flow_imp.id(12871427590301476)
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
 p_id=>wwv_flow_imp.id(12871518852301476)
,p_plug_name=>'Payment Application'
,p_static_id=>'receipt-application'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>52
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Of the cash paid in each month, how much has since been applied to a',
'   bill and how much is still unapplied. Applied is measured as at',
'   TODAY, not as at the month end - the question this answers is "has',
'   this payment been matched yet", which is a current-state question.',
'   A payment line is a DEBIT: allocations sit on the Dr side. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Alc As (',
'       Select a.DrVoucherTno Tno, a.DrVoucherSno Sno, Sum(a.Amount) Amt',
'         From DrCrAllocation a, Voucher dv, Voucher cv',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'        Group By a.DrVoucherTno, a.DrVoucherSno),',
'     R As (',
'       Select trunc(d.VoucherDate,''MM'') Mth, -d.Amount Amt, nvl(al.Amt,0) Applied',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Alc al On al.Tno = d.Tno And al.Sno = d.Sno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'          And d.Amount < 0',
'          And d.VoucherDate >= to_date(:P718_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P718_TODATE,''DD-MM-RRRR'') + 1',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P718_PANEL    Is Null Or d.Panel        = :P718_PANEL)',
'          And (:P718_COMPANY  Is Null Or d.CompanyCode  = :P718_COMPANY)',
'          And (:P718_LOCATION Is Null Or d.LocationCode = :P718_LOCATION))',
'Select to_char(Mth,''Mon-RR'')                            As LABEL,',
'       Round(Sum(Applied)/10000000,2)                   As APPLIED_CR,',
'       Round(Sum(Amt - Applied)/10000000,2)             As UNAPPLIED_CR',
'  From R Group By Mth Order By Mth'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P718_FROMDATE,P718_TODATE,P718_COMPANY,P718_LOCATION,P718_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12871695303301476)
,p_region_id=>wwv_flow_imp.id(12871518852301476)
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
,p_no_data_found_message=>'No payment was posted in this window.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12871761624301476)
,p_chart_id=>wwv_flow_imp.id(12871695303301476)
,p_static_id=>'applied'
,p_seq=>10
,p_name=>unistr('Applied to a bill (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'APPLIED_CR'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12871839683301476)
,p_chart_id=>wwv_flow_imp.id(12871695303301476)
,p_static_id=>'unapplied'
,p_seq=>20
,p_name=>unistr('Still on account (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'UNAPPLIED_CR'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12871968992301476)
,p_chart_id=>wwv_flow_imp.id(12871695303301476)
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
 p_id=>wwv_flow_imp.id(12872027600301476)
,p_chart_id=>wwv_flow_imp.id(12871695303301476)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('Payments (\20B9 Cr)')
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12872625409301505)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12870339138301475)
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
 p_id=>wwv_flow_imp.id(12872790325301505)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12870339138301475)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:708:&SESSION.::&DEBUG.::P708_FROMDATE,P708_TODATE,P708_COMPANY,P708_LOCATION,P708_PANEL:&P718_FROMDATE.,&P718_TODATE.,&P718_COMPANY.,&P718_LOCATION.,&P718_PANEL.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12872124769301476)
,p_name=>'P718_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12870339138301475)
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
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12872244151301476)
,p_name=>'P718_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12870339138301475)
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
 p_id=>wwv_flow_imp.id(12872312370301476)
,p_name=>'P718_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12870339138301475)
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
'                  And (:P718_COMPANY Is Null Or v.CompanyCode = :P718_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P718_COMPANY'
,p_ajax_items_to_submit=>'P718_COMPANY'
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
 p_id=>wwv_flow_imp.id(12872464890301476)
,p_name=>'P718_PANEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12870339138301475)
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
 p_id=>wwv_flow_imp.id(12872534680301476)
,p_name=>'P718_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12870339138301475)
,p_item_default=>'Select to_char(trunc(sysdate),''DD-MM-RRRR'') From dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date'
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
