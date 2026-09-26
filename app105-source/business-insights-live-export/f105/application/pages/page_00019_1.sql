prompt --application/pages/page_00019
begin
--   Manifest
--     PAGE: 00019
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
 p_id=>19
,p_name=>'Testing of Process Flow'
,p_alias=>'TESTING-OF-PROCESS-FLOW'
,p_step_title=>'Testing of Process Flow'
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
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'body {',
'  background-image: url(''#APP_FILES#Procure-to-Pay Process Flowchart.png'');',
'  background-position-x: center;',
'  background-position-y: center;',
'  background-size: 1400px 550px; /* or "contain" based on your preference */',
'  background-repeat: no-repeat;',
'  background-attachment: fixed; /* Optional - makes the background fixed while scrolling */',
'  font-size: 20px !important;',
'  font-family: Arial, sans-serif;',
'}',
'',
'.btn1 {',
'    position: absolute;',
'    left: 85px;',
'    top: 80px;',
'    background: url(''#APP_FILES#grn.png'') center center no-repeat;',
'    width: 107px;',
'    height: 107px;',
'    border-radius: 70%;',
'}',
'',
'',
'.txt1{',
'    position: absolute;',
'    left: 60px;',
'    top: 200px;',
'    width: 100px;',
'    height: 100px;',
'    font-stretch: extra-expanded;',
'    --ut-field-label-font-size: 1.50rem !important;',
'    --ut-field-label-font-weight: bold !important;',
'    --ut-field-label-text-color: white !important;',
'}',
'',
'.txt2{',
'    position: absolute;',
'    left: 415px;',
'    top: 200px;',
'    width: 100px;',
'    height: 100px;',
'    --ut-field-label-font-size: 1.50rem !important;',
'    --ut-field-label-font-weight: bold !important;',
'    --ut-field-label-text-color: white !important;',
'}',
'',
'.txt3{',
'    position: absolute;',
'    left: 650px;',
'    top: 200px;',
'    width: 50px;',
'    height: 10px;',
'    --ut-field-label-font-size: 1.50rem !important;',
'    --ut-field-label-font-weight: bold !important;',
'    --ut-field-label-text-color: white !important;',
'}',
'',
'.txt4{',
'    position: absolute;',
'    left: 770px;',
'    top: 200px;',
'    width: 50px;',
'    height: 10px;',
'    --ut-field-label-font-size: 1.50rem !important;',
'    --ut-field-label-font-weight: bold !important;',
'    --ut-field-label-text-color: white !important;',
'}',
'',
'.txt5{',
'    position: absolute;',
'    left: 970px;',
'    top: 200px;',
'    width: 50px;',
'    height: 10px;',
'    --ut-field-label-font-size: 1.50rem !important;',
'    --ut-field-label-font-weight: bold !important;',
'    --ut-field-label-text-color: white !important;',
'}',
'',
'.txt6{',
'    position: absolute;',
'    left: 1070px;',
'    top: 200px;',
'    width: 50px;',
'    height: 10px;',
'    --ut-field-label-font-size: 1.50rem !important;',
'    --ut-field-label-font-weight: bold !important;',
'    --ut-field-label-text-color: white !important;',
'}',
'',
'.txt7{',
'    position: absolute;',
'    left: 60px;',
'    top: 400px;',
'    width: 100px;',
'    height: 100px;',
'    --ut-field-label-font-size: 1.50rem !important;',
'    --ut-field-label-font-weight: bold !important;',
'    --ut-field-label-text-color: white !important;',
'}',
'',
'.txt8{',
'    position: absolute;',
'    left: 410px;',
'    top: 400px;',
'    width: 100px;',
'    height: 100px;',
'    --ut-field-label-font-size: 1.50rem !important;',
'    --ut-field-label-font-weight: bold !important;',
'    --ut-field-label-text-color: white !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(543045301538420672)
,p_button_sequence=>10
,p_button_name=>'New'
,p_static_id=>'new'
,p_button_static_id=>'myButton'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'t-Button--large'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'New'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3::'
,p_button_css_classes=>'btn1'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(543045347264420673)
,p_name=>'P19_NEW'
,p_item_sequence=>20
,p_prompt=>'Approval'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2318601014859922299
,p_item_css_classes=>'txt1'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge:t-Form-fieldContainer--boldDisplay'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(576503108500099929)
,p_name=>'P19_TEST'
,p_item_sequence=>30
,p_prompt=>'GRN'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2318601014859922299
,p_item_css_classes=>'txt2'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge:t-Form-fieldContainer--boldDisplay'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(576503187020099930)
,p_name=>'P19_TEXT2'
,p_item_sequence=>40
,p_prompt=>'Vendor'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2318601014859922299
,p_item_css_classes=>'txt3'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge:t-Form-fieldContainer--boldDisplay'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(576503288074099931)
,p_name=>'P19_TEXT3'
,p_item_sequence=>50
,p_prompt=>'Selection'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2318601014859922299
,p_item_css_classes=>'txt4'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge:t-Form-fieldContainer--boldDisplay'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(576503384705099932)
,p_name=>'P19_TEXT4'
,p_item_sequence=>60
,p_prompt=>'Order'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2318601014859922299
,p_item_css_classes=>'txt5'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge:t-Form-fieldContainer--boldDisplay'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(576503451913099933)
,p_name=>'P19_TEXT5'
,p_item_sequence=>70
,p_prompt=>'Creation'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2318601014859922299
,p_item_css_classes=>'txt6'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge:t-Form-fieldContainer--boldDisplay'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(576503582218099934)
,p_name=>'P19_TEXT6'
,p_item_sequence=>80
,p_prompt=>'Payment'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2318601014859922299
,p_item_css_classes=>'txt7'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge:t-Form-fieldContainer--boldDisplay'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(576503677897099935)
,p_name=>'P19_TEXT7'
,p_item_sequence=>90
,p_prompt=>'Invoice'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2318601014859922299
,p_item_css_classes=>'txt8'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge:t-Form-fieldContainer--boldDisplay'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
