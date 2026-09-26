prompt --application/pages/page_00295
begin
--   Manifest
--     PAGE: 00295
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>1466918471259373
,p_default_application_id=>100
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>295
,p_name=>'Freight Rate Approval Register'
,p_alias=>'FREIGHT-RATE-APPROVAL-REGISTER'
,p_step_title=>'Freight Rate Approval Register'
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
'  var reportName = ''IRONMART/REPORT/FreightRateApprovalRegisterr.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P295_FROMDATE'').val());',
'  var toDate = new Date($(''#P295_TODATE'').val());',
'',
'  var reportParams = ',
'  ''&P_COMPANY='' +  $(''#P295_COMPANY'').val() +',
'    ''&P_LOCATION='' +  $(''#P295_LOCATION'').val() +',
'    ''&P_FROMDATE=''  +  $(''#P295_FROMDATE'').val() +',
'    ''&P_TODATE=''  +  $(''#P295_TODATE'').val() +',
'    ''&P_TRANSPORTER='' +  $(''#P295_TRANSPORTER'').val() +',
'    ''&P_SOURCE='' + $(''#P295_SOURCE'').val() +',
'     ''&P_DESTINATION='' + $(''#P295_DESTINATION'').val() ',
'    ;',
' ',
'//alert($v(''P295_PARTY''));',
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
'  var bireporturl = $(''#P295_BIREPORTURL'').val()',
'  var reportName =  ''FreightRateApprovalRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'',
'var reportParams = ',
'         ''"_paramsP_COMPANY":"'' +$(''#P295_COMPANY'').val() + ''",'' +',
'         ''"_paramsP_LOCATION":"'' +$(''#P295_LOCATION'').val() + ''",'' +',
'         ''"_paramsP_FROMDATE":"'' +$(''#P295_FROMDATE'').val() + ''",'' + ',
'         ''"_paramsP_TODATE":"'' +$(''#P295_TODATE'').val() + ''",'' + ',
'	     ''"_paramsP_TRANSPORTER":"'' + $(''#P295_TRANSPORTER'').val() + ''",'' + ',
'	     ''"_paramsP_SOURCE":"'' + $(''#P295_SOURCE'').val() + ''",'' + ',
'         ''"_paramsP_DESTINATION":"'' +$(''#P295_DESTINATION'').val() ;',
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
 p_id=>wwv_flow_imp.id(207499631463951751)
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
 p_id=>wwv_flow_imp.id(209679641552246124)
,p_plug_name=>'Freight Advance Register'
,p_static_id=>'freight-advance-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'         row_number() over(order by a.ccinvoiceno) SerialNo,',
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
'       v.vehicletypename,',
'       getlocationname(a.locationcode) location',
'  From ccinvoice a,',
'       loadingadvice b,',
'       vehicletype v,',
'       Outwardfra c,',
'       (Select aa.tno, Sum(aa.quantity1) As Quantity1',
'          From ccinvoicedetail aa',
'         Group By aa.tno) d',
' Where a.loadingadvicetno = b.tno(+)',
'   And b.outwardfratno = c.tno(+)',
'   And a.tno = d.tno(+)',
'   and a.vehicletypecode = v.vehicletypecode(+)',
'   and a.ccinvoicedate between :P295_FROMDATE and :P295_TODATE',
'and ( :P295_LOCATION IS NULL OR instr('':''||:P295_LOCATION||'':'','':''||A.LOCATIONCODE||'':'') > 0 )',
'and ( :P295_COMPANY IS NULL OR instr('':''||:P295_COMPANY||'':'','':''||A.companyCODE||'':'') > 0 )',
'and ( :P295_TRANSPORTER IS NULL OR instr('':''||:P295_TRANSPORTER||'':'','':''||A.transportercode||'':'') > 0 )',
'and ( :P295_SOURCE IS NULL OR instr('':''||:P295_SOURCE||'':'','':''||b.sourceplacecode||'':'') > 0 )',
'and ( :P295_DESTINATION IS NULL OR instr('':''||:P295_DESTINATION||'':'','':''||b.destinationplacecode||'':'') > 0 )'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Freight Advance Register'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(209679756849246124)
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
,p_internal_uid=>49302228191821432
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209683680455246132)
,p_db_column_name=>'ADVANCE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Advance'
,p_column_html_expression=>'<div style="display:block; width:80px">#ADVANCE#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209680869325246131)
,p_db_column_name=>'CHALLANDATE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#CHALLANDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209680483837246130)
,p_db_column_name=>'CHALLANNO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'S.B. No'
,p_column_html_expression=>'<div style="display:block; width:130px">#CHALLANNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209686018736246133)
,p_db_column_name=>'CONSIGNEE'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Sales Party'
,p_column_html_expression=>'<div style="display:block; width:220px">#CONSIGNEE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209685633784246133)
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
 p_id=>wwv_flow_imp.id(209685233902246133)
