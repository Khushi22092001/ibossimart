prompt --application/pages/page_00149
begin
--   Manifest
--     PAGE: 00149
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
 p_id=>149
,p_name=>'Issue Return List'
,p_alias=>'ISSUE-RETURN-LIST'
,p_step_title=>'Issue Return List'
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
'  var bireporturl = $(''#P149_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/IssueReturnRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P149_FROMDATE'').val());',
'  var toDate = new Date($(''#P149_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P149_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P149_COMPANY'').val() ==="" || $(''#P149_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P149_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P149_COMPANY'').val();',
'       global_companycode= $(''#P149_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +       ',
'      ''&P_FROMDATE='' +$(''#P149_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P149_TODATE'').val() + ',
'      ''&P_LOCATION='' + $(''#P149_LOCATION'').val() +',
'      ''&P_DEPARTMENT='' +$(''#P149_DEPARTMENT'').val() +',
'      ''&P_DOCTYPE='' +$(''#P149_DOCTYPE'').val() +',
'      ''&P_ITEM='' +$(''#P149_ITEM'').val() +',
'      ''&P_ISSUENO='' +$(''#P149_ISSUENO'').val() +',
'	  ''&P_ITEMSPECIFICATION='' +$(''#P149_ITEMSPECIFICATION'').val() +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode ',
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
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P149_BIREPORTURL'').val()',
'  var reportName =  ''IssueReturnRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P149_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P149_COMPANY'').val() ==="" || $(''#P149_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P149_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P149_COMPANY'').val();',
'       global_companycode= $(''#P149_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P149_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P149_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P149_TODATE'').val() + ''",'' +  ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P149_LOCATION'').val() + ''",'' + ',
'	  ''"_paramsP_DEPARTMENT":"'' + $(''#P149_DEPARTMENT'').val() + ''",'' + ',
'	  ''"_paramsP_DOCTYPE":"'' + $(''#P149_DOCTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_ITEM":"'' + $(''#P149_ITEM'').val() + ''",'' + ',
'	  ''"_paramsP_ISSUENO":"'' + $(''#P149_ISSUENO'').val() + ''",'' + ',
'	  ''"_paramsP_ITEMSPECIFICATION":"'' + $(''#P149_ITEMSPECIFICATION'').val() + ''",'' + ',
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
'',
'',
''))
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
 p_id=>wwv_flow_imp.id(482643978079623048)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--accent15:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs'
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
 p_id=>wwv_flow_imp.id(601429680349145904)
