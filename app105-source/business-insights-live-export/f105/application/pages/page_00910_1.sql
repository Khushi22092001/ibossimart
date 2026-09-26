prompt --application/pages/page_00910
begin
--   Manifest
--     PAGE: 00910
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
 p_id=>910
,p_name=>'Debtor 360'
,p_alias=>'DEBTOR-360'
,p_step_title=>'Debtor 360'
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
,p_help_text=>'One customer, end to end. Open items, receipt history, ageing and the customer''s own credit position, all from the same canonical AR layer as every other page. Regions are separate so the browser is not asked to render every dataset at once. Credit l'
||'imit and utilisation come from the credit limit APPROVAL, not the customer master - Party.CreditAmount is set on none of the 962 debtor accounts. The limit in force is the latest approval granted by the As-of Date whose till-date has not passed, per '
||'company and location, and a blank till-date never expires. Coverage is small: most customers have no approval in force, and the card says so rather than showing an unlimited position as a comfortable one. A limit above Rs1,000 crore records "no limit'
||'" rather than a control and is reported as no ceiling.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12707572178300620)
,p_name=>'Advances and On-account'
,p_static_id=>'advances'
,p_template=>4072358936313175081
,p_display_sequence=>33
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Asof As (Select to_date(:P910_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Select -(d.Amount - nvl(al.Amt,0)) Recv, d.VoucherDate Vdt,',
'              Case When v.ModuleCode = ''PBPASS''     Then ''Contra Purchase''',
'                   When v.DocTypeCode = ''RECEIPT''   Then ''Unapplied Receipt''',
'                   When v.ModuleCode = ''CREDITNOTE'' Then ''Credit Note''',
'                   When v.VoucherNo = ''OPENING''     Then ''Opening Credit''',
'                   Else ''Other Credit'' End Cls',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode = :P910_PARTY',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P910_COMPANY  Is Null Or d.CompanyCode  = :P910_COMPANY)',
'          And (:P910_LOCATION Is Null Or d.LocationCode = :P910_LOCATION))',
'Select Cls                                     As CREDIT_TYPE,',
'       Count(*)                                As ITEMS,',
'       Round(Sum(-Recv),2)                     As AMOUNT,',
'       to_char(Min(Vdt),''DD-MM-RRRR'')          As OLDEST,',
'       Round(Sum(Case When (Select D From Asof) - Vdt > 90 Then -Recv Else 0 End),2) As OVER_90_DAYS',
'  From Oi Where Recv < -0.005',
' Group By Cls Order By Sum(-Recv) Desc'))
,p_display_when_condition=>'P910_PARTY'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P910_PARTY,P910_TODATE,P910_COMPANY,P910_LOCATION'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'This customer holds no open credit.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12707621801300620)
,p_query_column_id=>3
,p_column_alias=>'AMOUNT'
,p_column_display_sequence=>30
,p_column_heading=>unistr('Amount (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12707768277300620)
,p_query_column_id=>1
,p_column_alias=>'CREDIT_TYPE'
,p_column_display_sequence=>10
,p_column_heading=>'Credit Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12707808735300620)
,p_query_column_id=>2
,p_column_alias=>'ITEMS'
,p_column_display_sequence=>20
,p_column_heading=>'Items'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12707915379300620)
,p_query_column_id=>4
,p_column_alias=>'OLDEST'
,p_column_display_sequence=>40
,p_column_heading=>'Oldest'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12708040229300620)
,p_query_column_id=>5
,p_column_alias=>'OVER_90_DAYS'
,p_column_display_sequence=>50
,p_column_heading=>unistr('Over 90 Days (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12708174202300620)
,p_name=>'Ageing'
,p_static_id=>'ageing'
,p_template=>4072358936313175081
,p_display_sequence=>22
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The same bucket expression and the same stacked scale as page 690,',
'   narrowed to one customer - so a reader comparing this page against',
'   the command centre sees the same shape, not a second opinion. */',
'With Asof As (Select to_date(:P910_TODATE,''DD-MM-RRRR'') D From dual),',
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
'              Case When nvl(:P910_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) Is Null Then 7',
'                   When nvl(:P910_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) >= Asof.D Then 0',
'                   When (Case When :P910_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <=  30 Then 1',
'                   When (Case When :P910_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <=  60 Then 2',
'                   When (Case When :P910_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <=  90 Then 3',
'                   When (Case When :P910_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <= 180 Then 4',
'                   When (Case When :P910_AGEBASIS = ''DOC''',
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
'        Where d.AccountCode = :P910_PARTY',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P910_COMPANY  Is Null Or d.CompanyCode  = :P910_COMPANY)',
'          And (:P910_LOCATION Is Null Or d.LocationCode = :P910_LOCATION)),',
'     G As (Select Bkt, Sum(Recv) Amt From Aged Where Recv > 0 Group By Bkt),',
'     Tot As (Select nvl(Sum(Amt),0) T From G)',
'Select ''<div class="ds-arage"><div class="ds-arage-bar">''',
'    || nvl(ListAgg(',
'         Case When g.Amt / Nullif(tot.T,0) >= 0.0005 Then',
'           ''<div class="ds-arage-seg ds-arage-seg--b'' || g.Bkt || ''" style="width:''',
'           || to_char(Round(100 * g.Amt / tot.T,3),''FM990D000'') || ''%" title="''',
'           || Case g.Bkt When 0 Then ''Not Due'' When 1 Then ''1-30 days'' When 2 Then ''31-60 days''',
'                         When 3 Then ''61-90 days'' When 4 Then ''91-180 days'' When 5 Then ''181-365 days''',
'                         When 6 Then ''Over 365 days'' Else ''Cannot Age - no due date'' End',
'           || '': &#8377;'' || to_char(Round(g.Amt,0),''FM999G99G99G990'') || ''">''',
'           || Case When g.Amt / tot.T >= 0.08',
'                   Then to_char(Round(100 * g.Amt / tot.T,0),''FM990'') || ''%'' End',
'           || ''</div>''',
'         End, '''') Within Group (Order By g.Bkt), '''')',
'    || ''</div><div class="ds-arage-legend">''',
'    || nvl(ListAgg(',
'         ''<span class="ds-arage-key ds-arage-key--b'' || g.Bkt || ''"><i></i>''',
'         || Case g.Bkt When 0 Then ''Not Due'' When 1 Then ''1-30'' When 2 Then ''31-60''',
'                       When 3 Then ''61-90'' When 4 Then ''91-180'' When 5 Then ''181-365''',
'                       When 6 Then ''&gt;365'' Else ''Cannot Age'' End',
'         || '' <b>&#8377;'' || to_char(Round(g.Amt,0),''FM999G99G99G990'') || ''</b></span>'', '''')',
'         Within Group (Order By g.Bkt), '''')',
'    || ''</div></div>'' As SCALE',
'  From G g Cross Join Tot tot'))
,p_display_when_condition=>'P910_PARTY'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P910_PARTY,P910_TODATE,P910_COMPANY,P910_LOCATION,P910_AGEBASIS'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'This customer carries no open receivable to age.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12708225707300621)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12708399421300621)
,p_plug_name=>'Receipt Allocation'
,p_static_id=>'allocations'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2102002977963900996)
,p_plug_display_sequence=>42
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The bridge itself, one row per receipt x bill. This is the only place',
'   in the dashboard where the many-to-many relationship is shown at its',
'   own grain - everywhere else it is pre-aggregated before joining, or',
'   the outstanding figure would duplicate. */',
'With Asof As (Select to_date(:P910_TODATE,''DD-MM-RRRR'') D From dual)',
'Select dv.VoucherNo                                 As BILL_VOUCHER,',
'       dv.Tno                                       As BILL_TNO,',
'       coalesce(i.InvoiceNo, ao.BillNo, dv.VoucherNo) As BILL_REFERENCE,',
'       dv.VoucherDate                                As BILL_DATE,',
'       cv.VoucherNo                                  As RECEIPT_VOUCHER,',
'       cv.Tno                                        As RECEIPT_TNO,',
'       cv.VoucherDate                                As RECEIPT_DATE,',
'       Round(a.Amount,2)                             As ALLOCATED,',
'       cv.VoucherDate - dv.VoucherDate               As DAYS_TO_SETTLE,',
'       nvl(dl.LocationName, dd.LocationCode) As BILL_LOCATION,',
'       nvl(cl.LocationName, cd.LocationCode) As RECEIPT_LOCATION,',
'       Case When dd.LocationCode <> cd.LocationCode',
'                 Then ''<span class="ds-archip ds-archip--warn">Cross-location</span>''',
'            Else ''<span class="ds-archip ds-archip--pass">Same location</span>'' End As SETTLEMENT_TYPE',
'  From DrCrAllocation a',
'  Join Voucher dv On dv.Tno = a.DrVoucherTno',
'  Join Voucher cv On cv.Tno = a.CrVoucherTno',
'  Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'  Left Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'  Left Join Invoice i On dv.ModuleCode = ''INVOICE'' And i.Tno = dv.ModuleTno',
'  Left Join AccountOpening ao On dv.VoucherNo = ''OPENING'' And ao.Tno = dd.ModuleTno',
'  Left Join Location dl On dl.LocationCode = dd.LocationCode',
'  Left Join Location cl On cl.LocationCode = cd.LocationCode',
'  Cross Join Asof',
' Where dd.AccountCode = :P910_PARTY',
'   And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P910_PARTY,P910_TODATE'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P910_PARTY'
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
 p_id=>wwv_flow_imp.id(12708497451300621)
