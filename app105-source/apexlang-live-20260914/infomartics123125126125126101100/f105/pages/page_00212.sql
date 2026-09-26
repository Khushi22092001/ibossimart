prompt --application/pages/page_00212
begin
--   Manifest
--     PAGE: 00212
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
 p_id=>212
,p_name=>'Service Bill Register'
,p_alias=>'JOB-BILL-REGISTER'
,p_step_title=>'Service Bill Register'
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
'  var bireporturl = $(''#P212_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/JobBillRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P212_FROMDATE'').val());',
'  var toDate = new Date($(''#P212_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P212_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P212_COMPANY'').val() ==="" || $(''#P212_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P212_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P212_COMPANY'').val();',
'       global_companycode= $(''#P212_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +       ',
'      ''&P_LOCATION='' + $(''#P212_LOCATION'').val() +    ',
'      ''&P_FROMDATE='' +$(''#P212_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P212_TODATE'').val() + ',
'      ''&P_JBPSTATUS='' +$(''#P212_JBPSTATUS'').val() +',
'      ''&P_PARTY='' +$(''#P212_PARTY'').val() +',
'      ''&P_ITEMGROUP='' +$(''#P212_ITEMGROUP'').val() +',
'      ''&P_JOBTYPE='' +$(''#P212_JOBTYPE'').val() +',
'      ''&P_ITEMSPECIFICATION='' +$(''#P212_ITEMSPECIFICATION'').val() +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode',
'        ',
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
'  var bireporturl = $(''#P212_BIREPORTURL'').val()',
'  var reportName =  ''JobBillRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P212_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P212_COMPANY'').val() ==="" || $(''#P212_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P212_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P212_COMPANY'').val();',
'       global_companycode= $(''#P212_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P212_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' +',
'	  ''"_paramsP_LOCATION":"'' + $(''#P212_LOCATION'').val() + ''",'' + ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P212_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P212_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_JBPSTATUS":"'' +$(''#P212_JBPSTATUS'').val() + ''",'' +',
'	  ''"_paramsP_PARTY":"'' +$(''#P212_PARTY'').val() + ''",'' + ',
'	  ''"_paramsP_ITEMGROUP":"'' +$(''#P212_ITEMGROUP'').val() + ''",'' +',
'	  ''"_paramsP_JOBTYPE":"'' + $(''#P212_JOBTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_ITEMSPECIFICATION":"'' + $(''#P212_ITEMSPECIFICATION'').val() + ''",'' + ',
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
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(504324011063721025)
,p_plug_name=>'Job Bill Register Report'
,p_static_id=>'job-bill-register-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select xxx.TNo,',
'       xxx.SNo,',
'       xxx.LocationName,',
'       xxx.JobBillNo,',
'       xxx.JobBillDate,',
'       xxx.Vendor,',
'       xxx.PartyBillNo,',
'       xxx.partyBillDate,',
'       xxx.JobTypeCode,',
'       xxx.JobTypeName,',
'       --xxx.UOM1,',
'       xxx.Quantity1,',
'       --xxx.UOM2,',
'       xxx.Quantity2,',
'       xxx.Rate,',
'       xxx.UOM,',
'       xxx.Amount,',
'       xxx.CGST,',
'       xxx.SGST,',
'       xxx.IGST,',
'       xxx.TCS,',
'       xxx.FooterAmount,',
'       (xxx.FooterAmount - (xxx.CGST + xxx.SGST + xxx.IGST + xxx.TCS)) As OtherAmount,',
'       xxx.TotalAmount,',
'       xxx.JBPASS_STATUS,',
'       xxx.JBPASSNo,',
'       xxx.JBPASSDate,',
'       xxx.locationcode,',
'       xxx.vendoraddress,',
'       (Select Sum(footerpercent)',
'          From Jobbilldetailfooter',
'         Where tno = xxx.tno',
'           And sno = xxx.sno',
'           And footerheadcode In (''.CGST.'', ''.SGST.'', ''.IGST.'')) As footerpercent,',
'       xxx.saccode',
'',
'  From (Select xx.TNo,',
'               xx.SNo,',
'               xx.LocationName,',
'               xx.JobBillNo,',
'               xx.JobBillDate,',
'               xx.Vendor,',
'               xx.PartyBillNo,',
'               xx.partyBillDate,',
'               xx.JobTypeCode,',
'               xx.JobTypeName,',
'               --xx.UOM1,',
'               xx.Quantity1,',
'               --xx.UOM2,',
'               xx.Quantity2,',
'               xx.Rate,',
'               xx.RateMeasuringUnitCode UOM,',
'               xx.Amount,',
'               Sum(xx.CGST) CGST,',
'               Sum(xx.SGST) SGST,',
'               Sum(xx.IGST) IGST,',
'               Sum(xx.TCS) TCS,',
'               xx.FooterAmount,',
'               xx.TotalAmount,',
'               xx.JBPASS_STATUS,',
'               xx.JBPASSNo,',
'               xx.JBPASSDate,',
'               xx.locationcode,',
'               xx.vendoraddress,',
'               Max(xx.footerpercent) As footerpercent,',
'               xx.saccode',
'          From (Select a.TNo,',
'                       b.SNo,',
'                       a.locationcode,',
'                       l.LocationName,',
'                       a.JobBillNo,',
'                       a.JobBillDate,',
'                       p.PartyName As Vendor,',
'                       (p.officeaddress ||',
'                       decode(p.officeaddress2,',
'                               Null,',
'                               Null,',
'                               '','' || p.officeaddress2) ||',
'                       decode(p.officeaddress3,',
'                               Null,',
'                               Null,',
'                               '','' || p.officeaddress3) ||',
'                       decode(p.officeaddress4,',
'                               Null,',
'                               Null,',
'                               '','' || p.officeaddress4) ||',
'                       decode(p.officecitycode,',
'                               Null,',
'                               Null,',
'                               '','' || getcityname(p.officecitycode)) ||',
'                       decode(p.officestatecode,',
'                               Null,',
'                               Null,',
'                               '','' || getstatename(p.officestatecode)) ||',
'                       decode(p.officepincode,',
'                               Null,',
'                               Null,',
'                               '', PIN CODE -'' || p.officepincode)',
'                       ',
'                       ) As vendoraddress,',
'                       a.PartyBillNo,',
'                       a.partyBillDate,',
'                       e.JobTypeCode,',
'                       e.JobTypeName,',
'                       e.saccode,',
'                       --e.MeasuringUnitCode1 As UOM1,',
'                       b.Quantity1,',
'                       --e.MeasuringUnitCode2 As UOM2,',
'                       b.Quantity2,',
'                       b.Rate,',
'                       b.RateMeasuringUnitCode,',
'                       b.Amount,',
'                       c.footerpercent,',
'                       nvl(Decode(c.FooterHeadCode, ''.CGST.'', c.FooterValue),',
'                           0) As CGST,',
'                       nvl(Decode(c.FooterHeadCode, ''.SGST.'', c.FooterValue),',
'                           0) As SGST,',
'                       nvl(Decode(c.FooterHeadCode, ''.IGST.'', c.FooterValue),',
'                           0) As IGST,',
'                       nvl(Decode(c.FooterHeadCode, ''.TCS.'', c.FooterValue),',
'                           0) As TCS,',
'                       b.FooterAmount,',
'                       b.TotalAmount,',
'                       nvl(Decode(pbp.JobBillTNo, a.TNo, ''PREPARED''),',
'                           ''PENDING'') As JBPASS_STATUS,',
'                       pbp.JBPASSNo,',
'                       pbp.JBPASSDate',
'                  From JobBill             a,',
'                       JobBillDetail       b,',
'                       JobBillDetailFooter c,',
'                       Location            l,',
'                       JobType             e,',
'                       Party               p,',
'                       JobOrder            po,',
'                       JBPASS              pbp',
'                 Where a.TNo = b.TNo',
'                   And b.TNo = c.TNO(+)',
'                   And b.SNo = c.SNo(+)',
'                   And a.LocationCode = l.LocationCode',
'                   And b.JobTypeCode = e.JobTypeCode(+)',
'                   And a.PartyCode = p.PartyCode(+)',
'                   And a.JobOrderTNo = po.TNo(+)',
'                    and a.JobBillDate between :P212_FROMDATE and :P212_TODATE',
'                    and ( :P212_COMPANY IS NULL OR instr('':''||:P212_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'                    and ( :P212_LOCATION IS NULL OR instr('':''||:P212_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'                    and ( :P212_PARTY IS NULL OR instr('':''||:P212_PARTY||'':'','':''||a.PartyCode||'':'') > 0 )',
'                    and ( :P212_JOBTYPE IS NULL OR instr('':''||:P212_JOBTYPE||'':'','':''||e.JobTypeCode||'':'') > 0 )',
'                    and nvl(Decode(pbp.JobBillTNo,a.TNo,''PREPARED''),''PENDING'') like nvl(:P212_PBPSTATUS,''%'')',
'                    and a.TNo = pbp.JobBillTNo(+)',
'                    and a.JobBillNo like nvl(:P212_PBNO,''%'')',
'                    -- and ( :P212_ITEMGROUP IS NULL OR instr('':''||:P212_ITEMGROUP||'':'','':''||e.ParentCode||'':'') > 0 )                     ',
'                ',
'                ) xx',
'         Group By xx.TNo,',
'                  xx.SNo,',
'                  xx.LocationName,',
'                  xx.JobBillNo,',
'                  xx.JobBillDate,',
'                  xx.Vendor,',
'                  xx.PartyBillNo,',
'                  xx.partyBillDate,',
'                  xx.JobTypeCode,',
'                  xx.JobTypeName,',
'                  --xx.UOM1,',
'                  xx.Quantity1,',
'                  -- xx.UOM2,',
'                  xx.Quantity2,',
'                  xx.Rate,',
'                  xx.RateMeasuringUnitCode,',
'                  xx.FooterAmount,',
'                  xx.Amount,',
'                  xx.TotalAmount,',
'                  xx.JBPASS_STATUS,',
'                  xx.JBPASSNo,',
'                  xx.JBPASSDate,',
'                  xx.locationcode,',
'                  xx.vendoraddress,',
'                  xx.saccode) xxx',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P212_COMPANY,P212_LOCATION,P212_FROMDATE,P212_TODATE,P212_JBPSTATUS,P212_PARTY,P212_ITEMGROUP,P212_JOBTYPE,P212_ITEMSPECIFICATION,P212_TNO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Purchase Bill Register Report'
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
 p_id=>wwv_flow_imp.id(522814615556236927)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_show_nulls_as=>'0'
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
,p_detail_link=>'f?p=&APP_ID.:213:&SESSION.::&DEBUG.:213:P213_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>91371236165241693
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473504068624974198)
,p_db_column_name=>'AMOUNT'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473507288411974199)
,p_db_column_name=>'CGST'
,p_display_order=>250
,p_column_identifier=>'Z'
,p_column_label=>'CGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473504463621974198)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'FOOTER AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473510092596974201)
,p_db_column_name=>'FOOTERPERCENT'
,p_display_order=>320
,p_column_identifier=>'AG'
,p_column_label=>'TAX PERCENT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473508077298974200)
,p_db_column_name=>'IGST'
,p_display_order=>270
,p_column_identifier=>'AB'
,p_column_label=>'IGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473367221251497601)
,p_db_column_name=>'JBPASSDATE'
,p_display_order=>410
,p_column_identifier=>'AP'
,p_column_label=>'JB PASS DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473367181076497600)
,p_db_column_name=>'JBPASSNO'
,p_display_order=>400
,p_column_identifier=>'AO'
,p_column_label=>'JB PASS NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473367038713497599)
,p_db_column_name=>'JBPASS_STATUS'
,p_display_order=>390
,p_column_identifier=>'AN'
,p_column_label=>'JBPASS STATUS'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473366958103497598)
,p_db_column_name=>'JOBBILLDATE'
,p_display_order=>380
,p_column_identifier=>'AM'
,p_column_label=>'SERVICE  BILL DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473366867956497597)
,p_db_column_name=>'JOBBILLNO'
,p_display_order=>370
,p_column_identifier=>'AL'
,p_column_label=>'SERVICE BILL NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473367382431497602)
,p_db_column_name=>'JOBTYPECODE'
,p_display_order=>420
,p_column_identifier=>'AQ'
,p_column_label=>'SERVICE TYPE CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473367412747497603)
,p_db_column_name=>'JOBTYPENAME'
,p_display_order=>430
,p_column_identifier=>'AR'
,p_column_label=>'SERVICE TYPE NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473509281471974201)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>300
,p_column_identifier=>'AE'
,p_column_label=>'LOCATION CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473500500034974195)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'LOCATION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473508873235974200)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>290
,p_column_identifier=>'AD'
,p_column_label=>'OTHER AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473502430661974197)
,p_db_column_name=>'PARTYBILLDATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'PARTY BILL DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYBILLDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473502037746974197)
,p_db_column_name=>'PARTYBILLNO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'PARTY BILL NO'
,p_column_html_expression=>'<div style="display:block; width:100px">#PARTYBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473503248622974197)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'P QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473511644102974202)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>360
,p_column_identifier=>'AK'
,p_column_label=>'S QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473503654697974197)
,p_db_column_name=>'RATE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'RATE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473367549789497604)
,p_db_column_name=>'SACCODE'
,p_display_order=>440
,p_column_identifier=>'AS'
,p_column_label=>'SACCODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473507606530974200)
,p_db_column_name=>'SGST'
,p_display_order=>260
,p_column_identifier=>'AA'
,p_column_label=>'SGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473500071283974195)
,p_db_column_name=>'SNO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Sno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473508496972974200)
,p_db_column_name=>'TCS'
,p_display_order=>280
,p_column_identifier=>'AC'
,p_column_label=>'TCS'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473499625180974185)
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
 p_id=>wwv_flow_imp.id(473504816430974198)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'TOTAL AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473506860461974199)
