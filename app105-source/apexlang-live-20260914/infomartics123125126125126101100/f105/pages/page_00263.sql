prompt --application/pages/page_00263
begin
--   Manifest
--     PAGE: 00263
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
 p_id=>263
,p_name=>'Module Flow List'
,p_alias=>'MODULE-FLOW-LIST'
,p_step_title=>'Module Flow List'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(441329530252851779)
,p_plug_name=>'Module Flow'
,p_static_id=>'module-flow'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select a.TNo,',
'       a.ModuleFlowNo,',
'       f.ModuleFlowNo as "On Module Flow No",',
'       b.ModuleName,',
'       c.DocumentStatusName,',
'       e.BossUserName,',
'       d.updateprivilege,',
'       d.onlyifcreator,',
'       substr(getDocumentStatusCode(''MODULEFLOW'', a.TNO), 1, 100) As ModuleFlowStatus,',
'       getmoduleflowcondition(a.tno) as Condition ',
'  From ModuleFlow     a,',
'       Module         b,',
'       DocumentStatus c,',
'       ModuleFlowUser d,',
'       BossUser       e,',
'       ModuleFlow     f',
' Where a.ModuleCode = b.ModuleCode',
'   And a.DocumentStatusCode = c.DocumentStatusCode(+)',
'   And a.TNo = d.TNo(+)',
'   and a.ONPASSINGOFMODULEFLOWTNO= f.tno(+)',
'   And d.BossUserCode = e.BossUserCode(+)',
' Order By b.ModuleName, a.ModuleFlowNo',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Module Flow'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(441329628401851779)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:264:&SESSION.::&DEBUG.:RP,:P264_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_condition_type=>'EXISTS'
,p_detail_link_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1',
'  From module a, moduleprivilege b, bossuser c',
' Where a.modulecode = b.modulecode',
'   And b.bossusercode = c.bossusercode',
'   And c.loginname = :GLOBAL_LOGINNAME',
'   And A.PAGENO = :APP_PAGE_ID',
'   --and a.modulecode=''CITY''',
'   AND B.COMPANYCODE = :GLOBAL_COMPANYCODE',
'   And B.UPDATEPRIVILEGE = ''YES'''))
,p_internal_uid=>231370433397335795
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(440286917426646449)
,p_db_column_name=>'BOSSUSERNAME'
,p_display_order=>34
,p_column_identifier=>'S'
,p_column_label=>'Boss User Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460626409163210964)
,p_db_column_name=>'CONDITION'
,p_display_order=>64
,p_column_identifier=>'V'
,p_column_label=>'Condition'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(440286811452646448)
,p_db_column_name=>'DOCUMENTSTATUSNAME'
,p_display_order=>24
,p_column_identifier=>'R'
,p_column_label=>'Document Status Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441331151249851783)
,p_db_column_name=>'MODULEFLOWNO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Module Flow No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(440286944487646450)
,p_db_column_name=>'MODULEFLOWSTATUS'
,p_display_order=>44
,p_column_identifier=>'T'
,p_column_label=>'Module Flow Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(440286706071646447)
,p_db_column_name=>'MODULENAME'
,p_display_order=>14
,p_column_identifier=>'Q'
,p_column_label=>'Module Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460626570470210966)
,p_db_column_name=>'ONLYIFCREATOR'
,p_display_order=>84
,p_column_identifier=>'X'
,p_column_label=>'Only If Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(410182950201283775)
,p_db_column_name=>'On Module Flow No'
,p_display_order=>54
,p_column_identifier=>'U'
,p_column_label=>'On Module Flow No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441330332322851783)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_column_identifier=>'B'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460626515638210965)
,p_db_column_name=>'UPDATEPRIVILEGE'
,p_display_order=>74
,p_column_identifier=>'W'
,p_column_label=>'Update Privilege'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(441395079672127360)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'583549'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MODULEFLOWNO:On Module Flow No:MODULENAME:DOCUMENTSTATUSNAME:BOSSUSERNAME:ONLYIFCREATOR:UPDATEPRIVILEGE:MODULEFLOWSTATUS:CONDITION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(296527231650050051)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(441329530252851779)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:264:&SESSION.::&DEBUG.:264::'
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
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(296528582177050054)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(441329530252851779)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(296529083196050058)
,p_event_id=>wwv_flow_imp.id(296528582177050054)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(441329530252851779)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(296529409833050061)
,p_name=>'IG Pagination'
,p_static_id=>'ig-pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(296529982195050063)
,p_event_id=>wwv_flow_imp.id(296529409833050061)
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
