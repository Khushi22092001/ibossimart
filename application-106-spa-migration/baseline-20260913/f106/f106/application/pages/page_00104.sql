prompt --application/pages/page_00104
begin
--   Manifest
--     PAGE: 00104
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
 p_id=>104
,p_name=>'Employee Master'
,p_alias=>'EMPLOYEE-MASTER2'
,p_page_mode=>'MODAL'
,p_step_title=>'Employee Master'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#myfunctions#MIN#.js'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#mycss/MyIR (2)#MIN#.css',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 0.90rem !important; ',
'}'))
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'300'
,p_dialog_width=>'1000'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(587220168199375007)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(587147759053374962)
,p_plug_name=>'Employee Master'
,p_static_id=>'employee-master'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       EMPLOYEECODE,',
'       EMPLOYEENAME,',
'       EMPLOYEESHORTNAME,',
'       DESIGNATIONCODE,',
'       DEPARTMENTCODE,',
'       EMPLOYEETYPECODE,',
'       CONTRACTORCODE,',
'       PAYMENTTERM,',
'       FATHERNAME,',
'       SEX,',
'       OTATTENDENCEHEADCODE,',
'       MARITALSTATUS,',
'       CATEGORYCODE,',
'       DATEOFBIRTH,',
'       DATEOFAPPOINTMENT,',
'       DATEOFJOINING,',
'       PUNCHCARDNO,',
'       PERMANENTAFTERDAY,',
'       PRESENTADDRESS,',
'       PRESENTCITYCODE,',
'       PRESENTSTATECODE,',
'       PRESENTPHONENO,',
'       PERMANENTADDRESS,',
'       PERMANENTCITYCODE,',
'       PERMANENTSTATECODE,',
'       PERMANENTPHONENO,',
'       OFFDAY,',
'       GROSSSALARY,',
'       PFDEDUCTIONON,',
'       PFACCOUNTNO,',
'       NOOFNOMINEE,',
'       ESICACCOUNTNO,',
'       NOOFDEPENDENCE,',
'       HOSPITALCODE,',
'       PAYMENTMODE,',
'       BANKACCOUNTNO,',
'       BANKCODE,',
'       SHIFTCODE,',
'       EMPLOYEENATURECODE,',
'       STAFFTYPECODE,',
'       REMARK,',
'       DATECREATED,',
'       DATEMODIFY,',
'       COMPANYCODE,',
'       EMPLOYEENATURE,',
'       EMPLOYMENTTYPECODE,',
'       MONEYTRANSFERMODECODE,',
'       NOOFDEPENDENTS,',
'       SALARYSCHEMECODE,',
'       STAFFTYPE,',
'       EMPLOYEEACCOUNTCODE,',
'       GENDER,',
'       LOANACCOUNTCODE,',
'       SALARYACCOUNTCODE,',
'       CREATOR,',
'       LOCATIONCODE,',
'       EMPLOYEEID,',
'       DATEOFRETIREMENT,',
'       DATEOFCONFIRMATION,',
'       PRODUCTIONCENTRECODE,',
'       REPORTTOEMPLOYEECODE,',
'       INCENTIVESCHEMECODE,',
'       VEHICLENO,',
'       DESIGNATIONNAME,',
'       DEPARTMENTNAME,',
'       CREATIONTIME,',
'       PRESENTPOLICESTATION,',
'       PERMANENTPOLICESTATION,',
'       BLOODGROUP,',
'       PANNO,',
'       DRIVINGLICENSENO,',
'       DRIVINGLICENSEEXPIRYDATE,',
'       OFFICEMOBILENO,',
'       OFFICEEMAILID,',
'       PLACEOFBIRTH,',
'       DATEOFRESIGNATION,',
'       SITECODE,',
'       SITENAME,',
'       BRANCHCODE,',
'       PERIODOFPREVIOUSSERVICEINMONTH,',
'       BONUSPERCENT,',
'       PRESENTPINCODE,',
'       ATTACHEDVEHICLENO,',
'       VEHICLEDESIGNATIONCODE,',
'       ESICESTABLISHMENTCODENO,',
'       INCENTIVESTARTDATE,',
'       UAN,',
'       ZONECODE,',
'       PERSONALEMAILID,',
'       PRESENTDISTRICTCODE,',
'       PERMANENTDISTRICTCODE,',
'       IFSCCODE,',
'       BANKBRANCHNAME,',
'       APPOINTMENTLETTERISSUEDATE,',
'       APPOINTMENTLETTERISSUENO,',
'       HUSBANDNAME,',
'       ADHARNO,',
'       OVERTIMESCHEMECODE,',
'       CATEGORY,',
'       MINORITY,',
'       OLDEMPLOYEECODE,',
'       EMPLOYEEIDTEMP,',
'       CANALLOWVISITOR',
'  from EMPLOYEE'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1137890144984797295)
,p_plug_name=>'Fields'
,p_static_id=>'fields'
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(587220612987375007)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(587222825771375009)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P104_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(587221951197375008)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P104_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(587502264471698002)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P104_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(587502902522700647)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Flow'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P2_TNO1.'
,p_button_condition=>'P104_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(587501853916697004)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P104_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(587503498916702366)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_button_name=>'Print'
,p_static_id=>'print'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P104_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(587222398845375009)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P104_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(587503225343701510)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Status'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P104_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587186894755374995)
,p_name=>'P104_ADHARNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1000
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'ADHARNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587185678831374993)
,p_name=>'P104_APPOINTMENTLETTERISSUEDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>970
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'APPOINTMENTLETTERISSUEDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587186092383374993)
,p_name=>'P104_APPOINTMENTLETTERISSUENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>980
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'APPOINTMENTLETTERISSUENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587181258548374988)
,p_name=>'P104_ATTACHEDVEHICLENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>860
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'ATTACHEDVEHICLENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587162471602374977)
,p_name=>'P104_BANKACCOUNTNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'BANKACCOUNTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587185276029374993)
,p_name=>'P104_BANKBRANCHNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>960
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'BANKBRANCHNAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587162901662374977)
,p_name=>'P104_BANKCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'BANKCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587175705887374982)
,p_name=>'P104_BLOODGROUP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>720
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'BLOODGROUP'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587180521214374988)
,p_name=>'P104_BONUSPERCENT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>840
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'BONUSPERCENT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587179647575374988)
,p_name=>'P104_BRANCHCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>820
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'BRANCHCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1138007544685676981)
,p_name=>'P104_CALLEDFROMPAGE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(1137890144984797295)
,p_item_default=>'2'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(463766039243538534)
,p_name=>'P104_CANALLOWVISITOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_prompt=>'Can Allow Visitor'
,p_source=>'CANALLOWVISITOR'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587187645380374996)
,p_name=>'P104_CATEGORY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1020
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'CATEGORY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587153313329374969)
,p_name=>'P104_CATEGORYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'CATEGORYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587165651661374978)
,p_name=>'P104_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587150938749374968)
,p_name=>'P104_CONTRACTORCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'CONTRACTORCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587174452369374981)
,p_name=>'P104_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>690
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_default=>'select to_char(sysdate,''DD-MM-YYYY HH24:MI:SS'') from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Creation Time'
,p_format_mask=>'DD-MM-YYYY HH24:MI:SS'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587170073759374980)
,p_name=>'P104_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>680
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_default=>'select :GLOBAL_LOGINNAME from Dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Creator'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_cMaxlength=>30
,p_tag_attributes=>'readonly=true'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587164905282374978)
,p_name=>'P104_DATECREATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'DATECREATED'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587165286146374978)
,p_name=>'P104_DATEMODIFY'
,p_source_data_type=>'DATE'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'DATEMODIFY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587154114520374970)
,p_name=>'P104_DATEOFAPPOINTMENT'
,p_source_data_type=>'DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'DATEOFAPPOINTMENT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587153740738374970)
,p_name=>'P104_DATEOFBIRTH'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'DATEOFBIRTH'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587171709194374980)
,p_name=>'P104_DATEOFCONFIRMATION'
,p_source_data_type=>'DATE'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'DATEOFCONFIRMATION'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587154478665374971)
,p_name=>'P104_DATEOFJOINING'
,p_source_data_type=>'DATE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_prompt=>'Date Of Joining'
,p_source=>'DATEOFJOINING'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587178449444374987)
,p_name=>'P104_DATEOFRESIGNATION'
,p_source_data_type=>'DATE'
,p_item_sequence=>790
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'DATEOFRESIGNATION'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587171327354374980)
,p_name=>'P104_DATEOFRETIREMENT'
,p_source_data_type=>'DATE'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'DATEOFRETIREMENT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587150131265374968)
,p_name=>'P104_DEPARTMENTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_prompt=>'Department'
,p_source=>'DEPARTMENTCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'        A.DEPARTMENTNAME, ',
'        A.DEPARTMENTCODE ',
'        FROM DEPARTMENT A ',
'        ORDER BY A.TNO DESC'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(587174110566374981)
,p_name=>'P104_DEPARTMENTNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'DEPARTMENTNAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587149676080374968)
,p_name=>'P104_DESIGNATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_prompt=>'Designation'
,p_source=>'DESIGNATIONCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'        A.DESIGNATIONNAME ,',
'        A.DESIGNATIONCODE ',
'        FROM DESIGNATION A ORDER BY A.TNO DESC'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_cMaxlength=>30
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(587173709697374981)
,p_name=>'P104_DESIGNATIONNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'DESIGNATIONNAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587176926046374985)
,p_name=>'P104_DRIVINGLICENSEEXPIRYDATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>750
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'DRIVINGLICENSEEXPIRYDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587176489002374985)
,p_name=>'P104_DRIVINGLICENSENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>740
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'DRIVINGLICENSENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587168449969374979)
,p_name=>'P104_EMPLOYEEACCOUNTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'EMPLOYEEACCOUNTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587148527816374967)
,p_name=>'P104_EMPLOYEECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_prompt=>'Employee Code'
,p_source=>'EMPLOYEECODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_cMaxlength=>30
,p_grid_label_column_span=>3
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'      from codeschememaster a',
'     where a.modulecode = ''EMPLOYEE''',
'       and a.CodeScheme = ''AUTO'''))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587170884878374980)
,p_name=>'P104_EMPLOYEEID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'EMPLOYEEID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587188880634374996)
,p_name=>'P104_EMPLOYEEIDTEMP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1050
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'EMPLOYEEIDTEMP'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587148914564374967)
,p_name=>'P104_EMPLOYEENAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_prompt=>'Employee Name'
,p_source=>'EMPLOYEENAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587166097791374979)
,p_name=>'P104_EMPLOYEENATURE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'EMPLOYEENATURE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587163710364374978)
,p_name=>'P104_EMPLOYEENATURECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'EMPLOYEENATURECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587149258854374968)
,p_name=>'P104_EMPLOYEESHORTNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_prompt=>'Employee Short Name'
,p_source=>'EMPLOYEESHORTNAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_cMaxlength=>30
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587150539856374968)
,p_name=>'P104_EMPLOYEETYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'EMPLOYEETYPECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587166521467374979)
,p_name=>'P104_EMPLOYMENTTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'EMPLOYMENTTYPECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587160869165374974)
,p_name=>'P104_ESICACCOUNTNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'ESICACCOUNTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587182095166374988)
,p_name=>'P104_ESICESTABLISHMENTCODENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>880
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'ESICESTABLISHMENTCODENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587151710666374968)
,p_name=>'P104_FATHERNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_prompt=>'Father Name'
,p_source=>'FATHERNAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1138009122190696389)
,p_name=>'P104_FORMSTATUS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(1137890144984797295)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587168899303374980)
,p_name=>'P104_GENDER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'GENDER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587159249299374974)
,p_name=>'P104_GROSSSALARY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'GROSSSALARY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587161738018374977)
,p_name=>'P104_HOSPITALCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'HOSPITALCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587186526538374995)
,p_name=>'P104_HUSBANDNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>990
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'HUSBANDNAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587184921738374993)
,p_name=>'P104_IFSCCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>950
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'IFSCCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587172910388374981)
,p_name=>'P104_INCENTIVESCHEMECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'INCENTIVESCHEMECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587182531510374989)
,p_name=>'P104_INCENTIVESTARTDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>890
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'INCENTIVESTARTDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587169249061374980)
,p_name=>'P104_LOANACCOUNTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'LOANACCOUNTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587170498573374980)
,p_name=>'P104_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'LOCATIONCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587152936272374969)
,p_name=>'P104_MARITALSTATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'MARITALSTATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587188063518374996)
,p_name=>'P104_MINORITY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1030
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'MINORITY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1138008714196693027)
,p_name=>'P104_MODULEFLOW'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(1137890144984797295)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587166897244374979)
,p_name=>'P104_MONEYTRANSFERMODECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'MONEYTRANSFERMODECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587161275301374975)
,p_name=>'P104_NOOFDEPENDENCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'NOOFDEPENDENCE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587167276917374979)
,p_name=>'P104_NOOFDEPENDENTS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'NOOFDEPENDENTS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587160452346374974)
,p_name=>'P104_NOOFNOMINEE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'NOOFNOMINEE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587158898923374974)
,p_name=>'P104_OFFDAY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'OFFDAY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587177717585374987)
,p_name=>'P104_OFFICEEMAILID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>770
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'OFFICEEMAILID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587177278029374985)
,p_name=>'P104_OFFICEMOBILENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>760
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'OFFICEMOBILENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587188463874374996)
,p_name=>'P104_OLDEMPLOYEECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1040
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'OLDEMPLOYEECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1138008426908689150)
,p_name=>'P104_ONTHETABLE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(1137890144984797295)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587152528024374969)
,p_name=>'P104_OTATTENDENCEHEADCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'OTATTENDENCEHEADCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587187342047374996)
,p_name=>'P104_OVERTIMESCHEMECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1010
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'OVERTIMESCHEMECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587176095222374985)
,p_name=>'P104_PANNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>730
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PANNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1138008063951684571)
,p_name=>'P104_PASSFAILREMARK'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(1137890144984797295)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587162143849374977)
,p_name=>'P104_PAYMENTMODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PAYMENTMODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587151301010374968)
,p_name=>'P104_PAYMENTTERM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PAYMENTTERM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587180101002374988)
,p_name=>'P104_PERIODOFPREVIOUSSERVICEINMONTH'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>830
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PERIODOFPREVIOUSSERVICEINMONTH'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587157297762374973)
,p_name=>'P104_PERMANENTADDRESS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PERMANENTADDRESS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587155258776374971)
,p_name=>'P104_PERMANENTAFTERDAY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PERMANENTAFTERDAY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587157720854374973)
,p_name=>'P104_PERMANENTCITYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PERMANENTCITYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587184488707374993)
,p_name=>'P104_PERMANENTDISTRICTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>940
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PERMANENTDISTRICTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587158475132374974)
,p_name=>'P104_PERMANENTPHONENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PERMANENTPHONENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587175299214374982)
,p_name=>'P104_PERMANENTPOLICESTATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>710
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PERMANENTPOLICESTATION'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587158129060374974)
,p_name=>'P104_PERMANENTSTATECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PERMANENTSTATECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587183683231374992)
,p_name=>'P104_PERSONALEMAILID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>920
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PERSONALEMAILID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587160100272374974)
,p_name=>'P104_PFACCOUNTNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PFACCOUNTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587159647712374974)
,p_name=>'P104_PFDEDUCTIONON'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PFDEDUCTIONON'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587178143112374987)
,p_name=>'P104_PLACEOFBIRTH'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>780
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PLACEOFBIRTH'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587155693871374971)
,p_name=>'P104_PRESENTADDRESS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PRESENTADDRESS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587156054447374972)
,p_name=>'P104_PRESENTCITYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PRESENTCITYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587184141097374993)
,p_name=>'P104_PRESENTDISTRICTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>930
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PRESENTDISTRICTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587156892190374973)
,p_name=>'P104_PRESENTPHONENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PRESENTPHONENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587180871355374988)
,p_name=>'P104_PRESENTPINCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>850
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PRESENTPINCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587174889267374982)
,p_name=>'P104_PRESENTPOLICESTATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>700
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PRESENTPOLICESTATION'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587156477459374973)
,p_name=>'P104_PRESENTSTATECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PRESENTSTATECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587172112246374981)
,p_name=>'P104_PRODUCTIONCENTRECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PRODUCTIONCENTRECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587154934475374971)
,p_name=>'P104_PUNCHCARDNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'PUNCHCARDNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587164463899374978)
,p_name=>'P104_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_cMaxlength=>100
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587172535793374981)
,p_name=>'P104_REPORTTOEMPLOYEECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'REPORTTOEMPLOYEECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587169652885374980)
,p_name=>'P104_SALARYACCOUNTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'SALARYACCOUNTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587167727492374979)
,p_name=>'P104_SALARYSCHEMECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'SALARYSCHEMECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587152074173374968)
,p_name=>'P104_SEX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'SEX'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587163327071374978)
,p_name=>'P104_SHIFTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'SHIFTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587178887812374987)
,p_name=>'P104_SITECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>800
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'SITECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587179279291374987)
,p_name=>'P104_SITENAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>810
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'SITENAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587168110743374979)
,p_name=>'P104_STAFFTYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'STAFFTYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587164137065374978)
,p_name=>'P104_STAFFTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'STAFFTYPECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1138009436766698662)
,p_name=>'P104_STATUS'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(1137890144984797295)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P2_TNO1), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1138007818035679302)
,p_name=>'P104_STATUSRIGHT'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(1137890144984797295)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587148137268374962)
,p_name=>'P104_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587182927642374989)
,p_name=>'P104_UAN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>900
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'UAN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587181685776374988)
,p_name=>'P104_VEHICLEDESIGNATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>870
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'VEHICLEDESIGNATIONCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587173280969374981)
,p_name=>'P104_VEHICLENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'VEHICLENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(587183309884374992)
,p_name=>'P104_ZONECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>910
,p_item_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_item_source_plug_id=>wwv_flow_imp.id(587147759053374962)
,p_source=>'ZONECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(585544900601617363)
,p_name=>'Check Employee Code'
,p_static_id=>'check-employee-code'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P104_EMPLOYEECODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(585544957045617364)
,p_event_id=>wwv_flow_imp.id(585544900601617363)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if (Object.keys($v("P104_EMPLOYEEACCOUNTCODE")).length===0 ) {',
    '    showError("Employee Account Code Should Not be Empty", ''P104_EMPLOYEEACCOUNTCODE'');',
    '} else {',
    '    apex.message.clearErrors();',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(585545070925617365)
,p_name=>'Check Employee Name'
,p_static_id=>'check-employee-name'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P104_EMPLOYEENAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(585545213929617366)
,p_event_id=>wwv_flow_imp.id(585545070925617365)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if (Object.keys($v("P104_EMPLOYEENAME")).length===0 ) {',
    '    showError("Employee Name Should Not be Empty", ''P104_EMPLOYEENAME'');',
    '} else {',
    '    apex.message.clearErrors();',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(585545682246617371)
,p_name=>'Check Employee Short Name'
,p_static_id=>'check-employee-short-name'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P104_EMPLOYEESHORTNAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(585545797030617372)
,p_event_id=>wwv_flow_imp.id(585545682246617371)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if (Object.keys($v("P104_EMPLOYEESHORTNAME")).length===0 ) {',
    '    showError("Employee Short Name Should Not be Empty", ''P104_EMPLOYEESHORTNAME'');',
    '} else {',
    '    apex.message.clearErrors();',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(587220660829375007)
,p_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(587220612987375007)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587221538223375008)
,p_event_id=>wwv_flow_imp.id(587220660829375007)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(587531261465733426)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587531682399733427)
,p_event_id=>wwv_flow_imp.id(587531261465733426)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(587221951197375008)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.DELETEPRIVILEGE= ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587532224047733427)
,p_event_id=>wwv_flow_imp.id(587531261465733426)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(587221951197375008)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P104_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587532657614733427)
,p_event_id=>wwv_flow_imp.id(587531261465733426)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(587221951197375008)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.DELETEPRIVILEGE= ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(587536204237735314)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>110
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587536640353735315)
,p_event_id=>wwv_flow_imp.id(587536204237735314)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(587503498916702366)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.PRINTPRIVILEGE= ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587537099037735315)
,p_event_id=>wwv_flow_imp.id(587536204237735314)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(587503498916702366)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.PRINTPRIVILEGE= ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(587533053488734102)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>90
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587533953323734103)
,p_event_id=>wwv_flow_imp.id(587533053488734102)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(587222398845375009)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C',
'WHERE A.TNO = B.TNO',
'AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'AND B.BOSSUSERCODE = C.BOSSUSERCODE',
'AND C.BOSSUSERNAME = :APP_USER',
'AND B.UPDATEPRIVILEGE = ''NO''',
'UNION ALL',
'Select 1',
'  From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.UPDATEPRIVILEGE = ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587533514620734103)
,p_event_id=>wwv_flow_imp.id(587533053488734102)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(587222398845375009)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P104_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587534462803734103)
,p_event_id=>wwv_flow_imp.id(587533053488734102)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(587222398845375009)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C',
'WHERE A.TNO = B.TNO',
'AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'AND B.BOSSUSERCODE = C.BOSSUSERCODE',
'AND C.BOSSUSERNAME = :APP_USER',
'AND B.UPDATEPRIVILEGE = ''YES''',
'UNION ALL',
'Select 1',
'  From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.UPDATEPRIVILEGE = ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(587534899768734686)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>100
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587535827172734689)
,p_event_id=>wwv_flow_imp.id(587534899768734686)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(587503225343701510)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.STATUSPRIVILEGE = ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587535245938734686)
,p_event_id=>wwv_flow_imp.id(587534899768734686)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(587503225343701510)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.STATUSPRIVILEGE = ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(587516384977724052)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(587503225343701510)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587518791387724057)
,p_event_id=>wwv_flow_imp.id(587516384977724052)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P104_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587518308328724057)
,p_event_id=>wwv_flow_imp.id(587516384977724052)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587519841801724058)
,p_event_id=>wwv_flow_imp.id(587516384977724052)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P104_TNO,P104_STATUS',
  'language', 'PLSQL',
  'plsql_code', 'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P104_TNO,:P104_STATUS);',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587516747716724053)
