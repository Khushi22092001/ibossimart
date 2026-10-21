WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET SERVEROUTPUT ON
DECLARE
 c INTEGER := DBMS_SQL.OPEN_CURSOR;
 s CLOB;
BEGIN
 s := to_clob('begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>''2026.03.30''
,p_release=>''26.1.2''
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>''IMART''
);
end;
') ;
 DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE);
 DBMS_SQL.CLOSE_CURSOR(c);
 DBMS_OUTPUT.PUT_LINE('Import block 1 compiled.');
EXCEPTION WHEN OTHERS THEN
 IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF;
 RAISE;
END;
/
DECLARE
 c INTEGER := DBMS_SQL.OPEN_CURSOR;
 s CLOB;
BEGIN
 s := to_clob('begin
null;
end;
') ;
 DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE);
 DBMS_SQL.CLOSE_CURSOR(c);
 DBMS_OUTPUT.PUT_LINE('Import block 2 compiled.');
EXCEPTION WHEN OTHERS THEN
 IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF;
 RAISE;
END;
/
DECLARE
 c INTEGER := DBMS_SQL.OPEN_CURSOR;
 s CLOB;
BEGIN
 s := to_clob('begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(2026102051000001)
,p_lov_name=>''GST_UQC''
,p_lov_query=>''select UQC_CODE || '''' - '''' || DESCRIPTION as DISPLAY_VALUE, UQC_CODE from GST_UQC order by UQC_CODE''
,p_source_type=>''SQL''
,p_location=>''LOCAL''
,p_return_column_name=>''UQC_CODE''
,p_display_column_name=>''DISPLAY_VALUE''
,p_default_sort_column_name=>''UQC_CODE''
,p_default_sort_direction=>''ASC''
);
end;
') ;
 DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE);
 DBMS_SQL.CLOSE_CURSOR(c);
 DBMS_OUTPUT.PUT_LINE('Import block 3 compiled.');
EXCEPTION WHEN OTHERS THEN
 IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF;
 RAISE;
END;
/
DECLARE
 c INTEGER := DBMS_SQL.OPEN_CURSOR;
 s CLOB;
BEGIN
 s := to_clob('begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>51);
end;
') ;
 DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE);
 DBMS_SQL.CLOSE_CURSOR(c);
 DBMS_OUTPUT.PUT_LINE('Import block 4 compiled.');
EXCEPTION WHEN OTHERS THEN
 IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF;
 RAISE;
END;
/
DECLARE
 c INTEGER := DBMS_SQL.OPEN_CURSOR;
 s CLOB;
BEGIN
 s := to_clob('begin
wwv_flow_imp_page.create_page(
 p_id=>51
,p_name=>''Measuring Unit Master''
,p_alias=>''MEASURING-UNIT-MASTER''
,p_page_mode=>''MODAL''
,p_step_title=>''Measuring Unit Master''
,p_autocomplete_on_off=>''OFF''
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'''',
''<script id="hspl-sidebar-head-state">'',
''(function(d){'',
''  var state=''''closed'''';'',
''  try {'',
''    var saved=window.localStorage.getItem(''''imart.sidebar.state.v1'''');'',
''    if(saved===''''open''''||saved===''''closed'''') state=saved;'',
''  } catch(ignore) {}'',
''  d.classList.remove(state===''''open''''?''''hspl-nav-target-closed'''':''''hspl-nav-target-open'''');'',
''  d.classList.add(state===''''open''''?''''hspl-nav-target-open'''':''''hspl-nav-target-closed'''');'',
''})(document.documentElement);'',
''</script>''))
,p_javascript_file_urls=>''#APP_FILES#myfunctions#MIN#.js''
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'':root{'',
''    --a-menu-font-size: 1.25rem !important;'',
''}'',
''/* IMART_HIDE_KEYBOARD_HELP_ALL_V1 */'',
''details#hspl-keyboard-help{display:none!important}'',
''''))
,p_step_template=>2100407606326202693
,p_page_template_options=>''#DEFAULT#''
,p_dialog_chained=>''N''
,p_protection_level=>''C''
,p_page_component_map=>''02''
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(579861159404746480)
,p_plug_name=>''Buttons''
,p_static_id=>''buttons''
,p_region_template_options=>''#DEFAULT#''
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>''REGION_POSITION_03''
,p_plug_item_display_point=>''ABOVE''
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''output_as'', ''TEXT'',
  ''show_line_breaks'', ''Y'')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1129272710209743263)
,p_plug_name=>''Fields''
,p_static_id=>''fields''
,p_plug_display_sequence=>30
,p_plug_item_display_point=>''ABOVE''
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''expand_shortcuts'', ''N'',
  ''output_as'', ''HTML'')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(579850955118746468)
