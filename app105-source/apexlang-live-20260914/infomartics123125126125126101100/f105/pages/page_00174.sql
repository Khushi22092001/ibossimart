prompt --application/pages/page_00174
begin
--   Manifest
--     PAGE: 00174
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
 p_id=>174
,p_name=>'CC Invoice Register'
,p_alias=>'CC-INVOICE-REGISTER'
,p_step_title=>'CC Invoice Register'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
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
'  var bireporturl = $(''#P174_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/ccinvoiceregister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P174_FROMDATE'').val());',
'  var toDate = new Date($(''#P174_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P174_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P174_COMPANY'').val() ==="" || $(''#P174_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P174_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P174_COMPANY'').val();',
'       global_companycode= $(''#P174_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +',
'      ''&P_STATUS='' +$(''#P174_STATUS'').val() +    ',
'      ''&P_FROMDATE='' +$(''#P174_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P174_TODATE'').val() + ',
'      ''&P_LOCATION='' + $(''#P174_LOCATION'').val() +',
'      ''&P_PARTY='' + $(''#P174_PARTY'').val() +',
'      ''&P_CONSIGNEE='' +$(''#P174_CONSIGNEE'').val() +',
'      ''&P_TRANSPORTER='' +$(''#P174_TRANSPORTER'').val() +',
'      ''&P_DOCTYPE='' +$(''#P174_DOCTYPE'').val() +',
'      ''&P_ITEM='' +$(''#P174_ITEM'').val() +',
'      ''&P_CCINO='' +$(''#P174_CCINO'').val() +',
'      ''&P_ITEMSPECIFICATION='' +$(''#P174_ITEMSPECIFICATION'').val() +',
'      ''&P_ITEMGROUP='' +$(''#P174_ITEMGROUP'').val() +',
'      ''&P_VEHICLENO='' +$(''#P174_VEHICLENO'').val() +',
'      ''&P_AGENTCODE='' +$(''#P174_AGENTCODE'').val() +',
'      ''&P_TRADETYPE='' +$(''#P174_TRADETYPE'').val() +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode',
'	  ',
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
'function sd() {',
'        // Get the modal element by ID',
'        if (apex.item(''P146_DOCTYPECODE'').getValue()==''CONVERSIONJOBOUTOFPREMISES'') {',
'                openModal(''StockStorageDetail'');',
'        }',
'}',
'',
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P174_BIREPORTURL'').val()',
'  var reportName =  ''ccinvoiceregister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P174_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P174_COMPANY'').val() ==="" || $(''#P174_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P174_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P174_COMPANY'').val();',
'       global_companycode= $(''#P174_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P174_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'      ''"_paramsP_STATUS":"'' +$(''#P174_STATUS'').val() + ''",'' +    ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P174_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P174_TODATE'').val() + ''",'' + ',
'      ''"_paramsP_LOCATION":"'' + $(''#P174_LOCATION'').val() + ''",'' + ',
'      ''"_paramsP_PARTY":"'' +$(''#P174_PARTY'').val() + ''",'' + ',
'      ''"_paramsP_CONSIGNEE":"'' +$(''#P174_CONSIGNEE'').val() + ''",'' + ',
'	  ''"_paramsP_TRANSPORTER":"'' +$(''#P174_TRANSPORTER'').val() + ''",'' + ',
'	  ''"_paramsP_DOCTYPE":"'' +$(''#P174_DOCTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_ITEM":"'' +$(''#P174_ITEM'').val() + ''",'' + ',
'	  ''"_paramsP_CCINO":"'' +$(''#P174_CCINO'').val() + ''",'' + ',
'	  ''"_paramsP_ITEMSPECIFICATION":"'' +$(''#P174_ITEMSPECIFICATION'').val() + ''",'' + ',
'      ''"_paramsP_ITEMGROUP":"'' +$(''#P174_ITEMGROUP'').val() + ''",'' + ',
'	  ''"_paramsP_VEHICLENO":"'' +$(''#P174_VEHICLENO'').val() + ''",'' + ',
'      ''"_paramsP_AGENTCODE":"'' +$(''#P174_AGENTCODE'').val() + ''",'' + ',
'	  ''"_paramsP_TRADETYPE":"'' +$(''#P174_TRADETYPE'').val() + ''",'' + ',
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
''))
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}',
'',
'.t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 1.00rem !important; ',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(575916077126587698)
,p_plug_name=>'CC Invoice Register'
,p_static_id=>'cc-invoice-register'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-collapsed:t-Region--accent15:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(566375711967448881)
,p_plug_name=>'CC Invoice Register Report'
,p_static_id=>'cc-invoice-register-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),xxx.TNO),''STATUS'') AS Status ,',
'      xxx.Tno,',
'      xxx.LocationName,',
'      xxx.DocTypeName,',
'      xxx.CCInvoiceNo,',
'      xxx.CCInvoiceDate,',
'      xxx.DespatchAdviceNo,',
'      xxx.DespatchAdviceDate,',
'      xxx.SalesOrderNo,',
'      xxx.SalesOrderDate,',
'      xxx.PartyName,',
'      xxx.Consignee,',
'      xxx.Transporter,',
'      xxx.VehicleNo,',
'      xxx.LorryNo,',
'      xxx.LorryDate,',
'      xxx.FreightTypeName,',
'      xxx.FreightRate,',
'      xxx.FreightUnitCode,',
'      xxx.ItemCode,',
'      xxx.ItemName,',
'      xxx.Item,',
'      xxx.UOM,',
'      xxx.UOM2,',
'      xxx.Quantity1,',
'      xxx.Quantity2,',
'      xxx.Rate,',
'      xxx.Amount,',
'      xxx.CGST,',
'      xxx.SGST,',
'      xxx.IGST,',
'      xxx.TCS,',
'      xxx.FooterAmount,',
'      ABS(xxx.FooterAmount - (xxx.CGST + xxx.SGST + xxx.IGST + xxx.TCS)) as OtherAmount,',
'      xxx.TotalAmount,',
'      xxx.Creator,',
'      xxx.CreationTime,',
'      xxx.AgentName,',
'      xxx.CityName,',
'      xxx.StateName,',
'      xxx.loadingadviceno,',
'      xxx.VoucherStatus,',
'            ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||xxx.Tno||'',''||''CCInvoice11''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" titl'
||'e="Action"></span</span></a>'' AS Print',
'',
'From (',
'        Select',
'              xx.Tno,',
'              xx.LocationName,',
'              xx.DocTypeName,',
'              xx.CCInvoiceNo,',
'              xx.CCInvoiceDate,',
'              xx.DespatchAdviceNo,',
'              xx.DespatchAdviceDate,',
'              xx.SalesOrderNo,',
'              xx.SalesOrderDate,',
'              xx.PartyName,',
'              xx.Consignee,',
'              xx.Transporter,',
'              xx.VehicleNo,',
'              xx.LorryNo,',
'              xx.LorryDate,',
'              xx.FreightTypeName,',
'              xx.FreightRate,',
'              xx.FreightUnitCode,',
'              xx.ItemCode,',
'              xx.ItemName,',
'              xx.Item,',
'              xx.UOM,',
'              xx.UOM2,',
'              xx.Quantity1,',
'              XX.Quantity2,',
'              xx.Rate,',
'              xx.Amount,',
'              sum(xx.CGST) CGST,',
'              sum(xx.SGST) SGST,',
'              sum(xx.IGST) IGST,',
'              sum(xx.TCS) TCS,',
'              xx.FooterAmount,',
'              xx.TotalAmount,',
'              xx.Creator,',
'              xx.CreationTime,',
'              xx.AgentName,',
'              xx.CityName,',
'              xx.StateName,',
'              xx.loadingadviceno,',
'              xx.VoucherStatus',
'        From (',
'                Select',
'                      a.Tno,',
'                      l.LocationName,',
'                      dt.DocTypeName,',
'                      a.CCInvoiceNo,',
'                      a.CCInvoiceDate,',
'                      da.DespatchAdviceNo,',
'                      da.DespatchAdviceDate,',
'                      so.SalesOrderNo,',
'                      so.SalesOrderDate,',
'                      GetPartyName(so.AgentCode) as AgentName,',
'                      p.PartyName,',
'                      GetCityName(p.OfficeCityCode) as CityName,',
'                      GetStateName(p.OfficeStateCode) as StateName,',
'                      GetPartyName(a.ConsigneeCode) as Consignee,',
'                      t.PartyName as Transporter,',
'                      a.VehicleNo,',
'                      a.LorryNo,',
'                      a.LorryDate,',
'                      ft.FreightTypeName,',
'                      a.FreightRate,',
'                      a.FreightUnitCode,',
'                      b.ItemCode,',
'                      e.ItemName,',
'                      e.ItemName||'' ~ ''||ee.ItemSpecificationName as Item,',
'                      e.MeasuringUnitCode1 as UOM,',
'                      e.MeasuringUnitCode2 as UOM2,',
'                      Case When  e.ItemClassificationCode != ''SERVICE'' then b.Quantity1 ',
'                      end as Quantity1,',
'                      Case When  e.ItemClassificationCode != ''SERVICE'' then b.Quantity2 ',
'                      end as Quantity2,',
'                      b.Rate,',
'                      b.Amount,',
'                      nvl(Decode(c.FooterHeadCode,''.CGST.'', c.FooterValue),0) as CGST,',
'                      nvl(Decode(c.FooterHeadCode,''.SGST.'', c.FooterValue),0) as SGST,',
'                      nvl(Decode(c.FooterHeadCode,''.IGST.'', c.FooterValue),0)as IGST,',
'                      nvl(Decode(c.FooterHeadCode,''.TCS.'', c.FooterValue),0) as TCS,',
'                      b.FooterAmount,',
'                      b.TotalAmount,',
'                      bue.EmployeeName||'' ( ''||a.Creator||'')'' as Creator,',
'                      a.CreationTime,',
'                      ld.loadingadviceno,',
'                      Case When vo.ModuleTno is not null then ''PREPAIRED''',
'                       When vo.ModuleTno is null then ''PENDING''',
'                       End  as VoucherStatus',
'                From  CCInvoice a, CCInvoiceDetail b, CCInvoiceDetailFooter c, Location l, DocType dt, Party p, Party t, Item e, itemSpecification ee, DespatchAdvice da, ',
'                (',
'                    Select',
'                         s.TNo,',
'                         s.SalesOrderNo,',
'                         s.SalesOrderDate,',
'                         s.PartyCode,',
'                         s.ConsigneeCode,',
'                         s.AgentCode',
'                    From SalesOrder s )so,BossUser bu , Employee bue, DocumentStatusDetail dsd, FreightType ft , loadingadvice ld, Invoice ic, Voucher vo',
'                Where a.TNo = b.TNo(+)',
'                  and b.TNo = c.TNo(+)',
'                  and b.SNo = c.SNo(+)',
'                  and a.loadingadvicetno = ld.tno(+)',
'                  and a.LocationCode = l.LocationCode(+)',
'                  and a.DocTypeCode =  dt.DocTypeCode(+)',
'                  and a.DespatchAdviceTNo = da.TNo(+)',
'                  and a.SalesOrderTNo = so.TNo(+)',
'                  and a.PartyCode = p.PartyCode(+)',
'                  and a.TransporterCode = t.PartyCode(+)',
'                  and b.ItemCode = e.ItemCode(+)',
'                  and b.ItemSpecificationCode = ee.itemSpecificationCode(+)',
'                  and a.Creator = bu.LoginName(+)',
'                  and bu.EmployeeCode = bue.EMployeeCode(+)',
'                  and a.TNO = dsd.ModuleTNO(+)',
'                  and a.FreightTypeCode = ft.FreightTypeCode(+)',
'                  and a.Tno = ic.ModuleTno(+)',
'                  and ic.Tno = vo.ModuleTno(+)',
'                  and a.CCInvoiceDate between :P174_FROMDATE and :P174_TODATE',
'                  and ( :P174_LOCATION IS NULL OR instr('':''||:P174_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 ) ',
'                  and ( :P174_DOCTYPE IS NULL OR instr('':''||:P174_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0 ) ',
'                 and ( :P174_COMPANY IS NULL OR instr('':''||:P174_COMPANY||'':'','':''||a.companycode||'':'') > 0 ) ',
'                   and ( :P174_AGENTCODE IS NULL OR SO.AGENTCODE = :P174_AGENTCODE)',
'                  and ( :P174_PARTY IS NULL OR instr('':''||:P174_PARTY||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'                  and ( :P174_CONSIGNEE IS NULL OR instr('':''||:P174_CONSIGNEE||'':'','':''||so.ConsigneeCode||'':'') > 0 ) ',
'                  and ( :P174_TRANSPORTER IS NULL OR instr('':''||:P174_TRANSPORTER||'':'','':''||a.TransporterCode||'':'') > 0 ) ',
'                  and ( :P174_TRANSACTIONTYPE IS NULL OR instr('':''||:P174_TRANSACTIONTYPE||'':'','':''||a.TransactiontypeCode||'':'') > 0 ) ',
'                  and ( :P174_ITEM IS NULL OR instr('':''||:P174_ITEM||'':'','':''||e.ItemCode||'':'') > 0 ) ',
'                  and ( :P174_ITEMSPECIFICATION IS NULL OR instr('':''||:P174_ITEMSPECIFICATION||'':'','':''||ee.ItemSpecificationCode||'':'') > 0 ) ',
'                  and a.CCInvoiceNo like nvl(:P174_CCINO,''%'')',
'                  and (:P174_VEHICLENO is null or a.VehicleNo = :P174_VEHICLENO)',
'                  and getcompanyprivilege(a.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES''',
'                  AND getlocationprivilege(a.locationcode,GETMODULECODEFORPAGENO(:APP_PAGE_ID),a.companycode,:global_loginname)=''YES''',
'                  AND getdoctypeprivilege(a.doctypecode,GETMODULECODEFORPAGENO(:APP_PAGE_ID),a.companycode,:global_loginname)=''YES''',
'                  and case When dsd.DocumentStatusCode = ''ACTIVE'' Then ''ACTIVE''',
'                           When dsd.DocumentStatusCode is null Then ''NONACTIVE''',
'                           When dsd.DocumentStatusCode = ''PREPARING'' Then ''PREPARING''',
'                           When dsd.DocumentStatusCode = ''PREPARED'' Then ''PREPARED''',
'                           When dsd.DocumentStatusCode = ''AUTHORISED'' Then ''AUTHORISED''',
'                           When dsd.DocumentStatusCode = ''CANCELED'' Then ''CANCELED''',
'                           When dsd.DocumentStatusCode = ''ONHOLD'' Then ''ONHOLD''',
'                           When dsd.DocumentStatusCode = ''SHORTCLOSED'' Then ''SHORTCLOSED''',
'                           When dsd.DocumentStatusCode = ''CLOSED'' Then ''CLOSED''',
'                           When dsd.DocumentStatusCode = ''DEPTAPPROVED'' Then ''DEPTAPPROVED''',
'                           When dsd.DocumentStatusCode = ''STOREAPPROVED'' Then ''STOREAPPROVED''',
'                      End  like nvl(:P174_STATUS,''%'')',
'                 AND (:P174_ITEMGROUP IS NULL ',
'                      OR',
'                      EXISTS',
'                        (Select 1',
'                            From (Select ITEMCODE,',
'                                        parentcode,',
'                                        RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'                                        Level,',
'                                        CONNECT_BY_ROOT itemcode As root_id,',
'                                        ''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'                                        CONNECT_BY_ISLEAF As leaf',
'                                    From item a',
'                                    Start With parentcode Is Null',
'                                    Connect By parentcode = Prior itemcode',
'                                    Order Siblings By itemcode',
'                                  ) x',
'                            Where X.ROOT_ID = :P174_ITEMGROUP',
'                              AND X.ITEMCODE = B.ITEMCODE',
'                        )',
'                    )                        ',
'        )xx',
'        Group By',
'              xx.Tno,',
'              xx.LocationName,',
'              xx.DocTypeName,',
'              xx.CCInvoiceNo,',
'              xx.CCInvoiceDate,',
'              xx.DespatchAdviceNo,',
'              xx.DespatchAdviceDate,',
'              xx.SalesOrderNo,',
'              xx.SalesOrderDate,',
'              xx.PartyName,',
'              xx.Consignee,',
'              xx.Transporter,',
'              xx.VehicleNo,',
'              xx.LorryNo,',
'              xx.LorryDate,',
'              xx.FreightTypeName,',
'              xx.FreightRate,',
'              xx.FreightUnitCode,',
'              xx.ItemCode,',
'              xx.ItemName,',
'              xx.Item,',
'              xx.UOM,',
'              xx.UOM2,',
'              xx.Quantity1,',
'              xx.Quantity2,',
'              xx.Rate,',
'              xx.Amount,',
'              xx.FooterAmount,',
'              xx.TotalAmount,',
'              xx.Creator,',
'              xx.CreationTime,',
'              xx.AgentName,',
'              xx.CityName,',
'              xx.StateName,',
'              xx.loadingadviceno,',
'              xx.VoucherStatus',
')xxx',
'Order by 1',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P174_COMPANY,P174_STATUS,P174_FROMDATE,P174_TODATE,P174_LOCATION,P174_PARTY,P174_CONSIGNEE,P174_TRANSPORTER,P174_DOCTYPE,P174_ITEM,P174_CCINO,P174_ITEMSPECIFICATION,P174_ITEMGROUP,P174_VEHICLENO,P174_AGENTCODE,P174_TRADETYPE,P174_BIREPORTURL,P174_TNO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Dispatch Advice Register'
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
 p_id=>wwv_flow_imp.id(588678309654911908)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
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
,p_detail_link=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:175:P175_TNO,P175_FORMSTATUS:#TNO#,EDITRECORD'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>157234930263916674
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449181834218207791)
,p_db_column_name=>'AGENTNAME'
,p_display_order=>450
,p_column_identifier=>'BQ'
,p_column_label=>'AGENT NAME'
,p_column_html_expression=>'<div style="display:block; width:150px">#AGENTNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449439758187930331)
,p_db_column_name=>'AMOUNT'
,p_display_order=>300
,p_column_identifier=>'AV'
,p_column_label=>'AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449432159339930327)
,p_db_column_name=>'CCINVOICEDATE'
,p_display_order=>220
,p_column_identifier=>'AK'
,p_column_label=>'INVOICE DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#CCINVOICEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449431733524930326)
,p_db_column_name=>'CCINVOICENO'
,p_display_order=>210
,p_column_identifier=>'AJ'
,p_column_label=>'INVOICE NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#CCINVOICENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449440187273930331)
,p_db_column_name=>'CGST'
,p_display_order=>310
,p_column_identifier=>'AW'
,p_column_label=>'CGST'
,p_column_html_expression=>'<div style="display:block; width:100px">#CGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449181962809207792)
,p_db_column_name=>'CITYNAME'
,p_display_order=>460
,p_column_identifier=>'BR'
,p_column_label=>'CITY'
,p_column_html_expression=>'<div style="display:block; width:120px">#CITYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449431006198930326)
,p_db_column_name=>'CONSIGNEE'
,p_display_order=>420
,p_column_identifier=>'BN'
,p_column_label=>'CONSIGNEE'
,p_column_html_expression=>'<div style="display:block; width:250px">#CONSIGNEE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449443321258930333)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>390
,p_column_identifier=>'BK'
,p_column_label=>'TIMESTAMP'
,p_column_html_expression=>'<div style="display:block; width:130px">#CREATIONTIME#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449442935353930333)
,p_db_column_name=>'CREATOR'
,p_display_order=>380
,p_column_identifier=>'BJ'
,p_column_label=>'USER (RAISED BY)'
,p_column_html_expression=>'<div style="display:block; width:200px">#CREATOR#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449434122944930328)
,p_db_column_name=>'DESPATCHADVICEDATE'
,p_display_order=>180
,p_column_identifier=>'T'
,p_column_label=>'DESPATCH ADVICE DATE'
,p_column_html_expression=>'<div style="display:block; width:100px">#DESPATCHADVICEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449433750563930328)
,p_db_column_name=>'DESPATCHADVICENO'
,p_display_order=>170
,p_column_identifier=>'S'
,p_column_label=>'DESPATCH ADVICE NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#DESPATCHADVICENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449433379621930327)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>160
,p_column_identifier=>'R'
,p_column_label=>'DOCTYPE'
,p_column_html_expression=>'<div style="display:block; width:150px">#DOCTYPENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449441732355930332)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>350
,p_column_identifier=>'BA'
,p_column_label=>'FOOTERAMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449438167290930330)
,p_db_column_name=>'FREIGHTRATE'
,p_display_order=>250
,p_column_identifier=>'AQ'
,p_column_label=>'FREIGHT RATE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449457898594933953)
,p_db_column_name=>'FREIGHTTYPENAME'
,p_display_order=>440
,p_column_identifier=>'BP'
,p_column_label=>'FREIGHT TYPE'
,p_column_html_expression=>'<div style="display:block; width:100px">#FREIGHTTYPENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449438537703930330)
,p_db_column_name=>'FREIGHTUNITCODE'
,p_display_order=>260
,p_column_identifier=>'AR'
,p_column_label=>'FREIGHT UNIT'
,p_column_html_expression=>'<div style="display:block; width:100px">#FREIGHTUNITCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449440966979930332)
,p_db_column_name=>'IGST'
,p_display_order=>330
,p_column_identifier=>'AY'
,p_column_label=>'IGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449436967827930329)
,p_db_column_name=>'ITEM'
,p_display_order=>140
,p_column_identifier=>'P'
,p_column_label=>'MATERIAL DESCRIPTION'
,p_column_html_expression=>'<div style="display:block; width:250px">#ITEM#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449436181734930329)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'MATERIAL CODE'
,p_column_html_expression=>'<div style="display:block; width:100px">#ITEMCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449431357189930326)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>430
,p_column_identifier=>'BO'
,p_column_label=>'Item Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188550716423659800)
,p_db_column_name=>'LOADINGADVICENO'
,p_display_order=>500
,p_column_identifier=>'BX'
,p_column_label=>'LOADING ADVICE NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#LOADINGADVICENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449432942032930327)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>150
,p_column_identifier=>'Q'
,p_column_label=>'LOCATION'
,p_column_html_expression=>'<div style="display:block; width:130px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449437322791930330)
,p_db_column_name=>'LORRYDATE'
,p_display_order=>240
,p_column_identifier=>'AO'
,p_column_label=>'LR DATE'
,p_column_html_expression=>'<div style="display:block; width:90px">#LORRYDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449432538543930327)
,p_db_column_name=>'LORRYNO'
,p_display_order=>230
,p_column_identifier=>'AN'
,p_column_label=>'LR NO'
,p_column_html_expression=>'<div style="display:block; width:140px">#LORRYNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449442190737930332)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>360
,p_column_identifier=>'BB'
,p_column_label=>'OTHERAMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449434516622930328)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>190
,p_column_identifier=>'X'
,p_column_label=>'VENDOR NAME'
,p_column_html_expression=>'<div style="display:block; width:250px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(283823665256470504)
,p_db_column_name=>'PRINT'
,p_display_order=>480
,p_column_identifier=>'BV'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449436545016930329)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>' P QUANTITY'
,p_column_html_expression=>'<div style="display:block; width:100px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465149266972917365)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>130
,p_column_identifier=>'BU'
,p_column_label=>'S QUANTITY'
,p_column_html_expression=>'<div style="display:block; width:100px">#QUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449439387711930331)
,p_db_column_name=>'RATE'
,p_display_order=>290
,p_column_identifier=>'AU'
,p_column_label=>'RATE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449430528133930326)
,p_db_column_name=>'SALESORDERDATE'
,p_display_order=>410
,p_column_identifier=>'BM'
,p_column_label=>'SALES ORDER DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449430162765930324)
,p_db_column_name=>'SALESORDERNO'
,p_display_order=>400
,p_column_identifier=>'BL'
,p_column_label=>'SALES ORDER NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#SALESORDERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449440539622930331)
,p_db_column_name=>'SGST'
,p_display_order=>320
,p_column_identifier=>'AX'
,p_column_label=>'SGST'
,p_column_html_expression=>'<div style="display:block; width:100px">#SGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449182058106207793)
,p_db_column_name=>'STATENAME'
,p_display_order=>470
,p_column_identifier=>'BS'
,p_column_label=>'STATE'
,p_column_html_expression=>'<div style="display:block; width:110px">#STATENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(179661176046440809)
,p_db_column_name=>'STATUS'
,p_display_order=>490
,p_column_identifier=>'BW'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449441338329930332)
,p_db_column_name=>'TCS'
,p_display_order=>340
,p_column_identifier=>'AZ'
,p_column_label=>'TCS'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449435386656930329)
,p_db_column_name=>'TNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449442564918930332)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>370
,p_column_identifier=>'BC'
,p_column_label=>'TOTALAMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449435793459930329)
,p_db_column_name=>'TRANSPORTER'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'TRANSPORTER'
,p_column_html_expression=>'<div style="display:block; width:190px">#TRANSPORTER#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449438922485930330)
,p_db_column_name=>'UOM'
,p_display_order=>270
,p_column_identifier=>'AT'
,p_column_label=>'P UOM'
,p_column_html_expression=>'<div style="display:block; width:100px">#UOM#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465149152446917364)
,p_db_column_name=>'UOM2'
,p_display_order=>280
,p_column_identifier=>'BT'
,p_column_label=>'S UOM'
,p_column_html_expression=>'<div style="display:block; width:100px">#UOM2#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449434935857930328)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>200
,p_column_identifier=>'AA'
,p_column_label=>'VEHICLE NO'
,p_column_html_expression=>'<div style="display:block; width:100px">#VEHICLENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194523559780067297)
,p_db_column_name=>'VOUCHERSTATUS'
,p_display_order=>510
,p_column_identifier=>'BY'
,p_column_label=>'VOUCHER STATUS'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(457757425945368164)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Group by Item'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'31244'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CCINVOICEDATE:CCINVOICENO:PARTYNAME:CONSIGNEE:TRANSPORTER:SALESORDERNO:DESPATCHADVICENO:VEHICLENO:LORRYNO:LORRYDATE:FREIGHTRATE:FREIGHTUNITCODE:ITEMCODE:ITEM:UOM:QUANTITY1:RATE:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:FOOTERAMOUNT:TOTALAMOUNT:CREATOR:CR'
||'EATIONTIME'
,p_sort_column_1=>'CCINVOICEDATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'CCINVOICENO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'PARTYNAME'
,p_sort_direction_3=>'ASC'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(439471609414071605)
,p_report_id=>wwv_flow_imp.id(457757425945368164)
,p_group_by_columns=>'ITEMNAME'
,p_function_01=>'COUNT_DISTINCT'
,p_function_column_01=>'TNO'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Total Invoices'
,p_function_format_mask_01=>'999G999G999G999G990D00'
,p_function_sum_01=>'Y'
,p_function_02=>'SUM'
,p_function_column_02=>'QUANTITY1'
,p_function_db_column_name_02=>'APXWS_GBFC_02'
,p_function_label_02=>'Total Quantity'
,p_function_format_mask_02=>'999G999G999G999G990D00'
,p_function_sum_02=>'Y'
,p_function_03=>'SUM'
,p_function_column_03=>'AMOUNT'
,p_function_db_column_name_03=>'APXWS_GBFC_03'
,p_function_label_03=>'Item Total Amount'
,p_function_format_mask_03=>'999G999G999G999G990D00'
,p_function_sum_03=>'Y'
,p_function_04=>'SUM'
,p_function_column_04=>'CGST'
,p_function_db_column_name_04=>'APXWS_GBFC_04'
,p_function_label_04=>'CGST'
,p_function_format_mask_04=>'999G999G999G999G990D00'
,p_function_sum_04=>'Y'
,p_function_05=>'SUM'
,p_function_column_05=>'SGST'
,p_function_db_column_name_05=>'APXWS_GBFC_05'
,p_function_label_05=>'SGST'
,p_function_format_mask_05=>'999G999G999G999G990D00'
,p_function_sum_05=>'Y'
,p_function_06=>'SUM'
,p_function_column_06=>'IGST'
,p_function_db_column_name_06=>'APXWS_GBFC_06'
,p_function_label_06=>'IGST'
,p_function_format_mask_06=>'999G999G999G999G990D00'
,p_function_sum_06=>'Y'
,p_function_07=>'SUM'
,p_function_column_07=>'TCS'
,p_function_db_column_name_07=>'APXWS_GBFC_07'
,p_function_label_07=>'TCS'
,p_function_format_mask_07=>'999G999G999G999G990D00'
,p_function_sum_07=>'Y'
,p_function_08=>'SUM'
,p_function_column_08=>'TOTALAMOUNT'
,p_function_db_column_name_08=>'APXWS_GBFC_08'
,p_function_label_08=>'Total Amount'
,p_function_format_mask_08=>'999G999G999G999G990D00'
,p_function_sum_08=>'Y'
,p_sort_column_01=>'ITEMNAME'
,p_sort_direction_01=>'ASC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(457760315589405558)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Group by Party'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'31252'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CCINVOICEDATE:CCINVOICENO:PARTYNAME:CONSIGNEE:TRANSPORTER:SALESORDERNO:DESPATCHADVICENO:VEHICLENO:LORRYNO:LORRYDATE:FREIGHTRATE:FREIGHTUNITCODE:ITEMCODE:ITEM:UOM:QUANTITY1:RATE:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:FOOTERAMOUNT:TOTALAMOUNT:CREATOR:CR'
||'EATIONTIME'
,p_sort_column_1=>'CCINVOICEDATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'CCINVOICENO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'PARTYNAME'
,p_sort_direction_3=>'ASC'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(439472310268071613)
,p_report_id=>wwv_flow_imp.id(457760315589405558)
,p_group_by_columns=>'CONSIGNEE'
,p_function_01=>'COUNT_DISTINCT'
,p_function_column_01=>'TNO'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Total Invoices'
,p_function_format_mask_01=>'999G999G999G999G990D00'
,p_function_sum_01=>'Y'
,p_function_02=>'SUM'
,p_function_column_02=>'QUANTITY1'
,p_function_db_column_name_02=>'APXWS_GBFC_02'
,p_function_label_02=>'Total Quantity'
,p_function_format_mask_02=>'999G999G999G999G990D00'
,p_function_sum_02=>'Y'
,p_function_03=>'SUM'
,p_function_column_03=>'AMOUNT'
,p_function_db_column_name_03=>'APXWS_GBFC_03'
,p_function_label_03=>'Amount'
,p_function_format_mask_03=>'999G999G999G999G990D00'
,p_function_sum_03=>'Y'
,p_function_04=>'SUM'
,p_function_column_04=>'CGST'
,p_function_db_column_name_04=>'APXWS_GBFC_04'
,p_function_label_04=>'CGST'
,p_function_format_mask_04=>'999G999G999G999G990D00'
,p_function_sum_04=>'Y'
,p_function_05=>'SUM'
,p_function_column_05=>'SGST'
,p_function_db_column_name_05=>'APXWS_GBFC_05'
,p_function_label_05=>'SGST'
,p_function_format_mask_05=>'999G999G999G999G990D00'
,p_function_sum_05=>'Y'
,p_function_06=>'SUM'
,p_function_column_06=>'IGST'
,p_function_db_column_name_06=>'APXWS_GBFC_06'
,p_function_label_06=>'IGST'
,p_function_format_mask_06=>'999G999G999G999G990D00'
,p_function_sum_06=>'Y'
,p_function_07=>'SUM'
,p_function_column_07=>'TCS'
,p_function_db_column_name_07=>'APXWS_GBFC_07'
,p_function_label_07=>'TCS'
,p_function_format_mask_07=>'999G999G999G999G990D00'
,p_function_sum_07=>'Y'
,p_function_08=>'SUM'
,p_function_column_08=>'TOTALAMOUNT'
,p_function_db_column_name_08=>'APXWS_GBFC_08'
,p_function_label_08=>'Total Amount'
,p_function_format_mask_08=>'999G999G999G999G990D00'
,p_function_sum_08=>'Y'
,p_sort_column_01=>'CONSIGNEE'
,p_sort_direction_01=>'ASC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(588741502106917442)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'31260'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:STATUS:VOUCHERSTATUS:LOCATIONNAME:CCINVOICENO:CCINVOICEDATE:SALESORDERNO:LOADINGADVICENO:PARTYNAME:CONSIGNEE:TRANSPORTER:VEHICLENO:LORRYNO:LORRYDATE:FREIGHTTYPENAME:FREIGHTRATE:FREIGHTUNITCODE:ITEMCODE:ITEM:UOM:QUANTITY1:UOM2:QUANTITY2:RATE:AMO'
||'UNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:CREATOR:CREATIONTIME'
,p_sort_column_1=>'CCINVOICEDATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'CCINVOICENO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'PARTYNAME'
,p_sort_direction_3=>'ASC'
,p_sum_columns_on_break=>'AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:QUANTITY1'
,p_chart_type=>'pie'
,p_chart_label_column=>'ITEM'
,p_chart_value_column=>'QUANTITY1'
,p_chart_aggregate=>'SUM'
,p_chart_sorting=>'DEFAULT'
,p_chart_orientation=>'vertical'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(450024644119108630)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Agent wise Sales'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'37054'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CCINVOICEDATE:CCINVOICENO:PARTYNAME:CONSIGNEE:TRANSPORTER:SALESORDERNO:DESPATCHADVICENO:VEHICLENO:LORRYNO:LORRYDATE:FREIGHTTYPENAME:FREIGHTRATE:FREIGHTUNITCODE:ITEMCODE:ITEM:UOM:QUANTITY1:RATE:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:CREATOR'
||':CREATIONTIME'
,p_sort_column_1=>'CCINVOICEDATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'CCINVOICENO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'PARTYNAME'
,p_sort_direction_3=>'ASC'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(439474470417071637)
,p_report_id=>wwv_flow_imp.id(450024644119108630)
,p_group_by_columns=>'AGENTNAME'
,p_function_01=>'COUNT_DISTINCT'
,p_function_column_01=>'TNO'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'TOTAL INVOICE'
,p_function_format_mask_01=>'999G999G999G999G990D00'
,p_function_sum_01=>'Y'
,p_function_02=>'SUM'
,p_function_column_02=>'QUANTITY1'
,p_function_db_column_name_02=>'APXWS_GBFC_02'
,p_function_label_02=>'QUANTITY'
,p_function_format_mask_02=>'999G999G999G999G990D00'
,p_function_sum_02=>'Y'
,p_function_03=>'SUM'
,p_function_column_03=>'AMOUNT'
,p_function_db_column_name_03=>'APXWS_GBFC_03'
,p_function_label_03=>'AMOUNT'
,p_function_format_mask_03=>'999G999G999G999G990D00'
,p_function_sum_03=>'Y'
,p_function_04=>'SUM'
,p_function_column_04=>'CGST'
,p_function_db_column_name_04=>'APXWS_GBFC_04'
,p_function_label_04=>'CGST'
,p_function_format_mask_04=>'999G999G999G999G990D00'
,p_function_sum_04=>'Y'
,p_function_05=>'SUM'
,p_function_column_05=>'SGST'
,p_function_db_column_name_05=>'APXWS_GBFC_05'
,p_function_label_05=>'SGST'
,p_function_format_mask_05=>'999G999G999G999G990D00'
,p_function_sum_05=>'Y'
,p_function_06=>'SUM'
,p_function_column_06=>'IGST'
,p_function_db_column_name_06=>'APXWS_GBFC_06'
,p_function_label_06=>'IGST'
,p_function_format_mask_06=>'999G999G999G999G990D00'
,p_function_sum_06=>'Y'
,p_function_07=>'SUM'
,p_function_column_07=>'TCS'
,p_function_db_column_name_07=>'APXWS_GBFC_07'
,p_function_label_07=>'TCS'
,p_function_format_mask_07=>'999G999G999G999G990D00'
,p_function_sum_07=>'Y'
,p_function_08=>'SUM'
,p_function_column_08=>'TOTALAMOUNT'
,p_function_db_column_name_08=>'APXWS_GBFC_08'
,p_function_label_08=>'TOTAL AMOUNT'
,p_function_format_mask_08=>'999G999G999G999G990D00'
,p_function_sum_08=>'Y'
,p_sort_column_01=>'AGENTNAME'
,p_sort_direction_01=>'ASC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(450025850378124831)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'State wise Sales'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'37066'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CCINVOICEDATE:CCINVOICENO:PARTYNAME:CONSIGNEE:TRANSPORTER:SALESORDERNO:DESPATCHADVICENO:VEHICLENO:LORRYNO:LORRYDATE:FREIGHTTYPENAME:FREIGHTRATE:FREIGHTUNITCODE:ITEMCODE:ITEM:UOM:QUANTITY1:RATE:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:CREATOR'
||':CREATIONTIME'
,p_sort_column_1=>'CCINVOICEDATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'CCINVOICENO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'PARTYNAME'
,p_sort_direction_3=>'ASC'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(439473032602071621)
,p_report_id=>wwv_flow_imp.id(450025850378124831)
,p_group_by_columns=>'STATENAME'
,p_function_01=>'COUNT_DISTINCT'
,p_function_column_01=>'TNO'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'TOTAL INVOICE'
,p_function_format_mask_01=>'999G999G999G999G990D00'
,p_function_sum_01=>'Y'
,p_function_02=>'SUM'
,p_function_column_02=>'QUANTITY1'
,p_function_db_column_name_02=>'APXWS_GBFC_02'
,p_function_label_02=>'QUANTITY'
,p_function_format_mask_02=>'999G999G999G999G990D00'
,p_function_sum_02=>'Y'
,p_function_03=>'SUM'
,p_function_column_03=>'AMOUNT'
,p_function_db_column_name_03=>'APXWS_GBFC_03'
,p_function_label_03=>'AMOUNT'
,p_function_format_mask_03=>'999G999G999G999G990D00'
,p_function_sum_03=>'Y'
,p_function_04=>'SUM'
,p_function_column_04=>'CGST'
,p_function_db_column_name_04=>'APXWS_GBFC_04'
,p_function_label_04=>'CGST'
,p_function_format_mask_04=>'999G999G999G999G990D00'
,p_function_sum_04=>'Y'
,p_function_05=>'SUM'
,p_function_column_05=>'SGST'
,p_function_db_column_name_05=>'APXWS_GBFC_05'
,p_function_label_05=>'SGST'
,p_function_format_mask_05=>'999G999G999G999G990D00'
,p_function_sum_05=>'Y'
,p_function_06=>'SUM'
,p_function_column_06=>'IGST'
,p_function_db_column_name_06=>'APXWS_GBFC_06'
,p_function_label_06=>'IGST'
,p_function_format_mask_06=>'999G999G999G999G990D00'
,p_function_sum_06=>'Y'
,p_function_07=>'SUM'
,p_function_column_07=>'TCS'
,p_function_db_column_name_07=>'APXWS_GBFC_07'
,p_function_label_07=>'TCS'
,p_function_format_mask_07=>'999G999G999G999G990D00'
,p_function_sum_07=>'Y'
,p_function_08=>'SUM'
,p_function_column_08=>'TOTALAMOUNT'
,p_function_db_column_name_08=>'APXWS_GBFC_08'
,p_function_label_08=>'TOTAL AMOUNT'
,p_function_format_mask_08=>'999G999G999G999G990D00'
,p_function_sum_08=>'Y'
,p_sort_column_01=>'STATENAME'
,p_sort_direction_01=>'ASC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(450075652752549031)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Freight Detail (Invoice wise)'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'37564'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CCINVOICEDATE:CCINVOICENO:PARTYNAME:CONSIGNEE:TRANSPORTER:SALESORDERNO:DESPATCHADVICENO:VEHICLENO:LORRYNO:LORRYDATE:FREIGHTTYPENAME:FREIGHTRATE:FREIGHTUNITCODE:CREATOR:CREATIONTIME'
,p_sort_column_1=>'CCINVOICEDATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'CCINVOICENO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'PARTYNAME'
,p_sort_direction_3=>'ASC'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(439470557970071591)
,p_report_id=>wwv_flow_imp.id(450075652752549031)
,p_static_id=>'ir-condition'
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'TRANSPORTER'
,p_operator=>'!='
,p_expr=>'TRANSPORT PBS SELF'
,p_condition_sql=>'"TRANSPORTER" != #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# != ''TRANSPORT PBS SELF''  '
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(439470973436071597)
,p_report_id=>wwv_flow_imp.id(450075652752549031)
,p_group_by_columns=>'CCINVOICEDATE:CCINVOICENO:PARTYNAME:TRANSPORTER:LORRYNO:LORRYDATE:FREIGHTUNITCODE:FREIGHTRATE'
,p_sort_column_01=>'CCINVOICEDATE'
,p_sort_direction_01=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(438376640029914478)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(566375711967448881)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:175:P175_FORMSTATUS,P175_IS_READONLY:NEWRECORD,0'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(439475207968071643)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(566375711967448881)
,p_button_name=>'CUSTOM2'
,p_static_id=>'custom'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Custom'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/ccinvoiceregister.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P174_FROMDATE=&P174_FROMDATE.&P174_TODATE=&P174_TODATE.&P174_LOCATION=&P174_LOCATION.&P174_DOCTYPE=&P174_DOCTYPE.&P174_PARTY=&P174_PARTY.&P174_TRANSPORTER=&P174_TRANSPORTER.&P174_ITEM=&P174_ITEM.&P174_ITEMSPECIFICATION=&P174_ITEMSPECIFICATION.&P174_CCINO=&P174_CCINO.&P174_VEHICLENO=&P174_VEHICLENO.&P174_VSTATUS=&P174_VSTATUS.&P174_MISTATUS=&P174_MISTATUS.'
,p_button_condition=>'1'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(438376533081914477)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(566375711967448881)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(439474809024071643)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(566375711967448881)
,p_button_name=>'PDF2'
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
 p_id=>wwv_flow_imp.id(439476008493071643)
