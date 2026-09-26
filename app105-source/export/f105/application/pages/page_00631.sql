prompt --application/pages/page_00631
begin
--   Manifest
--     PAGE: 00631
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
 p_id=>631
,p_name=>'ATTENDENCE'
,p_alias=>'ATTENDENCE'
,p_step_title=>'Attendance List'
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
'  var bireporturl = $(''#P631_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/AttendenceRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P631_FROMDATE'').val());',
'  var fromDate = new Date($(''#P631_TODATE'').val());',
'   var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P631_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P631_COMPANY'').val() ==="" || $(''#P631_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P631_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P631_COMPANY'').val();',
'       global_companycode= $(''#P631_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +     ',
'      ''&P_FROMDATE='' +$(''#P631_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P631_TODATE'').val() +',
'      ''&P_LOCATION='' + $(''#P631_LOCATION'').val() + ',
'      ''&P_DOCTYPE='' +$(''#P631_DOCTYPE'').val()  +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode ',
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
'  var bireporturl = $(''#P631_BIREPORTURL'').val()',
'  var reportName =  ''AttendenceRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P631_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P631_COMPANY'').val() ==="" || $(''#P631_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P631_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P631_COMPANY'').val();',
'       global_companycode= $(''#P631_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P631_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P631_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P631_TODATE'').val() + ''",'' +  ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P631_LOCATION'').val() + ''",'' + ',
'	  ''"_paramsP_DOCTYPE":"'' + $(''#P631_DOCTYPE'').val() + ''",'' + ',
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
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#mycss/MyIR (2)#MIN#.css',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 0.90rem !important; ',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(456456000515433504)
,p_plug_name=>'ATTENDENCE'
,p_static_id=>'attendence'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Select',
' -- ROWNUM,',
'  x.*,Y.*,',
'          ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||a.TNO||'',''||''AssetOpening''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" title="'
||'Action"></span</span></a>'' AS Print',
'',
'  From',
'(select * from (Select ',
'      l.LocationName,',
'      b.EmployeeCode,',
'      e.EmployeeName,',
'      e.EmployeeID,',
'      dp.DepartmentName,',
'      --getworkcentername(e.workcentrecode) as WorkCenterName,',
'      dg.DesignationName,',
'      to_number(To_char(a.attendenceDate,''DD''),''99'') day,',
'      --b.AttendenceHeadCode,',
'      AH.attendenceheadshortname,',
'      null as totalpr,',
'      st.StaffTypeName',
'From Attendence a, AttendenceDetail b, Employee e, Location l, Department dp, Designation dg, ATTENDENCEHEAD AH, StaffType st',
'Where a.TNo = b.TNo(+)',
'  and b.EmployeeCode = e.EmployeeCode(+)',
'  and a.LocationCode = l.LocationCode(+)',
'  and e.DepartmentCode = dp.DepartmentCode(+)',
'  and e.DesignationCode = dg.DesignationCode(+)',
'  AND B.ATTENDENCEHEADCODE = AH.ATTENDENCEHEADCODE(+)',
'  and e.StaffTypeCode = st.StaffTypeCode(+)',
'  --and b.EmployeeCode not in (''AS'',''VAS'')',
' -- and ( :P631_DEPARTMENT IS NULL OR instr('':''||:P631_DEPARTMENT||'':'','':''||getemployeedepartmentcode(b.EmployeeCode,A.attendenceDate)||'':'') > 0 )',
'  --and ( :P631_WORKCENTER IS NULL OR instr('':''||:P631_WORKCENTER||'':'','':''||e.workcentrecode||'':'') > 0 )',
'  --and ( :P631_DESIGNATION IS NULL OR instr('':''||:P631_DESIGNATION||'':'','':''||getemployeedesignationcode(b.EmployeeCode,A.attendenceDate)||'':'') > 0 )',
'  --and ( :P631_STAFFTYPE IS NULL OR instr('':''||:P631_STAFFTYPE||'':'','':''||e.StaffTypeCode||'':'') > 0 )',
'  and instr('':''||:P631_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'  and (:P631_LOCATION IS NULL OR instr('':''||:P631_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'  and to_char(a.ATTENDENCEDATE,''MON-YYYY'')  = :P631_FROMDATE',
'   )',
'  pivot (',
'   max(AttendenceHeadShortName) as day for day in (1 ,2 ,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31)',
'  )',
') x,',
'',
'( SELECT * FROM ( select ',
'  EMPLOYEECODE empcode,',
'  --BB.ATTENDENCEHEADCODE --,',
'  ah.AttendenceHeadShortName,',
'  bb.attendencevalue',
'  from  atteNdence aa, attendencedetail bb, Attendencehead ah',
'  where aa.tno = bb.tno(+)',
'    --and aa.LocationCode = nvl(:P631_location,aa.locationcode)',
'   and instr('':''||:P631_COMPANY||'':'','':''||aa.CompanyCode||'':'') > 0',
'   and (:P631_LOCATION IS NULL OR instr('':''||:P631_LOCATION||'':'','':''||aa.LocationCode||'':'') > 0)',
'   and bb.AttendenceHeadCode = ah.AttendenceHeadCode(+)',
'   and to_char(aa.ATTENDENCEDATE,''MON-YYYY'')  = :P631_FROMDATE ',
'',
')',
'PIVOT',
' (',
'  sum(attendencevalue) AS TOTAL FOR AttendenceHeadShortName IN (''P'',''A'',''OFF'',''OD'',''OH'',''L'',''C'')',
' )',
' ',
') y',
'',
'where x.employeecode = y.empcode(+)',
'*/',
'',
'--old query',
'select ',
'       a.TNO,',
'       a.COMPANYCODE,',
'       getlocationname(a.LOCATIONCODE) locationname,',
'       getdoctypename(a.DOCTYPECODE) doctypename,',
'       a.FINANCIALYEARCODE,',
'       a.ATTENDENCENO,',
'       a.ATTENDENCEDATE,',
'       getshiftname(a.SHIFTCODE) shiftname,',
'       a.DepartmentCode,',
'       getdepartmentname(DEPARTMENTCODE) departmentname,',
'       a.REMARK,',
'       a.CREATOR,',
'       a.ATTENDENCEVALUE,',
'       a.CATEGORYCODE,',
'       a.STAFFTYPECODE,',
'       a.BRANCHCODE,',
'       a.CREATIONTIME,',
'       a.MODULECODE,',
'       a.MODULETNO,',
'       getemployeename(b.EMPLOYEECODE) employeename , ',
'       GetATTENDENCEHEADCODE(b.ATTENDENCEHEADCODE) attendence ,',
'       b.INTIME, ',
'       b.OUTTIME,',
'                ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||a.TNO||'',''||''Attendence''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" tit'
||'le="Action"></span</span></a>'' AS Print',
'',
'  from ATTENDENCE a , ATTENDENCEdetail b',
'  where ATTENDENCEDATE  between :P631_FROMDATE and :P631_TODATE',
'  and   ( :P631_COMPANY IS NULL OR instr('':''||:P631_COMPANY||'':'','':''||companycode||'':'') > 0 )',
'  --and   instr('':''||:P631_COMPANY||'':'','':''||companycode||'':'') > 0',
'  and   ( :P631_LOCATION IS NULL OR instr('':''||:P631_LOCATION||'':'','':''||LOCATIONCODE||'':'') > 0 )',
'  and   ( :P631_DOCTYPE IS NULL OR instr('':''||:P631_DOCTYPE||'':'','':''||DOCTYPECODE||'':'') > 0 ) ',
'  and a.tno = b.tno '))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'ATTENDENCE'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(456456168353433504)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:632:&SESSION.::&DEBUG.:632:P632_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>17471299153735520
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488498292362252919)
,p_db_column_name=>'ATTENDENCE'
,p_display_order=>268
,p_column_identifier=>'CL'
,p_column_label=>'Attendence'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488851588300832891)
,p_db_column_name=>'ATTENDENCEDATE'
,p_display_order=>138
,p_column_identifier=>'BY'
,p_column_label=>'Attendencedate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488851532802832890)
,p_db_column_name=>'ATTENDENCENO'
,p_display_order=>128
,p_column_identifier=>'BX'
,p_column_label=>'Attendenceno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488852166642832896)
,p_db_column_name=>'ATTENDENCEVALUE'
,p_display_order=>188
,p_column_identifier=>'CD'
,p_column_label=>'Attendencevalue'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488852440010832899)
,p_db_column_name=>'BRANCHCODE'
,p_display_order=>218
,p_column_identifier=>'CG'
,p_column_label=>'Branchcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488852238272832897)
,p_db_column_name=>'CATEGORYCODE'
,p_display_order=>198
,p_column_identifier=>'CE'
,p_column_label=>'Categorycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488851224589832887)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>98
,p_column_identifier=>'BU'
,p_column_label=>'Companycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488852558243832900)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>228
,p_column_identifier=>'CH'
,p_column_label=>'Creationtime'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488852018113832895)
,p_db_column_name=>'CREATOR'
,p_display_order=>178
,p_column_identifier=>'CC'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488851801100832893)
,p_db_column_name=>'DEPARTMENTCODE'
,p_display_order=>158
,p_column_identifier=>'CA'
,p_column_label=>'Departmentcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(485565948706502625)
,p_db_column_name=>'DEPARTMENTNAME'
,p_display_order=>68
,p_column_identifier=>'W'
,p_column_label=>'Departmentname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488851367330832888)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>108
,p_column_identifier=>'BV'
,p_column_label=>'Doctypename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488498635633252922)
,p_db_column_name=>'EMPLOYEENAME'
,p_display_order=>298
,p_column_identifier=>'CO'
,p_column_label=>'Employeename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488851444607832889)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>118
,p_column_identifier=>'BW'
,p_column_label=>'Financialyearcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488498376726252920)
,p_db_column_name=>'INTIME'
,p_display_order=>278
,p_column_identifier=>'CM'
,p_column_label=>'Intime'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(485565606457502622)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>38
,p_column_identifier=>'T'
,p_column_label=>'Locationname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488852625839832901)
,p_db_column_name=>'MODULECODE'
,p_display_order=>238
,p_column_identifier=>'CI'
,p_column_label=>'Modulecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488852696782832902)
,p_db_column_name=>'MODULETNO'
,p_display_order=>248
,p_column_identifier=>'CJ'
,p_column_label=>'Moduletno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488498478782252921)
,p_db_column_name=>'OUTTIME'
,p_display_order=>288
,p_column_identifier=>'CN'
,p_column_label=>'Outtime'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(291364494287173248)
,p_db_column_name=>'PRINT'
,p_display_order=>308
,p_column_identifier=>'CP'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488851935598832894)
,p_db_column_name=>'REMARK'
,p_display_order=>168
,p_column_identifier=>'CB'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488851696058832892)
,p_db_column_name=>'SHIFTNAME'
,p_display_order=>148
,p_column_identifier=>'BZ'
,p_column_label=>'Shiftname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488852362182832898)
,p_db_column_name=>'STAFFTYPECODE'
,p_display_order=>208
,p_column_identifier=>'CF'
,p_column_label=>'Stafftypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488851070253832886)
,p_db_column_name=>'TNO'
,p_display_order=>88
,p_column_identifier=>'BT'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(456463867173437239)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'174790'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:LOCATIONNAME:DEPARTMENTNAME:ATTENDENCENO:ATTENDENCEDATE:ATTENDENCEVALUE:DEPARTMENTCODE:SHIFTNAME:ATTENDENCE:EMPLOYEENAME:INTIME:OUTTIME'
,p_sort_column_1=>'ATTENDENCEDATE'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(615626968431745520)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(457093559096425059)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(456456000515433504)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:632:&SESSION.::&DEBUG.:632::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(457093171972423987)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(456456000515433504)
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
 p_id=>wwv_flow_imp.id(464955450132753227)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(456456000515433504)
