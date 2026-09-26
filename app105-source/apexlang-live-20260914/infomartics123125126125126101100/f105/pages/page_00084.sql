prompt --application/pages/page_00084
begin
--   Manifest
--     PAGE: 00084
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
 p_id=>84
,p_name=>'Employee List'
,p_alias=>'EMPLOYEE-LIST'
,p_step_title=>'Employee List'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
':root{',
'    --a-menu-font-size: 1.25rem !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(576835130598623501)
,p_plug_name=>'Employee List'
,p_static_id=>'employee-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.TNO,',
'       A.EMPLOYEECODE,',
'       A.EMPLOYEENAME,',
'       A.EMPLOYEESHORTNAME,',
'       A.DESIGNATIONCODE,',
'       B.DESIGNATIONNAME,',
'       C.DEPARTMENTNAME,',
'       A.DEPARTMENTCODE,',
'       A.EMPLOYEETYPECODE,',
'       A.CONTRACTORCODE,',
'       A.PAYMENTTERM,',
'       A.FATHERNAME,',
'       A.SEX,',
'       A.OTATTENDENCEHEADCODE,',
'       A.MARITALSTATUS,',
'       A.CATEGORYCODE,',
'       D.CATEGORYNAME,',
'       A.DATEOFBIRTH,',
'       A.DATEOFAPPOINTMENT,',
'       A.DATEOFJOINING,',
'       A.PUNCHCARDNO,',
'       A.PERMANENTAFTERDAY,',
'       A.PRESENTADDRESS,',
'       GETCITYNAME(A.PRESENTCITYCODE) PRESENTCITY,',
'       GetStateName(A.PRESENTSTATECODE) PRESENTSTATE,',
'       A.PRESENTPHONENO,',
'       A.PERMANENTADDRESS,',
'       GETCITYNAME(A.PERMANENTCITYCODE) PERMANENTCITY,',
'       GetStateName(A.PERMANENTSTATECODE) PERMANENTSTATE,',
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
'       E.SHIFTNAME,',
'       A.EMPLOYEENATURECODE,',
'       A.STAFFTYPECODE,',
'       F.STAFFTYPENAME,',
'       A.REMARK,',
'       A.DATECREATED,',
'       A.DATEMODIFY,',
'       GetCompanyName(A.COMPANYCODE) COMPANYNAME,',
'       A.EMPLOYEENATURE,',
'       A.EMPLOYMENTTYPECODE,',
'       GetMoneyTransferModeName(A.MONEYTRANSFERMODECODE) MONEYTRANSFERMODE,',
'       A.NOOFDEPENDENTS,',
'       A.SALARYSCHEMECODE,',
'       I.SALARYSCHEMENAME,',
'       A.STAFFTYPE,',
'       A.EMPLOYEEACCOUNTCODE,',
'       A.GENDER,',
'       A.LOANACCOUNTCODE,',
'       A.SALARYACCOUNTCODE,',
'       A.CREATOR,',
'       GetLocationName(A.LOCATIONCODE) LOCATIONNAME,',
'       A.EMPLOYEEID,',
'       A.DATEOFRETIREMENT,',
'       A.DATEOFCONFIRMATION,',
'       A.PRODUCTIONCENTRECODE,',
'       G.PRODUCTIONCENTRENAME,',
'       GetEMPLOYEEName(A.REPORTTOEMPLOYEECODE) REPORTTOEMPLOYEENAME,',
'       A.INCENTIVESCHEMECODE,',
'       A.VEHICLENO,',
'       --A.DESIGNATIONNAME,',
'       --A.DEPARTMENTNAME,',
'       A.CREATIONTIME,',
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
'  from EMPLOYEE a , DESIGNATION b  , DEPARTMENT C , CATEGORY D , ',
'        SHIFT E , STAFFTYPE F , PRODUCTIONCENTRE G , SALARYSCHEME I',
'  where a.DESIGNATIONCODE = B.DESIGNATIONCODE(+)',
'  AND A.DEPARTMENTCODE = C.DEPARTMENTCODE(+)',
'  AND A.CATEGORYCODE = D.CATEGORYCODE(+)',
'  AND A.SHIFTCODE = E.SHIFTCODE(+)',
'  AND A.STAFFTYPECODE = F.STAFFTYPECODE(+)',
'  AND A.PRODUCTIONCENTRECODE = G.PRODUCTIONCENTRECODE(+)',
'  AND A.SALARYSCHEMECODE = I.SALARYSCHEMECODE(+)',
'  -- FILTER',
'  and ( :P84_COMPANY IS NULL OR instr('':''||:P84_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 ) ',
'  and ( :P84_LOCATION IS NULL OR instr('':''||:P84_LOCATION||'':'','':''||GETEMPLOYEELOCATIONCODE(a.EmployeeCode,trunc(sysdate))||'':'') > 0 ) ',
'  and ( :P84_DEPARTMENT IS NULL OR instr('':''||:P84_DEPARTMENT||'':'','':''||GETEMPLOYEEDEPARTMENTCODE(a.EmployeeCode,trunc(sysdate))||'':'') > 0 ) ',
'  and getcompanyprivilege(A.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES'''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84_COMPANY,P84_LOCATION,P84_DEPARTMENT'
,p_prn_page_header=>'Employee List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(576835160925623501)
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
,p_detail_link=>'f?p=&APP_ID.:85:&APP_SESSION.::&DEBUG.:RP:P85_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>143990305483399727
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576874259597623534)
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
 p_id=>wwv_flow_imp.id(576873140143623530)
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
 p_id=>wwv_flow_imp.id(576873549115623531)
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
 p_id=>wwv_flow_imp.id(576868737937623528)
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
 p_id=>wwv_flow_imp.id(576849858559623510)
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
 p_id=>wwv_flow_imp.id(576872724778623530)
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
 p_id=>wwv_flow_imp.id(576850284501623510)
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
 p_id=>wwv_flow_imp.id(576863074397623526)
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
 p_id=>wwv_flow_imp.id(576867889827623528)
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
 p_id=>wwv_flow_imp.id(576867096498623528)
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
 p_id=>wwv_flow_imp.id(576875077393623534)
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
 p_id=>wwv_flow_imp.id(576840830729623506)
