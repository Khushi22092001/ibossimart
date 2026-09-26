prompt --application/pages/page_00917
begin
--   Manifest
--     PAGE: 00700
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
 p_id=>917
,p_name=>'Daily Collection MIS'
,p_alias=>'AR-DAILY-MIS'
,p_step_title=>'Daily Collection MIS'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#hspl-jet-l10n-fallback.js?version=#APP_VERSION#&cb=20260924a'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'One day, closed off. Opening AR is the position at the start of the day, Closing AR the position at the end, and Billing less Collection less Credit Notes explains the difference between them - the reconciliation column proves it rather than assertin'
||'g it. Every figure comes from the same canonical open-item layer as the command centre, so this MIS and that dashboard cannot disagree. Due Today and Due Next 7 Days are available only where a due date exists, which is 28% of open receivable value; t'
||'he coverage is stated on the page rather than left for a reader to assume.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12749967683300900)
,p_plug_name=>'Collections Today'
,p_static_id=>'collections'
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
'     Bank As (',
'       Select Tno, AccountCode Bnk From (',
'         Select o.Tno, o.AccountCode,',
'                Row_Number() Over (Partition By o.Tno Order By o.Amount) Rn',
'           From VoucherDetail o',
'           Join Voucher bv On bv.Tno = o.Tno',
'          Where o.Amount < 0 And bv.DocTypeCode = ''RECEIPT''',
'            And o.AccountCode Not In (Select PartyCode From Sd))',
'        Where Rn = 1)',
'Select v.VoucherNo                                    As RECEIPT_NO,',
'       d.Tno                                          As VOUCHER_TNO,',
'       nvl(p.PartyName, d.AccountCode) As CUSTOMER,',
'       d.AccountCode                                  As PARTY_CODE,',
'       Round(d.Amount,2)                              As AMOUNT,',
'       nvl(bp.PartyName, b.Bnk)     As BANK_OR_CASH,',
'       v.MoneyTransferReferenceNo   As BANK_REFERENCE,',
'       nvl(l.LocationName, d.LocationCode) As LOCATION,',
'       substr(d.Narration,1,250)    As NARRATION',
'  From VoucherDetail d',
'  Join Voucher v On v.Tno = d.Tno',
'  Left Join Bank b On b.Tno = d.Tno',
'  Left Join Party bp On bp.PartyCode = b.Bnk',
'  Left Join Party p On p.PartyCode = d.AccountCode',
'  Left Join Location l On l.LocationCode = d.LocationCode',
' Where d.AccountCode In (Select PartyCode From Sd)',
'   And v.DocTypeCode = ''RECEIPT''',
'   And d.VoucherDate = to_date(:P917_DAY,''DD-MM-RRRR'')',
'   And (cast(null as varchar2(100)) Is Null',
'        Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'   And (null    Is Null Or cast(null as varchar2(100))        = null)',
'   And (:P917_COMPANY  Is Null Or d.CompanyCode  = :P917_COMPANY)',
'   And (:P917_LOCATION Is Null Or d.LocationCode = :P917_LOCATION)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P917_DAY,P917_COMPANY,P917_LOCATION'
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
 p_id=>wwv_flow_imp.id(12750058865300900)
,p_no_data_found_message=>'No collection was received on this day for the selected scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>70000000000000700
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12750132470300900)
,p_db_column_name=>'AMOUNT'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Amount (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12750236591300900)
,p_db_column_name=>'BANK_OR_CASH'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Bank / Cash'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12750354094300900)
,p_db_column_name=>'BANK_REFERENCE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Bank Reference'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12750456115300900)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Customer'
,p_column_link=>'f?p=&APP_ID.:910:&SESSION.::&DEBUG.:910:P910_PARTY,P910_TODATE:#PARTY_CODE#,&P917_DAY.'
,p_column_linktext=>'#CUSTOMER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12750510641300900)
,p_db_column_name=>'LOCATION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12750655978300900)
,p_db_column_name=>'NARRATION'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12750714817300901)
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
 p_id=>wwv_flow_imp.id(12750835895300901)
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
 p_id=>wwv_flow_imp.id(12750924954300901)
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
 p_id=>wwv_flow_imp.id(12751045103300901)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'70001'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'RECEIPT_NO:CUSTOMER:AMOUNT:BANK_OR_CASH:BANK_REFERENCE:LOCATION'