,p_plug_name=>'Issue Return List'
,p_static_id=>'issue-return-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.TNO,',
'       GETCOMPANYNAME(A.COMPANYCODE) As Company,',
'       A.FINANCIALYEARCODE,',
'       GETLOCATIONNAME(A.LOCATIONCODE) As Location,',
'       GetDoctypeName(A.DOCTYPECODE) As Doctype,',
'       A.ISSUERETURNNO,',
'       A.ISSUERETURNDATE,',
'       A.ISSUETNO,',
'       GetDEPARTMENTName(A.DEPARTMENTCODE) As Department,',
'       GetEMPLOYEEName(A.EMPLOYEECODE) As Employee,',
'       GetPartyName(A.PARTYCODE) As PartyName,',
'       A.WORKORDERTNO,',
'       GETJOBORDERNO(A.JOBORDERTNO) As JobOrderNo,',
'       A.REMARK,',
'       A.CREATOR,',
'       A.COMMISSIONINGTNO,',
'       A.MODULECODE,',
'       A.MODULETNO,',
'       A.CREATIONTIME,',
'                 ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||A.Tno||'',''||''IssueReturn''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" t'
||'itle="Action"></span</span></a>'' AS Print',
'',
'  from ISSUERETURN A, IssuereturnDetail b, Department r',
'  WHERE a.tno = b.tno',
'   and a.departmentcode = r.departmentcode(+)',
'   and a.IssueReturnDate Between :P149_FROMDATE and :P149_TODATE',
'  and instr('':''||:P149_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'  and ( :P149_LOCATION IS NULL OR instr('':''||:P149_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 ) ',
'  --and instr('':''||:P149_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'  and instr('':''||:P149_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0',
'  and ( :P149_ITEM IS NULL OR instr('':''||:P149_ITEM||'':'','':''||b.ItemCode||'':'') > 0 ) ',
'  and ( :P149_ITEMSPECIFICATION IS NULL OR instr('':''||:P149_ITEMSPECIFICATION||'':'','':''||b.ItemSpecificationCode||'':'') > 0 ) ',
' -- and ( :P149_GROUP IS NULL OR instr('':''||:P149_GROUP||'':'','':''||e.ParentCode||'':'') > 0 ) ',
'  and ( :P149_DEPARTMENT IS NULL OR instr('':''||:P149_DEPARTMENT||'':'','':''||r.DepartmentCode||'':'') > 0 ) ',
'  and ( :P149_ISSUENO IS NULL OR instr('':''||:P149_ISSUENO||'':'','':''||A.IssueTno||'':'') > 0 ) ',
'',
'',
'  Order By A.TNO'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Issue Return List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(601429844188145904)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:150:&APP_SESSION.::&DEBUG.:RP:P150_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>161043498937219380
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601436199787145935)
,p_db_column_name=>'COMMISSIONINGTNO'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Commissioning Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601984334509201150)
,p_db_column_name=>'COMPANY'
,p_display_order=>29
,p_column_identifier=>'T'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601437361344145936)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Creation Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601435842395145935)
,p_db_column_name=>'CREATOR'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601984601284201153)
,p_db_column_name=>'DEPARTMENT'
,p_display_order=>59
,p_column_identifier=>'W'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601984539344201152)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>49
,p_column_identifier=>'V'
,p_column_label=>'Doctype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601984714681201154)
,p_db_column_name=>'EMPLOYEE'
,p_display_order=>69
,p_column_identifier=>'X'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601431033463145932)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Financial Year Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601432624269145933)
,p_db_column_name=>'ISSUERETURNDATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Issue Return Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601432212426145933)
,p_db_column_name=>'ISSUERETURNNO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Issue Return No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601432951492145933)
,p_db_column_name=>'ISSUETNO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Issue Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601985066290201158)
,p_db_column_name=>'JOBORDERNO'
,p_display_order=>89
,p_column_identifier=>'Z'
,p_column_label=>'Job Order No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601984444338201151)
,p_db_column_name=>'LOCATION'
,p_display_order=>39
,p_column_identifier=>'U'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601436590003145936)
,p_db_column_name=>'MODULECODE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Module Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601436957907145936)
,p_db_column_name=>'MODULETNO'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Module Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601985035645201157)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>79
,p_column_identifier=>'Y'
,p_column_label=>'PartyName'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(291366704618173270)
,p_db_column_name=>'PRINT'
,p_display_order=>99
,p_column_identifier=>'AA'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601435381644145935)
,p_db_column_name=>'REMARK'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601430180736145923)
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
 p_id=>wwv_flow_imp.id(601434559303145934)
,p_db_column_name=>'WORKORDERTNO'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Work Order Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(601978925018161654)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1615926'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:COMPANY:FINANCIALYEARCODE:DOCTYPE:LOCATION:ISSUERETURNNO:ISSUERETURNDATE:ISSUETNO:PARTYNAME:DEPARTMENT:EMPLOYEE:JOBORDERNO:WORKORDERTNO:REMARK:CREATOR:COMMISSIONINGTNO:MODULECODE:MODULETNO:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(601437852319145936)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(601429680349145904)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:150:&APP_SESSION.::&DEBUG.:150::'
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
 p_id=>wwv_flow_imp.id(601439234129162455)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(601429680349145904)
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
 p_id=>wwv_flow_imp.id(612229342477572299)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(601429680349145904)
,p_button_name=>'PDF'
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
 p_id=>wwv_flow_imp.id(453160112416281413)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(482643978079623048)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(461565754988668053)
,p_name=>'P149_BIREPORTURL'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(482643978079623048)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471635858989763700)
,p_name=>'P149_COMPANY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(482643978079623048)
,p_prompt=>'Company'
,p_placeholder=>'Enter Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = getmodulecodeforpageno(:APP_page_ID)',
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
 p_id=>wwv_flow_imp.id(471696100277113750)
