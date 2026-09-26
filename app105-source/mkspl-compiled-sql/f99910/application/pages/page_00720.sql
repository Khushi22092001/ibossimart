prompt --application/pages/page_00720
begin
--   Manifest
--     PAGE: 00720
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
 p_id=>720
,p_name=>'Weekly AP Review'
,p_alias=>'AP-WEEKLY-MIS'
,p_step_title=>'Weekly AP Review'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(9965433630286257)
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'The weekly review pack. Position lines are measured at the START and END of the window and compared, so "movement" is a real change in position rather than a sum of transactions. Payment performance is measured as payments made against payables that '
||'were open at the start of the window - not against bookings in the window, which would flatter a light week. Every figure derives from the canonical open-item layer, so this pack and the command centre cannot disagree.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12877172275301508)
,p_name=>'Weekly AP Review'
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
'    || ''<div class="ds-ap-eyebrow">Payables &middot; Weekly MIS</div>''',
'    || ''<h1 class="ds-ap-title">Weekly AP Review</h1>''',
'    || ''<div class="ds-ap-sub">Opening and closing position, what moved between them, who owes most and which controls failed</div>''',
'    || ''<div class="ds-ap-context">''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-calendar"></span>Window <b>''',
'       || :P720_FROMDATE || '' &rarr; '' || :P720_TODATE || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P720_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P720_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-shield"></span>Panel <b>''',
'       || Case When (Select GetUserPanelAB_apex() From dual) Is Not Null',
'               Then (Select GetUserPanelAB_apex() From dual) || '' (enforced)''',
'               When :P720_PANEL Is Not Null Then :P720_PANEL Else ''A + B'' End || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P720_FROMDATE,P720_TODATE,P720_COMPANY,P720_LOCATION,P720_PANEL'
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
 p_id=>wwv_flow_imp.id(12877210849301508)
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
 p_id=>wwv_flow_imp.id(12877350192301508)