,p_no_data_found_message=>'No receipt has ever been allocated to a bill for this customer. That is the normal state in this ledger - only 31% of AR lines have ever been allocated.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>69300000000000695
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12708587236300621)
,p_db_column_name=>'ALLOCATED'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Allocated (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12708609783300621)
,p_db_column_name=>'BILL_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Bill Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12708722195300621)
,p_db_column_name=>'BILL_LOCATION'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Bill Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12708837594300651)
,p_db_column_name=>'BILL_REFERENCE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Bill'
,p_column_link=>'f?p=&APP_ID.:678:&SESSION.::&DEBUG.:678:P678_TNO:#BILL_TNO#'
,p_column_linktext=>'#BILL_REFERENCE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12708907380300651)
,p_db_column_name=>'BILL_TNO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Bill Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12709041967300651)
,p_db_column_name=>'BILL_VOUCHER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Bill Voucher'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12709149562300651)
,p_db_column_name=>'DAYS_TO_SETTLE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Days to Settle'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12709217637300651)
,p_db_column_name=>'RECEIPT_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Receipt Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12709368593300651)
,p_db_column_name=>'RECEIPT_LOCATION'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Receipt Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12709421289300651)
,p_db_column_name=>'RECEIPT_TNO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Receipt Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12709555383300651)
,p_db_column_name=>'RECEIPT_VOUCHER'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Receipt'
,p_column_link=>'f?p=&APP_ID.:678:&SESSION.::&DEBUG.:678:P678_TNO:#RECEIPT_TNO#'
,p_column_linktext=>'#RECEIPT_VOUCHER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12709609614300651)
,p_db_column_name=>'SETTLEMENT_TYPE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Settlement'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12709779867300651)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69303'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'BILL_REFERENCE:BILL_DATE:RECEIPT_VOUCHER:RECEIPT_DATE:ALLOCATED:DAYS_TO_SETTLE:SETTLEMENT_TYPE'
,p_sum_columns_on_break=>'ALLOCATED'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12709813182300652)
,p_plug_name=>'Billing vs Collection'
,p_static_id=>'billing-collection'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>26
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Mv As (',
'       Select trunc(d.VoucherDate,''MM'') Mth,',
'              Sum(Case When v.DocTypeCode In (''SALE'',''SERVICEBILL'') And d.Amount < 0',
'                       Then -d.Amount Else 0 End) Billing,',
'              Sum(Case When v.DocTypeCode = ''RECEIPT'' And d.Amount > 0',
'                       Then d.Amount Else 0 End) Collection',
'         From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
'        Where d.AccountCode = :P910_PARTY',
'          And d.VoucherDate >= to_date(:P910_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P910_TODATE,''DD-MM-RRRR'') + 1',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P910_COMPANY  Is Null Or d.CompanyCode  = :P910_COMPANY)',
'          And (:P910_LOCATION Is Null Or d.LocationCode = :P910_LOCATION)',
'        Group By trunc(d.VoucherDate,''MM''))',
'Select to_char(Mth,''Mon-RR'')          As LABEL,',
'       Round(Billing/100000,2)        As BILLING_LAC,',
'       Round(Collection/100000,2)     As COLLECTION_LAC',
'  From Mv Order By Mth'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P910_PARTY,P910_FROMDATE,P910_TODATE,P910_COMPANY,P910_LOCATION'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P910_PARTY'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12709999692300652)
,p_region_id=>wwv_flow_imp.id(12709813182300652)
,p_chart_type=>'bar'
,p_height=>'300'
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
,p_no_data_found_message=>'Nothing was billed to or collected from this customer in the period.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12710082220300652)
,p_chart_id=>wwv_flow_imp.id(12709999692300652)
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
 p_id=>wwv_flow_imp.id(12710114485300652)
,p_chart_id=>wwv_flow_imp.id(12709999692300652)
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
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12710250726300652)
,p_chart_id=>wwv_flow_imp.id(12709999692300652)
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
 p_id=>wwv_flow_imp.id(12710309469300652)
,p_chart_id=>wwv_flow_imp.id(12709999692300652)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12710486146300652)
,p_name=>'Debtor 360'
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
'    || ''<div class="ds-ar-eyebrow">Receivables &middot; Debtor 360</div>''',
'    || ''<h1 class="ds-ar-title">''',
'       || apex_escape.html(nvl((Select p.PartyName From Party p Where p.PartyCode = :P910_PARTY),',
'                               nvl(:P910_PARTY,''No customer selected''))) || ''</h1>''',
'    || ''<div class="ds-ar-sub">''',
'       || Case When :P910_PARTY Is Null Then ''Open this page from Party-wise Outstanding, Bill-wise Outstanding or a chart to load a customer.''',
'               Else ''Complete receivable position, credit held, open items and collection history as at the As-of Date'' End',
'    || ''</div>''',
'    || ''<div class="ds-ar-context">''',
'    || Case When :P910_PARTY Is Not Null Then',
'            ''<span class="ds-ar-chip"><span class="fa fa-user"></span>Code <b>'' || apex_escape.html(:P910_PARTY) || ''</b></span>''',
'         || nvl(''<span class="ds-ar-chip"><span class="fa fa-sitemap"></span>Group <b>''',
'            || apex_escape.html((Select g.PartyName From Party p Join Party g On g.PartyCode = p.ParentCode',
'                                  Where p.PartyCode = :P910_PARTY)) || ''</b></span>'','''') End',
'    || ''<span class="ds-ar-chip"><span class="fa fa-crosshairs"></span>Position as at <b>'' || :P910_TODATE || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-calendar"></span>Flows <b>''',
'       || :P910_FROMDATE || '' &rarr; '' || :P910_TODATE || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-hourglass-half"></span>Ageing basis <b>''',
'       || Case When :P910_AGEBASIS = ''DOC'' Then ''Document date (age)'' Else ''Due date (lateness)'' End || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P910_PARTY,P910_FROMDATE,P910_TODATE,P910_COMPANY,P910_LOCATION,P910_AGEBASIS'
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
 p_id=>wwv_flow_imp.id(12710586154300652)
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
 p_id=>wwv_flow_imp.id(12710640703300652)
,p_name=>'Credit and Debit Notes'
,p_static_id=>'credit-debit-notes'
,p_template=>4072358936313175081
,p_display_sequence=>34
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select v.VoucherNo                                 As VOUCHER_NO,',
'       v.Tno                                       As VOUCHER_TNO,',
'       Case When v.DocTypeCode = ''CREDITNOTE'' Then ''Credit Note'' Else ''Debit Note'' End As NOTE_TYPE,',
'       cn.CreditNoteNo           As NOTE_NO,',
'       d.VoucherDate                               As NOTE_DATE,',
'       Round(Abs(d.Amount),2)                      As AMOUNT,',
'       Case When d.Amount > 0 Then ''Reduces the receivable''',
'            Else ''Increases the receivable'' End    As EFFECT,',
'       substr(d.Narration,1,200) As NARRATION',
'  From VoucherDetail d',
'  Join Voucher v On v.Tno = d.Tno',
'  Left Join CreditNote cn On v.ModuleCode = ''CREDITNOTE'' And cn.Tno = v.ModuleTno',
' Where d.AccountCode = :P910_PARTY',
'   And v.DocTypeCode In (''CREDITNOTE'',''DEBITNOTE'')',
'   And d.VoucherDate <= to_date(:P910_TODATE,''DD-MM-RRRR'')',
'   And (cast(null as varchar2(100)) Is Null',
'        Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'   And (null    Is Null Or cast(null as varchar2(100))        = null)',
'   And (:P910_COMPANY  Is Null Or d.CompanyCode  = :P910_COMPANY)',
'   And (:P910_LOCATION Is Null Or d.LocationCode = :P910_LOCATION)',
' Order By d.VoucherDate Desc'))
,p_display_when_condition=>'P910_PARTY'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P910_PARTY,P910_TODATE,P910_COMPANY,P910_LOCATION'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No credit or debit note has been raised on this customer.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12710700711300652)
,p_query_column_id=>6
,p_column_alias=>'AMOUNT'
,p_column_display_sequence=>60
,p_column_heading=>unistr('Amount (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12710869108300653)
,p_query_column_id=>7
,p_column_alias=>'EFFECT'
,p_column_display_sequence=>70
,p_column_heading=>'Effect'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12710973900300653)
,p_query_column_id=>8
,p_column_alias=>'NARRATION'
,p_column_display_sequence=>80
,p_column_heading=>'Narration'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12711006282300653)
,p_query_column_id=>5
,p_column_alias=>'NOTE_DATE'
,p_column_display_sequence=>50
,p_column_heading=>'Date'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12711195876300653)
,p_query_column_id=>4
,p_column_alias=>'NOTE_NO'
,p_column_display_sequence=>40
,p_column_heading=>'Note No'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12711259753300653)
,p_query_column_id=>3
,p_column_alias=>'NOTE_TYPE'
,p_column_display_sequence=>30
,p_column_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12711314122300653)
,p_query_column_id=>1
,p_column_alias=>'VOUCHER_NO'
,p_column_display_sequence=>10
,p_column_heading=>'Voucher'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12711441509300653)
,p_query_column_id=>2
,p_column_alias=>'VOUCHER_TNO'
,p_column_display_sequence=>20
,p_column_heading=>'Tno'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'NEVER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12711509056300653)
,p_name=>'Exceptions and Controls'
,p_static_id=>'exceptions'
,p_template=>4072358936313175081
,p_display_sequence=>52
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The same control predicates as page 696, narrowed to this customer.',
'   Counts here and counts there are produced from the same expressions,',
'   so a reader can move between the two pages without reconciling them. */',
'With Asof As (Select to_date(:P910_TODATE,''DD-MM-RRRR'') D From dual),',
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
'              ao.BillDate AoBillDate, ao.BillDueDate AoBillDue',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode = :P910_PARTY',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P910_COMPANY  Is Null Or d.CompanyCode  = :P910_COMPANY)',
'          And (:P910_LOCATION Is Null Or d.LocationCode = :P910_LOCATION))',
'Select Code, Nm, Items, Round(Expo,2) Expo From (',
'  Select ''AR-B02'' Code, ''Open receivable that cannot be aged'' Nm,',
'         Count(*) Items, Sum(Abs(Recv)) Expo',
'    From Oi Where Recv > 0.005 And DueDate Is Null Having Count(*) > 0',
'  Union All',
'  Select ''AR-O01'',''Opening item, original bill date lost'', Count(*), Sum(Abs(Recv))',
'    From Oi Where Vno = ''OPENING'' And AoBillDate Is Null And Abs(Recv) > 0.005 Having Count(*) > 0',
'  Union All',
'  Select ''AR-O02'',''Opening item, original due date lost'', Count(*), Sum(Abs(Recv))',
'    From Oi Where Vno = ''OPENING'' And AoBillDue Is Null And Recv > 0.005 Having Count(*) > 0',
'  Union All',
'  Select ''AR-R03'',''Receipt cash unapplied over 90 days'', Count(*), Sum(-Recv)',
'    From Oi Cross Join Asof',
'   Where Dtc = ''RECEIPT'' And Recv < -0.005 And Asof.D - Vdt > 90 Having Count(*) > 0',
'  Union All',
'  Select ''AR-M01'',''Posted with incomplete business scope'', Count(*), Sum(Abs(Recv))',
'    From Oi Where Cmp Is Null Or Loc Is Null Having Count(*) > 0',
'  Union All',
'  Select ''AR-M02'',''Posted to a location marked DO NOT USE'', Count(*), Sum(Abs(o.Recv))',
'    From Oi o Join Location l On l.LocationCode = o.Loc',
'   Where upper(l.LocationName) Like ''%DO NOT USE%'' And Abs(o.Recv) > 0.005 Having Count(*) > 0',
') Order By Code'))
,p_display_when_condition=>'P910_PARTY'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P910_PARTY,P910_TODATE,P910_COMPANY,P910_LOCATION'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No control fires on this customer.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12711684742300653)
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
 p_id=>wwv_flow_imp.id(12711726528300653)
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
 p_id=>wwv_flow_imp.id(12711806948300653)
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
 p_id=>wwv_flow_imp.id(12711960088300653)
