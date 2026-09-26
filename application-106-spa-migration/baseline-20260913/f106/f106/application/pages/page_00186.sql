prompt --application/pages/page_00186
begin
--   Manifest
--     PAGE: 00186
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
 p_id=>186
,p_name=>'Stock Transfer'
,p_alias=>'STOCK-TRANSFER1'
,p_step_title=>'Stock Transfer'
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
'  var bireporturl = $(''#P186_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/StockTransferRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P186_FROMDATE'').val());',
'  var toDate = new Date($(''#P186_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P186_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P186_COMPANY'').val() ==="" || $(''#P186_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P186_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P186_COMPANY'').val();',
'       global_companycode= $(''#P186_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +  ',
'      ''&P_LOCATION='' + $(''#P186_LOCATION'').val() +  ',
'      ''&P_STNO='' +$(''#P186_STNO'').val() +  ',
'      ''&P_FROMDATE='' +$(''#P186_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P186_TODATE'').val() + ',
'      ''&P_FROMSTORAGE='' +$(''#P186_FROMSTORAGE'').val() +',
'      ''&P_ITEM='' +$(''#P186_ITEM'').val() +',
'      ''&P_TOSTORAGE='' +$(''#P186_TOSTORAGE'').val() +',
'      ''&P_SPECIFICATION='' +$(''#P186_SPECIFICATION'').val() +',
'      ''&P_TNO='' +$(''#P186_TNO'').val() +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode ',
'	  ',
'       ',
'      ;',
'  ',
'',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'',
'',
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P186_BIREPORTURL'').val()',
'  var reportName =  ''StockTransferRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P186_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P186_COMPANY'').val() ==="" || $(''#P186_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P186_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P186_COMPANY'').val();',
'       global_companycode= $(''#P186_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P186_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' +',
'	  ''"_paramsP_LOCATION":"'' + $(''#P186_LOCATION'').val() + ''",'' +  ',
'	  ''"_paramsP_STNO":"'' + $(''#P186_STNO'').val() + ''",'' +  ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P186_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P186_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_FROMSTORAGE":"'' +$(''#P186_FROMSTORAGE'').val() + ''",'' + ',
'	  ''"_paramsP_ITEM":"'' +$(''#P186_ITEM'').val() + ''",'' +',
'	  ''"_paramsP_TOSTORAGE":"'' +$(''#P186_TOSTORAGE'').val() + ''",'' +',
'	  ''"_paramsP_SPECIFICATION":"'' +$(''#P186_SPECIFICATION'').val() + ''",'' +',
'      ''"_paramsGLOBAL_COMPANYCODE":"'' +global_companycode;',
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
'',
'',
''))
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 1.00rem !important; ',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(494252376512811160)
,p_plug_name=>'Stock Transfer'
,p_static_id=>'stock-transfer'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select A.TNO,',
'        Case',
'',
'         When ROW_NUMBER() Over(Partition By A.TNO,',
'',
'                   A.StockTransferno Order By A.TNO,',
'',
'                   A.StockTransferno) = 1 Then',
'',
'          A.StockTransferno',
'',
'         Else',
'',
'          Null',
'',
'       End StockTransferno,',
'',
'       Case',
'',
'         When ROW_NUMBER() Over(Partition By A.TNO,',
'',
'                   A.StockTransferno Order By A.TNO,',
'',
'                   A.StockTransferno) = 1 Then',
'',
'          A.StockTransferDate',
'',
'         Else',
'',
'          Null',
'',
'       End StockTransferDate,',
'',
'       a.doctypecode,',
'',
'       Case',
'',
'         When ROW_NUMBER() Over(Partition By a.TNO,',
'',
'                   A.StockTransferno,',
'',
'                   d.itemcode Order By A.TNO,',
'',
'                   A.StockTransferno,',
'',
'                   d.itemcode) = 1 Then',
'',
'          d.itemname',
'',
'         Else',
'',
'          Null',
'',
'       End FromItem,',
'',
'       Case',
'',
'         When ROW_NUMBER() Over(Partition By a.TNO,',
'',
'                   A.StockTransferno,',
'',
'                   d.itemcode,',
'',
'                   e.itemspecificationcode Order By A.TNO,',
'',
'                   A.StockTransferno,',
'',
'                   d.itemcode,',
'',
'                   e.itemspecificationcode) = 1 Then',
'',
'          e.itemspecificationname',
'',
'         Else',
'',
'          Null',
'',
'       End FromSpec,',
'',
'       d.measuringunitcode1 As FROMUOM1,',
'',
'       d.Measuringunitcode2 As FROMUOM2,',
'',
'       h.storagelocationcode As FromStorageLocationCode,',
'',
'       getstoragelocationname(h.storagelocationcode) As FromStorageLocationName,',
'',
'       h.quantity1 As FromQuantity1,',
'',
'       h.Quantity2 As FromQuantity2,',
'',
'',
'',
'       Case',
'',
'         When ROW_NUMBER() Over(Partition By a.TNO,',
'',
'                   A.StockTransferno,',
'',
'                   f.itemcode Order By A.TNO,',
'',
'                   A.StockTransferno,',
'',
'                   f.itemcode) = 1 Then',
'',
'          f.itemname',
'',
'         Else',
'',
'          Null',
'',
'       End ToItem,',
'',
'       Case',
'',
'         When ROW_NUMBER() Over(Partition By a.TNO,',
'',
'                   A.StockTransferno,',
'',
'                   g.itemspecificationCode Order By A.TNO,',
'',
'                   A.StockTransferno,',
'',
'                   g.itemspecificationCode) = 1 Then',
'',
'          g.itemspecificationName',
'',
'         Else',
'',
'          Null',
'',
'       End ToSpec,',
'',
'       f.measuringunitcode1 As ToUOM1,',
'',
'       f.measuringunitcode2 As TOUOM2,',
'',
'       Case',
'',
'         When ROW_NUMBER() Over(Partition By a.TNO,',
'',
'                   A.StockTransferno,',
'',
'                   b.storagelocationcode Order By A.TNO,',
'',
'                   A.StockTransferno,',
'',
'                   b.storagelocationcode) = 1 Then',
'',
'          getstoragelocationname(b.storagelocationcode)',
'',
'         Else',
'',
'          Null',
'',
'       End toStorageLocationName,',
'',
'       b.Quantity1 As ToQuantity1,',
'',
'       b.Quantity2 As ToQuantity2,',
'',
'       a.creator,',
'',
'       a.creationtime,',
'       getlocationname(a.LOCATIONCODE) as locationname,',
'            ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||A.Tno||'',''||''StockTransfer''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" titl'
||'e="Action"></span</span></a>'' AS Print',
'',
'  From StockTransfer a,',
'',
'       Stocktransferdetail b,',
'',
'       item d,',
'',
'       itemspecification e,',
'',
'       item f,',
'',
'       itemspecification g,',
'',
'       (Select x.tno,',
'',
'               x.sno,',
'',
'               x.storagelocationcode,',
'',
'               Sum(x.quantity1) quantity1,',
'',
'               Sum(x.quantity2) quantity2',
'',
'          From stocktransferstockstdetail x',
'',
'         Group By x.tno, x.sno, x.storagelocationcode) h',
'',
' Where a.tno = b.tno',
'',
'   And a.itemcode = d.itemcode',
'',
'   And a.itemspecificationcode = e.itemspecificationcode',
'',
'   And b.itemcode = f.itemcode',
'',
'   And b.itemspecificationcode = g.itemspecificationcode',
'',
'   And b.tno = h.tno',
'',
'   And b.sno = h.sno',
'   And a.StockTransferDate Between :P186_FROMDATE And :P186_TODATE',
'  and (:P186_COMPANY is null or instr('':''||:P186_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'',
'and ( :P186_LOCATION is null or instr('':''||:P186_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'and ( :P186_ITEM IS NULL OR instr('':''||:P186_ITEM||'':'','':''||D.ItemCode||'':'') > 0 ) ',
'and ( :P186_SPECIFICATION IS NULL OR instr('':''||:P186_SPECIFICATION||'':'','':''||E.ItemSpecificationCode||'':'') > 0 ) ',
'and ( :P186_FROMSTORAGE IS NULL OR instr('':''||:P186_FROMSTORAGE||'':'','':''||h.storagelocationcode||'':'') > 0 ) ',
'and ( :P186_TOSTORAGE IS NULL OR instr('':''||:P186_TOSTORAGE||'':'','':''||b.storagelocationcode||'':'') > 0 )',
'and a.StockTransferNo like nvl(:P186_STNO,''%'')',
'',
'--    And a.StockTransferDate Between :P186_FROMDATE And :P186_TODATE',
'--   and instr('':''||:P186_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'-- and instr('':''||:P186_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'-- and ( :P186_ITEM IS NULL OR instr('':''||:P186_ITEM||'':'','':''||D.ItemCode||'':'') > 0 ) ',
'-- and ( :P186_ITEMSPECIFICATION IS NULL OR instr('':''||:P186_ITEMSPECIFICATION||'':'','':''||E.ItemSpecificationCode||'':'') > 0 ) ',
'-- and a.StockTransferNo like nvl(:P186_STNO,''%'')',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Stock Journal'
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
 p_id=>wwv_flow_imp.id(494252987806811166)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_allow_report_saving=>'N'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:HTML:XLSX'
,p_enable_mail_download=>'N'
,p_detail_link=>'f?p=&APP_ID.:187:&SESSION.::&DEBUG.:187:P187_TNO,P187_FORMSTATUS:#TNO#,EDITRECORD'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>55268118607113182
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471242855477446034)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'TIMESTAMP'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471242452377446034)
,p_db_column_name=>'CREATOR'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'USER (RAISED BY)'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471236491341446032)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>140
,p_column_identifier=>'W'
,p_column_label=>'DOCTYPE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471236884355446032)
,p_db_column_name=>'FROMITEM'
,p_display_order=>150
,p_column_identifier=>'X'
,p_column_label=>'FROM ITEM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471238496312446033)
,p_db_column_name=>'FROMQUANTITY1'
,p_display_order=>200
,p_column_identifier=>'AB'
,p_column_label=>'FROM P QTY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471238872204446033)
,p_db_column_name=>'FROMQUANTITY2'
,p_display_order=>210
,p_column_identifier=>'AC'
,p_column_label=>'FROM S QTY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471237205093446032)
,p_db_column_name=>'FROMSPEC'
,p_display_order=>160
,p_column_identifier=>'Y'
,p_column_label=>'FROM ITEM SPEC'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(476922506083667188)
,p_db_column_name=>'FROMSTORAGELOCATIONCODE'
,p_display_order=>310
,p_column_identifier=>'AL'
,p_column_label=>'Fromstoragelocationcode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(476922675058667189)
,p_db_column_name=>'FROMSTORAGELOCATIONNAME'
,p_display_order=>170
,p_column_identifier=>'AM'
,p_column_label=>'FROM STORAGE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471237688147446032)
,p_db_column_name=>'FROMUOM1'
,p_display_order=>180
,p_column_identifier=>'Z'
,p_column_label=>'FROM P UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471238012556446033)
,p_db_column_name=>'FROMUOM2'
,p_display_order=>190
,p_column_identifier=>'AA'
,p_column_label=>'FROM S UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(462518915152715712)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>330
,p_column_identifier=>'AP'
,p_column_label=>'LOCATION'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(291367047725173273)
,p_db_column_name=>'PRINT'
,p_display_order=>340
,p_column_identifier=>'AQ'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471044092844593791)
,p_db_column_name=>'STOCKTRANSFERDATE'
,p_display_order=>300
,p_column_identifier=>'AK'
,p_column_label=>'STOCK TRANSFER DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471043960312593790)
,p_db_column_name=>'STOCKTRANSFERNO'
,p_display_order=>290
,p_column_identifier=>'AJ'
,p_column_label=>'STOCK TRANSFER NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452422556729317212)
,p_db_column_name=>'TNO'
,p_display_order=>320
,p_column_identifier=>'AO'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471239236480446033)
,p_db_column_name=>'TOITEM'
,p_display_order=>220
,p_column_identifier=>'AD'
,p_column_label=>'TO ITEM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471240835996446034)
,p_db_column_name=>'TOQUANTITY1'
,p_display_order=>270
,p_column_identifier=>'AH'
,p_column_label=>'TO P QTY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471241273653446034)
,p_db_column_name=>'TOQUANTITY2'
,p_display_order=>280
,p_column_identifier=>'AI'
,p_column_label=>'TO S QTY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471239681789446033)
,p_db_column_name=>'TOSPEC'
,p_display_order=>230
,p_column_identifier=>'AE'
,p_column_label=>'TO ITEM SPEC'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(476922775907667190)
,p_db_column_name=>'TOSTORAGELOCATIONNAME'
,p_display_order=>240
,p_column_identifier=>'AN'
,p_column_label=>'TO STORAGE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471240055942446033)
,p_db_column_name=>'TOUOM1'
,p_display_order=>250
,p_column_identifier=>'AF'
,p_column_label=>'TO P UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471240399073446034)
,p_db_column_name=>'TOUOM2'
,p_display_order=>260
,p_column_identifier=>'AG'
,p_column_label=>'TO S UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(494421812197706466)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'113060'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:LOCATIONNAME:DOCTYPECODE:STOCKTRANSFERNO:STOCKTRANSFERDATE:FROMITEM:FROMSPEC:FROMSTORAGELOCATIONNAME:FROMUOM1:FROMQUANTITY1:FROMUOM2:FROMQUANTITY2:TOITEM:TOSPEC:TOSTORAGELOCATIONNAME:TOUOM1:TOQUANTITY1:TOUOM2:TOQUANTITY2:CREATOR:CREATIONTIME'
,p_sort_column_1=>'STOCKTRANSFERDATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'STOCKTRANSFERNO'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'STOCKJOURNALDATE'
,p_sort_direction_3=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(494252286414811159)
,p_plug_name=>'Stock Transfer Register'
,p_static_id=>'stock-transfer-register'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-collapsed:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(453093042634990881)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(494252376512811160)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:187:&SESSION.::&DEBUG.:187::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  tModuleFlow number;',
'  tmp         number;',
'  tmp1        number;',
'BEGIN',
'   select count(*) into tmp1 from ModuleFlow a where a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID);',
'   if nvl(tmp1,0) > 0 then',
'        select ',
'            count(*) into tModuleFlow',
'        from ModuleFlow a, ModuleFlowUser b, Bossuser c',
'        where a.tno = b.tno',
'          and b.bossusercode = c.bossusercode',
'          and a.Modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
'          and c.bossusername = :APP_USER',
'          ;',
'',
'          if nvl(tModuleFlow,0) > 0 then',
'             return(TRUE) ;',
'          else',
'             return(FALSE);',
'          end if;',
'     else',
'            Select',
'            	COUNT(*) into tmp ',
'            From Module a, ModulePrivilege b, BossUser c',
'            Where a.ModuleCode = b.ModuleCode',
'            	and b.BossUsercode = c.BossUserCode',
'            	and c.LoginName = :GLOBAL_LOGINNAME',
'                and a.ModuleCode= getmodulecodeforpageno(:APP_PAGE_ID)',
'            	and b.CompanyCode = :GLOBAL_COMPANYCODE',
'            	and b.InsertPrivilege = ''YES'' ;',
'            if nvl(tmp,0) > 0 then',
'               return(TRUE);',
'            else',
'               return(FALSE);',
'            end if;',
'      end if;',
'              ',
'END;'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(453092465803989175)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(494252376512811160)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:1::'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(453086184206981132)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(494252376512811160)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'PDF'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(453076537278981030)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(494252286414811159)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'N'
,p_grid_column_span=>3
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(453228538685507937)
,p_name=>'P186_BIREPORTURL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(494252286414811159)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471234351807446094)
,p_name=>'P186_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(494252286414811159)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''STOCKTRANSFER''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
'  ;'))
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'U'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(471235610172446095)
,p_name=>'P186_FROMDATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(494252286414811159)
,p_item_default=>'select sysdate-3 from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>45
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(476923875422667255)
,p_name=>'P186_FROMSTORAGE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(494252286414811159)
,p_prompt=>'From Storage'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select storagelocationname d, storagelocationcode r from storagelocation ',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
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
 p_id=>wwv_flow_imp.id(471236440141446095)
