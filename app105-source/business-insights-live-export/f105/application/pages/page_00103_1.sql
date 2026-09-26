prompt --application/pages/page_00103
begin
--   Manifest
--     PAGE: 00103
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
 p_id=>103
,p_name=>'Employee List'
,p_alias=>'EMPLOYEE-LIST1'
,p_step_title=>'Employee List'
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
 p_id=>wwv_flow_imp.id(587224639552375010)
,p_plug_name=>'Employee List'
,p_static_id=>'employee-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.TNO,',
'       A.EMPLOYEECODE,',
'       A.EMPLOYEENAME,',
'       A.EMPLOYEESHORTNAME,',
'       A.DESIGNATIONCODE,',
'       C.DESIGNATIONNAME,',
'       A.DEPARTMENTCODE,',
'       B.DEPARTMENTNAME,',
'       A.EMPLOYEETYPECODE,',
'       A.CONTRACTORCODE,',
'       A.PAYMENTTERM,',
'       A.FATHERNAME,',
'       A.SEX,',
'       A.OTATTENDENCEHEADCODE,',
'       A.MARITALSTATUS,',
'       A.CATEGORYCODE,',
'       A.DATEOFBIRTH,',
'       A.DATEOFAPPOINTMENT,',
'       A.DATEOFJOINING,',
'       A.PUNCHCARDNO,',
'       A.PERMANENTAFTERDAY,',
'       A.PRESENTADDRESS,',
'       A.PRESENTCITYCODE,',
'       A.PRESENTSTATECODE,',
'       A.PRESENTPHONENO,',
'       A.PERMANENTADDRESS,',
'       A.PERMANENTCITYCODE,',
'       A.PERMANENTSTATECODE,',
'       A.PERMANENTPHONENO,',
'       A.OFFDAY,',
'       A.GROSSSALARY,',
'       A.PFDEDUCTIONON,',
'       A.PFACCOUNTNO,',
'       A.NOOFNOMINEE,',
'       A.ESICACCOUNTNO,',
'       A.NOOFDEPENDENCE,',
'       A.HOSPITALCODE,',
'       A.PAYMENTMODE,',
'       A.BANKACCOUNTNO,',
'       A.BANKCODE,',
'       A.SHIFTCODE,',
'       A.EMPLOYEENATURECODE,',
'       A.STAFFTYPECODE,',
'       A.REMARK,',
'       A.DATECREATED,',
'       A.DATEMODIFY,',
'       A.COMPANYCODE,',
'       A.EMPLOYEENATURE,',
'       A.EMPLOYMENTTYPECODE,',
'       A.MONEYTRANSFERMODECODE,',
'       A.NOOFDEPENDENTS,',
'       A.SALARYSCHEMECODE,',
'       A.STAFFTYPE,',
'       A.EMPLOYEEACCOUNTCODE,',
'       A.GENDER,',
'       A.LOANACCOUNTCODE,',
'       A.SALARYACCOUNTCODE,',
'       A.CREATOR,',
'       A.LOCATIONCODE,',
'       A.EMPLOYEEID,',
'       A.DATEOFRETIREMENT,',
'       A.DATEOFCONFIRMATION,',
'       A.PRODUCTIONCENTRECODE,',
'       A.REPORTTOEMPLOYEECODE,',
'       A.INCENTIVESCHEMECODE,',
'       A.VEHICLENO,',
'       --A.DESIGNATIONNAME,',
'       --A.DEPARTMENTNAME,',
'       to_char(A.CREATIONTIME,''DD-MM-YYYY HH24:MI:SS'')CREATIONTIME,',
'       A.PRESENTPOLICESTATION,',
'       A.PERMANENTPOLICESTATION,',
'       A.BLOODGROUP,',
'       A.PANNO,',
'       A.DRIVINGLICENSENO,',
'       A.DRIVINGLICENSEEXPIRYDATE,',
'       A.OFFICEMOBILENO,',
'       A.OFFICEEMAILID,',
'       A.PLACEOFBIRTH,',
'       A.DATEOFRESIGNATION,',
'       A.SITECODE,',
'       A.SITENAME,',
'       A.BRANCHCODE,',
'       A.PERIODOFPREVIOUSSERVICEINMONTH,',
'       A.BONUSPERCENT,',
'       A.PRESENTPINCODE,',
'       A.ATTACHEDVEHICLENO,',
'       A.VEHICLEDESIGNATIONCODE,',
'       A.ESICESTABLISHMENTCODENO,',
'       A.INCENTIVESTARTDATE,',
'       A.UAN,',
'       A.ZONECODE,',
'       A.PERSONALEMAILID,',
'       A.PRESENTDISTRICTCODE,',
'       A.PERMANENTDISTRICTCODE,',
'       A.IFSCCODE,',
'       A.BANKBRANCHNAME,',
'       A.APPOINTMENTLETTERISSUEDATE,',
'       A.APPOINTMENTLETTERISSUENO,',
'       A.HUSBANDNAME,',
'       A.ADHARNO,',
'       A.OVERTIMESCHEMECODE,',
'       A.CATEGORY,',
'       A.MINORITY,',
'       A.OLDEMPLOYEECODE,',
'       A.EMPLOYEEIDTEMP',
'  from EMPLOYEE A , DEPARTMENT B , DESIGNATION C',
'  WHERE A.DEPARTMENTCODE = B.DEPARTMENTCODE(+)',
'  AND A.DESIGNATIONCODE = C.DESIGNATIONCODE(+)',
'  Order By A.TNO Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Employee List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(587224656497375010)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:104:&APP_SESSION.::&DEBUG.:RP:P104_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>146838311246448486
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587263911938375037)
,p_db_column_name=>'ADHARNO'
,p_display_order=>98
,p_column_identifier=>'CT'
,p_column_label=>'Adharno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587262682939375037)
,p_db_column_name=>'APPOINTMENTLETTERISSUEDATE'
,p_display_order=>95
,p_column_identifier=>'CQ'
,p_column_label=>'Appointmentletterissuedate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587263103957375037)
,p_db_column_name=>'APPOINTMENTLETTERISSUENO'
,p_display_order=>96
,p_column_identifier=>'CR'
,p_column_label=>'Appointmentletterissueno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587258300660375035)
,p_db_column_name=>'ATTACHEDVEHICLENO'
,p_display_order=>84
,p_column_identifier=>'CF'
,p_column_label=>'Attachedvehicleno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587239488942375021)
,p_db_column_name=>'BANKACCOUNTNO'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Bankaccountno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587262252636375037)
,p_db_column_name=>'BANKBRANCHNAME'
,p_display_order=>94
,p_column_identifier=>'CP'
,p_column_label=>'Bankbranchname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587239873136375021)
,p_db_column_name=>'BANKCODE'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Bankcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587252725197375034)
,p_db_column_name=>'BLOODGROUP'
,p_display_order=>70
,p_column_identifier=>'BR'
,p_column_label=>'Bloodgroup'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587257531728375035)
,p_db_column_name=>'BONUSPERCENT'
,p_display_order=>82
,p_column_identifier=>'CD'
,p_column_label=>'Bonuspercent'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587256691820375035)
,p_db_column_name=>'BRANCHCODE'
,p_display_order=>80
,p_column_identifier=>'CB'
,p_column_label=>'Branchcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587264708171375037)
,p_db_column_name=>'CATEGORY'
,p_display_order=>100
,p_column_identifier=>'CV'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587230273535375017)
,p_db_column_name=>'CATEGORYCODE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Category Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587242728474375022)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Companycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587227879878375016)
,p_db_column_name=>'CONTRACTORCODE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Contractor Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585544568612617360)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>113
,p_column_identifier=>'CZ'
,p_column_label=>'Creation Time'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587247079087375032)
,p_db_column_name=>'CREATOR'
,p_display_order=>56
,p_column_identifier=>'BD'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587241941412375021)
,p_db_column_name=>'DATECREATED'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Datecreated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587242310815375022)
,p_db_column_name=>'DATEMODIFY'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Datemodify'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587231077429375018)
,p_db_column_name=>'DATEOFAPPOINTMENT'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Date Of Appointment'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587230727300375017)
,p_db_column_name=>'DATEOFBIRTH'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Date Of Birth'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587248735765375032)
,p_db_column_name=>'DATEOFCONFIRMATION'
,p_display_order=>60
,p_column_identifier=>'BH'
,p_column_label=>'Dateofconfirmation'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587231542382375018)
,p_db_column_name=>'DATEOFJOINING'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Date Of Joining'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587255472745375034)
,p_db_column_name=>'DATEOFRESIGNATION'
,p_display_order=>77
,p_column_identifier=>'BY'
,p_column_label=>'Dateofresignation'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587248259534375032)
,p_db_column_name=>'DATEOFRETIREMENT'
,p_display_order=>59
,p_column_identifier=>'BG'
,p_column_label=>'Dateofretirement'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587227055660375016)
,p_db_column_name=>'DEPARTMENTCODE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Department Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587251058952375033)
,p_db_column_name=>'DEPARTMENTNAME'
,p_display_order=>66
,p_column_identifier=>'BN'
,p_column_label=>'Department Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587226731976375016)
,p_db_column_name=>'DESIGNATIONCODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Designation Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587250666670375033)
,p_db_column_name=>'DESIGNATIONNAME'
,p_display_order=>65
,p_column_identifier=>'BM'
,p_column_label=>'Designation Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587253887884375034)
,p_db_column_name=>'DRIVINGLICENSEEXPIRYDATE'
,p_display_order=>73
,p_column_identifier=>'BU'
,p_column_label=>'Drivinglicenseexpirydate'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587253519281375034)
,p_db_column_name=>'DRIVINGLICENSENO'
,p_display_order=>72
,p_column_identifier=>'BT'
,p_column_label=>'Drivinglicenseno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587245515020375028)
,p_db_column_name=>'EMPLOYEEACCOUNTCODE'
,p_display_order=>52
,p_column_identifier=>'AZ'
,p_column_label=>'Employeeaccountcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587225527126375013)
,p_db_column_name=>'EMPLOYEECODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Employee Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587247853972375032)
,p_db_column_name=>'EMPLOYEEID'
,p_display_order=>58
,p_column_identifier=>'BF'
,p_column_label=>'Employeeid'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587265849129375038)
,p_db_column_name=>'EMPLOYEEIDTEMP'
,p_display_order=>103
,p_column_identifier=>'CY'
,p_column_label=>'Employeeidtemp'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587225936789375016)
,p_db_column_name=>'EMPLOYEENAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Employee Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587243103178375023)
,p_db_column_name=>'EMPLOYEENATURE'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Employeenature'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587240741831375021)
,p_db_column_name=>'EMPLOYEENATURECODE'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Employeenaturecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587226278522375016)
,p_db_column_name=>'EMPLOYEESHORTNAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Employee Short Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587227476535375016)
,p_db_column_name=>'EMPLOYEETYPECODE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Employee Type Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587243544294375023)
,p_db_column_name=>'EMPLOYMENTTYPECODE'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Employmenttypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587237917726375020)
,p_db_column_name=>'ESICACCOUNTNO'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Esicaccountno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587259097035375036)
,p_db_column_name=>'ESICESTABLISHMENTCODENO'
,p_display_order=>86
,p_column_identifier=>'CH'
,p_column_label=>'Esicestablishmentcodeno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587228665591375017)
,p_db_column_name=>'FATHERNAME'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Father Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587245852361375029)
,p_db_column_name=>'GENDER'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587236299589375020)
,p_db_column_name=>'GROSSSALARY'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Gross Salary'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587238674746375020)
,p_db_column_name=>'HOSPITALCODE'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Hospitalcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587263524475375037)
,p_db_column_name=>'HUSBANDNAME'
,p_display_order=>97
,p_column_identifier=>'CS'
,p_column_label=>'Husbandname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587261916188375036)
,p_db_column_name=>'IFSCCODE'
,p_display_order=>93
,p_column_identifier=>'CO'
,p_column_label=>'Ifsccode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587249910894375033)
,p_db_column_name=>'INCENTIVESCHEMECODE'
,p_display_order=>63
,p_column_identifier=>'BK'
,p_column_label=>'Incentiveschemecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587259487778375036)
,p_db_column_name=>'INCENTIVESTARTDATE'
,p_display_order=>87
,p_column_identifier=>'CI'
,p_column_label=>'Incentivestartdate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587246287914375029)
,p_db_column_name=>'LOANACCOUNTCODE'
,p_display_order=>54
,p_column_identifier=>'BB'
,p_column_label=>'Loanaccountcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587247463912375032)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>57
,p_column_identifier=>'BE'
,p_column_label=>'Locationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587229891889375017)
,p_db_column_name=>'MARITALSTATUS'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Marital Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587265069709375038)
,p_db_column_name=>'MINORITY'
,p_display_order=>101
,p_column_identifier=>'CW'
,p_column_label=>'Minority'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587243860902375024)
,p_db_column_name=>'MONEYTRANSFERMODECODE'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Moneytransfermodecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587238290835375020)
,p_db_column_name=>'NOOFDEPENDENCE'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Noofdependence'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587244266157375024)
,p_db_column_name=>'NOOFDEPENDENTS'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Noofdependents'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587237531290375020)
,p_db_column_name=>'NOOFNOMINEE'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Noofnominee'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587235932212375019)
,p_db_column_name=>'OFFDAY'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Offday'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587254686062375034)
,p_db_column_name=>'OFFICEEMAILID'
,p_display_order=>75
,p_column_identifier=>'BW'
,p_column_label=>'Officeemailid'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587254291235375034)
,p_db_column_name=>'OFFICEMOBILENO'
,p_display_order=>74
,p_column_identifier=>'BV'
,p_column_label=>'Officemobileno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587265469594375038)
,p_db_column_name=>'OLDEMPLOYEECODE'
,p_display_order=>102
,p_column_identifier=>'CX'
,p_column_label=>'Oldemployeecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587229522641375017)
,p_db_column_name=>'OTATTENDENCEHEADCODE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'OT Attendence Head Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587264323603375037)
,p_db_column_name=>'OVERTIMESCHEMECODE'
,p_display_order=>99
,p_column_identifier=>'CU'
,p_column_label=>'Overtimeschemecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587253089585375034)
,p_db_column_name=>'PANNO'
,p_display_order=>71
,p_column_identifier=>'BS'
,p_column_label=>'Panno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587239070808375020)
,p_db_column_name=>'PAYMENTMODE'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Paymentmode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587228289401375017)
,p_db_column_name=>'PAYMENTTERM'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Payment Term'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587257057178375035)
,p_db_column_name=>'PERIODOFPREVIOUSSERVICEINMONTH'
,p_display_order=>81
,p_column_identifier=>'CC'
,p_column_label=>'Periodofpreviousserviceinmonth'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587234314751375019)
,p_db_column_name=>'PERMANENTADDRESS'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Permanent Address'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587232304332375018)
,p_db_column_name=>'PERMANENTAFTERDAY'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Permanent After Day'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587234677282375019)
,p_db_column_name=>'PERMANENTCITYCODE'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Permanent City Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587261457911375036)
,p_db_column_name=>'PERMANENTDISTRICTCODE'
,p_display_order=>92
,p_column_identifier=>'CN'
,p_column_label=>'Permanentdistrictcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587235544078375019)
,p_db_column_name=>'PERMANENTPHONENO'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Permanent Phone No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587252303380375033)
,p_db_column_name=>'PERMANENTPOLICESTATION'
,p_display_order=>69
,p_column_identifier=>'BQ'
,p_column_label=>'Permanentpolicestation'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587235104300375019)
,p_db_column_name=>'PERMANENTSTATECODE'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Permanent State Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587260667976375036)
,p_db_column_name=>'PERSONALEMAILID'
,p_display_order=>90
,p_column_identifier=>'CL'
,p_column_label=>'Personalemailid'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587237060712375020)
,p_db_column_name=>'PFACCOUNTNO'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Pf Account No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587236735940375020)
,p_db_column_name=>'PFDEDUCTIONON'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Pf Deduction On'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587255110439375034)
,p_db_column_name=>'PLACEOFBIRTH'
,p_display_order=>76
,p_column_identifier=>'BX'
,p_column_label=>'Placeofbirth'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587232694149375019)
,p_db_column_name=>'PRESENTADDRESS'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Present Address'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587233105565375019)
,p_db_column_name=>'PRESENTCITYCODE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Present City Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587261105579375036)
,p_db_column_name=>'PRESENTDISTRICTCODE'
,p_display_order=>91
,p_column_identifier=>'CM'
,p_column_label=>'Presentdistrictcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587233936287375019)
,p_db_column_name=>'PRESENTPHONENO'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Present Phone No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587257884744375035)
,p_db_column_name=>'PRESENTPINCODE'
,p_display_order=>83
,p_column_identifier=>'CE'
,p_column_label=>'Presentpincode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587251893510375033)
,p_db_column_name=>'PRESENTPOLICESTATION'
,p_display_order=>68
,p_column_identifier=>'BP'
,p_column_label=>'Presentpolicestation'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587233473640375019)
,p_db_column_name=>'PRESENTSTATECODE'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Present State Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587249048155375032)
,p_db_column_name=>'PRODUCTIONCENTRECODE'
,p_display_order=>61
,p_column_identifier=>'BI'
,p_column_label=>'Productioncentrecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587231916619375018)
,p_db_column_name=>'PUNCHCARDNO'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Punch Card No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587241535188375021)
,p_db_column_name=>'REMARK'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587249507766375033)
,p_db_column_name=>'REPORTTOEMPLOYEECODE'
,p_display_order=>62
,p_column_identifier=>'BJ'
,p_column_label=>'Reporttoemployeecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587246690970375029)
,p_db_column_name=>'SALARYACCOUNTCODE'
,p_display_order=>55
,p_column_identifier=>'BC'
,p_column_label=>'Salaryaccountcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587244716803375024)
,p_db_column_name=>'SALARYSCHEMECODE'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Salaryschemecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587229102352375017)
,p_db_column_name=>'SEX'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Sex'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587240253278375021)
,p_db_column_name=>'SHIFTCODE'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Shiftcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587255849719375035)
,p_db_column_name=>'SITECODE'
,p_display_order=>78
,p_column_identifier=>'BZ'
,p_column_label=>'Sitecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587256318851375035)
,p_db_column_name=>'SITENAME'
,p_display_order=>79
,p_column_identifier=>'CA'
,p_column_label=>'Sitename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587245079840375024)
,p_db_column_name=>'STAFFTYPE'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Stafftype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587241114117375021)
,p_db_column_name=>'STAFFTYPECODE'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Stafftypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587225144836375011)
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
 p_id=>wwv_flow_imp.id(587259871810375036)