,p_query_column_id=>2
,p_column_alias=>'NM'
,p_column_display_sequence=>20
,p_column_heading=>'Exception'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12712008709300653)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p693Filters'
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
 p_id=>wwv_flow_imp.id(12712183918300653)
,p_name=>'Customer Position'
,p_static_id=>'kpi-strip'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-kpiwrap--5up'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Asof As (Select to_date(:P910_TODATE,''DD-MM-RRRR'') D From dual),',
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
'       Select -(d.Amount - nvl(al.Amt,0)) Recv, d.VoucherDate Vdt,',
'              Case When v.DocTypeCode = ''RECEIPT'' Then ''Cash'' Else ''Other'' End Cls,',
'              Case When nvl(:P910_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) Is Null Then 7',
'                   When nvl(:P910_AGEBASIS,''DUE'') = ''DUE''',
'                        And coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) >= Asof.D Then 0',
'                   When (Case When :P910_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <=  30 Then 1',
'                   When (Case When :P910_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <=  60 Then 2',
'                   When (Case When :P910_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <=  90 Then 3',
'                   When (Case When :P910_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <= 180 Then 4',
'                   When (Case When :P910_AGEBASIS = ''DOC''',
'                              Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                              Else Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0) End) <= 365 Then 5',
'                   Else 6 End Bkt,',
'              Case When :P910_AGEBASIS = ''DOC''',
'                   Then Asof.D - coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate)',
'                   When coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) Is Not Null',
'                   Then Greatest(Asof.D - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0)',
'              End DaysOd,',
'              coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) DueDate',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join Asof',
'        Where d.AccountCode = :P910_PARTY',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P910_COMPANY  Is Null Or d.CompanyCode  = :P910_COMPANY)',
'          And (:P910_LOCATION Is Null Or d.LocationCode = :P910_LOCATION)),',
'     Lr As (',
'       Select Max(d.VoucherDate) Last, Count(*) N',
'         From VoucherDetail d Join Voucher v On v.Tno = d.Tno Cross Join Asof',
'        Where d.AccountCode = :P910_PARTY And v.DocTypeCode = ''RECEIPT''',
'          And d.VoucherDate <= Asof.D),',
'     Rp As (',
'       Select nvl(Sum(d.Amount),0) Amt',
'         From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
'        Where d.AccountCode = :P910_PARTY And v.DocTypeCode = ''RECEIPT''',
'          And d.VoucherDate >= to_date(:P910_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P910_TODATE,''DD-MM-RRRR'') + 1),',
'     T As (',
'       Select nvl(Sum(Case When Recv > 0 Then Recv Else 0 End),0) Gross,',
'              nvl(Sum(Case When Recv < 0 Then -Recv Else 0 End),0) Cred,',
'              nvl(Sum(Recv),0) Net,',
'              nvl(Sum(Case When Recv > 0 And Bkt Between 1 And 6 Then Recv Else 0 End),0) Overdue,',
'              nvl(Sum(Case When Recv > 0 And Bkt Between 4 And 6 Then Recv Else 0 End),0) D90,',
'              nvl(Sum(Case When Recv > 0 And Bkt = 7 Then Recv Else 0 End),0) NoAge,',
'              nvl(Sum(Case When Recv < 0 And Cls = ''Cash'' Then -Recv Else 0 End),0) Unapp,',
'              Count(Case When Recv > 0 Then 1 End) OpenItems,',
'              Max(Case When Recv > 0 Then DaysOd End) MaxOd,',
'              nvl(Sum(Case When Recv > 0 And DaysOd Is Not Null Then Recv * DaysOd End),0) WSum,',
'              nvl(Sum(Case When Recv > 0 And DaysOd Is Not Null Then Recv End),0) WBase,',
'              Min(Case When Recv > 0 And Bkt Between 1 And 6 Then DueDate End) OldestDue',
'         From Aged),',
'     /* THE EFFECTIVE APPROVED CREDIT LIMIT for this one customer.',
'',
'        Party.CreditAmount and Party.CreditDays would take precedence but',
'        are set on 0 and 2 of 962 debtor accounts, so the working source',
'        is CREDITLIMITAPPROVAL: the latest approval granted by the as-of',
'        date whose TillDate has not passed, per company and location. A',
'        blank TillDate never expires.',
'',
'        As on the As-of Date, not as on today, so looking back at an',
'        earlier position judges it against the limit in force then.',
'',
'        No ERP code resolves this - the table carries only panel triggers,',
'        and GETCREDITLIMITASON, despite the name, derives a limit from the',
'        last thirty days of CC invoices, which is a different measure.',
'',
'        A limit over Rs1,000 crore is not a ceiling. The largest real',
'        limit in this data is Rs100 Cr and the placeholders are Rs1,00,000',
'        Cr and above - a thousandfold gap with nothing in it - so a figure',
'        that size records "no limit". If any approval in force is one of',
'        those, the whole position is reported as uncapped rather than',
'        being added into a total that would read as a comfortable',
'        utilisation.',
'',
'        Summed across locations, because a limit is granted per location',
'        and a customer trading at two carries both. */',
'     Cl As (Select 0 InForce, cast(null as number) Capped, 0 Uncapped, cast(null as number) Days From dual)',
'Select ''<div class="ds-kpi ds-kpi--gold" title="Open debit items on this customer as at the As-of Date.">''',
'    || ''<span class="ds-kpi-ic fa fa-inbox"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Receivable</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Gross >= 10000000 Then to_char(Round(t.Gross/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Gross/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">'' || to_char(t.OpenItems,''FM999G990'') || '' open items</div></div></div>'' As K1,',
'       ''<div class="ds-kpi ds-kpi--violet" title="Open credit items - advances, unapplied receipts, credit notes and contra purchases.">''',
'    || ''<span class="ds-kpi-ic fa fa-hand-o-up"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Credit Held</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Cred >= 10000000 Then to_char(Round(t.Cred/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Cred/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">of which unapplied cash &#8377;''',
'    || Case When t.Unapp >= 10000000 Then to_char(Round(t.Unapp/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Unapp/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div></div></div>'' As K2,',
'       ''<div class="ds-kpi ds-kpi--'' || Case When t.Net < 0 Then ''ok'' Else ''struct'' End',
'    || ''" title="Receivable less credit held. Negative means the company holds more of this customer''''s money than the customer owes.">''',
'    || ''<span class="ds-kpi-ic fa fa-balance-scale"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Net Exposure</div><div class="ds-kpi-n">&#8377;''',
'    || Case When Abs(t.Net) >= 10000000 Then to_char(Round(t.Net/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Net/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">''',
'    || Case When t.Gross > 0.005 And t.Cred > 0.005',
'            Then ''&#8377;'' || Case When Least(t.Gross,t.Cred) >= 10000000',
'                                   Then to_char(Round(Least(t.Gross,t.Cred)/10000000,2),''FM999G990D00'') || '' Cr''',
'                                   Else to_char(Round(Least(t.Gross,t.Cred)/100000,2),''FM999G990D00'') || '' Lac'' End',
'                 || '' clearable by allocation''',
'            Else ''no offsetting position'' End',
'    || ''</div></div></div>'' As K3,',
'       ''<div class="ds-kpi ds-kpi--amber" title="Open receivable past its due date or aged beyond zero days, depending on the ageing basis.">''',
'    || ''<span class="ds-kpi-ic fa fa-exclamation-circle"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Overdue</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Overdue >= 10000000 Then to_char(Round(t.Overdue/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Overdue/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">90+ &#8377;''',
'    || Case When t.D90 >= 10000000 Then to_char(Round(t.D90/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.D90/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || '' &middot; oldest due '' || nvl(to_char(t.OldestDue,''DD-MM-RRRR''),''&mdash;'') || ''</div></div></div>'' As K4,',
'       ''<div class="ds-kpi ds-kpi--struct" title="Open receivable with no due date on its source document. Counted here, never spread across the other buckets.">''',
'    || ''<span class="ds-kpi-ic fa fa-question-circle"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Cannot Age</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.NoAge >= 10000000 Then to_char(Round(t.NoAge/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.NoAge/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">weighted ''',
'    || nvl(to_char(Round(t.WSum / Nullif(t.WBase,0),0),''FM999G990''),''&mdash;'')',
'    || '' days overdue &middot; max '' || nvl(to_char(t.MaxOd,''FM999G990''),''&mdash;'') || ''</div></div></div>'' As K5,',
'       ''<div class="ds-kpi ds-kpi--teal" title="Receipts from this customer inside the flow window, and the date of their most recent receipt ever.">''',
'    || ''<span class="ds-kpi-ic fa fa-download"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Receipts in Period</div><div class="ds-kpi-n">&#8377;''',
'    || Case When rp.Amt >= 10000000 Then to_char(Round(rp.Amt/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(rp.Amt/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">last receipt ''',
'    || nvl(to_char(lr.Last,''DD-MM-RRRR''),''never'') || '' &middot; ''',
'    || to_char(lr.N,''FM999G990'') || '' to date</div></div></div>'' As K6,',
'       ''<div class="ds-kpi ds-kpi--risk" title="The credit limit approved for this customer and in force on the As-of Date, and how much of it the net receivable is using - open debit items less unapplied credits, the same basis page 690 counts custo'
||'mers above their limit on. Source is the credit limit approval, not the customer master.">''',
'    || ''<span class="ds-kpi-ic fa fa-hand-paper-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Credit Limit</div><div class="ds-kpi-n">''',
'    || Case When cl.InForce = 0                     Then ''&mdash;''',
'            When cl.Uncapped > 0                    Then ''No ceiling''',
'            When cl.Capped >= 10000000              Then ''&#8377;'' || to_char(Round(cl.Capped/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else                                         ''&#8377;'' || to_char(Round(cl.Capped/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">''',
'    || Case When cl.InForce = 0',
'            Then ''no approval in force on this date''',
'            When cl.Uncapped > 0',
'            Then ''approved above &#8377;1,000 Cr, which records no limit''',
'            /* A negative utilisation is not a small one - it means the',
'               customer has paid in more than they owe, so it is said in',
'               words rather than printed as a percentage below zero. */',
'            When t.Net <= 0',
'            Then ''in credit &middot; nothing drawn against the limit''',
'                 || Case When nvl(cl.Days,0) > 0 Then '' &middot; '' || to_char(cl.Days) || '' credit days'' End',
'            Else to_char(Round(t.Net / Nullif(cl.Capped,0) * 100, 1),''FM99990D0'') || ''% used''',
'                 || Case When nvl(cl.Days,0) > 0 Then '' &middot; '' || to_char(cl.Days) || '' credit days'' End',
'                 || Case When t.Net > cl.Capped Then '' &middot; <b>OVER LIMIT</b>'' End End',
'    || ''</div></div></div>'' As K7',
'  From T t Cross Join Lr lr Cross Join Rp rp Cross Join Cl cl'))
,p_display_when_condition=>'P910_PARTY'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P910_PARTY,P910_FROMDATE,P910_TODATE,P910_COMPANY,P910_LOCATION,P910_AGEBASIS'
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
 p_id=>wwv_flow_imp.id(12712262202300654)
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
 p_id=>wwv_flow_imp.id(12712321048300654)
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
 p_id=>wwv_flow_imp.id(12712465347300654)
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
 p_id=>wwv_flow_imp.id(12712549524300654)
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
 p_id=>wwv_flow_imp.id(12712677114300654)
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
 p_id=>wwv_flow_imp.id(12712767751300654)
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
 p_id=>wwv_flow_imp.id(12712870842300654)
