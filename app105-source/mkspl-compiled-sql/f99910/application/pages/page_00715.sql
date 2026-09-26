prompt --application/pages/page_00715
begin
--   Manifest
--     PAGE: 00715
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
 p_id=>715
,p_name=>'AP Exceptions and Controls'
,p_alias=>'AP-EXCEPTIONS-CONTROLS'
,p_step_title=>'AP Exceptions and Controls'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(9965433630286257)
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'A control matrix for the Finance Controller and Internal Audit, not a developer debugging page. THE COUNT AND THE DRILL-DOWN CANNOT DISAGREE - both are produced from one Ex CTE, so the matrix is literally a GROUP BY over the same rows the detail repo'
||'rt lists. A control with no findings is reported as PASS with its scope stated; a control whose input data does not exist is reported as DATA MISSING and is never counted as a pass, because absence of information is not evidence of correctness. Only '
||'controls the schema can validate deterministically are implemented - see docs/ap-dashboard/AP_EXCEPTIONS_CONTROL_MATRIX.md for the ones that were rejected and why.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12853036864301385)
,p_name=>'AP Exceptions and Controls'
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
'    || ''<div class="ds-ap-eyebrow">Payables &middot; Control and Assurance</div>''',
'    || ''<h1 class="ds-ap-title">AR Exceptions &amp; Controls</h1>''',
'    || ''<div class="ds-ap-sub">Every control is executed against live data. Each row states its result, its exposure and the exact records behind it.</div>''',
'    || ''<div class="ds-ap-context">''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-crosshairs"></span>Tested as at <b>'' || :P715_TODATE || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P715_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P715_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-shield"></span>Panel <b>''',
'       || Case When (Select GetUserPanelAB_apex() From dual) Is Not Null',
'               Then (Select GetUserPanelAB_apex() From dual) || '' (enforced)''',
'               When :P715_PANEL Is Not Null Then :P715_PANEL Else ''A + B'' End || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P715_FROMDATE,P715_TODATE,P715_COMPANY,P715_LOCATION,P715_PANEL,P715_CONTROL'
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
 p_id=>wwv_flow_imp.id(12853172887301385)
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
 p_id=>wwv_flow_imp.id(12853214919301385)