,p_db_column_name=>'UAN'
,p_display_order=>88
,p_column_identifier=>'CJ'
,p_column_label=>'Uan'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587258705692375035)
,p_db_column_name=>'VEHICLEDESIGNATIONCODE'
,p_display_order=>85
,p_column_identifier=>'CG'
,p_column_label=>'Vehicledesignationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587250307164375033)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>64
,p_column_identifier=>'BL'
,p_column_label=>'Vehicleno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(587260301205375036)
,p_db_column_name=>'ZONECODE'
,p_display_order=>89
,p_column_identifier=>'CK'
,p_column_label=>'Zonecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(587298877687433170)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1469126'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EMPLOYEECODE:EMPLOYEENAME:EMPLOYEESHORTNAME:FATHERNAME:DESIGNATIONNAME:DEPARTMENTNAME:DATEOFJOINING:REMARK:CREATOR:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(587266353882375038)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(587224639552375010)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:104:&APP_SESSION.::&DEBUG.:104::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(587286797442390856)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(587224639552375010)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(585544676141617361)
,p_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(587266353882375038)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(585544750538617362)
,p_event_id=>wwv_flow_imp.id(585544676141617361)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(587224639552375010)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(587266684431375038)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(587224639552375010)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587267158325375039)
,p_event_id=>wwv_flow_imp.id(587266684431375038)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(587224639552375010)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(473348444799499820)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(473348547723499821)
,p_event_id=>wwv_flow_imp.id(473348444799499820)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(473348609968499822)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(473348758024499823)
,p_event_id=>wwv_flow_imp.id(473348609968499822)
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
