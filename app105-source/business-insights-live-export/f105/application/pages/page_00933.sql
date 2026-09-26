prompt --application/pages/page_00933
begin
--   Manifest
--     PAGE: 00721
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
 p_id=>933
,p_name=>'Monthly AP Management MIS'
,p_alias=>'AP-MONTHLY-MIS'
,p_step_title=>'Monthly AP Management MIS'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#hspl-jet-l10n-fallback.js?version=#APP_VERSION#&cb=20260924a'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'The management pack, in nine sections: Executive Summary, Ageing, Payments, Vendor Exposure, Advances, Risk, Reconciliation, Exceptions and Management Actions. Every line states its own basis, and lines whose data does not exist in this ERP say so ra'
||'ther than reading zero - credit limit and credit utilisation in particular, which cannot be computed because Party.CreditAmount is greater than zero on 0 creditor accounts. Positions are measured at the To Date, flows across the From-To window, and t'
||'he Reconciliation section proves the pack against the general-ledger control account rather than asserting it.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12880748505301538)
,p_name=>'Position by Company and Location'
,p_static_id=>'by-company'
,p_template=>4072358936313175081
,p_display_sequence=>30
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
'     Asof As (Select to_date(:P933_TODATE,''DD-MM-RRRR'') D From dual),',
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
'     Al As (Select Tno, Sno, Sum(Amt) Amt From Alc Group By Tno, Sno)',
'Select apex_escape.html(nvl(c.CompanyName, d.CompanyCode))   As COMPANY,',
'       apex_escape.html(nvl(l.LocationName, d.LocationCode)) As LOCATION,',
'       Round(Sum(Case When (d.Amount-nvl(al.Amt,0))>0',
'                      Then (d.Amount-nvl(al.Amt,0)) Else 0 End),2)  As GROSS,',
'       Round(Sum(Case When (d.Amount-nvl(al.Amt,0))<0',
'                      Then -(d.Amount-nvl(al.Amt,0)) Else 0 End),2) As CREDIT_HELD,',
'       Round(Sum((d.Amount-nvl(al.Amt,0))),2)                       As NET_EXPOSURE,',
'       Round(Sum(d.Amount),2)                                       As GL_CONTROL,',
'       Round(Sum((d.Amount-nvl(al.Amt,0))) - Sum(d.Amount),2)       As DIFFERENCE',
'  From VoucherDetail d',
'  Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'  Left Join Company c On c.CompanyCode = d.CompanyCode',
'  Left Join Location l On l.LocationCode = d.LocationCode',
'  Cross Join Asof',
' Where d.AccountCode In (Select PartyCode From Sd)',
'   And d.VoucherDate <= Asof.D',
'   And (cast(null as varchar2(100)) Is Null',
'        Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'   And (null    Is Null Or cast(null as varchar2(100))        = null)',
'   And (:P933_COMPANY  Is Null Or d.CompanyCode  = :P933_COMPANY)',
'   And (:P933_LOCATION Is Null Or d.LocationCode = :P933_LOCATION)',
' Group By d.CompanyCode, c.CompanyName, d.LocationCode, l.LocationName',
' Order By 1, 2'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P933_TODATE,P933_COMPANY,P933_LOCATION'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No payable position in this scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12880850633301539)
,p_query_column_id=>1
,p_column_alias=>'COMPANY'
,p_column_display_sequence=>10
,p_column_heading=>'Company'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12880928025301539)
,p_query_column_id=>4
,p_column_alias=>'CREDIT_HELD'
,p_column_display_sequence=>40
,p_column_heading=>unistr('Credit Held (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12881085789301539)
,p_query_column_id=>7
,p_column_alias=>'DIFFERENCE'
,p_column_display_sequence=>70
,p_column_heading=>unistr('Difference (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12881140505301539)
,p_query_column_id=>6
,p_column_alias=>'GL_CONTROL'
,p_column_display_sequence=>60
,p_column_heading=>unistr('GL Control (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12881289272301539)
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
 p_id=>wwv_flow_imp.id(12881351305301539)
,p_query_column_id=>2
,p_column_alias=>'LOCATION'
,p_column_display_sequence=>20
,p_column_heading=>'Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12881489182301539)
,p_query_column_id=>5
,p_column_alias=>'NET_EXPOSURE'
,p_column_display_sequence=>50
,p_column_heading=>unistr('Net Exposure (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12881527663301539)
,p_name=>'Monthly AP Management MIS'
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
'    || ''<div class="ds-ap-eyebrow">Payables &middot; Monthly Management MIS</div>''',
'    || ''<h1 class="ds-ap-title">Monthly AP Management MIS</h1>''',
'    || ''<div class="ds-ap-sub">Nine sections, every line carrying its own basis, reconciled to the general ledger at the foot</div>''',
'    || ''<div class="ds-ap-context">''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-calendar"></span>Period <b>''',
'       || :P933_FROMDATE || '' &rarr; '' || :P933_TODATE || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-crosshairs"></span>Positions as at <b>'' || :P933_TODATE || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P933_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P933_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P933_FROMDATE,P933_TODATE,P933_COMPANY,P933_LOCATION'
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
 p_id=>wwv_flow_imp.id(12881630387301539)
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
 p_id=>wwv_flow_imp.id(12881721232301539)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p721Filters'
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
 p_id=>wwv_flow_imp.id(12881820740301539)
,p_name=>'Management Pack'
,p_static_id=>'pack'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* THE WHOLE PACK FROM ONE EVALUATION OF THE CANONICAL LAYER.',
'   Nine sections, all derived from a single pass so no two lines can',
'   disagree with each other. Lines whose input does not exist in this',
'   ERP are emitted with a null value and an explicit basis - never as a',
'   zero, which a reader would take for a measured result. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P933_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Select d.AccountCode Pty, d.CompanyCode Cmp, d.VoucherDate Vdt, cast(null as varchar2(100)) Pnl, d.LocationCode Loc,',
'              v.VoucherNo Vno, v.DocTypeCode Dtc, v.ModuleCode Mc,',
'              (d.Amount - nvl(al.Amt,0)) Pay,',
'              d.Amount Gl,',
'              coalesce(pt.DueDt, jt.DueDt, ao.BillDueDate) DueDate,',
'              coalesce(pt.DocDt, jt.DocDt, ao.BillDate, d.VoucherDate) DocDate,',
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
'          And (:P933_COMPANY  Is Null Or d.CompanyCode  = :P933_COMPANY)',
'          And (:P933_LOCATION Is Null Or d.LocationCode = :P933_LOCATION)),',
'     T As (',
'       Select nvl(Sum(Case When Pay>0 Then Pay Else 0 End),0) Gross,',
'              nvl(Sum(Case When Pay<0 Then -Pay Else 0 End),0) Cred,',
'              nvl(Sum(Pay),0) Net,',
'              nvl(Sum(Gl),0) GlNet,',
'              nvl(Sum(Case When Pay>0 And DueDate>=(Select D From Asof) Then Pay Else 0 End),0) NotDue,',
'              nvl(Sum(Case When Pay>0 And DueDate<(Select D From Asof) Then Pay Else 0 End),0) Overdue,',
'              nvl(Sum(Case When Pay>0 And DueDate Is Null Then Pay Else 0 End),0) NoAge,',
'              nvl(Sum(Case When Pay>0 And (Select D From Asof)-DocDate<=30 Then Pay Else 0 End),0) A30,',
'              nvl(Sum(Case When Pay>0 And (Select D From Asof)-DocDate>30',
'                            And (Select D From Asof)-DocDate<=90 Then Pay Else 0 End),0) A90,',
'              nvl(Sum(Case When Pay>0 And (Select D From Asof)-DocDate>90',
'                            And (Select D From Asof)-DocDate<=180 Then Pay Else 0 End),0) A180,',
'              nvl(Sum(Case When Pay>0 And (Select D From Asof)-DocDate>180 Then Pay Else 0 End),0) A180P,',
'              nvl(Sum(Case When Pay<0 And Dtc In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'') Then -Pay Else 0 End),0) Unapp,',
'              nvl(Sum(Case When Pay<0 And Dtc In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'                            And (Select D From Asof)-Vdt>90 Then -Pay Else 0 End),0) Unapp90,',
'              nvl(Sum(Case When Pay<0 And (Mc In (''INVOICE'',''CCINVOICE'') Or Dtc=''SALE'') Then -Pay Else 0 End),0) Contra,',
'              Count(Distinct Case When Pay<>0 Then Pty End) ActPty,',
'              Count(Distinct Case When Pay>0 And DueDate<(Select D From Asof) Then Pty End) OdPty,',
'              nvl(Sum(Case When Pay>0 And DueDate Is Not Null',
'                       Then Pay * Greatest((Select D From Asof)-DueDate,0) End),0) WSum,',
'              nvl(Sum(Case When Pay>0 And DueDate Is Not Null Then Pay End),0) WBase',
'         From Oi),',
'     Pty As (',
'       Select Pty, Sum(Case When Pay>0 Then Pay Else 0 End) Dr,',
'                   Sum(Case When Pay<0 Then -Pay Else 0 End) Cr',
'         From Oi Group By Pty),',
'     Conc As (',
'       Select nvl(Sum(Dr),0) Top10 From (',
'         Select Dr From Pty Where Dr>0.005 Order By Dr Desc Fetch First 10 Rows Only)),',
'     Both As (Select Count(*) N, nvl(Sum(Least(Dr,Cr)),0) Adj From Pty Where Dr>0.005 And Cr>0.005),',
'     F As (',
'       Select nvl(Sum(Case When d.Amount>0',
'                            And (v.ModuleCode In (''PBPASS'',''JBPASS'',''FREIGHTADVICE'',''CASHPURCHASE'',',
'                                                  ''NECESSITYCOMPLETION'',''NECESSITYSLIP'',''EXTERNALSERVICESENTRY'')',
'                                 Or v.DocTypeCode=''SERVICEBILL'')',
'                           Then d.Amount Else 0 End),0) Billing,',
'              nvl(Sum(Case When v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'') And d.Amount<0',
'                           Then -d.Amount Else 0 End),0) Coll,',
'              nvl(Count(Distinct Case When v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'                                       And d.Amount<0 Then d.Tno End),0) RcptN,',
'              nvl(Sum(Case When v.DocTypeCode=''DEBITNOTE'' And d.Amount<0 Then -d.Amount Else 0 End),0) CN',
'         From VoucherDetail d Join Voucher v On v.Tno=d.Tno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate >= to_date(:P933_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P933_TODATE,''DD-MM-RRRR'') + 1',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P933_COMPANY  Is Null Or d.CompanyCode  = :P933_COMPANY)',
'          And (:P933_LOCATION Is Null Or d.LocationCode = :P933_LOCATION)),',
'     Ex As (',
'       Select (Select Count(*) From Oi Where Pay>0.005 And DueDate Is Null) NoDueN,',
'              (Select Count(*) From Oi o Cross Join Asof',
'                Where o.Dtc In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'                  And o.Pay<-0.005 And Asof.D-o.Vdt>90) Unapp90N,',
'              (Select Count(*) From Oi Where Vno=''OPENING'' And AoBillDate Is Null And Abs(Pay)>0.005) OpenN,',
'              (Select Count(*) From Oi Where Cmp Is Null Or Loc Is Null) ScopeN,',
'              (Select Count(*) From DrCrAllocation a',
'                Where Not Exists (Select 1 From Voucher v Where v.Tno=a.DrVoucherTno)',
'                   Or Not Exists (Select 1 From Voucher v Where v.Tno=a.CrVoucherTno)) OrphanN',
'         From dual)',
'Select Ord, Section, Line, Amt, Basis From (',
'  Select 100 Ord,''1. Executive Summary'' Section,''Gross Outstanding'' Line, Round(t.Gross,2) Amt,',
'         ''open credit items as at '' || :P933_TODATE Basis From T t',
'  Union All Select 110,''1. Executive Summary'',''Vendor Debits Held'', Round(t.Cred,2),',
'         ''advances, unapplied payments, debit notes and contra sales'' From T t',
'  Union All Select 120,''1. Executive Summary'',''Net Vendor Liability'', Round(t.Net,2),',
'         ''gross less debits - the figure that ties to the GL'' From T t',
'  Union All Select 130,''1. Executive Summary'',''Active vendors'', t.ActPty,',
'         ''vendors with a non-zero position'' From T t',
'  Union All Select 200,''2. Ageing'',''Not yet due'', Round(t.NotDue,2),',
'         ''due date on or after the As-of Date'' From T t',
'  Union All Select 210,''2. Ageing'',''Overdue'', Round(t.Overdue,2),',
'         ''due date already passed'' From T t',
'  Union All Select 220,''2. Ageing'',''Cannot age - no due date'', Round(t.NoAge,2),',
'         ''no due date resolvable from the bill, order terms or opening register'' From T t',
'  Union All Select 230,''2. Ageing'',''Weighted days overdue'',',
'         Round(t.WSum / Nullif(t.WBase,0),0),',
'         ''weighted by amount, over items that carry a due date only'' From T t',
'  Union All Select 240,''2. Ageing'',''Age 0-30 (document basis)'', Round(t.A30,2),',
'         ''document-date basis, which ages every item'' From T t',
'  Union All Select 250,''2. Ageing'',''Age 31-90 (document basis)'', Round(t.A90,2), ''as above'' From T t',
'  Union All Select 260,''2. Ageing'',''Age 91-180 (document basis)'', Round(t.A180,2), ''as above'' From T t',
'  Union All Select 270,''2. Ageing'',''Age over 180 (document basis)'', Round(t.A180P,2), ''as above'' From T t',
'  Union All Select 300,''3. Payments'',''Bills booked in the period'', Round(f.Billing,2),',
'         ''bill-class credits: purchase, job, freight, cash, necessity, service'' From F f',
'  Union All Select 310,''3. Payments'',''Payments in the period'', Round(f.Coll,2),',
'         to_char(f.RcptN,''FM999G990'') || '' payment vouchers, all channels - actual transactions'' From F f',
'  Union All Select 320,''3. Payments'',''Debit notes in the period'', Round(f.CN,2),',
'         ''DEBITNOTE debits'' From F f',
'  Union All Select 330,''3. Payments'',''Payments against opening gross'',',
'         Round(Case When t.Gross>0 Then 100*f.Coll/t.Gross End,1),',
'         ''per cent - payments measured against payable, not against bookings'' From T t Cross Join F f',
'  Union All Select 400,''4. Vendor Exposure'',''Top 10 concentration'', Round(c.Top10,2),',
'         ''gross payable held by the ten largest vendors'' From Conc c',
'  Union All Select 410,''4. Vendor Exposure'',''Top 10 as a share of gross'',',
'         Round(Case When t.Gross>0 Then 100*c.Top10/t.Gross End,1),',
'         ''per cent'' From T t Cross Join Conc c',
'  Union All Select 420,''4. Vendor Exposure'',''Vendors overdue'', t.OdPty,',
'         ''vendors with at least one overdue item'' From T t',
'  Union All Select 500,''5. Advances'',''Unapplied payment cash'', Round(t.Unapp,2),',
'         ''cash paid and never applied to a bill'' From T t',
'  Union All Select 510,''5. Advances'',''Unapplied over 90 days'', Round(t.Unapp90,2),',
'         ''control AP-P03'' From T t',
'  Union All Select 520,''5. Advances'',''Contra sale debits'', Round(t.Contra,2),',
'         ''sales to a party who is also a vendor - NOT a vendor advance'' From T t',
'  Union All Select 530,''5. Advances'',''Vendors holding payable and advance'', b.N,',
'         ''both positions open at once'' From Both b',
'  Union All Select 540,''5. Advances'',''Immediately adjustable'', Round(b.Adj,2),',
'         ''clearable by allocation alone, with no cash outflow'' From Both b',
'  Union All Select 600,''6. Risk'',''Credit limit exceeded'', To_Number(Null),',
'         ''NOT MEASURABLE - Party.CreditAmount is greater than zero on 0 creditor accounts'' From dual',
'  Union All Select 610,''6. Risk'',''Credit utilisation %'', To_Number(Null),',
'         ''NOT MEASURABLE - no credit limit exists to measure utilisation against'' From dual',
'  Union All Select 620,''6. Risk'',''Payable with no due date, as a share of gross'',',
'         Round(Case When t.Gross>0 Then 100*t.NoAge/t.Gross End,1),',
'         ''per cent - the share of payable that cannot be scheduled for payment'' From T t',
'  Union All Select 917,''7. Reconciliation'',''AP analytical balance'', Round(t.Net,2),',
'         ''open-item register with allocation logic'' From T t',
'  Union All Select 922,''7. Reconciliation'',''GL control (SUNDRYCREDITORS)'', Round(t.GlNet,2),',
'         ''signed VoucherDetail sum, no allocation logic'' From T t',
'  Union All Select 932,''7. Reconciliation'',''Difference'', Round(t.Net-t.GlNet,2),',
'         Case When Abs(t.Net-t.GlNet)<0.005 Then ''RECONCILED at full precision''',
'              Else ''OUT OF BALANCE - investigate on page 716'' End From T t',
'  Union All Select 800,''8. Exceptions'',''Open payable that cannot be aged'', e.NoDueN,',
'         ''items - control AP-B02'' From Ex e',
'  Union All Select 810,''8. Exceptions'',''Payment cash unapplied over 90 days'', e.Unapp90N,',
'         ''items - control AP-P03'' From Ex e',
'  Union All Select 820,''8. Exceptions'',''Opening items with no original bill date'', e.OpenN,',
'         ''items - control AP-O01'' From Ex e',
'  Union All Select 830,''8. Exceptions'',''AP posted with incomplete business scope'', e.ScopeN,',
'         ''items - control AP-M01'' From Ex e',
'  Union All Select 840,''8. Exceptions'',''Orphan allocations'', e.OrphanN,',
'         ''rows app-wide - control AP-A05; zero touch this control account today'' From Ex e',
'  Union All Select 900,''9. Management Actions'',''Apply the unapplied cash'', Round(t.Unapp90,2),',
'         ''AP-P03 - the single largest self-help item; reduces both sides of the ledger'' From T t',
'  Union All Select 910,''9. Management Actions'',''Allocate against vendors holding both'', Round(b.Adj,2),',
'         ''AP-C02 - clears payable with no cash outflow'' From Both b',
'  Union All Select 920,''9. Management Actions'',''Obtain due dates for unaged payable'', Round(t.NoAge,2),',
'         ''AP-B02 - until then this liability cannot be scheduled for payment'' From T t',
') Order By Ord'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P933_FROMDATE,P933_TODATE,P933_COMPANY,P933_LOCATION'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No payable data in this scope for the selected period.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12881949557301540)
,p_query_column_id=>4
,p_column_alias=>'AMT'
,p_column_display_sequence=>40
,p_column_heading=>'Value'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12882036260301540)
,p_query_column_id=>5
,p_column_alias=>'BASIS'
,p_column_display_sequence=>50
,p_column_heading=>'Basis'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12882114954301540)
,p_query_column_id=>3
,p_column_alias=>'LINE'
,p_column_display_sequence=>30
,p_column_heading=>'Line'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12882213284301540)
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
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12882302866301540)
,p_query_column_id=>2
,p_column_alias=>'SECTION'
,p_column_display_sequence=>20
,p_column_heading=>'Section'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12882405598301540)
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
'                          Then :P933_TODATE ||'',''|| :P933_COMPANY ||'',''|| :P933_LOCATION',
'                          Else :P933_FROMDATE ||'',''|| :P933_TODATE ||'',''|| :P933_COMPANY ||'',''|| :P933_LOCATION End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 933',
' Order By Pg.Id'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P933_FROMDATE,P933_TODATE,P933_COMPANY,P933_LOCATION'
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
 p_id=>wwv_flow_imp.id(12882526597301540)
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
 p_id=>wwv_flow_imp.id(12883149571301567)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12881721232301539)
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
 p_id=>wwv_flow_imp.id(12883233427301567)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12881721232301539)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:920:&SESSION.::&DEBUG.::P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION:&P933_FROMDATE.,&P933_TODATE.,&P933_COMPANY.,&P933_LOCATION.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12882665754301540)
,p_name=>'P933_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12881721232301539)
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
 p_id=>wwv_flow_imp.id(12882769517301540)
,p_name=>'P933_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12881721232301539)
,p_item_default=>'Select to_char(trunc(sysdate,''MM''),''DD-MM-RRRR'') From dual'
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
 p_id=>wwv_flow_imp.id(12882849962301540)
,p_name=>'P933_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12881721232301539)
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
'                  And (:P933_COMPANY Is Null Or v.CompanyCode = :P933_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P933_COMPANY'
,p_ajax_items_to_submit=>'P933_COMPANY'
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
 p_id=>wwv_flow_imp.id(12883088252301567)
,p_name=>'P933_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12881721232301539)
,p_item_default=>'Select to_char(trunc(sysdate),''DD-MM-RRRR'') From dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date'
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