,p_db_column_name=>'CATEGORYCODE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475504022838530956)
,p_db_column_name=>'CATEGORYNAME'
,p_display_order=>113
,p_column_identifier=>'CZ'
,p_column_label=>'Category Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475504294229530959)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>143
,p_column_identifier=>'DC'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576838388823623505)
,p_db_column_name=>'CONTRACTORCODE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Contractor'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576861936878623526)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>67
,p_column_identifier=>'BO'
,p_column_label=>'Creationtime'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576857516937623512)
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
 p_id=>wwv_flow_imp.id(576852323729623510)
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
 p_id=>wwv_flow_imp.id(576852755390623511)
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
 p_id=>wwv_flow_imp.id(576841607513623506)
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
 p_id=>wwv_flow_imp.id(576841232168623506)
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
 p_id=>wwv_flow_imp.id(576859101684623525)
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
 p_id=>wwv_flow_imp.id(576841991463623507)
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
 p_id=>wwv_flow_imp.id(576865887722623527)
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
 p_id=>wwv_flow_imp.id(576858709362623519)
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
 p_id=>wwv_flow_imp.id(576837646030623504)
,p_db_column_name=>'DEPARTMENTCODE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576861474122623525)
,p_db_column_name=>'DEPARTMENTNAME'
,p_display_order=>66
,p_column_identifier=>'BN'
,p_column_label=>'Departmentname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576837175217623504)
,p_db_column_name=>'DESIGNATIONCODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576861086120623525)
,p_db_column_name=>'DESIGNATIONNAME'
,p_display_order=>65
,p_column_identifier=>'BM'
,p_column_label=>'Designationname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576864294127623527)
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
 p_id=>wwv_flow_imp.id(576863882737623527)
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
 p_id=>wwv_flow_imp.id(576855884656623512)
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
 p_id=>wwv_flow_imp.id(576836034822623504)
,p_db_column_name=>'EMPLOYEECODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576858300652623519)
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
 p_id=>wwv_flow_imp.id(576876306115623535)
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
 p_id=>wwv_flow_imp.id(576836366495623504)
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
 p_id=>wwv_flow_imp.id(576853518003623511)
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
 p_id=>wwv_flow_imp.id(576851069426623510)
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
 p_id=>wwv_flow_imp.id(576836842825623504)
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
 p_id=>wwv_flow_imp.id(576838037461623505)
