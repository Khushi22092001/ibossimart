prompt --application/pages/page_00135
begin
--   Manifest
--     PAGE: 00135
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
 p_id=>135
,p_name=>'User Privilege'
,p_alias=>'USER-PRIVILEGE'
,p_step_title=>'User Privilege'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}',
'',
'/* User Privilege drill-down links: the legacy columns carry both the',
'   simple and hot button classes. Keep them readable and visually aligned',
'   with the application''s outlined action buttons. */',
'html.page-135 body:not(.t-PageBody--login) #user-privilege .a-IRR-table a.t-Button.t-Button--simple.t-Button--hot {',
'  display:inline-flex!important;',
'  align-items:center!important;',
'  justify-content:center!important;',
'  min-height:40px!important;',
'  padding:0 14px!important;',
'  border:1px solid #d7e1f0!important;',
'  border-radius:9px!important;',
'  background:#fff!important;',
'  color:#2856d8!important;',
'  box-shadow:none!important;',
'  font-weight:600!important;',
'  text-decoration:none!important;',
'}',
'html.page-135 body:not(.t-PageBody--login) #user-privilege .a-IRR-table a.t-Button.t-Button--simple.t-Button--hot:hover,',
'html.page-135 body:not(.t-PageBody--login) #user-privilege .a-IRR-table a.t-Button.t-Button--simple.t-Button--hot:focus-visible {',
'  border-color:#9db4ef!important;',
'  background:#eef3ff!important;',
'  color:#1f4ed8!important;',
'  box-shadow:0 3px 9px rgba(40,86,216,.12)!important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(766301275886722327)
,p_plug_name=>'Parameters'
,p_static_id=>'parameters'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:is-collapsed:t-Region--accent15:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(767222192226705086)
,p_plug_name=>'User Privilege'
,p_static_id=>'user-privilege'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select A.TNO,',
'       a.ModuleCode,',
'       B.ModuleName,',
'       C.Modulegroupname,',
'       d.Moduletypename,',
'       e.moduletypeName As ModuleSubType,',
'       f.BossUserName,',
'	 a.viewprivilege,',
'	 a.insertprivilege,',
'	 a.updateprivilege,',
'	 a.deleteprivilege,',
'	 a.statusprivilege,',
'	 a.updatedays,',
'	 a.otherprivilege,',
'	 a.voucherpostingdate,',
'	 a.controlprivilege,',
'	 a.allowedbackdays,',
'	 a.allowedforwarddays,',
'     ''Location'' as Location,',
'     ''DocType'' as DocType,',
'     ''Department'' as Department,',
'     ''Account'' as Account,',
'     ''Item'' as Item,',
'     ''Extra'' as Extra,',
'     ''StorageLocation'' as StorageLocation,',
'     ''ItemNature'' as ItemNature,',
'     ''Branch'' as Branch',
'  From Moduleprivilege a, Module B, Modulegroup C, ModuleType D, ModuleType E, Bossuser F',
' Where a.Modulecode = b.Modulecode(+)',
'   And a.Bossusercode = f.Bossusercode',
'   And B.Modulegroupcode = C.Modulegroupcode(+)',
'   And B.ModuleTypeCode = D.Moduletypecode(+)',
'   And B.ModuleSubTypeCode = E.ModuleTypeCode(+)',
'   And ( :P135_USER IS NULL OR A.BossUserCode = :P135_USER ) ',
'   and ( :P135_MODULE IS NULL OR instr('':''||:P135_MODULE||'':'','':''||A.ModuleCode||'':'') > 0 ) ',
'--   and ( :P135_MODULE IS NULL OR A.ModuleCode = :P135_MODULE ) ',
'   and ( :P135_MODULEGROUP IS NULL OR instr('':''||:P135_MODULEGROUP||'':'','':''||C.ModuleGroupCode||'':'') > 0 ) ',
'   and ( :P135_MODULETYPE IS NULL OR instr('':''||:P135_MODULETYPE||'':'','':''||D.ModuleTypeCode||'':'') > 0 )',
'  and ( :P135_MODULESUBTYPE IS NULL OR instr('':''||:P135_MODULESUBTYPE||'':'','':''||E.ModuleTypeCode||'':'') > 0 )',
'   and a.companycode = :global_companycode',
'   and ( nvl(b.pageno,''1'') != 1 OR A.MODULECODE = ''ACTION'' )  ',
'  Order By 2',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P135_USER,P135_MODULE,P135_MODULEGROUP,P135_MODULETYPE,P135_MODULESUBTYPE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'User Privilege'
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
 p_id=>wwv_flow_imp.id(767307506862533712)
