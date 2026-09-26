prompt --application/pages/page_00306
begin
--   Manifest
--     PAGE: 00306
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>306
,p_name=>'Due  Balance Detail'
,p_alias=>'DUE-BALANCE-DETAIL'
,p_page_mode=>'MODAL'
,p_step_title=>'Due  Balance Detail'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function formatDate(date) {',
'  var monthNames = [',
'    "JAN", "FEB", "MAR",',
'    "APR", "MAY", "JUN", "JUL",',
'    "AUG", "SEP", "OCT",',
'    "NOV", "DEC"',
'  ];',
'',
'  var day = date.getDate();',
'  var monthIndex = date.getMonth();',
'  var year = date.getFullYear();',
'',
'  return day + ''-'' + monthNames[monthIndex] + ''-'' + year;',
'}',
'',
'function generatePDF() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var reportName = ''IRONMART/REPORT/DueBalanceDetail.xdo'';',
'  var outputFormat = ''pdf'';',
'  var DueOn = new Date($(''#P306_DUEON'').val());',
'  ',
'',
'  var reportParams = ',
'    ''&P_DUEON=''  +  $(''#P306_DUEON'').val() +',
'    ''&P_COMPANY='' +  $(''#P306_COMPANY'').val() +',
'    ''&P_LOCATION='' +  $(''#P306_LOCATION'').val() +',
'    ''&P_PARTY='' + $(''#P306_PARTY'').val() +',
'    ''&P_ZONE='' +  $(''#P306_ZONE'').val() ',
'    ;',
' ',
'//alert($v(''P306_PARTY''));',
'  var reportURL = bireporturl+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P306_BIREPORTURL'').val()',
'  var reportName =  ''DueBalanceDetail.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'',
'var reportParams = ',
'         ''"_paramsP_DUEON":"'' +$(''#P306_DUEON'').val() + ''",'' +',
'         ''"_paramsP_COMPANY":"'' +$(''#P306_COMPANY'').val() + ''",'' +',
'         ''"_paramsP_LOCATION":"'' +$(''#P306_LOCATION'').val() + ''",'' +',
'	     ''"_paramsP_PARTY":"'' + $(''#P306_PARTY'').val() + ''",'' + ',
'	     ''"_paramsP_ZONE":"'' + $(''#P306_ZONE'').val() ;',
'         ',
'     ',
'//alert($(''#P9993_TNO'').val());',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''&nQUser=''+ username +',
'              ''&nQPassword=''+ password +',
'              ''&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1",''+reportParams+''"}''',
'//alert(reportURL);',
'  window.open(reportURL, ''_blank'');',
'}',
'',
''))
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'800'
,p_dialog_width=>'1400'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(240868188655647255)
,p_plug_name=>'Due Balance Detail'
,p_static_id=>'due-balance-detail'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(244098437993399520)
,p_plug_name=>'Due Balance Detail'
,p_static_id=>'due-balance-detail-2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'          row_number() over(order by a.CCINVOICEDATE) SerialNo,',
'        a.PartyCode,',
'        a.CCInvoiceNo,',
'        a.CCInvoiceDate,',
'      --  a.TotalOutstanding,',
'        a.DueOn,',
'        a.CCINvoiceAmount,',
'        null as CD,',
'        a.OverDays,',
'        a.PartyPONo,',
'        a.PartyPODate,',
'        a.DueAmount,',
'        a.LocationCode,',
'        a.CompanyCode,',
'        a.Zonetype',
'From (Select ',
'        a.PartyCode,',
'        a.LocationCode,',
'          a.CompanyCode,',
'          c.Zonetype,',
'        a.CCInvoiceNo,',
'        a.CCInvoiceDate,',
'        a.CCINvoiceAmount,',
'        a.CCInvoiceAmount - Nvl(a.PaidAmount, 0) TotalOutstanding,',
'        null as DueOn,',
'        null as OverDays,',
'        b.PartyPONo,',
'        b.PartyPODate,',
'        Null As DueAmount',
'      From ccinvoice a, salesorder b, Party c',
'      Where a.salesordertno = b.tno',
'        and a.PartyCode = c.PartyCode',
'Union All',
'       Select ',
'          a.PartyCode,',
'          a.LocationCode,',
'          a.CompanyCode,',
'          c.Zonetype,',
'          a.CCInvoiceNo,',
'          a.CCInvoiceDate,',
'                a.CCINvoiceAmount,',
'          Null as TotalOutstanding,',
'          a.ccinvoicedate + b.creditdays as DueOn,',
'          Trunc(Sysdate)- (a.ccinvoicedate + b.creditdays) as Overdays,',
'          b.PartyPONo,',
'          b.PartyPODate,',
'          a.CCInvoiceAmount - Nvl(a.PaidAmount, 0) as DueAmount',
'       From ccinvoice a, salesorder b, Party c',
'       Where a.salesordertno = b.tno',
'        and a.PartyCode = c.PartyCode',
'        And a.ccinvoicedate + b.creditdays <= Trunc(Sysdate)',
'       )a',
'       Where trunc(a.DueOn) = :P306_DUEON',
'       and :P306_COMPANY = a.CompanyCode',
'       and :P306_PARTY = a.PartyCode',
'       and :P306_LOCATION = a.LocationCode',
'       and :P306_ZONE = a.Zonetype',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'GST Liability'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(244098622126399520)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>76179603660272078
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206060586454194271)
,p_db_column_name=>'CCINVOICEAMOUNT'
,p_display_order=>160
,p_column_identifier=>'AE'
,p_column_label=>'Bill Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206058885281194254)
,p_db_column_name=>'CCINVOICEDATE'
,p_display_order=>60
,p_column_identifier=>'U'
,p_column_label=>'CC Invoice Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206058753969194253)
,p_db_column_name=>'CCINVOICENO'
,p_display_order=>50
,p_column_identifier=>'T'
,p_column_label=>'CC Invoice No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206059166625194257)
,p_db_column_name=>'CD'
,p_display_order=>90
,p_column_identifier=>'X'
,p_column_label=>'CD'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206060338829194269)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>140
,p_column_identifier=>'AC'
,p_column_label=>'Companycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225118686827659977)
,p_db_column_name=>'DUEAMOUNT'
,p_display_order=>30
,p_column_identifier=>'P'
,p_column_label=>'Due Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206059021061194256)
,p_db_column_name=>'DUEON'
,p_display_order=>80
,p_column_identifier=>'W'
,p_column_label=>'Due On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206060279232194268)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>130
,p_column_identifier=>'AB'
,p_column_label=>'Locationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206059216485194258)
,p_db_column_name=>'OVERDAYS'
,p_display_order=>100
,p_column_identifier=>'Y'
,p_column_label=>'Over Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206058622408194252)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>40
,p_column_identifier=>'S'
,p_column_label=>'Partycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206059482024194260)
,p_db_column_name=>'PARTYPODATE'
,p_display_order=>120
,p_column_identifier=>'AA'
,p_column_label=>'Party PO Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206059335612194259)
,p_db_column_name=>'PARTYPONO'
,p_display_order=>110
,p_column_identifier=>'Z'
,p_column_label=>'Party PO No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189652312815099768)
,p_db_column_name=>'SERIALNO'
,p_display_order=>170
,p_column_identifier=>'AF'
,p_column_label=>'Serial No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206060447097194270)
,p_db_column_name=>'ZONETYPE'
,p_display_order=>150
,p_column_identifier=>'AD'
,p_column_label=>'Zonetype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(244112242647456395)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'190056'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SERIALNO:CCINVOICENO:CCINVOICEDATE:CD:DUEAMOUNT:DUEON:OVERDAYS:PARTYPODATE:PARTYPONO'
,p_sum_columns_on_break=>'TOTALOUTSTANDING'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(189928809476676747)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(240868188655647255)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_redirect_url=>'f?p=&APP_ID.:298:&SESSION.::&DEBUG.:::'
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(189929206061676751)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(244098437993399520)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pdf'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190046444333184819)
,p_name=>'P306_BIREPORTURL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(240868188655647255)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206064999656194266)
,p_name=>'P306_COMPANY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(240868188655647255)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206065306497194269)
,p_name=>'P306_DUEON'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(240868188655647255)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206065153949194268)
,p_name=>'P306_LOCATION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(240868188655647255)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(240883533561647291)
,p_name=>'P306_PARTY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(240868188655647255)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206065106319194267)
,p_name=>'P306_ZONE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(240868188655647255)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(189929274341676752)
,p_name=>'GeneratePDF'
,p_static_id=>'generatepdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(189929206061676751)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(189929377200676753)
,p_event_id=>wwv_flow_imp.id(189929274341676752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(190110048631516256)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190110501681516257)
,p_event_id=>wwv_flow_imp.id(190110048631516256)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp.component_end;
end;
/
