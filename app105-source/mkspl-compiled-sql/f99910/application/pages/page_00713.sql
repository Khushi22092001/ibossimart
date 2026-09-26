prompt --application/pages/page_00713
begin
--   Manifest
--     PAGE: 00713
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
 p_id=>713
,p_name=>'Advances and Unapplied Payments'
,p_alias=>'AP-ADVANCES'
,p_step_title=>'Advances and Unapplied Payments'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(9965433630286257)
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'Vendor debits held - payments made and never applied, sales to vendors, debit notes, opening debits - and how much payable could be cleared by allocating them. This is the largest actionable position in this ledger: only a third of AP lines have ever'
||' been allocated, so cash sits paid-but-unapplied on one row while a bill sits open on another. Vendor debits are NOT netted into gross payable anywhere in this dashboard - they are a separate balance with a separate cause. Contra Sale debits are show'
||'n separately again, because a sale to a party who is also a vendor is a receivable in commercial terms, not a vendor advance, and settling it against purchases is a commercial decision.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12843141794301346)
,p_plug_name=>'What adjustable means'
,p_static_id=>'adjust-note'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>24
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-apnote"><span class="fa fa-magic"></span><div>',
'  <b>&ldquo;Immediately Adjustable&rdquo; is the lesser of payable and debit, per vendor.</b>',
'  It is the amount of payable that could be cleared by allocating money the vendor already holds &mdash;',
'  no payment run, no cash movement, just a settlement entry. It is <b>not</b> an instruction to post one:',
'  contra-sale debits in particular represent a commercial position, not a vendor advance,',
'  and are shown as their own KPI for that reason.',
'</div></div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12843208436301346)
,p_name=>'Advances and Unapplied Payments'
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
'    || ''<div class="ds-ap-eyebrow">Payables &middot; Vendor Advances</div>''',
'    || ''<h1 class="ds-ap-title">Advances &amp; Unapplied Payments</h1>''',
'    || ''<div class="ds-ap-sub">Where the vendor already holds the company''''s money, and how much payable that money could clear today</div>''',
'    || ''<div class="ds-ap-context">''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-crosshairs"></span>Held as at <b>'' || :P713_TODATE || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P713_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P713_LOCATION),''All locations'')) || ''</b></span>''',
'    || Case When :P713_BOTH = ''Y'' Then',
'            ''<span class="ds-ap-chip ds-ap-chip--warn"><span class="fa fa-filter"></span>Showing <b>vendors holding payable and advance together</b></span>'' End',
'    || ''<span class="ds-ap-chip"><span class="fa fa-shield"></span>Panel <b>''',
'       || Case When (Select GetUserPanelAB_apex() From dual) Is Not Null',
'               Then (Select GetUserPanelAB_apex() From dual) || '' (enforced)''',
'               When :P713_PANEL Is Not Null Then :P713_PANEL Else ''A + B'' End || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P713_FROMDATE,P713_TODATE,P713_COMPANY,P713_LOCATION,P713_PANEL,P713_BOTH'
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
 p_id=>wwv_flow_imp.id(12843335173301346)
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
 p_id=>wwv_flow_imp.id(12843468372301346)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p713Filters'
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
 p_id=>wwv_flow_imp.id(12843510465301346)