,p_query_column_id=>7
,p_column_alias=>'K7'
,p_column_display_sequence=>70
,p_column_heading=>'Credit Limit'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12712918046300654)
,p_plug_name=>'Select a customer'
,p_static_id=>'no-party'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>18
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-arnote"><span class="fa fa-user-o"></span><div>',
'  <b>No customer is selected.</b> Pick one from the Customer list above, or arrive here by clicking a customer',
'  on Party-wise Outstanding, Bill-wise Outstanding, Advances, the Receipt Register, or the Top Debtors chart',
'  on the command centre &mdash; each of those carries the full filter context across.',
'</div></div>'))
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P910_PARTY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12713054806300654)
,p_plug_name=>'Open Items'
,p_static_id=>'open-items'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2102002977963900996)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Asof As (Select to_date(:P910_TODATE,''DD-MM-RRRR'') D From dual),',
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
'Select d.Tno                                          As VOUCHER_TNO,',
'       /* Sno is what makes a bill addressable. A voucher can carry many',
'          debtor lines, so page 698 is keyed on (Tno, Sno) - Tno alone',
'          would open the wrong line on a multi-line voucher. */',
'       d.Sno                                          As VOUCHER_SNO,',
'       v.VoucherNo                                    As VOUCHER_NO,',
'       ''<span class="ds-arclass">''',
'       || Case When v.VoucherNo = ''OPENING''      Then ''Opening Carry-forward''',
'               When v.ModuleCode = ''INVOICE''     Then ''Trade Invoice''',
'               When v.ModuleCode = ''SERVICEBILL'' Then ''Service Bill''',
'               When v.ModuleCode = ''CREDITNOTE''  Then ''Credit Note''',
'               When v.ModuleCode = ''DEBITNOTE''   Then ''Debit Note''',
'               When v.ModuleCode = ''PBPASS''      Then ''Contra Purchase''',
'               When v.DocTypeCode = ''RECEIPT''    Then ''Receipt / On-account''',
'               When v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'                                                 Then ''Payment to Customer''',
'               Else ''Journal'' End || ''</span>''       As ITEM_CLASS,',
'       coalesce(i.InvoiceNo, sb.ServiceBillNo, ao.BillNo, v.VoucherNo) As BILL_REFERENCE,',
'       coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate) As DOCUMENT_DATE,',
'       coalesce(i.DueDate, sb.DueDate, ao.BillDueDate)     As DUE_DATE,',
'       Round(Abs(d.Amount),2)                         As ORIGINAL_AMOUNT,',
'       Round(Abs(nvl(al.Amt,0)),2)                     As ALLOCATED,',
'       Round(Case When -(d.Amount - nvl(al.Amt,0)) > 0',
'                  Then -(d.Amount - nvl(al.Amt,0)) Else 0 End,2) As OUTSTANDING,',
'       Round(Case When -(d.Amount - nvl(al.Amt,0)) < 0',
'                  Then  (d.Amount - nvl(al.Amt,0)) Else 0 End,2) As CREDIT_OPEN,',
'       Case When coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) Is Not Null',
'            Then Greatest((Select D From Asof) - coalesce(i.DueDate, sb.DueDate, ao.BillDueDate),0)',
'       End                                            As DAYS_OVERDUE,',
'       nvl(l.LocationName, d.LocationCode) As LOCATION,',
'       substr(d.Narration,1,300)    As NARRATION',
'  From VoucherDetail d',
'  Join Voucher v On v.Tno = d.Tno',
'  Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'  Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'  Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'  Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'  Left Join Location l On l.LocationCode = d.LocationCode',
'  Cross Join Asof',
' Where d.AccountCode = :P910_PARTY',
'   And d.VoucherDate <= Asof.D',
'   And Round(d.Amount - nvl(al.Amt,0),2) <> 0',
'   And (cast(null as varchar2(100)) Is Null',
'        Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'   And (null    Is Null Or cast(null as varchar2(100))        = null)',
'   And (:P910_COMPANY  Is Null Or d.CompanyCode  = :P910_COMPANY)',
'   And (:P910_LOCATION Is Null Or d.LocationCode = :P910_LOCATION)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P910_PARTY,P910_FROMDATE,P910_TODATE,P910_COMPANY,P910_LOCATION,P910_AGEBASIS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P910_PARTY'
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
 p_id=>wwv_flow_imp.id(12713187931300654)
,p_no_data_found_message=>'This customer has no open item in the selected scope as at the As-of Date.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>69300000000000693
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12713213916300655)
,p_db_column_name=>'ALLOCATED'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Allocated (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12713378748300655)
,p_db_column_name=>'BILL_REFERENCE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Bill Reference'
,p_column_link=>'f?p=&APP_ID.:915:&SESSION.::&DEBUG.:915:P915_TNO,P915_SNO,P915_TODATE,P915_FROMDATE,P915_PARTY:#VOUCHER_TNO#,#VOUCHER_SNO#,&P910_TODATE.,&P910_FROMDATE.,&P910_PARTY.'
,p_column_linktext=>'#BILL_REFERENCE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12713448774300655)
,p_db_column_name=>'CREDIT_OPEN'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Credit Open (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12713512975300655)
,p_db_column_name=>'DAYS_OVERDUE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Days Overdue'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12713628074300655)
,p_db_column_name=>'DOCUMENT_DATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Document Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12713781075300655)
,p_db_column_name=>'DUE_DATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Due Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12713846824300655)
,p_db_column_name=>'ITEM_CLASS'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'AR Item Class'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12713985680300655)
,p_db_column_name=>'LOCATION'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12714041155300655)
,p_db_column_name=>'NARRATION'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12714172013300655)
,p_db_column_name=>'ORIGINAL_AMOUNT'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Original (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12714290457300655)
,p_db_column_name=>'OUTSTANDING'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Outstanding (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12714353720300655)
,p_db_column_name=>'VOUCHER_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Voucher No'
,p_column_link=>'f?p=&APP_ID.:678:&SESSION.::&DEBUG.:678:P678_TNO:#VOUCHER_TNO#'
,p_column_linktext=>'#VOUCHER_NO#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12714466431300655)
,p_db_column_name=>'VOUCHER_SNO'
,p_display_order=>25
,p_column_identifier=>'N'
,p_column_label=>'Sno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12714599315300655)
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
 p_id=>wwv_flow_imp.id(12714696719300655)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69301'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'VOUCHER_NO:ITEM_CLASS:BILL_REFERENCE:DOCUMENT_DATE:DUE_DATE:ORIGINAL_AMOUNT:OUTSTANDING:CREDIT_OPEN:DAYS_OVERDUE'
,p_sum_columns_on_break=>'ORIGINAL_AMOUNT:OUTSTANDING:CREDIT_OPEN'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12714751827300656)
,p_plug_name=>'Net Exposure Trend'
,p_static_id=>'outstanding-trend'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>25
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Month-end NET exposure, computed as the running total of -Amount.',
'   No allocation logic is needed here and none is used: allocations net',
'   to zero WITHIN a customer account, so the running ledger total is',
'   already the net position. That is the same identity the Reconciliation',
'   page proves at 0.00, which is why this shortcut is safe rather than',
'   convenient - and it makes the trend cheap instead of re-deriving the',
'   whole open-item layer once per month-end. */',
'With Mv As (',
'       Select trunc(d.VoucherDate,''MM'') Mth, Sum(-d.Amount) Net',
'         From VoucherDetail d',
'        Where d.AccountCode = :P910_PARTY',
'          And d.VoucherDate <= to_date(:P910_TODATE,''DD-MM-RRRR'')',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P910_COMPANY  Is Null Or d.CompanyCode  = :P910_COMPANY)',
'          And (:P910_LOCATION Is Null Or d.LocationCode = :P910_LOCATION)',
'        Group By trunc(d.VoucherDate,''MM''))',
'Select to_char(Mth,''Mon-RR'')                              As LABEL,',
'       Round(Sum(Net) Over (Order By Mth)/100000,2)       As NET_EXPOSURE_LAC',
'  From Mv Order By Mth'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P910_PARTY,P910_TODATE,P910_COMPANY,P910_LOCATION'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P910_PARTY'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12714850528300656)
,p_region_id=>wwv_flow_imp.id(12714751827300656)
,p_chart_type=>'line'
,p_height=>'300'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
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
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No ledger movement for this customer up to the As-of Date.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12714913119300691)
,p_chart_id=>wwv_flow_imp.id(12714850528300656)
,p_static_id=>'net-exposure'
,p_seq=>10
,p_name=>unistr('Net Exposure (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'line'
,p_items_value_column_name=>'NET_EXPOSURE_LAC'
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
 p_id=>wwv_flow_imp.id(12715007406300691)
,p_chart_id=>wwv_flow_imp.id(12714850528300656)
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
 p_id=>wwv_flow_imp.id(12715183366300691)
,p_chart_id=>wwv_flow_imp.id(12714850528300656)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('Net Exposure (\20B9 Lac)')
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
 p_id=>wwv_flow_imp.id(12715292693300691)
,p_name=>'Payment Behaviour'
,p_static_id=>'payment-behaviour'
,p_template=>4072358936313175081
,p_display_sequence=>27
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Behaviour is measured from ALLOCATIONS, because only an allocation',
'   records which bill a payment actually settled. Where a customer''s',
'   receipts are unallocated - the normal state in this ledger - the',
'   measure says so rather than inventing a lag from receipt dates. */',
'With Asof As (Select to_date(:P910_TODATE,''DD-MM-RRRR'') D From dual),',
'     Pay As (',
'       Select dv.VoucherDate BillDate, cv.VoucherDate PayDate,',
'              cv.VoucherDate - dv.VoucherDate Lag, a.Amount Amt',
'         From DrCrAllocation a',
'         Join Voucher dv On dv.Tno = a.DrVoucherTno',
'         Join Voucher cv On cv.Tno = a.CrVoucherTno',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Cross Join Asof',
'        Where dd.AccountCode = :P910_PARTY',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D),',
'     R As (',
'       Select Count(*) N, nvl(Sum(d.Amount),0) Amt,',
'              Count(Case When Not Exists (',
'                     Select 1 From DrCrAllocation a',
'                      Where a.CrVoucherTno = d.Tno And a.CrVoucherSno = d.Sno) Then 1 End) Unalloc',
'         From VoucherDetail d Join Voucher v On v.Tno = d.Tno Cross Join Asof',
'        Where d.AccountCode = :P910_PARTY And v.DocTypeCode = ''RECEIPT''',
'          And d.VoucherDate <= Asof.D)',
'Select Ord, Metric, Val, Note From (',
'  Select 10 Ord, ''Settlements observed'' Metric, to_char(Count(*),''FM999G990'') Val,',
'         ''allocation rows linking a payment to a bill'' Note From Pay',
'  Union All',
'  Select 20, ''Average days to settle'',',
'         nvl(to_char(Round(Avg(Lag),0),''FM999G990''),''&mdash;''),',
'         ''bill date to the date of the payment that settled it'' From Pay',
'  Union All',
'  Select 30, ''Weighted days to settle'',',
'         nvl(to_char(Round(Sum(Lag * Amt) / Nullif(Sum(Amt),0),0),''FM999G990''),''&mdash;''),',
'         ''weighted by amount, so a large late bill counts more than a small prompt one'' From Pay',
'  Union All',
'  Select 40, ''Fastest / slowest settlement'',',
'         nvl(to_char(Min(Lag),''FM999G990''),''&mdash;'') || '' / '' || nvl(to_char(Max(Lag),''FM999G990''),''&mdash;''),',
'         ''days'' From Pay',
'  Union All',
'  Select 50, ''Receipts received'', to_char(r.N,''FM999G990''),',
'         ''total receipt lines on this customer up to the As-of Date'' From R r',
'  Union All',
'  Select 60, ''Receipts never allocated'',',
'         to_char(r.Unalloc,''FM999G990'')',
'         || Case When r.N > 0 Then '' ('' || to_char(Round(100 * r.Unalloc / r.N,0),''FM990'') || ''%)'' End,',
'         ''cash received but never applied to a bill - behaviour cannot be measured for these'' From R r',
') Order By Ord'))
,p_display_when_condition=>'P910_PARTY'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P910_PARTY,P910_TODATE'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No payment behaviour can be measured for this customer.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12715315614300692)
,p_query_column_id=>2
,p_column_alias=>'METRIC'
,p_column_display_sequence=>20
,p_column_heading=>'Measure'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12715456805300692)
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
 p_id=>wwv_flow_imp.id(12715565392300692)
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
 p_id=>wwv_flow_imp.id(12715633547300692)