,p_db_column_name=>'EMPLOYEETYPECODE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Employee Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576853906115623511)
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
 p_id=>wwv_flow_imp.id(576848259071623509)
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
 p_id=>wwv_flow_imp.id(576869513668623528)
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
 p_id=>wwv_flow_imp.id(576839168934623506)
,p_db_column_name=>'FATHERNAME'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Father'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576856346420623512)
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
 p_id=>wwv_flow_imp.id(576846701497623508)
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
 p_id=>wwv_flow_imp.id(576849065686623509)
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
 p_id=>wwv_flow_imp.id(576873932968623534)
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
 p_id=>wwv_flow_imp.id(576872262704623529)
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
 p_id=>wwv_flow_imp.id(576860322855623525)
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
 p_id=>wwv_flow_imp.id(576869899764623529)
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
 p_id=>wwv_flow_imp.id(576856705412623512)
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
 p_id=>wwv_flow_imp.id(475504500743530961)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>163
,p_column_identifier=>'DE'
,p_column_label=>'Locationname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576840449313623506)
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
 p_id=>wwv_flow_imp.id(576875491616623534)
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
 p_id=>wwv_flow_imp.id(475504398225530960)
,p_db_column_name=>'MONEYTRANSFERMODE'
,p_display_order=>153
,p_column_identifier=>'DD'
,p_column_label=>'Moneytransfermode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576848752182623509)
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
 p_id=>wwv_flow_imp.id(576854684497623511)
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
 p_id=>wwv_flow_imp.id(576847892233623509)
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
 p_id=>wwv_flow_imp.id(576846351822623508)
,p_db_column_name=>'OFFDAY'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Off Day'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576865128478623527)
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
 p_id=>wwv_flow_imp.id(576864696337623527)
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
 p_id=>wwv_flow_imp.id(576875907268623534)
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
 p_id=>wwv_flow_imp.id(576839977559623506)
,p_db_column_name=>'OTATTENDENCEHEADCODE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Otattendenceheadcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576874661278623534)
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
 p_id=>wwv_flow_imp.id(576863538155623526)
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
 p_id=>wwv_flow_imp.id(576849468867623510)
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
 p_id=>wwv_flow_imp.id(576838802637623505)
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
 p_id=>wwv_flow_imp.id(576867551844623528)
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
 p_id=>wwv_flow_imp.id(576844834639623507)
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
 p_id=>wwv_flow_imp.id(576842767299623507)
,p_db_column_name=>'PERMANENTAFTERDAY'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Permanentafterday'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475504960296530965)
,p_db_column_name=>'PERMANENTCITY'
,p_display_order=>203
,p_column_identifier=>'DI'
,p_column_label=>'Permanent City'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576871873357623529)
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
 p_id=>wwv_flow_imp.id(576845918744623508)
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
 p_id=>wwv_flow_imp.id(576862740930623526)
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
 p_id=>wwv_flow_imp.id(475505120326530967)
,p_db_column_name=>'PERMANENTSTATE'
,p_display_order=>223
,p_column_identifier=>'DK'
,p_column_label=>'Permanent State'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576871140289623529)
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
 p_id=>wwv_flow_imp.id(576847546577623509)
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
 p_id=>wwv_flow_imp.id(576847145442623508)
,p_db_column_name=>'PFDEDUCTIONON'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Pf Deductionon'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576865519111623527)
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
 p_id=>wwv_flow_imp.id(576843168724623507)
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
 p_id=>wwv_flow_imp.id(475504798197530964)
,p_db_column_name=>'PRESENTCITY'
,p_display_order=>193
,p_column_identifier=>'DH'
,p_column_label=>'Present City'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576871548787623529)
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
 p_id=>wwv_flow_imp.id(576844406462623507)
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
 p_id=>wwv_flow_imp.id(576868262215623528)
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
 p_id=>wwv_flow_imp.id(576862324074623526)
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
 p_id=>wwv_flow_imp.id(475505076608530966)
,p_db_column_name=>'PRESENTSTATE'
,p_display_order=>213
,p_column_identifier=>'DJ'
,p_column_label=>'Present State'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576859514332623525)
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
 p_id=>wwv_flow_imp.id(475504653325530962)