,p_name=>'Vendor Credit KPIs'
,p_static_id=>'kpi-strip'
,p_template=>4502917002193490937
,p_display_sequence=>20
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-kpiwrap--5up'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P713_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Select d.AccountCode Pty, d.VoucherDate Vdt,',
'              (d.Amount - nvl(al.Amt,0)) Pay,',
'              Case When v.VoucherNo = ''OPENING''   Then ''Opening Debit''',
'                   When v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'                                                  Then ''Payment to Vendor''',
'                   When v.ModuleCode In (''INVOICE'',''CCINVOICE'')',
'                     Or v.DocTypeCode = ''SALE''    Then ''Contra Sale''',
'                   When v.ModuleCode = ''DEBITNOTE''',
'                     Or v.DocTypeCode = ''DEBITNOTE'' Then ''Debit Note''',
'                   Else ''Other'' End Cls',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P713_PANEL    Is Null Or d.Panel        = :P713_PANEL)',
'          And (:P713_COMPANY  Is Null Or d.CompanyCode  = :P713_COMPANY)',
'          And (:P713_LOCATION Is Null Or d.LocationCode = :P713_LOCATION)),',
'     Part As (',
'       /* Partial Residual is the debit still sitting on a payment that',
'          HAS been allocated at least once - a genuinely different thing',
'          from a payment nobody ever touched. The two together make the',
'          unapplied total, so both are shown rather than one standing',
'          for the other. A payment line is a DEBIT, so its allocations',
'          sit on the Dr side and the bill it cleared is the Cr side. */',
'       Select nvl(Sum(Case When al.N > 0 Then -d.Amount - al.Amt Else 0 End),0) Residual,',
'              Count(Case When al.N > 0 And -d.Amount - al.Amt > 0.005 Then 1 End) ResidualN,',
'              nvl(Sum(al.LagW),0) LagW, nvl(Sum(al.Amt),0) AppliedAmt',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Join (Select a.DrVoucherTno Tno, a.DrVoucherSno Sno,',
'                      Sum(a.Amount) Amt, Count(*) N,',
'                      Sum(a.Amount * (dv.VoucherDate - cv.VoucherDate)) LagW',
'                 From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'                Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'                  And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'                Group By a.DrVoucherTno, a.DrVoucherSno) al',
'           On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'          And d.Amount < 0',
'          And d.VoucherDate <= Asof.D',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P713_PANEL    Is Null Or d.Panel        = :P713_PANEL)',
'          And (:P713_COMPANY  Is Null Or d.CompanyCode  = :P713_COMPANY)',
'          And (:P713_LOCATION Is Null Or d.LocationCode = :P713_LOCATION)),',
'     P As (Select Pty, Sum(Case When Pay > 0 Then Pay Else 0 End) Dr,',
'                       Sum(Case When Pay < 0 Then -Pay Else 0 End) Cr',
'             From Oi Group By Pty),',
'     T As (',
'       Select nvl(Sum(Case When Pay < 0 Then -Pay Else 0 End),0) Cred,',
'              nvl(Sum(Case When Pay < 0 And Cls = ''Payment to Vendor'' Then -Pay Else 0 End),0) Unapp,',
'              nvl(Sum(Case When Pay < 0 And Cls = ''Contra Sale'' Then -Pay Else 0 End),0) Contra,',
'              nvl(Sum(Case When Pay < 0 And Cls = ''Opening Debit'' Then -Pay Else 0 End),0) OpenCr,',
'              nvl(Sum(Case When Pay < 0 And Cls = ''Payment to Vendor''',
'                            And (Select D From Asof) - Vdt > 30 Then -Pay Else 0 End),0) Over30,',
'              nvl(Sum(Case When Pay < 0 And Cls = ''Payment to Vendor''',
'                            And (Select D From Asof) - Vdt > 90 Then -Pay Else 0 End),0) Over90,',
'              Min(Case When Pay < 0 And Cls = ''Payment to Vendor'' Then Vdt End) Oldest',
'         From Oi),',
'     B As (Select Count(*) N, nvl(Sum(Least(Dr,Cr)),0) Adj, nvl(Sum(Greatest(Dr-Cr,0)),0) Need',
'             From P Where Dr > 0.005 And Cr > 0.005)',
'Select ''<div class="ds-kpi ds-kpi--violet" title="Every open credit balance on a vendor account, whatever its cause.">''',
'    || ''<span class="ds-kpi-ic fa fa-inbox"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Total Vendor Credits</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Cred >= 10000000 Then to_char(Round(t.Cred/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Cred/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">held as at '' || :P713_TODATE || ''</div></div></div>'' As K1,',
'       ''<div class="ds-kpi ds-kpi--risk" title="Payment lines with an open debit balance - cash paid and never applied to any bill.">''',
'    || ''<span class="ds-kpi-ic fa fa-hand-o-up"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Unapplied Payments</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Unapp >= 10000000 Then to_char(Round(t.Unapp/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Unapp/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">oldest ''',
'    || nvl(to_char(t.Oldest,''DD-MM-RRRR''),''&mdash;'') || ''</div></div></div>'' As K2,',
'       ''<div class="ds-kpi ds-kpi--amber" title="Unapplied payment cash older than 90 days. Control AP-P03.">''',
'    || ''<span class="ds-kpi-ic fa fa-hourglass-end"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Unapplied Over 90 Days</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Over90 >= 10000000 Then to_char(Round(t.Over90/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Over90/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">over 30 days &#8377;''',
'    || Case When t.Over30 >= 10000000 Then to_char(Round(t.Over30/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Over30/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div></div></div>'' As K3,',
'       /* Contra purchase is separated deliberately. It is a credit on a',
'          vendor account, but it arises from buying FROM that party -',
'          it is not an advance and cannot be applied to a sales invoice',
'          without a commercial decision. */',
'       ''<div class="ds-kpi ds-kpi--struct" title="Credits arising from purchases from a party who is also a vendor. Not a vendor advance.">''',
'    || ''<span class="ds-kpi-ic fa fa-exchange"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Contra Sale Debits</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Contra >= 10000000 Then to_char(Round(t.Contra/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Contra/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">not an advance &middot; shown apart from cash</div></div></div>'' As K4,',
'       ''<div class="ds-kpi ds-kpi--gold" title="Vendors holding an open payable AND an open credit at the same time.">''',
'    || ''<span class="ds-kpi-ic fa fa-random"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Vendors With AR + Credit</div><div class="ds-kpi-n">''',
'    || to_char(b.N,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">both positions open simultaneously</div></div></div>'' As K5,',
'       ''<div class="ds-kpi ds-kpi--ok" title="The lesser of payable and debit, summed per vendor. This much payable can be cleared by allocation alone - no cash needed.">''',
'    || ''<span class="ds-kpi-ic fa fa-magic"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Immediately Adjustable</div><div class="ds-kpi-n">&#8377;''',
'    || Case When b.Adj >= 10000000 Then to_char(Round(b.Adj/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(b.Adj/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">clearable by allocation, not by cash</div></div></div>'' As K6,',
'       ''<div class="ds-kpi ds-kpi--struct" title="Debit left on a payment that HAS been allocated at least once - distinct from a payment nobody ever touched. The two together make the total unapplied payments.">''',
'    || ''<span class="ds-kpi-ic fa fa-adjust"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Partial Residual</div><div class="ds-kpi-n">&#8377;''',
'    || Case When pr.Residual >= 10000000 Then to_char(Round(pr.Residual/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(pr.Residual/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">on '' || to_char(pr.ResidualN,''FM999G990'')',
'    || '' partly-applied payments</div></div></div>'' As K7,',
'       ''<div class="ds-kpi ds-kpi--teal" title="Amount-weighted days between a bill and the payment that settled it. Measured only over allocations that exist - unapplied cash has no lag and is excluded from both sides rather than counted as zero.">''',
'    || ''<span class="ds-kpi-ic fa fa-clock-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Average Allocation Lag</div><div class="ds-kpi-n">''',
'    || nvl(to_char(Round(pr.LagW / Nullif(pr.AppliedAmt,0),0),''FM999G990''),''&mdash;'')',
'    || '' <span style="font-size:15px">days</span></div>''',
'    || ''<div class="ds-kpi-sub">weighted by amount, over applied payments only</div></div></div>'' As K8',
'  From T t Cross Join B b Cross Join Part pr'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P713_FROMDATE,P713_TODATE,P713_COMPANY,P713_LOCATION,P713_PANEL'
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
 p_id=>wwv_flow_imp.id(12843695440301346)
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
 p_id=>wwv_flow_imp.id(12843765835301346)
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
 p_id=>wwv_flow_imp.id(12843803861301346)
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
 p_id=>wwv_flow_imp.id(12843925192301346)
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
 p_id=>wwv_flow_imp.id(12844031842301346)
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
 p_id=>wwv_flow_imp.id(12844116457301346)
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
 p_id=>wwv_flow_imp.id(12844219365301346)
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
 p_id=>wwv_flow_imp.id(12844367892301346)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12844465780301346)
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
'                          Then :P713_TODATE ||'',''|| :P713_COMPANY ||'',''|| :P713_LOCATION ||'',''|| :P713_PANEL',
'                          Else :P713_FROMDATE ||'',''|| :P713_TODATE ||'',''|| :P713_COMPANY ||'',''|| :P713_LOCATION ||'',''|| :P713_PANEL End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 713',
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
'            And b.PageID <> 695',
'            And (upper(c.BossUserName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)',
'                 Or upper(c.LoginName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)))'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P713_FROMDATE,P713_TODATE,P713_COMPANY,P713_LOCATION,P713_PANEL'
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
 p_id=>wwv_flow_imp.id(12844522798301346)
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
 p_id=>wwv_flow_imp.id(12844625833301346)