,p_query_column_id=>3
,p_column_alias=>'VAL'
,p_column_display_sequence=>30
,p_column_heading=>'Value'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12715753721300692)
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
'                          Then :P910_TODATE ||'',''|| :P910_COMPANY ||'',''|| :P910_LOCATION',
'                          Else :P910_FROMDATE ||'',''|| :P910_TODATE ||'',''|| :P910_COMPANY ||'',''|| :P910_LOCATION End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 910',
' Order By Pg.Id'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P910_FROMDATE,P910_TODATE,P910_COMPANY,P910_LOCATION'
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
 p_id=>wwv_flow_imp.id(12715873932300692)
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
 p_id=>wwv_flow_imp.id(12715963398300692)
,p_plug_name=>'Receipt History'
,p_static_id=>'receipts'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2102002977963900996)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Asof As (Select to_date(:P910_TODATE,''DD-MM-RRRR'') D From dual),',
'     Alc As (',
'       Select a.CrVoucherTno Tno, a.CrVoucherSno Sno,',
'              Sum(a.Amount) Amt, Count(*) N',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'        Group By a.CrVoucherTno, a.CrVoucherSno)',
'Select d.Tno                                          As VOUCHER_TNO,',
'       v.VoucherNo                                    As RECEIPT_NO,',
'       d.VoucherDate                                  As RECEIPT_DATE,',
'       Round(d.Amount,2)                              As RECEIPT_AMOUNT,',
'       Round(nvl(al.Amt,0),2)                         As APPLIED,',
'       Round(d.Amount - nvl(al.Amt,0),2)              As UNAPPLIED,',
'       nvl(al.N,0)                                    As BILLS_SETTLED,',
'       Case When nvl(al.N,0) = 0',
'                 Then ''<span class="ds-archip ds-archip--fail">Unapplied</span>''',
'            When d.Amount - nvl(al.Amt,0) > 0.005',
'                 Then ''<span class="ds-archip ds-archip--warn">Partly applied</span>''',
'            Else ''<span class="ds-archip ds-archip--pass">Fully applied</span>'' End As STATUS,',
'       v.MoneyTransferReferenceNo   As BANK_REFERENCE,',
'       nvl(l.LocationName, d.LocationCode) As LOCATION,',
'       substr(d.Narration,1,300)    As NARRATION',
'  From VoucherDetail d',
'  Join Voucher v On v.Tno = d.Tno',
'  Left Join Alc al On al.Tno = d.Tno And al.Sno = d.Sno',
'  Left Join Location l On l.LocationCode = d.LocationCode',
' Where d.AccountCode = :P910_PARTY',
'   And v.DocTypeCode = ''RECEIPT''',
'   And d.VoucherDate >= to_date(:P910_FROMDATE,''DD-MM-RRRR'')',
'   And d.VoucherDate <  to_date(:P910_TODATE,''DD-MM-RRRR'') + 1',
'   And (cast(null as varchar2(100)) Is Null',
'        Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'   And (null    Is Null Or cast(null as varchar2(100))        = null)',
'   And (:P910_COMPANY  Is Null Or d.CompanyCode  = :P910_COMPANY)',
'   And (:P910_LOCATION Is Null Or d.LocationCode = :P910_LOCATION)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P910_PARTY,P910_FROMDATE,P910_TODATE,P910_COMPANY,P910_LOCATION'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P910_PARTY'
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
 p_id=>wwv_flow_imp.id(12716047921300692)
,p_no_data_found_message=>'No receipt from this customer in the selected period.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>69300000000000694
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12716118743300692)
,p_db_column_name=>'APPLIED'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Applied (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12716235773300693)
,p_db_column_name=>'BANK_REFERENCE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Bank Reference'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12716347846300693)
,p_db_column_name=>'BILLS_SETTLED'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Bills Settled'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12716428174300693)
,p_db_column_name=>'LOCATION'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12716560977300693)
,p_db_column_name=>'NARRATION'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12716680574300693)
,p_db_column_name=>'RECEIPT_AMOUNT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Receipt (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12716789175300693)
,p_db_column_name=>'RECEIPT_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Receipt Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12716828124300693)
,p_db_column_name=>'RECEIPT_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Receipt No'
,p_column_link=>'f?p=&APP_ID.:678:&SESSION.::&DEBUG.:678:P678_TNO:#VOUCHER_TNO#'
,p_column_linktext=>'#RECEIPT_NO#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12716963234300693)
,p_db_column_name=>'STATUS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12717094760300693)
,p_db_column_name=>'UNAPPLIED'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Unapplied (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12717148666300693)
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
 p_id=>wwv_flow_imp.id(12717232450300693)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69302'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'RECEIPT_NO:RECEIPT_DATE:RECEIPT_AMOUNT:APPLIED:UNAPPLIED:STATUS:BILLS_SETTLED'