,p_plug_name=>''Measuring Unit Master''
,p_static_id=>''measuring-unit-master''
,p_region_template_options=>''#DEFAULT#''
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_item_display_point=>''ABOVE''
,p_query_type=>''SQL''
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
''select TNO,'',
''       MEASURINGUNITCODE,'',
''       MEASURINGUNITNAME,'',
''       DECIMALPLACE,'',
''       DATECRATED,'',
''       DATEMODIFY,'',
''       ISWEIGHMENTREQUIRED,'',
''       DIVISORFACTOR,'',
''       MULTIPLYINGFACTOR,'',
''       GSTUQCCODE,'',
''       FORMANPOWER,'',
''       REMARK,'',
''       CREATIONTIME,'',
''       CREATOR'',
''  from MEASURINGUNIT''))
,p_is_editable=>true
,p_edit_operations=>''i:u:d''
,p_lost_update_check_type=>''VALUES''
,p_plug_source_type=>''NATIVE_FORM''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579861629890746481)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''CANCEL''
,p_static_id=>''cancel''
,p_button_action=>''DEFINED_BY_DA''
,p_button_template_options=>''#DEFAULT#:t-Button--warning:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Cancel''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>''fa-arrow-circle-o-left''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579863769816746481)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''CREATE''
,p_static_id=>''create''
,p_button_action=>''SUBMIT''
,p_button_template_options=>''#DEFAULT#:t-Button--success:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Create''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_condition=>''P51_FORMSTATUS''
,p_button_condition2=>''NEWRECORD''
,p_button_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_icon_css_classes=>''fa-save''
,p_database_action=>''INSERT''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579863010836746481)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''DELETE''
,p_static_id=>''delete''
,p_button_action=>''SUBMIT''
,p_button_template_options=>''#DEFAULT#:t-Button--danger:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Delete''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_execute_validations=>''N''
,p_confirm_message=>''&APP_TEXT$DELETE_MSG!RAW.''
,p_confirm_style=>''danger''
,p_button_condition=>''P51_FORMSTATUS''
,p_button_condition2=>''EDITRECORD''
,p_button_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_icon_css_classes=>''fa-trash-o''
,p_database_action=>''DELETE''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579885235006818278)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''Fail''
,p_static_id=>''fail''
,p_button_action=>''REDIRECT_PAGE''
,p_button_template_options=>''#DEFAULT#:t-Button--danger:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Fail''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_redirect_url=>''f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::''
,p_button_condition=>''P51_FORMSTATUS''
,p_button_condition2=>''EDITRECORD''
,p_button_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_icon_css_classes=>''fa-thumbs-o-down''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579885501433819804)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''Flow''
,p_static_id=>''flow''
,p_button_action=>''REDIRECT_PAGE''
,p_button_template_options=>''#DEFAULT#:t-Button--primary:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Flow''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_redirect_url=>''f?p=&APP_ID.:16') ||
to_clob('2:&SESSION.::&DEBUG.:162:P162_TNO:&P2_TNO1.''
,p_button_condition=>''P51_FORMSTATUS''
,p_button_condition2=>''EDITRECORD''
,p_button_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_icon_css_classes=>''fa-workflow''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579884895332816988)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''Pass''
,p_static_id=>''pass''
,p_button_action=>''REDIRECT_PAGE''
,p_button_template_options=>''#DEFAULT#:t-Button--success:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Pass''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_redirect_url=>''f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::''
,p_button_condition=>''P51_FORMSTATUS''
,p_button_condition2=>''EDITRECORD''
,p_button_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_icon_css_classes=>''fa-thumbs-o-up''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579886121727823296)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''Print''
,p_static_id=>''print''
,p_button_action=>''SUBMIT''
,p_button_template_options=>''#DEFAULT#:t-Button--primary:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Print''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_condition=>''P51_FORMSTATUS''
,p_button_condition2=>''EDITRECORD''
,p_button_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_icon_css_classes=>''fa-print''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579863381933746481)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''SAVE''
,p_static_id=>''save''
,p_button_action=>''SUBMIT''
,p_button_template_options=>''#DEFAULT#:t-Button--success:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Apply Changes''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_condition=>''P51_FORMSTATUS''
,p_button_condition2=>''EDITRECORD''
,p_button_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_icon_css_classes=>''fa-save-as''
,p_database_action=>''UPDATE''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579885787635821554)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''Status''
,p_static_id=>''status''
,p_button_action=>''REDIRECT_PAGE''
,p_button_template_options=>''#DEFAULT#:t-Button--warning:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Status''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_redirect_url=>''f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::''
,p_button_condition=>''P51_FORMSTATUS''
,p_button_condition2=>''EDITRECORD''
,p_button_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_icon_css_classes=>''fa-comments-o''
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1129390179679622957)
,p_name=>''P51_CALLEDFROMPAGE''
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(1129272710209743263)
,p_item_default=>''2''
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579856191110746473)
,p_name=>''P51_CREATIONTIME''
,p_source_data_type=>''DATE''
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_default=>''select to_char(sysdate,''''DD-MM-YYYY HH24:MI:SS'''') from dual''
,p_item_default_type=>''SQL_QUERY''
,p_prompt=>''Creation Time''
,p_format_mask=>''DD-MON-YYYY HH:MIPM''
,p_source=>''CREATIONTIME''
,p_display_as=>''NATIVE_DATE_PICKER_APEX''
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>''readonly=true''
,p_begin_on_new_line=>''N''
,p_grid_label_column_span=>3
,p_display_when=>''P51_MEASURINGUNITCODE''
,p_display_when_type=>''ITEM_IS_NOT_NULL''
,p_field_template=>2318601014859922299
,p_item_template_options=>''#DEFAULT#''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''display_as'', ''POPUP'',
  ''max_date'', ''NONE'',
  ''min_date'', ''NONE'',
  ''multiple_months'', ''N'',
  ''show_time'', ''Y'',
  ''use_defaults'', ''Y'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579856613541746474)
,p_name=>''P51_CREATOR''
,p_source_data_type=>''VARCHAR2''
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_default=>''select :GLOBAL_LOGINNAME from Dual''
,p_item_default_type=>''SQL_QUERY''
,p_prompt=>''Creator''
,p_source=>''CREATOR''
,p_display_as=>''NATIVE_DISPLAY_ONLY''
,p_cSize=>32
,p_cMaxlength=>30
,p_colspan=>6
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>''#DEFAULT#''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''based_on'', ''VALUE'',
  ''format'', ''PLAIN'',
  ''send_on_page_submit'', ''Y'',
  ''show_line_breaks'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579853042358746470)
,p_name=>''P51_DATECRATED''
,p_source_data_type=>''DATE''
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source=>''DATECRATED''
,p_display_as=>''NATIVE_HIDDEN''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579853405899746470)
,p_name=>''P51_DATEMODIFY''
,p_source_data_type=>''DATE''
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source=>''DATEMODIFY''
,p_display_as=>''NATIVE_HIDDEN''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_pa') ||
to_clob('ge_item(
 p_id=>wwv_flow_imp.id(579852567368746469)
,p_name=>''P51_DECIMALPLACE''
,p_source_data_type=>''NUMBER''
,p_is_required=>true
,p_item_default=>''0''
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_prompt=>''Decimal Place''
,p_source=>''DECIMALPLACE''
,p_display_as=>''NATIVE_NUMBER_FIELD''
,p_cSize=>32
,p_cMaxlength=>1
,p_tag_attributes=>''min="0" max="9" step="1" inputmode="numeric"''
,p_grid_label_column_span=>3
,p_field_template=>2526760615038828570
,p_item_template_options=>''#DEFAULT#''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''min_value'', ''0'',
  ''max_value'', ''9'',
  ''number_alignment'', ''left'',
  ''virtual_keyboard'', ''decimal'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579854193525746470)
,p_name=>''P51_DIVISORFACTOR''
,p_source_data_type=>''NUMBER''
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_default=>''1''
,p_source=>''DIVISORFACTOR''
,p_display_as=>''NATIVE_HIDDEN''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579855382952746471)
,p_name=>''P51_FORMANPOWER''
,p_source_data_type=>''VARCHAR2''
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source=>''FORMANPOWER''
,p_display_as=>''NATIVE_HIDDEN''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1129391757184642365)
,p_name=>''P51_FORMSTATUS''
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(1129272710209743263)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579855008773746471)
,p_name=>''P51_GSTUQCCODE''
,p_source_data_type=>''VARCHAR2''
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_prompt=>''GST UQC Code''
,p_source=>''GSTUQCCODE''
,p_display_as=>''NATIVE_POPUP_LOV''
,p_named_lov=>''GST_UQC''
,p_lov=>''select UQC_CODE || '''' - '''' || DESCRIPTION as DISPLAY_VALUE, UQC_CODE from GST_UQC order by UQC_CODE''
,p_lov_display_null=>''YES''
,p_lov_display_extra=>''YES''
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>''N''
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>''#DEFAULT#''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''case_sensitive'', ''N'',
  ''display_as'', ''INLINE'',
  ''fetch_on_search'', ''Y'',
  ''initial_fetch'', ''FIRST_ROWSET'',
  ''manual_entry'', ''N'',
  ''match_type'', ''CONTAINS'',
  ''min_chars'', ''0'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105000511)
,p_name=>''P51_IMART_SAVE_OP_ID''
,p_item_sequence=>999999
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_warn_on_unsaved_changes=>''I''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105000515)
,p_name=>''P51_IMART_STATUS_DONE''
,p_item_sequence=>1000002
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_warn_on_unsaved_changes=>''I''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105000514)
,p_name=>''P51_IMART_STATUS_START''
,p_item_sequence=>1000001
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_warn_on_unsaved_changes=>''I''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105000516)
,p_name=>''P51_IMART_WORKFLOW_START''
,p_item_sequence=>1000003
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_warn_on_unsaved_changes=>''I''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579853756904746470)
,p_name=>''P51_ISWEIGHMENTREQUIRED''
,p_source_data_type=>''VARCHAR2''
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_prompt=>''Is Weighment Required''
,p_source=>''ISWEIGHMENTREQUIRED''
,p_display_as=>''NATIVE_SINGLE_CHECKBOX''
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>''#DEFAULT#''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''checked_value'', ''YES'',
  ''unchecked_value'', ''NO'',
  ''use_defaults'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579851810006746468)
,p_name=>''P51_MEASURINGUNITCODE''
,p_source_data_type=>''VARCHAR2''
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_prompt=>''Measuring Unit Code''
,p_source=>''MEASURINGUNITCODE''
,p_display_as=>''NATIVE_TEXT_FIELD''
,p_cSize=>32
,p_cMaxlength=>30
,p_grid_label_column_span=>3
,p_field_template=>2526760615038828570
,p_item_template_options=>''#DEFAULT#''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''disabled'', ''N'',
  ''submit_when_enter_pressed'', ') ||
