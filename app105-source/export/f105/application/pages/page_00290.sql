prompt --application/pages/page_00290
begin
--   Manifest
--     PAGE: 00290
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
 p_id=>290
,p_name=>'Daily Despatch Report'
,p_alias=>'DAILY-DESPATCH-REPORT'
,p_step_title=>'Daily Despatch Report'
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
'  var reportName = ''IRONMART/REPORT/DailyDespatchReport1.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P290_FROMDATE'').val());',
'  var toDate = new Date($(''#P290_TODATE'').val());',
'',
'  var reportParams = ',
'  ''&P_COMPANY='' +  $(''#P290_COMPANY'').val() +',
'    ''&P_LOCATION='' +  $(''#P290_LOCATION'').val() +',
'    ''&P_FROMDATE=''  +  $(''#P290_FROMDATE'').val() +',
'    ''&P_TODATE=''  +  $(''#P290_TODATE'').val() +',
'    ''&P_SALEPARTY='' + $(''#P290_SALEPARTY'').val() +',
'    ''&P_TRANSPORTER='' +  $(''#P290_TRANSPORTER'').val() ',
'    ;',
' ',
'//alert($v(''P290_PARTY''));',
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
'  var bireporturl = $(''#P290_BIREPORTURL'').val()',
'  var reportName =  ''DailyDespatchReport1.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'',
'var reportParams = ',
'         ''"_paramsP_COMPANY":"'' +$(''#P290_COMPANY'').val() + ''",'' +',
'         ''"_paramsP_LOCATION":"'' +$(''#P290_LOCATION'').val() + ''",'' +',
'         ''"_paramsP_FROMDATE":"'' +$(''#P290_FROMDATE'').val() + ''",'' + ',
'         ''"_paramsP_TODATE":"'' +$(''#P290_TODATE'').val() + ''",'' + ',
'         ''"_paramsP_SALEPARTY":"'' +$(''#P290_SALEPARTY'').val() + ''",'' +',
'	     ''"_paramsP_TRANSPORTER":"'' + $(''#P290_TRANSPORTER'').val() ;',
'        ',
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
 p_id=>wwv_flow_imp.id(216316007075301282)