,p_sum_columns_on_break=>'RECEIPT_AMOUNT:APPLIED:UNAPPLIED'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12717300765300693)
,p_name=>'Reconciliation'
,p_static_id=>'reconciliation'
,p_template=>4072358936313175081
,p_display_sequence=>50
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The same two-way test as page 697, narrowed to one customer and',
'   computed inside one statement so both sides see one snapshot. */',
'With Asof As (Select to_date(:P910_TODATE,''DD-MM-RRRR'') D From dual),',
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
'     B As (',
'       Select Sum(-(d.Amount - nvl(al.Amt,0))) Anl, Sum(-d.Amount) Gl',
'         From VoucherDetail d',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode = :P910_PARTY',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P910_COMPANY  Is Null Or d.CompanyCode  = :P910_COMPANY)',
'          And (:P910_LOCATION Is Null Or d.LocationCode = :P910_LOCATION))',
'Select ''AR Analytical (open-item register)''   As MEASURE,',
'       Round(b.Anl,2)                          As AMOUNT,',
'       ''allocation logic applied''              As BASIS From B b',
'Union All',
'Select ''Ledger balance (no allocation logic)'', Round(b.Gl,2),',
'       ''signed VoucherDetail sum'' From B b',
'Union All',
'Select ''Difference'', Round(b.Anl - b.Gl,2),',
'       Case When Abs(b.Anl - b.Gl) < 0.005 Then ''Reconciled''',
'            Else ''OUT OF BALANCE - allocations on this account do not net to zero'' End',
'  From B b'))
,p_display_when_condition=>'P910_PARTY'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P910_PARTY,P910_TODATE,P910_COMPANY,P910_LOCATION'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No ledger position to reconcile for this customer.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12717406771300694)
,p_query_column_id=>2
,p_column_alias=>'AMOUNT'
,p_column_display_sequence=>20
,p_column_heading=>unistr('Amount (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12717586450300694)
,p_query_column_id=>3
,p_column_alias=>'BASIS'
,p_column_display_sequence=>30
,p_column_heading=>'Basis'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12717643212300694)
,p_query_column_id=>1
,p_column_alias=>'MEASURE'
,p_column_display_sequence=>10
,p_column_heading=>'Measure'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12717720575300694)
,p_plug_name=>'Control'
,p_static_id=>'rule-control'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>48
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Control and Reconciliation</h2>',
'  <p>Does this customer tie to the ledger, and what exceptions do they carry?</p>',
'</div>'))
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P910_PARTY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12717805188300694)
,p_plug_name=>'Credits'
,p_static_id=>'rule-credits'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>32
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Credits Held</h2>',
'  <p>Advances, unapplied cash and credit notes on this customer''s account</p>',
'</div>'))
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P910_PARTY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12717954028300694)
,p_plug_name=>'Open Items'
,p_static_id=>'rule-items'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>28
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Open Items</h2>',
'  <p>Every unsettled line on this customer, with its source document and ageing</p>',
'</div>'))
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P910_PARTY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12718090807300694)
,p_plug_name=>'Receipt History'
,p_static_id=>'rule-receipts'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>38
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Receipt History</h2>',
'  <p>Every receipt from this customer in the flow window, and how much of each was applied</p>',
'</div>'))
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P910_PARTY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12718123785300694)
,p_plug_name=>'Statement'
,p_static_id=>'rule-statement'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>44
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Customer Statement</h2>',
'  <p>Every ledger movement on this account, with a running balance</p>',
'</div>'))
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P910_PARTY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12718277039300695)
,p_plug_name=>'Trend and Behaviour'
,p_static_id=>'rule-trend'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>24
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Trend and Behaviour</h2>',
'  <p>How this customer''s exposure has moved, and how they actually pay</p>',
'</div>'))
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P910_PARTY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12718340979300695)
,p_plug_name=>'Customer Statement'
,p_static_id=>'statement'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2102002977963900996)
,p_plug_display_sequence=>45
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* A true statement of account: every line on the customer, in date',
'   order, with the running balance carried down. The running total is a',
'   window function over the SAME rows the reader sees, so the closing',
'   figure at the bottom equals the Net Exposure KPI at the top by',
'   construction rather than by coincidence. */',
'Select d.VoucherDate                                As TRANSACTION_DATE,',
'       v.VoucherNo                                  As VOUCHER_NO,',
'       d.Tno                                        As VOUCHER_TNO,',
'       v.DocTypeCode                                As VOUCHER_TYPE,',
'       coalesce(i.InvoiceNo, ao.BillNo, v.VoucherNo) As REFERENCE,',
'       Round(Case When d.Amount < 0 Then -d.Amount End,2) As DEBIT,',
'       Round(Case When d.Amount > 0 Then  d.Amount End,2) As CREDIT,',
'       Round(Sum(-d.Amount) Over (Order By d.VoucherDate, d.Tno, d.Sno',
'                                  Rows Between Unbounded Preceding And Current Row),2) As RUNNING_BALANCE,',
'       nvl(l.LocationName, d.LocationCode) As LOCATION,',
'       substr(d.Narration,1,250)  As NARRATION',
'  From VoucherDetail d',
'  Join Voucher v On v.Tno = d.Tno',
'  Left Join Invoice i On v.ModuleCode = ''INVOICE'' And i.Tno = v.ModuleTno',
'  Left Join AccountOpening ao On v.VoucherNo = ''OPENING'' And ao.Tno = d.ModuleTno',
'  Left Join Location l On l.LocationCode = d.LocationCode',
' Where d.AccountCode = :P910_PARTY',
'   And d.VoucherDate <= to_date(:P910_TODATE,''DD-MM-RRRR'')',
'   And (cast(null as varchar2(100)) Is Null',
'        Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'   And (null    Is Null Or cast(null as varchar2(100))        = null)',
'   And (:P910_COMPANY  Is Null Or d.CompanyCode  = :P910_COMPANY)',
'   And (:P910_LOCATION Is Null Or d.LocationCode = :P910_LOCATION)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P910_PARTY,P910_TODATE,P910_COMPANY,P910_LOCATION'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P910_PARTY'
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
 p_id=>wwv_flow_imp.id(12718432419300695)
,p_no_data_found_message=>'No ledger movement on this customer up to the As-of Date.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>69300000000000696
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12718571163300695)
,p_db_column_name=>'CREDIT'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Credit (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12718662349300695)
,p_db_column_name=>'DEBIT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Debit (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12718714899300695)
,p_db_column_name=>'LOCATION'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12718840725300695)
,p_db_column_name=>'NARRATION'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12718908308300695)
,p_db_column_name=>'REFERENCE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12719059904300695)
,p_db_column_name=>'RUNNING_BALANCE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Running Balance (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12719198907300695)
,p_db_column_name=>'TRANSACTION_DATE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12719254512300695)
,p_db_column_name=>'VOUCHER_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Voucher'
,p_column_link=>'f?p=&APP_ID.:678:&SESSION.::&DEBUG.:678:P678_TNO:#VOUCHER_TNO#'
,p_column_linktext=>'#VOUCHER_NO#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12719339096300695)
,p_db_column_name=>'VOUCHER_TNO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12719487971300695)
,p_db_column_name=>'VOUCHER_TYPE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12719550073300696)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69304'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TRANSACTION_DATE:VOUCHER_NO:VOUCHER_TYPE:REFERENCE:DEBIT:CREDIT:RUNNING_BALANCE'
,p_sum_columns_on_break=>'DEBIT:CREDIT'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12719611978300696)
,p_name=>'Timeline'
,p_static_id=>'timeline'
,p_template=>4072358936313175081
,p_display_sequence=>54
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The customer''s last 60 events in plain chronological order. Deliberately',
'   capped: a timeline is read from the top and an uncapped one on a busy',
'   account is a scrolling exercise, not a narrative. The cap is stated in',
'   the region title rather than applied silently. */',
'Select * From (',
'  Select d.VoucherDate                             As EVENT_DATE,',
'         Case When v.VoucherNo = ''OPENING''      Then ''Opening carry-forward''',
'              When v.ModuleCode = ''INVOICE''     Then ''Invoice raised''',
'              When v.ModuleCode = ''SERVICEBILL'' Then ''Service bill raised''',
'              When v.ModuleCode = ''CREDITNOTE''  Then ''Credit note issued''',
'              When v.ModuleCode = ''DEBITNOTE''   Then ''Debit note issued''',
'              When v.ModuleCode = ''PBPASS''      Then ''Purchase from this party (contra)''',
'              When v.DocTypeCode = ''RECEIPT''    Then ''Receipt received''',
'              When v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'                                                Then ''Payment made to this party''',
'              Else ''Journal posting'' End         As EVENT,',
'         v.VoucherNo                             As VOUCHER_NO,',
'         d.Tno                                   As VOUCHER_TNO,',
'         Round(Abs(d.Amount),2)                  As AMOUNT,',
'         Case When d.Amount < 0 Then ''Increases receivable''',
'              Else ''Reduces receivable'' End      As EFFECT,',
'         nvl(l.LocationName, d.LocationCode) As LOCATION',
'    From VoucherDetail d',
'    Join Voucher v On v.Tno = d.Tno',
'    Left Join Location l On l.LocationCode = d.LocationCode',
'   Where d.AccountCode = :P910_PARTY',
'     And d.VoucherDate <= to_date(:P910_TODATE,''DD-MM-RRRR'')',
'     And (cast(null as varchar2(100)) Is Null',
'          Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'     And (null    Is Null Or cast(null as varchar2(100))        = null)',
'     And (:P910_COMPANY  Is Null Or d.CompanyCode  = :P910_COMPANY)',
'     And (:P910_LOCATION Is Null Or d.LocationCode = :P910_LOCATION)',
'   Order By d.VoucherDate Desc, d.Tno Desc)',
' Where rownum <= 60'))
,p_display_when_condition=>'P910_PARTY'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P910_PARTY,P910_TODATE,P910_COMPANY,P910_LOCATION'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No activity on this customer up to the As-of Date.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12719779404300696)
,p_query_column_id=>5
,p_column_alias=>'AMOUNT'
,p_column_display_sequence=>50
,p_column_heading=>unistr('Amount (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12719836973300696)
,p_query_column_id=>6
,p_column_alias=>'EFFECT'
,p_column_display_sequence=>60
,p_column_heading=>'Effect'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12719918015300696)
,p_query_column_id=>2
,p_column_alias=>'EVENT'
,p_column_display_sequence=>20
,p_column_heading=>'Event'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12720060238300696)
,p_query_column_id=>1
,p_column_alias=>'EVENT_DATE'
,p_column_display_sequence=>10
,p_column_heading=>'Date'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12720148035300696)
,p_query_column_id=>7
,p_column_alias=>'LOCATION'
,p_column_display_sequence=>70
,p_column_heading=>'Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12720232637300696)
,p_query_column_id=>3
,p_column_alias=>'VOUCHER_NO'
,p_column_display_sequence=>30
,p_column_heading=>'Voucher'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12720384368300696)
,p_query_column_id=>4
,p_column_alias=>'VOUCHER_TNO'
,p_column_display_sequence=>40
,p_column_heading=>'Tno'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'NEVER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12721156343300697)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(12712008709300653)
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
 p_id=>wwv_flow_imp.id(12721218241300697)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(12712008709300653)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:907:&SESSION.::&DEBUG.::P907_FROMDATE,P907_TODATE,P907_COMPANY,P907_LOCATION,P907_AGEBASIS:&P910_FROMDATE.,&P910_TODATE.,&P910_COMPANY.,&P910_LOCATION.,&P910_AGEBASIS.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12721342426300723)
