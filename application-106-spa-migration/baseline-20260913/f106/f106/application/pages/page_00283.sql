prompt --application/pages/page_00283
begin
--   Manifest
--     PAGE: 00283
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
 p_id=>283
,p_name=>'Payment Of Transporter Advance'
,p_alias=>'FREIGHT-ADVANCE-REGISTER1'
,p_step_title=>'Payment Of Transporter Advance'
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
'  var reportName = ''IRONMART/REPORT/FreightAdvanceRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P283_FROMDATE'').val());',
'  var toDate = new Date($(''#P283_TODATE'').val());',
'',
'  var reportParams = ',
'  ''&P_COMPANY='' +  $(''#P283_COMPANY'').val() +',
'    ''&P_LOCATION='' +  $(''#P283_LOCATION'').val() +',
'    ''&P_FROMDATE=''  +  $(''#P283_FROMDATE'').val() +',
'    ''&P_TODATE=''  +  $(''#P283_TODATE'').val() +',
'    ''&P_TRANSPORTER='' +  $(''#P283_TRANSPORTER'').val() +',
'    ''&P_SOURCE='' + $(''#P283_SOURCE'').val() +',
'     ''&P_DESTINATION='' + $(''#P283_DESTINATION'').val() ',
'    ;',
' ',
'//alert($v(''P283_PARTY''));',
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
'  var bireporturl = $(''#P283_BIREPORTURL'').val()',
'  var reportName =  ''FreightAdvanceRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'',
'var reportParams = ',
'         ''"_paramsP_COMPANY":"'' +$(''#P283_COMPANY'').val() + ''",'' +',
'         ''"_paramsP_LOCATION":"'' +$(''#P283_LOCATION'').val() + ''",'' +',
'         ''"_paramsP_FROMDATE":"'' +$(''#P283_FROMDATE'').val() + ''",'' + ',
'         ''"_paramsP_TODATE":"'' +$(''#P283_TODATE'').val() + ''",'' + ',
'	     ''"_paramsP_TRANSPORTER":"'' + $(''#P283_TRANSPORTER'').val() + ''",'' + ',
'	     ''"_paramsP_SOURCE":"'' + $(''#P283_SOURCE'').val() + ''",'' + ',
'         ''"_paramsP_DESTINATION":"'' +$(''#P283_DESTINATION'').val() ;',
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
 p_id=>wwv_flow_imp.id(197951449835041310)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(200131459923335683)
,p_plug_name=>'Payment Of Transporter Advance'
,p_static_id=>'payment-of-transporter-advance'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'       row_number() over(order by a.CCINVOICEDATE) SerialNo, ',
'       a.ccinvoiceno As challanNo,',
'       a.ccinvoicedate As challanDate,',
'       a.transportercode,',
'       getpartyname(a.transportercode) As TransporterName,',
'       a.vehicleno,',
'       d.Quantity1,',
'       a.freightrate As Rate,',
'       Nvl(d.Quantity1, 0) * Nvl(a.freightrate, 0) As Freight,',
'       a.freightadvance As Advance,',
'       b.sourceplacecode,',
'       getcityname(b.sourceplacecode) As SourceLocation,',
'       b.destinationplacecode,',
'       getcityname(b.destinationplacecode) As DestinationLocation,',
'	   a.consigneecode,',
'	   getpartyname(a.partycode) as Consignee,',
'       c.Outwardfrano As FreightApprovalNo,',
'       getlocationname(a.locationcode) as location',
'  From ccinvoice a,',
'       loadingadvice b,',
'       Outwardfra c,',
'       (Select aa.tno, Sum(aa.quantity1) As Quantity1',
'          From ccinvoicedetail aa',
'         Group By aa.tno) d',
' Where a.loadingadvicetno = b.tno(+)',
'   And b.outwardfratno = c.tno(+)',
'   And a.tno = d.tno(+)',
'   and a.ccinvoicedate between :P283_FROMDATE and :P283_TODATE',
'and ( :P283_LOCATION IS NULL OR instr('':''||:P283_LOCATION||'':'','':''||A.LOCATIONCODE||'':'') > 0 )',
'and ( :P283_COMPANY IS NULL OR instr('':''||:P283_COMPANY||'':'','':''||A.companyCODE||'':'') > 0 )',
'and ( :P283_TRANSPORTER IS NULL OR instr('':''||:P283_TRANSPORTER||'':'','':''||A.transportercode||'':'') > 0 )',
'and ( :P283_SOURCE IS NULL OR instr('':''||:P283_SOURCE||'':'','':''||b.sourceplacecode||'':'') > 0 )',
'and ( :P283_DESTINATION IS NULL OR instr('':''||:P283_DESTINATION||'':'','':''||b.destinationplacecode||'':'') > 0 )'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Freight Advance Register'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(200131575220335683)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>32212556754208241
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200135498826335691)
,p_db_column_name=>'ADVANCE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Advance'
,p_column_html_expression=>'<div style="display:block; width:100px">#ADVANCE#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200132687696335690)
,p_db_column_name=>'CHALLANDATE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Challan Date'
,p_column_html_expression=>'<div style="display:block; width:100px">#CHALLANDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200132302208335689)
,p_db_column_name=>'CHALLANNO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Challan No'
,p_column_html_expression=>'<div style="display:block; width:140px">#CHALLANNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200137837107335692)
,p_db_column_name=>'CONSIGNEE'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Party'
,p_column_html_expression=>'<div style="display:block; width:250px">#CONSIGNEE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200137452155335692)
,p_db_column_name=>'CONSIGNEECODE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Consigneecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200137052273335692)
,p_db_column_name=>'DESTINATIONLOCATION'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Destination Location'
,p_column_html_expression=>'<div style="display:block; width:150px">#DESTINATIONLOCATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200136689302335692)
,p_db_column_name=>'DESTINATIONPLACECODE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Destinationplacecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200135115870335691)
,p_db_column_name=>'FREIGHT'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Freight'
,p_column_html_expression=>'<div style="display:block; width:100px">#FREIGHT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200138312527335692)
,p_db_column_name=>'FREIGHTAPPROVALNO'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Freight Approval No'
,p_column_html_expression=>'<div style="display:block; width:140px">#FREIGHTAPPROVALNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189893019815436156)
,p_db_column_name=>'LOCATION'
,p_display_order=>36
,p_column_identifier=>'R'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200134312025335690)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Quantity1'
,p_column_html_expression=>'<div style="display:block; width:100px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200134713000335691)
,p_db_column_name=>'RATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Rate'
,p_column_html_expression=>'<div style="display:block; width:100px">#RATE#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189651201616099757)
,p_db_column_name=>'SERIALNO'
,p_display_order=>26
,p_column_identifier=>'Q'
,p_column_label=>'Serial No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200136315090335691)
,p_db_column_name=>'SOURCELOCATION'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Source Location'
,p_column_html_expression=>'<div style="display:block; width:100px">#SOURCELOCATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200135831300335691)
,p_db_column_name=>'SOURCEPLACECODE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Sourceplacecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200133111418335690)
,p_db_column_name=>'TRANSPORTERCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Transportercode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200133506774335690)
,p_db_column_name=>'TRANSPORTERNAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Transporter'
,p_column_html_expression=>'<div style="display:block; width:170px">#TRANSPORTERNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(200133887312335690)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Vehicle No'
,p_column_html_expression=>'<div style="display:block; width:100px">#VEHICLENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(200138861823336573)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'160350'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SERIALNO:LOCATION:CHALLANNO:CHALLANDATE:TRANSPORTERNAME:VEHICLENO:QUANTITY1:RATE:FREIGHT:ADVANCE:SOURCELOCATION:DESTINATIONLOCATION:CONSIGNEE'
,p_sum_columns_on_break=>'QUANTITY1:FREIGHT:ADVANCE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183679573946205065)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(200131459923335683)
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
 p_id=>wwv_flow_imp.id(184104609602701788)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(197951449835041310)
