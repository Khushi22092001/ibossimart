prompt --application/pages/page_00147
begin
--   Manifest
--     PAGE: 00147
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
 p_id=>147
,p_name=>'PO Amendment Register'
,p_alias=>'PO-AMENDMENT-REGISTER'
,p_step_title=>'PO Amendment Register'
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
'  var bireporturl = $(''#P147_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/POAmendmentRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P147_FROMDATE'').val());',
'  var toDate = new Date($(''#P147_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P147_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P147_COMPANY'').val() ==="" || $(''#P147_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P147_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P147_COMPANY'').val();',
'       global_companycode= $(''#P147_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +    ',
'      ''&P_LOCATION='' + $(''#P147_LOCATION'').val() +  ',
'      ''&P_FROMDATE='' +$(''#P147_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P147_TODATE'').val() + ',
'      ''&P_PONO='' +$(''#P147_PONO'').val() +',
'      ''&P_PARTYNAME='' +$(''#P147_PARTYNAME'').val() +',
'      ''&P_ITEM='' +$(''#P147_ITEM'').val() +',
'      ''&P_SPECIFICATION='' +$(''#P147_SPECIFICATION'').val() +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode ',
'     ',
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
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P147_BIREPORTURL'').val()',
'  var reportName =  ''POAmendmentRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P147_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P147_COMPANY'').val() ==="" || $(''#P147_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P147_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P147_COMPANY'').val();',
'       global_companycode= $(''#P147_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P147_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P147_LOCATION'').val() + ''",'' + ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P147_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P147_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_PONO":"'' + $(''#P147_PONO'').val() + ''",'' + ',
'	  ''"_paramsP_PARTYNAME":"'' + $(''#P147_PARTYNAME'').val() + ''",'' + ',
'	  ''"_paramsP_ITEM":"'' + $(''#P147_ITEM'').val() + ''",'' + ',
'	  ''"_paramsP_SPECIFICATION":"'' + $(''#P147_SPECIFICATION'').val() + ''",'' + ',
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
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(500104838763311836)
,p_plug_name=>'PO Amendment'
,p_static_id=>'po-amendment'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),xxx.PATNO),''STATUS'') AS Status ,',
'    xxx.TNo,',
'    xxx.SNo,',
'    xxx.LocationName,',
'    xxx.DocTypeName,',
'    xxx.PurchaseOrderNo,',
'    xxx.PurchaseOrderDate,',
'    xxx.Vendor,',
'    xxx.PurchaseOrderAmount,',
'    xxx.ItemCode,',
'    xxx.Item,',
'    xxx.UOM,',
'    xxx.Quantity1,',
'    xxx.Rate,',
'    xxx.Amount,',
'    xxx.CGST,',
'    xxx.SGST,',
'    xxx.IGST,',
'    xxx.TCS,',
'    (xxx.CGST + xxx.SGST + xxx.IGST + xxx.TCS) as TAX,',
'    xxx.FooterAmount,',
'    (xxx.FooterAmount - (xxx.CGST + xxx.SGST + xxx.IGST + xxx.TCS)) as OtherAmount,',
'    xxx.TotalAmount,',
'    xxx.PATNO,',
'    xxx.POAmendmentNo,',
'    xxx.POAmendmentTno,',
'    xxx.POAmendmentDate,',
'    xxx.POAQuantity,',
'    xxx.POARate,',
'    xxx.POAAMount,',
'    xxx.POCGST,',
'    xxx.POSGST,',
'    xxx.POIGST,',
'    xxx.POTCS,',
'    xxx.POTAX,',
'    xxx.POAFooterAmount,',
'    xxx.POOtherAmount,    ',
'    xxx.POATotalAmount,',
'    xxx.RaisedBy,',
'    xxx.AmendAmount,',
'          ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||XXX.POAmendmentTno||'',''||''POAmendment1''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="'
||'true" title="Action"></span</span></a>'' AS Print',
'',
'From ',
'        (Select ',
'            xx.SNo,',
'            xx.TNo,',
'            xx.LocationName,',
'            xx.DocTypeName,',
'            xx.PurchaseOrderNo,',
'            xx.PurchaseOrderDate,',
'            xx.Vendor,',
'            xx.PurchaseOrderAmount,',
'            xx.ItemCode,',
'            xx.Item,',
'            xx.UOM,',
'            xx.Quantity1,',
'            xx.Rate,',
'            xx.Amount,',
'            sum(xx.CGST) CGST,',
'            sum(xx.SGST) SGST,',
'            sum(xx.IGST) IGST,',
'            sum(xx.TCS) TCS,',
'            xx.FooterAmount,',
'            xx.TotalAmount,',
'            xx.PATNO,',
'            xx.POAmendmentNo,',
'            xx.poamendmenttno,',
'            xx.POAmendmentDate,',
'            xx.POAQuantity,',
'            xx.POARate,',
'            xx.POAAMount,',
'            xx.POCGST,',
'            xx.POSGST,',
'            xx.POIGST,',
'            xx.POTCS,',
'            xx.POTAX,',
'            xx.POAFooterAmount,',
'            xx.POOtherAmount,',
'            xx.POATotalAmount,',
'            xx.RaisedBy,',
'            xx.AmendAmount',
'        From (  ',
'                Select Distinct ',
'                      a.TNo,',
'                      b.SNo,',
'                      l.LocationName,',
'                      dt.DocTypeName,',
'                      a.PurchaseOrderNo,',
'                      a.PurchaseOrderDate,',
'                      p.PartyName as Vendor,',
'                      a.PurchaseOrderAmount,',
'                      e.ItemCode,',
'                      e.ItemName||'' ~ ''||ee.ItemSpecificationName as Item,',
'                      e.MeasuringUnitCode1 as UOM,',
'                      b.Quantity1,',
'                      b.Rate,',
'                      b.Amount,',
'                      nvl(Decode(c.FooterHeadCode,''.CGST.'', c.FooterValue),0) as CGST,',
'                      nvl(Decode(c.FooterHeadCode,''.SGST.'', c.FooterValue),0) as SGST,',
'                      nvl(Decode(c.FooterHeadCode,''.IGST.'', c.FooterValue),0) as IGST,',
'                      nvl(Decode(c.FooterHeadCode,''.TCS.'', c.FooterValue),0) as TCS,',
'                      b.FooterAmount,',
'                      b.TotalAmount,',
'                      pod.tno as PATNO,',
'                      pod.POAmendmentNo,',
'                      pod.poamendmenttno,',
'                      pod.POAmendmentDate,',
'                      pod.Quantity1 as POAQuantity,',
'                      pod.Rate as POARate,',
'                      pod.POAAMount,',
'                      pod.POCGST,',
'                      pod.POSGST,',
'                      pod.POIGST,',
'                      pod.POTCS,',
'                      pod.POTAX,',
'                      pod.POAFooterAmount,',
'                      pod.POOtherAmount,',
'                      pod.POATotalAmount,',
'                      bue.EmployeeName||'' ( ''||a.Creator||'' )'' as RaisedBy,',
'                      (Select Sum(aa.TotalAmount) as AmendAmount From MyPODetail aa Where aa.TNo= a.TNo)as AmendAmount',
'                From  PurchaseOrder a, PurchaseOrderDetail b, PurchaseOrderDetailFooter c,  DocType dt, Location l, Party p, Item e, ItemSpecification ee, BossUser bu, Employee bue,',
'                      (',
'                    Select',
'                        yyy.TNo,',
'                        yyy.SNo,',
'                        yyy.PurchaseOrderTNo,',
'                        yyy.tno as poamendmenttno,',
'                        yyy.poamendmentno,',
'                        yyy.poamendmentdate,',
'                        yyy.ItemCode,',
'                        yyy.ItemSpecificationCode,',
'                        yyy.Quantity1,',
'                        yyy.Rate,',
'                        yyy.POAAMount,',
'                        yyy.POCGST,',
'                        yyy.POSGST,',
'                        yyy.POIGST,',
'                        YYY.POTCS,',
'                        (YYY.POCGST + YYY.POSGST + YYY.POIGST + YYY.POTCS) as POTAX,',
'                        YYY.POAFooterAmount,',
'                        (YYY.POAFooterAmount - (YYY.POCGST + YYY.POSGST + YYY.POIGST + YYY.POTCS)) as POOtherAmount,',
'                        yYy.POATotalAmount',
'                    From (',
'                    Select',
'                          yy.TNo,',
'                          yy.SNo,',
'                          yy.PurchaseOrderTNo,',
'                          yy.poamendmentno,',
'                          yy.poamendmentdate,',
'                          yy.ItemCode,',
'                          yy.ItemSpecificationCode,',
'                          yy.Quantity1,',
'                          yy.Rate,',
'                          yy.POAAMount,',
'                          sum(yy.POCGST) POCGST,',
'                          sum(yy.POSGST) POSGST,',
'                          sum(yy.POIGST) POIGST,',
'                          sum(yy.POTCS) POTCS,',
'                          yy.POAFooterAmount,',
'                          yy.POATotalAmount',
'                    From ',
'                            (Select',
'                                  po.TNo,',
'                                  pod.SNo,',
'                                  po.PurchaseOrderTNo,',
'                                  po.poamendmentno,',
'                                  po.poamendmentdate,',
'                                  pod.ItemCode,',
'                                  pod.ItemSpecificationCode,',
'                                  pod.Quantity1,',
'                                  pod.Rate,',
'                                  pod.Amount as POAAMount,',
'                                  nvl(Decode(cc.FooterHeadCode,''.CGST.'', cc.FooterValue),0) as POCGST,',
'                                  nvl(Decode(cc.FooterHeadCode,''.SGST.'', cc.FooterValue),0) as POSGST,',
'                                  nvl(Decode(cc.FooterHeadCode,''.IGST.'', cc.FooterValue),0) as POIGST,',
'                                  nvl(Decode(cc.FooterHeadCode,''.TCS.'', cc.FooterValue),0) as POTCS,',
'                                  pod.FooterAmount as POAFooterAmount,',
'                                  pod.TotalAmount as POATotalAmount',
'                            From  POAmendment po, POAmendmentDetail pod, POAmendmentDetailFooter cc',
'                            Where po.TNo = pod.TNo',
'                              and pod.TNo = cc.TNo(+)',
'                              and pod.SNo = cc.SNo(+)',
'                    )yy',
'                    Group By ',
'                          yy.TNo,',
'                          yy.SNo,',
'                          yy.PurchaseOrderTNo,',
'                          yy.poamendmentno,',
'                          yy.poamendmentdate,',
'                          yy.ItemCode,',
'                          yy.ItemSpecificationCode,',
'                          yy.Quantity1,',
'                          yy.Rate,',
'                          yy.POAAMount,',
'                          yy.POAFooterAmount,',
'                          yy.POATotalAmount',
'                    )yyy    )POD',
'                Where a.TNo = b.TNo(+)',
'                  and b.TNo = c.TNo(+)',
'                  and b.Sno = c.Sno(+)',
'                  and a.DocTypeCode = dt.DocTypeCode',
'                  and a.LocationCode = l.LocationCode',
'                  and a.PartyCode = p.PartyCode(+)',
'                  and b.ItemCode = e.ItemCode(+)',
'                  and b.ItemSpecificationCode = ee.ItemSpecificationCode(+)',
'                  and a.TNo = pod.PurchaseOrderTNo(+)',
'                  and b.ItemCode = pod.ItemCode(+)',
'                  and b.ItemSpecificationCode = pod.ItemSpecificationCode(+)',
'                  and a.Creator = bu.LoginName(+)',
'                  and bu.EmployeeCode = bue.EmployeeCode(+)',
'                  and a.PurchaseOrderDate between :P147_FROMDATE and :P147_TODATE',
'                  and ( :P147_COMPANY IS NULL OR instr('':''||:P147_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
'                  and ( :P147_LOCATION IS NULL OR instr('':''||:P147_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 ) ',
'                  --and instr('':''||:P147_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'                  --and instr('':''||:P147_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'                  and ( :P147_ITEM IS NULL OR instr('':''||:P147_ITEM||'':'','':''||e.ItemCode||'':'') > 0 ) ',
'                  and ( :P147_SPECIFICATION IS NULL OR instr('':''||:P147_SPECIFICATION||'':'','':''||ee.ItemSpecificationCode||'':'') > 0 ) ',
'                  and ( :P147_PARTYNAME IS NULL OR instr('':''||:P147_PARTYNAME||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'                  and a.PurchaseOrderNo like nvl(:P147_PONO,''%'')',
'                  --and a.TNO = 269337952  order by 2',
'                )xx',
'        Group By',
'            xx.TNo,',
'            xx.SNo,',
'            xx.LocationName,',
'            xx.DocTypeName,',
'            xx.PurchaseOrderNo,',
'            xx.PurchaseOrderDate,',
'            xx.Vendor,',
'            xx.PurchaseOrderAmount,',
'            xx.ItemCode,',
'            xx.Item,',
'            xx.UOM,',
'            xx.Quantity1,',
'            xx.Rate,',
'            xx.Amount,',
'            xx.FooterAmount,',
'            xx.TotalAmount,',
'            xx.POAmendmentNo,',
'            xx.POAmendmenttNo,',
'            xx.POAmendmentDate,',
'            xx.POAQuantity,',
'            xx.POARate,',
'            xx.POAAMount,',
'            xx.POCGST,',
'            xx.POSGST,',
'            xx.POIGST,',
'            xx.POTCS,',
'            xx.POTAX,',
'            xx.POAFooterAmount,',
'            xx.POOtherAmount,',
'            xx.POATotalAmount,',
'            xx.RaisedBy,',
'            xx.AmendAmount',
')xxx',
'Order by 2'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'PO Amendment'
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
 p_id=>wwv_flow_imp.id(490651571582596280)
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
,p_download_formats=>'HTML:XLSX'
,p_enable_mail_download=>'N'
,p_detail_link=>'f?p=&APP_ID.:148:&SESSION.::&DEBUG.:148:P148_TNO:#POAMENDMENTTNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>51666702382898296
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471295932848697056)
,p_db_column_name=>'AMENDAMOUNT'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'AMENDED AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471291955571697053)
,p_db_column_name=>'AMOUNT'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471297939635697057)
,p_db_column_name=>'CGST'
,p_display_order=>300
,p_column_identifier=>'AF'
,p_column_label=>'CGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471288757376697052)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'DOCTYPE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471292389768697054)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'FOOTER AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471298809531697058)
,p_db_column_name=>'IGST'
,p_display_order=>320
,p_column_identifier=>'AH'
,p_column_label=>'IGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471297208800697057)
,p_db_column_name=>'ITEM'
,p_display_order=>280
,p_column_identifier=>'AD'
,p_column_label=>'MATERIAL DESCRIPTION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471290751061697053)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'MATERIAL CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471288315990697051)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'LOCATION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471300015609697058)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>350
,p_column_identifier=>'AK'
,p_column_label=>'OTHER AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(187203253267143565)
,p_db_column_name=>'PATNO'
,p_display_order=>450
,p_column_identifier=>'AU'
,p_column_label=>'Patno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471294772028697055)
,p_db_column_name=>'POAAMOUNT'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'AMENDED AMOUNT.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471295176777697055)
,p_db_column_name=>'POAFOOTERAMOUNT'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'AMENDED FOOTER AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471293550536697054)
,p_db_column_name=>'POAMENDMENTDATE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'POAMENDMENT DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471293208299697054)
,p_db_column_name=>'POAMENDMENTNO'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'POAMENDMEN TNO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457785563282956792)
,p_db_column_name=>'POAMENDMENTTNO'
,p_display_order=>420
,p_column_identifier=>'AR'
,p_column_label=>'Poamendmenttno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471293932816697055)
,p_db_column_name=>'POAQUANTITY'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'AMENDED QUANTITY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471294369942697055)
,p_db_column_name=>'POARATE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'AMENDED RATE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471295585155697055)
,p_db_column_name=>'POATOTALAMOUNT'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'AMENDED TOTAL AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471300383438697059)
,p_db_column_name=>'POCGST'
,p_display_order=>360
,p_column_identifier=>'AL'
,p_column_label=>'AMENDED CGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471301123211697059)
,p_db_column_name=>'POIGST'
,p_display_order=>380
,p_column_identifier=>'AN'
,p_column_label=>'AMENDED IGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471302353798697060)
,p_db_column_name=>'POOTHERAMOUNT'
,p_display_order=>410
,p_column_identifier=>'AQ'
,p_column_label=>'AMENDED OTHER AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471300781156697059)
,p_db_column_name=>'POSGST'
,p_display_order=>370
,p_column_identifier=>'AM'
,p_column_label=>'AMENDED SGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471302004248697060)
,p_db_column_name=>'POTAX'
,p_display_order=>400
,p_column_identifier=>'AP'
,p_column_label=>'AMENDED TAX'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471301611728697060)
,p_db_column_name=>'POTCS'
,p_display_order=>390
,p_column_identifier=>'AO'
,p_column_label=>'AMENDED TCS'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(291365665959173259)
,p_db_column_name=>'PRINT'
,p_display_order=>430
,p_column_identifier=>'AS'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471290394681697052)
,p_db_column_name=>'PURCHASEORDERAMOUNT'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'PO VALUE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471289571769697052)
,p_db_column_name=>'PURCHASEORDERDATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'PURCHASE ORDER DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471289158066697052)
,p_db_column_name=>'PURCHASEORDERNO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'PURCHASE ORDER NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471291198976697053)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'QUANTITY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471296395129697056)
,p_db_column_name=>'RAISEDBY'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'RAISED BY'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471291536096697053)
,p_db_column_name=>'RATE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'RATE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471298411698697057)
,p_db_column_name=>'SGST'
,p_display_order=>310
,p_column_identifier=>'AG'
,p_column_label=>'SGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471296780833697056)
,p_db_column_name=>'SNO'
,p_display_order=>270
,p_column_identifier=>'AC'
,p_column_label=>'SNO'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(187203218124143564)
,p_db_column_name=>'STATUS'
,p_display_order=>440
,p_column_identifier=>'AT'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471299551935697058)
,p_db_column_name=>'TAX'
,p_display_order=>340
,p_column_identifier=>'AJ'
,p_column_label=>'TAX'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471299193341697058)
,p_db_column_name=>'TCS'
,p_display_order=>330
,p_column_identifier=>'AI'
,p_column_label=>'TCS'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471287989137697051)
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
 p_id=>wwv_flow_imp.id(471292812729697054)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471297558748697057)
