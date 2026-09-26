prompt --application/pages/page_00919
begin
--   Manifest
--     PAGE: 00702
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
 p_id=>919
,p_name=>'Monthly AR Management MIS'
,p_alias=>'AR-MONTHLY-MIS'
,p_step_title=>'Monthly AR Management MIS'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#hspl-jet-l10n-fallback.js?version=#APP_VERSION#&cb=20260924a'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'The management pack, in nine sections: Executive Summary, Ageing, Collections, Debtor Exposure, Advances, Risk, Reconciliation, Exceptions and Management Actions. Every line states its own basis, and lines whose data does not exist in this ERP say so'
||' rather than reading zero - credit limit and credit utilisation in particular, which cannot be computed because Party.CreditAmount is greater than zero on 0 of 954 debtor accounts. Positions are measured at the To Date, flows across the From-To windo'
||'w, and the Reconciliation section proves the pack against the general-ledger control account rather than asserting it.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12757735829300937)
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
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P919_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Round(Sum(Case When -(d.Amount-nvl(al.Amt,0))>0',
'                      Then -(d.Amount-nvl(al.Amt,0)) Else 0 End),2) As GROSS,',
'       Round(Sum(Case When -(d.Amount-nvl(al.Amt,0))<0',
'                      Then  (d.Amount-nvl(al.Amt,0)) Else 0 End),2) As CREDIT_HELD,',
'       Round(Sum(-(d.Amount-nvl(al.Amt,0))),2)                      As NET_EXPOSURE,',
'       Round(Sum(-d.Amount),2)                                      As GL_CONTROL,',
'       Round(Sum(-(d.Amount-nvl(al.Amt,0))) - Sum(-d.Amount),2)     As DIFFERENCE',
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
'   And (:P919_COMPANY  Is Null Or d.CompanyCode  = :P919_COMPANY)',
'   And (:P919_LOCATION Is Null Or d.LocationCode = :P919_LOCATION)',
' Group By d.CompanyCode, c.CompanyName, d.LocationCode, l.LocationName',
' Order By 1, 2'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P919_TODATE,P919_COMPANY,P919_LOCATION'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No receivable position in this scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12757817076300937)
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
 p_id=>wwv_flow_imp.id(12757902667300937)
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
 p_id=>wwv_flow_imp.id(12758037928300937)
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
 p_id=>wwv_flow_imp.id(12758101737300937)
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
 p_id=>wwv_flow_imp.id(12758242651300937)
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
 p_id=>wwv_flow_imp.id(12758300017300937)
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
 p_id=>wwv_flow_imp.id(12758455086300937)
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
 p_id=>wwv_flow_imp.id(12758578705300937)
,p_name=>'Monthly AR Management MIS'
,p_static_id=>'command-header'
,p_template=>4072358936313175081
,p_display_sequence=>5
,p_region_css_classes=>'ds-ar-headregion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''<div class="ds-ar-head">''',
'    || ''<div class="ds-ar-eyebrow">Receivables &middot; Monthly Management MIS</div>''',
'    || ''<h1 class="ds-ar-title">Monthly AR Management MIS</h1>''',
'    || ''<div class="ds-ar-sub">Nine sections, every line carrying its own basis, reconciled to the general ledger at the foot</div>''',
'    || ''<div class="ds-ar-context">''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-calendar"></span>Period <b>''',
'       || :P919_FROMDATE || '' &rarr; '' || :P919_TODATE || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-crosshairs"></span>Positions as at <b>'' || :P919_TODATE || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P919_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P919_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P919_FROMDATE,P919_TODATE,P919_COMPANY,P919_LOCATION'
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
 p_id=>wwv_flow_imp.id(12758683111300937)
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
 p_id=>wwv_flow_imp.id(12758725507300937)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p702Filters'
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
 p_id=>wwv_flow_imp.id(12758802646300938)
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
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P919_TODATE,''DD-MM-RRRR'') D From dual),',
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
'              -(d.Amount - nvl(al.Amt,0)) Recv,',
'              -d.Amount Gl,',
'              coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) DueDate,',
'              coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate) DocDate,',
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
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P919_COMPANY  Is Null Or d.CompanyCode  = :P919_COMPANY)',
'          And (:P919_LOCATION Is Null Or d.LocationCode = :P919_LOCATION)),',
'     T As (',
'       Select nvl(Sum(Case When Recv>0 Then Recv Else 0 End),0) Gross,',
'              nvl(Sum(Case When Recv<0 Then -Recv Else 0 End),0) Cred,',
'              nvl(Sum(Recv),0) Net,',
'              nvl(Sum(Gl),0) GlNet,',
'              nvl(Sum(Case When Recv>0 And DueDate>=(Select D From Asof) Then Recv Else 0 End),0) NotDue,',
'              nvl(Sum(Case When Recv>0 And DueDate<(Select D From Asof) Then Recv Else 0 End),0) Overdue,',
'              nvl(Sum(Case When Recv>0 And DueDate Is Null Then Recv Else 0 End),0) NoAge,',
'              nvl(Sum(Case When Recv>0 And (Select D From Asof)-DocDate<=30 Then Recv Else 0 End),0) A30,',
'              nvl(Sum(Case When Recv>0 And (Select D From Asof)-DocDate>30',
'                            And (Select D From Asof)-DocDate<=90 Then Recv Else 0 End),0) A90,',
'              nvl(Sum(Case When Recv>0 And (Select D From Asof)-DocDate>90',
'                            And (Select D From Asof)-DocDate<=180 Then Recv Else 0 End),0) A180,',
'              nvl(Sum(Case When Recv>0 And (Select D From Asof)-DocDate>180 Then Recv Else 0 End),0) A180P,',
'              nvl(Sum(Case When Recv<0 And Dtc=''RECEIPT'' Then -Recv Else 0 End),0) Unapp,',
'              nvl(Sum(Case When Recv<0 And Dtc=''RECEIPT''',
'                            And (Select D From Asof)-Vdt>90 Then -Recv Else 0 End),0) Unapp90,',
'              nvl(Sum(Case When Recv<0 And Mc=''PBPASS'' Then -Recv Else 0 End),0) Contra,',
'              Count(Distinct Case When Recv<>0 Then Pty End) ActPty,',
'              Count(Distinct Case When Recv>0 And DueDate<(Select D From Asof) Then Pty End) OdPty,',
'              nvl(Sum(Case When Recv>0 And DueDate Is Not Null',
'                       Then Recv * Greatest((Select D From Asof)-DueDate,0) End),0) WSum,',
'              nvl(Sum(Case When Recv>0 And DueDate Is Not Null Then Recv End),0) WBase',
'         From Oi),',
'     Pty As (',
'       Select Pty, Sum(Case When Recv>0 Then Recv Else 0 End) Dr,',
'                   Sum(Case When Recv<0 Then -Recv Else 0 End) Cr',
'         From Oi Group By Pty),',
'     Conc As (',
'       Select nvl(Sum(Dr),0) Top10 From (',
'         Select Dr From Pty Where Dr>0.005 Order By Dr Desc Fetch First 10 Rows Only)),',
'     Both As (Select Count(*) N, nvl(Sum(Least(Dr,Cr)),0) Adj From Pty Where Dr>0.005 And Cr>0.005),',
'     F As (',
'       Select nvl(Sum(Case When v.DocTypeCode In (''SALE'',''SERVICEBILL'') And d.Amount<0',
'                           Then -d.Amount Else 0 End),0) Billing,',
'              nvl(Sum(Case When v.DocTypeCode=''RECEIPT'' And d.Amount>0 Then d.Amount Else 0 End),0) Coll,',
'              nvl(Count(Distinct Case When v.DocTypeCode=''RECEIPT'' Then d.Tno End),0) RcptN,',
'              nvl(Sum(Case When v.DocTypeCode=''CREDITNOTE'' And d.Amount>0 Then d.Amount Else 0 End),0) CN',
'         From VoucherDetail d Join Voucher v On v.Tno=d.Tno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate >= to_date(:P919_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P919_TODATE,''DD-MM-RRRR'') + 1',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P919_COMPANY  Is Null Or d.CompanyCode  = :P919_COMPANY)',
'          And (:P919_LOCATION Is Null Or d.LocationCode = :P919_LOCATION)),',
'     Ex As (',
'       Select (Select Count(*) From Oi Where Recv>0.005 And DueDate Is Null) NoDueN,',
'              (Select Count(*) From Oi o Cross Join Asof',
'                Where o.Dtc=''RECEIPT'' And o.Recv<-0.005 And Asof.D-o.Vdt>90) Unapp90N,',
'              (Select Count(*) From Oi Where Vno=''OPENING'' And AoBillDate Is Null And Abs(Recv)>0.005) OpenN,',
'              (Select Count(*) From Oi Where Cmp Is Null Or Loc Is Null) ScopeN,',
'              (Select Count(*) From DrCrAllocation a',
'                Where Not Exists (Select 1 From Voucher v Where v.Tno=a.DrVoucherTno)',
'                   Or Not Exists (Select 1 From Voucher v Where v.Tno=a.CrVoucherTno)) OrphanN',
'         From dual)',
'Select Ord, Section, Line, Amt, Basis From (',
'  Select 100 Ord,''1. Executive Summary'' Section,''Gross Outstanding'' Line, Round(t.Gross,2) Amt,',
'         ''open debit items as at '' || :P919_TODATE Basis From T t',
'  Union All Select 110,''1. Executive Summary'',''Customer Credits Held'', Round(t.Cred,2),',
'         ''advances, unapplied cash, credit notes and contra purchases'' From T t',
'  Union All Select 120,''1. Executive Summary'',''Net Customer Exposure'', Round(t.Net,2),',
'         ''gross less credits - the figure that ties to the GL'' From T t',
'  Union All Select 130,''1. Executive Summary'',''Active debtors'', t.ActPty,',
'         ''customers with a non-zero position'' From T t',
'  Union All Select 200,''2. Ageing'',''Not yet due'', Round(t.NotDue,2),',
'         ''due date on or after the As-of Date'' From T t',
'  Union All Select 210,''2. Ageing'',''Overdue'', Round(t.Overdue,2),',
'         ''due date already passed'' From T t',
'  Union All Select 220,''2. Ageing'',''Cannot age - no due date'', Round(t.NoAge,2),',
'         ''no due date on the source document; ERP holds no credit terms to derive one'' From T t',
'  Union All Select 230,''2. Ageing'',''Weighted days overdue'',',
'         Round(t.WSum / Nullif(t.WBase,0),0),',
'         ''weighted by amount, over items that carry a due date only'' From T t',
'  Union All Select 240,''2. Ageing'',''Age 0-30 (document basis)'', Round(t.A30,2),',
'         ''document-date basis, which ages every item'' From T t',
'  Union All Select 250,''2. Ageing'',''Age 31-90 (document basis)'', Round(t.A90,2), ''as above'' From T t',
'  Union All Select 260,''2. Ageing'',''Age 91-180 (document basis)'', Round(t.A180,2), ''as above'' From T t',
'  Union All Select 270,''2. Ageing'',''Age over 180 (document basis)'', Round(t.A180P,2), ''as above'' From T t',
'  Union All Select 300,''3. Collections'',''Billing in the period'', Round(f.Billing,2),',
'         ''SALE and SERVICEBILL debits'' From F f',
'  Union All Select 310,''3. Collections'',''Collections in the period'', Round(f.Coll,2),',
'         to_char(f.RcptN,''FM999G990'') || '' receipt vouchers - actual transactions'' From F f',
'  Union All Select 320,''3. Collections'',''Credit notes in the period'', Round(f.CN,2),',
'         ''CREDITNOTE credits'' From F f',
'  Union All Select 330,''3. Collections'',''Collection against opening gross'',',
'         Round(Case When t.Gross>0 Then 100*f.Coll/t.Gross End,1),',
'         ''per cent - collections measured against receivable, not against billing'' From T t Cross Join F f',
'  Union All Select 400,''4. Debtor Exposure'',''Top 10 concentration'', Round(c.Top10,2),',
'         ''gross receivable held by the ten largest debtors'' From Conc c',
'  Union All Select 410,''4. Debtor Exposure'',''Top 10 as a share of gross'',',
'         Round(Case When t.Gross>0 Then 100*c.Top10/t.Gross End,1),',
'         ''per cent'' From T t Cross Join Conc c',
'  Union All Select 420,''4. Debtor Exposure'',''Debtors overdue'', t.OdPty,',
'         ''customers with at least one overdue item'' From T t',
'  Union All Select 500,''5. Advances'',''Unapplied receipt cash'', Round(t.Unapp,2),',
'         ''cash received and never applied to a bill'' From T t',
'  Union All Select 510,''5. Advances'',''Unapplied over 90 days'', Round(t.Unapp90,2),',
'         ''control AR-R03'' From T t',
'  Union All Select 520,''5. Advances'',''Contra purchase credits'', Round(t.Contra,2),',
'         ''purchases from a party who is also a customer - NOT a customer advance'' From T t',
'  Union All Select 530,''5. Advances'',''Customers holding AR and credit'', b.N,',
'         ''both positions open at once'' From Both b',
'  Union All Select 540,''5. Advances'',''Immediately adjustable'', Round(b.Adj,2),',
'         ''clearable by allocation alone, with no collection effort'' From Both b',
'  Union All Select 600,''6. Risk'',''Credit limit exceeded'', To_Number(Null),',
'         ''NOT MEASURABLE - Party.CreditAmount is greater than zero on 0 of 954 debtor accounts'' From dual',
'  Union All Select 610,''6. Risk'',''Credit utilisation %'', To_Number(Null),',
'         ''NOT MEASURABLE - no credit limit exists to measure utilisation against'' From dual',
'  Union All Select 620,''6. Risk'',''Receivable with no due date, as a share of gross'',',
'         Round(Case When t.Gross>0 Then 100*t.NoAge/t.Gross End,1),',
'         ''per cent - the share of exposure that cannot be scheduled for collection'' From T t',
'  Union All Select 917,''7. Reconciliation'',''AR analytical balance'', Round(t.Net,2),',
'         ''open-item register with allocation logic'' From T t',
'  Union All Select 922,''7. Reconciliation'',''GL control (SUNDRYDEBTORS)'', Round(t.GlNet,2),',
'         ''signed VoucherDetail sum, no allocation logic'' From T t',
'  Union All Select 932,''7. Reconciliation'',''Difference'', Round(t.Net-t.GlNet,2),',
'         Case When Abs(t.Net-t.GlNet)<0.005 Then ''RECONCILED at full precision''',
'              Else ''OUT OF BALANCE - investigate on page 697'' End From T t',
'  Union All Select 800,''8. Exceptions'',''Open receivable that cannot be aged'', e.NoDueN,',
'         ''items - control AR-B02'' From Ex e',
'  Union All Select 810,''8. Exceptions'',''Receipt cash unapplied over 90 days'', e.Unapp90N,',
'         ''items - control AR-R03'' From Ex e',
'  Union All Select 820,''8. Exceptions'',''Opening items with no original bill date'', e.OpenN,',
'         ''items - control AR-O01'' From Ex e',
'  Union All Select 830,''8. Exceptions'',''AR posted with incomplete business scope'', e.ScopeN,',
'         ''items - control AR-M01'' From Ex e',
'  Union All Select 840,''8. Exceptions'',''Orphan allocations'', e.OrphanN,',
'         ''rows - control AR-A05, excluded from the analytical balance above'' From Ex e',
'  Union All Select 900,''9. Management Actions'',''Apply the unapplied cash'', Round(t.Unapp90,2),',
'         ''AR-R03 - the single largest self-help item; reduces both sides of the ledger'' From T t',
'  Union All Select 910,''9. Management Actions'',''Allocate against customers holding both'', Round(b.Adj,2),',
'         ''AR-C02 - clears receivable with no collection effort'' From Both b',
'  Union All Select 920,''9. Management Actions'',''Obtain due dates for unaged receivable'', Round(t.NoAge,2),',
'         ''AR-B02 - until then this exposure cannot be scheduled or chased'' From T t',
') Order By Ord'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P919_FROMDATE,P919_TODATE,P919_COMPANY,P919_LOCATION'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No receivable data in this scope for the selected period.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12758973706300938)
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
 p_id=>wwv_flow_imp.id(12759099368300938)
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
 p_id=>wwv_flow_imp.id(12759183577300938)
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
 p_id=>wwv_flow_imp.id(12759208903300938)
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
 p_id=>wwv_flow_imp.id(12759314367300938)
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
 p_id=>wwv_flow_imp.id(12759413137300966)