,p_event_id=>wwv_flow_imp.id(587516384977724052)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''#STATUS span'').text($v(''P104_STATUS''));')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587517308575724053)
,p_event_id=>wwv_flow_imp.id(587516384977724052)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587517782712724056)
,p_event_id=>wwv_flow_imp.id(587516384977724052)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587519322967724057)
,p_event_id=>wwv_flow_imp.id(587516384977724052)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P104_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(587529508460732699)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587529879185732703)
,p_event_id=>wwv_flow_imp.id(587529508460732699)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(587501853916697004)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P104_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587530397910732703)
,p_event_id=>wwv_flow_imp.id(587529508460732699)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(587502264471698002)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P104_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587530934851732703)
,p_event_id=>wwv_flow_imp.id(587529508460732699)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(587502902522700647)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P104_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(587514053489723051)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(587502264471698002)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587515013573723053)
,p_event_id=>wwv_flow_imp.id(587514053489723051)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P104_PASSFAILREMARK,P104_TNO1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '		cursor cPassFail is',
    '				select',
    '						a.TNo,',
    '						a.TokenNo										',
    '				from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '				where a.ModuleFlowTNo = b.TNo',
    '						and b.TNo = c.TNo',
    '						and a.BossUserCode = c.BossUserCode',
    '						and c.BossUserCode = d.BossUserCode',
    '						and a.ModuleTNo = :P104_TNO1',
    '						AND D.BOSSUSERNAME = :APP_USER',
    '						and a.isPass is null',
    '						and a.IsFail is null',
    '						and a.IsForwarded is null',
    '						and a.IsRebounded is null																				',
    '		;',
    '		vPassFail cPassFail%rowtype;',
    '    ',
    '    tTokenNo NUMBER;',
    '    TMP VARCHAR2(100);',
    '    tModulecode Varchar2(30);',
    'begin',
    '',
    '    select DISTINCT ',
    '    	d.ModuleCode, :P130_JOBBILLNO',
    '                into tModuleCode,tmp',
    '    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
    '    where a.LocationCode = b.LocationCode',
    '    	and b.tno = c.tno',
    '    	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
    '        AND d.modulecode = GetModuleCodeForPageNo(:APP_PAGE_ID)',
    '    	and c.CompanyCode = :global_CompanyCode',
    '        and d.EntryPageNo = :APP_PAGE_ID',
    '        ;',
    '',
    '		open cPassFail;',
    '		fetch cPassFail into vPassFail;',
    '		if cPassFail%FOUND then',
    '				tTokenNo := vPassFail.TokenNo;',
    '				close cPassFail;',
    '',
    '           	',
    '				update PassFail a',
    '				set a.IsFail = ''YES'',',
    '						a.remark = :P104_PASSFAILREMARK',
    '				where a.TNo = vPassFail.TNo;',
    '				',
    '				SendBackPassFail(tTokenNo , TMP );',
    '		    		',
    '				',
    '				commit;',
    '		else',
    '				close cPassFail;',
    '		end if;',
    '',
    '	',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587515493981723053)
