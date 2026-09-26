prompt --application/pages/page_09998
begin
--   Manifest
--     PAGE: 09998
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
 p_id=>9998
,p_name=>'Search'
,p_alias=>'SEARCH'
,p_step_title=>'Search'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''input'').on(''focus'', function() {',
'$("#"+this.id+"_LABEL").css("background-color", "yellow");',
'}).on(''blur'', function() {',
'$("#"+this.id+"_LABEL").css("background-color", "white");',
'});',
'',
'$(',
'''body'').on(''keydown'', ''input, select, textarea'', function(e) {',
'    var self = $(this)',
'      , form = self.parents(''form:eq(0)'')',
'      , focusable',
'      , next',
'      ;',
'    if (e.keyCode == 13) {',
'        focusable = form.find(''input,select,textarea,tabindex'').filter('':visible'');',
'        next = focusable.eq(focusable.index(this)+1);',
'        if (next.length) {',
'            next.focus();',
'        } else {',
'            form.submit();',
'        }',
'        return false;',
'    }',
'});'))
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
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
 p_id=>wwv_flow_imp.id(830395354244928656)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Level,',
'       aa.MYBOXLABEL,',
'       ''f?p=&APP_ID.:'' || TO_CHAR(aA.PAGENO) || '':&SESSION.:::::'' target,',
'       aa.MYBOXKEY,',
'       ''YES'' As is_current,',
'       decode(nvl(ICONNAME, ''A''), ''A'', '''', ICONNAME) image',
'From (Select *',
'          From myboxtree_apex a',
'         Where A.BossUserCode = :GLOBAL_BOSSUSERCODE',
'           And A.COMPANYCODE = :GLOBAL_COMPANYCODE) AA',
'Start With aA.ParentKey = ''ROOT''',
'Connect By Prior aA.MyBoxKey = aA.ParentKey',
'Order Siblings By aA.MyBoxLabel',
'',
'/*Select MyBoxlabel, pageno, iconname ,',
'''f?p=&APP_ID.:''',
'       || TO_CHAR(a.PAGENO) ',
'       || '':&SESSION.:::::'' ',
'        target',
'  From MYBOXTREE_APEX a',
' Where username = ''LOGICBOX'' --:global_loginname',
' */'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P9998_TNO'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(830805222496769763)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'12'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_finder_drop_down=>'N'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'NONE'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>397960367054545989
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(830805838610769769)
,p_db_column_name=>'IMAGE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Image'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(830805716899769768)
,p_db_column_name=>'IS_CURRENT'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Is Current'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(830805372144769764)
,p_db_column_name=>'LEVEL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Level'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(830805665485769767)
,p_db_column_name=>'MYBOXKEY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Myboxkey'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(830805486099769765)
,p_db_column_name=>'MYBOXLABEL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Module'
,p_column_link=>'#TARGET#'
,p_column_linktext=>'#MYBOXLABEL#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(830805527899769766)
,p_db_column_name=>'TARGET'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Target'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(831353698925463579)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'51674'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LEVEL:MYBOXLABEL:TARGET:MYBOXKEY:IS_CURRENT:IMAGE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(830401931557928684)
,p_name=>'P9998_TNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(830395354244928656)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