,p_sum_columns_on_break=>'AMOUNT'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12751111229300901)
,p_name=>'Daily Collection MIS'
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
'    || ''<div class="ds-ar-eyebrow">Receivables &middot; Daily MIS</div>''',
'    || ''<h1 class="ds-ar-title">Daily Collection MIS</h1>''',
'    || ''<div class="ds-ar-sub">Opening, movement and closing receivables for a single day, with the collection detail behind it</div>''',
'    || ''<div class="ds-ar-context">''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-calendar-o"></span>Report day <b>'' || :P917_DAY || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P917_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P917_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P917_DAY,P917_COMPANY,P917_LOCATION'
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
 p_id=>wwv_flow_imp.id(12751299821300901)
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
 p_id=>wwv_flow_imp.id(12751342661300901)
,p_name=>'What Falls Due Next'
,p_static_id=>'due-profile'
,p_template=>4072358936313175081
,p_display_sequence=>22
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_grid_column_span=>5
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     D As (Select to_date(:P917_DAY,''DD-MM-RRRR'') Dy From dual),',
'     Alc As (',
'       Select a.DrVoucherTno Tno, a.DrVoucherSno Sno, -Sum(a.Amount) Amt',
'         From DrCrAllocation a, Voucher dv, Voucher cv, D dd',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= dd.Dy And cv.VoucherDate <= dd.Dy',
'        Group By a.DrVoucherTno, a.DrVoucherSno',
'       Union All',
'       Select a.CrVoucherTno, a.CrVoucherSno, Sum(a.Amount)',
'         From DrCrAllocation a, Voucher dv, Voucher cv, D dd',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= dd.Dy And cv.VoucherDate <= dd.Dy',
'        Group By a.CrVoucherTno, a.CrVoucherSno),',
'     Al As (Select Tno, Sno, Sum(Amt) Amt From Alc Group By Tno, Sno),',
'     Oi As (',
'       Select -(d.Amount - nvl(al.Amt,0)) Recv,',
'              coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) DueDate',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join D dd',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= dd.Dy',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P917_COMPANY  Is Null Or d.CompanyCode  = :P917_COMPANY)',
'          And (:P917_LOCATION Is Null Or d.LocationCode = :P917_LOCATION))',
'Select Ord, Bucket, Amt, Note From (',
'  Select 10 Ord, ''Overdue as at the report day'' Bucket,',
'         Round(nvl(Sum(Case When Recv > 0 And DueDate < (Select Dy From D) Then Recv Else 0 End),0),2) Amt,',
'         ''due date already passed'' Note From Oi',
'  Union All',
'  Select 20, ''Due today'',',
'         Round(nvl(Sum(Case When Recv > 0 And DueDate = (Select Dy From D) Then Recv Else 0 End),0),2),',
'         ''falls due on the report day'' From Oi',
'  Union All',
'  Select 30, ''Due in the next 7 days'',',
'         Round(nvl(Sum(Case When Recv > 0 And DueDate > (Select Dy From D)',
'                             And DueDate <= (Select Dy From D) + 7 Then Recv Else 0 End),0),2),',
'         ''collectable this week'' From Oi',
'  Union All',
'  Select 40, ''Due in the next 30 days'',',
'         Round(nvl(Sum(Case When Recv > 0 And DueDate > (Select Dy From D)',
'                             And DueDate <= (Select Dy From D) + 30 Then Recv Else 0 End),0),2),',
'         ''collectable this month'' From Oi',
'  Union All',
'  Select 50, ''Cannot be scheduled - no due date'',',
'         Round(nvl(Sum(Case When Recv > 0 And DueDate Is Null Then Recv Else 0 End),0),2),',
'         ''no due date on the source document, so it appears in none of the lines above'' From Oi',
'  Union All',
'  Select 60, ''Unapplied customer cash'',',
'         Round(nvl(Sum(Case When Recv < 0 Then -Recv Else 0 End),0),2),',
'         ''money already held that could reduce the above by allocation alone'' From Oi',
') Order By Ord'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P917_DAY,P917_COMPANY,P917_LOCATION'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No open receivable as at this day.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12751411099300901)
,p_query_column_id=>3
,p_column_alias=>'AMT'
,p_column_display_sequence=>30
,p_column_heading=>unistr('Amount (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12751508218300901)
,p_query_column_id=>2
,p_column_alias=>'BUCKET'
,p_column_display_sequence=>20
,p_column_heading=>'Bucket'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12751686165300901)
,p_query_column_id=>4
,p_column_alias=>'NOTE'
,p_column_display_sequence=>40
,p_column_heading=>'Meaning'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12751736115300902)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12751855929300902)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p700Filters'
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
 p_id=>wwv_flow_imp.id(12751913773300902)