,p_db_column_name=>'UOM'
,p_display_order=>240
,p_column_identifier=>'Y'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473501652748974196)
,p_db_column_name=>'VENDOR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'VENDOR NAME'
,p_column_html_expression=>'<div style="display:block; width:200px">#VENDOR#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473509693197974201)
,p_db_column_name=>'VENDORADDRESS'
,p_display_order=>310
,p_column_identifier=>'AF'
,p_column_label=>'VENDOR ADDRESS'
,p_column_html_expression=>'<div style="display:block; width:200px">#VENDORADDRESS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(522836275155246427)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'239309'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LOCATIONNAME:VENDOR:PARTYBILLNO:PARTYBILLDATE:JOBBILLNO:JOBBILLDATE:JOBTYPENAME:SACCODE:QUANTITY1:QUANTITY2:RATE:UOM:AMOUNT:FOOTERPERCENT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:JBPASS_STATUS:JBPASSNO:JBPASSDATE'
,p_sort_column_1=>'VENDOR'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'PURCHASEBILLDATE'
,p_sort_direction_2=>'ASC'
,p_sum_columns_on_break=>'QUANTITY1:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(504323916324721024)
,p_plug_name=>'Service Bill Register'
,p_static_id=>'service-bill-register'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-collapsed:t-Region--accent15:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'Y',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(442739013050697733)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(504324011063721025)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:213:&SESSION.::&DEBUG.:213::'
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
 p_id=>wwv_flow_imp.id(442733250973691395)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(504324011063721025)