,p_plug_name=>'Vendors Holding Debits'
,p_static_id=>'vendors'
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
'     Asof As (Select to_date(:P713_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Select d.AccountCode Pty, d.CompanyCode Cmp, d.LocationCode Loc, d.VoucherDate Vdt,',
'              (d.Amount - nvl(al.Amt,0)) Pay,',
'              Case When v.VoucherNo = ''OPENING''     Then ''Opening Debit''',
'                   When v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'                                                    Then ''Payment to Vendor''',
'                   When v.ModuleCode In (''INVOICE'',''CCINVOICE'')',
'                     Or v.DocTypeCode = ''SALE''      Then ''Contra Sale''',
'                   When v.ModuleCode = ''DEBITNOTE''',
'                     Or v.DocTypeCode = ''DEBITNOTE'' Then ''Debit Note''',
'                   Else ''Other'' End Cls',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P713_PANEL    Is Null Or d.Panel        = :P713_PANEL)',
'          And (:P713_COMPANY  Is Null Or d.CompanyCode  = :P713_COMPANY)',
'          And (:P713_LOCATION Is Null Or d.LocationCode = :P713_LOCATION)),',
'     G As (',
'       Select Pty, Max(Cmp) Cmp, Max(Loc) Loc,',
'              Sum(Case When Pay > 0 Then Pay Else 0 End) Dr,',
'              Sum(Case When Pay < 0 Then -Pay Else 0 End) Cr,',
'              Sum(Case When Pay < 0 And Cls = ''Payment to Vendor'' Then -Pay Else 0 End) Cash,',
'              Sum(Case When Pay < 0 And Cls = ''Contra Sale'' Then -Pay Else 0 End) Contra,',
'              Sum(Case When Pay < 0 And Cls = ''Debit Note'' Then -Pay Else 0 End) CNote,',
'              Sum(Case When Pay < 0 And Cls = ''Opening Debit'' Then -Pay Else 0 End) OpenCr,',
'              Sum(Case When Pay < 0 And Cls = ''Payment to Vendor''',
'                        And (Select D From Asof) - Vdt > 90 Then -Pay Else 0 End) Cash90,',
'              Min(Case When Pay < 0 Then Vdt End) OldestCr',
'         From Oi Group By Pty)',
'Select g.Pty                                          As PARTY_CODE,',
'       nvl(p.PartyName, g.Pty)      As CUSTOMER,',
'       nvl(c.CompanyName, g.Cmp)    As COMPANY,',
'       nvl(l.LocationName, g.Loc)   As LOCATION,',
'       Round(g.Dr,2)                                  As RECEIVABLE,',
'       Round(g.Cr,2)                                  As CREDIT_TOTAL,',
'       Round(g.Cash,2)                                As UNAPPLIED_CASH,',
'       Round(g.Cash90,2)                              As UNAPPLIED_OVER_90,',
'       Round(g.CNote,2)                               As CREDIT_NOTES,',
'       Round(g.Contra,2)                              As CONTRA_PURCHASE,',
'       Round(g.OpenCr,2)                              As OPENING_CREDIT,',
'       Round(Least(g.Dr, g.Cr),2)                     As ADJUSTABLE_NOW,',
'       Round(Greatest(g.Dr - g.Cr,0),2)               As COLLECTION_NEEDED,',
'       Round(g.Dr - g.Cr,2)                           As NET_EXPOSURE,',
'       g.OldestCr                                     As OLDEST_CREDIT,',
'       Case When g.Dr > 0.005 And g.Cr > 0.005',
'                 Then ''<span class="ds-apchip ds-apchip--warn">AR + Credit</span>''',
'            Else ''<span class="ds-apchip ds-apchip--dr">Credit only</span>'' End As POSITION',
'  From G g',
'  Left Join Party p On p.PartyCode = g.Pty',
'  Left Join Company c On c.CompanyCode = g.Cmp',
'  Left Join Location l On l.LocationCode = g.Loc',
' Where g.Cr > 0.005',
'   And (nvl(:P713_BOTH,''N'') <> ''Y'' Or g.Dr > 0.005)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P713_FROMDATE,P713_TODATE,P713_COMPANY,P713_LOCATION,P713_PANEL,P713_BOTH'
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
 p_id=>wwv_flow_imp.id(12844742726301347)
