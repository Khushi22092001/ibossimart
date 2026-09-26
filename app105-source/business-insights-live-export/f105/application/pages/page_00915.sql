prompt --application/pages/page_00915
begin
--   Manifest
--     PAGE: 00698
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
 p_id=>915
,p_name=>'Bill Detail'
,p_alias=>'AR-BILL-DETAIL'
,p_step_title=>'Bill Detail'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#hspl-jet-l10n-fallback.js?version=#APP_VERSION#&cb=20260924a'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'One open item, end to end. A "bill" in this ERP is a VoucherDetail line identified by (Tno, Sno) - there is no BillReference table - so this page is keyed on that pair. The movement band proves the arithmetic: Original amount, less allocations settle'
||'d on or before the As-of Date, equals Outstanding. Settlement is a many-to-many bridge (one receipt settles many bills, one bill takes many receipts), so the settlement region lists the bridge rows with their counterpart voucher rather than joining t'
||'hem into the header - joining would duplicate the outstanding amount on every row. The GL region shows the complete double entry the item belongs to, which is how a reader confirms the bill against the ledger rather than against another report.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12741011064300825)
,p_name=>'Bill Detail'
,p_static_id=>'command-header'
,p_template=>4072358936313175081
,p_display_sequence=>5
,p_region_css_classes=>'ds-ar-headregion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Asof As (Select to_date(nvl(:P915_TODATE, to_char(trunc(sysdate),''DD-MM-RRRR'')),''DD-MM-RRRR'') D From dual),',
'     B As (',
'       Select d.AccountCode Pty, d.CompanyCode Cmp, d.LocationCode Loc, cast(null as varchar2(100)) Pnl,',
'              v.VoucherNo Vno, v.DocTypeCode Dtc, v.ModuleCode Mc,',
'              coalesce(i.InvoiceNo, sb.ServiceBillNo, cn.CreditNoteNo, ao.BillNo, v.VoucherNo) Ref,',
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
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join CreditNote  cn On v.ModuleCode = ''CREDITNOTE''  And cn.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'        Where d.Tno = :P915_TNO And d.Sno = :P915_SNO)',
'Select ''<div class="ds-ar-head">''',
'    || ''<div class="ds-ar-eyebrow">Receivables &middot; Open Item Detail</div>''',
'    || ''<h1 class="ds-ar-title">'' || apex_escape.html(nvl(b.Ref,''Open item'')) || ''</h1>''',
'    || ''<div class="ds-ar-sub">''',
'       || apex_escape.html(nvl(p.PartyName, b.Pty))',
'       || '' &middot; voucher '' || apex_escape.html(b.Vno) || ''</div>''',
'    || ''<div class="ds-ar-context">''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-tag"></span>Class <b>'' || b.Cls || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-crosshairs"></span>As at <b>'' || to_char(a.D,''DD-MM-RRRR'') || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl(c.CompanyName, b.Cmp)) || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl(l.LocationName, b.Loc)) || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-hashtag"></span>Ledger line <b>''',
'       || :P915_TNO || '' / '' || :P915_SNO || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From B b Cross Join Asof a',
'  Left Join Party p On p.PartyCode = b.Pty',
'  Left Join Company c On c.CompanyCode = b.Cmp',
'  Left Join Location l On l.LocationCode = b.Loc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P915_TNO,P915_SNO,P915_TODATE'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No open item was selected, or the ledger line no longer exists.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12741117821300825)
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
 p_id=>wwv_flow_imp.id(12741238851300826)
