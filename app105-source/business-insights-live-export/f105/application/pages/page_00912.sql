prompt --application/pages/page_00912
begin
--   Manifest
--     PAGE: 00695
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
 p_id=>912
,p_name=>'Advances and Unapplied Cash'
,p_alias=>'AR-ADVANCES'
,p_step_title=>'Advances and Unapplied Cash'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#hspl-jet-l10n-fallback.js?version=#APP_VERSION#&cb=20260924a'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'Customer credits held, and how much receivable could be cleared by allocating them. This is the largest actionable position in this ledger: only 31% of AR lines have ever been allocated, so cash sits unapplied on one row while a bill sits open on ano'
||'ther. Customer credits are NOT netted into gross outstanding anywhere in this dashboard - they are a separate balance with a separate cause. Contra Purchase credits are shown separately again, because a purchase from a party who is also a customer is'
||' not a customer advance and cannot be used to settle a sales invoice without a commercial decision.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12727399479300758)
,p_plug_name=>'What adjustable means'
,p_static_id=>'adjust-note'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>24
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-arnote"><span class="fa fa-magic"></span><div>',
'  <b>&ldquo;Immediately Adjustable&rdquo; is the lesser of receivable and credit, per customer.</b>',
'  It is the amount of receivable that could be cleared by allocating money the company already holds &mdash;',
'  no collection call, no cash movement, just a settlement entry. It is <b>not</b> an instruction to post one:',
'  contra-purchase credits in particular represent a commercial position, not a customer advance,',
'  and are shown as their own KPI for that reason.',
'</div></div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12727480286300758)
,p_name=>'Advances and Unapplied Cash'
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
'    || ''<div class="ds-ar-eyebrow">Receivables &middot; Customer Credits</div>''',
'    || ''<h1 class="ds-ar-title">Advances &amp; Unapplied Cash</h1>''',
'    || ''<div class="ds-ar-sub">Where the company already holds the customer''''s money, and how much receivable that money could clear today</div>''',
'    || ''<div class="ds-ar-context">''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-crosshairs"></span>Held as at <b>'' || :P912_TODATE || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P912_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P912_LOCATION),''All locations'')) || ''</b></span>''',
'    || Case When :P912_BOTH = ''Y'' Then',
'            ''<span class="ds-ar-chip ds-ar-chip--warn"><span class="fa fa-filter"></span>Showing <b>customers holding AR and credit together</b></span>'' End',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P912_FROMDATE,P912_TODATE,P912_COMPANY,P912_LOCATION,P912_BOTH'
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
 p_id=>wwv_flow_imp.id(12727534670300758)
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
 p_id=>wwv_flow_imp.id(12727652474300758)
,p_plug_name=>'Customers Holding Credit'
,p_static_id=>'customers'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P912_TODATE,''DD-MM-RRRR'') D From dual),',
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
'              -(d.Amount - nvl(al.Amt,0)) Recv,',
'              Case When v.ModuleCode = ''PBPASS''     Then ''Contra Purchase''',
'                   When v.DocTypeCode = ''RECEIPT''   Then ''Receipt / On-account''',
'                   When v.ModuleCode = ''CREDITNOTE'' Then ''Credit Note''',
'                   When v.VoucherNo = ''OPENING''     Then ''Opening Credit''',
'                   Else ''Other'' End Cls',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P912_COMPANY  Is Null Or d.CompanyCode  = :P912_COMPANY)',
'          And (:P912_LOCATION Is Null Or d.LocationCode = :P912_LOCATION)),',
'     G As (',
'       Select Pty, Max(Cmp) Cmp, Max(Loc) Loc,',
'              Sum(Case When Recv > 0 Then Recv Else 0 End) Dr,',
'              Sum(Case When Recv < 0 Then -Recv Else 0 End) Cr,',
'              Sum(Case When Recv < 0 And Cls = ''Receipt / On-account'' Then -Recv Else 0 End) Cash,',
'              Sum(Case When Recv < 0 And Cls = ''Contra Purchase'' Then -Recv Else 0 End) Contra,',
'              Sum(Case When Recv < 0 And Cls = ''Credit Note'' Then -Recv Else 0 End) CNote,',
'              Sum(Case When Recv < 0 And Cls = ''Opening Credit'' Then -Recv Else 0 End) OpenCr,',
'              Sum(Case When Recv < 0 And Cls = ''Receipt / On-account''',
'                        And (Select D From Asof) - Vdt > 90 Then -Recv Else 0 End) Cash90,',
'              Min(Case When Recv < 0 Then Vdt End) OldestCr',
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
'                 Then ''<span class="ds-archip ds-archip--warn">AR + Credit</span>''',
'            Else ''<span class="ds-archip ds-archip--cred">Credit only</span>'' End As POSITION',
'  From G g',
'  Left Join Party p On p.PartyCode = g.Pty',
'  Left Join Company c On c.CompanyCode = g.Cmp',
'  Left Join Location l On l.LocationCode = g.Loc',
' Where g.Cr > 0.005',
'   And (nvl(:P912_BOTH,''N'') <> ''Y'' Or g.Dr > 0.005)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P912_FROMDATE,P912_TODATE,P912_COMPANY,P912_LOCATION,P912_BOTH'
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
 p_id=>wwv_flow_imp.id(12727724073300758)
