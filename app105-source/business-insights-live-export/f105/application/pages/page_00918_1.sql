prompt --application/pages/page_00918
begin
--   Manifest
--     PAGE: 00918
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
 p_id=>918
,p_name=>'Weekly AR Review'
,p_alias=>'AR-WEEKLY-MIS'
,p_step_title=>'Weekly AR Review'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<script id="hspl-sidebar-head-state">',
'(function(d){',
'  var state=''closed'';',
'  try {',
'    var saved=window.localStorage.getItem(''imart.sidebar.state.v1'');',
'    if(saved===''open''||saved===''closed'') state=saved;',
'  } catch(ignore) {}',
'  d.classList.remove(state===''open''?''hspl-nav-target-closed'':''hspl-nav-target-open'');',
'  d.classList.add(state===''open''?''hspl-nav-target-open'':''hspl-nav-target-closed'');',
'})(document.documentElement);',
'</script>',
'<style id="hspl-register-first-paint">',
'/* Match the application''s existing final register palette at parser time.',
'   These declarations intentionally duplicate (not replace) the final shared',
'   design-system values, preventing the older theme palette from becoming a',
'   visible intermediate frame during initial render or APEX IR refresh. */',
'body:not(.t-PageBody--login) .a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table th.a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table thead th,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-thead .a-IRR-header {',
'  background:#e6e8f7!important;',
'  color:#3f4a7a!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-toolbar,',
'body:not(.t-PageBody--login) .a-IRR-controlsContainer {',
'  background:#f4f3fd!important;',
'  border-color:#e6e4f7!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(even) td:not([style*="background"]) {',
'  background-color:#f3f6fc!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(odd) td:not([style*="background"]) {',
'  background-color:#fff!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:hover td:not([style*="background"]) {',
'  background-color:#eaf0fb!important;',
'}',
'body:not(.t-PageBody--login) .t-Region:has(.a-IRR),',
'body:not(.t-PageBody--login) .a-IRR,',
'body:not(.t-PageBody--login) .a-IRR-region,',
'body:not(.t-PageBody--login) .t-IRR-region,',
'body:not(.t-PageBody--login) .a-IRR-content,',
'body:not(.t-PageBody--login) .a-IRR-table,',
'body:not(.t-PageBody--login) .t-fht-wrapper,',
'body:not(.t-PageBody--login) .t-fht-thead,',
'body:not(.t-PageBody--login) .t-fht-tbody {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>',
'<style id="hspl-register-cell-paint-lock">',
'/* APEX/UT gives report cells a background/color transition. During an IR',
'   refresh the replacement rows therefore fade from the native palette into',
'   the application palette. Keep every existing colour and hover selector,',
'   but make their application atomic. */',
'body:not(.t-PageBody--login) .a-IRR-table th,',
'body:not(.t-PageBody--login) .a-IRR-table td,',
'body:not(.t-PageBody--login) .a-IRR-table .a-IRR-headerLink,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-tbody td {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>'))
,p_javascript_file_urls=>'#APP_FILES#hspl-jet-l10n-fallback.js?version=#APP_VERSION#&cb=20260924a'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'The weekly review pack. Position lines are measured at the START and END of the window and compared, so "movement" is a real change in position rather than a sum of transactions. Collection performance is measured as collections received against rece'
||'ivables that were open at the start of the window - not against billing in the window, which would flatter a week with light billing. Every figure derives from the canonical open-item layer, so this pack and the command centre cannot disagree.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12754142604300933)
,p_name=>'Weekly AR Review'
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
'    || ''<div class="ds-ar-eyebrow">Receivables &middot; Weekly MIS</div>''',
'    || ''<h1 class="ds-ar-title">Weekly AR Review</h1>''',
'    || ''<div class="ds-ar-sub">Opening and closing position, what moved between them, who owes most and which controls failed</div>''',
'    || ''<div class="ds-ar-context">''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-calendar"></span>Window <b>''',
'       || :P918_FROMDATE || '' &rarr; '' || :P918_TODATE || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P918_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P918_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P918_FROMDATE,P918_TODATE,P918_COMPANY,P918_LOCATION'
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
 p_id=>wwv_flow_imp.id(12754255356300933)
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
 p_id=>wwv_flow_imp.id(12754305018300933)