,p_max_row_count=>'200000'
,p_no_data_found_message=>'No vendor holds an open credit in this scope as at the As-of Date.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>69500000000000695
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12844872578301347)
,p_db_column_name=>'ADJUSTABLE_NOW'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Adjustable Now (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12844995055301347)
,p_db_column_name=>'COLLECTION_NEEDED'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Net Payment Needed (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12845034940301347)
,p_db_column_name=>'COMPANY'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12845198960301347)
,p_db_column_name=>'CONTRA_PURCHASE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Contra Sale (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12845224342301347)
,p_db_column_name=>'CREDIT_NOTES'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Credit Notes (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12845313636301347)
,p_db_column_name=>'CREDIT_TOTAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Credit Held (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12845418906301347)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vendor'
,p_column_link=>'f?p=&APP_ID.:711:&SESSION.::&DEBUG.:711:P711_PARTY,P711_FROMDATE,P711_TODATE,P711_COMPANY,P711_LOCATION,P711_PANEL:#PARTY_CODE#,&P713_FROMDATE.,&P713_TODATE.,&P713_COMPANY.,&P713_LOCATION.,&P713_PANEL.'
,p_column_linktext=>'#CUSTOMER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12845526005301347)
,p_db_column_name=>'LOCATION'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12845618054301347)
,p_db_column_name=>'NET_EXPOSURE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('Net Exposure (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12845795792301347)
,p_db_column_name=>'OLDEST_CREDIT'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Oldest Credit'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12845826264301347)
,p_db_column_name=>'OPENING_CREDIT'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Opening Debit (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12845976855301347)
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
 p_id=>wwv_flow_imp.id(12846037027301347)