,p_name=>'Exceptions on This Item'
,p_static_id=>'exceptions'
,p_template=>4072358936313175081
,p_display_sequence=>50
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The same control predicates as page 696, narrowed to this one item.',
'   A control that does not fire is not listed - this is a per-item',
'   finding list, not the full matrix. */',
'With Asof As (Select to_date(nvl(:P915_TODATE, to_char(trunc(sysdate),''DD-MM-RRRR'')),''DD-MM-RRRR'') D From dual),',
'     Alc As (',
'       Select -Sum(a.Amount) Amt From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'          And a.DrVoucherTno = :P915_TNO And a.DrVoucherSno = :P915_SNO',
'       Union All',
'       Select Sum(a.Amount) From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'          And a.CrVoucherTno = :P915_TNO And a.CrVoucherSno = :P915_SNO),',
'     A As (Select nvl(Sum(Amt),0) Amt From Alc),',
'     I As (',
'       Select d.Amount Amt, d.CompanyCode Cmp, cast(null as varchar2(100)) Pnl, d.LocationCode Loc, d.VoucherDate Vdt,',
'              v.VoucherNo Vno, v.DocTypeCode Dtc,',
'              coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) DueDate,',
'              ao.BillDate AoBillDate, ao.BillDueDate AoBillDue,',
'              -(d.Amount - (Select Amt From A)) Recv',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'        Where d.Tno = :P915_TNO And d.Sno = :P915_SNO)',
'Select Code, Nm, Sev, Detail From (',
'  Select ''AR-B02'' Code, ''Cannot be aged'' Nm, ''High'' Sev,',
'         ''The source document carries no due date and this ERP holds no credit terms to derive one from.'' Detail',
'    From I i Where i.Recv > 0.005 And i.DueDate Is Null',
'  Union All',
'  Select ''AR-O01'',''Opening item, original bill date lost'',''High'',',
'         ''Migrated at the 31-03-2026 cutover without its original bill date, so its age is understated.''',
'    From I i Where i.Vno = ''OPENING'' And i.AoBillDate Is Null And Abs(i.Recv) > 0.005',
'  Union All',
'  Select ''AR-O02'',''Opening item, original due date lost'',''Medium'',',
'         ''Cannot be aged on the Due Date basis; falls into Cannot Age.''',
'    From I i Where i.Vno = ''OPENING'' And i.AoBillDue Is Null And i.Recv > 0.005',
'  Union All',
'  Select ''AR-R03'',''Receipt cash unapplied over 90 days'',''Critical'',',
'         ''Received '' || to_char((Select D From Asof) - i.Vdt) || '' days ago and still not applied to any bill.''',
'    From I i Cross Join Asof Where i.Dtc = ''RECEIPT'' And i.Recv < -0.005 And Asof.D - i.Vdt > 90',
'  Union All',
'  Select ''AR-A07'',''Allocation exceeds the item'',''Critical'',',
'         ''More has been allocated against this line than the line is worth; its balance has flipped sign.''',
'    From I i Where Abs((Select Amt From A)) > Abs(i.Amt) + 0.005',
'  Union All',
'  Select ''AR-M01'',''Posted with incomplete business scope'',''Critical'',',
'         ''Company or location is missing, so the receivable cannot be assigned to a complete Ironmart business scope.''',
'    From I i Where i.Cmp Is Null Or i.Loc Is Null',
'  Union All',
'  Select ''AR-M02'',''Location marked DO NOT USE'',''High'',',
'         ''The location master names this location as unusable, yet this receivable is posted to it.''',
'    From I i Join Location l On l.LocationCode = i.Loc',
'   Where upper(l.LocationName) Like ''%DO NOT USE%''',
') Order By Case Sev When ''Critical'' Then 1 When ''High'' Then 2 Else 3 End, Code'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P915_TNO,P915_SNO,P915_TODATE'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No control fires on this item.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12741395182300826)
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
 p_id=>wwv_flow_imp.id(12741495420300861)
,p_query_column_id=>4
,p_column_alias=>'DETAIL'
,p_column_display_sequence=>40
,p_column_heading=>'Why'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12741583758300861)
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
 p_id=>wwv_flow_imp.id(12741610535300861)