,p_db_column_name=>'PRODUCTIONCENTRENAME'
,p_display_order=>173
,p_column_identifier=>'DF'
,p_column_label=>'Productioncentrename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576842399521623507)
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
 p_id=>wwv_flow_imp.id(576851861106623510)
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
 p_id=>wwv_flow_imp.id(475504732747530963)
,p_db_column_name=>'REPORTTOEMPLOYEENAME'
,p_display_order=>183
,p_column_identifier=>'DG'
,p_column_label=>'Reporttoemployeename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576857065421623512)
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
 p_id=>wwv_flow_imp.id(576855108962623511)
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
 p_id=>wwv_flow_imp.id(475505277389530968)
,p_db_column_name=>'SALARYSCHEMENAME'
,p_display_order=>233
,p_column_identifier=>'DL'
,p_column_label=>'Salaryschemename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576839650197623506)
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
 p_id=>wwv_flow_imp.id(576850722841623510)
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
 p_id=>wwv_flow_imp.id(475504110450530957)
,p_db_column_name=>'SHIFTNAME'
,p_display_order=>123
,p_column_identifier=>'DA'
,p_column_label=>'Shift'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576866297875623527)
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
 p_id=>wwv_flow_imp.id(576866744296623528)
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
 p_id=>wwv_flow_imp.id(576855495472623511)
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
 p_id=>wwv_flow_imp.id(576851506141623510)
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
 p_id=>wwv_flow_imp.id(475504211448530958)
,p_db_column_name=>'STAFFTYPENAME'
,p_display_order=>133
,p_column_identifier=>'DB'
,p_column_label=>'Staff Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(576835646004623503)
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
 p_id=>wwv_flow_imp.id(576870345648623529)
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
 p_id=>wwv_flow_imp.id(576869098159623528)
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
 p_id=>wwv_flow_imp.id(576860701172623525)
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
 p_id=>wwv_flow_imp.id(576870754938623529)
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
 p_id=>wwv_flow_imp.id(576877131888625830)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1440323'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EMPLOYEENAME:EMPLOYEESHORTNAME:CATEGORYNAME:COMPANYNAME:LOCATIONNAME:SHIFTNAME:STAFFTYPENAME:FATHERNAME:MARITALSTATUS:DATEOFBIRTH:DATEOFAPPOINTMENT:DATEOFJOINING:PUNCHCARDNO:PRESENTADDRESS:PRESENTPHONENO:PERMANENTADDRESS:PERMANENTPHONENO:OFFDAY:GROSS'
||'SALARY:PFDEDUCTIONON:PFACCOUNTNO:REMARK:GENDER:PERMANENTCITY:PERMANENTSTATE:PRESENTCITY:PRESENTSTATE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(681095432392620339)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
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
 p_id=>wwv_flow_imp.id(576876833434623535)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(576835130598623501)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:85:&APP_SESSION.::&DEBUG.:85::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(575348220915133718)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(576835130598623501)
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
 p_id=>wwv_flow_imp.id(297335796295472423)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(681095432392620339)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
,p_grid_column=>9
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(614371687138294232)
,p_name=>'P84_BIREPORTURL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(681095432392620339)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(624470438255468274)
,p_name=>'P84_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(681095432392620339)
,p_use_cache_before_default=>'NO'
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
'Where a.ModuleCode = ''REQUISITION''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'  ;'))
,p_cSize=>30
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(631318815275794360)
,p_name=>'P84_DEPARTMENT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(681095432392620339)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Doc Type'
,p_placeholder=>'Select Doc Type'
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
'  and a.ModuleCode = ''REQUISITION''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(624568956145946992)
,p_name=>'P84_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(681095432392620339)
,p_use_cache_before_default=>'NO'
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
'  and a.ModuleCode = ''REQUISITION''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
'  ',
''))
,p_lov_cascade_parent_items=>'P84_COMPANY'
,p_ajax_items_to_submit=>'P84_LOCATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(624568139159946992)
,p_name=>'P84_STATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(681095432392620339)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(383721184761569857)
,p_name=>'P84_TNO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(681095432392620339)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(478023075031799861)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(478023156773799862)
,p_event_id=>wwv_flow_imp.id(478023075031799861)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(296344429154613419)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(297335796295472423)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(296344529997613420)
,p_event_id=>wwv_flow_imp.id(296344429154613419)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(576835130598623501)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(478023222704799863)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(478023315727799864)
,p_event_id=>wwv_flow_imp.id(478023222704799863)
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
