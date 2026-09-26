prompt --application/pages/page_00103
begin
--   Manifest
--     PAGE: 00103
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>103
,p_name=>'Employee List'
,p_alias=>'EMPLOYEE-LIST1'
,p_step_title=>'Employee List'
,p_autocomplete_on_off=>'OFF'
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
 p_id=>wwv_flow_imp.id(596704843383841374)
,p_plug_name=>'Employee List'
,p_static_id=>'employee-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
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
 p_id=>wwv_flow_imp.id(596704860328841374)
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
 p_id=>wwv_flow_imp.id(596744115769841401)
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
 p_id=>wwv_flow_imp.id(596742886770841401)
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
 p_id=>wwv_flow_imp.id(596743307788841401)
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
 p_id=>wwv_flow_imp.id(596738504491841399)
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
 p_id=>wwv_flow_imp.id(596719692773841385)
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
 p_id=>wwv_flow_imp.id(596742456467841401)
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
 p_id=>wwv_flow_imp.id(596720076967841385)
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
 p_id=>wwv_flow_imp.id(596732929028841398)
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
 p_id=>wwv_flow_imp.id(596737735559841399)
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
 p_id=>wwv_flow_imp.id(596736895651841399)
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
 p_id=>wwv_flow_imp.id(596744912002841401)
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
 p_id=>wwv_flow_imp.id(596710477366841381)
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
 p_id=>wwv_flow_imp.id(596722932305841386)
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
 p_id=>wwv_flow_imp.id(596708083709841380)
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
 p_id=>wwv_flow_imp.id(595024772444083724)
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
 p_id=>wwv_flow_imp.id(596727282918841396)
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
 p_id=>wwv_flow_imp.id(596722145243841385)
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
 p_id=>wwv_flow_imp.id(596722514646841386)
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
 p_id=>wwv_flow_imp.id(596711281260841382)
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
 p_id=>wwv_flow_imp.id(596710931131841381)
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
 p_id=>wwv_flow_imp.id(596728939596841396)
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
 p_id=>wwv_flow_imp.id(596711746213841382)
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
 p_id=>wwv_flow_imp.id(596735676576841398)
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
 p_id=>wwv_flow_imp.id(596728463365841396)
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
 p_id=>wwv_flow_imp.id(596707259491841380)
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
 p_id=>wwv_flow_imp.id(596731262783841397)
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
 p_id=>wwv_flow_imp.id(596706935807841380)
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
 p_id=>wwv_flow_imp.id(596730870501841397)
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
 p_id=>wwv_flow_imp.id(596734091715841398)
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
 p_id=>wwv_flow_imp.id(596733723112841398)
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
 p_id=>wwv_flow_imp.id(596725718851841392)
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
 p_id=>wwv_flow_imp.id(596705730957841377)
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
 p_id=>wwv_flow_imp.id(596728057803841396)
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
 p_id=>wwv_flow_imp.id(596746052960841402)
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
 p_id=>wwv_flow_imp.id(596706140620841380)
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
 p_id=>wwv_flow_imp.id(596723307009841387)
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
 p_id=>wwv_flow_imp.id(596720945662841385)
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
 p_id=>wwv_flow_imp.id(596706482353841380)
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
 p_id=>wwv_flow_imp.id(596707680366841380)
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
 p_id=>wwv_flow_imp.id(596723748125841387)
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
 p_id=>wwv_flow_imp.id(596718121557841384)
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
 p_id=>wwv_flow_imp.id(596739300866841400)
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
 p_id=>wwv_flow_imp.id(596708869422841381)
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
 p_id=>wwv_flow_imp.id(596726056192841393)
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
 p_id=>wwv_flow_imp.id(596716503420841384)
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
 p_id=>wwv_flow_imp.id(596718878577841384)
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
 p_id=>wwv_flow_imp.id(596743728306841401)
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
 p_id=>wwv_flow_imp.id(596742120019841400)
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
 p_id=>wwv_flow_imp.id(596730114725841397)
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
 p_id=>wwv_flow_imp.id(596739691609841400)
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
 p_id=>wwv_flow_imp.id(596726491745841393)
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
 p_id=>wwv_flow_imp.id(596727667743841396)
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
 p_id=>wwv_flow_imp.id(596710095720841381)
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
 p_id=>wwv_flow_imp.id(596745273540841402)
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
 p_id=>wwv_flow_imp.id(596724064733841388)
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
 p_id=>wwv_flow_imp.id(596718494666841384)
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
 p_id=>wwv_flow_imp.id(596724469988841388)
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
 p_id=>wwv_flow_imp.id(596717735121841384)
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
 p_id=>wwv_flow_imp.id(596716136043841383)
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
 p_id=>wwv_flow_imp.id(596734889893841398)
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
 p_id=>wwv_flow_imp.id(596734495066841398)
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
 p_id=>wwv_flow_imp.id(596745673425841402)
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
 p_id=>wwv_flow_imp.id(596709726472841381)
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
 p_id=>wwv_flow_imp.id(596744527434841401)
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
 p_id=>wwv_flow_imp.id(596733293416841398)
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
 p_id=>wwv_flow_imp.id(596719274639841384)
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
 p_id=>wwv_flow_imp.id(596708493232841381)
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
 p_id=>wwv_flow_imp.id(596737261009841399)
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
 p_id=>wwv_flow_imp.id(596714518582841383)
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
 p_id=>wwv_flow_imp.id(596712508163841382)
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
 p_id=>wwv_flow_imp.id(596714881113841383)
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
 p_id=>wwv_flow_imp.id(596741661742841400)
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
 p_id=>wwv_flow_imp.id(596715747909841383)
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
 p_id=>wwv_flow_imp.id(596732507211841397)
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
 p_id=>wwv_flow_imp.id(596715308131841383)
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
 p_id=>wwv_flow_imp.id(596740871807841400)
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
 p_id=>wwv_flow_imp.id(596717264543841384)
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
 p_id=>wwv_flow_imp.id(596716939771841384)
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
 p_id=>wwv_flow_imp.id(596735314270841398)
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
 p_id=>wwv_flow_imp.id(596712897980841383)
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
 p_id=>wwv_flow_imp.id(596713309396841383)
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
 p_id=>wwv_flow_imp.id(596741309410841400)
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
 p_id=>wwv_flow_imp.id(596714140118841383)
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
 p_id=>wwv_flow_imp.id(596738088575841399)
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
 p_id=>wwv_flow_imp.id(596732097341841397)
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
 p_id=>wwv_flow_imp.id(596713677471841383)
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
 p_id=>wwv_flow_imp.id(596729251986841396)
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
 p_id=>wwv_flow_imp.id(596712120450841382)
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
 p_id=>wwv_flow_imp.id(596721739019841385)
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
 p_id=>wwv_flow_imp.id(596729711597841397)
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
 p_id=>wwv_flow_imp.id(596726894801841393)
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
 p_id=>wwv_flow_imp.id(596724920634841388)
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
 p_id=>wwv_flow_imp.id(596709306183841381)
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
 p_id=>wwv_flow_imp.id(596720457109841385)
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
 p_id=>wwv_flow_imp.id(596736053550841399)
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
 p_id=>wwv_flow_imp.id(596736522682841399)
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
 p_id=>wwv_flow_imp.id(596725283671841388)
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
 p_id=>wwv_flow_imp.id(596721317948841385)
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
 p_id=>wwv_flow_imp.id(596705348667841375)
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
 p_id=>wwv_flow_imp.id(596740075641841400)
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
 p_id=>wwv_flow_imp.id(596738909523841399)
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
 p_id=>wwv_flow_imp.id(596730510995841397)
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
 p_id=>wwv_flow_imp.id(596740505036841400)
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
 p_id=>wwv_flow_imp.id(596779081518899534)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1469126'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EMPLOYEECODE:EMPLOYEENAME:EMPLOYEESHORTNAME:FATHERNAME:DESIGNATIONNAME:DEPARTMENTNAME:DATEOFJOINING:REMARK:CREATOR:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(596746557713841402)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(596704843383841374)
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
 p_id=>wwv_flow_imp.id(596767001273857220)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(596704843383841374)
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
 p_id=>wwv_flow_imp.id(595024879973083725)
,p_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(596746557713841402)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595024954370083726)
,p_event_id=>wwv_flow_imp.id(595024879973083725)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(596704843383841374)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(596746888262841402)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(596704843383841374)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(596747362156841403)
,p_event_id=>wwv_flow_imp.id(596746888262841402)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(596704843383841374)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(482828648630966184)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(482828751554966185)
,p_event_id=>wwv_flow_imp.id(482828648630966184)
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
 p_id=>wwv_flow_imp.id(482828813799966186)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(482828961855966187)
,p_event_id=>wwv_flow_imp.id(482828813799966186)
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