,p_name=>'Control Failures'
,p_static_id=>'control-failures'
,p_template=>4073835273271169698
,p_display_sequence=>40
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The same control predicates as page 715, evaluated at the window end.',
'   Only controls that actually fired are listed; the full matrix with',
'   its PASS and DATA MISSING rows lives on 696. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P720_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Select d.Panel Pnl, d.LocationCode Loc, d.VoucherDate Vdt,',
'              v.VoucherNo Vno, v.DocTypeCode Dtc,',
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
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P720_PANEL    Is Null Or d.Panel        = :P720_PANEL)',
'          And (:P720_COMPANY  Is Null Or d.CompanyCode  = :P720_COMPANY)',
'          And (:P720_LOCATION Is Null Or d.LocationCode = :P720_LOCATION))',
'Select Code, Nm, Items, Round(Expo,2) Expo, Sev From (',
'  Select ''AP-B02'' Code,''Open payable that cannot be aged'' Nm,''High'' Sev,',
'         Count(*) Items, Sum(Abs(Pay)) Expo',
'    From Oi Where Pay > 0.005 And DueDate Is Null Having Count(*) > 0',
'  Union All Select ''AP-P03'',''Payment cash unapplied over 90 days'',''Critical'', Count(*), Sum(-Pay)',
'    From Oi Cross Join Asof Where Dtc In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'') And Pay < -0.005 And Asof.D - Vdt > 90 Having Count(*) > 0',
'  Union All Select ''AP-O01'',''Opening item, original bill date lost'',''High'', Count(*), Sum(Abs(Pay))',
'    From Oi Where Vno=''OPENING'' And AoBillDate Is Null And Abs(Pay) > 0.005 Having Count(*) > 0',
'  Union All Select ''AP-M01'',''AP posted with no Panel'',''Critical'', Count(*), Sum(Abs(Pay))',
'    From Oi Where Pnl Is Null Having Count(*) > 0',
'  Union All Select ''AP-M02'',''AR on a location marked DO NOT USE'',''High'', Count(*), Sum(Abs(o.Pay))',
'    From Oi o Join Location l On l.LocationCode = o.Loc',
'   Where upper(l.LocationName) Like ''%DO NOT USE%'' And Abs(o.Pay) > 0.005 Having Count(*) > 0',
'  Union All Select ''AP-A05'',''Orphan allocation (voucher deleted)'',''Critical'', Count(*), Sum(a.Amount)',
'    From DrCrAllocation a',
'   Where Not Exists (Select 1 From Voucher v Where v.Tno = a.DrVoucherTno)',
'      Or Not Exists (Select 1 From Voucher v Where v.Tno = a.CrVoucherTno)',
'  Having Count(*) > 0',
') Order By Case Sev When ''Critical'' Then 1 Else 2 End, Code'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P720_TODATE,P720_COMPANY,P720_LOCATION,P720_PANEL'
,p_lazy_loading=>true
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No control failed in this scope at the window end.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12877470711301508)
,p_query_column_id=>1
,p_column_alias=>'CODE'
,p_column_display_sequence=>10
,p_column_heading=>'Control'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12877515394301508)
,p_query_column_id=>4
,p_column_alias=>'EXPO'
,p_column_display_sequence=>40
,p_column_heading=>unistr('Exposure (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12877664549301508)
,p_query_column_id=>3
,p_column_alias=>'ITEMS'
,p_column_display_sequence=>30
,p_column_heading=>'Items'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12877788954301508)
,p_query_column_id=>2
,p_column_alias=>'NM'
,p_column_display_sequence=>20
,p_column_heading=>'Exception'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12877819661301508)
,p_query_column_id=>5
,p_column_alias=>'SEV'
,p_column_display_sequence=>50
,p_column_heading=>'Severity'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12877989868301508)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p720Filters'
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12878082521301536)
,p_name=>'Position and Movement'
,p_static_id=>'position'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Two positions, one statement. The open-item layer is evaluated at the',
'   window start and the window end in a single pass by cross-joining a',
'   two-row date spine - so both columns see one snapshot and Movement is',
'   a genuine difference of positions, not a sum of transactions. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Sp As (',
'       Select to_date(:P720_FROMDATE,''DD-MM-RRRR'') - 1 D, ''O'' Tag From dual',
'       Union All',
'       Select to_date(:P720_TODATE,''DD-MM-RRRR''), ''C'' From dual),',
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
'          And (:P720_PANEL    Is Null Or d.Panel        = :P720_PANEL)',
'          And (:P720_COMPANY  Is Null Or d.CompanyCode  = :P720_COMPANY)',
'          And (:P720_LOCATION Is Null Or d.LocationCode = :P720_LOCATION)),',
'     AlSp As (',
'       Select s.Tag, a.DrVoucherTno Tno, a.DrVoucherSno Sno, -Sum(a.Amount) Amt',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Sp s',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= s.D And cv.VoucherDate <= s.D',
'        Group By s.Tag, a.DrVoucherTno, a.DrVoucherSno',
'       Union All',
'       Select s.Tag, a.CrVoucherTno, a.CrVoucherSno, Sum(a.Amount)',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Sp s',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= s.D And cv.VoucherDate <= s.D',
'        Group By s.Tag, a.CrVoucherTno, a.CrVoucherSno),',
'     Al As (Select Tag, Tno, Sno, Sum(Amt) Amt From AlSp Group By Tag, Tno, Sno),',
'     P As (',
'       Select s.Tag, (l.Amt - nvl(al.Amt,0)) Pay,',
'              Case When l.DueDate Is Null Then Null Else Greatest(s.D - l.DueDate,0) End DaysOd,',
'              l.DueDate',
'         From Ln l',
'         Join Sp s On l.Vdt <= s.D',
'         Left Join Al al On al.Tag = s.Tag And al.Tno = l.Tno And al.Sno = l.Sno),',
'     T As (',
'       Select Sum(Case When Tag=''O'' And Pay>0 Then Pay Else 0 End) OGross,',
'              Sum(Case When Tag=''C'' And Pay>0 Then Pay Else 0 End) CGross,',
'              Sum(Case When Tag=''O'' And Pay>0 And DaysOd>0 Then Pay Else 0 End) OOd,',
'              Sum(Case When Tag=''C'' And Pay>0 And DaysOd>0 Then Pay Else 0 End) COd,',
'              Sum(Case When Tag=''O'' And Pay>0 And DaysOd>90 Then Pay Else 0 End) O90,',
'              Sum(Case When Tag=''C'' And Pay>0 And DaysOd>90 Then Pay Else 0 End) C90,',
'              Sum(Case When Tag=''O'' And Pay>0 And DaysOd>180 Then Pay Else 0 End) O180,',
'              Sum(Case When Tag=''C'' And Pay>0 And DaysOd>180 Then Pay Else 0 End) C180,',
'              Sum(Case When Tag=''O'' And Pay>0 And DueDate Is Null Then Pay Else 0 End) ONoAge,',
'              Sum(Case When Tag=''C'' And Pay>0 And DueDate Is Null Then Pay Else 0 End) CNoAge,',
'              Sum(Case When Tag=''O'' And Pay<0 Then -Pay Else 0 End) OCred,',
'              Sum(Case When Tag=''C'' And Pay<0 Then -Pay Else 0 End) CCred,',
'              Sum(Case When Tag=''O'' Then Pay Else 0 End) ONet,',
'              Sum(Case When Tag=''C'' Then Pay Else 0 End) CNet',
'         From P),',
'     F As (',
'       Select nvl(Sum(Case When d.Amount>0',
'                            And (v.ModuleCode In (''PBPASS'',''JBPASS'',''FREIGHTADVICE'',''CASHPURCHASE'',',
'                                                  ''NECESSITYCOMPLETION'',''NECESSITYSLIP'',''EXTERNALSERVICESENTRY'')',
'                                 Or v.DocTypeCode=''SERVICEBILL'')',
'                           Then d.Amount Else 0 End),0) Billing,',
'              nvl(Sum(Case When v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'') And d.Amount<0',
'                           Then -d.Amount Else 0 End),0) Coll,',
'              nvl(Sum(Case When v.DocTypeCode=''DEBITNOTE'' And d.Amount<0 Then -d.Amount Else 0 End),0) CN',
'         From VoucherDetail d Join Voucher v On v.Tno=d.Tno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate >= to_date(:P720_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P720_TODATE,''DD-MM-RRRR'') + 1',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P720_PANEL    Is Null Or d.Panel        = :P720_PANEL)',
'          And (:P720_COMPANY  Is Null Or d.CompanyCode  = :P720_COMPANY)',
'          And (:P720_LOCATION Is Null Or d.LocationCode = :P720_LOCATION))',
'Select Ord, Measure, Opening, Closing, Movement, Note From (',
'  Select 10 Ord,''Gross Outstanding Payable'' Measure, Round(t.OGross,2) Opening, Round(t.CGross,2) Closing,',
'         Round(t.CGross-t.OGross,2) Movement, ''open credit items'' Note From T t',
'  Union All Select 20,''Total Overdue'', Round(t.OOd,2), Round(t.COd,2), Round(t.COd-t.OOd,2),',
'         ''past due date'' From T t',
'  Union All Select 30,''90+ Days'', Round(t.O90,2), Round(t.C90,2), Round(t.C90-t.O90,2),',
'         ''over 90 days past due'' From T t',
'  Union All Select 40,''180+ Days'', Round(t.O180,2), Round(t.C180,2), Round(t.C180-t.O180,2),',
'         ''over 180 days past due'' From T t',
'  Union All Select 50,''Cannot Age (no due date)'', Round(t.ONoAge,2), Round(t.CNoAge,2),',
'         Round(t.CNoAge-t.ONoAge,2), ''no due date on the source document'' From T t',
'  Union All Select 60,''Vendor Debits Held'', Round(t.OCred,2), Round(t.CCred,2),',
'         Round(t.CCred-t.OCred,2), ''advances, unapplied payments and contra sales'' From T t',
'  Union All Select 70,''Net Vendor Liability'', Round(t.ONet,2), Round(t.CNet,2),',
'         Round(t.CNet-t.ONet,2), ''gross less debits - ties to the GL control account'' From T t',
'  Union All Select 80,''Bills booked in the window'', To_Number(Null), To_Number(Null), Round(f.Billing,2),',
'         ''bill-class credits (purchase, job, freight, cash, necessity, service) - a flow, not a position'' From F f',
'  Union All Select 90,''Payments in the window'', To_Number(Null), To_Number(Null), Round(f.Coll,2),',
'         ''actual payment transactions, all channels'' From F f',
'  Union All Select 100,''Debit notes in the window'', To_Number(Null), To_Number(Null), Round(f.CN,2),',
'         ''DEBITNOTE debits'' From F f',
'  Union All Select 110,''Payments against opening payable'',',
'         To_Number(Null), To_Number(Null),',
'         Round(Case When t.OGross > 0 Then 100 * f.Coll / t.OGross End,1),',
'         ''payments as a % of what was open at the start - not of bookings, which would flatter a light week''',
'    From T t Cross Join F f',
') Order By Ord'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P720_FROMDATE,P720_TODATE,P720_COMPANY,P720_LOCATION,P720_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No payable position in this window for the selected scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12878123519301536)
,p_query_column_id=>4
,p_column_alias=>'CLOSING'
,p_column_display_sequence=>40
,p_column_heading=>unistr('Closing (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12878244462301536)
,p_query_column_id=>2
,p_column_alias=>'MEASURE'
,p_column_display_sequence=>20
,p_column_heading=>'Measure'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12878300655301536)
,p_query_column_id=>5
,p_column_alias=>'MOVEMENT'
,p_column_display_sequence=>50
,p_column_heading=>unistr('Movement (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12878409686301536)
,p_query_column_id=>6
,p_column_alias=>'NOTE'
,p_column_display_sequence=>60
,p_column_heading=>'Basis'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12878553997301536)
,p_query_column_id=>3
,p_column_alias=>'OPENING'
,p_column_display_sequence=>30
,p_column_heading=>unistr('Opening (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12878697543301536)
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
 p_id=>wwv_flow_imp.id(12878711919301537)
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
'                          Then :P720_TODATE ||'',''|| :P720_COMPANY ||'',''|| :P720_LOCATION ||'',''|| :P720_PANEL',
'                          Else :P720_FROMDATE ||'',''|| :P720_TODATE ||'',''|| :P720_COMPANY ||'',''|| :P720_LOCATION ||'',''|| :P720_PANEL End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 720',
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
'            And b.PageID <> 701',
'            And (upper(c.BossUserName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)',
'                 Or upper(c.LoginName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)))'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P720_FROMDATE,P720_TODATE,P720_COMPANY,P720_LOCATION,P720_PANEL'
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
 p_id=>wwv_flow_imp.id(12878823745301537)
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
 p_id=>wwv_flow_imp.id(12878929450301537)
,p_plug_name=>'Actions'
,p_static_id=>'rule-actions'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>28
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Where to Act</h2>',
'  <p>The twenty largest exposures, and the controls that failed this week</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12879022720301537)
,p_name=>'Largest Exposures'
,p_static_id=>'top-vendors'
,p_template=>4073835273271169698
,p_display_sequence=>30
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Top 20, and the cap is in the heading. Adjustable Now is carried',
'   alongside the exposure because for many of these vendors the fastest',
'   reduction is an allocation, not a phone call. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P720_TODATE,''DD-MM-RRRR'') D From dual),',
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
'     Rc As (',
'       Select d.AccountCode Pty, Sum(-d.Amount) Amt',
'         From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'          And d.Amount < 0',
'          And d.VoucherDate >= to_date(:P720_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P720_TODATE,''DD-MM-RRRR'') + 1',
'        Group By d.AccountCode),',
'     G As (',
'       Select d.AccountCode Pty,',
'              Sum(Case When (d.Amount-nvl(al.Amt,0))>0 Then (d.Amount-nvl(al.Amt,0)) Else 0 End) Gross,',
'              Sum(Case When (d.Amount-nvl(al.Amt,0))<0 Then -(d.Amount-nvl(al.Amt,0)) Else 0 End) Cred,',
'              Sum(Case When (d.Amount-nvl(al.Amt,0))>0',
'                        And coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) < (Select D From Asof)',
'                       Then (d.Amount-nvl(al.Amt,0)) Else 0 End) Overdue',
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
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P720_PANEL    Is Null Or d.Panel        = :P720_PANEL)',
'          And (:P720_COMPANY  Is Null Or d.CompanyCode  = :P720_COMPANY)',
'          And (:P720_LOCATION Is Null Or d.LocationCode = :P720_LOCATION)',
'        Group By d.AccountCode)',
'Select * From (',
'  Select apex_escape.html(nvl(p.PartyName, g.Pty)) As CUSTOMER,',
'         g.Pty                                     As PARTY_CODE,',
'         Round(g.Gross,2)                          As GROSS,',
'         Round(g.Overdue,2)                        As OVERDUE,',
'         Round(g.Cred,2)                           As CREDIT_HELD,',
'         Round(g.Gross-g.Cred,2)                   As NET_EXPOSURE,',
'         Round(Least(g.Gross,g.Cred),2)            As ADJUSTABLE_NOW,',
'         Round(nvl(rc.Amt,0),2)                    As COLLECTED_THIS_WEEK',
'    From G g',
'    Left Join Party p On p.PartyCode = g.Pty',
'    Left Join Rc rc On rc.Pty = g.Pty',
'   Where g.Gross > 0.005',
'   Order By g.Gross - g.Cred Desc)',
' Where rownum <= 20'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P720_FROMDATE,P720_TODATE,P720_COMPANY,P720_LOCATION,P720_PANEL'
,p_lazy_loading=>true
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No vendor carries an open payable in this scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12879163237301537)
,p_query_column_id=>7
,p_column_alias=>'ADJUSTABLE_NOW'
,p_column_display_sequence=>70
,p_column_heading=>unistr('Adjustable Now (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12879282450301537)
,p_query_column_id=>8
,p_column_alias=>'COLLECTED_THIS_WEEK'
,p_column_display_sequence=>80
,p_column_heading=>unistr('Collected in Window (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12879324580301537)
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
 p_id=>wwv_flow_imp.id(12879451045301537)
,p_query_column_id=>1
,p_column_alias=>'CUSTOMER'
,p_column_display_sequence=>10
,p_column_heading=>'Vendor (top 20 by net exposure)'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12879559834301537)
,p_query_column_id=>3
,p_column_alias=>'GROSS'
,p_column_display_sequence=>30
,p_column_heading=>unistr('Gross (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12879674033301538)
,p_query_column_id=>6
,p_column_alias=>'NET_EXPOSURE'
,p_column_display_sequence=>60
,p_column_heading=>unistr('Net Exposure (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12879703571301538)
,p_query_column_id=>4
,p_column_alias=>'OVERDUE'
,p_column_display_sequence=>40
,p_column_heading=>unistr('Overdue (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12879815253301538)
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
 p_id=>wwv_flow_imp.id(12880456844301538)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12877989868301508)
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
 p_id=>wwv_flow_imp.id(12880558182301538)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12877989868301508)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:708:&SESSION.::&DEBUG.::P708_FROMDATE,P708_TODATE,P708_COMPANY,P708_LOCATION,P708_PANEL:&P720_FROMDATE.,&P720_TODATE.,&P720_COMPANY.,&P720_LOCATION.,&P720_PANEL.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12879990450301538)
,p_name=>'P720_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12877989868301508)
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
 p_id=>wwv_flow_imp.id(12880020351301538)
,p_name=>'P720_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12877989868301508)
,p_item_default=>'Select to_char(trunc(sysdate) - 6,''DD-MM-RRRR'') From dual'
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
 p_id=>wwv_flow_imp.id(12880115250301538)
,p_name=>'P720_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12877989868301508)
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
'                  And (:P720_COMPANY Is Null Or v.CompanyCode = :P720_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P720_COMPANY'
,p_ajax_items_to_submit=>'P720_COMPANY'
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
 p_id=>wwv_flow_imp.id(12880238336301538)
,p_name=>'P720_PANEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12877989868301508)
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
 p_id=>wwv_flow_imp.id(12880347738301538)
,p_name=>'P720_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12877989868301508)
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