,p_max_row_count=>'1000000'
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
,p_detail_link=>'f?p=&APP_ID.:136:&SESSION.::&DEBUG.:136:P136_TNO:#TNO#'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>326921161611607188
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767309927685533736)
,p_db_column_name=>'ACCOUNT'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Account'
,p_column_link=>'f?p=&APP_ID.:235:&SESSION.::&DEBUG.::P235_TNO:#TNO#'
,p_column_linktext=>'#ACCOUNT#'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--stretch"'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767309126391533728)
,p_db_column_name=>'ALLOWEDBACKDAYS'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Allowed Back Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767309227921533729)
,p_db_column_name=>'ALLOWEDFORWARDDAYS'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Allowed Forward Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767308169776533718)
,p_db_column_name=>'BOSSUSERNAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'User Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767310435342533741)
,p_db_column_name=>'BRANCH'
,p_display_order=>280
,p_column_identifier=>'AA'
,p_column_label=>'Branch'
,p_column_link=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:33:P33_TNO:\#TNO#\'
,p_column_linktext=>'#BRANCH#'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--stretch"'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767309012020533727)
,p_db_column_name=>'CONTROLPRIVILEGE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Control'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767308553842533722)
,p_db_column_name=>'DELETEPRIVILEGE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Delete'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767309883981533735)
,p_db_column_name=>'DEPARTMENT'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Department'
,p_column_link=>'f?p=&APP_ID.:234:&SESSION.::&DEBUG.::P234_TNO:#TNO#'
,p_column_linktext=>'#DEPARTMENT#'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--stretch"'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767309771375533734)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Doctype'
,p_column_link=>'f?p=&APP_ID.:237:&SESSION.::&DEBUG.::P237_TNO:#TNO#'
,p_column_linktext=>'#DOCTYPE#'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--stretch"'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767561460707411531)
,p_db_column_name=>'EXTRA'
,p_display_order=>260
,p_column_identifier=>'AB'
,p_column_label=>'Extra'
,p_column_link=>'f?p=&APP_ID.:240:&SESSION.::&DEBUG.::P240_TNO:#TNO#'
,p_column_linktext=>'#EXTRA#'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--stretch"'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767308308143533720)
,p_db_column_name=>'INSERTPRIVILEGE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Insert'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767310002918533737)
,p_db_column_name=>'ITEM'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Item'
,p_column_link=>'f?p=&APP_ID.:238:&SESSION.::&DEBUG.::P238_TNO:#TNO#'
,p_column_linktext=>'#ITEM#'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--stretch"'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767310339256533740)
,p_db_column_name=>'ITEMNATURE'
,p_display_order=>270
,p_column_identifier=>'Z'
,p_column_label=>'Itemnature'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767309682470533733)
,p_db_column_name=>'LOCATION'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Location'
,p_column_link=>'f?p=&APP_ID.:232:&SESSION.::&DEBUG.::P232_TNO:#TNO#'
,p_column_linktext=>'#LOCATION#'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--stretch"'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767307660153533713)
,p_db_column_name=>'MODULECODE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Module Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767307873811533715)
,p_db_column_name=>'MODULEGROUPNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Module Group Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767307717636533714)
,p_db_column_name=>'MODULENAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Module Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767308000005533717)
,p_db_column_name=>'MODULESUBTYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Module Sub Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767307980692533716)
,p_db_column_name=>'MODULETYPENAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Module Type Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767308830890533725)
,p_db_column_name=>'OTHERPRIVILEGE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Other'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767308626485533723)
,p_db_column_name=>'STATUSPRIVILEGE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767310275784533739)
,p_db_column_name=>'STORAGELOCATION'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Storagelocation'
,p_column_link=>'f?p=&APP_ID.:239:&SESSION.::&DEBUG.:18:P239_TNO:#TNO#'
,p_column_linktext=>'#STORAGELOCATION#'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--stretch"'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767309362877533730)
,p_db_column_name=>'TNO'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767308762901533724)
,p_db_column_name=>'UPDATEDAYS'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Update Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767308438725533721)
,p_db_column_name=>'UPDATEPRIVILEGE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Update'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767308186711533719)
,p_db_column_name=>'VIEWPRIVILEGE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'View'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(767308908212533726)
,p_db_column_name=>'VOUCHERPOSTINGDATE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Voucher Posting Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(767364664641720756)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'52750'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MODULENAME:MODULEGROUPNAME:BOSSUSERNAME:LOCATION:DEPARTMENT:ACCOUNT:DOCTYPE:ITEM:STORAGELOCATION:VIEWPRIVILEGE:INSERTPRIVILEGE:UPDATEPRIVILEGE:DELETEPRIVILEGE:STATUSPRIVILEGE:UPDATEDAYS:OTHERPRIVILEGE:VOUCHERPOSTINGDATE:CONTROLPRIVILEGE:ALLOWEDBACKDA'
||'YS:ALLOWEDFORWARDDAYS'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(499139818276156442)
,p_report_id=>wwv_flow_imp.id(767364664641720756)
,p_static_id=>'ir-condition'
,p_name=>'CONTROL'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CONTROLPRIVILEGE'
,p_operator=>'='
,p_expr=>'YES'
,p_condition_sql=>' (case when ("CONTROLPRIVILEGE" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''YES''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#7df791'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(499140245748156442)
,p_report_id=>wwv_flow_imp.id(767364664641720756)
,p_static_id=>'ir-condition-2'
,p_name=>'DELETE'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'DELETEPRIVILEGE'
,p_operator=>'='
,p_expr=>'YES'
,p_condition_sql=>' (case when ("DELETEPRIVILEGE" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''YES''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#7df791'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(499140664265156442)
,p_report_id=>wwv_flow_imp.id(767364664641720756)
,p_static_id=>'ir-condition-3'
,p_name=>'INSERT'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'INSERTPRIVILEGE'
,p_operator=>'='
,p_expr=>'YES'
,p_condition_sql=>' (case when ("INSERTPRIVILEGE" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''YES''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#7df791'
,p_column_font_color=>'#000000'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(499141019449156442)
,p_report_id=>wwv_flow_imp.id(767364664641720756)
,p_static_id=>'ir-condition-4'
,p_name=>'OTHER'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'OTHERPRIVILEGE'
,p_operator=>'='
,p_expr=>'YES'
,p_condition_sql=>' (case when ("OTHERPRIVILEGE" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''YES''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#7df791'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(499141438146156444)
,p_report_id=>wwv_flow_imp.id(767364664641720756)
,p_static_id=>'ir-condition-5'
,p_name=>'STATUS'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'STATUSPRIVILEGE'
,p_operator=>'='
,p_expr=>'YES'
,p_condition_sql=>' (case when ("STATUSPRIVILEGE" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''YES''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#7df791'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(499141859945156444)
,p_report_id=>wwv_flow_imp.id(767364664641720756)
,p_static_id=>'ir-condition-6'
,p_name=>'UPDATE'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'UPDATEPRIVILEGE'
,p_operator=>'='
,p_expr=>'YES'
,p_condition_sql=>' (case when ("UPDATEPRIVILEGE" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''YES''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#7df791'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(499142265932156444)
,p_report_id=>wwv_flow_imp.id(767364664641720756)
,p_static_id=>'ir-condition-7'
,p_name=>'VIEW'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'VIEWPRIVILEGE'
,p_operator=>'='
,p_expr=>'YES'
,p_condition_sql=>' (case when ("VIEWPRIVILEGE" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''YES''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#7df791'
,p_column_font_color=>'#000000'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(218327179254845698)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(767222192226705086)
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
 p_id=>wwv_flow_imp.id(595424713645633894)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(766301275886722327)