to_clob('''N'',
  ''subtype'', ''TEXT'',
  ''trim_spaces'', ''NONE'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579852241426746468)
,p_name=>''P51_MEASURINGUNITNAME''
,p_source_data_type=>''VARCHAR2''
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_prompt=>''Measuring Unit Name''
,p_source=>''MEASURINGUNITNAME''
,p_display_as=>''NATIVE_TEXT_FIELD''
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>''N''
,p_grid_label_column_span=>3
,p_field_template=>2526760615038828570
,p_item_template_options=>''#DEFAULT#''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''disabled'', ''N'',
  ''submit_when_enter_pressed'', ''N'',
  ''subtype'', ''TEXT'',
  ''trim_spaces'', ''NONE'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1129391349190639003)
,p_name=>''P51_MODULEFLOW''
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(1129272710209743263)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579854577074746471)
,p_name=>''P51_MULTIPLYINGFACTOR''
,p_source_data_type=>''NUMBER''
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source=>''MULTIPLYINGFACTOR''
,p_display_as=>''NATIVE_HIDDEN''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1129391061902635126)
,p_name=>''P51_ONTHETABLE''
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(1129272710209743263)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1129390698945630547)
,p_name=>''P51_PASSFAILREMARK''
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(1129272710209743263)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579855803804746471)
,p_name=>''P51_REMARK''
,p_source_data_type=>''VARCHAR2''
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_prompt=>''Remark''
,p_source=>''REMARK''
,p_display_as=>''NATIVE_TEXT_FIELD''
,p_cSize=>32
,p_cMaxlength=>100
,p_begin_on_new_line=>''N''
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>''#DEFAULT#''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''disabled'', ''N'',
  ''submit_when_enter_pressed'', ''N'',
  ''subtype'', ''TEXT'',
  ''trim_spaces'', ''NONE'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1129392071760644638)
,p_name=>''P51_STATUS''
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(1129272710209743263)
,p_item_default=>''nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P51_TNO), ''''Status'''')''
,p_item_default_type=>''EXPRESSION''
,p_item_default_language=>''PLSQL''
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1129390453029625278)
,p_name=>''P51_STATUSRIGHT''
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(1129272710209743263)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579851350961746468)
,p_name=>''P51_TNO''
,p_source_data_type=>''NUMBER''
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source=>''TNO''
,p_display_as=>''NATIVE_HIDDEN''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577830821109300474)
,p_name=>''Check Measuring Unit name''
,p_static_id=>''check-measuring-unit-name''
,p_event_sequence=>110
,p_triggering_element_type=>''ITEM''
,p_triggering_element=>''P51_MEASURINGUNITNAME''
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''focusout''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579977863880982525)
,p_event_id=>wwv_flow_imp.id(577830821109300474)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_execute_on_page_init=>''N''
,p_static_id=>''native-javascript-code''
,p_action=>''NATIVE_JAVASCRIPT_CODE''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''js_code'', wwv_flow_string.join(wwv_flow_t_varchar2(
    ''if (Object.keys($v("P51_MEASURINGUNITNAME")).length===0 ) {'',
    ''    showError("Measuring Unit Name Should Not be Empty", ''''P51_MEASURINGUNITNAME'''');'',
    ''} else {'',
    ''    apex.message.clearErrors();'',
    ''}'')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579861740967746481)
,p_name=>''Close Dialog''
,p_static_id=>''close-dialog''
,p_event_sequence=>10
,p_triggering_element_type=>''BUTTON''
,p_triggering_button_id=>wwv_flow_imp.id(579861629890746481)
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''click''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579862507056746481)
,p_event_id=>wwv_flow_imp.id(579861740967746481)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_execute_on_page_init=>''N''
,p_static_id=>''native-dialog-close''
,p_action=>''NATIVE_DIALOG_CLOSE''
);
wwv_f') ||
to_clob('low_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579953746125881881)
,p_name=>''DISABLE DELETE UPDATE IF STATUS IS ACTIVE''
,p_static_id=>''disable-delete-update-if-status-is-active''
,p_event_sequence=>60
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''ready''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579955160435881881)
,p_event_id=>wwv_flow_imp.id(579953746125881881)
,p_event_result=>''TRUE''
,p_action_sequence=>20
,p_static_id=>''native-disable''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579863010836746481)
,p_server_condition_type=>''EXISTS''
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
''Select 1 From MODULEPRIVILEGE A'',
'' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''   And a.bossusercode = :GLOBAL_BOSSUSERCODE'',
''   And a.companycode = :GLOBAL_COMPANYCODE'',
''   AND A.DELETEPRIVILEGE= ''''NO''''''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579954160819881881)
,p_event_id=>wwv_flow_imp.id(579953746125881881)
,p_event_result=>''TRUE''
,p_action_sequence=>60
,p_static_id=>''native-disable-2''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579863010836746481)
,p_server_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_server_condition_expr1=>''P51_STATUS''
,p_server_condition_expr2=>''ACTIVE''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579954710477881881)
,p_event_id=>wwv_flow_imp.id(579953746125881881)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_static_id=>''native-enable''
,p_action=>''NATIVE_ENABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579863010836746481)
,p_server_condition_type=>''EXISTS''
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
''Select 1 From MODULEPRIVILEGE A'',
'' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''   And a.bossusercode = :GLOBAL_BOSSUSERCODE'',
''   And a.companycode = :GLOBAL_COMPANYCODE'',
''   AND A.DELETEPRIVILEGE= ''''YES''''''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579958719244885273)
,p_name=>''Disable Print Button''
,p_static_id=>''disable-print-button''
,p_event_sequence=>90
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''ready''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579959615932885275)
,p_event_id=>wwv_flow_imp.id(579958719244885273)
,p_event_result=>''TRUE''
,p_action_sequence=>20
,p_static_id=>''native-disable''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579886121727823296)
,p_server_condition_type=>''EXISTS''
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
''Select 1 From MODULEPRIVILEGE A'',
'' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''   And a.bossusercode = :GLOBAL_BOSSUSERCODE'',
''   And a.companycode = :GLOBAL_COMPANYCODE'',
''   AND A.PRINTPRIVILEGE= ''''NO''''''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579959100201885274)
,p_event_id=>wwv_flow_imp.id(579958719244885273)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_static_id=>''native-enable''
,p_action=>''NATIVE_ENABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579886121727823296)
,p_server_condition_type=>''EXISTS''
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
''Select 1 From MODULEPRIVILEGE A'',
'' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''   And a.bossusercode = :GLOBAL_BOSSUSERCODE'',
''   And a.companycode = :GLOBAL_COMPANYCODE'',
''   AND A.PRINTPRIVILEGE= ''''YES''''''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579955573539883019)
,p_name=>''DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE''
,p_static_id=>''disable-save-button-for-updateprivillege''
,p_event_sequence=>70
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''ready''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579956526183883020)
,p_event_id=>wwv_flow_imp.id(579955573539883019)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_static_id=>''native-disable''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579863381933746481)
,p_server_condition_type=>''EXISTS''
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
''SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C'',
''WHERE A.TNO = B.TNO'',
''AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''AND B.BOSSUSERCODE = C.BOSSUSERCODE'',
''AND C.BOSSUSERNAME = :APP_USER'',
''AND B.UPDATEPRIVILEGE = ''''NO'''''',
''UNION ALL'',
''Select 1'',
''  From MODULEPRIVILEGE A'',
'' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''   And a.bossusercode = :GLOBAL_BOSSUSERCODE'',
''   And a.companycode = :GLOBAL_COMPANYCODE'',
''   AND A.UPDATEPRIVILEGE = ''''NO''''''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579956032240883020)
,p_event_id=>wwv_flow_imp.id(579955573539883019)
,p_event_result=>''TRUE''
,p_action_sequence=>50
,p_static_id=>''native-disable-2''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579863381933746481)
,p_server_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_server_condition_expr1=>''P51_STATUS''
,p_server_condition_expr2=>''ACTIVE''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579956962083883020)
,p_event_id=>wwv_flow_imp.id(579955573539883019)
,p_event_result=>''TRUE''
,p_action_sequence=>20
,p_static_id=>''native-enable''
,p_action=>''NATIVE_ENABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579863381933746481)
,p_server_condition_type=>''EXISTS''
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
''SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C'',
''WHERE A.TNO = B.TNO'',
''AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''AND B.BOSSUSERCO') ||
to_clob('DE = C.BOSSUSERCODE'',
''AND C.BOSSUSERNAME = :APP_USER'',
''AND B.UPDATEPRIVILEGE = ''''YES'''''',
''UNION ALL'',
''Select 1'',
''  From MODULEPRIVILEGE A'',
'' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''   And a.bossusercode = :GLOBAL_BOSSUSERCODE'',
''   And a.companycode = :GLOBAL_COMPANYCODE'',
''   AND A.UPDATEPRIVILEGE = ''''YES''''''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579957346299884246)
,p_name=>''Disable Status Button''
,p_static_id=>''disable-status-button''
,p_event_sequence=>80
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''ready''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579958335887884246)
,p_event_id=>wwv_flow_imp.id(579957346299884246)
,p_event_result=>''TRUE''
,p_action_sequence=>20
,p_static_id=>''native-disable''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579885787635821554)
,p_server_condition_type=>''EXISTS''
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
''Select 1 From MODULEPRIVILEGE A'',
'' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''   And a.bossusercode = :GLOBAL_BOSSUSERCODE'',
''   And a.companycode = :GLOBAL_COMPANYCODE'',
''   AND A.STATUSPRIVILEGE = ''''NO''''''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579957791315884246)
,p_event_id=>wwv_flow_imp.id(579957346299884246)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_static_id=>''native-enable''
,p_action=>''NATIVE_ENABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579885787635821554)
,p_server_condition_type=>''EXISTS''
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
''Select 1 From MODULEPRIVILEGE A'',
'' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''   And a.bossusercode = :GLOBAL_BOSSUSERCODE'',
''   And a.companycode = :GLOBAL_COMPANYCODE'',
''   AND A.STATUSPRIVILEGE = ''''YES''''''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579947401194863660)
,p_name=>''DocumentStatus''
,p_static_id=>''documentstatus''
,p_event_sequence=>40
,p_triggering_element_type=>''BUTTON''
,p_triggering_button_id=>wwv_flow_imp.id(579885787635821554)
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''apexafterclosedialog''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579949756904863663)
,p_event_id=>wwv_flow_imp.id(579947401194863660)
,p_event_result=>''TRUE''
,p_action_sequence=>70
,p_execute_on_page_init=>''N''
,p_static_id=>''native-disable''
,p_action=>''NATIVE_DISABLE''
,p_client_condition_type=>''EQUALS''
,p_client_condition_element=>''P51_STATUS''
,p_client_condition_expression=>''ACTIVE''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579949264950863663)
,p_event_id=>wwv_flow_imp.id(579947401194863660)
,p_event_result=>''TRUE''
,p_action_sequence=>60
,p_execute_on_page_init=>''N''
,p_static_id=>''native-enable''
,p_action=>''NATIVE_ENABLE''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579950844933863663)
,p_event_id=>wwv_flow_imp.id(579947401194863660)
,p_event_result=>''TRUE''
,p_action_sequence=>20
,p_execute_on_page_init=>''N''
,p_static_id=>''native-execute-plsql-code''
,p_action=>''NATIVE_EXECUTE_PLSQL_CODE''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''items_to_return'', ''P51_IMART_STATUS_DONE'',
  ''items_to_submit'', ''P51_TNO,P51_STATUS,P51_IMART_SAVE_OP_ID,P51_IMART_STATUS_START'',
  ''language'', ''PLSQL'',
  ''plsql_code'', wwv_flow_string.join(wwv_flow_t_varchar2(
    ''declare ack_keys clob;procedure ack_business is begin'',
    ''SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P51_TNO,:P51_STATUS);'',
    ''end;begin'',
    ''select json_array(to_char(:P51_TNO) null on null returning clob) into ack_keys from dual;'',
    ''imart_save_ack.begin_status(:P51_IMART_SAVE_OP_ID,GetModuleCodeForPageNo(:APP_PAGE_ID),:P51_TNO,:P51_STATUS,''''P51_TNO'''',ack_keys);'',
    ''ack_business;'',
    ''imart_save_ack.finish_status(:P51_IMART_SAVE_OP_ID);'',
    '':P51_IMART_STATUS_DONE:=:P51_IMART_SAVE_OP_ID;'',
    ''end;'')),
  ''show_processing'', ''N'')).to_clob
,p_wait_for_result=>''Y''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579947829384863660)
,p_event_id=>wwv_flow_imp.id(579947401194863660)
,p_event_result=>''TRUE''
,p_action_sequence=>30
,p_execute_on_page_init=>''N''
,p_static_id=>''native-javascript-code''
,p_action=>''NATIVE_JAVASCRIPT_CODE''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''js_code'', ''$(''''#STATUS span'''').text($v(''''P51_STATUS''''));'')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579948266093863660)
,p_event_id=>wwv_flow_imp.id(579947401194863660)
,p_event_result=>''TRUE''
,p_action_sequence=>40
,p_execute_on_page_init=>''N''
,p_static_id=>''native-javascript-code-2''
,p_action=>''NATIVE_JAVASCRIPT_CODE''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''js_code'', ''location.reload()'')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579948800543863660)
,p_event_id=>wwv_flow_imp.id(579947401194863660)
,p_event_result=>''TRUE''
,p_action_sequence=>50
,p_execute_on_page_init=>''N''
,p_static_id=>''native-refresh''
,p_action=>''NATIVE_REFRESH''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''maintain_pagination'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579950334698863663)
,p_event_id=>wwv_flow_imp.id(579947401194863660)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_execute_on_page_init=>''N''
,p_static_id=>''native-set-value''
,p_action=>''NATIVE_SET_VALUE''
,p_affected_elements_type=>''ITEM''
,p_affected_elements=>''P51_STATUS''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''return_item'', ''P164_DOCUMENTSTATUSCODE'',
  ''suppress_change_event'', ''N'',
  ''type'', ''DIALOG_RETURN_ITEM'')).to_clob
,p_wait_for_result=>''Y''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579952041115881018)
,p_name=>''Enable Disable Pass/Fail') ||
to_clob('/Flow''
,p_static_id=>''enable-disable-pass-fail-flow''
,p_event_sequence=>50
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''ready''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579952410045881018)
,p_event_id=>wwv_flow_imp.id(579952041115881018)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_static_id=>''native-disable''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579884895332816988)
,p_client_condition_type=>''EQUALS''
,p_client_condition_element=>''P51_ONTHETABLE''
,p_client_condition_expression=>''NO''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579952854430881018)
,p_event_id=>wwv_flow_imp.id(579952041115881018)
,p_event_result=>''TRUE''
,p_action_sequence=>20
,p_static_id=>''native-disable-2''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579885235006818278)
,p_client_condition_type=>''EQUALS''
,p_client_condition_element=>''P51_ONTHETABLE''
,p_client_condition_expression=>''NO''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579953366563881018)
,p_event_id=>wwv_flow_imp.id(579952041115881018)
,p_event_result=>''TRUE''
,p_action_sequence=>30
,p_static_id=>''native-disable-3''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579885501433819804)
,p_client_condition_type=>''EQUALS''
,p_client_condition_element=>''P51_MODULEFLOW''
,p_client_condition_expression=>''NO''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579945080413861235)
,p_name=>''Fail''
,p_static_id=>''fail''
,p_event_sequence=>30
,p_triggering_element_type=>''BUTTON''
,p_triggering_button_id=>wwv_flow_imp.id(579885235006818278)
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''apexafterclosedialog''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579946002905861238)
,p_event_id=>wwv_flow_imp.id(579945080413861235)
,p_event_result=>''TRUE''
,p_action_sequence=>20
,p_execute_on_page_init=>''N''
,p_static_id=>''native-execute-plsql-code''
,p_action=>''NATIVE_EXECUTE_PLSQL_CODE''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''items_to_submit'', ''P51_PASSFAILREMARK,P51_TNO1'',
  ''language'', ''PLSQL'',
  ''plsql_code'', wwv_flow_string.join(wwv_flow_t_varchar2(
    ''declare'',
    ''		cursor cPassFail is'',
    ''				select'',
    ''						a.TNo,'',
    ''						a.TokenNo										'',
    ''				from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d'',
    ''				where a.ModuleFlowTNo = b.TNo'',
    ''						and b.TNo = c.TNo'',
    ''						and a.BossUserCode = c.BossUserCode'',
    ''						and c.BossUserCode = d.BossUserCode'',
    ''						and a.ModuleTNo = :P51_TNO1'',
    ''						AND D.BOSSUSERNAME = :APP_USER'',
    ''						and a.isPass is null'',
    ''						and a.IsFail is null'',
    ''						and a.IsForwarded is null'',
    ''						and a.IsRebounded is null																				'',
    ''		;'',
    ''		vPassFail cPassFail%rowtype;'',
    ''    '',
    ''    tTokenNo NUMBER;'',
    ''    TMP VARCHAR2(100);'',
    ''    tModulecode Varchar2(30);'',
    ''begin'',
    '''',
    ''    select DISTINCT '',
    ''    	d.ModuleCode, :P130_JOBBILLNO'',
    ''                into tModuleCode,tmp'',
    ''    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d '',
    ''    where a.LocationCode = b.LocationCode'',
    ''    	and b.tno = c.tno'',
    ''    	and c.ModuleCode = d.ModuleCode --''''DELIVERYCHALLANRETURN'''''',
    ''        AND d.modulecode = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
    ''    	and c.CompanyCode = :global_CompanyCode'',
    ''        and d.EntryPageNo = :APP_PAGE_ID'',
    ''        ;'',
    '''',
    ''		open cPassFail;'',
    ''		fetch cPassFail into vPassFail;'',
    ''		if cPassFail%FOUND then'',
    ''				tTokenNo := vPassFail.TokenNo;'',
    ''				close cPassFail;'',
    '''',
    ''           	'',
    ''				update PassFail a'',
    ''				set a.IsFail = ''''YES'''','',
    ''						a.remark = :P51_PASSFAILREMARK'',
    ''				where a.TNo = vPassFail.TNo;'',
    ''				'',
    ''				SendBackPassFail(tTokenNo , TMP );'',
    ''		    		'',
    ''				'',
    ''				commit;'',
    ''		else'',
    ''				close cPassFail;'',
    ''		end if;'',
    '''',
    ''	'',
    ''end;'')),
  ''show_processing'', ''N'')).to_clob