,p_db_column_name=>'DESTINATIONLOCATION'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'TO'
,p_column_html_expression=>'<div style="display:block; width:110px">#DESTINATIONLOCATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209684870931246133)
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
 p_id=>wwv_flow_imp.id(209683297499246132)
,p_db_column_name=>'FREIGHT'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Freight'
,p_column_html_expression=>'<div style="display:block; width:80px">#FREIGHT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209686494156246133)
,p_db_column_name=>'FREIGHTAPPROVALNO'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Freight Approval No'
,p_column_html_expression=>'<div style="display:block; width:200px">#FREIGHTAPPROVALNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188550324565659796)
,p_db_column_name=>'LOCATION'
,p_display_order=>46
,p_column_identifier=>'S'
,p_column_label=>'Location'
,p_column_html_expression=>'<div style="display:block; width:120px">#LOCATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209682493654246131)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209682894629246132)
,p_db_column_name=>'RATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Rate'
,p_column_html_expression=>'<div style="display:block; width:80px">#RATE#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182110511998397015)
,p_db_column_name=>'SERIALNO'
,p_display_order=>26
,p_column_identifier=>'Q'
,p_column_label=>'Serial No'
,p_column_html_expression=>'<div style="display:block; width:40px">#SERIALNO#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209684496719246132)
,p_db_column_name=>'SOURCELOCATION'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'From'
,p_column_html_expression=>'<div style="display:block; width:110px">#SOURCELOCATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209684012929246132)
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
 p_id=>wwv_flow_imp.id(209681293047246131)
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
 p_id=>wwv_flow_imp.id(209681688403246131)
,p_db_column_name=>'TRANSPORTERNAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Name Of Transporter'
,p_column_html_expression=>'<div style="display:block; width:180px">#TRANSPORTERNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209682068941246131)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Vehicle No'
,p_column_html_expression=>'<div style="display:block; width:80px">#VEHICLENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182352194868733412)
,p_db_column_name=>'VEHICLETYPENAME'
,p_display_order=>36
,p_column_identifier=>'R'
,p_column_label=>'Vehicle type'
,p_column_html_expression=>'<div style="display:block; width:150px">#VEHICLETYPENAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(209687043452247014)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'160350'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SERIALNO:LOCATION:CHALLANNO:CHALLANDATE:TRANSPORTERNAME:VEHICLENO:QUANTITY1:RATE:SOURCELOCATION:DESTINATIONLOCATION:VEHICLETYPENAME:CONSIGNEE:FREIGHTAPPROVALNO'
,p_sum_columns_on_break=>'QUANTITY1'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(177476400610037891)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(209679641552246124)
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
 p_id=>wwv_flow_imp.id(177467788756037885)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(207499631463951751)
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
 p_id=>wwv_flow_imp.id(194493011707853205)
,p_name=>'P295_BIREPORTURL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(207499631463951751)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(207501839825951756)
,p_name=>'P295_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(207499631463951751)
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
 p_id=>wwv_flow_imp.id(207502419326951762)
,p_name=>'P295_DESTINATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(207499631463951751)
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
 p_id=>wwv_flow_imp.id(207502056978951758)
,p_name=>'P295_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(207499631463951751)
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
 p_id=>wwv_flow_imp.id(207501948665951757)
,p_name=>'P295_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(207499631463951751)
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
'  and instr('':''||:P295_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order By 1',
';',
''))
,p_lov_cascade_parent_items=>'P295_COMPANY'
,p_ajax_items_to_submit=>'P295_COMPANY'
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
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(207502333584951761)
,p_name=>'P295_SOURCE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(207499631463951751)
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
 p_id=>wwv_flow_imp.id(207502109133951759)
,p_name=>'P295_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(207499631463951751)
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
 p_id=>wwv_flow_imp.id(207502191360951760)
,p_name=>'P295_TRANSPORTER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(207499631463951751)
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
 p_id=>wwv_flow_imp.id(177476989379037892)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(177476400610037891)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(177477479517037892)
,p_event_id=>wwv_flow_imp.id(177476989379037892)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(177477855914037892)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(177478386854037892)
,p_event_id=>wwv_flow_imp.id(177477855914037892)
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
