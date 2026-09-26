prompt --application/pages/page_00298
begin
--   Manifest
--     PAGE: 00298
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
 p_id=>298
,p_name=>'Due Outstanding Balance'
,p_alias=>'DUE-OUTSTANDING-BALANCE'
,p_step_title=>'Due Outstanding Balance'
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
'  var reportName = ''IRONMART/REPORT/DueOutstandingBalance.xdo'';',
'  var outputFormat = ''pdf'';',
'  var DueDate = new Date($(''#P298_DUEDATE'').val());',
'  ',
'',
'  var reportParams = ',
'    ''&P_DUEDATE=''  +  $(''#P298_DUEDATE'').val() +',
'    ''&P_COMPANY='' +  $(''#P298_COMPANY'').val() +',
'    ''&P_LOCATION='' +  $(''#P298_LOCATION'').val() +',
'    ''&P_PARTY='' + $(''#P298_PARTY'').val() +',
'    ''&P_ZONE='' +  $(''#P298_ZONE'').val() ',
'    ;',
' ',
'//alert($v(''P298_PARTY''));',
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
'  var bireporturl = $(''#P298_BIREPORTURL'').val()',
'  var reportName =  ''DueOutstandingBalance.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'',
'var reportParams = ',
'         ''"_paramsP_DUEDATE":"'' +$(''#P298_DUEDATE'').val() + ''",'' +',
'         ''"_paramsP_COMPANY":"'' +$(''#P298_COMPANY'').val() + ''",'' +',
'         ''"_paramsP_LOCATION":"'' +$(''#P298_LOCATION'').val() + ''",'' +',
'	     ''"_paramsP_PARTY":"'' + $(''#P298_PARTY'').val() + ''",'' + ',
'	     ''"_paramsP_ZONE":"'' + $(''#P298_ZONE'').val() ;',
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
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(202707788976516423)
,p_plug_name=>'Due Outstanding Balance'
,p_static_id=>'due-outstanding-balance'
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
 p_id=>wwv_flow_imp.id(205938038314268688)