,p_wait_for_result=>''Y''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579946507182861239)
,p_event_id=>wwv_flow_imp.id(579945080413861235)
,p_event_result=>''TRUE''
,p_action_sequence=>30
,p_execute_on_page_init=>''N''
,p_static_id=>''native-javascript-code''
,p_action=>''NATIVE_JAVASCRIPT_CODE''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''js_code'', ''location.reload()'')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579946972700861239)
,p_event_id=>wwv_flow_imp.id(579945080413861235)
,p_event_result=>''TRUE''
,p_action_sequence=>40
,p_execute_on_page_init=>''N''
,p_static_id=>''native-refresh''
,p_action=>''NATIVE_REFRESH''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''maintain_pagination'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579945456469861235)
,p_event_id=>wwv_flow_imp.id(579945080413861235)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_execute_on_page_init=>''N''
,p_static_id=>''native-set-value''
,p_action=>''NATIVE_SET_VALUE''
,p_affected_elements_type=>''ITEM''
,p_affected_elements=>''P51_PASSFAILREMARK''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''return_item'', ''P163_REMARK'',
  ''suppress_change_event'', ''N'',
  ''type'', ''DIALOG_RETURN_ITEM'')).to_clob
,p_wait_for_result=>''Y''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579942781842858852)
,p_name=>''Pass''
,p_static_id=>''pass''
,p_event_sequence=>20
,p_triggering_element_type=>''BUTTON''
,p_triggering_button_id=>wwv_flow_imp.id(579884895332816988)
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''apexafterclosedialog''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5') ||
to_clob('79943693077858853)
,p_event_id=>wwv_flow_imp.id(579942781842858852)
,p_event_result=>''TRUE''
,p_action_sequence=>20
,p_execute_on_page_init=>''N''
,p_static_id=>''native-execute-plsql-code''
,p_action=>''NATIVE_EXECUTE_PLSQL_CODE''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''items_to_return'', ''P51_IMART_STATUS_DONE'',
  ''items_to_submit'', ''P51_PASSFAILREMARK,P51_TNO1,P51_IMART_SAVE_OP_ID,P51_TNO,P51_IMART_WORKFLOW_START'',
  ''language'', ''PLSQL'',
  ''plsql_code'', wwv_flow_string.join(wwv_flow_t_varchar2(
    ''declare ack_keys clob;procedure ack_business is begin'',
    ''DECLARE'',
    ''  tModuleCode  Varchar2(30) := GetModuleCodeForPageNo(:APP_PAGE_ID);'',
    ''  TMP          vARCHAR2(100) ;'',
    ''cursor cPassFail is'',
    ''		select'',
    ''				a.TNo'',
    ''		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d'',
    ''		where a.ModuleFlowTNo = b.TNo'',
    ''				and b.TNo = c.TNo'',
    ''				and a.BossUserCode = c.BossUserCode'',
    ''				and c.BossUserCode = d.BossUserCode'',
    ''				and a.ModuleTNo = :P51_TNO1'',
    ''				AND D.BOSSUSERNAME = :APP_USER'',
    ''				and a.isPass is null'',
    ''				and a.IsFail is null'',
    ''				and a.IsForwarded is null'',
    ''				and a.IsRebounded is null										'',
    '';'',
    ''vPassFail cPassFail%rowtype;'',
    ''BEGIN'',
    '''',
    ''    select DISTINCT '',
    ''    	d.ModuleCode, :P130_JOBBILLNO'',
    ''                into tModuleCode,tmp'',
    ''    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d '',
    ''    where a.LocationCode = b.LocationCode'',
    ''    	and b.tno = c.tno'',
    ''    	and c.ModuleCode = d.ModuleCode --''''DELIVERYCHALLANRETURN'''''',
    ''        AND d.modulecode = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
    ''    	and c.CompanyCode = :global_CompanyCode'',
    ''        and d.EntryPageNo = :APP_PAGE_ID'',
    ''        ;'',
    '''',
    ''			'',
    ''	open cPassFail;'',
    ''	fetch cPassFail into vPassFail;'',
    ''	if cPassFail%FOUND then'',
    ''			'',
    ''		'',
    ''			update PassFail a'',
    ''			set a.IsPass = ''''YES'''','',
    ''				a.remark = :P51_PASSFAILRREMARK'',
    ''			where a.TNo = vPassFail.TNo;'',
    ''			COMMIT;'',
    ''			close cPassFail;'',
    ''			'',
    ''			'',
    ''			SendPassFailForward(tModuleCode, :P51_TNO1 , TMP, :global_CompanyCode );'',
    '''',
    ''    end if;'',
    ''END;'',
    ''end;begin'',
    ''select json_array(to_char(:P51_TNO) null on null returning clob) into ack_keys from dual;'',
    ''imart_save_ack.begin_v2(:P51_IMART_SAVE_OP_ID,''''P51_TNO'''',ack_keys,''''STATUS'''');'',
    ''ack_business;'',
    ''select json_array(to_char(:P51_TNO) null on null returning clob) into ack_keys from dual;'',
    ''imart_save_ack.finish_v2(:P51_IMART_SAVE_OP_ID,ack_keys);'',
    '':P51_IMART_STATUS_DONE:=:P51_IMART_SAVE_OP_ID;'',
    ''end;'')),
  ''show_processing'', ''N'')).to_clob
,p_wait_for_result=>''Y''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579944219999858853)
,p_event_id=>wwv_flow_imp.id(579942781842858852)
,p_event_result=>''TRUE''
,p_action_sequence=>30
,p_execute_on_page_init=>''N''
,p_static_id=>''native-javascript-code''
,p_action=>''NATIVE_JAVASCRIPT_CODE''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''js_code'', ''location.reload()'')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579944663281858854)
,p_event_id=>wwv_flow_imp.id(579942781842858852)
,p_event_result=>''TRUE''
,p_action_sequence=>40
,p_execute_on_page_init=>''N''
,p_static_id=>''native-refresh''
,p_action=>''NATIVE_REFRESH''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''maintain_pagination'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579943198259858852)
,p_event_id=>wwv_flow_imp.id(579942781842858852)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_execute_on_page_init=>''N''
,p_static_id=>''native-set-value''
,p_action=>''NATIVE_SET_VALUE''
,p_affected_elements_type=>''ITEM''
,p_affected_elements=>''P51_PASSFAILREMARK''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''return_item'', ''P163_REMARK'',
  ''suppress_change_event'', ''N'',
  ''type'', ''DIALOG_RETURN_ITEM'')).to_clob
,p_wait_for_result=>''Y''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2026102051000002)
,p_button_sequence=>95
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''EXIT''
,p_button_static_id=>''p51_exit''
,p_button_action=>''DEFINED_BY_DA''
,p_button_template_options=>''#DEFAULT#:t-Button--simple:t-Button--iconLeft''
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>''Exit''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_execute_validations=>''N''
,p_warn_on_unsaved_changes=>''N''
,p_icon_css_classes=>''fa-sign-out''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2026102051000003)
,p_name=>''Exit Measuring Unit Form''
,p_event_sequence=>900
,p_triggering_element_type=>''BUTTON''
,p_triggering_button_id=>wwv_flow_imp.id(2026102051000002)
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''click''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2026102051000004)
,p_event_id=>wwv_flow_imp.id(2026102051000003)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_execute_on_page_init=>''N''
,p_action=>''NATIVE_DIALOG_CANCEL''
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2026102051000005)
,p_validation_name=>''Decimal Place must be a digit from 0 to 9''
,p_validation_sequence=>10
,p_validation=>''P51_DECIMALPLACE''
,p_validation2=>''^[0-9]$''
,p_validation_type=>''REGULAR_EXPRESSION''
,p_error_message=>''Decimal Place must be a whole number from 0 to 9.''
,p_always_execute=>''N''
,p_associated_item=>wwv_flow_imp.id(579852567368746469)
,p_error_display_location=>''INLINE_WITH_FIELD_AND_NOTIFICATION''
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(579864989166746482)
,p_process_sequence=>30
,p_process_point=>''AFTER_SUBMIT''
,p_process_type=>''NATIVE_CLOSE_WINDOW''
,p_process_name=>''Close Dialog''
,p_static_id=>''close-dialog''
,p_attributes=>wwv_flow_') ||
to_clob('t_plugin_attributes(wwv_flow_t_varchar2(
  ''show_success_messages'', ''N'')).to_clob
,p_error_display_location=>''INLINE_IN_NOTIFICATION''
,p_process_when_button_id=>wwv_flow_imp.id(579863010836746481)
,p_internal_uid=>139478643915819958
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(579951377665868454)
,p_process_sequence=>60
,p_process_point=>''BEFORE_HEADER''
,p_process_type=>''NATIVE_PLSQL''
,p_process_name=>''Get Form Status And TNO''
,p_static_id=>''get-form-status-and-tno''
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
''begin'',
''     if :P51_TNO is null then'',
''            :P51_FORMSTATUS := ''''NEWRECORD'''';'',
''        else'',
''            :P51_FORMSTATUS := ''''EDITRECORD'''';'',
''        end if;'',
'''',
''    if :P51_TNO is null then'',
'''',
''        select globaltno.nextval into :P51_TNO from dual;'',
'''',
''    end if; '',
''end;''))
,p_process_clob_language=>''PLSQL''
,p_internal_uid=>139565032414941930
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(579999203690048816)
,p_process_sequence=>10
,p_process_point=>''AFTER_SUBMIT''
,p_process_type=>''NATIVE_PLSQL''
,p_process_name=>''Get Measuring Unit Code''
,p_static_id=>''get-measuring-unit-code''
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
''declare'',
''    tModuleCode varchar2(30) := ''''MEASURINGUNIT'''';'',
'''',
''    tmp         number ;'',
''begin'',
''    select count(*) into tmp'',
''      from codeschememaster a'',
''     where a.modulecode = tModuleCode'',
''       and a.CodeScheme = ''''AUTO'''''',
''     ;'',
'''',
''     if nvl(tmp,0) > 0 and :P51_MEASURINGUNITCODE is null then'',
''            setCodeNext(tModuleCode);'',
''	  		:P51_MEASURINGUNITCODE := getCode(tModuleCode) ;'',
''     end if;'',
''end;''))
,p_process_clob_language=>''PLSQL''
,p_error_display_location=>''INLINE_IN_NOTIFICATION''
,p_internal_uid=>139612858439122292
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(579951703139869639)
,p_process_sequence=>70
,p_process_point=>''BEFORE_HEADER''
,p_process_type=>''NATIVE_PLSQL''
,p_process_name=>''Get On The Table''
,p_static_id=>''get-on-the-table''
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
''declare'',
''tmp  number;'',
''tmp1 number;'',
''begin'',
'' -------- Checking Module Flow Prepared Or Not '',
''   select count(*) into tmp1 from moduleflow where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) and getdocumentstatuscode(''''MODULEFLOW'''',TNO)=''''ACTIVE'''';'',
''   if nvl(tmp1,0) > 0 then'',
''       :P51_MODULEFLOW := ''''YES'''';'',
''   else'',
''       :P51_MODULEFLOW := ''''NO'''';'',
''   end if;'',
''  '',
''  ----- Checking On The Table '',
''   select count(*) into tmp from onthetable_apex where moduletno = :P51_TNO1 and loginname = :GLOBAL_LOGINNAME;'',
''   if nvl(tmp,0) > 0 then'',
''      :P51_ONTHETABLE := ''''YES'''' ;'',
''   else'',
''       :P51_ONTHETABLE := ''''NO'''';'',
''   end if;'',
''end;''))
,p_process_clob_language=>''PLSQL''
,p_internal_uid=>139565357888943115
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25266988849897190)
,p_process_sequence=>95
,p_process_point=>''ON_DEMAND''
,p_process_type=>''NATIVE_PLSQL''
,p_process_name=>''IMART_DOCUMENT_HISTORY''
,p_static_id=>''imart-document-history''
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
''declare'',
'' l_doc varchar2(4000);l_root varchar2(128):=''''MEASURINGUNIT'''';l_record varchar2(4000);l_tno varchar2(100);l_links clob;'',
'' l_mode varchar2(20):=apex_application.g_x01;'',
'' l_key varchar2(100):=apex_application.g_x02;'',
'' l_after number:=to_number(apex_application.g_x03 default null on conversion error);'',
'' l_snapshot number:=to_number(apex_application.g_x04 default null on conversion error);'',
'' l_sort varchar2(10):=case when apex_application.g_x05=''''OLDEST'''' then ''''OLDEST'''' else ''''NEWEST'''' end;'',
'' l_filter varchar2(20):=nvl(apex_application.g_x06,''''ALL'''');'',
'' l_company varchar2(128);l_location varchar2(128);l_count number:=0;l_more boolean:=false;'',
'' l_json clob;l_pos pls_integer:=1;'',
'' function label_for(p_table varchar2,p_column varchar2) return varchar2 is v varchar2(500);'',
'' begin'',
''  select max(regexp_replace(label,''''<[^>]+>'''','''''''')) into v from apex_application_page_items'',
''  where application_id=105 and page_id=51 and item_source=p_column and label is not null;'',
''  return coalesce(v,case p_column when ''''QUANTITY1'''' then ''''Primary Quantity'''' when ''''QUANTITY2'''' then ''''Secondary Quantity'''''',
''    when ''''ITEMSPECS'''' then ''''Item Specification'''' when ''''TNO'''' then ''''Document ID'''' when ''''SNO'''' then ''''Line ID'''''',
''    when ''''IMART_AUDIT_ROW_ID'''' then ''''Audit Row ID'''' when ''''ITEMCODE'''' then ''''Item'''' else initcap(replace(p_column,''''_'''','''' '''')) end);'',
'' end;'',
'' function actor_name(p_code varchar2,p_user varchar2) return varchar2 is v varchar2(255);'',
'' begin select max(coalesce(e.employeename,b.bossusername)) into v from bossuser b left join employee e on e.employeecode=b.employeecode'',
'' where b.bossusercode=p_code or (p_code is null and upper(b.loginname)=upper(p_user));'',
'' return coalesce(v,p_user,p_code,''''Unknown user'''');end;'',
'' function readable(p_field varchar2,p_value clob) return varchar2 is v varchar2(500);k varchar2(500):=dbms_lob.substr(p_value,500,1);'',
'' begin'',
''  if k is null then return null;end if;'',
''  case p_field'',
''   when ''''PARTYCODE'''' then select max(partyname) into v from party where partycode=k;'',
''   when ''''ITEMCODE'''' then select max(itemname) into v from item where itemcode=k;'',
''   when ''''LOCATIONCODE'''' then select max(locationname) into v from location where locationcode=k;'',
''   when ''''DOCTYPECODE'''' then select max(doctypename) into v from doctype where doctypecode=k;'',
''   when ''''EMPLOYEECODE'''' then select max(employeename) into v from employee where employeecode=k;'',
''   when ''''ITEMSPECIFICATIONCODE'''' then select max(itemspecificationname) into v from itemspecification where itemspecificationcode=k;'',
''   else return null;'',
''  end case;return v;'',
'' end;'',
'' function item_context(p_line varchar2) return varchar2 is begin return case when p_line is not null then ''''Detail Line ''''||p_line end;en') ||
to_clob('d;'',
''begin'',
'' apex_json.initialize_clob_output;'',
'' apex_json.open_object;'',
'' if :APP_ID<>105 or :APP_PAGE_ID<>51 or not imart_audit.can_inquire then'',
''  apex_json.write(''''status'''',''''restricted'''');apex_json.write(''''message'''',''''Audit history access is not granted for this user.'''');'',
'' else'',
''  begin select v(''''GLOBAL_COMPANYCODE''''),cast(null as varchar2(128)),json_object(''''TNO'''' value to_char(TNO,''''TM9'''',''''NLS_NUMERIC_CHARACTERS=''''''''.,'''''''''''')),to_char(TNO,''''TM9'''',''''NLS_NUMERIC_CHARACTERS=''''''''.,''''''''''''),json_array(json_object(''''t'''' value ''''MEASURINGUNIT'''',''''c'''' val''
||''ue ''''TNO'''',''''v'''' value to_char(TNO,''''TM9'''',''''NLS_NUMERIC_CHARACTERS=''''''''.,'''''''''''')) returning clob) into l_company,l_location,l_record,l_tno,l_links from MEASURINGUNIT where TNO=to_number(:P51_TNO default null on conversion error);l_doc:=l_record;'',
''  exception when no_data_found then l_doc:=null;when too_many_rows then l_doc:=null;end;'',
''  if l_doc is null then apex_json.write(''''status'''',''''empty'''');apex_json.write(''''message'''',''''History is available after this record has been saved.'''');'',
''  elsif imart_audit.can_read(l_company,l_location)<>1 then'',
''   apex_json.write(''''status'''',''''restricted'''');apex_json.write(''''message'''',''''Audit history access is not granted for this document.'''');'',
''  else'',
''   -- A sequence boundary is not an audit row; authorize only the document''''s candidate rows below.'',
''   if l_snapshot is null then select nvl(max(audit_event_id),0) into l_snapshot from imart_audit_event;end if;'',
''   apex_json.write(''''status'''',''''ok'''');apex_json.write(''''snapshot'''',to_char(l_snapshot));'',
''   if l_mode=''''LIST'''' then'',
''    apex_json.open_array(''''activities'''');'',
''    for r in ('',
''with links as ('',
'' select t,c,v from json_table(l_links,''''$[*]'''' columns(t varchar2(128) path ''''$.t'''',c varchar2(128) path ''''$.c'''',v varchar2(4000) path ''''$.v''''))'',
''), anchor_keys as ('',
'' select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v'',
'' from links s join imart_audit_event e on e.table_name=s.t'',
'' join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c'',
'' where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v'',
''), owned as ('',
'' select /*+ materialize */ e.* from imart_audit_event e'',
'' where e.application_id=105 and e.event_type in (''''ROW_CHANGE'''',''''BUSINESS'''') and e.outcome in (''''SUCCESS'''',''''OBSERVED'''')'',
'' and ('',
''  (e.table_name=l_root and json_equal(e.record_key,l_record))'',
''  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''''$.TNO'''')=l_tno)))'',
''  or exists(select 1 from links s where s.t=e.table_name and s.c=''''TNO'''' and json_value(e.record_key,''''$.TNO'''')=s.v)'',
''  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key'',
''   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))'',
''        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id'',
''        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key'',
''        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c'',
''        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)'',
'' )'',
''), eligible as ('',
'' select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then'',
'' rawtohex(standard_hash(rawtohex(request_id)||''''|''''||transaction_id||''''|''''||nvl(bossusercode,user_name)||''''|''''||apex_session_id||''''|''''||source_type,''''SHA256''''))'',
'' else ''''EVENT-''''||to_char(audit_event_id) end activity_key'',
'' from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(e.company_code,e.location_code)=1'',
'')'',
'''',
''     , grouped as ('',
''      select activity_key,max(audit_event_id) sort_id,min(event_timestamp) first_time,max(event_timestamp) last_time,'',
''      max(user_name) user_name,max(bossusercode) bossusercode,max(rawtohex(request_id)) request_id,max(transaction_id) transaction_id,'',
''      sum(field_count) change_count,'',
''      count(*) event_count,'',
''      case when max(case when table_name=l_root and action_type=''''INSERT'''' and event_type=''''ROW_CHANGE'''' then 1 else 0 end)=1 then ''''CREATED'''''',
''       when max(case when action_type=''''APPROVE'''' then 1 else 0 end)=1 then ''''APPROVED'''''',
''       when max(case when action_type=''''REJECT'''' then 1 else 0 end)=1 then ''''REJECTED'''''',
''       when max(case when action_type=''''CANCEL'''' then 1 else 0 end)=1 then ''''CANCELLED'''''',
''       when max(case when table_name=l_root and action_type=''''DELETE'''' then 1 else 0 end)=1 then ''''DELETED'''''',
''       when max(case when action_type=''''SUBMIT'''' then 1 else 0 end)=1 and max(case when event_type=''''ROW_CHANGE'''' then 1 else 0 end)=0 then ''''SUBMITTED'''''',
''       else ''''UPDATED'''' end activity_type'',
''      from eligible e group by activity_key'',
''     ) select * from grouped where (l_filter=''''ALL'''' or activity_type=l_filter)'',
''     and (l_after is null or (l_sort=''''NEWEST'''' and sort_id<l_after) or (l_sort=''''OLDEST'''' and sort_id>l_after))'',
''     order by case when l_sort=''''NEWEST'''' then -sort_id else sort_id end fetch first 21 rows only'',
''    ) loop'',
''     l_count:=l_count+1;if l_count>20 then l_more:=true;exit;end if;'',
''     apex_json.open_object;apex_json.write(''''key'''',r.activity_key);apex_json.write(''''cursor'''',to_char(r.sort_id));'',
''     apex_json.write(''''type'''',r.activity_type);apex_json.write(''''changes'''',r.change_count);apex_json.write(''''events'''',r.event_count);'',
''     apex_json.write(''''user'''',actor_name(r.bossusercode,r.user_name));apex_json.write(''''login'''',r.user_name);'',
''     apex_json.write(''''time'''',to_char(r.first_time at time zone sessiontimezone,''''DD-MM-YYYY HH:MI:SS AM TZH:TZM''''));'',
''     apex_json.write(''''lastTime'''',to_char(r.last_time at time zone se') ||
to_clob('ssiontimezone,''''DD-MM-YYYY HH:MI:SS AM TZH:TZM''''));'',
''     apex_json.write(''''request'''',r.request_id);apex_json.write(''''transaction'''',r.transaction_id);apex_json.close_object;'',
''    end loop;'',
''    apex_json.close_array;apex_json.write(''''more'''',l_more);'',
''   elsif l_mode=''''DETAIL'''' then'',
''    apex_json.open_array(''''changes'''');'',
''    for r in ('',
''with links as ('',
'' select t,c,v from json_table(l_links,''''$[*]'''' columns(t varchar2(128) path ''''$.t'''',c varchar2(128) path ''''$.c'''',v varchar2(4000) path ''''$.v''''))'',
''), anchor_keys as ('',
'' select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v'',
'' from links s join imart_audit_event e on e.table_name=s.t'',
'' join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c'',
'' where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v'',
''), owned as ('',
'' select /*+ materialize */ e.* from imart_audit_event e'',
'' where e.application_id=105 and e.event_type in (''''ROW_CHANGE'''',''''BUSINESS'''') and e.outcome in (''''SUCCESS'''',''''OBSERVED'''')'',
'' and ('',
''  (e.table_name=l_root and json_equal(e.record_key,l_record))'',
''  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''''$.TNO'''')=l_tno)))'',
''  or exists(select 1 from links s where s.t=e.table_name and s.c=''''TNO'''' and json_value(e.record_key,''''$.TNO'''')=s.v)'',
''  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key'',
''   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))'',
''        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id'',
''        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key'',
''        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c'',
''        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)'',
'' )'',
''), eligible as ('',
'' select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then'',
'' rawtohex(standard_hash(rawtohex(request_id)||''''|''''||transaction_id||''''|''''||nvl(bossusercode,user_name)||''''|''''||apex_session_id||''''|''''||source_type,''''SHA256''''))'',
'' else ''''EVENT-''''||to_char(audit_event_id) end activity_key'',
'' from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(e.company_code,e.location_code)=1'',
'')'',
'''',
''     select c.*,e.action_type,e.record_key,e.event_timestamp,e.user_name,e.bossusercode,e.outcome,'',
''     coalesce(json_value(e.record_key,''''$.SNO''''),(select coalesce(dbms_lob.substr(z.new_value,100,1),dbms_lob.substr(z.old_value,100,1))'',
''       from imart_audit_event h join imart_audit_change z on z.audit_event_id=h.audit_event_id'',
''       where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key'',
''       and h.audit_event_id<=e.audit_event_id and z.column_name=''''SNO'''''',
''       order by h.audit_event_id desc,z.audit_change_id desc fetch first 1 row only)) line_id'',
''     from eligible e join imart_audit_change c on c.audit_event_id=e.audit_event_id'',
''     where e.activity_key=l_key and (l_after is null or c.audit_change_id>l_after)'',
''     order by c.audit_change_id fetch first 21 rows only'',
''    ) loop'',
''     l_count:=l_count+1;if l_count>20 then l_more:=true;exit;end if;'',
''     apex_json.open_object;apex_json.write(''''id'''',to_char(r.audit_change_id));apex_json.write(''''event'''',to_char(r.audit_event_id));'',
''     apex_json.write(''''table'''',r.table_name);apex_json.write(''''field'''',r.column_name);apex_json.write(''''label'''',label_for(r.table_name,r.column_name));'',
''     apex_json.write(''''action'''',r.action_type);apex_json.write(''''record'''',r.record_key);apex_json.write(''''line'''',r.line_id);'',
''     apex_json.write(''''item'''',item_context(r.line_id));'',
''     apex_json.write(''''user'''',actor_name(r.bossusercode,r.user_name));'',
''     apex_json.write(''''time'''',to_char(r.event_timestamp at time zone sessiontimezone,''''DD-MM-YYYY HH:MI:SS AM TZH:TZM''''));'',
''     apex_json.write(''''old'''',dbms_lob.substr(r.old_value,2000,1));apex_json.write(''''new'''',dbms_lob.substr(r.new_value,2000,1));'',
''     if r.old_state=''''VALUE'''' and r.capture_mode=''''FULL'''' then apex_json.write(''''oldLabel'''',readable(r.column_name,r.old_value));end if;'',
''     if r.new_state=''''VALUE'''' and r.capture_mode=''''FULL'''' then apex_json.write(''''newLabel'''',readable(r.column_name,r.new_value));end if;'',
''     apex_json.write(''''oldState'''',r.old_state);apex_json.write(''''newState'''',r.new_state);apex_json.write(''''mode'''',r.capture_mode);'',
''     apex_json.write(''''long'''',greatest(nvl(dbms_lob.getlength(r.old_value),0),nvl(dbms_lob.getlength(r.new_value),0))>2000);'',
''     apex_json.close_object;'',
''    end loop;'',
''    apex_json.close_array;apex_json.write(''''more'''',l_more);'',
''    apex_json.open_array(''''events'''');'',
''    for r in ('',
''with links as ('',
'' select t,c,v from json_table(l_links,''''$[*]'''' columns(t varchar2(128) path ''''$.t'''',c varchar2(128) path ''''$.c'''',v varchar2(4000) path ''''$.v''''))'',
''), anchor_keys as ('',
'' select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v'',
'' from links s join imart_audit_event e on e.table_name=s.t'',
'' join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c'',
'' where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v'',
''), owned as ('',
'' select /*+ materialize */ e.* from imart_audit_event e'',
'' where e.application_id=105 and e.event_type in (''''ROW_CHANGE'''',''''BUSINESS'''') and e.outcome in (''''SUCCESS'''',''''OBSERVED'''')'',
'' and ('',
''  (e.table_name=l_root and json_equal(e.record_key,l_record))'',
''  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''''$.TNO'''')=l_tno)))'',
''  or ex') ||
to_clob('ists(select 1 from links s where s.t=e.table_name and s.c=''''TNO'''' and json_value(e.record_key,''''$.TNO'''')=s.v)'',
''  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key'',
''   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))'',
''        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id'',
''        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key'',
''        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c'',
''        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)'',
'' )'',
''), eligible as ('',
'' select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then'',
'' rawtohex(standard_hash(rawtohex(request_id)||''''|''''||transaction_id||''''|''''||nvl(bossusercode,user_name)||''''|''''||apex_session_id||''''|''''||source_type,''''SHA256''''))'',
'' else ''''EVENT-''''||to_char(audit_event_id) end activity_key'',
'' from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(e.company_code,e.location_code)=1'',
'')'',
'''',
''     select audit_event_id,action_type,table_name,record_key,outcome,event_type,event_timestamp,remarks,user_name,bossusercode'',
''     from eligible e where activity_key=l_key and not exists(select 1 from imart_audit_change c where c.audit_event_id=e.audit_event_id)'',
''     order by audit_event_id'',
''    ) loop'',
''     apex_json.open_object;apex_json.write(''''event'''',to_char(r.audit_event_id));apex_json.write(''''action'''',r.action_type);'',
''     apex_json.write(''''table'''',r.table_name);apex_json.write(''''record'''',r.record_key);apex_json.write(''''outcome'''',r.outcome);'',
''     apex_json.write(''''time'''',to_char(r.event_timestamp at time zone sessiontimezone,''''DD-MM-YYYY HH:MI:SS AM TZH:TZM''''));'',
''     apex_json.write(''''user'''',actor_name(r.bossusercode,r.user_name));apex_json.write(''''remarks'''',r.remarks);apex_json.close_object;'',
''    end loop;apex_json.close_array;'',
''   elsif l_mode=''''VALUE'''' then'',
''    for r in ('',
''with links as ('',
'' select t,c,v from json_table(l_links,''''$[*]'''' columns(t varchar2(128) path ''''$.t'''',c varchar2(128) path ''''$.c'''',v varchar2(4000) path ''''$.v''''))'',
''), anchor_keys as ('',
'' select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v'',
'' from links s join imart_audit_event e on e.table_name=s.t'',
'' join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c'',
'' where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v'',
''), owned as ('',
'' select /*+ materialize */ e.* from imart_audit_event e'',
'' where e.application_id=105 and e.event_type in (''''ROW_CHANGE'''',''''BUSINESS'''') and e.outcome in (''''SUCCESS'''',''''OBSERVED'''')'',
'' and ('',
''  (e.table_name=l_root and json_equal(e.record_key,l_record))'',
''  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''''$.TNO'''')=l_tno)))'',
''  or exists(select 1 from links s where s.t=e.table_name and s.c=''''TNO'''' and json_value(e.record_key,''''$.TNO'''')=s.v)'',
''  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key'',
''   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))'',
''        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id'',
''        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key'',
''        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c'',
''        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)'',
'' )'',
''), eligible as ('',
'' select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then'',
'' rawtohex(standard_hash(rawtohex(request_id)||''''|''''||transaction_id||''''|''''||nvl(bossusercode,user_name)||''''|''''||apex_session_id||''''|''''||source_type,''''SHA256''''))'',
'' else ''''EVENT-''''||to_char(audit_event_id) end activity_key'',
'' from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(e.company_code,e.location_code)=1'',
'')'',
'''',
''     select c.old_value,c.new_value from eligible e join imart_audit_change c on c.audit_event_id=e.audit_event_id'',
''     where e.activity_key=l_key and c.audit_change_id=l_after'',
''    ) loop apex_json.write(''''old'''',r.old_value);apex_json.write(''''new'''',r.new_value);end loop;'',
''   else raise_application_error(-20001,''''Unsupported history request'''');end if;'',
''  end if;'',
'' end if;'',
'' apex_json.close_object;l_json:=apex_json.get_clob_output;'',
'' while l_pos<=dbms_lob.getlength(l_json) loop sys.htp.prn(dbms_lob.substr(l_json,8000,l_pos));l_pos:=l_pos+8000;end loop;'',
'' apex_json.free_output;'',
''exception when others then'',
'' apex_json.free_output;'',
'' apex_json.open_object;apex_json.write(''''status'''',''''error'''');apex_json.write(''''message'''',''''History could not be loaded. Retry or open Audit Trail.'''');apex_json.close_object;'',
''end;'',
''''))
,p_process_clob_language=>''PLSQL''
,p_internal_uid=>25266988849897190
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99061010105000512)
,p_process_sequence=>-1000000
,p_process_point=>''AFTER_SUBMIT''
,p_process_type=>''NATIVE_PLSQL''
,p_process_name=>''IMART save receipt begin''
,p_static_id=>''imart-save-receipt-begin''
,p_process_sql_clob=>''declare ack_keys clob;begin select json_array(to_char(:P51_TNO) null on null returning clob) into ack_keys from dual;imart_save_ack.begin_v2(:P51_IMART_SAVE_OP_ID,''''P51_TNO'''',ack_keys);end;''
,p_process_clob_language=>''PLSQL''
,p_process_when=>''CREATE,SAVE''
,p_process_when_type=>''REQUEST_IN_CONDITION''
,p_internal_uid=>99061010105000512
);
wwv_flow_imp_') ||
to_clob('page.create_page_process(
 p_id=>wwv_flow_imp.id(99061010105000513)
,p_process_sequence=>1000000
,p_process_point=>''AFTER_SUBMIT''
,p_process_type=>''NATIVE_PLSQL''
,p_process_name=>''IMART save receipt finish''
,p_static_id=>''imart-save-receipt-finish''
,p_process_sql_clob=>''declare ack_keys clob;begin select json_array(to_char(:P51_TNO) null on null returning clob) into ack_keys from dual;imart_save_ack.finish_v2(:P51_IMART_SAVE_OP_ID,ack_keys);end;''
,p_process_clob_language=>''PLSQL''
,p_process_when=>''CREATE,SAVE''
,p_process_when_type=>''REQUEST_IN_CONDITION''
,p_process_success_message=>''Document saved.''
,p_internal_uid=>99061010105000513
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(579864182802746481)
,p_process_sequence=>10
,p_process_point=>''BEFORE_HEADER''
,p_region_id=>wwv_flow_imp.id(579850955118746468)
,p_process_type=>''NATIVE_FORM_INIT''
,p_process_name=>''Initialize form Measuring Unit Master''
,p_static_id=>''initialize-form-measuring-unit-master''
,p_internal_uid=>139477837551819957
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(579864615080746482)
,p_process_sequence=>20
,p_process_point=>''AFTER_SUBMIT''
,p_region_id=>wwv_flow_imp.id(579850955118746468)
,p_process_type=>''NATIVE_FORM_DML''
,p_process_name=>''Process form Measuring Unit Master''
,p_static_id=>''process-form-measuring-unit-master''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''lock_row'', ''Y'',
  ''prevent_lost_updates'', ''Y'',
  ''return_primary_keys_after_insert'', ''Y'',
  ''target_type'', ''REGION_SOURCE'')).to_clob
,p_error_display_location=>''INLINE_IN_NOTIFICATION''
,p_internal_uid=>139478269829819958
);
end;
') ;
 DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE);
 DBMS_SQL.CLOSE_CURSOR(c);
 DBMS_OUTPUT.PUT_LINE('Import block 5 compiled.');
EXCEPTION WHEN OTHERS THEN
 IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF;
 RAISE;
END;
/
DECLARE
 c INTEGER := DBMS_SQL.OPEN_CURSOR;
 s CLOB;
BEGIN
 s := to_clob('begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
') ;
 DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE);
 DBMS_SQL.CLOSE_CURSOR(c);
 DBMS_OUTPUT.PUT_LINE('Import block 6 compiled.');
EXCEPTION WHEN OTHERS THEN
 IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF;
 RAISE;
END;
/
EXIT
