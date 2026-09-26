prompt --application/pages/page_00914
begin
--   Manifest
--     PAGE: 00697
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
 p_id=>914
,p_name=>'AR Reconciliation and Data Health'
,p_alias=>'AR-RECONCILIATION'
,p_step_title=>'AR Reconciliation and Data Health'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#hspl-jet-l10n-fallback.js?version=#APP_VERSION#&cb=20260924a'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'The AR analytical balance against the SUNDRYDEBTORS general-ledger control account, executed rather than asserted. The comparison is made INSIDE ONE STATEMENT so both sides see one read-consistent snapshot - this ERP is written continuously and two s'
||'tatements minutes apart legitimately disagree. This is a TWO-way reconciliation, not the three-way the brief describes, and deliberately so: there is no independent customer subledger table in this ERP. AccountOpening is a migration register, not a r'
||'unning subledger, so comparing AR to it would be comparing the ledger to itself and printing Reconciled. Differences are compared at full precision with a half-paisa tolerance and never against a rounded display value.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12738076625300822)
,p_plug_name=>'Reconciliation by Company, Location and Customer'
,p_static_id=>'by-dimension'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Three grains in one report, unpivoted, so a reader can start at the',
'   company level and walk down without changing page. Every level is',
'   computed from the same Base CTE, so the levels cannot disagree with',
'   each other or with the band above. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P914_TODATE,''DD-MM-RRRR'') D From dual),',
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
'     Base As (',
'       Select d.CompanyCode Cmp, d.LocationCode Loc, d.AccountCode Pty,',
'              -(d.Amount - nvl(al.Amt,0)) Anl, -d.Amount Gl',
'         From VoucherDetail d',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P914_COMPANY  Is Null Or d.CompanyCode  = :P914_COMPANY)',
'          And (:P914_LOCATION Is Null Or d.LocationCode = :P914_LOCATION)),',
'     Lv As (',
'       Select 1 Ord, ''Company'' Lvl, nvl(c.CompanyName, b.Cmp) Nm, b.Cmp Code,',
'              Sum(b.Anl) Anl, Sum(b.Gl) Gl',
'         From Base b Left Join Company c On c.CompanyCode = b.Cmp',
'        Group By b.Cmp, c.CompanyName',
'       Union All',
'       Select 2, ''Location'', nvl(l.LocationName, b.Loc), b.Loc,',
'              Sum(b.Anl), Sum(b.Gl)',
'         From Base b Left Join Location l On l.LocationCode = b.Loc',
'        Group By b.Loc, l.LocationName',
'       Union All',
'       Select 3, ''Customer'', nvl(p.PartyName, b.Pty), b.Pty,',
'              Sum(b.Anl), Sum(b.Gl)',
'         From Base b Left Join Party p On p.PartyCode = b.Pty',
'        Group By b.Pty, p.PartyName)',
'Select Lvl                                       As LEVEL_NAME,',
'       Nm                      As NAME,',
'       Code                                      As CODE,',
'       Round(Anl,2)                              As AR_ANALYTICAL,',
'       Round(Gl,2)                               As GL_CONTROL,',
'       Round(Anl - Gl,2)                         As DIFFERENCE,',
'       Case When Abs(Anl - Gl) < 0.005',
'                 Then ''<span class="ds-archip ds-archip--pass">Reconciled</span>''',
'            When Abs(Anl - Gl) < 1',
'                 Then ''<span class="ds-archip ds-archip--warn">Rounding</span>''',
'            Else ''<span class="ds-archip ds-archip--fail">Out of balance</span>'' End As STATUS',
'  From Lv',
' Where (:P914_LEVEL Is Null Or :P914_LEVEL = ''ALL'' Or Lvl = :P914_LEVEL)',
'   And (nvl(:P914_ONLYBREAKS,''N'') <> ''Y'' Or Abs(Anl - Gl) >= 0.005)',
' Order By Ord, Abs(Anl - Gl) Desc, Nm'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P914_FROMDATE,P914_TODATE,P914_COMPANY,P914_LOCATION,P914_LEVEL,P914_ONLYBREAKS'
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
 p_id=>wwv_flow_imp.id(12738168791300822)