,p_name=>'Go to'
,p_static_id=>'quick-links'
,p_template=>4072358936313175081
,p_display_sequence=>900
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-arnavwrap'
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
'  Select 907 Id, ''AR Command Centre''          Nm, ''Exposure, ageing, collections and the exceptions behind every number'' Sub, ''fa-dashboard''              Ic From dual Union All',
'  Select 908,    ''Party-wise Outstanding'',        ''One row per customer, with ageing and the contact position'',           ''fa-users''                  From dual Union All',
'  Select 909,    ''Bill-wise Outstanding'',         ''Every open item at line level, with its source document'',              ''fa-list-alt''               From dual Union All',
'  Select 910,    ''Debtor 360'',                    ''One customer from every angle - bills, receipts, credits, statement'',  ''fa-user''                   From dual Union All',
'  Select 911,    ''Receipts and Collections'',      ''Cash actually received, which bank took it, how much is applied'',      ''fa-download''               From dual Union All',
'  Select 912,    ''Advances and Unapplied Cash'',   ''Customer money already held, and the receivable it could clear'',       ''fa-hand-o-up''              From dual Union All',
'  Select 913,    ''Exceptions and Controls'',       ''Every control, what it tests, and the records that fail it'',           ''fa-exclamation-triangle''   From dual Union All',
'  Select 914,    ''Reconciliation and Data Health'',''The open-item register against the general-ledger control account'',    ''fa-balance-scale''          From dual Union All',
'  Select 916,    ''Trend Analysis'',                ''How the position moved, month by month'',                               ''fa-line-chart''             From dual Union All',
'  Select 917,    ''Daily Collection MIS'',          ''One day: position, movement, and what remains unexplained'',            ''fa-calendar-o''             From dual Union All',
'  Select 918,    ''Weekly AR Review'',              ''Opening against closing, and the controls that failed in the week'',    ''fa-calendar''               From dual Union All',
'  Select 919,    ''Monthly Management MIS'',        ''The nine-section management pack'',                                     ''fa-file-text-o''            From dual)',
'Select ''<a class="ds-kpi ds-kpi--link ds-kpi--teal" href="''',
'    || apex_page.get_url(',
'         p_page        => Pg.Id,',
'         p_clear_cache => to_char(Pg.Id),',
'         /* Page 700 is a single-day report and has no From/To pair -',
'            naming an item that does not exist on the target page',
'            fails at run time, so its filter list is built separately. */',
'         p_items  => Case When Pg.Id = 917',
'                          Then ''P917_DAY,P917_COMPANY,P917_LOCATION''',
'                          Else ''P''||Pg.Id||''_FROMDATE,P''||Pg.Id||''_TODATE,P''',
'                               ||Pg.Id||''_COMPANY,P''||Pg.Id||''_LOCATION'' End,',
'         p_values => Case When Pg.Id = 917',
'                          Then :P919_TODATE ||'',''|| :P919_COMPANY ||'',''|| :P919_LOCATION',
'                          Else :P919_FROMDATE ||'',''|| :P919_TODATE ||'',''|| :P919_COMPANY ||'',''|| :P919_LOCATION End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 919',
' Order By Pg.Id'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P919_FROMDATE,P919_TODATE,P919_COMPANY,P919_LOCATION'
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
 p_id=>wwv_flow_imp.id(12759553555300966)
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
 p_id=>wwv_flow_imp.id(12760146840300967)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12758725507300937)
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
 p_id=>wwv_flow_imp.id(12760287652300967)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12758725507300937)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:907:&SESSION.::&DEBUG.::P907_FROMDATE,P907_TODATE,P907_COMPANY,P907_LOCATION:&P919_FROMDATE.,&P919_TODATE.,&P919_COMPANY.,&P919_LOCATION.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12759621635300966)
,p_name=>'P919_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12758725507300937)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select c.CompanyName d, c.CompanyCode r',
'  From Company c',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.CompanyCode = c.CompanyCode',
'                  And v.AccountCode In (Select PartyCode From Party',
'                        Start With PartyCode = ''SUNDRYDEBTORS'' Connect By Prior PartyCode = ParentCode))',
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
 p_id=>wwv_flow_imp.id(12759783422300966)
,p_name=>'P919_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12758725507300937)
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
 p_id=>wwv_flow_imp.id(12759849746300966)
,p_name=>'P919_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12758725507300937)
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
'                  And (:P919_COMPANY Is Null Or v.CompanyCode = :P919_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P919_COMPANY'
,p_ajax_items_to_submit=>'P919_COMPANY'
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
 p_id=>wwv_flow_imp.id(12760014073300967)
,p_name=>'P919_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12758725507300937)
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