,p_button_sequence=>85
,p_button_plug_id=>wwv_flow_imp.id(12712008709300653)
,p_button_name=>'DOWNLOADPARTYSTATEMENT'
,p_static_id=>'download-party-statement'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Party Statement (Excel)'
,p_button_condition=>'P910_PARTY'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-file-excel-o'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12721416371300723)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(12712008709300653)
,p_button_name=>'PARTYSUMMARY'
,p_static_id=>'party-summary'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'All Customers'
,p_button_redirect_url=>'f?p=&APP_ID.:908:&SESSION.::&DEBUG.::P908_FROMDATE,P908_TODATE,P908_COMPANY,P908_LOCATION,P908_AGEBASIS:&P910_FROMDATE.,&P910_TODATE.,&P910_COMPANY.,&P910_LOCATION.,&P910_AGEBASIS.'
,p_icon_css_classes=>'fa-users'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12720454868300696)
,p_name=>'P910_AGEBASIS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(12712008709300653)
,p_item_default=>'DUE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12720558533300696)
,p_name=>'P910_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12712008709300653)
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
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12720630117300696)
,p_name=>'P910_FROMDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12712008709300653)
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
 p_id=>wwv_flow_imp.id(12720798355300697)
,p_name=>'P910_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12712008709300653)
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
'                  And (:P910_COMPANY Is Null Or v.CompanyCode = :P910_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P910_COMPANY'
,p_ajax_items_to_submit=>'P910_COMPANY'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12720991075300697)
,p_name=>'P910_PARTY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12712008709300653)
,p_prompt=>'Customer'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select p.PartyName d, p.PartyCode r',
'  From Party p',
' Where p.PartyCode In (Select PartyCode From Party',
'         Start With PartyCode = ''SUNDRYDEBTORS'' Connect By Prior PartyCode = ParentCode)',
'   And Exists (Select 1 From VoucherDetail v',
'                Where v.AccountCode = p.PartyCode',
'                  And (cast(null as varchar2(100)) Is Null',
'                       Or cast(null as varchar2(100)) = cast(null as varchar2(100))))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select a customer'
,p_colspan=>8
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12721065394300697)
,p_name=>'P910_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12712008709300653)
,p_item_default=>'Select to_char(trunc(sysdate),''DD-MM-RRRR'') From dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date / As-of'
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12721511236300724)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Download Party Statement Excel'
,p_static_id=>'download-party-statement-xls'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* ERP party statement equivalent of the reference workbook.  It',
'   emits actual SpreadsheetML sheets rather than exporting the',
'   visible HTML, so every amount stays numeric and summable. */',
'Declare',
'    lFrom       Date := to_date(:P910_FROMDATE,''DD-MM-RRRR'');',
'    lTo         Date := to_date(:P910_TODATE,''DD-MM-RRRR'');',
'    lParty      Varchar2(100) := :P910_PARTY;',
'    lPartyName  Varchar2(500);',
'    lOpening    Number := 0;',
'    lSales      Number := 0;',
'    lReceipts   Number := 0;',
'    lClosing    Number := 0;',
'    lOpen       Number := 0;',
'    lCredit     Number := Null;',
'    lLedgerRows Number := 0;',
'    lOpenRows   Number := 0;',
'    lReceiptRows Number := 0;',
'',
'    Procedure TextCell(pValue Varchar2, pStyle Varchar2 Default ''Text'') Is',
'    Begin',
'        htp.prn(''<Cell ss:StyleID="''||pStyle||''"><Data ss:Type="String">''||apex_escape.html(nvl(pValue,''''))||''</Data></Cell>'');',
'    End;',
'    Procedure NumCell(pValue Number, pStyle Varchar2 Default ''Number'') Is',
'    Begin',
'        htp.prn(''<Cell ss:StyleID="''||pStyle||''"><Data ss:Type="Number">'');',
'        If pValue Is Not Null Then',
'            htp.prn(to_char(pValue,''FM9999999999999990D00'',''NLS_NUMERIC_CHARACTERS=''''.,''''''));',
'        End If;',
'        htp.prn(''</Data></Cell>'');',
'    End;',
'    Procedure BlankCells(pCount PLS_INTEGER, pStyle Varchar2 Default ''Text'') Is',
'    Begin',
'        For i In 1..pCount Loop TextCell(null,pStyle); End Loop;',
'    End;',
'    Procedure SheetStart(pName Varchar2, pTitle Varchar2, pSpan PLS_INTEGER) Is',
'    Begin',
'        htp.prn(''<Worksheet ss:Name="''||apex_escape.html(pName)||''"><Table>'');',
'        htp.prn(''<Row ss:Height="24"><Cell ss:StyleID="Title" ss:MergeAcross="''||(pSpan-1)||''"><Data ss:Type="String">AMBIKAH PARBOILED PRODUCTS PRIVATE LIMITED</Data></Cell></Row>'');',
'        htp.prn(''<Row ss:Height="20"><Cell ss:StyleID="SubTitle" ss:MergeAcross="''||(pSpan-1)||''"><Data ss:Type="String">''||apex_escape.html(upper(pTitle))||''</Data></Cell></Row>'');',
'        htp.prn(''<Row><Cell ss:StyleID="Context" ss:MergeAcross="''||(pSpan-1)||''"><Data ss:Type="String">''||apex_escape.html(lPartyName||''  |  Period: ''||to_char(lFrom,''DD-MM-RRRR'')||'' to ''||to_char(lTo,''DD-MM-RRRR'')||''  |  Company: ''||Case When :P91'
||'0_COMPANY Is Null Then ''All'' Else to_char(:P910_COMPANY) End)||''</Data></Cell></Row>'');',
'    End;',
'    Procedure SheetEnd Is',
'    Begin',
'        htp.prn(''</Table><WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel"><FreezePanes/><FrozenNoSplit/><SplitHorizontal>4</SplitHorizontal><TopRowBottomPane>4</TopRowBottomPane><PageSetup><Layout x:Orientation="Landscape"/></PageSetu'
||'p><Print><FitWidth>1</FitWidth><FitHeight>0</FitHeight></Print></WorksheetOptions></Worksheet>'');',
'    End;',
'Begin',
'    If lParty Is Null Then',
'        raise_application_error(-20001,''Select a customer before downloading the party statement.'');',
'    End If;',
'    Select nvl(Max(PartyName),lParty) Into lPartyName From Party Where PartyCode=lParty;',
'',
'    With Asof As (Select lTo D From dual),',
'         Alc As (',
'           Select a.DrVoucherTno Tno,a.DrVoucherSno Sno,-Sum(a.Amount) Amt',
'             From DrCrAllocation a Join Voucher dv On dv.Tno=a.DrVoucherTno Join Voucher cv On cv.Tno=a.CrVoucherTno Cross Join Asof',
'            Where dv.VoucherDate<=Asof.D And cv.VoucherDate<=Asof.D Group By a.DrVoucherTno,a.DrVoucherSno',
'           Union All',
'           Select a.CrVoucherTno,a.CrVoucherSno,Sum(a.Amount)',
'             From DrCrAllocation a Join Voucher dv On dv.Tno=a.DrVoucherTno Join Voucher cv On cv.Tno=a.CrVoucherTno Cross Join Asof',
'            Where dv.VoucherDate<=Asof.D And cv.VoucherDate<=Asof.D Group By a.CrVoucherTno,a.CrVoucherSno),',
'         Al As (Select Tno,Sno,Sum(Amt) Amt From Alc Group By Tno,Sno)',
'    Select nvl(Sum(Case When d.VoucherDate<lFrom Then -d.Amount Else 0 End),0),',
'           nvl(Sum(Case When d.VoucherDate>=lFrom And d.VoucherDate<lTo+1 And v.ModuleCode=''INVOICE'' Then -d.Amount Else 0 End),0),',
'           nvl(Sum(Case When d.VoucherDate>=lFrom And d.VoucherDate<lTo+1 And v.DocTypeCode=''RECEIPT'' Then d.Amount Else 0 End),0),',
'           nvl(Sum(-d.Amount),0),',
'           nvl(Sum(Case When -(d.Amount-nvl(al.Amt,0))>0 Then -(d.Amount-nvl(al.Amt,0)) Else 0 End),0)',
'      Into lOpening,lSales,lReceipts,lClosing,lOpen',
'      From VoucherDetail d Join Voucher v On v.Tno=d.Tno Left Join Al al On al.Tno=d.Tno And al.Sno=d.Sno',
'     Where d.AccountCode=lParty And d.VoucherDate<=lTo',
'       And (:P910_COMPANY Is Null Or d.CompanyCode=:P910_COMPANY)',
'       And (:P910_LOCATION Is Null Or d.LocationCode=:P910_LOCATION)',
'       And (null Is Null Or cast(null as varchar2(100))=null);',
'',
'    lCredit := null;',
'',
'    owa_util.mime_header(''application/vnd.ms-excel'',false);',
'    htp.p(''Content-Disposition: attachment; filename="party-statement-''',
'          ||to_char(sysdate,''YYYYMMDD-HH24MISS'')||''.xml"'');',
'    owa_util.http_header_close();',
'    htp.prn(''<?xml version="1.0"?><Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:x="urn:schemas-microsoft-com:office:excel"><Styles><Style ss:ID="Title"><Font ss:FontName="'
||'Calibri" ss:Size="15" ss:Bold="1" ss:Color="#FFFFFF"/><Interior ss:Color="#0F2F52" ss:Pattern="Solid"/></Style><Style ss:ID="SubTitle"><Font ss:FontName="Calibri" ss:Size="12" ss:Bold="1" ss:Color="#14261E"/><Interior ss:Color="#C9A227" ss:Pattern="S'
||'olid"/></Style><Style ss:ID="Context"><Font ss:FontName="Calibri" ss:Size="9" ss:Color="#4A5A54"/><Interior ss:Color="#F5F8F6" ss:Pattern="Solid"/></Style><Style ss:ID="Header"><Font ss:FontName="Calibri" ss:Bold="1" ss:Color="#FFFFFF"/><Interior ss:'
||'Color="#1D4A73" ss:Pattern="Solid"/><Alignment ss:Horizontal="Center"/></Style><Style ss:ID="Text"><Font ss:FontName="Calibri" ss:Size="10"/><Alignment ss:Vertical="Top"/></Style><Style ss:ID="Number"><Font ss:FontName="Calibri" ss:Size="10"/><Number'
||'Format ss:Format="#\,##0.00"/><Alignment ss:Horizontal="Right"/></Style><Style ss:ID="Total"><Font ss:FontName="Calibri" ss:Size="10" ss:Bold="1"/><Interior ss:Color="#E8F2EC" ss:Pattern="Solid"/><NumberFormat ss:Format="#\,##0.00"/><Alignment ss:Hor'
||'izontal="Right"/></Style></Styles>'');',
'',
'    SheetStart(''Summary'',''Statement of Account'',6);',
unistr('    htp.prn(''<Row>''); TextCell(''Particulars'',''Header''); TextCell(''Amount (\20B9)'',''Header''); TextCell(''Particulars'',''Header''); TextCell(''Amount (\20B9)'',''Header''); TextCell(''Credit Limit (\20B9)'',''Header''); TextCell(''Utilisation %'',''Header''); htp.prn(''</Row>'');'),
'    htp.prn(''<Row>''); TextCell(''Opening balance''); NumCell(abs(lOpening)); TextCell(''Sales billed''); NumCell(lSales); TextCell(''Effective approved limit''); NumCell(lCredit); NumCell(Case When lCredit>0 Then 100*lOpen/lCredit End); htp.prn(''</Row>'');',
'    htp.prn(''<Row>''); TextCell(''Receipts in period''); NumCell(lReceipts); TextCell(''Open receivable''); NumCell(lOpen); TextCell(''As-of date''); TextCell(to_char(lTo,''DD-MM-RRRR'')); TextCell(Case When lCredit Is Null Then ''No active approval'' Else ''Liv'
||'e approval rule'' End); htp.prn(''</Row>'');',
unistr('    htp.prn(''<Row>''); TextCell(''Closing balance''); NumCell(abs(lClosing),''Total''); TextCell(''Balance type''); TextCell(Case When lClosing>0 Then ''Dr \2014 receivable'' When lClosing<0 Then ''Cr \2014 advance'' Else ''Settled'' End); TextCell(''Confirmation''); TextC')
||'ell(''Please reconcile within 7 days''); htp.prn(''</Row>'');',
'    SheetEnd;',
'',
'    SheetStart(''Ledger'',''Ledger'',7);',
unistr('    htp.prn(''<Row>''); TextCell(''Date'',''Header''); TextCell(''Voucher'',''Header''); TextCell(''Document Type'',''Header''); TextCell(''Narration'',''Header''); TextCell(''Debit (\20B9)'',''Header''); TextCell(''Credit (\20B9)'',''Header''); TextCell(''Balance (\20B9)'',''Header''); htp.')
||'prn(''</Row>'');',
'    htp.prn(''<Row>''); TextCell(to_char(lFrom-1,''DD-MM-RRRR'')); TextCell(''OPENING''); TextCell(''Opening balance''); TextCell(''Balance before selected period''); NumCell(Case When lOpening>0 Then lOpening End); NumCell(Case When lOpening<0 Then -lOpening '
||'End); NumCell(abs(lOpening)); htp.prn(''</Row>'');',
'    Declare lRun Number:=lOpening; Begin',
'      For r In (Select d.VoucherDate,v.VoucherNo,nvl(v.ModuleCode,v.DocTypeCode) Source_Type,substr(d.Narration,1,300) Narration,Case When d.Amount<0 Then -d.Amount Else 0 End Dr,Case When d.Amount>0 Then d.Amount Else 0 End Cr From VoucherDetail d J'
||'oin Voucher v On v.Tno=d.Tno Where d.AccountCode=lParty And d.VoucherDate>=lFrom And d.VoucherDate<lTo+1 And (:P910_COMPANY Is Null Or d.CompanyCode=:P910_COMPANY) And (:P910_LOCATION Is Null Or d.LocationCode=:P910_LOCATION) And (null Is Null Or cas'
||'t(null as varchar2(100))=null) Order By d.VoucherDate,d.Tno,d.Sno) Loop',
'        lLedgerRows:=lLedgerRows+1; lRun:=lRun+nvl(r.Dr,0)-nvl(r.Cr,0); htp.prn(''<Row>''); TextCell(to_char(r.VoucherDate,''DD-MM-RRRR'')); TextCell(r.VoucherNo); TextCell(r.Source_Type); TextCell(r.Narration); NumCell(r.Dr); NumCell(r.Cr); NumCell(abs('
||'lRun)); htp.prn(''</Row>'');',
'      End Loop;',
'    End;',
'    htp.prn(''<Row>''); TextCell(''Closing balance'',''Total''); BlankCells(5,''Total''); NumCell(abs(lClosing),''Total''); htp.prn(''</Row>''); SheetEnd;',
'',
'    SheetStart(''Pending Bills'',''Pending Bills'',8);',
unistr('    htp.prn(''<Row>''); TextCell(''Voucher'',''Header''); TextCell(''Bill Reference'',''Header''); TextCell(''Document Date'',''Header''); TextCell(''Due Date'',''Header''); TextCell(''Bill Amount (\20B9)'',''Header''); TextCell(''Allocated (\20B9)'',''Header''); TextCell(''Pending (\20B9')
||')'',''Header''); TextCell(''Age Days'',''Header''); htp.prn(''</Row>'');',
'    For r In (With Alc As (Select a.DrVoucherTno Tno,a.DrVoucherSno Sno,-Sum(a.Amount) Amt From DrCrAllocation a Join Voucher dv On dv.Tno=a.DrVoucherTno Join Voucher cv On cv.Tno=a.CrVoucherTno Where dv.VoucherDate<=lTo And cv.VoucherDate<=lTo Group'
||' By a.DrVoucherTno,a.DrVoucherSno),Al As (Select Tno,Sno,Sum(Amt) Amt From Alc Group By Tno,Sno) Select v.VoucherNo,coalesce(i.InvoiceNo,sb.ServiceBillNo,ao.BillNo,v.VoucherNo) BillRef,coalesce(i.InvoiceDate,ao.BillDate,d.VoucherDate) DocDate,coalesc'
||'e(i.DueDate,sb.DueDate,ao.BillDueDate) DueDate,-d.Amount BillAmt,-nvl(al.Amt,0) Allocated,-(d.Amount-nvl(al.Amt,0)) Pending From VoucherDetail d Join Voucher v On v.Tno=d.Tno Left Join Al al On al.Tno=d.Tno And al.Sno=d.Sno Left Join Invoice i On v.M'
||'oduleCode=''INVOICE'' And i.Tno=v.ModuleTno Left Join ServiceBill sb On v.ModuleCode=''SERVICEBILL'' And sb.Tno=v.ModuleTno Left Join AccountOpening ao On v.VoucherNo=''OPENING'' And ao.Tno=d.ModuleTno Where d.AccountCode=lParty And d.VoucherDate<=lTo And '
||'-(d.Amount-nvl(al.Amt,0))>0 And (:P910_COMPANY Is Null Or d.CompanyCode=:P910_COMPANY) And (:P910_LOCATION Is Null Or d.LocationCode=:P910_LOCATION) And (null Is Null Or cast(null as varchar2(100))=null) Order By DocDate,VoucherNo) Loop',
'        lOpenRows:=lOpenRows+1; htp.prn(''<Row>''); TextCell(r.VoucherNo); TextCell(r.BillRef); TextCell(to_char(r.DocDate,''DD-MM-RRRR'')); TextCell(to_char(r.DueDate,''DD-MM-RRRR'')); NumCell(r.BillAmt); NumCell(r.Allocated); NumCell(r.Pending); NumCell('
||'lTo-r.DocDate); htp.prn(''</Row>'');',
'    End Loop;',
'    htp.prn(''<Row>''); TextCell(''Total pending'',''Total''); BlankCells(5,''Total''); NumCell(lOpen,''Total''); TextCell(to_char(lOpenRows)||'' open bills'',''Total''); htp.prn(''</Row>''); SheetEnd;',
'',
'    SheetStart(''Payments Received'',''Payments Received'',6);',
unistr('    htp.prn(''<Row>''); TextCell(''Date'',''Header''); TextCell(''Receipt No'',''Header''); TextCell(''Receipt Amount (\20B9)'',''Header''); TextCell(''Applied (\20B9)'',''Header''); TextCell(''Unapplied (\20B9)'',''Header''); TextCell(''Narration'',''Header''); htp.prn(''</Row>'');'),
'    For r In (With Alc As (Select a.CrVoucherTno Tno,a.CrVoucherSno Sno,Sum(a.Amount) Amt From DrCrAllocation a Join Voucher dv On dv.Tno=a.DrVoucherTno Join Voucher cv On cv.Tno=a.CrVoucherTno Where dv.VoucherDate<=lTo And cv.VoucherDate<=lTo Group '
||'By a.CrVoucherTno,a.CrVoucherSno) Select d.VoucherDate,v.VoucherNo,d.Amount ReceiptAmount,nvl(al.Amt,0) Applied,d.Amount-nvl(al.Amt,0) Unapplied,substr(d.Narration,1,300) Narration From VoucherDetail d Join Voucher v On v.Tno=d.Tno Left Join Alc al O'
||'n al.Tno=d.Tno And al.Sno=d.Sno Where d.AccountCode=lParty And v.DocTypeCode=''RECEIPT'' And d.VoucherDate>=lFrom And d.VoucherDate<lTo+1 And (:P910_COMPANY Is Null Or d.CompanyCode=:P910_COMPANY) And (:P910_LOCATION Is Null Or d.LocationCode=:P910_LOC'
||'ATION) And (null Is Null Or cast(null as varchar2(100))=null) Order By d.VoucherDate,d.Tno,d.Sno) Loop',
'        lReceiptRows:=lReceiptRows+1; htp.prn(''<Row>''); TextCell(to_char(r.VoucherDate,''DD-MM-RRRR'')); TextCell(r.VoucherNo); NumCell(r.ReceiptAmount); NumCell(r.Applied); NumCell(r.Unapplied); TextCell(r.Narration); htp.prn(''</Row>'');',
'    End Loop;',
'    htp.prn(''<Row>''); TextCell(''Receipts in selected period'',''Total''); BlankCells(1,''Total''); NumCell(lReceipts,''Total''); BlankCells(2,''Total''); TextCell(to_char(lReceiptRows)||'' receipt rows'',''Total''); htp.prn(''</Row>''); SheetEnd;',
'    htp.prn(''</Workbook>'');',
'    apex_application.stop_apex_engine;',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12721342426300723)
,p_internal_uid=>93696486935195012
);
wwv_flow_imp.component_end;
end;
/