,p_max_row_count=>'200000'
,p_no_data_found_message=>'Every level in this scope reconciles exactly.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>69700000000000697
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12738221445300822)
,p_db_column_name=>'AR_ANALYTICAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('AR Analytical (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12738372008300822)
,p_db_column_name=>'CODE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12738469930300822)
,p_db_column_name=>'DIFFERENCE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Difference (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12738563802300822)
,p_db_column_name=>'GL_CONTROL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('GL Control (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12738627724300822)
,p_db_column_name=>'LEVEL_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Level'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12738759113300822)
,p_db_column_name=>'NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12738812172300822)
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
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12738902989300823)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69701'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LEVEL_NAME:NAME:AR_ANALYTICAL:GL_CONTROL:DIFFERENCE:STATUS'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12739081598300823)
,p_name=>'AR Reconciliation and Data Health'
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
'    || ''<div class="ds-ar-eyebrow">Receivables &middot; Reconciliation</div>''',
'    || ''<h1 class="ds-ar-title">AR Reconciliation &amp; Data Health</h1>''',
'    || ''<div class="ds-ar-sub">Does the open-item register equal the general-ledger control account? Tested per company, per location and per customer.</div>''',
'    || ''<div class="ds-ar-context">''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-crosshairs"></span>As at <b>'' || :P914_TODATE || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-sitemap"></span>Control account <b>SUNDRYDEBTORS</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P914_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P914_FROMDATE,P914_TODATE,P914_COMPANY,P914_LOCATION'
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
 p_id=>wwv_flow_imp.id(12739103942300823)
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
 p_id=>wwv_flow_imp.id(12739231908300823)
,p_name=>'Cross-location settlement basis'
,p_static_id=>'crossloc-note'
,p_template=>4072358936313175081
,p_display_sequence=>35
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* A REPORT, not static text. A LOCATION-level reconciliation can',
'   legitimately fail to tie: a receipt taken at one location settles a',
'   bill raised at another, so the allocation lands on a location the',
'   reader may have filtered out. Measured here: 34 such allocations',
'   exist, and 2 locations are out of balance because of them, while',
'   every company ties exactly (0 allocations cross a company boundary).',
'   A controller who sees "Out of balance" on a location without this',
'   sentence would chase a problem that is not there - so the note is',
'   emitted only when cross-location allocations actually exist in',
'   scope, and stays hidden otherwise. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     X As (',
'       Select Count(*) N, nvl(Sum(a.Amount),0) Amt',
'         From DrCrAllocation a',
'         Join VoucherDetail dd On dd.Tno = a.DrVoucherTno And dd.Sno = a.DrVoucherSno',
'         Join VoucherDetail cd On cd.Tno = a.CrVoucherTno And cd.Sno = a.CrVoucherSno',
'        Where dd.LocationCode <> cd.LocationCode',
'          And (dd.AccountCode In (Select PartyCode From Sd)',
'            Or cd.AccountCode In (Select PartyCode From Sd)))',
'Select ''<div class="ds-arnote ds-arnote--warn"><span class="fa fa-exchange"></span><div>''',
'    || ''<b>A single location can legitimately fail to reconcile.</b> ''',
'    || to_char(x.N,''FM999G990'') || '' allocation''',
'    || Case When x.N = 1 Then '''' Else ''s'' End',
'    || '' in this ledger settle a bill raised at one location with a receipt taken at another, worth &#8377;''',
'    || to_char(Round(x.Amt,2),''FM999G99G99G990D00'') || '' in total. ''',
'    || ''The bill''''s origin location and the receipt''''s location are different dimensions, so filtering to one ''',
'    || ''location can put the two halves of a settlement on opposite sides of the filter. ''',
'    || ''<b>Company level always ties</b> &mdash; no allocation in this ledger crosses a company boundary. ''',
'    || ''Clear the Location filter, or read at Company level, to see the balanced position. ''',
'    || ''The individual crossings are listed under control <b>AR-A08</b>.''',
'    || ''</div></div>'' As NOTE',
'  From X x',
' Where x.N > 0'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P914_TODATE,P914_COMPANY,P914_LOCATION'
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
 p_id=>wwv_flow_imp.id(12739377263300823)