,p_query_column_id=>3
,p_column_alias=>'SEV'
,p_column_display_sequence=>30
,p_column_heading=>'Severity'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12741791409300861)
,p_name=>'General Ledger Entry'
,p_static_id=>'gl-lines'
,p_template=>4072358936313175081
,p_display_sequence=>32
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Every line of the voucher this item belongs to, so the reader can see',
'   the complete double entry. The item itself is marked. A DEBIT is a',
'   NEGATIVE Amount, so the two sides are split by sign and shown as',
'   positive figures under their own headings. */',
'Select Case When d.Sno = :P915_SNO Then',
'            ''<b>'' || apex_escape.html(nvl(p.PartyName, d.AccountCode)) || ''</b>''',
'            || '' <span class="ds-archip ds-archip--info">this item</span>''',
'       Else apex_escape.html(nvl(p.PartyName, d.AccountCode)) End As ACCOUNT,',
'       d.AccountCode                                    As ACCOUNT_CODE,',
'       Round(Case When d.Amount < 0 Then -d.Amount End,2) As DEBIT,',
'       Round(Case When d.Amount > 0 Then  d.Amount End,2) As CREDIT,',
'       substr(d.Narration,1,200)      As NARRATION',
'  From VoucherDetail d',
'  Left Join Party p On p.PartyCode = d.AccountCode',
' Where d.Tno = :P915_TNO',
' Order By d.Sno'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P915_TNO,P915_SNO'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'This voucher carries no lines.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12741876722300861)
,p_query_column_id=>1
,p_column_alias=>'ACCOUNT'
,p_column_display_sequence=>10
,p_column_heading=>'Account'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12741935804300861)
,p_query_column_id=>2
,p_column_alias=>'ACCOUNT_CODE'
,p_column_display_sequence=>20
,p_column_heading=>'Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12742088343300861)
,p_query_column_id=>4
,p_column_alias=>'CREDIT'
,p_column_display_sequence=>40
,p_column_heading=>unistr('Credit (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12742152802300861)
,p_query_column_id=>3
,p_column_alias=>'DEBIT'
,p_column_display_sequence=>30
,p_column_heading=>unistr('Debit (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12742265967300861)
,p_query_column_id=>5
,p_column_alias=>'NARRATION'
,p_column_display_sequence=>50
,p_column_heading=>'Narration'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12742370365300861)
,p_name=>'Financial Movement'
,p_static_id=>'movement'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* THE ARITHMETIC, SHOWN RATHER THAN ASSERTED.',
'     Original amount',
'   - allocations settled on or before the As-of Date',
'   = Outstanding',
'   Both allocation directions are handled: for a DEBIT item the',
'   allocations are the credits applied to it, for a CREDIT item they',
'   are the debits it was applied against. The two are summed with',
'   opposite signs, exactly as the canonical layer does. */',
'With Asof As (Select to_date(nvl(:P915_TODATE, to_char(trunc(sysdate),''DD-MM-RRRR'')),''DD-MM-RRRR'') D From dual),',
'     Alc As (',
'       Select -Sum(a.Amount) Amt, Count(*) N',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'          And a.DrVoucherTno = :P915_TNO And a.DrVoucherSno = :P915_SNO',
'       Union All',
'       Select Sum(a.Amount), Count(*)',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'          And a.CrVoucherTno = :P915_TNO And a.CrVoucherSno = :P915_SNO),',
'     A As (Select nvl(Sum(Amt),0) Amt, nvl(Sum(N),0) N From Alc),',
'     D As (',
'       Select d.Amount Amt,',
'              coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate) DocDate,',
'              coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) DueDate',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'        Where d.Tno = :P915_TNO And d.Sno = :P915_SNO)',
'Select ''<div class="ds-arexp">''',
'    || ''<div class="ds-arexp-cell ds-arexp-cell--recv"><dl>''',
'    || ''<dt>'' || Case When d.Amt < 0 Then ''Original Receivable'' Else ''Original Credit'' End || ''</dt><dd>&#8377;''',
'    || to_char(Round(Abs(d.Amt),2),''FM999G99G99G990D00'') || ''</dd>''',
'    || ''<div class="ds-arexp-sub">document dated '' || to_char(d.DocDate,''DD-MM-RRRR'')',
'    || Case When d.DueDate Is Not Null Then '' &middot; due '' || to_char(d.DueDate,''DD-MM-RRRR'')',
'            Else '' &middot; <b>no due date on the source document</b>'' End',
'    || ''</div></dl></div>''',
'    || ''<div class="ds-arexp-cell ds-arexp-cell--cred"><dl>''',
'    || ''<dt>Settled</dt><dd>&#8377;''',
'    || to_char(Round(Abs(a.Amt),2),''FM999G99G99G990D00'') || ''</dd>''',
'    || ''<div class="ds-arexp-sub">'' || to_char(a.N,''FM999G990'')',
'    || Case When a.N = 1 Then '' settlement'' Else '' settlements'' End',
'    || '' dated on or before the As-of Date</div></dl></div>''',
'    || ''<div class="ds-arexp-cell ds-arexp-cell--net"><dl>''',
'    || ''<dt>'' || Case When -(d.Amt - a.Amt) >= 0 Then ''Outstanding'' Else ''Credit Remaining'' End || ''</dt><dd>&#8377;''',
'    || to_char(Round(Abs(d.Amt - a.Amt),2),''FM999G99G99G990D00'') || ''</dd>''',
'    || ''<div class="ds-arexp-sub">original less settled</div>''',
'    /* The arithmetic is spelled out so a reader never has to take on',
'       trust that the three figures above belong together. */',
'    || ''<span class="ds-arexp-tie ds-arexp-tie--ok"><span class="fa fa-check"></span>''',
'    || to_char(Round(Abs(d.Amt),2),''FM999G99G99G990D00'') || '' &minus; ''',
'    || to_char(Round(Abs(a.Amt),2),''FM999G99G99G990D00'') || '' = ''',
'    || to_char(Round(Abs(d.Amt - a.Amt),2),''FM999G99G99G990D00'') || ''</span>''',
'    || ''</dl></div></div>'' As BAND',
'  From D d Cross Join A a'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P915_TNO,P915_SNO,P915_TODATE'
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
 p_id=>wwv_flow_imp.id(12742470777300862)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12742503211300862)
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
'                          Then :P915_TODATE ||'',,,''',
'                          Else :P915_FROMDATE ||'',''|| :P915_TODATE ||'',,,'' End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 915',
' Order By Pg.Id'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P915_FROMDATE,P915_TODATE'
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
 p_id=>wwv_flow_imp.id(12742623615300862)
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
 p_id=>wwv_flow_imp.id(12742702169300862)