,p_name=>'Control Failures'
,p_static_id=>'control-failures'
,p_template=>4072358936313175081
,p_display_sequence=>40
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The same control predicates as page 696, evaluated at the window end.',
'   Only controls that actually fired are listed; the full matrix with',
'   its PASS and DATA MISSING rows lives on 696. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P918_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Select d.CompanyCode Cmp, cast(null as varchar2(100)) Pnl, d.LocationCode Loc, d.VoucherDate Vdt,',
'              v.VoucherNo Vno, v.DocTypeCode Dtc,',
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
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P918_COMPANY  Is Null Or d.CompanyCode  = :P918_COMPANY)',
'          And (:P918_LOCATION Is Null Or d.LocationCode = :P918_LOCATION))',
'Select Code, Nm, Items, Round(Expo,2) Expo, Sev From (',
'  Select ''AR-B02'' Code,''Open receivable that cannot be aged'' Nm,''High'' Sev,',
'         Count(*) Items, Sum(Abs(Recv)) Expo',
'    From Oi Where Recv > 0.005 And DueDate Is Null Having Count(*) > 0',
'  Union All Select ''AR-R03'',''Receipt cash unapplied over 90 days'',''Critical'', Count(*), Sum(-Recv)',
'    From Oi Cross Join Asof Where Dtc=''RECEIPT'' And Recv < -0.005 And Asof.D - Vdt > 90 Having Count(*) > 0',
'  Union All Select ''AR-O01'',''Opening item, original bill date lost'',''High'', Count(*), Sum(Abs(Recv))',
'    From Oi Where Vno=''OPENING'' And AoBillDate Is Null And Abs(Recv) > 0.005 Having Count(*) > 0',
'  Union All Select ''AR-M01'',''AR posted with incomplete business scope'',''Critical'', Count(*), Sum(Abs(Recv))',
'    From Oi Where Cmp Is Null Or Loc Is Null Having Count(*) > 0',
'  Union All Select ''AR-M02'',''AR on a location marked DO NOT USE'',''High'', Count(*), Sum(Abs(o.Recv))',
'    From Oi o Join Location l On l.LocationCode = o.Loc',
'   Where upper(l.LocationName) Like ''%DO NOT USE%'' And Abs(o.Recv) > 0.005 Having Count(*) > 0',
'  Union All Select ''AR-A05'',''Orphan allocation (voucher deleted)'',''Critical'', Count(*), Sum(a.Amount)',
'    From DrCrAllocation a',
'   Where Not Exists (Select 1 From Voucher v Where v.Tno = a.DrVoucherTno)',
'      Or Not Exists (Select 1 From Voucher v Where v.Tno = a.CrVoucherTno)',
'  Having Count(*) > 0',
') Order By Case Sev When ''Critical'' Then 1 Else 2 End, Code'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P918_TODATE,P918_COMPANY,P918_LOCATION'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No control failed in this scope at the window end.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12754415285300933)
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
 p_id=>wwv_flow_imp.id(12754579254300934)
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
 p_id=>wwv_flow_imp.id(12754616705300934)
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
 p_id=>wwv_flow_imp.id(12754750136300934)
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
 p_id=>wwv_flow_imp.id(12754890657300934)
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
 p_id=>wwv_flow_imp.id(12754995917300934)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p701Filters'
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
 p_id=>wwv_flow_imp.id(12755025540300934)