,p_button_name=>'Refresh'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(184943833261942762)
,p_name=>'P283_BIREPORTURL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(197951449835041310)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(197952661380041313)
,p_name=>'P283_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(197951449835041310)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = getModuleCodeForPageNo(:APP_PAGE_ID)',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and upper(bu.BossUserName) =  upper(''&APP_USER.'')',
'  and getcompanyprivilege(C.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES'''))
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(197953240881041319)
,p_name=>'P283_DESTINATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(197951449835041310)
,p_prompt=>'Destination'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct',
'       e.CityName d,',
'        b.destinationplacecode	 r',
'  From ccinvoice a,',
'       loadingadvice b,',
'       Outwardfra c,',
'       (Select aa.tno, Sum(aa.quantity1) As Quantity1',
'          From ccinvoicedetail aa',
'         Group By aa.tno) d,City e',
' Where a.loadingadvicetno = b.tno(+)',
'   And b.outwardfratno = c.tno(+)',
'   And a.tno = d.tno(+)',
'   And b.DestinationPlaceCode = e.CityCode(+)',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(197952878533041315)
,p_name=>'P283_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(197951449835041310)
,p_item_default=>'sysdate-7'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(197952770220041314)
,p_name=>'P283_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(197951449835041310)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct',
'      l.LocationName d,',
'      l.LocationCode r',
'From  ModulePrivilege a, ModulePrivilegeLocation b, Location l, BossUser bu, MODULELOCATION ML, MODULELOCATIONDETAIL MD',
'Where a.TNo = b.TNo(+)',
'  AND A.MODULECODE = ML.MODULECODE',
'  AND ML.TNO = MD.TNO',
'  AND (B.LOCATIONCODE = L.LOCATIONCODE OR B.LOCATIONCODE IS NULL)',
'  and (MD.LocationCode = l.LocationCode )',
'  and a.ModuleCode = getModuleCodeForPageNo(:APP_PAGE_ID)',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
' /* and a.CompanyCode = :P107_COMPANY */',
' and instr('':''||:P283_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order By 1',
';',
''))
,p_lov_cascade_parent_items=>'P283_COMPANY'
,p_ajax_items_to_submit=>'P283_COMPANY'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(197953155139041318)
,p_name=>'P283_SOURCE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(197951449835041310)
,p_prompt=>'Source'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct ',
'       e.CityName  d,',
'       b.sourceplacecode r  ',
'  From ccinvoice a,',
'       loadingadvice b,',
'       Outwardfra c,',
'       (Select aa.tno, Sum(aa.quantity1) As Quantity1',
'          From ccinvoicedetail aa',
'         Group By aa.tno) d,City e',
' Where a.loadingadvicetno = b.tno(+)',
'   And b.outwardfratno = c.tno(+)',
'   And a.tno = d.tno(+)',
'   And b.SourcePlaceCode = e.CityCode(+)',
'   Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(197952930688041316)
,p_name=>'P283_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(197951449835041310)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(197953012915041317)
,p_name=>'P283_TRANSPORTER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(197951449835041310)
,p_prompt=>'Transporter'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'     Distinct ',
'     b.PartyName d,',
'     b.PartyCode r',
'From CCInvoice a,Party b',
'Where a.TransPorterCode = b.PartyCode(+)',
'Order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(183679693106205066)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(183679573946205065)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(183679814636205067)
,p_event_id=>wwv_flow_imp.id(183679693106205066)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(184113020266701795)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(184113534149701795)
,p_event_id=>wwv_flow_imp.id(184113020266701795)
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