,p_db_column_name=>'UOM'
,p_display_order=>290
,p_column_identifier=>'AE'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471289966906697052)
,p_db_column_name=>'VENDOR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'VENDOR NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(490702429115599038)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'112640'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:STATUS:LOCATIONNAME:DOCTYPENAME:VENDOR:PURCHASEORDERNO:PURCHASEORDERDATE:ITEMCODE:ITEM:UOM:QUANTITY1:RATE:TAX:TOTALAMOUNT:PURCHASEORDERAMOUNT:POAMENDMENTNO:POAMENDMENTDATE:POAQUANTITY:POARATE:POTAX:POATOTALAMOUNT:RAISEDBY'
,p_sort_column_1=>'PURCHASEORDERDATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'VENDOR'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(500104744024311835)
,p_plug_name=>'PO Amendment Register'
,p_static_id=>'po-amendment-register'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--accent15:t-Region--scrollBody'
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
 p_id=>wwv_flow_imp.id(453201361072430635)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(500104838763311836)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:148:&SESSION.::&DEBUG.:148::'
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
 p_id=>wwv_flow_imp.id(453192663910421390)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(500104838763311836)
,p_button_name=>'CUSTOM'
,p_static_id=>'custom'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Custom'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/poamendment.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P147_FROMDATE=&P147_FROMDATE.&P147_TODATE=&P147_TODATE.&P147_LOCATION=&P147_LOCATION.&P147_BREAKUPAS=&P147_BREAKUPAS.&P147_BREAKUP=&P147_BREAKUP.&P147_PARTYNAME=&P147_PARTYNAME.&P147_ITEM=&P147_ITEM.&P147_SPECIFICATION=&P147_SPECIFICATION.&P147_PONO=&P147_PONO.'
,p_button_condition=>'1'
,p_button_condition2=>'2'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(453200974264429548)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(500104838763311836)
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
 p_id=>wwv_flow_imp.id(453192987976421390)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(500104838763311836)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pdf'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(453177993951421325)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(500104744024311835)
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
 p_id=>wwv_flow_imp.id(458320613205290659)