,p_button_name=>'New'
,p_static_id=>'new'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(766303368342722335)
,p_name=>'P135_MODULE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(766301275886722327)
,p_prompt=>'Module'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select modulename,modulecode from module a ',
'where  (nvl(a.pageno, ''1'') != 1 Or a.MODULECODE = ''ACTION'')',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select -'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(766303504443722336)
,p_name=>'P135_MODULEGROUP'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(766301275886722327)
,p_prompt=>'Module Group'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct a.modulegroupname d, a.modulegroupcode r',
'  From ModuleGroup a, Module b',
' Where a.ModuleGroupCode = b.ModuleGroupCode',
'   And (nvl(b.pageno, ''1'') != 1 Or b.MODULECODE = ''ACTION'')',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(766303678721722338)
,p_name=>'P135_MODULESUBTYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(766301275886722327)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(766303594719722337)
,p_name=>'P135_MODULETYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(766301275886722327)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(766303307104722334)
,p_name=>'P135_USER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(766301275886722327)
,p_prompt=>'User'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'SELECT BOSSUSERNAME D, BOSSUSERCODE R FROM BOSSUSER ORDER BY 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Select --'
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(445914186132617189)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(445914342290617190)
,p_event_id=>wwv_flow_imp.id(445914186132617189)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(595439322513633922)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(595424713645633894)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595439836217633922)
,p_event_id=>wwv_flow_imp.id(595439322513633922)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(767222192226705086)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