,p_plug_name=>'Affected Records'
,p_static_id=>'detail'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
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
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P715_TODATE,''DD-MM-RRRR'') D From dual),',
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
'              d.LocationCode Loc, d.Panel Pnl, d.VoucherDate Vdt,',
'              v.VoucherNo Vno, v.DocTypeCode Dtc, v.ModuleCode Mc,',
'              d.Amount Amt, (d.Amount - nvl(al.Amt,0)) Pay,',
'              coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) DueDate,',
'              coalesce(pt.Pbn, ao.BillNo, v.VoucherNo) BillRef,',
'              ao.BillDate AoBillDate, ao.BillDueDate AoBillDue',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join (Select pp.Tno Tno,',
'                           Max(pb.PartyBillNo) Pbn,',
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
'          And (:P715_PANEL    Is Null Or d.Panel        = :P715_PANEL)',
'          And (:P715_COMPANY  Is Null Or d.CompanyCode  = :P715_COMPANY)',
'          And (:P715_LOCATION Is Null Or d.LocationCode = :P715_LOCATION)),',
'     Ex As (',
'       Select ''AP-B02'' Code, o.Tno, o.Pty, o.Cmp, o.Loc, o.Pnl, o.Vno, o.BillRef Ref,',
'              o.Vdt Dt, Abs(o.Amt) Amt, Abs(o.Pay) Expo,',
'              ''a due date'' Expected, ''none on the source document'' Actual,',
'              ''Source '' || nvl(o.Mc, o.Dtc) || '' carries no due date; ERP holds no credit terms to derive one'' Reason',
'         From Oi o Where o.Pay > 0.005 And o.DueDate Is Null',
'       Union All',
'       Select ''AP-A05'', a.DrVoucherTno, a.AccountCode, Null, Null, a.Panel,',
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
'       Select ''AP-A07'', d.Tno, d.AccountCode, d.CompanyCode, d.LocationCode, d.Panel,',
'              ''line '' || d.Tno || ''/'' || d.Sno, ''-'', d.VoucherDate,',
'              Abs(d.Amount), Abs(al.Amt) - Abs(d.Amount),',
'              ''allocation <= '' || to_char(Round(Abs(d.Amount),2)),',
'              to_char(Round(Abs(al.Amt),2)),',
'              ''Allocated more than the line is worth; the balance has flipped sign.''',
'         From VoucherDetail d Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And Abs(al.Amt) > Abs(d.Amount) + 0.005',
'       Union All',
'       Select ''AP-A08'', a.DrVoucherTno, dd.AccountCode, dd.CompanyCode, dd.LocationCode, dd.Panel,',
'              ''Dr '' || dd.LocationCode || '' / Cr '' || cd.LocationCode, nvl(a.ModuleCode,''-''),',
'              dd.VoucherDate, a.Amount, a.Amount,',
'              ''same location on both sides'', dd.LocationCode || '' vs '' || cd.LocationCode,',
'              ''Payment made at a different location from the one that raised the bill. Legitimate; reported for visibility.''',
'         From DrCrAllocation a',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'        Where dd.LocationCode <> cd.LocationCode',
'          And (dd.AccountCode In (Select PartyCode From Sd)',
'            Or cd.AccountCode In (Select PartyCode From Sd))',
'       Union All',
'       /* AP-A11 exists on the AP side and not on the AR side: measured',
'          17-08-2026, 15 allocations cross a panel here and 0 do on the',
'          receivables ledger. It matters because a panel-locked login',
'          sees a reconciliation residual (net Rs 11.82 L, equal and',
'          opposite between A and B) that vanishes when both panels are',
'          read together. Informational, not a defect. */',
'       Select ''AP-A11'', a.DrVoucherTno, dd.AccountCode, dd.CompanyCode, dd.LocationCode, dd.Panel,',
'              ''Dr panel '' || dd.Panel || '' / Cr panel '' || cd.Panel, nvl(a.ModuleCode,''-''),',
'              dd.VoucherDate, a.Amount, a.Amount,',
'              ''same panel on both sides'', dd.Panel || '' vs '' || cd.Panel,',
'              ''Payment raised under one panel settles a bill under the other. The panel-level reconciliation carries this as a residual until both panels are read together.''',
'         From DrCrAllocation a',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'        Where dd.Panel <> cd.Panel',
'          And (dd.AccountCode In (Select PartyCode From Sd)',
'            Or cd.AccountCode In (Select PartyCode From Sd))',
'       Union All',
'       Select ''AP-A09'', a.DrVoucherTno, dd.AccountCode, dd.CompanyCode, dd.LocationCode, dd.Panel,',
'              ''Dr co '' || dd.CompanyCode || '' / Cr co '' || cd.CompanyCode, nvl(a.ModuleCode,''-''),',
'              dd.VoucherDate, a.Amount, a.Amount,',
'              ''same company on both sides'', dd.CompanyCode || '' vs '' || cd.CompanyCode,',
'              ''Allocation crosses a company boundary and would break company-level payables.''',
'         From DrCrAllocation a',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'        Where dd.CompanyCode <> cd.CompanyCode',
'          And (dd.AccountCode In (Select PartyCode From Sd)',
'            Or cd.AccountCode In (Select PartyCode From Sd))',
'       Union All',
'       Select ''AP-B05'', Min(pb.Tno), pb.PartyCode, Min(pb.CompanyCode), Min(pb.LocationCode), Min(pb.Panel),',
'              Min(pb.PartyBillNo), ''PURCHASEBILL'', Min(pb.PartyBillDate), Sum(nvl(pb.PurchaseBillAmount,0)), 0,',
'              ''one bill per supplier bill number'', to_char(Count(*)) || '' bills booked'',',
'              ''The same supplier bill number was booked '' || Count(*) || '' times for this vendor.''',
'         From PurchaseBill pb Where pb.PartyBillNo Is Not Null',
'        Group By pb.PartyCode, upper(trim(pb.PartyBillNo)) Having Count(*) > 1',
'       Union All',
'       Select ''AP-B06'', pb.Tno, pb.PartyCode, pb.CompanyCode, pb.LocationCode, pb.Panel,',
'              pb.PartyBillNo, ''PURCHASEBILL'', pb.PartyBillDate, 0, 0,',
'              ''a non-zero amount'', ''zero or null'',',
'              ''Purchase bill carries no value.''',
'         From PurchaseBill pb Where nvl(pb.PurchaseBillAmount,0) = 0',
'       Union All',
'       Select ''AP-O01'', o.Tno, o.Pty, o.Cmp, o.Loc, o.Pnl, o.BillRef, ''ACCOUNTOPENING'',',
'              o.Vdt, Abs(o.Amt), Abs(o.Pay),',
'              ''original bill date'', ''not preserved at migration'',',
'              ''Aged from the 31-03-2026 cutover instead of its true bill date, so its age is understated.''',
'         From Oi o Where o.Vno = ''OPENING'' And o.AoBillDate Is Null And Abs(o.Pay) > 0.005',
'       Union All',
'       Select ''AP-O02'', o.Tno, o.Pty, o.Cmp, o.Loc, o.Pnl, o.BillRef, ''ACCOUNTOPENING'',',
'              o.Vdt, Abs(o.Amt), Abs(o.Pay),',
'              ''original due date'', ''not preserved at migration'',',
'              ''Can never be aged on the Due Date basis; falls into Cannot Age.''',
'         From Oi o Where o.Vno = ''OPENING'' And o.AoBillDue Is Null And o.Pay > 0.005',
'       Union All',
'       Select ''AP-P03'', o.Tno, o.Pty, o.Cmp, o.Loc, o.Pnl, o.Vno, nvl(o.Mc,o.Dtc),',
'              o.Vdt, Abs(o.Amt), -o.Pay,',
'              ''allocated within 90 days'',',
'              to_char((Select D From Asof) - o.Vdt) || '' days unapplied'',',
'              ''Cash paid and never applied to a bill. Overstates both gross payable and vendor debits, and makes the vendor look unpaid when they are not.''',
'         From Oi o Cross Join Asof',
'        Where o.Dtc In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'') And o.Pay < -0.005 And Asof.D - o.Vdt > 90',
'       Union All',
'       /* AP-B01: bill passes approved in the ERP that never reached the',
'          ledger - the GL understates liability by exactly these. */',
'       Select ''AP-B01'', p.Tno, pb.PartyCode, p.CompanyCode, p.LocationCode, p.Panel,',
'              pb.PartyBillNo, ''PBPASS'', p.PBPassDate, nvl(p.PBPassAmount,0), nvl(p.PBPassAmount,0),',
'              ''a posted PBPASS voucher'', ''no voucher exists'',',
'              ''Bill pass approved but never posted to the ledger, so this liability is missing from the general ledger entirely.''',
'         From PBPass p',
'         Left Join PurchaseBill pb On pb.Tno = p.PurchaseBillTno',
'        Where Not Exists (Select 1 From Voucher v2',
'                           Where v2.ModuleCode = ''PBPASS'' And v2.ModuleTno = p.Tno)',
'       Union All',
'       /* AP-M03: MSME classification missing on a vendor we owe - the',
'          MSMED 45-day exposure cannot be bounded without it. */',
'       Select ''AP-M03'', To_Number(Null), g.Pty, Null, Null, Null,',
'              ''party '' || g.Pty, ''PARTY'', To_Date(Null), g.Dr, g.Dr,',
'              ''MSME classified YES or NO'', ''not classified'',',
'              ''Vendor carries open payable but no MSME classification, so MSMED 45-day exposure cannot be measured for it.''',
'         From (Select o2.Pty, Sum(Case When o2.Pay > 0 Then o2.Pay Else 0 End) Dr',
'                 From Oi o2 Group By o2.Pty) g',
'         Join Party mp On mp.PartyCode = g.Pty',
'        Where g.Dr > 0.005 And mp.MSME Is Null',
'       Union All',
'       /* AP-G01: GRN awaiting a supplier bill beyond 30 days. GRNI sits',
'          on GRIRACCOUNT, outside this control account, so it is reported',
'          here as a control and valued on its own page. */',
'       Select ''AP-G01'', og.VOCUHERTNO, gr.PartyCode, og.CompanyCode, og.LocationCode, gr.Panel,',
'              og.GRNNo, ''GRN'', og.GRNDate, nvl(og.Amount,0), nvl(og.Amount,0),',
'              ''a supplier bill within 30 days'',',
'              to_char(trunc(sysdate) - og.GRNDate) || '' days unbilled'',',
'              ''Goods received and credited to GR/IR with no supplier bill passed yet.''',
'         From OpenGRIRCost og',
'         Join GRN gr On gr.Tno = og.GRNTno',
'        Where og.Status = ''PENDING'' And trunc(sysdate) - og.GRNDate > 30',
'       Union All',
'       Select ''AP-C02'', To_Number(Null), g.Pty, Null, Null, Null,',
'              ''party '' || g.Pty, ''-'', To_Date(Null), g.Dr, Least(g.Dr, g.Cr),',
'              ''payable OR advance, not both'',',
'              ''payable '' || to_char(Round(g.Dr,0)) || '' and debits '' || to_char(Round(g.Cr,0)),',
'              ''The lesser of the two can be cleared by allocation alone, with no cash outflow.''',
'         From (Select Pty, Sum(Case When Pay > 0 Then Pay Else 0 End) Dr,',
'                           Sum(Case When Pay < 0 Then -Pay Else 0 End) Cr',
'                 From Oi Group By Pty) g',
'        Where g.Dr > 0.005 And g.Cr > 0.005',
'       Union All',
'       Select ''AP-M01'', o.Tno, o.Pty, o.Cmp, o.Loc, o.Pnl, o.Vno, nvl(o.Mc,o.Dtc),',
'              o.Vdt, Abs(o.Amt), Abs(o.Pay),',
'              ''A or B'', ''null'',',
'              ''Panel drives row-level security; a null Panel is invisible to a panel-locked login.''',
'         From Oi o Where o.Pnl Is Null',
'       Union All',
'       Select ''AP-M02'', o.Tno, o.Pty, o.Cmp, o.Loc, o.Pnl, o.Vno, nvl(o.Mc,o.Dtc),',
'              o.Vdt, Abs(o.Amt), Abs(o.Pay),',
'              ''an active location'', apex_escape.html(l.LocationName),',
'              ''The location master names this location as unusable, yet payables are posted to it.''',
'         From Oi o Join Location l On l.LocationCode = o.Loc',
'        Where upper(l.LocationName) Like ''%DO NOT USE%'' And Abs(o.Pay) > 0.005)',
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
'          value-bearing; for a count-only control (duplicate supplier bill',
'          number, zero-amount bill) there is no meaningful numeric',
'          difference and the column stays null rather than showing 0. */',
'       Case When e.Code Not In (''AP-B05'',''AP-B06'') Then Round(e.Expo,2) End As DIFFERENCE,',
'       /* Severity and Category are derived from the control code so',
'          they cannot drift out of step with the matrix''s roster. */',
'       Case When e.Code In (''AP-A05'',''AP-A07'',''AP-A09'',''AP-P03'',''AP-M01'',''AP-B01'') Then ''Critical''',
'            When e.Code In (''AP-B02'',''AP-B05'',''AP-O01'',''AP-C02'',''AP-M02'',''AP-M03'',''AP-G01'') Then ''High''',
'            When e.Code In (''AP-B06'',''AP-O02'') Then ''Medium''',
'            Else ''Info'' End                          As SEVERITY,',
'       Case substr(e.Code,4,1) When ''A'' Then ''Allocation'' When ''B'' Then ''Bill''',
'                               When ''P'' Then ''Payment''    When ''G'' Then ''GRNI''',
'                               When ''O'' Then ''Opening''    When ''R'' Then ''Payment''',
'                               When ''C'' Then ''Vendor''   When ''M'' Then ''Master''',
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
' Where (e.Code = :P715_CONTROL',
'        Or (:P715_CONTROL Is Null And :P715_CATEGORY Is Not Null',
'            And Case substr(e.Code,4,1) When ''A'' Then ''Allocation'' When ''B'' Then ''Bill''',
'                               When ''P'' Then ''Payment''    When ''G'' Then ''GRNI''',
'                                        When ''O'' Then ''Opening''    When ''R'' Then ''Payment''',
'                                        When ''C'' Then ''Vendor''   When ''M'' Then ''Master''',
'                                        Else ''Other'' End = :P715_CATEGORY)',
'        Or (:P715_CONTROL Is Null And :P715_CATEGORY = ''ALL'')',
'        Or (:P715_CONTROL Is Null And :P715_CATEGORY = ''CRITICAL''',
'            And e.Code In (''AP-A05'',''AP-A07'',''AP-A09'',''AP-P03'',''AP-M01'',''AP-B01''))',
'        Or (:P715_CONTROL Is Null And :P715_CATEGORY = ''HIGHVALUE'' And e.Expo >= 1000000))'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P715_FROMDATE,P715_TODATE,P715_COMPANY,P715_LOCATION,P715_PANEL,P715_CONTROL,P715_CATEGORY'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P715_CONTROL Is Not Null Or :P715_CATEGORY Is Not Null'
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
 p_id=>wwv_flow_imp.id(12853368798301385)
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
 p_id=>wwv_flow_imp.id(12853402450301385)
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
 p_id=>wwv_flow_imp.id(12853523284301385)
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
 p_id=>wwv_flow_imp.id(12853609280301385)
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
 p_id=>wwv_flow_imp.id(12853774241301385)
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
 p_id=>wwv_flow_imp.id(12853841951301385)
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
 p_id=>wwv_flow_imp.id(12853937611301385)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vendor'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12854065624301385)
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
 p_id=>wwv_flow_imp.id(12854128098301385)
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
 p_id=>wwv_flow_imp.id(12854251403301386)
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
 p_id=>wwv_flow_imp.id(12854334043301386)
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
 p_id=>wwv_flow_imp.id(12854408769301386)
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
 p_id=>wwv_flow_imp.id(12854555708301386)
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
 p_id=>wwv_flow_imp.id(12854622914301386)
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
 p_id=>wwv_flow_imp.id(12854737740301386)
,p_db_column_name=>'PANEL'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Panel'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12854857950301386)
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
 p_id=>wwv_flow_imp.id(12854900801301386)
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
 p_id=>wwv_flow_imp.id(12855017308301386)
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
 p_id=>wwv_flow_imp.id(12855156008301386)
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
 p_id=>wwv_flow_imp.id(12855293244301386)
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
 p_id=>wwv_flow_imp.id(12855368995301386)
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
 p_id=>wwv_flow_imp.id(12855431644301386)
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
 p_id=>wwv_flow_imp.id(12855557307301386)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69601'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CONTROL_CODE:REFERENCE:CUSTOMER:TRANSACTION_DATE:AMOUNT:EXPOSURE:EXPECTED_VALUE:ACTUAL_VALUE:EXCEPTION_REASON'
,p_sum_columns_on_break=>'EXPOSURE'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12855624549301386)
,p_name=>'Exception KPIs'
,p_static_id=>'exception-kpis'
,p_template=>4502917002193490937
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
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P715_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Select d.Tno, d.AccountCode Pty, d.LocationCode Loc, d.Panel Pnl,',
'              d.VoucherDate Vdt, v.VoucherNo Vno, v.DocTypeCode Dtc,',
'              d.Amount Amt, (d.Amount - nvl(al.Amt,0)) Pay,',
'              coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) DueDate,',
'              ao.BillDate AoBillDate, ao.BillDueDate AoBillDue',
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
'          And (:P715_PANEL    Is Null Or d.Panel        = :P715_PANEL)',
'          And (:P715_COMPANY  Is Null Or d.CompanyCode  = :P715_COMPANY)',
'          And (:P715_LOCATION Is Null Or d.LocationCode = :P715_LOCATION)),',
'     Ex As (',
'       Select ''AP-B02'' Code, Abs(o.Pay) Expo, o.Vdt Dt From Oi o',
'        Where o.Pay > 0.005 And o.DueDate Is Null',
'       Union All',
'       Select ''AP-A05'', a.Amount, To_Date(Null) From DrCrAllocation a',
'        Where Not Exists (Select 1 From Voucher v Where v.Tno = a.DrVoucherTno)',
'           Or Not Exists (Select 1 From Voucher v Where v.Tno = a.CrVoucherTno)',
'       Union All',
'       Select ''AP-A07'', Abs(al.Amt) - Abs(d.Amount), d.VoucherDate',
'         From VoucherDetail d Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And Abs(al.Amt) > Abs(d.Amount) + 0.005',
'       Union All',
'       Select ''AP-A11'', a.Amount, dd.VoucherDate From DrCrAllocation a',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'        Where dd.Panel <> cd.Panel',
'          And (dd.AccountCode In (Select PartyCode From Sd)',
'            Or cd.AccountCode In (Select PartyCode From Sd))',
'       Union All',
'       Select ''AP-A08'', a.Amount, dd.VoucherDate From DrCrAllocation a',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'        Where dd.LocationCode <> cd.LocationCode',
'          And (dd.AccountCode In (Select PartyCode From Sd)',
'            Or cd.AccountCode In (Select PartyCode From Sd))',
'       Union All',
'       Select ''AP-A09'', a.Amount, dd.VoucherDate From DrCrAllocation a',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'        Where dd.CompanyCode <> cd.CompanyCode',
'          And (dd.AccountCode In (Select PartyCode From Sd)',
'            Or cd.AccountCode In (Select PartyCode From Sd))',
'       Union All',
'       Select ''AP-B05'', 0, Min(PartyBillDate) From PurchaseBill Where PartyBillNo Is Not Null',
'        Group By PartyCode, upper(trim(PartyBillNo)) Having Count(*) > 1',
'       Union All',
'       Select ''AP-B06'', 0, PartyBillDate From PurchaseBill Where nvl(PurchaseBillAmount,0) = 0',
'       Union All',
'       Select ''AP-O01'', Abs(o.Pay), o.Vdt From Oi o',
'        Where o.Vno = ''OPENING'' And o.AoBillDate Is Null And Abs(o.Pay) > 0.005',
'       Union All',
'       Select ''AP-O02'', Abs(o.Pay), o.Vdt From Oi o',
'        Where o.Vno = ''OPENING'' And o.AoBillDue Is Null And o.Pay > 0.005',
'       Union All',
'       Select ''AP-P03'', -o.Pay, o.Vdt From Oi o Cross Join Asof',
'        Where o.Dtc In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'') And o.Pay < -0.005 And Asof.D - o.Vdt > 90',
'       Union All',
'       Select ''AP-C02'', Least(g.Dr, g.Cr), To_Date(Null) From (',
'         Select Pty, Sum(Case When Pay > 0 Then Pay Else 0 End) Dr,',
'                     Sum(Case When Pay < 0 Then -Pay Else 0 End) Cr',
'           From Oi Group By Pty) g',
'        Where g.Dr > 0.005 And g.Cr > 0.005',
'       Union All',
'       Select ''AP-M01'', Abs(o.Pay), o.Vdt From Oi o Where o.Pnl Is Null',
'       Union All',
'       Select ''AP-M02'', Abs(o.Pay), o.Vdt From Oi o',
'         Join Location l On l.LocationCode = o.Loc',
'        Where upper(l.LocationName) Like ''%DO NOT USE%'' And Abs(o.Pay) > 0.005),',
'     Rec As (',
'       /* Reconciliation failures: levels whose analytical balance does',
'          not equal the ledger. Counted at company, location and party',
'          so the card matches what page 716 lists. */',
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
'              Sum(Case When Code In (''AP-A05'',''AP-A07'',''AP-A09'',''AP-P03'',''AP-M01'',''AP-B01'') Then 1 Else 0 End) Crit,',
'              Sum(Case When Expo >= 1000000 Then 1 Else 0 End) HighVal,',
'              Sum(Case When Dt >= to_date(:P715_FROMDATE,''DD-MM-RRRR'')',
'                        And Dt <= to_date(:P715_TODATE,''DD-MM-RRRR'') Then 1 Else 0 End) Nw,',
'              Sum(Case When substr(Code,4,1) = ''B'' Then 1 Else 0 End) BillN,',
'              /* ''P'' for payment, not ''R'' for receipt. The receivables',
'                 page counts R-prefixed codes; no AP control carries that',
'                 prefix, so counting ''R'' here made the Payment Exceptions',
'                 card read zero however many findings existed. */',
'              Sum(Case When substr(Code,4,1) = ''P'' Then 1 Else 0 End) RcptN,',
'              Sum(Case When substr(Code,4,1) = ''G'' Then 1 Else 0 End) GrniN,',
'              Sum(Case When substr(Code,4,1) = ''A'' Then 1 Else 0 End) AllocN,',
'              Sum(Case When substr(Code,4,1) = ''O'' Then 1 Else 0 End) OpenN,',
'              Sum(Case When Code = ''AP-M02'' Then 1 Else 0 End) LocN,',
'              Sum(Case When Code = ''AP-M01'' Then 1 Else 0 End) PnlN,',
'              nvl(Sum(Expo),0) Expo',
'         From Ex)',
'Select ''<a class="ds-kpi ds-kpi--gold" href="''',
'    || apex_page.get_url(p_page => 715, p_items => ''P715_CONTROL,P715_CATEGORY'', p_values => '',ALL'')',
'    || ''" title="Every finding from every implemented control, at the As-of Date."><span class="ds-kpi-ic fa fa-list"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Total Active Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.Total,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">exposure &#8377;''',
'    || Case When t.Expo >= 10000000 Then to_char(Round(t.Expo/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Expo/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div></div></a>'' As K1,',
'       ''<a class="ds-kpi ds-kpi--risk" href="''',
'    || apex_page.get_url(p_page => 715, p_items => ''P715_CONTROL,P715_CATEGORY'', p_values => '',CRITICAL'')',
'    || ''" title="Findings on controls graded Critical: orphan allocation, over-allocation, cross-company allocation, unapplied cash over 90 days, null Panel."><span class="ds-kpi-ic fa fa-exclamation-triangle"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Critical Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.Crit,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">must be cleared, not explained</div></div></a>'' As K2,',
'       ''<a class="ds-kpi ds-kpi--amber" href="''',
'    || apex_page.get_url(p_page => 715, p_items => ''P715_CONTROL,P715_CATEGORY'', p_values => '',HIGHVALUE'')',
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
'       ''<div class="ds-apexcl"><div class="ds-apexcl-h">Unresolved Exceptions &mdash; CANNOT VALIDATE</div>''',
'    || ''<div class="ds-apexcl-b">This ERP stores no exception log and no resolution status, so an exception cannot be marked resolved and none can be counted as unresolved. ''',
'    || ''Every finding above is simply <b>currently true</b>. Reporting all '' || to_char(t.Total,''FM999G999G990'')',
'    || '' as &ldquo;unresolved&rdquo; would state a fact the data does not carry.</div></div>'' As K5,',
'       ''<a class="ds-kpi ds-kpi--'' || Case When rec.CmpN + rec.LocN = 0 Then ''ok'' Else ''risk'' End || ''" href="''',
'    || apex_page.get_url(p_page => 716, p_clear_cache => ''716'',',
'         p_items => ''P716_FROMDATE,P716_TODATE,P716_COMPANY,P716_LOCATION,P716_PANEL,P716_LEVEL,P716_ONLYBREAKS'',',
'         p_values => :P715_FROMDATE ||'',''|| :P715_TODATE ||'',''|| :P715_COMPANY ||'',''|| :P715_LOCATION ||'',''|| :P715_PANEL ||'',ALL,Y'')',
'    || ''" title="Company and Location levels whose analytical balance does not equal the ledger. Location and panel breaks are usually legitimate cross-dimension settlement - page 716 says which."><span class="ds-kpi-ic fa fa-balance-scale"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Reconciliation Failures</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(rec.CmpN + rec.LocN,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || to_char(rec.CmpN,''FM999G990'') || '' company &middot; ''',
'    || to_char(rec.LocN,''FM999G990'') || '' location</div></div></a>'' As K6,',
'       ''<a class="ds-kpi ds-kpi--teal" href="''',
'    || apex_page.get_url(p_page => 715, p_items => ''P715_CONTROL,P715_CATEGORY'', p_values => '',Bill'')',
'    || ''" title="Controls AP-B02, AP-B05 and AP-B06."><span class="ds-kpi-ic fa fa-file-text-o"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Bill Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.BillN,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AP-B02 &middot; AP-B05 &middot; AP-B06</div></div></a>'' As K7,',
'       ''<a class="ds-kpi ds-kpi--violet" href="''',
'    || apex_page.get_url(p_page => 715, p_items => ''P715_CONTROL,P715_CATEGORY'', p_values => '',Payment'')',
'    || ''" title="Control AP-P03 - payment cash unapplied over 90 days."><span class="ds-kpi-ic fa fa-upload"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Payment Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.RcptN,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AP-P03</div></div></a>'' As K8,',
'       ''<a class="ds-kpi ds-kpi--risk" href="''',
'    || apex_page.get_url(p_page => 715, p_items => ''P715_CONTROL,P715_CATEGORY'', p_values => '',Allocation'')',
'    || ''" title="Controls AP-A05, AP-A07, AP-A08, AP-A09 and AP-A11."><span class="ds-kpi-ic fa fa-link"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Allocation Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.AllocN,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AP-A05 &middot; AP-A07 &middot; AP-A08 &middot; AP-A09</div></div></a>'' As K9,',
'       ''<a class="ds-kpi ds-kpi--gold" href="''',
'    || apex_page.get_url(p_page => 715, p_items => ''P715_CONTROL,P715_CATEGORY'', p_values => '',Opening'')',
'    || ''" title="Controls AP-O01 and AP-O02 - migrated payables that lost their original dates."><span class="ds-kpi-ic fa fa-history"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Opening Balance Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.OpenN,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AP-O01 &middot; AP-O02</div></div></a>'' As K10,',
'       ''<a class="ds-kpi ds-kpi--amber" href="''',
'    || apex_page.get_url(p_page => 715, p_items => ''P715_CONTROL,P715_CATEGORY'', p_values => ''AP-M02,'')',
'    || ''" title="Control AP-M02 - payables posted to a location the master marks unusable."><span class="ds-kpi-ic fa fa-map-marker"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Location Mapping Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.LocN,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AP-M02</div></div></a>'' As K11,',
'       ''<a class="ds-kpi ds-kpi--'' || Case When t.PnlN = 0 Then ''ok'' Else ''risk'' End || ''" href="''',
'    || apex_page.get_url(p_page => 715, p_items => ''P715_CONTROL,P715_CATEGORY'', p_values => ''AP-M01,'')',
'    || ''" title="Control AP-M01 - AR posted with no Panel. Panel drives row-level security, so a null would be invisible to a panel-locked login."><span class="ds-kpi-ic fa fa-shield"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">Panel Mapping Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.PnlN,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">''',
'    || Case When t.PnlN = 0 Then ''AP-M01 &mdash; control PASSES, 0 nulls'' Else ''AP-M01'' End',
'    || ''</div></div></a>'' As K12,',
'       /* Appended at the END of the select list deliberately: a classic',
'          report column''s reportColumnQueryId is its POSITION here, so',
'          inserting a card in the middle silently re-points every column',
'          after it at the wrong expression. */',
'       ''<a class="ds-kpi ds-kpi--teal" href="''',
'    || apex_page.get_url(p_page => 715, p_items => ''P715_CONTROL,P715_CATEGORY'', p_values => '',GRNI'')',
'    || ''" title="Control AP-G01 - goods received and credited to GR/IR with no supplier bill passed beyond 30 days. GRNI sits outside the creditors control account; page 714 values it and ties it to the GR/IR account."><span class="ds-kpi-ic fa fa-tr'
||'uck"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">GRNI Exceptions</div>''',
'    || ''<div class="ds-kpi-n">'' || to_char(t.GrniN,''FM999G999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">AP-G01 &middot; unbilled over 30 days</div></div></a>'' As K13',
'  From T t Cross Join Rec rec'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P715_FROMDATE,P715_TODATE,P715_COMPANY,P715_LOCATION,P715_PANEL'
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
 p_id=>wwv_flow_imp.id(12855766071301386)
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
 p_id=>wwv_flow_imp.id(12855818460301386)
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
 p_id=>wwv_flow_imp.id(12855906262301386)
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
 p_id=>wwv_flow_imp.id(12856072022301386)