,p_event_id=>wwv_flow_imp.id(587514053489723051)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587515982014723054)
,p_event_id=>wwv_flow_imp.id(587514053489723051)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587514448773723053)
,p_event_id=>wwv_flow_imp.id(587514053489723051)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P104_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(587511747539722090)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(587501853916697004)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587512732528722091)
,p_event_id=>wwv_flow_imp.id(587511747539722090)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P104_PASSFAILREMARK,P104_TNO1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  tModuleCode  Varchar2(30) := GetModuleCodeForPageNo(:APP_PAGE_ID);',
    '  TMP          vARCHAR2(100) ;',
    'cursor cPassFail is',
    '		select',
    '				a.TNo',
    '		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '		where a.ModuleFlowTNo = b.TNo',
    '				and b.TNo = c.TNo',
    '				and a.BossUserCode = c.BossUserCode',
    '				and c.BossUserCode = d.BossUserCode',
    '				and a.ModuleTNo = :P104_TNO1',
    '				AND D.BOSSUSERNAME = :APP_USER',
    '				and a.isPass is null',
    '				and a.IsFail is null',
    '				and a.IsForwarded is null',
    '				and a.IsRebounded is null										',
    ';',
    'vPassFail cPassFail%rowtype;',
    'BEGIN',
    '',
    '    select DISTINCT ',
    '    	d.ModuleCode, :P130_JOBBILLNO',
    '                into tModuleCode,tmp',
    '    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
    '    where a.LocationCode = b.LocationCode',
    '    	and b.tno = c.tno',
    '    	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
    '        AND d.modulecode = GetModuleCodeForPageNo(:APP_PAGE_ID)',
    '    	and c.CompanyCode = :global_CompanyCode',
    '        and d.EntryPageNo = :APP_PAGE_ID',
    '        ;',
    '',
    '			',
    '	open cPassFail;',
    '	fetch cPassFail into vPassFail;',
    '	if cPassFail%FOUND then',
    '			',
    '		',
    '			update PassFail a',
    '			set a.IsPass = ''YES'',',
    '				a.remark = :P104_PASSFAILRREMARK',
    '			where a.TNo = vPassFail.TNo;',
    '			COMMIT;',
    '			close cPassFail;',
    '			',
    '			',
    '			SendPassFailForward(tModuleCode, :P104_TNO1 , TMP, :global_CompanyCode );',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587513241053722091)