,p_name=>'Daily Position'
,p_static_id=>'mis-summary'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_grid_column_span=>7
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Opening and closing are POSITIONS re-derived at two dates; billing,',
'   collection and credit notes are FLOWS inside the day. The movement',
'   line then reconciles the two positions against the three flows, and',
'   the residual is shown rather than suppressed - on this ledger it is',
'   rarely zero, because journals and payments to customers also move the',
'   control account and are not part of "billing less collection". */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     D As (Select to_date(:P917_DAY,''DD-MM-RRRR'') Dy From dual),',
'     Pos As (',
'       /* Both positions in one pass: the previous day close and the',
'          report-day close, so they see one snapshot of the ledger. */',
'       Select Sum(Case When d.VoucherDate <  dd.Dy Then -d.Amount Else 0 End) OpenNet,',
'              Sum(Case When d.VoucherDate <= dd.Dy Then -d.Amount Else 0 End) CloseNet',
'         From VoucherDetail d Cross Join D dd',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= dd.Dy',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P917_COMPANY  Is Null Or d.CompanyCode  = :P917_COMPANY)',
'          And (:P917_LOCATION Is Null Or d.LocationCode = :P917_LOCATION)),',
'     Flow As (',
'       Select nvl(Sum(Case When v.DocTypeCode In (''SALE'',''SERVICEBILL'') And d.Amount < 0',
'                           Then -d.Amount Else 0 End),0) Billing,',
'              nvl(Sum(Case When v.DocTypeCode = ''RECEIPT'' And d.Amount > 0',
'                           Then d.Amount Else 0 End),0) Collection,',
'              nvl(Count(Distinct Case When v.DocTypeCode = ''RECEIPT'' Then d.Tno End),0) RcptCount,',
'              nvl(Sum(Case When v.DocTypeCode = ''CREDITNOTE'' And d.Amount > 0',
'                           Then d.Amount Else 0 End),0) CreditNotes,',
'              nvl(Sum(Case When v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'') And d.Amount < 0',
'                           Then -d.Amount Else 0 End),0) PaidOut,',
'              nvl(Sum(Case When v.DocTypeCode = ''JOURNAL'' Then -d.Amount Else 0 End),0) Journals',
'         From VoucherDetail d Join Voucher v On v.Tno = d.Tno Cross Join D dd',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate = dd.Dy',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P917_COMPANY  Is Null Or d.CompanyCode  = :P917_COMPANY)',
'          And (:P917_LOCATION Is Null Or d.LocationCode = :P917_LOCATION))',
'Select Ord, Line, Amt, Note From (',
'  Select 10 Ord, ''Opening AR (net) at start of day'' Line, Round(p.OpenNet,2) Amt,',
'         ''position carried in from the previous day'' Note From Pos p',
'  Union All',
'  Select 20, ''Add: Billing raised today'', Round(f.Billing,2),',
'         ''SALE and SERVICEBILL debits'' From Flow f',
'  Union All',
'  Select 30, ''Less: Collections received today'', Round(-f.Collection,2),',
'         to_char(f.RcptCount,''FM999G990'') || '' receipt vouchers - actual transactions, not a fall in balance'' From Flow f',
'  Union All',
'  Select 40, ''Less: Credit notes issued today'', Round(-f.CreditNotes,2),',
'         ''CREDITNOTE credits'' From Flow f',
'  Union All',
'  Select 50, ''Add: Payments made to customers today'', Round(f.PaidOut,2),',
'         ''PAYMENT, CASHPAYMENT and BANKPAYMENT debits - money out, but a debit on the customer'' From Flow f',
'  Union All',
'  Select 60, ''Net journal and other movement'', Round(f.Journals,2),',
'         ''JOURNAL postings to the control account'' From Flow f',
'  Union All',
'  Select 70, ''Closing AR (net) at end of day'', Round(p.CloseNet,2),',
'         ''position as at the report day'' From Pos p',
'  Union All',
'  Select 80, ''Unexplained residual'',',
'         Round(p.CloseNet - p.OpenNet - f.Billing + f.Collection + f.CreditNotes - f.PaidOut - f.Journals,2),',
'         ''closing less opening less the movements above - anything here is a posting type this MIS does not name''',
'    From Pos p Cross Join Flow f',
') Order By Ord'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P917_DAY,P917_COMPANY,P917_LOCATION'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No ledger activity on this day for the selected scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12752069483300902)
,p_query_column_id=>3
,p_column_alias=>'AMT'
,p_column_display_sequence=>30
,p_column_heading=>unistr('Amount (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12752156405300902)
,p_query_column_id=>2
,p_column_alias=>'LINE'
,p_column_display_sequence=>20
,p_column_heading=>'Line'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12752213553300902)
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
 p_id=>wwv_flow_imp.id(12752349559300902)
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
 p_id=>wwv_flow_imp.id(12752493503300902)
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
'                          Then :P917_DAY ||'',''|| :P917_COMPANY ||'',''|| :P917_LOCATION',
'                          Else :P917_DAY ||'',''|| :P917_DAY ||'',''|| :P917_COMPANY ||'',''|| :P917_LOCATION End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 917',
' Order By Pg.Id'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P917_DAY,P917_COMPANY,P917_LOCATION'
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
 p_id=>wwv_flow_imp.id(12752508835300903)
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
 p_id=>wwv_flow_imp.id(12752698786300903)