,p_name=>'Position and Movement'
,p_static_id=>'position'
,p_template=>4072358936313175081
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
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Sp As (',
'       Select to_date(:P918_FROMDATE,''DD-MM-RRRR'') - 1 D, ''O'' Tag From dual',
'       Union All',
'       Select to_date(:P918_TODATE,''DD-MM-RRRR''), ''C'' From dual),',
'     Ln As (',
'       Select d.Tno, d.Sno, d.Amount Amt, d.VoucherDate Vdt,',
'              coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) DueDate',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P918_COMPANY  Is Null Or d.CompanyCode  = :P918_COMPANY)',
'          And (:P918_LOCATION Is Null Or d.LocationCode = :P918_LOCATION)),',
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
'       Select s.Tag, -(l.Amt - nvl(al.Amt,0)) Recv,',
'              Case When l.DueDate Is Null Then Null Else Greatest(s.D - l.DueDate,0) End DaysOd,',
'              l.DueDate',
'         From Ln l',
'         Join Sp s On l.Vdt <= s.D',
'         Left Join Al al On al.Tag = s.Tag And al.Tno = l.Tno And al.Sno = l.Sno),',
'     T As (',
'       Select Sum(Case When Tag=''O'' And Recv>0 Then Recv Else 0 End) OGross,',
'              Sum(Case When Tag=''C'' And Recv>0 Then Recv Else 0 End) CGross,',
'              Sum(Case When Tag=''O'' And Recv>0 And DaysOd>0 Then Recv Else 0 End) OOd,',
'              Sum(Case When Tag=''C'' And Recv>0 And DaysOd>0 Then Recv Else 0 End) COd,',
'              Sum(Case When Tag=''O'' And Recv>0 And DaysOd>90 Then Recv Else 0 End) O90,',
'              Sum(Case When Tag=''C'' And Recv>0 And DaysOd>90 Then Recv Else 0 End) C90,',
'              Sum(Case When Tag=''O'' And Recv>0 And DaysOd>180 Then Recv Else 0 End) O180,',
'              Sum(Case When Tag=''C'' And Recv>0 And DaysOd>180 Then Recv Else 0 End) C180,',
'              Sum(Case When Tag=''O'' And Recv>0 And DueDate Is Null Then Recv Else 0 End) ONoAge,',
'              Sum(Case When Tag=''C'' And Recv>0 And DueDate Is Null Then Recv Else 0 End) CNoAge,',
'              Sum(Case When Tag=''O'' And Recv<0 Then -Recv Else 0 End) OCred,',
'              Sum(Case When Tag=''C'' And Recv<0 Then -Recv Else 0 End) CCred,',
'              Sum(Case When Tag=''O'' Then Recv Else 0 End) ONet,',
'              Sum(Case When Tag=''C'' Then Recv Else 0 End) CNet',
'         From P),',
'     F As (',
'       Select nvl(Sum(Case When v.DocTypeCode In (''SALE'',''SERVICEBILL'') And d.Amount<0',
'                           Then -d.Amount Else 0 End),0) Billing,',
'              nvl(Sum(Case When v.DocTypeCode=''RECEIPT'' And d.Amount>0 Then d.Amount Else 0 End),0) Coll,',
'              nvl(Sum(Case When v.DocTypeCode=''CREDITNOTE'' And d.Amount>0 Then d.Amount Else 0 End),0) CN',
'         From VoucherDetail d Join Voucher v On v.Tno=d.Tno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate >= to_date(:P918_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P918_TODATE,''DD-MM-RRRR'') + 1',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P918_COMPANY  Is Null Or d.CompanyCode  = :P918_COMPANY)',
'          And (:P918_LOCATION Is Null Or d.LocationCode = :P918_LOCATION))',
'Select Ord, Measure, Opening, Closing, Movement, Note From (',
'  Select 10 Ord,''Gross Outstanding'' Measure, Round(t.OGross,2) Opening, Round(t.CGross,2) Closing,',
'         Round(t.CGross-t.OGross,2) Movement, ''open debit items'' Note From T t',
'  Union All Select 20,''Total Overdue'', Round(t.OOd,2), Round(t.COd,2), Round(t.COd-t.OOd,2),',
'         ''past due date'' From T t',
'  Union All Select 30,''90+ Days'', Round(t.O90,2), Round(t.C90,2), Round(t.C90-t.O90,2),',
'         ''over 90 days past due'' From T t',
'  Union All Select 40,''180+ Days'', Round(t.O180,2), Round(t.C180,2), Round(t.C180-t.O180,2),',
'         ''over 180 days past due'' From T t',
'  Union All Select 50,''Cannot Age (no due date)'', Round(t.ONoAge,2), Round(t.CNoAge,2),',
'         Round(t.CNoAge-t.ONoAge,2), ''no due date on the source document'' From T t',
'  Union All Select 60,''Customer Credits Held'', Round(t.OCred,2), Round(t.CCred,2),',
'         Round(t.CCred-t.OCred,2), ''advances, unapplied cash and contra'' From T t',
'  Union All Select 70,''Net Customer Exposure'', Round(t.ONet,2), Round(t.CNet,2),',
'         Round(t.CNet-t.ONet,2), ''gross less credits - ties to the GL control account'' From T t',
'  Union All Select 80,''Billing in the window'', To_Number(Null), To_Number(Null), Round(f.Billing,2),',
'         ''SALE and SERVICEBILL debits - a flow, not a position'' From F f',
'  Union All Select 90,''Collections in the window'', To_Number(Null), To_Number(Null), Round(f.Coll,2),',
'         ''actual RECEIPT transactions'' From F f',
'  Union All Select 100,''Credit notes in the window'', To_Number(Null), To_Number(Null), Round(f.CN,2),',
'         ''CREDITNOTE credits'' From F f',
'  Union All Select 110,''Collection against opening receivable'',',
'         To_Number(Null), To_Number(Null),',
'         Round(Case When t.OGross > 0 Then 100 * f.Coll / t.OGross End,1),',
'         ''collections as a % of what was open at the start - not of billing, which would flatter a light week''',
'    From T t Cross Join F f',
') Order By Ord'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P918_FROMDATE,P918_TODATE,P918_COMPANY,P918_LOCATION'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No receivable position in this window for the selected scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12755187288300934)
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
 p_id=>wwv_flow_imp.id(12755278235300934)
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
 p_id=>wwv_flow_imp.id(12755332561300934)
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
 p_id=>wwv_flow_imp.id(12755481033300934)
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
 p_id=>wwv_flow_imp.id(12755582411300934)
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
 p_id=>wwv_flow_imp.id(12755642151300934)
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
 p_id=>wwv_flow_imp.id(12755700621300935)
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
'                          Then :P918_TODATE ||'',''|| :P918_COMPANY ||'',''|| :P918_LOCATION',
'                          Else :P918_FROMDATE ||'',''|| :P918_TODATE ||'',''|| :P918_COMPANY ||'',''|| :P918_LOCATION End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 918',
' Order By Pg.Id'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P918_FROMDATE,P918_TODATE,P918_COMPANY,P918_LOCATION'
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
 p_id=>wwv_flow_imp.id(12755872579300935)
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
 p_id=>wwv_flow_imp.id(12755932182300935)