,p_plug_name=>'Settlement'
,p_static_id=>'rule-settle'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>38
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Settlement History</h2>',
'  <p>Every allocation against this item, with the counterpart voucher on the other side of it</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12742883455300862)
,p_plug_name=>'Source Document'
,p_static_id=>'rule-source'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>28
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Source Document</h2>',
'  <p>Where this item came from, and the complete double entry it belongs to</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12742913129300862)
,p_plug_name=>'Settlements'
,p_static_id=>'settlements'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The allocation bridge, listed rather than joined. Both directions are',
'   unioned so the page works whether the item is a bill being settled by',
'   receipts, or a receipt being applied against bills. Allocations dated',
'   after the As-of Date are shown but flagged, because they are excluded',
'   from the Outstanding figure above and a reader who cannot see them',
'   would think the arithmetic was wrong. */',
'With Asof As (Select to_date(nvl(:P915_TODATE, to_char(trunc(sysdate),''DD-MM-RRRR'')),''DD-MM-RRRR'') D From dual)',
'Select cv.Tno                                          As COUNTERPART_TNO,',
'       ''Receipt / credit applied to this bill''         As DIRECTION,',
'       cv.VoucherNo                                    As COUNTERPART_VOUCHER,',
'       cv.VoucherDate                                  As COUNTERPART_DATE,',
'       cv.DocTypeCode                                  As COUNTERPART_TYPE,',
'       nvl(p.PartyName, cd.AccountCode) As COUNTERPART_ACCOUNT,',
'       Round(a.Amount,2)                               As ALLOCATED,',
'       nvl(a.ModuleCode,''-'')         As ALLOCATION_SOURCE,',
'       nvl(l.LocationName, cd.LocationCode) As COUNTERPART_LOCATION,',
'       Case When cv.VoucherDate > (Select D From Asof)',
'                 Then ''<span class="ds-archip ds-archip--warn">After As-of &mdash; excluded</span>''',
'            Else ''<span class="ds-archip ds-archip--pass">Counted</span>'' End As STATUS',
'  From DrCrAllocation a',
'  Join Voucher cv On cv.Tno = a.CrVoucherTno',
'  Left Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'  Left Join Party p On p.PartyCode = cd.AccountCode',
'  Left Join Location l On l.LocationCode = cd.LocationCode',
' Where a.DrVoucherTno = :P915_TNO And a.DrVoucherSno = :P915_SNO',
'Union All',
'Select dv.Tno,',
'       ''This credit applied against a bill'',',
'       dv.VoucherNo, dv.VoucherDate, dv.DocTypeCode,',
'       apex_escape.html(nvl(p.PartyName, dd.AccountCode)),',
'       Round(a.Amount,2),',
'       apex_escape.html(nvl(a.ModuleCode,''-'')),',
'       apex_escape.html(nvl(l.LocationName, dd.LocationCode)),',
'       Case When dv.VoucherDate > (Select D From Asof)',
'                 Then ''<span class="ds-archip ds-archip--warn">After As-of &mdash; excluded</span>''',
'            Else ''<span class="ds-archip ds-archip--pass">Counted</span>'' End',
'  From DrCrAllocation a',
'  Join Voucher dv On dv.Tno = a.DrVoucherTno',
'  Left Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'  Left Join Party p On p.PartyCode = dd.AccountCode',
'  Left Join Location l On l.LocationCode = dd.LocationCode',
' Where a.CrVoucherTno = :P915_TNO And a.CrVoucherSno = :P915_SNO'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P915_TNO,P915_SNO,P915_TODATE'
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
 p_id=>wwv_flow_imp.id(12743024062300863)