,p_button_sequence=>190
,p_button_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_static_id=>'REFRESH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
,p_grid_column=>9
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(465167435198917529)
,p_name=>'P174_AGENTCODE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(439521591203192126)
,p_name=>'P174_BIREPORTURL'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449468551557930513)
,p_name=>'P174_CCINO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_prompt=>'Invoice No'
,p_placeholder=>'Enter CCInvoice No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select CCInvoiceNo ',
'From CCInvoice ',
'Where instr('':''||:P174_LOCATION||'':'','':''||LocationCode||'':'') > 0',
'  and CCInvoiceDate Between :P174_FROMDATE and :P174_TODATE',
'Order by 1'))
,p_lov_cascade_parent_items=>'P174_LOCATION'
,p_ajax_items_to_submit=>'P174_CCINO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>28
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS_IGNORE',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449476256890934119)
,p_name=>'P174_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''CCINVOICE''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
' and getcompanyprivilege(C.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES''',
'Order by 1',
'  ;',
''))
,p_cSize=>30
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(463887687612191920)
,p_name=>'P174_CONSIGNEE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_prompt=>'Consignee'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From ccinvoice a, Party p',
'Where a.ConsigneeCode = p.PartyCode',
'Order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>40
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(449467762042930513)
,p_name=>'P174_DOCTYPE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_prompt=>'DocType'
,p_placeholder=>'Enter DocType Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      dt.DocTypeName d,',
'      dt.DocTypeCode r',
'From  ModulePrivilege a, ModulePrivilegeDocType b, DocType dt, BossUser bu, ModuleDocType md, ModuleDocTypeDetail mdd',
'Where a.TNo = b.TNo(+)',
'  and (b.DocTypeCode = dt.DocTypeCode or b.DocTypeCode is null)',
'  and a.ModuleCode = md.ModuleCode',
'  and md.TNo = mdd.TNo',
'  and mdd.DocTypeCode = dt.DocTypeCode',
'  and a.ModuleCode = ''CCINVOICE''',
'  and a.ViewPrivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
';'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(449466149431930512)
,p_name=>'P174_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_item_default=>'Trunc(Sysdate) - 7'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449468930188930513)
,p_name=>'P174_ITEM'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_prompt=>'Material'
,p_placeholder=>'Material'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      e.ItemName||'' ( ''||e.ItemCode||'' )'' as d,',
'      e.ItemCode r',
'From ccinvoiceDetail a, Item e',
'Where a.ItemCode = e.ItemCode',
'Order by 1'))
,p_cSize=>75
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(464196706102193222)
,p_name=>'P174_ITEMGROUP'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449469663281930514)
,p_name=>'P174_ITEMSPECIFICATION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'     ee.ItemSpecificationName as d,',
'     ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.ItemCode = :P174_ITEM',
'  and e.TNo = ee.TNo',
'Order by 1'))
,p_lov_cascade_parent_items=>'P174_ITEM'
,p_ajax_items_to_submit=>'P174_ITEMSPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>75
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(449466875254930512)
,p_name=>'P174_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_prompt=>'Location'
,p_placeholder=>'Enter  Location Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      l.LocationName d,',
'      l.LocationCode r',
'From  ModulePrivilege a, ModulePrivilegeLocation b, Location l, BossUser bu, MODULELOCATION ML, MODULELOCATIONDETAIL MD',
'Where a.TNo = b.TNo(+)',
'  AND A.MODULECODE = ML.MODULECODE',
'  AND ML.TNO = MD.TNO',
'  AND (B.LOCATIONCODE = L.LOCATIONCODE OR B.LOCATIONCODE IS NULL)',
'  and (MD.LocationCode = l.LocationCode )',
'  and a.ModuleCode = ''CCINVOICE''',
'  and a.ViewPrivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(449467341943930513)
,p_name=>'P174_PARTY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From ccinvoice a, Party p',
'Where a.PartyCode = p.PartyCode',
'Order by 1'))
,p_cSize=>75
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(449465687699930510)
,p_name=>'P174_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Active;ACTIVE,Non-Active;NONACTIVE,Canceled;CANCELED,Closed;CLOSED,Preparing;PREPARING,Prepared;PREPARED,Authorised;AUTHORISED,On Hold;ONHOLD,Short Closed;SHORTCLOSED,Dept Approved;DEPTAPPROVED,Store Approval;STOREAPPROVED'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select Status--'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(440421521523799558)
,p_name=>'P174_TNO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449466558264930512)
,p_name=>'P174_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_item_default=>'Trunc(Sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(465167489648917530)
,p_name=>'P174_TRADETYPE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(188550900188659802)
,p_name=>'P174_TRANSACTIONTYPE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_prompt=>'Transaction Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>'Select TRANSACTIONTYPENAME d , TRANSACTIONTYPECODE r from TRANSACTIONTYPE'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>75
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(449468156451930513)
,p_name=>'P174_TRANSPORTER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_prompt=>'Transporter'
,p_placeholder=>'Transporter Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From CCINVOICE a, Party p',
'Where a.TransporterCode = p.PartyCode',
'Order by 1'))
,p_cSize=>75
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(449469330256930514)
,p_name=>'P174_VEHICLENO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(575916077126587698)
,p_prompt=>'VehicleNo'
,p_placeholder=>'Enter Vehicle No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'Select Distinct VehicleNo From DespatchAdvice order by 1'
,p_cSize=>28
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(439481810746071648)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(439474809024071643)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(439482343238071649)
,p_event_id=>wwv_flow_imp.id(439481810746071648)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/*javascript:window.open(''http://117.217.121.130:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/PBS/REPORTS/ccinvoiceregister.xdo&nQUser=consumer&nQPassword=Info123$&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1"'
||',"_paramsP_COMPANY":"&P174_COMPANY.","_paramsP_LOCATION":"&P174_LOCATION.","_paramsP_FROMDATE":"&P174_FROMDATE.","_paramsP_TODATE":"&P174_TODATE.","_paramsP_DOCTYPE":"&P174_DOCTYPE.","_paramsP_STATUS":"&P174_STATUS.","_paramsP_ITEM":"&P174_ITEM.","_p'
||'aramsP_ITEMSPECIFICATION":"&P174_ITEMSPECIFICATION.","_paramsP_TRANSPORTER":"&P174_TRANSPORTER.","_paramsP_PARTY":"&P174_PARTY.","_paramsP_VEHICLENO":"&P174_VEHICLENO.","_paramsP_CCINO":"&P174_CCINO."}'');',
    '*/',
    'generatePDF_new();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(438376691858914479)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(438376809630914480)
,p_event_id=>wwv_flow_imp.id(438376691858914479)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '',
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(183487242040629082)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(183487699831629082)
,p_event_id=>wwv_flow_imp.id(183487242040629082)
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
 p_id=>wwv_flow_imp.id(439481404192071648)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P174_CCINO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P174_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P174_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>8038024801076414
);
wwv_flow_imp.component_end;
end;
/