,p_query_column_id=>1
,p_column_alias=>'NOTE'
,p_column_display_sequence=>10
,p_column_heading=>'NOTE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12739436044300823)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p697Filters'
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
 p_id=>wwv_flow_imp.id(12739535701300823)
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
'                          Then :P914_TODATE ||'',''|| :P914_COMPANY ||'',''|| :P914_LOCATION',
'                          Else :P914_FROMDATE ||'',''|| :P914_TODATE ||'',''|| :P914_COMPANY ||'',''|| :P914_LOCATION End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 914',
' Order By Pg.Id'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P914_FROMDATE,P914_TODATE,P914_COMPANY,P914_LOCATION'
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
 p_id=>wwv_flow_imp.id(12739679898300824)
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
 p_id=>wwv_flow_imp.id(12739726910300824)
,p_plug_name=>'What this page does and does not reconcile'
,p_static_id=>'scope-note'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-arnote"><span class="fa fa-balance-scale"></span><div>',
'  <b>This is a two-way reconciliation: AR analytical against the general-ledger control account.</b>',
'  The brief asks for a three-way test including a customer subledger &mdash; <b>this ERP has no independent',
'  customer subledger table.</b> <code>AccountOpening</code> is a migration register (bill number, bill date,',
'  paid amount), not a running subledger, and a control account here is a <i>group node</i> in the chart of',
'  accounts whose balance <i>is</i> the sum of its members by construction. A third column would be the ledger',
'  compared to itself, and would print &ldquo;Reconciled&rdquo; whatever the data did. It is therefore not shown.',
'  <br><br>',
'  Company-, location- and party-level tests <b>are</b> meaningful, because <code>VoucherDetail</code> carries',
'  <code>CompanyCode</code> and <code>LocationCode</code> on every line; these are Ironmart''s business-scope dimensions.',
'</div></div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12739812708300824)
,p_name=>'Reconciliation Result'
,p_static_id=>'tieout'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Both sides computed in ONE statement. The analytical side applies the',
'   full allocation logic; the GL side is the raw signed sum with no',
'   allocation logic at all. They agree only if allocations net to zero',
'   inside the control account - which is exactly what the orphan-',
'   allocation control (AR-A05) protects. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P914_TODATE,''DD-MM-RRRR'') D From dual),',
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
'     Base As (',
'       Select d.CompanyCode Cmp, d.LocationCode Loc, d.AccountCode Pty,',
'              -(d.Amount - nvl(al.Amt,0)) Anl,',
'              -d.Amount Gl',
'         From VoucherDetail d',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Cross Join Asof',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= Asof.D',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P914_COMPANY  Is Null Or d.CompanyCode  = :P914_COMPANY)',
'          And (:P914_LOCATION Is Null Or d.LocationCode = :P914_LOCATION)),',
'     T As (Select Sum(Anl) Anl, Sum(Gl) Gl,',
'                  Count(Distinct Pty) Pty, Count(Distinct Cmp) Cmp From Base),',
'     Orph As (',
'       /* The exposure the two-header join keeps out. Reported as',
'          "avoided", not as a difference - because it is not in either',
'          number above. Saying nothing about it would leave the reader',
'          unaware that the tie depends on a deliberate exclusion. */',
'       Select nvl(Sum(Case',
'                When (Select Max(1) From VoucherDetail d',
'                       Where d.Tno = a.DrVoucherTno And d.Sno = a.DrVoucherSno',
'                         And d.AccountCode In (Select PartyCode From Sd)) = 1 Then -a.Amount',
'                Else 0 End',
'              + Case',
'                When (Select Max(1) From VoucherDetail d',
'                       Where d.Tno = a.CrVoucherTno And d.Sno = a.CrVoucherSno',
'                         And d.AccountCode In (Select PartyCode From Sd)) = 1 Then a.Amount',
'                Else 0 End),0) Amt,',
'              Count(*) N',
'         From DrCrAllocation a',
'        Where (Not Exists (Select 1 From Voucher v Where v.Tno = a.DrVoucherTno)',
'            Or Not Exists (Select 1 From Voucher v Where v.Tno = a.CrVoucherTno))',
'          And ((Select Max(1) From VoucherDetail d',
'                 Where d.Tno = a.DrVoucherTno And d.Sno = a.DrVoucherSno',
'                   And d.AccountCode In (Select PartyCode From Sd)) = 1',
'            Or (Select Max(1) From VoucherDetail d',
'                 Where d.Tno = a.CrVoucherTno And d.Sno = a.CrVoucherSno',
'                   And d.AccountCode In (Select PartyCode From Sd)) = 1))',
'Select ''<div class="ds-arexp">''',
'    || ''<div class="ds-arexp-cell ds-arexp-cell--recv"><dl>''',
'    || ''<dt>AR Analytical Balance</dt><dd>&#8377;''',
'    || to_char(Round(t.Anl,2),''FM999G99G99G990D00'') || ''</dd>''',
'    || ''<div class="ds-arexp-sub">open-item register &middot; ''',
'    || to_char(t.Pty,''FM999G990'') || '' customers across '' || t.Cmp || '' companies</div></dl></div>''',
'    || ''<div class="ds-arexp-cell ds-arexp-cell--cred"><dl>''',
'    || ''<dt>GL Control (SUNDRYDEBTORS)</dt><dd>&#8377;''',
'    || to_char(Round(t.Gl,2),''FM999G99G99G990D00'') || ''</dd>''',
'    || ''<div class="ds-arexp-sub">signed VoucherDetail sum &middot; no allocation logic applied</div></dl></div>''',
'    || ''<div class="ds-arexp-cell ds-arexp-cell--net"><dl>''',
'    || ''<dt>Difference</dt><dd>&#8377;''',
'    || to_char(Round(t.Anl - t.Gl,2),''FM999G99G99G990D00'') || ''</dd>''',
'    || ''<div class="ds-arexp-sub">compared at full precision, tolerance half a paisa</div>''',
'    || Case When Abs(t.Anl - t.Gl) < 0.005',
'            Then ''<span class="ds-arexp-tie ds-arexp-tie--ok"><span class="fa fa-check"></span>Reconciled</span>''',
'            Else ''<span class="ds-arexp-tie ds-arexp-tie--bad"><span class="fa fa-exclamation-triangle"></span>Out of balance</span>'' End',
'    || ''</dl></div></div>''',
'    || Case When o.N > 0 Then',
'         ''<div class="ds-arnote ds-arnote--warn"><span class="fa fa-unlink"></span><div>''',
'         || ''<b>The tie above depends on one deliberate exclusion.</b> ''',
'         || to_char(o.N,''FM999G990'') || '' orphan allocation row''',
'         || Case When o.N = 1 Then '''' Else ''s'' End',
'         || '' reference a voucher that no longer exists and touch this control account. ''',
'         || ''The canonical AR layer excludes them by joining both voucher headers. Were they honoured, AR would move by <b>&#8377;''',
'         || to_char(Round(o.Amt,2),''FM999G99G99G990D00'') || ''</b> against the general ledger. ''',
'         || ''This ERP has no reversal mechanism - voucher deletion is its only cancellation - so these are the residue of deleted vouchers. ''',
'         || ''They are listed under control <b>AR-A05</b>.''',
'         || ''</div></div>'' End As BAND',
'  From T t Cross Join Orph o'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P914_FROMDATE,P914_TODATE,P914_COMPANY,P914_LOCATION'
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
 p_id=>wwv_flow_imp.id(12739922703300824)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12740778636300825)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(12739436044300823)
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
 p_id=>wwv_flow_imp.id(12740877371300825)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(12739436044300823)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:907:&SESSION.::&DEBUG.::P907_FROMDATE,P907_TODATE,P907_COMPANY,P907_LOCATION:&P914_FROMDATE.,&P914_TODATE.,&P914_COMPANY.,&P914_LOCATION.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12740073132300824)
,p_name=>'P914_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12739436044300823)
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
 p_id=>wwv_flow_imp.id(12740184837300824)
,p_name=>'P914_FROMDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12739436044300823)
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
 p_id=>wwv_flow_imp.id(12740277121300825)
,p_name=>'P914_LEVEL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12739436044300823)
,p_item_default=>'Company'
,p_prompt=>'Level'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:All levels;ALL,Company;Company,Location;Location,Customer;Customer'
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
 p_id=>wwv_flow_imp.id(12740384724300825)
,p_name=>'P914_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12739436044300823)
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
'                  And (:P914_COMPANY Is Null Or v.CompanyCode = :P914_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P914_COMPANY'
,p_ajax_items_to_submit=>'P914_COMPANY'
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
 p_id=>wwv_flow_imp.id(12740457970300825)
,p_name=>'P914_ONLYBREAKS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(12739436044300823)
,p_item_default=>'N'
,p_prompt=>'Rows'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:All rows;N,Breaks only;Y'
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
 p_id=>wwv_flow_imp.id(12740690013300825)
,p_name=>'P914_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12739436044300823)
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