,p_name=>'P147_BIREPORTURL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(500104744024311835)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471311441191712558)
,p_name=>'P147_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(500104744024311835)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Company'
,p_placeholder=>'Enter Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode =getmodulecodeforpageno(:APP_PAGE_ID)',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'  ;'))
,p_cSize=>30
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(471285885114697056)
,p_name=>'P147_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(500104744024311835)
,p_item_default=>'Trunc(Sysdate)-7'
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
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471287897606697057)
,p_name=>'P147_ITEM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(500104744024311835)
,p_prompt=>'Material'
,p_placeholder=>'Material'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      e.ItemName||'' ( ''||e.ItemCode||'' )'' as d,',
'      e.ItemCode r',
'From PurchaseOrderDetail a,Item e',
'Where a.ItemCode = e.ItemCode'))
,p_cSize=>75
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(471286767672697057)
,p_name=>'P147_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(500104744024311835)
,p_prompt=>'Location'
,p_placeholder=>'Enter Location Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select dISTINCT',
'      l.LocationName d,',
'      l.LocationCode r',
'From  ModulePrivilege a, ModulePrivilegeLocation b, Location l, BossUser bu, MODULELOCATION ML, MODULELOCATIONDETAIL MD',
'Where a.TNo = b.TNo(+)',
'  AND A.MODULECODE = ML.MODULECODE',
'  AND ML.TNO = MD.TNO',
'  AND (B.LOCATIONCODE = L.LOCATIONCODE OR B.LOCATIONCODE IS NULL)',
'  and (MD.LocationCode = l.LocationCode )',
'  and a.ModuleCode = getmodulecodeforpageno(:APP_PAGE_ID)',
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
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(471287139153697057)
,p_name=>'P147_PARTYNAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(500104744024311835)
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From PurchaseOrder a, Party p',
'Where a.PartyCode = p.PartyCode'))
,p_cSize=>75
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(471287526803697057)
,p_name=>'P147_PONO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(500104744024311835)
,p_prompt=>'PoNo'
,p_placeholder=>'Enter Purchase Order No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select PurchaseOrderNo ',
'From PurchaseOrder ',
'Where instr('':''||:P147_LOCATION||'':'','':''||LocationCode||'':'') > 0',
'  and PurchaseOrderDate Between :P147_FROMDATE and :P147_TODATE',
'Order by 1'))
,p_lov_cascade_parent_items=>'P147_LOCATION'
,p_ajax_items_to_submit=>'P147_PONO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS_IGNORE',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471288286166697058)
,p_name=>'P147_SPECIFICATION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(500104744024311835)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      ee.ItemSpecificationName as d,',
'      ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.ItemCode = :P147_ITEM',
'  and e.TNo = ee.TNO'))
,p_lov_cascade_parent_items=>'P147_ITEM'
,p_ajax_items_to_submit=>'P147_SPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>75
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(452422969359317217)
,p_name=>'P147_TNO'
,p_item_sequence=>20
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471286286715697057)
,p_name=>'P147_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(500104744024311835)
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
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(453199863171425108)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(453200221595425108)
,p_event_id=>wwv_flow_imp.id(453199863171425108)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(453194027527421390)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(453192987976421390)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(453194523701421392)
,p_event_id=>wwv_flow_imp.id(453194027527421390)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(453199016942424087)
,p_name=>'Pagination'
,p_static_id=>'pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(453199440400424087)
,p_event_id=>wwv_flow_imp.id(453199016942424087)
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
 p_id=>wwv_flow_imp.id(453193594795421390)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P147_PONO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P147_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P147_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>14208725595723406
);
wwv_flow_imp.component_end;
end;
/