,p_query_column_id=>12
,p_column_alias=>'K12'
,p_column_display_sequence=>120
,p_column_heading=>'K12'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12856158500301386)
,p_query_column_id=>13
,p_column_alias=>'K13'
,p_column_display_sequence=>130
,p_column_heading=>'K13'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12856250013301386)
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
 p_id=>wwv_flow_imp.id(12856366199301386)
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
 p_id=>wwv_flow_imp.id(12856448287301386)
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
 p_id=>wwv_flow_imp.id(12856505562301386)
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
 p_id=>wwv_flow_imp.id(12856634036301386)
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
 p_id=>wwv_flow_imp.id(12856769292301386)
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
 p_id=>wwv_flow_imp.id(12856867786301386)
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
 p_id=>wwv_flow_imp.id(12856973077301386)
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
 p_id=>wwv_flow_imp.id(12857021354301386)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p715Filters'
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
 p_id=>wwv_flow_imp.id(12857150004301403)
,p_name=>'Control Matrix'
,p_static_id=>'matrix'
,p_template=>4073835273271169698
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
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P715_TODATE,''DD-MM-RRRR'') D From dual),',
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
'              d.LocationCode Loc, d.Panel Pnl, d.VoucherDate Vdt,',
'              v.VoucherNo Vno, v.DocTypeCode Dtc, v.ModuleCode Mc,',
'              d.Amount Amt, (d.Amount - nvl(al.Amt,0)) Pay,',
'              coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) DueDate,',
'              ao.BillDate AoBillDate, ao.BillDueDate AoBillDue',
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
'          And (:P715_PANEL    Is Null Or d.Panel        = :P715_PANEL)',
'          And (:P715_COMPANY  Is Null Or d.CompanyCode  = :P715_COMPANY)',
'          And (:P715_LOCATION Is Null Or d.LocationCode = :P715_LOCATION)),',
'     Ex As (',
'       /* AP-B02 - open payable that cannot be aged */',
'       Select ''AP-B02'' Code, Abs(o.Pay) Expo From Oi o',
'        Where o.Pay > 0.005 And o.DueDate Is Null',
'       Union All',
'       /* AP-A05 - allocation pointing at a voucher that no longer',
'          exists. This ERP has no reversal flag; deletion is its only',
'          cancellation mechanism, and this is the residue. */',
'       Select ''AP-A05'', a.Amount From DrCrAllocation a',
'        Where Not Exists (Select 1 From Voucher v Where v.Tno = a.DrVoucherTno)',
'           Or Not Exists (Select 1 From Voucher v Where v.Tno = a.CrVoucherTno)',
'       Union All',
'       /* AP-A07 - allocation exceeds the line it settles */',
'       Select ''AP-A07'', Abs(al.Amt) - Abs(d.Amount)',
'         From VoucherDetail d Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And Abs(al.Amt) > Abs(d.Amount) + 0.005',
'       Union All',
'       /* AP-A08 - cross-location settlement. Informational, not a',
'          failure: a payment legitimately occurs at a location other',
'          than the one that raised the bill. */',
'       Select ''AP-A11'', a.Amount',
'         From DrCrAllocation a',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'        Where dd.Panel <> cd.Panel',
'          And (dd.AccountCode In (Select PartyCode From Sd)',
'            Or cd.AccountCode In (Select PartyCode From Sd))',
'       Union All',
'       Select ''AP-A08'', a.Amount',
'         From DrCrAllocation a',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'        Where dd.LocationCode <> cd.LocationCode',
'          And (dd.AccountCode In (Select PartyCode From Sd)',
'            Or cd.AccountCode In (Select PartyCode From Sd))',
'       Union All',
'       /* AP-A09 - allocation crossing a company boundary */',
'       Select ''AP-A09'', a.Amount',
'         From DrCrAllocation a',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'        Where dd.CompanyCode <> cd.CompanyCode',
'          And (dd.AccountCode In (Select PartyCode From Sd)',
'            Or cd.AccountCode In (Select PartyCode From Sd))',
'       Union All',
'       /* AP-B05 - the same supplier bill number booked twice for one vendor */',
'       Select ''AP-B05'', 0 From PurchaseBill Where PartyBillNo Is Not Null',
'        Group By PartyCode, upper(trim(PartyBillNo)) Having Count(*) > 1',
'       Union All',
'       /* AP-B06 - purchase bill carrying no value */',
'       Select ''AP-B06'', 0 From PurchaseBill Where nvl(PurchaseBillAmount,0) = 0',
'       Union All',
'       /* AP-O01 - opening payable whose original bill date did not',
'          survive migration, so its age is floored at the cutover */',
'       Select ''AP-O01'', Abs(o.Pay) From Oi o',
'        Where o.Vno = ''OPENING'' And o.AoBillDate Is Null And Abs(o.Pay) > 0.005',
'       Union All',
'       /* AP-O02 - opening payable with no original due date */',
'       Select ''AP-O02'', Abs(o.Pay) From Oi o',
'        Where o.Vno = ''OPENING'' And o.AoBillDue Is Null And o.Pay > 0.005',
'       Union All',
'       /* AP-P03 - payment cash held unapplied for more than 90 days.',
'          The largest actionable balance in this ledger. */',
'       Select ''AP-P03'', -o.Pay From Oi o Cross Join Asof',
'        Where o.Dtc In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'') And o.Pay < -0.005 And Asof.D - o.Vdt > 90',
'       Union All',
'       /* AP-C02 - vendor owing and holding credit at the same time */',
'       Select ''AP-C02'', Least(g.Dr, g.Cr) From (',
'         Select Pty, Sum(Case When Pay > 0 Then Pay Else 0 End) Dr,',
'                     Sum(Case When Pay < 0 Then -Pay Else 0 End) Cr',
'           From Oi Group By Pty) g',
'        Where g.Dr > 0.005 And g.Cr > 0.005',
'       Union All',
'       /* AP-M01 - AR posted with no Panel */',
'       Select ''AP-M01'', Abs(o.Pay) From Oi o Where o.Pnl Is Null',
'       Union All',
'       /* AP-M02 - AR posted to a location the master marks unusable */',
'       Select ''AP-M02'', Abs(o.Pay) From Oi o',
'         Join Location l On l.LocationCode = o.Loc',
'        Where upper(l.LocationName) Like ''%DO NOT USE%'' And Abs(o.Pay) > 0.005),',
'     Agg As (Select Code, Count(*) N, nvl(Sum(Expo),0) Expo From Ex Group By Code),',
'     Roster As (',
'       Select ''AP-B02'' Code, ''Open payable that cannot be aged'' Nm, ''High'' Sev, ''Bill'' Cat,',
'              ''The source document carries no due date and this ERP holds no credit terms to derive one from. Shown in its own Cannot Age bucket, never given an arbitrary one.'' Dsc, ''Y'' Amt From dual',
'       Union All Select ''AP-A05'',''Orphan allocation touching AP - voucher no longer exists'',''Critical'',''Allocation'',',
'              ''The allocation references a Dr or Cr voucher that is not in the ledger. Deletion is this ERP''''s only cancellation mechanism. The canonical AR layer excludes these; one of them carries Rs 34,119 against the AR control account.'',''Y'' From'
||' dual',
'       Union All Select ''AP-A07'',''Allocation exceeds the item it settles'',''Critical'',''Allocation'',',
'              ''Allocated amount is greater than the original line amount, so the balance has flipped sign.'',''Y'' From dual',
'       Union All Select ''AP-A11'',''Cross-panel settlement'',''Info'',''Allocation'',',
'              ''A payment raised under one panel settling a bill under the other. Measured 15 on this ledger and 0 on the receivables ledger, which is why only the payables pages carry this control. It is the reason a panel-locked reconciliation shows'
||' a residual that nets to zero across both panels.'',''Y'' From dual',
'       Union All Select ''AP-A08'',''Cross-location settlement'',''Info'',''Allocation'',',
'              ''A payment at one location settling a bill raised at another. Legitimate in this business and reported for visibility, not as a failure.'',''Y'' From dual',
'       Union All Select ''AP-A09'',''Cross-company allocation'',''Critical'',''Allocation'',',
'              ''An allocation crossing a company boundary would break company-level payables.'',''Y'' From dual',
'       Union All Select ''AP-B05'',''Duplicate supplier bill number within a vendor'',''High'',''Bill'',',
'              ''The same PartyBillNo booked more than once for one vendor. Some are legitimate part-series; each deserves a look.'',''N'' From dual',
'       Union All Select ''AP-B06'',''Purchase bill with zero or null amount'',''Medium'',''Bill'',',
'              ''A purchase bill carrying no value.'',''N'' From dual',
'       Union All Select ''AP-O01'',''Opening AP with no original bill date'',''High'',''Opening'',',
'              ''Migrated payable whose pre-cutover bill date was not preserved, so its age is floored at 31-03-2026 and is understated.'',''Y'' From dual',
'       Union All Select ''AP-O02'',''Opening AP with no original due date'',''Medium'',''Opening'',',
'              ''Migrated payable that can never be aged on the Due Date basis.'',''Y'' From dual',
'       Union All Select ''AP-P03'',''Payment cash unapplied over 90 days'',''Critical'',''Payment'',',
'              ''Cash received, never allocated to a bill, and now more than 90 days old. Reduces reported collection performance and overstates both sides of the ledger.'',''Y'' From dual',
'       Union All Select ''AP-C02'',''Vendor with payable AND advance held'',''High'',''Vendor'',',
'              ''The vendor owes and is owed at the same time. The lesser of the two can be cleared by allocation alone, with no collection effort.'',''Y'' From dual',
'       Union All Select ''AP-M01'',''AP posted with no Panel'',''Critical'',''Master'',',
'              ''Panel drives row-level security. A null Panel would be invisible to a panel-locked login.'',''Y'' From dual',
'       Union All Select ''AP-M02'',''AR posted to a location marked DO NOT USE'',''High'',''Master'',',
'              ''The location master names this location as unusable, yet payables are posted to it.'',''Y'' From dual),',
'     /* Controls whose INPUT does not exist. These are reported as DATA',
'        MISSING and are deliberately NOT counted as passes - the brief',
'        is explicit that lack of information is not a pass. */',
'     Missing As (',
'       Select ''AP-C01'' Code, ''Credit limit exceeded'' Nm, ''Vendor'' Cat,',
'              ''Party.CreditAmount is greater than zero on 0 creditor accounts. There is no limit to test exposure against.'' Dsc From dual',
'       Union All Select ''AP-C03'',''Vendor-level credit terms not declared'',''Vendor'',',
'              ''Party.CreditDays is greater than zero on 2 creditor accounts, so a due date cannot be derived from vendor terms - it comes from the purchase order instead, and where no order term exists the item is Cannot Age rather than instantly ove'
||'rdue.'' From dual',
'       Union All Select ''AP-R05'',''Reversed or cancelled payment still allocated'',''Payment'',',
'              ''VOUCHER carries no approval, posting, draft, cancellation or reversal column and VoucherReferenceDetailReversal is empty. Deletion is the only cancellation mechanism; its nearest evidence is AP-A05, which currently finds zero rows touc'
||'hing this control account.'' From dual',
'       Union All Select ''AP-X02'',''All-of-AP subledger vs GL'',''Reconciliation'',',
'              ''No table covers all of AP as an independent subledger. PBPass covers purchase bills only and its cached PaidAmount is populated on 1,231 of 8,626 rows, so it cannot stand as a reconciliation leg - the bill-level ledger-vs-documents com'
||'parison is reported as AP-X01 instead, and the honest two-way test is on the Reconciliation page.'' From dual)',
'Select r.Cat                                          As CATEGORY,',
'       r.Code                                         As CONTROL_CODE,',
'       Case When nvl(a.N,0) = 0 Then apex_escape.html(r.Nm)',
'            Else ''<a href="'' || apex_page.get_url(p_page => 715,',
'                   p_items => ''P715_CONTROL'', p_values => r.Code)',
'                 || ''">'' || apex_escape.html(r.Nm) || ''</a>'' End As CONTROL_NAME,',
'       Case r.Sev When ''Critical'' Then ''<span class="ds-apchip ds-apchip--fail">Critical</span>''',
'                  When ''High''     Then ''<span class="ds-apchip ds-apchip--warn">High</span>''',
'                  When ''Medium''   Then ''<span class="ds-apchip ds-apchip--info">Medium</span>''',
'                  Else ''<span class="ds-apchip ds-apchip--na">Info</span>'' End As SEVERITY,',
'       nvl(a.N,0)                                     As FINDINGS,',
'       Case When r.Amt = ''Y'' And nvl(a.N,0) > 0 Then Round(a.Expo,2) End As EXPOSURE,',
'       /* Six deterministic states, per the brief. NOT APPLICABLE is',
'          reserved for a control that cannot fire because the FILTER',
'          puts it out of scope - not for one that simply found nothing,',
'          which is a PASS. Confusing the two would let a narrowed scope',
'          masquerade as a clean result. */',
'       Case When r.Code = ''AP-A09'' And :P715_COMPANY Is Not Null',
'                 Then ''<span class="ds-apchip ds-apchip--na">NOT APPLICABLE</span>''',
'            When nvl(a.N,0) = 0',
'                 Then ''<span class="ds-apchip ds-apchip--pass">PASS</span>''',
'            When r.Sev = ''Info''',
'                 Then ''<span class="ds-apchip ds-apchip--na">REPORTED</span>''',
'            When r.Sev = ''Critical''',
'                 Then ''<span class="ds-apchip ds-apchip--fail">FAIL</span>''',
'            Else ''<span class="ds-apchip ds-apchip--warn">WARNING</span>'' End As RESULT,',
'       Case When r.Code = ''AP-A09'' And :P715_COMPANY Is Not Null',
'            Then ''Scope is a single company, so a cross-company allocation cannot arise within it. Clear the Company filter to test this control.''',
'            Else r.Dsc End                            As WHAT_IT_TESTS',
'  From Roster r Left Join Agg a On a.Code = r.Code',
'Union All',
'Select m.Cat, m.Code, apex_escape.html(m.Nm),',
'       ''<span class="ds-apchip ds-apchip--na">n/a</span>'',',
'       To_Number(Null), To_Number(Null),',
'       ''<span class="ds-apchip ds-apchip--nodata">DATA MISSING</span>'',',
'       apex_escape.html(m.Dsc)',
'  From Missing m',
'Union All',
'/* CANNOT VALIDATE is distinct from DATA MISSING: the input columns',
'   exist and hold values, but they cannot settle the question the',
'   control asks. Both are reported; neither is ever a PASS. */',
'Select x.Cat, x.Code, apex_escape.html(x.Nm),',
'       ''<span class="ds-apchip ds-apchip--na">n/a</span>'',',
'       To_Number(Null), To_Number(Null),',
'       ''<span class="ds-apchip ds-apchip--nodata">CANNOT VALIDATE</span>'',',
'       apex_escape.html(x.Dsc)',
'  From (',
'    Select ''AP-A10'' Code, ''Duplicate allocation'' Nm, ''Allocation'' Cat,',
'           ''Two allocations of the same amount between the same bill and payment are a legitimate part-payment pattern here. DrCrAllocation carries no key that distinguishes a duplicate from a genuine second instalment, so the test cannot be made det'
||'erministic.'' Dsc From dual',
'    Union All Select ''AP-X03'',''Exception resolution status'',''Reconciliation'',',
'           ''This ERP stores no exception log, so no finding can be marked resolved. Every result on this page is what is currently true, not a backlog with an age and an owner.'' From dual',
'    Union All Select ''AP-B07'',''Cancelled bill still in AR'',''Bill'',',
'           ''VOUCHER has no cancellation, approval or posting-status column and VoucherReferenceDetailReversal is empty. Deletion is this ERP''''s only cancellation mechanism and it leaves no cancelled row to test - only the orphan allocations AP-A05 fi'
||'nds.'' From dual',
'  ) x',
' Order By 1, 2'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P715_FROMDATE,P715_TODATE,P715_COMPANY,P715_LOCATION,P715_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No control could be evaluated in this scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12857297103301403)
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
 p_id=>wwv_flow_imp.id(12857345240301403)
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
 p_id=>wwv_flow_imp.id(12857412636301403)
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
 p_id=>wwv_flow_imp.id(12857580162301403)
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
 p_id=>wwv_flow_imp.id(12857642542301403)
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
 p_id=>wwv_flow_imp.id(12857789106301403)
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
 p_id=>wwv_flow_imp.id(12857809209301403)
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
 p_id=>wwv_flow_imp.id(12857982686301403)
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
 p_id=>wwv_flow_imp.id(12858074685301403)
,p_plug_name=>'How to read this page'
,p_static_id=>'matrix-note'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-apnote"><span class="fa fa-check-square-o"></span><div>',
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
 p_id=>wwv_flow_imp.id(12858104048301403)
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
'                          Then :P715_TODATE ||'',''|| :P715_COMPANY ||'',''|| :P715_LOCATION ||'',''|| :P715_PANEL',
'                          Else :P715_FROMDATE ||'',''|| :P715_TODATE ||'',''|| :P715_COMPANY ||'',''|| :P715_LOCATION ||'',''|| :P715_PANEL End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 715',
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
'            And b.PageID <> 696',
'            And (upper(c.BossUserName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)',
'                 Or upper(c.LoginName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)))'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P715_FROMDATE,P715_TODATE,P715_COMPANY,P715_LOCATION,P715_PANEL'
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
 p_id=>wwv_flow_imp.id(12858234340301404)
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
 p_id=>wwv_flow_imp.id(12859153752301404)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12857021354301386)
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
 p_id=>wwv_flow_imp.id(12859216980301404)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(12857021354301386)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:708:&SESSION.::&DEBUG.::P708_FROMDATE,P708_TODATE,P708_COMPANY,P708_LOCATION,P708_PANEL:&P715_FROMDATE.,&P715_TODATE.,&P715_COMPANY.,&P715_LOCATION.,&P715_PANEL.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12859306861301404)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(12857021354301386)
,p_button_name=>'CLEARCONTROL'
,p_static_id=>'clear-control'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Clear Selected Control'
,p_button_redirect_url=>'f?p=&APP_ID.:715:&SESSION.::&DEBUG.::P715_FROMDATE,P715_TODATE,P715_COMPANY,P715_LOCATION,P715_PANEL,P715_CONTROL:&P715_FROMDATE.,&P715_TODATE.,&P715_COMPANY.,&P715_LOCATION.,&P715_PANEL.,'
,p_button_condition=>'P715_CONTROL'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-times'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12858307885301404)
,p_name=>'P715_CATEGORY'
,p_item_sequence=>62
,p_item_plug_id=>wwv_flow_imp.id(12857021354301386)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Set by the exception KPI cards. Accepts a control category (Bill, Payment, Allocation, Opening, Vendor, Master, GRNI), or ALL for every finding, CRITICAL for critical-severity controls, or HIGHVALUE for findings whose own exposure is 10 lakh or more.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12858556337301404)
,p_name=>'P715_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12857021354301386)
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
 p_id=>wwv_flow_imp.id(12858625565301404)
,p_name=>'P715_CONTROL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12857021354301386)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12858743407301404)
,p_name=>'P715_FROMDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12857021354301386)
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
 p_id=>wwv_flow_imp.id(12858852974301404)
,p_name=>'P715_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12857021354301386)
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
'                  And (:P715_COMPANY Is Null Or v.CompanyCode = :P715_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P715_COMPANY'
,p_ajax_items_to_submit=>'P715_COMPANY'
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
 p_id=>wwv_flow_imp.id(12858903372301404)
,p_name=>'P715_PANEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12857021354301386)
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
 p_id=>wwv_flow_imp.id(12859097032301404)
,p_name=>'P715_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12857021354301386)
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