,p_button_name=>'Pdf'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pdf'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(480014163747814033)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(615626968431745520)
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
 p_id=>wwv_flow_imp.id(554912991472049879)
,p_name=>'P631_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(615626968431745520)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(621536380173066131)
,p_name=>'P631_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(615626968431745520)
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
'Where a.ModuleCode = ''TOURREQUESTONSPECIALAPPROVAL''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1'))
,p_cSize=>30
,p_grid_label_column_span=>1
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
 p_id=>wwv_flow_imp.id(615629576881745638)
,p_name=>'P631_DOCTYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(615626968431745520)
,p_prompt=>'Doctype'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select doctypename , doctypecode from doctype   ',
'where doctypecode in (select distinct doctypecode from TOURREQUESTONSPECIALAPPROVAL)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(489272474411308501)
,p_name=>'P631_FORMONTH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(615626968431745520)
,p_prompt=>'For month'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'FORMONTH'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'FROMDATE:P631_FROMDATE,TODATE:P631_TODATE',
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(620706882176742878)
,p_name=>'P631_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(615626968431745520)
,p_item_default=>'select sysdate-7 from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_grid_label_column_span=>1
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
 p_id=>wwv_flow_imp.id(615629471279745637)
,p_name=>'P631_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(615626968431745520)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select locationname , locationcode from location   ',
'where locationcode in (select distinct locationcode from TOURREQUESTONSPECIALAPPROVAL)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_grid_label_column_span=>1
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
 p_id=>wwv_flow_imp.id(457444090420510732)
,p_name=>'P631_TNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(543429971007599060)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(621536213391066130)
,p_name=>'P631_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(615626968431745520)
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
 p_id=>wwv_flow_imp.id(464955563645753228)
,p_name=>'GeneratePDF'
,p_static_id=>'generatepdf'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(464955450132753227)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(464955619233753229)
,p_event_id=>wwv_flow_imp.id(464955563645753228)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(473346697847499803)
,p_name=>'Hide Nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(473346812801499804)
,p_event_id=>wwv_flow_imp.id(473346697847499803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(473346916596499805)
,p_name=>'Pagination'
,p_static_id=>'pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(473347038935499806)
,p_event_id=>wwv_flow_imp.id(473346916596499805)
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
