declare
 css varchar2(32767):=q'~.mr-hub h1{font-size:28px;margin:0 0 8px}.mr-hub p{color:#64748b;margin:0 0 20px}.mr-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:16px;margin-bottom:24px}.mr-card{display:flex;flex-direction:column;gap:8px;padding:22px;border:1px solid #dbe2f4;border-radius:16px;background:#fff;text-decoration:none}.mr-card strong{font-size:18px;color:#172033}.mr-card span{color:#64748b;font-size:14px}.mr-card:hover{border-color:#6155d9}.mr-report-intro{margin-bottom:12px;color:#64748b}.mr-report-intro a{margin-right:20px}@media(max-width:1000px){.mr-grid{grid-template-columns:repeat(2,minmax(0,1fr))}}@media(max-width:600px){.mr-grid{grid-template-columns:1fr}}~';
 procedure page(p number,title varchar2,alias_name varchar2) is
 begin
 wwv_flow_imp_page.create_page(p_id=>p,p_name=>title,p_alias=>alias_name,p_step_title=>title,
 p_autocomplete_on_off=>'OFF',p_inline_css=>css,p_step_template=>4072355960268175073,
 p_page_template_options=>'#DEFAULT#',p_protection_level=>'C',p_page_component_map=>'18');
 end;
 procedure report(p number,title varchar2,alias_name varchar2,report_mode varchar2) is
 rid number:=2026100100000000+p*100; wid number:=rid+10;
 procedure col(n number,name varchar2,label varchar2,typ varchar2) is
 begin
 wwv_flow_imp_page.create_worksheet_column(p_id=>wwv_flow_imp.id(wid+n),p_db_column_name=>name,
 p_display_order=>n*10,p_column_identifier=>chr(64+n),p_column_label=>label,p_column_type=>typ,
 p_heading_alignment=>'LEFT',p_use_as_row_header=>'N',p_available_clientside=>'N');
 end;
 begin
 page(p,title,alias_name);
 wwv_flow_imp_page.create_page_plug(p_id=>wwv_flow_imp.id(rid+1),p_plug_name=>'Report selection',p_static_id=>'mr-selection',
 p_plug_template=>3371237801798025892,p_region_template_options=>'#DEFAULT#:t-Region--noUI',p_plug_item_display_point=>'ABOVE',
 p_plug_display_sequence=>10,p_plug_source_type=>'NATIVE_PLSQL',p_plug_source=>q'~begin htp.p('<div class="mr-report-intro"><a href="'||apex_escape.html_attribute(apex_page.get_url(p_page=>942))||'">All master reports</a>Select a master, then use Apply. Results follow your current company, location and module access.</div>'); end;~');
 if report_mode not in ('OVERVIEW','ACCESS') then
 wwv_flow_imp_page.create_page_item(p_id=>wwv_flow_imp.id(rid+2),p_name=>'P'||p||'_MASTER',p_item_sequence=>10,
 p_item_plug_id=>wwv_flow_imp.id(rid+1),p_prompt=>'Master',p_display_as=>'NATIVE_SELECT_LIST',
 p_lov=>'select master_name || '' — '' || master_group d,module_code r from imart_mr_catalog where imart_master_reports.allowed(module_code)=1 order by master_group,master_name',
 p_lov_display_null=>'YES',p_lov_null_text=>'Select a master',p_cSize=>40,p_field_template=>3031561666792084173,
 p_item_template_options=>'#DEFAULT#',p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('page_action_on_selection','NONE')).to_clob);
 end if;
 if report_mode='CHANGES' then
 wwv_flow_imp_page.create_page_item(p_id=>wwv_flow_imp.id(rid+3),p_name=>'P'||p||'_DAYS',p_item_sequence=>20,
 p_item_plug_id=>wwv_flow_imp.id(rid+1),p_prompt=>'Last days',p_display_as=>'NATIVE_SELECT_LIST',
 p_lov=>'STATIC:30 days;30,90 days;90,1 year;365',p_item_default=>'select 90 from dual',p_item_default_type=>'SQL_QUERY',
 p_cSize=>20,p_begin_on_new_line=>'N',p_field_template=>3031561666792084173,
 p_item_template_options=>'#DEFAULT#',p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('page_action_on_selection','NONE')).to_clob);
 end if;
 if report_mode not in ('OVERVIEW','ACCESS') then
 wwv_flow_imp_page.create_page_button(p_id=>wwv_flow_imp.id(rid+4),p_button_sequence=>30,
 p_button_plug_id=>wwv_flow_imp.id(rid+1),p_button_name=>'APPLY',p_button_action=>'SUBMIT',
 p_button_template_options=>'#DEFAULT#',p_button_template_id=>2349107722467437027,p_button_is_hot=>'Y',
 p_button_image_alt=>'Apply',p_button_position=>'BELOW_BOX');
 end if;
 wwv_flow_imp_page.create_page_plug(p_id=>wwv_flow_imp.id(rid),p_plug_name=>title,p_static_id=>'mr-results',
 p_region_template_options=>'#DEFAULT#',p_plug_template=>2102002977963900996,
 p_plug_display_sequence=>20,p_query_type=>'SQL',p_plug_source_type=>'NATIVE_IR',
 p_plug_source=>'select * from table(imart_master_reports.report_rows('''||report_mode||''','||
 case when report_mode in ('OVERVIEW','ACCESS') then 'null' else ':P'||p||'_MASTER' end||','||
 case when report_mode='CHANGES' then ':P'||p||'_DAYS' else '90' end||'))',p_ai_enabled=>false);
 wwv_flow_imp_page.create_worksheet(p_id=>wwv_flow_imp.id(wid),p_max_row_count=>'100000',
 p_no_data_found_message=>case when report_mode in ('OVERVIEW','ACCESS') then 'No authorized records available.' else 'Select a master and Apply. No rows means no matching records within the displayed scope and coverage.' end,
 p_allow_save_rpt_public=>'N',p_pagination_type=>'ROWS_X_TO_Y',p_pagination_display_pos=>'BOTTOM_RIGHT',
 p_show_display_row_count=>'Y',p_report_list_mode=>'TABS',p_lazy_loading=>false,
 p_show_detail_link=>'C',p_detail_link=>'#RECORD_URL#',p_detail_link_text=>'Open',
 p_show_rows_per_page=>'Y',p_download_formats=>'CSV:HTML:XLSX:PDF',p_enable_mail_download=>'N',p_internal_uid=>wid);
 col(1,'MASTER_NAME','Master','STRING'); col(2,'RECORD_CODE','Code','STRING');
 col(3,'RECORD_NAME',case when report_mode='OVERVIEW' then 'Master group' else 'Name' end,'STRING');
 col(4,'RECORD_STATUS','Status / View access','STRING');col(5,'CHECK_NAME','Check / Module','STRING');
 col(6,'DETAILS','Details / Coverage','STRING');col(7,'LAST_CHANGED','Latest recorded date','DATE');
 col(8,'LINKED_ROWS',case when report_mode='OVERVIEW' then 'Master records' else 'Linked rows' end,'NUMBER');
 col(9,'RECORD_URL','Record URL','STRING');
 wwv_flow_imp_page.create_worksheet_rpt(p_id=>wwv_flow_imp.id(wid+20),p_application_user=>'APXWS_DEFAULT',
 p_report_seq=>10,p_report_alias=>to_char(p)||'01',p_status=>'PUBLIC',p_is_default=>'Y',p_display_rows=>25,
 p_report_columns=>'MASTER_NAME:RECORD_CODE:RECORD_NAME:RECORD_STATUS:CHECK_NAME:DETAILS:LAST_CHANGED:LINKED_ROWS');
 end;
begin
 wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',
 p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>0,p_default_owner=>'IMART');
 page(942,'Master Intelligence Reports','MASTER-INTELLIGENCE-REPORTS');
 wwv_flow_imp_page.create_page_plug(p_id=>wwv_flow_imp.id(2026100100942000),p_plug_name=>'Master Intelligence Reports',
 p_static_id=>'mr-hub',p_plug_template=>3371237801798025892,p_region_template_options=>'#DEFAULT#:t-Region--noUI',
 p_plug_display_sequence=>10,p_plug_source_type=>'NATIVE_PLSQL',p_plug_source=>'begin imart_master_reports.render_hub; end;');
 report(943,'Master Overview','MASTER-OVERVIEW','OVERVIEW');
 report(944,'Master Data Completeness','MASTER-DATA-COMPLETENESS','QUALITY');
 report(945,'Master Duplicate Review','MASTER-DUPLICATE-REVIEW','DUPLICATES');
 report(946,'Master Usage','MASTER-USAGE','USAGE');
 report(947,'Unused Masters','UNUSED-MASTERS','UNUSED');
 report(948,'Recent Master Changes','RECENT-MASTER-CHANGES','CHANGES');
 report(949,'Master Mapping Exceptions','MASTER-MAPPING-EXCEPTIONS','MAPPINGS');
 report(950,'Master User Access Matrix','MASTER-USER-ACCESS-MATRIX','ACCESS');
 wwv_flow_imp_shared.create_list_item(p_id=>wwv_flow_imp.id(2026100100950000),p_list_id=>441488469590062652,
 p_list_item_display_sequence=>25,p_list_item_link_text=>'Master Reports',
 p_list_item_link_target=>'f?p=&APP_ID.:942:&APP_SESSION.::&DEBUG.:::',
 p_list_item_icon=>'fa-table',p_list_item_current_type=>'TARGET_PAGE');
 wwv_flow_imp.component_end;
end;
/