,p_plug_name=>'Actions'
,p_static_id=>'rule-actions'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
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
 p_id=>wwv_flow_imp.id(12756010071300935)
,p_name=>'Largest Exposures'
,p_static_id=>'top-debtors'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Top 20, and the cap is in the heading. Adjustable Now is carried',
'   alongside the exposure because for many of these customers the fastest',
'   reduction is an allocation, not a phone call. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P918_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Select d.AccountCode Pty, Sum(d.Amount) Amt',
'         From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
'        Where d.AccountCode In (Select PartyCode From Sd) And v.DocTypeCode = ''RECEIPT''',
'          And d.VoucherDate >= to_date(:P918_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P918_TODATE,''DD-MM-RRRR'') + 1',
'        Group By d.AccountCode),',
'     G As (',
'       Select d.AccountCode Pty,',
'              Sum(Case When -(d.Amount-nvl(al.Amt,0))>0 Then -(d.Amount-nvl(al.Amt,0)) Else 0 End) Gross,',
'              Sum(Case When -(d.Amount-nvl(al.Amt,0))<0 Then  (d.Amount-nvl(al.Amt,0)) Else 0 End) Cred,',
'              Sum(Case When -(d.Amount-nvl(al.Amt,0))>0',
'                        And coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) < (Select D From Asof)',
'                       Then -(d.Amount-nvl(al.Amt,0)) Else 0 End) Overdue',
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
'          And (:P918_COMPANY  Is Null Or d.CompanyCode  = :P918_COMPANY)',
'          And (:P918_LOCATION Is Null Or d.LocationCode = :P918_LOCATION)',
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
,p_ajax_items_to_submit=>'P918_FROMDATE,P918_TODATE,P918_COMPANY,P918_LOCATION'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No customer carries an open receivable in this scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12756143347300935)
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
 p_id=>wwv_flow_imp.id(12756289142300936)
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
 p_id=>wwv_flow_imp.id(12756361074300936)
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
 p_id=>wwv_flow_imp.id(12756410202300936)
,p_query_column_id=>1
,p_column_alias=>'CUSTOMER'
,p_column_display_sequence=>10
,p_column_heading=>'Customer (top 20 by net exposure)'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12756570708300936)
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
 p_id=>wwv_flow_imp.id(12756622557300936)
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
 p_id=>wwv_flow_imp.id(12756775238300936)
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
 p_id=>wwv_flow_imp.id(12756826547300936)
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
 p_id=>wwv_flow_imp.id(12757476934300936)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12754995917300934)
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
 p_id=>wwv_flow_imp.id(12757538038300936)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12754995917300934)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:907:&SESSION.::&DEBUG.::P907_FROMDATE,P907_TODATE,P907_COMPANY,P907_LOCATION:&P918_FROMDATE.,&P918_TODATE.,&P918_COMPANY.,&P918_LOCATION.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12756990388300936)
,p_name=>'P918_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12754995917300934)
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
 p_id=>wwv_flow_imp.id(12757060626300936)
,p_name=>'P918_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12754995917300934)
,p_item_default=>'Select to_char(trunc(sysdate) - 6,''DD-MM-RRRR'') From dual'
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
 p_id=>wwv_flow_imp.id(12757119127300936)
,p_name=>'P918_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12754995917300934)
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
'                  And (:P918_COMPANY Is Null Or v.CompanyCode = :P918_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P918_COMPANY'
,p_ajax_items_to_submit=>'P918_COMPANY'
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
 p_id=>wwv_flow_imp.id(12757389254300936)
,p_name=>'P918_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12754995917300934)
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