,p_event_id=>wwv_flow_imp.id(587511747539722090)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587513662992722091)
,p_event_id=>wwv_flow_imp.id(587511747539722090)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587512205879722090)
,p_event_id=>wwv_flow_imp.id(587511747539722090)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P104_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(587223983930375009)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(587221951197375008)
,p_internal_uid=>146837638679448485
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(587542837943744524)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Employee Code'
,p_static_id=>'get-employee-code'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := ''EMPLOYEE'';',
'',
'    tmp         number ;',
'begin',
'    select count(*) into tmp',
'      from codeschememaster a',
'     where a.modulecode = tModuleCode',
'       and a.CodeScheme = ''AUTO''',
'     ;',
'',
'     if nvl(tmp,0) > 0 and :P104_EMPLOYEECODE is null then',
'            setCodeNext(tModuleCode);',
'	  		:P104_EMPLOYEECODE := getCode(tModuleCode) ;',
'     end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>147156492692818000
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(587524297946728452)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Form Status And TNO'
,p_static_id=>'get-form-status-and-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     if :P104_TNO is null then',
'            :P104_FORMSTATUS := ''NEWRECORD'';',
'        else',
'            :P104_FORMSTATUS := ''EDITRECORD'';',
'        end if;',
'',
'    if :P104_TNO is null then',
'',
'        select globaltno.nextval into :P104_TNO from dual;',
'',
'    end if; ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>147137952695801928
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(587526394803729345)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get On The Table'
,p_static_id=>'get-on-the-table'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'tmp  number;',
'tmp1 number;',
'begin',
' -------- Checking Module Flow Prepared Or Not ',
'   select count(*) into tmp1 from moduleflow where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) and getdocumentstatuscode(''MODULEFLOW'',TNO)=''ACTIVE'';',
'   if nvl(tmp1,0) > 0 then',
'       :P104_MODULEFLOW := ''YES'';',
'   else',
'       :P104_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P104_TNO1 and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P104_ONTHETABLE := ''YES'' ;',
'   else',
'       :P104_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>147140049552802821
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(587223217511375009)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(587147759053374962)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Employee Master'
,p_static_id=>'initialize-form-employee-master'
,p_internal_uid=>146836872260448485
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(587223627276375009)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(587147759053374962)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Employee Master'
,p_static_id=>'process-form-employee-master'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>146837282025448485
);
wwv_flow_imp.component_end;
end;
/