,p_name=>'P149_DEPARTMENT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(482643978079623048)
,p_prompt=>'Department'
,p_placeholder=>'Department List'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select  d.DepartmentName d,',
'        d.DepartmentCode r',
'From Department d',
''))
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(471696515852113750)
,p_name=>'P149_DOCTYPE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(482643978079623048)
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
'  and a.ModuleCode = getmodulecodeforpageno(:APP_PAGE_ID)',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
';'))
,p_lov_cascade_parent_items=>'P149_COMPANY'
,p_ajax_items_to_submit=>'P149_DEPARTMENT'
,p_ajax_optimize_refresh=>'Y'
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
 p_id=>wwv_flow_imp.id(521389500889961695)
,p_name=>'P149_EQUIPMENT'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(482643978079623048)
,p_prompt=>'Equipment Group'
,p_placeholder=>'Material Description'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'        Distinct',
'        ee.EquipmentGroupName as d,',
'        ee.EquipmentGroupCode as r',
'From IssueCostCentreDetail d,Equipment e, EquipmentGroup ee',
'Where d.CostCentreCode = e.CostCentreCode(+) ',
'and e.EquipmentGroupCode = ee.EquipmentGroupCode(+)'))
,p_cSize=>75
,p_colspan=>8
,p_grid_label_column_span=>1
,p_display_when_type=>'NEVER'
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
 p_id=>wwv_flow_imp.id(471694901266113747)
,p_name=>'P149_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(482643978079623048)
,p_item_default=>'Trunc(sysdate) -7'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>45
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471698136634113751)
,p_name=>'P149_ISSUENO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(482643978079623048)
,p_prompt=>'IssueNo'
,p_placeholder=>'Enter Issue No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select IssueNo , tno',
'From Issue ',
'Where tno in ( select issuetno from issuereturn)',
'Order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P149_LOCATION'
,p_ajax_items_to_submit=>'P149_ISSUENO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>29
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
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
 p_id=>wwv_flow_imp.id(471697702321113750)
,p_name=>'P149_ITEM'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(482643978079623048)
,p_prompt=>'Material'
,p_placeholder=>'Material '
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'        Distinct',
'        e.ItemName||'' ( ''||e.ItemCode||'' )'' as d,',
'        e.ItemCode r',
'From IssueDetail a, Item e',
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
 p_id=>wwv_flow_imp.id(471698527916113751)
,p_name=>'P149_ITEMSPECIFICATION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(482643978079623048)
,p_prompt=>'Specification'
,p_placeholder=>'Material Description'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'        Distinct',
'        ee.ItemSpecificationName as d,',
'        ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.TNo = ee.TNo',
'  and e.ItemCode = :P149_ITEM'))
,p_lov_cascade_parent_items=>'P149_ITEM'
,p_ajax_items_to_submit=>'P149_ITEMSPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>75
,p_colspan=>8
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
 p_id=>wwv_flow_imp.id(471695688876113749)
,p_name=>'P149_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(482643978079623048)
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
'  and a.ModuleCode = getmodulecodeforpageno(:APP_PAGE_ID)',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'',
'Order BY 1',
';',
''))
,p_lov_cascade_parent_items=>'P149_COMPANY'
,p_ajax_items_to_submit=>'P149_LOCATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(491566239301488525)
,p_name=>'P149_PROJECT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(482643978079623048)
,p_prompt=>'Project'
,p_placeholder=>'Select Project Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select A.PROJECTNAME,A.TNO',
'  From Project A',
' Where A.CompanyCode = :P149_Company',
'   And getdocumentstatuscode(''PROJECT'', A.TNO) = ''ACTIVE''',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select Project'
,p_lov_cascade_parent_items=>'P149_COMPANY'
,p_ajax_items_to_submit=>'P149_COMPANY'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_display_when_type=>'NEVER'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
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
 p_id=>wwv_flow_imp.id(471695297047113749)
,p_name=>'P149_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(482643978079623048)
,p_item_default=>'Trunc(sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>45
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(612229412193572300)
,p_name=>'GeneratePDF'
,p_static_id=>'generatepdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(612229342477572299)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(612229483504572301)
,p_event_id=>wwv_flow_imp.id(612229412193572300)
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