,p_plug_name=>'Daily Despatch Report'
,p_static_id=>'daily-despatch-report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'         row_number() over(order by a.ccinvoicedate) SerialNo,',
'         ',
'       a.LocationCode,',
'       getdoctypename(a.DocTypecode) doctype,',
'       a.agentcode,',
'       getpartyname(a.agentcode) Broker,',
'       --a.ccinvoiceno ChallanNo,',
'        Case',
'         When ROW_NUMBER()',
'          Over(Partition By  a.ccinvoiceno  Order By   a.ccinvoiceno) = 1 Then',
'          a.ccinvoiceno',
'         Else',
'          Null',
'       End ChallanNo,',
'       --a.ccinvoicedate ChallanDate,',
'       Case',
'         When ROW_NUMBER()',
'          Over(Partition By  a.ccinvoiceno ,a.ccinvoicedate Order By  a.ccinvoicedate , a.ccinvoiceno) = 1 Then',
'          a.ccinvoicedate',
'         Else',
'          Null',
'       End ChallanDate,',
'       a.partycode p1,',
'       --getpartyname(a.partycode) Saleparty,',
'       Case',
'         When ROW_NUMBER()',
'          Over(Partition By  a.ccinvoiceno ,a.ccinvoicedate , so.PARTYPONO Order By  a.ccinvoicedate , a.ccinvoiceno , ',
'                                                                            so.PARTYPONO) = 1 Then',
'          so.PARTYPONO',
'         Else',
'          Null',
'       End PARTYPONO,',
'       Case',
'         When ROW_NUMBER()',
'          Over(Partition By a.ccinvoiceno ,a.ccinvoicedate,a.partycode Order By a.ccinvoiceno ,a.ccinvoicedate,a.partycode) = 1 Then',
'          getpartyname(a.partycode)',
'         Else',
'          Null',
'       End Saleparty,',
'       c.partycode p2,',
'      -- getpartyname(c.partycode) PurchaseParty,',
'        Case',
'         When ROW_NUMBER()',
'          Over(Partition By a.ccinvoiceno ,a.ccinvoicedate,a.partycode ,',
'                             c.partycode ',
'                             Order By a.ccinvoiceno ,a.ccinvoicedate,a.partycode,',
'                             c.partycode) = 1 Then',
'          getpartyname(c.partycode)',
'         Else',
'          Null',
'       End PurchaseParty,',
'       (Select Sum(quantity1) From ccinvoicedetail Where tno = a.tno) Quantity,',
'       a.ccinvoiceamount Amount,',
'       a.transportercode,',
'       --getpartyname(a.transportercode) As TransporterName,',
'       Case',
'         When ROW_NUMBER()',
'          Over(Partition By a.ccinvoiceno ,a.ccinvoicedate,a.partycode ,',
'                             c.partycode , a.transportercode',
'                             Order By a.ccinvoiceno ,a.ccinvoicedate,a.partycode,',
'                             c.partycode , a.transportercode) = 1 Then',
'          getpartyname(a.transportercode)',
'         Else',
'          Null',
'       End TransporterName,',
'       --a.vehicleno,',
'        Case',
'         When ROW_NUMBER()',
'          Over(Partition By a.ccinvoiceno ,a.ccinvoicedate,a.partycode ,',
'                             c.partycode , a.transportercode , a.vehicleno',
'                             Order By a.ccinvoiceno ,a.ccinvoicedate,a.partycode,',
'                             c.partycode , a.transportercode , a.vehicleno) = 1 Then',
'          a.vehicleno',
'         Else',
'          Null',
'       End vehicleno,',
'       --Nvl(d.drivername, e.drivername) DriverName,',
'        Case',
'         When ROW_NUMBER()',
'          Over(Partition By a.ccinvoiceno ,a.ccinvoicedate,a.partycode ,',
'                             c.partycode , a.transportercode , a.vehicleno ,',
'                             Nvl(d.drivername, e.drivername)',
'                             Order By a.ccinvoiceno ,a.ccinvoicedate,a.partycode,',
'                             c.partycode , a.transportercode , a.vehicleno ,',
'                             Nvl(d.drivername, e.drivername) ) = 1 Then',
'          Nvl(d.drivername, e.drivername)',
'         Else',
'          Null',
'       End DriverName,',
'       --e.drivermobileno,',
'        Case',
'         When ROW_NUMBER()',
'          Over(Partition By a.ccinvoiceno ,a.ccinvoicedate,a.partycode ,',
'                             c.partycode , a.transportercode , a.vehicleno ,',
'                             Nvl(d.drivername, e.drivername) , e.drivermobileno',
'                             Order By a.ccinvoiceno ,a.ccinvoicedate,a.partycode,',
'                             c.partycode , a.transportercode , a.vehicleno ,',
'                             Nvl(d.drivername, e.drivername) , e.drivermobileno ) = 1 Then',
'          e.drivermobileno',
'         Else',
'          Null',
'       End drivermobileno,',
'       --e.freightrate,',
'       Case',
'         When ROW_NUMBER()',
'          Over(Partition By a.ccinvoiceno ,a.ccinvoicedate,a.partycode ,',
'                             c.partycode , a.transportercode , a.vehicleno ,',
'                             Nvl(d.drivername, e.drivername) , e.drivermobileno , ',
'                             e.freightrate',
'                             Order By a.ccinvoiceno ,a.ccinvoicedate,a.partycode,',
'                             c.partycode , a.transportercode , a.vehicleno ,',
'                             Nvl(d.drivername, e.drivername) , e.drivermobileno , ',
'                             e.freightrate ) = 1 Then',
'          e.freightrate',
'         Else',
'          Null',
'       End freightrate,',
'       -- tf.sumquantity * Nvl(a.freightrate, 0)  As TotalFreight,',
'         Case',
'         When ROW_NUMBER()',
'          Over(Partition By a.ccinvoiceno ,a.ccinvoicedate,a.partycode ,',
'                             c.partycode , a.transportercode , a.vehicleno ,',
'                             Nvl(d.drivername, e.drivername) , e.drivermobileno , ',
'                             e.freightrate , tf.sumquantity * Nvl(a.freightrate, 0)',
'                             Order By a.ccinvoiceno ,a.ccinvoicedate,a.partycode,',
'                             c.partycode , a.transportercode , a.vehicleno ,',
'                             Nvl(d.drivername, e.drivername) , e.drivermobileno , ',
'                             e.freightrate , tf.sumquantity * Nvl(a.freightrate, 0) ) = 1 Then',
'          tf.sumquantity * Nvl(a.freightrate, 0)',
'         Else',
'          Null',
'       End TotalFreight,',
'       b.itemcode,',
'       ',
'       b.itemspecificationcode,',
'       getitemname(b.itemcode) ItemName,',
'       getitemspecificationname(b.itemcode, b.itemspecificationcode) ItemSpec,',
'       b.quantity1,',
'       b.totalamount,',
'       b.rate,',
'        pbp.Quantity purchaseQty,',
'        pbp.rate purchaserate,',
'        pbp.totalamount as purchaseamount,',
'        --a.LORRYNO LR,',
'         Case',
'         When ROW_NUMBER()',
'          Over(Partition By a.ccinvoiceno ,a.ccinvoicedate,a.partycode ,',
'                             c.partycode , a.transportercode , a.vehicleno ,',
'                             Nvl(d.drivername, e.drivername) , e.drivermobileno , ',
'                             e.freightrate , tf.sumquantity * Nvl(a.freightrate, 0) ,',
'                             a.LORRYNO',
'                             Order By a.ccinvoiceno ,a.ccinvoicedate,a.partycode,',
'                             c.partycode , a.transportercode , a.vehicleno ,',
'                             Nvl(d.drivername, e.drivername) , e.drivermobileno , ',
'                             e.freightrate , tf.sumquantity * Nvl(a.freightrate, 0) ,',
'                             a.LORRYNO) = 1 Then',
'          a.LORRYNO',
'         Else',
'          Null',
'       End LR,',
'      --  a.FREIGHTADVANCE,',
'        Case',
'         When ROW_NUMBER()',
'          Over(Partition By a.ccinvoiceno ,a.ccinvoicedate,a.partycode ,',
'                             c.partycode , a.transportercode , a.vehicleno ,',
'                             Nvl(d.drivername, e.drivername) , e.drivermobileno , ',
'                             e.freightrate , tf.sumquantity * Nvl(a.freightrate, 0) ,',
'                             a.LORRYNO , a.FREIGHTADVANCE',
'                             Order By a.ccinvoiceno ,a.ccinvoicedate,a.partycode,',
'                             c.partycode , a.transportercode , a.vehicleno ,',
'                             Nvl(d.drivername, e.drivername) , e.drivermobileno , ',
'                             e.freightrate , tf.sumquantity * Nvl(a.freightrate, 0) ,',
'                             a.LORRYNO , a.FREIGHTADVANCE ) = 1 Then',
'          a.FREIGHTADVANCE',
'         Else',
'          Null',
'       End FREIGHTADVANCE,',
'        ew.EWBNO ewaybillno,',
'        ew.EWBDATE ewaybilldate,',
'        ew.VALIDTILLDATE expirydate,',
'        ct.distance,',
'        grd.receivedquantity1',
'  From ccinvoice       a,',
'       ccinvoicedetail b,',
'       EWAYBILL        ew,',
'       PurchaseOrder   c,',
'       Purchaseorderdetail pd,',
'       Despatchadvice  d,',
'       LoadingAdvice   e,',
'       salesorder so,',
'       city    ct,',
'       party   p ,',
'       grn     gr,',
'       grndetail grd,',
'       (Select a.tno , Sum(a.quantity1) as sumquantity',
'          From ccinvoicedetail a ',
'          group by a.tno) tf,',
'        (Select  a.purchaseordertno , a.itemcode , a.itemspecificationcode , ',
'                avg(a.quantity1) quantity , avg(rate) rate , avg(a.totalamount) totalamount ',
'          From pbpassdetail a',
'          group by a.purchaseordertno , a.itemcode , a.itemspecificationcode  ) pbp',
' Where a.tno = b.tno(+)',
'    and a.tno = tf.tno',
'    And a.loadingadvicetno = e.tno(+)',
'   And e.purchaseordertno = c.tno(+)',
'   And a.despatchadvicetno = d.tno(+)',
'   And c.tno = pd.tno',
'   and b.itemcode = pd.itemcode(+)',
'   and b.itemspecificationcode = pd.itemspecificationcode(+)',
'   and pd.tno = pbp.purchaseordertno',
'   and pd.itemcode = pbp.itemcode(+)',
'   and pd.itemspecificationcode = pbp.itemspecificationcode(+)',
'   and a.tno = ew.tno(+)',
'   and a.consigneeCODE = p.partycode(+)',
'   and p.OFFICECITYCODE = ct.citycode(+)',
'   and e.tno = gr.loadingadvicetno(+)',
'   and gr.tno = grd.tno   ',
'   and b.itemcode = grd.itemcode(+)',
'   and b.itemspecificationcode = grd.itemspecificationcode(+)',
'   and a.salesordertno = so.tno(+)',
'     and  A.ccinvoiceDATE between :P290_FROMDATE and :P290_TODATE',
'and ( :P290_LOCATION IS NULL OR instr('':''||:P290_LOCATION||'':'','':''||A.LOCATIONCODE||'':'') > 0 )',
'and ( :P290_SALEPARTY IS NULL OR instr('':''||:P290_SALEPARTY||'':'','':''||A.PARTYCODE||'':'') > 0 )',
'and ( :P290_COMPANY IS NULL OR instr('':''||:P290_COMPANY||'':'','':''||A.companyCODE||'':'') > 0 )',
'and ( :P290_TRANSPORTER IS NULL OR instr('':''||:P290_TRANSPORTER||'':'','':''||A.transporterCODE||'':'') > 0 )'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Freight Advance Register'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(216316122372301282)
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
,p_internal_uid=>48397103906173840
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184137637250139143)
,p_db_column_name=>'AGENTCODE'
,p_display_order=>97
,p_column_identifier=>'AI'
,p_column_label=>'Agentcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184138593290139152)
,p_db_column_name=>'AMOUNT'
,p_display_order=>187
,p_column_identifier=>'AR'
,p_column_label=>'Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#AMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184137810128139144)
,p_db_column_name=>'BROKER'
,p_display_order=>107
,p_column_identifier=>'AJ'
,p_column_label=>'Broker'
,p_column_html_expression=>'<div style="display:block; width:100px">#BROKER#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184137988147139146)
,p_db_column_name=>'CHALLANDATE'
,p_display_order=>127
,p_column_identifier=>'AL'
,p_column_label=>'Challan Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#CHALLANDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184137882771139145)
,p_db_column_name=>'CHALLANNO'
,p_display_order=>117
,p_column_identifier=>'AK'
,p_column_label=>'Challan No'
,p_column_html_expression=>'<div style="display:block; width:150px">#CHALLANNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196093408378362562)
,p_db_column_name=>'DISTANCE'
,p_display_order=>407
,p_column_identifier=>'BN'
,p_column_label=>'Distance'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184864835602682373)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>297
,p_column_identifier=>'BC'
,p_column_label=>'Doctype'
,p_column_html_expression=>'<div style="display:block; width:140px">#DOCTYPE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184139060727139157)
,p_db_column_name=>'DRIVERMOBILENO'
,p_display_order=>237
,p_column_identifier=>'AW'
,p_column_label=>'Driver Mobile No'
,p_column_html_expression=>'<div style="display:block; width:100px">#DRIVERMOBILENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184138978178139156)
,p_db_column_name=>'DRIVERNAME'
,p_display_order=>227
,p_column_identifier=>'AV'
,p_column_label=>'Driver Name'
,p_column_html_expression=>'<div style="display:block; width:110px">#DRIVERNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196093141229362560)
,p_db_column_name=>'EWAYBILLDATE'
,p_display_order=>387
,p_column_identifier=>'BL'
,p_column_label=>'E way bill date'
,p_column_html_expression=>'<div style="display:block; width:100px">#EWAYBILLDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196093088133362559)
,p_db_column_name=>'EWAYBILLNO'
,p_display_order=>377
,p_column_identifier=>'BK'
,p_column_label=>'E way bill no'
,p_column_html_expression=>'<div style="display:block; width:100px">#EWAYBILLNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196093237838362561)
,p_db_column_name=>'EXPIRYDATE'
,p_display_order=>397
,p_column_identifier=>'BM'
,p_column_label=>'Expiry date'
,p_column_html_expression=>'<div style="display:block; width:100px">#EXPIRYDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196092958903362558)
,p_db_column_name=>'FREIGHTADVANCE'
,p_display_order=>367
,p_column_identifier=>'BJ'
,p_column_label=>'Freight advance'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184139123384139158)
,p_db_column_name=>'FREIGHTRATE'
,p_display_order=>247
,p_column_identifier=>'AX'
,p_column_label=>'Freight Rate'
,p_column_html_expression=>'<div style="display:block; width:80px">#FREIGHTRATE#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197977452567472722)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>47
,p_column_identifier=>'T'
,p_column_label=>'Itemcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197977580042472723)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>57
,p_column_identifier=>'U'
,p_column_label=>'Item'
,p_column_html_expression=>'<div style="display:block; width:100px">#ITEMNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184139321192139160)
,p_db_column_name=>'ITEMSPEC'
,p_display_order=>267
,p_column_identifier=>'AZ'
,p_column_label=>'Item Spec'
,p_column_html_expression=>'<div style="display:block; width:100px">#ITEMSPEC#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197977593962472724)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>67
,p_column_identifier=>'V'
,p_column_label=>'Itemspecificationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181769031665466991)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>77
,p_column_identifier=>'AG'
,p_column_label=>'Locationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196092860616362557)
,p_db_column_name=>'LR'
,p_display_order=>357
,p_column_identifier=>'BI'
,p_column_label=>'LR'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184138071965139147)
,p_db_column_name=>'P1'
,p_display_order=>137
,p_column_identifier=>'AM'
,p_column_label=>'P1'
,p_column_html_expression=>'<div style="display:block; width:80px">#P1#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184138273970139149)
,p_db_column_name=>'P2'
,p_display_order=>157
,p_column_identifier=>'AO'
,p_column_label=>'P2'
,p_column_html_expression=>'<div style="display:block; width:80px">#P2#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(198965833032630191)
,p_db_column_name=>'PARTYPONO'
,p_display_order=>427
,p_column_identifier=>'BP'
,p_column_label=>'Party PO No'
,p_column_html_expression=>'<div style="display:block; width:150px">#PARTYPONO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196092786538362556)
,p_db_column_name=>'PURCHASEAMOUNT'
,p_display_order=>347
,p_column_identifier=>'BH'
,p_column_label=>'Purchase amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184138386052139150)
,p_db_column_name=>'PURCHASEPARTY'
,p_display_order=>167
,p_column_identifier=>'AP'
,p_column_label=>'Purchase Party'
,p_column_html_expression=>'<div style="display:block; width:200px">#PURCHASEPARTY#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196092564042362554)
,p_db_column_name=>'PURCHASEQTY'
,p_display_order=>327
,p_column_identifier=>'BF'
,p_column_label=>'Purchase qty_temp'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196092630574362555)
,p_db_column_name=>'PURCHASERATE'
,p_display_order=>337
,p_column_identifier=>'BG'
,p_column_label=>'Purchase rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184138444502139151)
,p_db_column_name=>'QUANTITY'
,p_display_order=>177
,p_column_identifier=>'AQ'
,p_column_label=>'Quantity'
,p_column_html_expression=>'<div style="display:block; width:80px">#QUANTITY#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184139507463139161)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>277
,p_column_identifier=>'BA'
,p_column_label=>'Sale Quantity'
,p_column_html_expression=>'<div style="display:block; width:90px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196092476749362553)
,p_db_column_name=>'RATE'
,p_display_order=>317
,p_column_identifier=>'BE'
,p_column_label=>'Sale Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196093479783362563)
,p_db_column_name=>'RECEIVEDQUANTITY1'
,p_display_order=>417
,p_column_identifier=>'BO'
,p_column_label=>'Purchase Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184138187157139148)
,p_db_column_name=>'SALEPARTY'
,p_display_order=>147
,p_column_identifier=>'AN'
,p_column_label=>'Sale Party'
,p_column_html_expression=>'<div style="display:block; width:200px">#SALEPARTY#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189652369422099769)
,p_db_column_name=>'SERIALNO'
,p_display_order=>307
,p_column_identifier=>'BD'
,p_column_label=>'Serial No'
,p_column_html_expression=>'<div style="display:block; width:60px">#SERIALNO#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184139579145139162)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>287
,p_column_identifier=>'BB'
,p_column_label=>'Sale Total Amount'
,p_column_html_expression=>'<div style="display:block; width:120px">#TOTALAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184139229677139159)
,p_db_column_name=>'TOTALFREIGHT'
,p_display_order=>257
,p_column_identifier=>'AY'
,p_column_label=>'Total Freight'
,p_column_html_expression=>'<div style="display:block; width:80px">#TOTALFREIGHT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184138692190139153)
,p_db_column_name=>'TRANSPORTERCODE'
,p_display_order=>197
,p_column_identifier=>'AS'
,p_column_label=>'Transportercode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184138746549139154)
,p_db_column_name=>'TRANSPORTERNAME'
,p_display_order=>207
,p_column_identifier=>'AT'
,p_column_label=>'Transporter'
,p_column_html_expression=>'<div style="display:block; width:200px">#TRANSPORTERNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184138862111139155)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>217
,p_column_identifier=>'AU'
,p_column_label=>'Vehicle No'
,p_column_html_expression=>'<div style="display:block; width:100px">#VEHICLENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(216323408975302172)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'160350'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SERIALNO:BROKER:CHALLANNO:CHALLANDATE:PARTYPONO:SALEPARTY:ITEMNAME:ITEMSPEC:QUANTITY1:RATE:TOTALAMOUNT:PURCHASEPARTY:RECEIVEDQUANTITY1:PURCHASERATE:PURCHASEAMOUNT:TRANSPORTERNAME:VEHICLENO:DRIVERNAME:DRIVERMOBILENO:LR:FREIGHTRATE:TOTALFREIGHT:FREIGHT'
||'ADVANCE:EWAYBILLNO:EWAYBILLDATE:EXPIRYDATE:DISTANCE'
,p_sum_columns_on_break=>'QUANTITY1:TOTALAMOUNT:RECEIVEDQUANTITY1:PURCHASEAMOUNT:TOTALFREIGHT:FREIGHTADVANCE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(214135996987006909)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183679851625205068)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(216316007075301282)
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
 p_id=>wwv_flow_imp.id(184129318212133188)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(214135996987006909)
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
 p_id=>wwv_flow_imp.id(185172980180499732)