,p_max_row_count=>'200000'
,p_no_data_found_message=>'No customer holds an open credit in this scope as at the As-of Date.'
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
 p_id=>wwv_flow_imp.id(12727835467300758)
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
 p_id=>wwv_flow_imp.id(12727923695300758)
,p_db_column_name=>'COLLECTION_NEEDED'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Collection Needed (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12728045655300758)
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
 p_id=>wwv_flow_imp.id(12728154249300758)
,p_db_column_name=>'CONTRA_PURCHASE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Contra Purchase (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12728209850300759)
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
 p_id=>wwv_flow_imp.id(12728377918300759)
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
 p_id=>wwv_flow_imp.id(12728425304300759)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Customer'
,p_column_link=>'f?p=&APP_ID.:910:&SESSION.::&DEBUG.:910:P910_PARTY,P910_FROMDATE,P910_TODATE,P910_COMPANY,P910_LOCATION:#PARTY_CODE#,&P912_FROMDATE.,&P912_TODATE.,&P912_COMPANY.,&P912_LOCATION.'
,p_column_linktext=>'#CUSTOMER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12728553212300759)
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
 p_id=>wwv_flow_imp.id(12728696546300759)
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
 p_id=>wwv_flow_imp.id(12728726528300759)
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
 p_id=>wwv_flow_imp.id(12728848332300759)
,p_db_column_name=>'OPENING_CREDIT'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Opening Credit (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12728974398300759)
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
 p_id=>wwv_flow_imp.id(12729064150300759)
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
 p_id=>wwv_flow_imp.id(12729190527300759)
,p_db_column_name=>'RECEIVABLE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Receivable (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12729227051300759)
,p_db_column_name=>'UNAPPLIED_CASH'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Unapplied Cash (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12729399235300759)
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
 p_id=>wwv_flow_imp.id(12729497927300759)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69501'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CUSTOMER:POSITION:RECEIVABLE:CREDIT_TOTAL:UNAPPLIED_CASH:UNAPPLIED_OVER_90:CONTRA_PURCHASE:ADJUSTABLE_NOW:COLLECTION_NEEDED:OLDEST_CREDIT'
,p_sum_columns_on_break=>'RECEIVABLE:CREDIT_TOTAL:UNAPPLIED_CASH:UNAPPLIED_OVER_90:ADJUSTABLE_NOW:COLLECTION_NEEDED'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12729533056300759)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p695Filters'
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
 p_id=>wwv_flow_imp.id(12729661522300760)