,p_plug_name=>'Detail'
,p_static_id=>'rule-detail'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>28
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Collections Received Today</h2>',
'  <p>Every receipt posted on the report day, largest first</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12752745403300903)
,p_name=>'Largest Overdue Positions'
,p_static_id=>'top-overdue'
,p_template=>4072358936313175081
,p_display_sequence=>40
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Capped at 20 and the cap is stated in the heading - a silently',
'   truncated "top" list reads as a complete one. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     D As (Select to_date(:P917_DAY,''DD-MM-RRRR'') Dy From dual),',
'     Alc As (',
'       Select a.DrVoucherTno Tno, a.DrVoucherSno Sno, -Sum(a.Amount) Amt',
'         From DrCrAllocation a, Voucher dv, Voucher cv, D dd',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= dd.Dy And cv.VoucherDate <= dd.Dy',
'        Group By a.DrVoucherTno, a.DrVoucherSno',
'       Union All',
'       Select a.CrVoucherTno, a.CrVoucherSno, Sum(a.Amount)',
'         From DrCrAllocation a, Voucher dv, Voucher cv, D dd',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= dd.Dy And cv.VoucherDate <= dd.Dy',
'        Group By a.CrVoucherTno, a.CrVoucherSno),',
'     Al As (Select Tno, Sno, Sum(Amt) Amt From Alc Group By Tno, Sno),',
'     G As (',
'       Select d.AccountCode Pty,',
'              Sum(Case When -(d.Amount - nvl(al.Amt,0)) > 0',
'                        And coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) < (Select Dy From D)',
'                       Then -(d.Amount - nvl(al.Amt,0)) Else 0 End) Overdue,',
'              Sum(Case When -(d.Amount - nvl(al.Amt,0)) > 0',
'                       Then -(d.Amount - nvl(al.Amt,0)) Else 0 End) Gross,',
'              Sum(Case When -(d.Amount - nvl(al.Amt,0)) < 0',
'                       Then  (d.Amount - nvl(al.Amt,0)) Else 0 End) Credit',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Al al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'         Cross Join D dd',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate <= dd.Dy',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P917_COMPANY  Is Null Or d.CompanyCode  = :P917_COMPANY)',
'          And (:P917_LOCATION Is Null Or d.LocationCode = :P917_LOCATION)',
'        Group By d.AccountCode)',
'Select * From (',
'  Select apex_escape.html(nvl(p.PartyName, g.Pty)) As CUSTOMER,',
'         g.Pty                                     As PARTY_CODE,',
'         Round(g.Overdue,2)                        As OVERDUE,',
'         Round(g.Gross,2)                          As GROSS,',
'         Round(g.Credit,2)                         As CREDIT_HELD,',
'         Round(Least(g.Gross, g.Credit),2)         As ADJUSTABLE_NOW',
'    From G g Left Join Party p On p.PartyCode = g.Pty',
'   Where g.Overdue > 0.005',
'   Order By g.Overdue Desc)',
' Where rownum <= 20'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P917_DAY,P917_COMPANY,P917_LOCATION'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No customer is overdue as at this day, on the due-date basis.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12752849735300903)
,p_query_column_id=>6
,p_column_alias=>'ADJUSTABLE_NOW'
,p_column_display_sequence=>60
,p_column_heading=>unistr('Adjustable Now (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12752917427300903)
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
 p_id=>wwv_flow_imp.id(12753054507300903)
,p_query_column_id=>1
,p_column_alias=>'CUSTOMER'
,p_column_display_sequence=>10
,p_column_heading=>'Customer (top 20 by overdue)'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12753172693300903)
,p_query_column_id=>4
,p_column_alias=>'GROSS'
,p_column_display_sequence=>40
,p_column_heading=>unistr('Gross Receivable (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12753276378300903)
,p_query_column_id=>3
,p_column_alias=>'OVERDUE'
,p_column_display_sequence=>30
,p_column_heading=>unistr('Overdue (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12753334786300903)
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
 p_id=>wwv_flow_imp.id(12753844647300904)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(12751855929300902)
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
 p_id=>wwv_flow_imp.id(12753961448300904)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12751855929300902)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:907:&SESSION.::&DEBUG.::P907_TODATE,P907_COMPANY,P907_LOCATION:&P917_DAY.,&P917_COMPANY.,&P917_LOCATION.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12753467184300903)
,p_name=>'P917_COMPANY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12751855929300902)
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
 p_id=>wwv_flow_imp.id(12753575796300903)
,p_name=>'P917_DAY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12751855929300902)
,p_item_default=>'Select to_char(trunc(sysdate),''DD-MM-RRRR'') From dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Report Day'
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
 p_id=>wwv_flow_imp.id(12753650048300904)
,p_name=>'P917_LOCATION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12751855929300902)
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
'                  And (:P917_COMPANY Is Null Or v.CompanyCode = :P917_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P917_COMPANY'
,p_ajax_items_to_submit=>'P917_COMPANY'
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
wwv_flow_imp.component_end;
end;
/