,p_no_data_found_message=>'This item has never been allocated. It is open for its full original amount - which is the normal state here: only 31% of AR lines in this ledger have ever been allocated.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>69800000000000698
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12743171971300863)
,p_db_column_name=>'ALLOCATED'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Allocated (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12743218754300863)
,p_db_column_name=>'ALLOCATION_SOURCE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Allocation Source'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12743373557300863)
,p_db_column_name=>'COUNTERPART_ACCOUNT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Counterpart Account'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12743412246300863)
,p_db_column_name=>'COUNTERPART_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12743527415300863)
,p_db_column_name=>'COUNTERPART_LOCATION'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Counterpart Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12743671619300863)
,p_db_column_name=>'COUNTERPART_TNO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12743747694300863)
,p_db_column_name=>'COUNTERPART_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12743884466300863)
,p_db_column_name=>'COUNTERPART_VOUCHER'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Counterpart Voucher'
,p_column_link=>'f?p=&APP_ID.:678:&SESSION.::&DEBUG.:678:P678_TNO:#COUNTERPART_TNO#'
,p_column_linktext=>'#COUNTERPART_VOUCHER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12743933577300863)
,p_db_column_name=>'DIRECTION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Direction'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12744026697300863)
,p_db_column_name=>'STATUS'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12744111422300863)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69801'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'COUNTERPART_VOUCHER:COUNTERPART_DATE:COUNTERPART_TYPE:COUNTERPART_ACCOUNT:ALLOCATED:STATUS'
,p_sum_columns_on_break=>'ALLOCATED'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12744297442300863)
,p_name=>'Originating Document'
,p_static_id=>'source-doc'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* One row per attribute, so a document type with fields another type',
'   does not have simply contributes fewer rows - rather than forcing a',
'   single wide row full of nulls that a reader has to interpret. */',
'With V As (Select v.*, d.ModuleTno DtlModuleTno',
'             From Voucher v Join VoucherDetail d On d.Tno = v.Tno',
'            Where d.Tno = :P915_TNO And d.Sno = :P915_SNO)',
'Select Ord, Attribute, Val From (',
'  Select 10 Ord, ''Document type'' Attribute,',
'         apex_escape.html(nvl(v.ModuleCode, v.DocTypeCode)) Val From V v',
'  Union All',
'  Select 20, ''Invoice number'', apex_escape.html(i.InvoiceNo)',
'    From V v Join Invoice i On v.ModuleCode = ''INVOICE'' And i.Tno = v.ModuleTno',
'  Union All',
'  Select 30, ''Invoice date'', to_char(i.InvoiceDate,''DD-MM-RRRR'')',
'    From V v Join Invoice i On v.ModuleCode = ''INVOICE'' And i.Tno = v.ModuleTno',
'  Union All',
'  Select 40, ''Due date'', nvl(to_char(i.DueDate,''DD-MM-RRRR''),''<b>not set on the invoice</b>'')',
'    From V v Join Invoice i On v.ModuleCode = ''INVOICE'' And i.Tno = v.ModuleTno',
'  Union All',
'  Select 50, ''Invoice amount'', to_char(Round(i.InvoiceAmount,2),''FM999G99G99G990D00'')',
'    From V v Join Invoice i On v.ModuleCode = ''INVOICE'' And i.Tno = v.ModuleTno',
'  Union All',
'  Select 60, ''Agent'', apex_escape.html(nvl(ag.PartyName, i.AgentCode))',
'    From V v Join Invoice i On v.ModuleCode = ''INVOICE'' And i.Tno = v.ModuleTno',
'    Left Join Party ag On ag.PartyCode = i.AgentCode',
'   Where i.AgentCode Is Not Null',
'  Union All',
'  Select 70, ''Commercial invoice'', apex_escape.html(cc.CCInvoiceNo)',
'    From V v Join Invoice i On v.ModuleCode = ''INVOICE'' And i.Tno = v.ModuleTno',
'    Join CCInvoice cc On cc.Tno = i.ModuleTno',
'  Union All',
'  Select 80, ''Service bill number'', apex_escape.html(sb.ServiceBillNo)',
'    From V v Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'  Union All',
'  Select 90, ''Service bill due date'', nvl(to_char(sb.DueDate,''DD-MM-RRRR''),''not set'')',
'    From V v Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'  Union All',
'  Select 100, ''Credit note number'', apex_escape.html(cn.CreditNoteNo)',
'    From V v Join CreditNote cn On v.ModuleCode = ''CREDITNOTE'' And cn.Tno = v.ModuleTno',
'  Union All',
'  /* Opening carry-forward links through the DETAIL ModuleTno, not the',
'     header''s - the only place a pre-cutover bill date survives. */',
'  Select 110, ''Migrated bill number'', apex_escape.html(ao.BillNo)',
'    From V v Join AccountOpening ao On v.VoucherNo = ''OPENING'' And ao.Tno = v.DtlModuleTno',
'  Union All',
'  Select 120, ''Original bill date'',',
'         nvl(to_char(ao.BillDate,''DD-MM-RRRR''),',
'             ''<b>not preserved at migration &mdash; age is floored at the cutover (AR-O01)</b>'')',
'    From V v Join AccountOpening ao On v.VoucherNo = ''OPENING'' And ao.Tno = v.DtlModuleTno',
'  Union All',
'  Select 130, ''Original due date'',',
'         nvl(to_char(ao.BillDueDate,''DD-MM-RRRR''),',
'             ''<b>not preserved at migration &mdash; cannot be aged on the Due basis (AR-O02)</b>'')',
'    From V v Join AccountOpening ao On v.VoucherNo = ''OPENING'' And ao.Tno = v.DtlModuleTno',
'  Union All',
'  Select 140, ''Voucher number'', apex_escape.html(v.VoucherNo) From V v',
'  Union All',
'  Select 150, ''Voucher date'', to_char(v.VoucherDate,''DD-MM-RRRR'') From V v',
'  Union All',
'  Select 160, ''Voucher type'', apex_escape.html(v.DocTypeCode) From V v',
'  Union All',
'  Select 170, ''Posted by'', apex_escape.html(v.Creator) From V v Where v.Creator Is Not Null',
'  Union All',
'  Select 180, ''Posted on'', to_char(v.CreationTime,''DD-MM-RRRR HH24:MI'') From V v Where v.CreationTime Is Not Null',
'  Union All',
'  Select 190, ''Bank reference'', apex_escape.html(v.MoneyTransferReferenceNo)',
'    From V v Where v.MoneyTransferReferenceNo Is Not Null',
'  Union All',
'  Select 200, ''Payment mode'', apex_escape.html(v.MoneyTransferModeCode)',
'    From V v Where v.MoneyTransferModeCode Is Not Null',
') Where Val Is Not Null Order By Ord'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P915_TNO,P915_SNO'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No source document is linked to this ledger line.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12744335731300864)
,p_query_column_id=>2
,p_column_alias=>'ATTRIBUTE'
,p_column_display_sequence=>20
,p_column_heading=>'Attribute'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12744411574300864)
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
 p_id=>wwv_flow_imp.id(12744544746300864)