,p_plug_name=>'Due Outstanding Balance'
,p_static_id=>'due-outstanding-balance-2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'     --  row_number() over(order by a.PartyCode) SerialNo,',
'       a.Party,',
'       A.PARTYCODE,',
'       Sum(a.TotalOutstanding) As OutstandingAmount,',
'       Sum(a.DueAmount) As DueAmount/*,',
'       a.DueDate,',
'       a.Zonetype,',
'        a.CompanyCode,',
'        a.PartyCode,',
'        a.LocationCode*/',
'From (Select ',
'        GetPartyName(a.PartyCode) as party,',
'        a.CompanyCode,',
'        a.PartyCode,',
'        a.LocationCode,',
'        Sum(a.CCInvoiceAmount - Nvl(a.PaidAmount, 0)) TotalOutstanding,',
'        Null As DueAmount,',
'         (a.ccinvoicedate + b.creditdays) as DueDate,',
'         c.Zonetype',
'      From ccinvoice a, salesorder b, Party c',
'      Where a.salesordertno = b.tno(+)',
'        and a.PartyCode = c.PartyCode(+)',
'      Group By getpartyname(a.partycode),',
'       a.ccinvoicedate,',
'       b.creditdays,',
'       a.CompanyCode,',
'       a.PartyCode,',
'       a.LocationCode,',
'        c.Zonetype',
'Union All',
'       Select ',
'          GetPartyName(a.PartyCode) as party,',
'          a.CompanyCode,',
'          a.PartyCode,',
'          a.LocationCode,',
'          Null as TotalOutstanding,',
'          Sum(a.CCInvoiceAmount - Nvl(a.PaidAmount, 0)) as DueAmount,',
'          (a.ccinvoicedate + b.creditdays) as DueDate,',
'           c.Zonetype',
'       From ccinvoice a, salesorder b, Party c',
'       Where a.salesordertno = b.tno(+)',
'        and a.PartyCode = c.PartyCode(+)',
'        And a.ccinvoicedate + b.creditdays <= Trunc(Sysdate)',
'       Group By getpartyname(a.partycode),',
'         a.ccinvoicedate,',
'         b.creditdays,',
'         a.CompanyCode,',
'         a.PartyCode,',
'         a.LocationCode,',
'         c.Zonetype)a',
' Where trunc(a.DueDate) <= :P298_DUEDATE',
' and ( :P298_COMPANY IS NULL OR instr('':''||:P298_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 ) ',
' and ( :P298_PARTY IS NULL OR instr('':''||:P298_PARTY||'':'','':''||a.PartyCode||'':'') > 0 )',
' and ( :P298_LOCATION IS NULL OR instr('':''||:P298_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
' and ( :P298_ZONE IS NULL OR instr('':''||:P298_ZONE||'':'','':''||a.Zonetype||'':'') > 0 )',
' Group By a.party,A.PARTYCODE',
' /*, ',
'      a.DueDate, ',
'      a.Zonetype, ',
'       a.CompanyCode,',
'        a.PartyCode,',
'        a.LocationCode',
'*/'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'GST Liability'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(205938222447268688)
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
,p_internal_uid=>38019203981141246
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186958287148529145)
,p_db_column_name=>'DUEAMOUNT'
,p_display_order=>30
,p_column_identifier=>'P'
,p_column_label=>'Due Amount'
,p_column_link=>'f?p=&APP_ID.:299:&SESSION.::&DEBUG.:299:P299_COMPANY,P299_LOCATION,P299_PARTY,P299_DUEON,P306_ZONE:&P298_COMPANY.,&P298_LOCATION.,#PARTYCODE#,&P298_DUEDATE.,&P298_ZONE.#COMPANYCODE#,#LOCATIONCODE#,#PARTYCODE#,#DUEDATE#,#ZONETYPE#'
,p_column_linktext=>'#DUEAMOUNT#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186958155372529144)
,p_db_column_name=>'OUTSTANDINGAMOUNT'
,p_display_order=>20
,p_column_identifier=>'O'
,p_column_label=>'Out Standing Amount'
,p_column_link=>'f?p=&APP_ID.:299:&SESSION.::&DEBUG.:299:P299_COMPANY,P299_LOCATION,P299_PARTY,P299_ZONE,P299_DUEON:&P298_COMPANY.,&P298_LOCATION.,#PARTYCODE#,&P298_ZONE.,&P298_DUEDATE.#COMPANYCODE#,#LOCATIONCODE#,#PARTYCODE#,#ZONETYPE#,#DUEDATE#'
,p_column_linktext=>'#OUTSTANDINGAMOUNT#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186958033932529143)
,p_db_column_name=>'PARTY'
,p_display_order=>10
,p_column_identifier=>'N'
,p_column_label=>'Party'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204373900513631470)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>40
,p_column_identifier=>'Q'
,p_column_label=>'Partycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(205951842968325563)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'190056'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PARTY:OUTSTANDINGAMOUNT:DUEAMOUNT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(189928517972676744)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(205938038314268688)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(186951773456438813)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(202707788976516423)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(189950689077763278)
,p_name=>'P298_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(202707788976516423)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202713878556516448)
,p_name=>'P298_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(202707788976516423)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'       b.CompanyName d,',
'       b.CompanyCode r',
'From   Voucher a,Company b',
'Where  a.CompanyCode = b.CompanyCode',
'Order By 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202713720774516446)
,p_name=>'P298_DUEDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(202707788976516423)
,p_prompt=>'Due Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202714071517516449)
,p_name=>'P298_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(202707788976516423)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct ',
'       b.LocationName d,',
'       b.LocationCode r',
'From   Voucher a,Location b',
'Where  a.LocationCode = b.LocationCode',
'Order By 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202714172251516450)
,p_name=>'P298_PARTY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(202707788976516423)
,p_prompt=>'Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct ',
'       c.PartyName d,',
'       c.PartyCode r',
'From   Voucher a,VoucherDetail b,Party c',
'Where  a.Tno = b.Tno',
'  and  b.AccountCode = c.PartyCode',
'Order By 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(186958470110529147)
,p_name=>'P298_ZONE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(202707788976516423)
,p_prompt=>'Zone'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct ',
'       a.Zonetype d,',
'       a.Zonetype r',
'From  Party a',
'Order By 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(189928548367676745)
,p_name=>'GeneratePDF'
,p_static_id=>'generatepdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(189928517972676744)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(189928659009676746)
,p_event_id=>wwv_flow_imp.id(189928548367676745)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', ' generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(190104702962480858)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190105080482480859)
,p_event_id=>wwv_flow_imp.id(190104702962480858)
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