,p_name=>'P186_ITEM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(494252286414811159)
,p_prompt=>'Item'
,p_placeholder=>'Material '
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>'SELECT ITEMNAME D,ITEMCODE R FROM ITEM A '
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>74
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471234788235446094)
,p_name=>'P186_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(494252286414811159)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Location'
,p_placeholder=>'Enter Location Name'
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
'  and a.ModuleCode = ''STOCKTRANSFER''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'U'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471236779379446095)
,p_name=>'P186_SPECIFICATION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(494252286414811159)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      ee.ItemSpecificationName as d,',
'      ee.ItemSpecificationCode as r',
'From   Item e, ItemSpecification ee',
'Where e.ItemCode = :P186_ITEM',
'  and e.TNO = ee.TNO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_lov_cascade_parent_items=>'P186_ITEM'
,p_ajax_items_to_submit=>'P186_ITEM,P186_SPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>74
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471235156197446094)
,p_name=>'P186_STNO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(494252286414811159)
,p_prompt=>'Entry No'
,p_placeholder=>'Enter Stock Journal No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'StockTransferNo',
'From StockTransfer',
'Where instr('':''||:P186_LOCATION||'':'','':''||LocationCode||'':'') > 0',
'  and StockTransferDate Between :P186_FROMDATE and :P186_TODATE',
'Order by 1'))
,p_lov_cascade_parent_items=>'P186_LOCATION'
,p_ajax_items_to_submit=>'P186_STNO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS_IGNORE',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(452422412844317211)
,p_name=>'P186_TNO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(494252286414811159)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471235983881446095)
,p_name=>'P186_TODATE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(494252286414811159)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Trunc(sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>45
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(476923957125667256)
,p_name=>'P186_TOSTORAGE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(494252286414811159)
,p_prompt=>'To Storage'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select storagelocationname d, storagelocationcode r from storagelocation ',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
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
 p_id=>wwv_flow_imp.id(453087226097981138)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(453086184206981132)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(453087673885981143)
,p_event_id=>wwv_flow_imp.id(453087226097981138)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/*javascript:window.open(''http://117.217.121.130:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/PBS/REPORTS/Stock Transfer Register.xdo&nQUser=consumer&nQPassword=Info123$&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xp'
||'t":"1","_paramsP_COMPANY":"&P186_COMPANY.","_paramsP_LOCATION":"&P186_LOCATION.","_paramsP_STNO":"&P186_STNO.","_paramsP_FROMDATE":"&P186_FROMDATE.","_paramsP_TODATE":"&P154_TODATE.","_paramsP_ITEM":"&P186_ITEM.","_paramsP_SPECIFICATION":"&P186_SPECI'
||'FICATION."}'');',
    '*/',
    'generatePDF_new();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(453094122108993994)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(453094567331993994)
,p_event_id=>wwv_flow_imp.id(453094122108993994)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(453093338684992907)
,p_name=>'Pagination'
,p_static_id=>'pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(453093738060992908)
,p_event_id=>wwv_flow_imp.id(453093338684992907)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(453086779919981135)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P186_SJNO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P186_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P186_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>14101910720283151
);
wwv_flow_imp.component_end;
end;
/