,p_name=>'P290_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(214135996987006909)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214138097934006929)
,p_name=>'P290_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(214135996987006909)
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
 p_id=>wwv_flow_imp.id(214138315087006931)
,p_name=>'P290_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(214135996987006909)
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
 p_id=>wwv_flow_imp.id(214138206774006930)
,p_name=>'P290_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(214135996987006909)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DISTINCT locationname d , locationcode r from location  ',
'where locationcode in (',
'    select distinct locationcode from ccinvoice',
')'))
,p_lov_cascade_parent_items=>'P290_COMPANY'
,p_ajax_items_to_submit=>'P290_COMPANY'
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
 p_id=>wwv_flow_imp.id(184865010682682374)
,p_name=>'P290_SALEPARTY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(214135996987006909)
,p_prompt=>'Sale Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DISTINCT partyname D, partycode  R',
'from party   ',
'where partycode in ',
'                (',
'                    select distinct partycode from ccinvoice ',
'                )',
'order by 1'))
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214138367242006932)
,p_name=>'P290_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(214135996987006909)
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
 p_id=>wwv_flow_imp.id(184865102670682375)
,p_name=>'P290_TRANSPORTER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(214135996987006909)
,p_prompt=>'Transporter'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DISTINCT partyname D, partycode  R',
'from party   ',
'where partycode in ',
'                (',
'                    select distinct transportercode from ccinvoice ',
'                )',
'order by 1'))
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(183679962922205069)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(183679851625205068)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(183680043412205070)
,p_event_id=>wwv_flow_imp.id(183679962922205069)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(184136581855133193)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(184137060952133194)
,p_event_id=>wwv_flow_imp.id(184136581855133193)
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