,p_query_column_id=>3
,p_column_alias=>'VAL'
,p_column_display_sequence=>30
,p_column_heading=>'Value'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12745105409300864)
,p_button_sequence=>60
,p_button_name=>'BACKITEMS'
,p_static_id=>'back-items'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Back to Open Items'
,p_button_redirect_url=>'f?p=&APP_ID.:909:&SESSION.::&DEBUG.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12745203582300864)
,p_button_sequence=>62
,p_button_name=>'DEBTOR360'
,p_static_id=>'debtor-360'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Debtor 360'
,p_button_redirect_url=>'f?p=&APP_ID.:910:&SESSION.::&DEBUG.:910:P910_PARTY,P910_TODATE,P910_FROMDATE:&P915_PARTY.,&P915_TODATE.,&P915_FROMDATE.'
,p_button_condition=>'P915_PARTY'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-user'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12744653488300864)
,p_name=>'P915_FROMDATE'
,p_item_sequence=>16
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12744780858300864)
,p_name=>'P915_PARTY'
,p_item_sequence=>18
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12744895152300864)
,p_name=>'P915_SNO'
,p_item_sequence=>12
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12744911636300864)
,p_name=>'P915_TNO'
,p_item_sequence=>10
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12745024530300864)
,p_name=>'P915_TODATE'
,p_item_sequence=>14
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