,p_button_name=>'CUSTOM'
,p_static_id=>'custom'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Custom'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/purchasebillregister.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P212_FROMDATE=&P212_FROMDATE.&P212_TODATE=&P212_TODATE.&P212_PBPSTATUS=&P212_PBPSTATUS.&P212_ITEMSPECIFICATION=&P212_ITEMSPECIFICATION.&P212_ITEM=&P212_ITEM.&P212_LOCATION=&P212_LOCATION.&P212_PARTY=&P212_PARTY.&P212_PBNO=&P212_PBNO.'
,p_button_condition=>'1'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(442739375240698730)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(504324011063721025)
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
 p_id=>wwv_flow_imp.id(442732787630691394)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(504324011063721025)
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
 p_id=>wwv_flow_imp.id(442720385743691317)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(504323916324721024)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>9
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(443079972738802377)
,p_name=>'P212_BIREPORTURL'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(504323916324721024)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(473496860402974276)
,p_name=>'P212_COMPANY'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(504323916324721024)
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''JOBBILL''',
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
 p_id=>wwv_flow_imp.id(473497674025974278)
,p_name=>'P212_FROMDATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(504323916324721024)
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
 p_id=>wwv_flow_imp.id(473499200454974279)
,p_name=>'P212_ITEMGROUP'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(504323916324721024)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(473500017109974279)
,p_name=>'P212_ITEMSPECIFICATION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(504323916324721024)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(473498427983974278)
,p_name=>'P212_JBPSTATUS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(504323916324721024)
,p_prompt=>'JBP Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:PREPARED;PREPARED,PENDING;PENDING'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select PBPass Status--'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(473499628255974279)
,p_name=>'P212_JOBTYPE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(504323916324721024)
,p_prompt=>'JOB '
,p_placeholder=>'Material'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      e.JobTypeName as d,',
'      e.JobTypeCode r',
'From JobBillDetail a, JobType e',
'Where a.JobTypeCode = e.JobTypeCode'))
,p_cSize=>74
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
 p_id=>wwv_flow_imp.id(473497280567974278)
,p_name=>'P212_LOCATION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(504323916324721024)
,p_prompt=>'Location'
,p_placeholder=>'Enter Location Name'
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
'  and a.ModuleCode = ''JOBBILL''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
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
 p_id=>wwv_flow_imp.id(473498842414974279)
,p_name=>'P212_PARTY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(504323916324721024)
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From PurchaseBill a, Party p',
'Where a.PartyCode = p.PartyCode'))
,p_cSize=>74
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
 p_id=>wwv_flow_imp.id(441796394762964037)
,p_name=>'P212_TNO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(504323916324721024)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(473498032340974278)
,p_name=>'P212_TODATE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(504323916324721024)
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
,p_grid_column=>5
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
 p_id=>wwv_flow_imp.id(442734255933691401)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(442732787630691394)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(442734761773691404)
,p_event_id=>wwv_flow_imp.id(442734255933691401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/*javascript:window.open(''http://117.217.121.130:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/PBS/REPORTS/purchasebillregister.xdo&nQUser=consumer&nQPassword=Info123$&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":'
||'"1","_paramsP_COMPANY":"&P212_COMPANY.","_paramsP_LOCATION":"&P212_LOCATION.","_paramsP_FROMDATE":"&P212_FROMDATE.","_paramsP_TODATE":"&P212_TODATE.","_paramsP_PARTY":"&P212_PARTY.","_paramsP_ITEM":"&P212_ITEM.","_paramsP_PBSTATUS":"&P212_PBSTATUS.",'
||'"_paramsP_ITEMSPECIFICATION":"&P212_ITEMSPECIFICATION.","_paramsP_ITEMGROUP":"&P212_ITEMGROUP."}'');',
    '*/',
    'generatePDF_new();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(442739493969700779)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(442739978822700781)
,p_event_id=>wwv_flow_imp.id(442739493969700779)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441796555221964038)
,p_name=>'Refresh '
,p_static_id=>'refresh'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(442720385743691317)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441796652453964039)
,p_event_id=>wwv_flow_imp.id(441796555221964038)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(504324011063721025)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(442733859251691398)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'begin',
'  if :P212_PBNO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P212_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P212_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>11290479860696164
);
wwv_flow_imp.component_end;
end;
/