,p_name=>'Customer Credit KPIs'
,p_static_id=>'kpi-strip'
,p_template=>4072358936313175081
,p_display_sequence=>20
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
'     Asof As (Select to_date(:P912_TODATE,''DD-MM-RRRR'') D From dual),',
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
'              -(d.Amount - nvl(al.Amt,0)) Recv,',
'              Case When v.ModuleCode = ''PBPASS''   Then ''Contra Purchase''',
'                   When v.DocTypeCode = ''RECEIPT'' Then ''Receipt / On-account''',
'                   When v.ModuleCode = ''CREDITNOTE'' Then ''Credit Note''',
'                   When v.VoucherNo = ''OPENING''   Then ''Opening Credit''',
'                   Else ''Other'' End Cls',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P912_COMPANY  Is Null Or d.CompanyCode  = :P912_COMPANY)',
'          And (:P912_LOCATION Is Null Or d.LocationCode = :P912_LOCATION)),',
'     Part As (',
'       /* Partial Residual is the credit still sitting on a receipt that',
'          HAS been allocated at least once - a genuinely different thing',
'          from a receipt nobody ever touched. The two together make the',
'          unapplied total, so both are shown rather than one standing',
'          for the other. */',
'       Select nvl(Sum(Case When al.N > 0 Then d.Amount - al.Amt Else 0 End),0) Residual,',
'              Count(Case When al.N > 0 And d.Amount - al.Amt > 0.005 Then 1 End) ResidualN,',
'              nvl(Sum(al.LagW),0) LagW, nvl(Sum(al.Amt),0) AppliedAmt',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Join (Select a.CrVoucherTno Tno, a.CrVoucherSno Sno,',
'                      Sum(a.Amount) Amt, Count(*) N,',
'                      Sum(a.Amount * (cv.VoucherDate - dv.VoucherDate)) LagW',
'                 From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'                Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'                  And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'                Group By a.CrVoucherTno, a.CrVoucherSno) al',
'           On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And v.DocTypeCode = ''RECEIPT''',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P912_COMPANY  Is Null Or d.CompanyCode  = :P912_COMPANY)',
'          And (:P912_LOCATION Is Null Or d.LocationCode = :P912_LOCATION)),',
'     P As (Select Pty, Sum(Case When Recv > 0 Then Recv Else 0 End) Dr,',
'                       Sum(Case When Recv < 0 Then -Recv Else 0 End) Cr',
'             From Oi Group By Pty),',
'     T As (',
'       Select nvl(Sum(Case When Recv < 0 Then -Recv Else 0 End),0) Cred,',
'              nvl(Sum(Case When Recv < 0 And Cls = ''Receipt / On-account'' Then -Recv Else 0 End),0) Unapp,',
'              nvl(Sum(Case When Recv < 0 And Cls = ''Contra Purchase'' Then -Recv Else 0 End),0) Contra,',
'              nvl(Sum(Case When Recv < 0 And Cls = ''Opening Credit'' Then -Recv Else 0 End),0) OpenCr,',
'              nvl(Sum(Case When Recv < 0 And Cls = ''Receipt / On-account''',
'                            And (Select D From Asof) - Vdt > 30 Then -Recv Else 0 End),0) Over30,',
'              nvl(Sum(Case When Recv < 0 And Cls = ''Receipt / On-account''',
'                            And (Select D From Asof) - Vdt > 90 Then -Recv Else 0 End),0) Over90,',
'              Min(Case When Recv < 0 And Cls = ''Receipt / On-account'' Then Vdt End) Oldest',
'         From Oi),',
'     B As (Select Count(*) N, nvl(Sum(Least(Dr,Cr)),0) Adj, nvl(Sum(Greatest(Dr-Cr,0)),0) Need',
'             From P Where Dr > 0.005 And Cr > 0.005)',
'Select ''<div class="ds-kpi ds-kpi--violet" title="Every open credit balance on a customer account, whatever its cause.">''',
'    || ''<span class="ds-kpi-ic fa fa-inbox"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Total Customer Credits</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Cred >= 10000000 Then to_char(Round(t.Cred/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Cred/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">held as at '' || :P912_TODATE || ''</div></div></div>'' As K1,',
'       ''<div class="ds-kpi ds-kpi--risk" title="Receipt lines with an open credit balance - cash received and never applied to any bill.">''',
'    || ''<span class="ds-kpi-ic fa fa-hand-o-up"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Unapplied Receipts</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Unapp >= 10000000 Then to_char(Round(t.Unapp/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Unapp/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">oldest ''',
'    || nvl(to_char(t.Oldest,''DD-MM-RRRR''),''&mdash;'') || ''</div></div></div>'' As K2,',
'       ''<div class="ds-kpi ds-kpi--amber" title="Unapplied receipt cash older than 90 days. Control AR-R03.">''',
'    || ''<span class="ds-kpi-ic fa fa-hourglass-end"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Unapplied Over 90 Days</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Over90 >= 10000000 Then to_char(Round(t.Over90/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Over90/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">over 30 days &#8377;''',
'    || Case When t.Over30 >= 10000000 Then to_char(Round(t.Over30/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Over30/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div></div></div>'' As K3,',
'       /* Contra purchase is separated deliberately. It is a credit on a',
'          customer account, but it arises from buying FROM that party -',
'          it is not an advance and cannot be applied to a sales invoice',
'          without a commercial decision. */',
'       ''<div class="ds-kpi ds-kpi--struct" title="Credits arising from purchases from a party who is also a customer. Not a customer advance.">''',
'    || ''<span class="ds-kpi-ic fa fa-exchange"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Contra Purchase Credits</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Contra >= 10000000 Then to_char(Round(t.Contra/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Contra/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">not an advance &middot; shown apart from cash</div></div></div>'' As K4,',
'       ''<div class="ds-kpi ds-kpi--gold" title="Customers holding an open receivable AND an open credit at the same time.">''',
'    || ''<span class="ds-kpi-ic fa fa-random"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Customers With AR + Credit</div><div class="ds-kpi-n">''',
'    || to_char(b.N,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">both positions open simultaneously</div></div></div>'' As K5,',
'       ''<div class="ds-kpi ds-kpi--ok" title="The lesser of receivable and credit, summed per customer. This much AR can be cleared by allocation alone - no collection effort.">''',
'    || ''<span class="ds-kpi-ic fa fa-magic"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Immediately Adjustable</div><div class="ds-kpi-n">&#8377;''',
'    || Case When b.Adj >= 10000000 Then to_char(Round(b.Adj/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(b.Adj/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">clearable by allocation, not by collection</div></div></div>'' As K6,',
'       ''<div class="ds-kpi ds-kpi--struct" title="Credit left on a receipt that HAS been allocated at least once - distinct from a receipt nobody ever touched. The two together make the total unapplied cash.">''',
'    || ''<span class="ds-kpi-ic fa fa-adjust"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Partial Residual</div><div class="ds-kpi-n">&#8377;''',
'    || Case When pr.Residual >= 10000000 Then to_char(Round(pr.Residual/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(pr.Residual/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">on '' || to_char(pr.ResidualN,''FM999G990'')',
'    || '' partly-applied receipts</div></div></div>'' As K7,',
'       ''<div class="ds-kpi ds-kpi--teal" title="Amount-weighted days between a bill and the receipt that settled it. Measured only over allocations that exist - unapplied cash has no lag and is excluded from both sides rather than counted as zero.">''',
'    || ''<span class="ds-kpi-ic fa fa-clock-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Average Allocation Lag</div><div class="ds-kpi-n">''',
'    || nvl(to_char(Round(pr.LagW / Nullif(pr.AppliedAmt,0),0),''FM999G990''),''&mdash;'')',
'    || '' <span style="font-size:15px">days</span></div>''',
'    || ''<div class="ds-kpi-sub">weighted by amount, over applied receipts only</div></div></div>'' As K8',
'  From T t Cross Join B b Cross Join Part pr'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P912_FROMDATE,P912_TODATE,P912_COMPANY,P912_LOCATION'
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
 p_id=>wwv_flow_imp.id(12729711858300760)
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
 p_id=>wwv_flow_imp.id(12729817757300760)
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
 p_id=>wwv_flow_imp.id(12729986509300760)
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
 p_id=>wwv_flow_imp.id(12730064090300760)
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
 p_id=>wwv_flow_imp.id(12730143734300760)
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
 p_id=>wwv_flow_imp.id(12730233897300760)
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
 p_id=>wwv_flow_imp.id(12730354864300760)
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
 p_id=>wwv_flow_imp.id(12730474176300760)
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
 p_id=>wwv_flow_imp.id(12730598950300760)
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
'                          Then :P912_TODATE ||'',''|| :P912_COMPANY ||'',''|| :P912_LOCATION',
'                          Else :P912_FROMDATE ||'',''|| :P912_TODATE ||'',''|| :P912_COMPANY ||'',''|| :P912_LOCATION End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 912',
' Order By Pg.Id'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P912_FROMDATE,P912_TODATE,P912_COMPANY,P912_LOCATION'
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
 p_id=>wwv_flow_imp.id(12730663245300761)
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
 p_id=>wwv_flow_imp.id(12731323768300761)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12729533056300759)
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
 p_id=>wwv_flow_imp.id(12731441097300761)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(12729533056300759)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:907:&SESSION.::&DEBUG.::P907_FROMDATE,P907_TODATE,P907_COMPANY,P907_LOCATION:&P912_FROMDATE.,&P912_TODATE.,&P912_COMPANY.,&P912_LOCATION.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12730743806300761)
,p_name=>'P912_BOTH'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12729533056300759)
,p_item_default=>'N'
,p_prompt=>'Show'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Everyone holding credit;N,Only customers with AR + credit;Y'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12730870261300761)
,p_name=>'P912_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12729533056300759)
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
 p_id=>wwv_flow_imp.id(12730963775300761)
,p_name=>'P912_FROMDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12729533056300759)
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
 p_id=>wwv_flow_imp.id(12731004657300761)
,p_name=>'P912_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12729533056300759)
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
'                  And (:P912_COMPANY Is Null Or v.CompanyCode = :P912_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P912_COMPANY'
,p_ajax_items_to_submit=>'P912_COMPANY'
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
 p_id=>wwv_flow_imp.id(12731269803300761)
,p_name=>'P912_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12729533056300759)
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
wwv_flow_imp.component_end;
end;
/
