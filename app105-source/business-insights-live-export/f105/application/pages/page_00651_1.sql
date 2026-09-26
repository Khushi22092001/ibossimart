prompt --application/pages/page_00651
begin
--   Manifest
--     PAGE: 00651
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
 p_id=>651
,p_name=>'On Duty Request List'
,p_alias=>'ON-DUTY-REQUEST-LIST'
,p_step_title=>'On Duty Request List'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<script id="hspl-sidebar-head-state">',
'(function(d){',
'  var state=''closed'';',
'  try {',
'    var saved=window.localStorage.getItem(''imart.sidebar.state.v1'');',
'    if(saved===''open''||saved===''closed'') state=saved;',
'  } catch(ignore) {}',
'  d.classList.remove(state===''open''?''hspl-nav-target-closed'':''hspl-nav-target-open'');',
'  d.classList.add(state===''open''?''hspl-nav-target-open'':''hspl-nav-target-closed'');',
'})(document.documentElement);',
'</script>',
'<style id="hspl-register-first-paint">',
'/* Match the application''s existing final register palette at parser time.',
'   These declarations intentionally duplicate (not replace) the final shared',
'   design-system values, preventing the older theme palette from becoming a',
'   visible intermediate frame during initial render or APEX IR refresh. */',
'body:not(.t-PageBody--login) .a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table th.a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table thead th,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-thead .a-IRR-header {',
'  background:#e6e8f7!important;',
'  color:#3f4a7a!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-toolbar,',
'body:not(.t-PageBody--login) .a-IRR-controlsContainer {',
'  background:#f4f3fd!important;',
'  border-color:#e6e4f7!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(even) td:not([style*="background"]) {',
'  background-color:#f3f6fc!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(odd) td:not([style*="background"]) {',
'  background-color:#fff!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:hover td:not([style*="background"]) {',
'  background-color:#eaf0fb!important;',
'}',
'body:not(.t-PageBody--login) .t-Region:has(.a-IRR),',
'body:not(.t-PageBody--login) .a-IRR,',
'body:not(.t-PageBody--login) .a-IRR-region,',
'body:not(.t-PageBody--login) .t-IRR-region,',
'body:not(.t-PageBody--login) .a-IRR-content,',
'body:not(.t-PageBody--login) .a-IRR-table,',
'body:not(.t-PageBody--login) .t-fht-wrapper,',
'body:not(.t-PageBody--login) .t-fht-thead,',
'body:not(.t-PageBody--login) .t-fht-tbody {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>',
'<style id="hspl-register-cell-paint-lock">',
'/* APEX/UT gives report cells a background/color transition. During an IR',
'   refresh the replacement rows therefore fade from the native palette into',
'   the application palette. Keep every existing colour and hover selector,',
'   but make their application atomic. */',
'body:not(.t-PageBody--login) .a-IRR-table th,',
'body:not(.t-PageBody--login) .a-IRR-table td,',
'body:not(.t-PageBody--login) .a-IRR-table .a-IRR-headerLink,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-tbody td {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>'))
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
'  var bireporturl = $(''#P651_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/OnDutyRequestRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P651_FROMDATE'').val());',
'  var toDate = new Date($(''#P651_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P651_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P651_COMPANY'').val() ==="" || $(''#P651_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P651_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P651_COMPANY'').val();',
'       global_companycode= $(''#P651_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +       ',
'      ''&P_FROMDATE='' +$(''#P651_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P651_TODATE'').val() + ',
'      ''&P_LOCATION='' + $(''#P651_LOCATION'').val() + ',
'      ''&P_DOCTYPE='' +$(''#P651_DOCTYPE'').val()  +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode',
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
'  var bireporturl = $(''#P651_BIREPORTURL'').val()',
'  var reportName =  ''OnDutyRequestRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P651_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P651_COMPANY'').val() ==="" || $(''#P651_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P651_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P651_COMPANY'').val();',
'       global_companycode= $(''#P651_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P651_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' +',
'      ''"_paramsP_FROMDATE":"'' +$(''#P651_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P651_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P651_LOCATION'').val() + ''",'' + ',
'	  ''"_paramsP_DOCTYPE":"'' +$(''#P651_DOCTYPE'').val() + ''",'' +',
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
'.t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 1.00rem !important; ',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(567115149601889224)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(465018788150855294)
,p_plug_name=>'On Duty Request List'
,p_static_id=>'on-duty-request-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.TNO,',
'       a.COMPANYCODE,',
'       a.FINANCIALYEARCODE,',
'       getlocationname(a.LOCATIONCODE) as locationname,',
'       getdoctypename(a.DOCTYPECODE) as doctypename,',
'       a.TOURREQUESTNO,',
'       a.TOURREQUESTDATE,',
'       getemployeename(a.EMPLOYEECODE) as employeename,',
'       a.TRAVELLINGFROMDATE,',
'       a.TRAVELLINGTODATE,',
'       getcityname(a.FROMPLACECODE) as Fromplace,',
'       getcityname(a.VIAPLACECODE) as viaplace,',
'       getcityname(a.TOPLACECODE) as toplace,',
'       a.PURPOSE,',
'       b.TRAVELINGMODENAME,',
'       a.HOTELTYPECODE,',
'       a.ESTIMATEDTOURCOST,',
'       a.TOURADVANCE,',
'       a.REMARK,',
'       a.CREATOR,',
'       a.CREATIONTIME,',
'       c.CONVEYANCESCHEMENO,',
'       a.DISTANCE,',
'       a.TRAVELINGMODECODE,',
'       a.IMPRESTACCOUNTCODE,',
'       getpartyname(a.ACCOUNTCODE) as accountname,',
'       a.MONEYTRANSFERMODECODE,',
'       a.MONEYTRANSFERREFERENCENO,',
'       a.TRANSACTIONTYPECODE,',
'       a.NATUREOFSUPPLYCODE,',
'       a.CONVEYANCETYPECODE,',
'       a.MODULECODE,',
'       a.MODULETNO,',
'      ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||A.Tno||'',''||''OnDutyRequest''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" title="Act'
||'ion"></span</span></a>'' AS Print',
'',
'  from TOURREQUEST a , TRAVELINGMODE b , CONVEYANCESCHEME c',
'  where a.TRAVELLINGMODECODE = b.TRAVELINGMODECODE(+)',
'  and a.CONVEYANCESCHEMETNO = c.tno(+)',
'  and a.TOURREQUESTDATE  between :P651_FROMDATE and :P651_TODATE',
'  and ( :P651_COMPANY IS NULL OR instr('':''||:P651_COMPANY||'':'','':''||a.companyCODE||'':'') > 0 )',
'   and ( :P651_LOCATION IS NULL OR instr('':''||:P651_LOCATION||'':'','':''||a.LOCATIONCODE||'':'') > 0 )',
'and ( :P651_DOCTYPE IS NULL OR instr('':''||:P651_DOCTYPE||'':'','':''||a.DOCTYPECODE||'':'') > 0 )',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'On Duty Request List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(465018883368855294)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:652:&APP_SESSION.::&DEBUG.:RP:P652_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>26034014169157310
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(466576434514079110)
,p_db_column_name=>'ACCOUNTNAME'
,p_display_order=>113
,p_column_identifier=>'AO'
,p_column_label=>'Accountname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465019734931855304)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Companycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(466576540381079111)
,p_db_column_name=>'CONVEYANCESCHEMENO'
,p_display_order=>123
,p_column_identifier=>'AP'
,p_column_label=>'Conveyanceschemeno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465031255027855318)
,p_db_column_name=>'CONVEYANCETYPECODE'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Conveyancetypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465027276598855315)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Creationtime'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465026898138855315)
,p_db_column_name=>'CREATOR'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465028151461855317)
,p_db_column_name=>'DISTANCE'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Distance'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(466575832120079104)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>53
,p_column_identifier=>'AI'
,p_column_label=>'Doctypename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(466575915112079105)
,p_db_column_name=>'EMPLOYEENAME'
,p_display_order=>63
,p_column_identifier=>'AJ'
,p_column_label=>'Employeename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465025760721855315)
,p_db_column_name=>'ESTIMATEDTOURCOST'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Estimatedtourcost'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465020073859855304)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Financialyearcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(466576062970079106)
,p_db_column_name=>'FROMPLACE'
,p_display_order=>73
,p_column_identifier=>'AK'
,p_column_label=>'Fromplace'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465025329232855315)
,p_db_column_name=>'HOTELTYPECODE'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Hoteltypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465028918175855317)
,p_db_column_name=>'IMPRESTACCOUNTCODE'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Imprestaccountcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(466575727358079103)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>43
,p_column_identifier=>'AH'
,p_column_label=>'Locationname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465031571442855319)
,p_db_column_name=>'MODULECODE'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Modulecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465031989588855319)
,p_db_column_name=>'MODULETNO'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Moduletno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465029725030855317)
,p_db_column_name=>'MONEYTRANSFERMODECODE'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Moneytransfermodecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465030121443855317)
,p_db_column_name=>'MONEYTRANSFERREFERENCENO'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Moneytransferreferenceno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465030852554855318)
,p_db_column_name=>'NATUREOFSUPPLYCODE'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Natureofsupplycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(303334360389845540)
,p_db_column_name=>'PRINT'
,p_display_order=>133
,p_column_identifier=>'AQ'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465024524692855314)
,p_db_column_name=>'PURPOSE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Purpose'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465026494099855315)
,p_db_column_name=>'REMARK'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465019353806855299)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(466576180701079108)
,p_db_column_name=>'TOPLACE'
,p_display_order=>93
,p_column_identifier=>'AM'
,p_column_label=>'Toplace'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465026156851855315)
,p_db_column_name=>'TOURADVANCE'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Touradvance'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465021692260855305)
,p_db_column_name=>'TOURREQUESTDATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Tourrequestdate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465021342126855305)
,p_db_column_name=>'TOURREQUESTNO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Tourrequestno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465030397961855317)
,p_db_column_name=>'TRANSACTIONTYPECODE'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Transactiontypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465028511129855317)
,p_db_column_name=>'TRAVELINGMODECODE'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Travelingmodecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(466576308043079109)
,p_db_column_name=>'TRAVELINGMODENAME'
,p_display_order=>103
,p_column_identifier=>'AN'
,p_column_label=>'Travelingmodename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465022515324855314)
,p_db_column_name=>'TRAVELLINGFROMDATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Travellingfromdate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465022958497855314)
,p_db_column_name=>'TRAVELLINGTODATE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Travellingtodate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(466576077061079107)
,p_db_column_name=>'VIAPLACE'
,p_display_order=>83
,p_column_identifier=>'AL'
,p_column_label=>'Viaplace'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(465033292923861996)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'260485'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:DOCTYPENAME:EMPLOYEENAME:ACCOUNTNAME:TRAVELINGMODENAME:FROMPLACE:LOCATIONNAME:TOPLACE:VIAPLACE:TOURREQUESTNO:TOURREQUESTDATE:TRAVELLINGFROMDATE:TRAVELLINGTODATE:PURPOSE:HOTELTYPECODE:ESTIMATEDTOURCOST:TOURADVANCE:REMARK:CREATOR:CREATIONTIME:DIS'
||'TANCE:TRAVELINGMODECODE:IMPRESTACCOUNTCODE:MONEYTRANSFERMODECODE:MONEYTRANSFERREFERENCENO:TRANSACTIONTYPECODE:NATUREOFSUPPLYCODE:CONVEYANCETYPECODE:MODULECODE:MODULETNO:CONVEYANCESCHEMENO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(465032486183855319)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(465018788150855294)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:652:&APP_SESSION.::&DEBUG.:652::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(464733680351016920)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(465018788150855294)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(464953049554753203)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(465018788150855294)
,p_button_name=>'Pdf'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pdf'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(472503323981729541)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(567115149601889224)
,p_button_name=>'Refresh'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(472611515757609542)
,p_name=>'P651_BIREPORTURL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(567115149601889224)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(573023971430209768)
,p_name=>'P651_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(567115149601889224)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''TOURREQUEST''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1'))
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
 p_id=>wwv_flow_imp.id(567117168138889275)
,p_name=>'P651_DOCTYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(567115149601889224)
,p_prompt=>'Doctype'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select doctypename , doctypecode from doctype   ',
'where doctypecode in (select distinct doctypecode from TOURREQUEST)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(572194473433886515)
,p_name=>'P651_FROMDATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(567115149601889224)
,p_item_default=>'select sysdate-7 from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
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
 p_id=>wwv_flow_imp.id(567117062536889274)
,p_name=>'P651_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(567115149601889224)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select locationname , locationcode from location   ',
'where locationcode in (select distinct locationcode from TOURREQUEST)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(465178462112262997)
,p_name=>'P651_TNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(543429971007599060)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(573023804648209767)
,p_name=>'P651_TODATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(567115149601889224)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(464953119849753204)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(464953049554753203)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(464953264333753205)
,p_event_id=>wwv_flow_imp.id(464953119849753204)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp.component_end;
end;
/