,p_db_column_name=>'POSITION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Position'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12846183004301347)
,p_db_column_name=>'RECEIVABLE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Payable (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12846286104301347)
,p_db_column_name=>'UNAPPLIED_CASH'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Unapplied Payments (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12846338322301347)
,p_db_column_name=>'UNAPPLIED_OVER_90'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Unapplied >90d (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12846412835301347)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69501'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CUSTOMER:POSITION:RECEIVABLE:CREDIT_TOTAL:UNAPPLIED_CASH:UNAPPLIED_OVER_90:CONTRA_PURCHASE:ADJUSTABLE_NOW:COLLECTION_NEEDED:OLDEST_CREDIT'
,p_sum_columns_on_break=>'RECEIVABLE:CREDIT_TOTAL:UNAPPLIED_CASH:UNAPPLIED_OVER_90:ADJUSTABLE_NOW:COLLECTION_NEEDED'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12847101062301369)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12843468372301346)
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
 p_id=>wwv_flow_imp.id(12847226055301369)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(12843468372301346)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:708:&SESSION.::&DEBUG.::P708_FROMDATE,P708_TODATE,P708_COMPANY,P708_LOCATION,P708_PANEL:&P713_FROMDATE.,&P713_TODATE.,&P713_COMPANY.,&P713_LOCATION.,&P713_PANEL.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12846571653301368)
,p_name=>'P713_BOTH'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12843468372301346)
,p_item_default=>'N'
,p_prompt=>'Show'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Everyone holding credit;N,Only vendors with AR + credit;Y'
,p_colspan=>3
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12846699900301369)
,p_name=>'P713_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12843468372301346)
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
 p_id=>wwv_flow_imp.id(12846791380301369)
,p_name=>'P713_FROMDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12843468372301346)
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
 p_id=>wwv_flow_imp.id(12846813949301369)
,p_name=>'P713_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12843468372301346)
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
'                  And (:P713_COMPANY Is Null Or v.CompanyCode = :P713_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P713_COMPANY'
,p_ajax_items_to_submit=>'P713_COMPANY'
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
 p_id=>wwv_flow_imp.id(12846984475301369)
,p_name=>'P713_PANEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12843468372301346)
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
 p_id=>wwv_flow_imp.id(12847000583301369)
,p_name=>'P713_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12843468372301346)
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
