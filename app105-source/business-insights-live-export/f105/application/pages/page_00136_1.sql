prompt --application/pages/page_00136
begin
--   Manifest
--     PAGE: 00136
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
 p_id=>136
,p_name=>'User Privilege'
,p_alias=>'USER-PRIVILEGE1'
,p_step_title=>'User Privilege'
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
'/* Keep the User Privilege detail actions consistent with the compact',
'   icon-button header used by the rest of the application. */',
'html.page-136 body:not(.t-PageBody--login) #passfailbuttons .t-ButtonRegion-buttons {',
'  display:flex!important;',
'  align-items:center!important;',
'  gap:6px!important;',
'}',
'html.page-136 body:not(.t-PageBody--login) #passfailbuttons .t-Button {',
'  display:inline-flex!important;',
'  align-items:center!important;',
'  justify-content:center!important;',
'  flex:0 0 42px!important;',
'  width:42px!important;',
'  min-width:42px!important;',
'  height:42px!important;',
'  min-height:42px!important;',
'  padding:0!important;',
'  border:1px solid #d7e1f0!important;',
'  border-radius:9px!important;',
'  background:#fff!important;',
'  color:#2856d8!important;',
'  box-shadow:none!important;',
'}',
'html.page-136 body:not(.t-PageBody--login) #passfailbuttons .t-Button:hover,',
'html.page-136 body:not(.t-PageBody--login) #passfailbuttons .t-Button:focus-visible {',
'  border-color:#9db4ef!important;',
'  background:#eef3ff!important;',
'  color:#1f4ed8!important;',
'}',
'html.page-136 body:not(.t-PageBody--login) #passfailbuttons .t-Button .t-Icon {',
'  color:inherit!important;',
'  font-size:16px!important;',
'}',
'',
'/* User Privilege form only: compact, clearly grouped administrative form.',
'   Every selector is rooted at page 136 and the region static id, so no',
'   other form or shared component inherits these rules. */',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 {',
'  border:0!important;',
'  border-radius:12px!important;',
'  background:#fff!important;',
'  box-shadow:0 4px 18px rgba(32,57,108,.08)!important;',
'  overflow:hidden;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 > .t-Region-header {',
'  display:none!important;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .t-Region-body {',
'  padding:10px!important;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-shell {',
'  display:grid;',
'  gap:10px;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-section {',
'  border:1px solid #dfe7f4;',
'  border-radius:8px;',
'  background:#fff;',
'  overflow:hidden;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-section-title {',
'  display:flex;',
'  align-items:center;',
'  min-height:36px;',
'  padding:7px 12px;',
'  border-bottom:1px solid #dfe7f4;',
'  background:linear-gradient(90deg,#f2f6fd 0%,#f8faff 100%);',
'  color:#19448e;',
'  font-size:13px;',
'  font-weight:700;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-section-title .t-Icon {',
'  width:18px;',
'  margin-right:8px;',
'  color:#1265c9;',
'  font-size:14px;',
'  text-align:center;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-section-help {',
'  margin-left:10px;',
'  color:#70809d;',
'  font-size:11px;',
'  font-weight:500;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-section-grid {',
'  display:grid;',
'  gap:12px 24px;',
'  padding:12px;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-user-grid {',
'  grid-template-columns:minmax(220px,1fr) minmax(220px,1fr) minmax(120px,.42fr);',
'  align-items:end;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-privilege-grid {',
'  grid-template-columns:repeat(3,minmax(150px,1fr));',
'  row-gap:10px;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-settings-grid {',
'  grid-template-columns:repeat(3,minmax(220px,1fr));',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-remark-grid {',
'  grid-template-columns:1fr;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-section-grid > .t-Form-fieldContainer {',
'  width:auto!important;',
'  max-width:none!important;',
'  margin:0!important;',
'  padding:0!important;',
'  grid-column:auto!important;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-section-grid > .t-Form-fieldContainer > .t-Form-inputContainer {',
'  width:100%!important;',
'  max-width:none!important;',
'  padding:0!important;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .t-Form-label {',
'  margin-bottom:5px!important;',
'  color:#263550!important;',
'  font-size:12px!important;',
'  font-weight:600!important;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .apex-item-display-only,',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 input.apex-item-text,',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 input.apex-item-number,',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 select.apex-item-select,',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 textarea.apex-item-textarea {',
'  width:100%!important;',
'  min-height:38px!important;',
'  border:1px solid #cfd9e9!important;',
'  border-radius:7px!important;',
'  background:#fff!important;',
'  color:#17233c!important;',
'  box-shadow:none!important;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .apex-item-display-only {',
'  display:flex!important;',
'  align-items:center;',
'  padding:7px 10px!important;',
'  background:#f8faff!important;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 input:focus,',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 select:focus,',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 textarea:focus {',
'  border-color:#6d94dd!important;',
'  box-shadow:0 0 0 3px rgba(53,105,200,.10)!important;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-privilege-grid .t-Form-fieldContainer {',
'  min-height:30px;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-privilege-grid .t-Form-inputContainer {',
'  display:flex;',
'  align-items:center;',
'  min-height:30px;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-privilege-grid .u-checkbox {',
'  display:flex!important;',
'  align-items:center!important;',
'  gap:8px;',
'  margin:0!important;',
'  color:#30415f!important;',
'  font-size:12px!important;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 input[type=checkbox] {',
'  width:17px!important;',
'  height:17px!important;',
'  accent-color:#2563c7;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 textarea.apex-item-textarea {',
'  min-height:72px!important;',
'  padding:9px 10px!important;',
'  resize:vertical!important;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-remark-grid .t-Form-labelContainer {',
'  display:none!important;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-remark-grid .apex-item-group--textarea {',
'  width:100%!important;',
'  max-width:none!important;',
'}',
'html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-orphan-row {',
'  display:none!important;',
'}',
'@media (max-width:900px) {',
'  html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-user-grid,',
'  html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-settings-grid {',
'    grid-template-columns:1fr 1fr;',
'  }',
'  html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-privilege-grid {',
'    grid-template-columns:1fr 1fr;',
'  }',
'}',
'@media (max-width:600px) {',
'  html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-user-grid,',
'  html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-settings-grid,',
'  html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-privilege-grid {',
'    grid-template-columns:1fr;',
'  }',
'  html.page-136 body:not(.t-PageBody--login) #R767290156304126240 .up-section-help {',
'    display:none;',
'  }',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function () {',
'  function buildUserPrivilegeLayout() {',
'    var root = document.querySelector(''#R767290156304126240 .t-Region-body'');',
'    if (!root || root.querySelector(''.up-shell'')) { return; }',
'',
'    function section(title, icon, help, gridClass) {',
'      var wrap = document.createElement(''section'');',
'      wrap.className = ''up-section'';',
'      var head = document.createElement(''div'');',
'      head.className = ''up-section-title'';',
'      head.innerHTML = ''<span class="t-Icon fa '' + icon + ''" aria-hidden="true"></span>'' +',
'        ''<span>'' + title + ''</span>'' +',
'        (help ? ''<span class="up-section-help">'' + help + ''</span>'' : '''');',
'      var grid = document.createElement(''div'');',
'      grid.className = ''up-section-grid '' + gridClass;',
'      wrap.appendChild(head);',
'      wrap.appendChild(grid);',
'      return { wrap: wrap, grid: grid };',
'    }',
'',
'    function move(itemName, target) {',
'      var node = document.getElementById(itemName + ''_CONTAINER'');',
'      if (node) { target.appendChild(node); }',
'    }',
'',
'    var shell = document.createElement(''div'');',
'    shell.className = ''up-shell'';',
'    var user = section(''User Details'', ''fa-file-text-o'', '''', ''up-user-grid'');',
'    var privileges = section(''Privileges'', ''fa-shield'', ''Select the operations allowed for this user on the selected module'', ''up-privilege-grid'');',
'    var settings = section(''Additional Settings'', ''fa-cog'', '''', ''up-settings-grid'');',
'    var remark = section(''Remark'', ''fa-file-text'', '''', ''up-remark-grid'');',
'',
'    [''P136_BOSSUSERNAME'',''P136_MODULENAME'',''P136_VIEWPRIVILEGE''].forEach(function (id) { move(id, user.grid); });',
'    [''P136_INSERTPRIVILEGE'',''P136_UPDATEPRIVILEGE'',''P136_DELETEPRIVILEGE'',''P136_STATUSPRIVILEGE'',''P136_PRINTPRIVILEGE'',''P136_OTHERPRIVILEGE'',''P136_CONTROLPRIVILEGE''].forEach(function (id) { move(id, privileges.grid); });',
'    [''P136_ALLOWEDFORWARDDAYS'',''P136_VOUCHERPOSTINGDATE'',''P136_ALLOWEDBACKDAYS''].forEach(function (id) { move(id, settings.grid); });',
'    move(''P136_REMARK'', remark.grid);',
'',
'    shell.appendChild(user.wrap);',
'    shell.appendChild(privileges.wrap);',
'    shell.appendChild(settings.wrap);',
'    shell.appendChild(remark.wrap);',
'    root.insertBefore(shell, root.firstChild);',
'',
'    Array.prototype.forEach.call(root.querySelectorAll('':scope > .container > .row, :scope > .row''), function (row) {',
'      if (!row.querySelector(''.t-Form-fieldContainer:not([style*="display: none"])'')) { row.classList.add(''up-orphan-row''); }',
'    });',
'  }',
'',
'  buildUserPrivilegeLayout();',
'  apex.jQuery(document).on(''apexafterrefresh'', ''#R767290156304126240'', buildUserPrivilegeLayout);',
'})();'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(847596272472224689)
,p_plug_name=>'PassFailButtons'
,p_static_id=>'passfailbuttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'BEFORE_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(767290156304126240)
,p_plug_name=>'User Privilege'
,p_static_id=>'user-privilege'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select BOSSUSERCODE,',
'       MODULECODE,',
'       VIEWPRIVILEGE,',
'       INSERTPRIVILEGE,',
'       UPDATEPRIVILEGE,',
'       DELETEPRIVILEGE,',
'       STATUSPRIVILEGE,',
'       REMARK,',
'       UPDATEDAYS,',
'       TNO,',
'       COMPANYCODE,',
'       CREATOR,',
'       PRINTPRIVILEGE,',
'       CREATIONTIME,',
'       OTHERPRIVILEGE,',
'       VOUCHERPOSTINGDATE,',
'       ALLOWEDBACKDAYS,',
'       ALLOWEDFORWARDDAYS,',
'       CONTROLPRIVILEGE,',
'       NVL(getdocumentstatuscode(''MODULEPRIVILEGE'',TNO),''STATUS'') AS Status',
'  from MODULEPRIVILEGE'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(595443271597637189)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(847596272472224689)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:135:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(595443719033637189)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(847596272472224689)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P136_BOSSUSERCODE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(595444135408637189)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(847596272472224689)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P136_BOSSUSERCODE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_icon_css_classes=>'fa-trash-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(595459256155637199)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(847596272472224689)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(595459666816637199)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(847596272472224689)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P136_TNO.'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(595458854531637199)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(847596272472224689)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(595460476702637203)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(847596272472224689)
,p_button_name=>'Post'
,p_static_id=>'post'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'Are you want to post this transaction?'
,p_confirm_style=>'warning'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-location-arrow fa-lg'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(595442889211637188)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(847596272472224689)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P136_BOSSUSERCODE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_icon_css_classes=>'fa-save-as'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(595460133442637202)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(847596272472224689)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_static_id=>'STATUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P136_STATUS.'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(595482191348637218)
,p_branch_name=>'Go To Page 135'
,p_branch_action=>'f?p=&APP_ID.:135:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767301236461126246)
,p_name=>'P136_ALLOWEDBACKDAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_prompt=>'Allowed Back Days'
,p_source=>'ALLOWEDBACKDAYS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767301594734126246)
,p_name=>'P136_ALLOWEDFORWARDDAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_prompt=>'Allowed Forward Days'
,p_source=>'ALLOWEDFORWARDDAYS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767294870584126244)
,p_name=>'P136_BOSSUSERCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_source=>'BOSSUSERCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767179500439825076)
,p_name=>'P136_BOSSUSERNAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_default=>'SELECT BOSSUSERNAME FROM BOSSUSER WHERE BOSSUSERCODE = :P136_BOSSUSERCODE;'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Bossusername'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(839395424853599487)
,p_name=>'P136_CALLEDFROMPAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(847596272472224689)
,p_item_default=>'103'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767298807225126245)
,p_name=>'P136_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767301999608126247)
,p_name=>'P136_CONTROLPRIVILEGE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_prompt=>'Control'
,p_source=>'CONTROLPRIVILEGE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>7
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767300063878126246)
,p_name=>'P136_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767299222054126246)
,p_name=>'P136_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767296828724126245)
,p_name=>'P136_DELETEPRIVILEGE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_prompt=>'Delete'
,p_source=>'DELETEPRIVILEGE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>7
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767432527404702886)
,p_name=>'P136_ERRORMESSAGE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(841678543326167225)
,p_name=>'P136_FORMSTATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(847596272472224689)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767296032511126244)
,p_name=>'P136_INSERTPRIVILEGE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_prompt=>'Insert'
,p_source=>'INSERTPRIVILEGE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767295240270126244)
,p_name=>'P136_MODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767179660509825077)
,p_name=>'P136_MODULENAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_default=>'SELECT MODULENAME FROM MODULE WHERE MODULECODE = :P136_MODULECODE;'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Modulename'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767432426833702885)
,p_name=>'P136_MYERROR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767300398661126246)
,p_name=>'P136_OTHERPRIVILEGE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_prompt=>'Other'
,p_source=>'OTHERPRIVILEGE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(849405350362573386)
,p_name=>'P136_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(847596272472224689)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767299607818126246)
,p_name=>'P136_PRINTPRIVILEGE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_prompt=>'Print'
,p_source=>'PRINTPRIVILEGE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767297600324126245)
,p_name=>'P136_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_prompt=>'Remark'
,p_placeholder=>'Enter remarks here...'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>1000
,p_cHeight=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(772456891868940277)
,p_name=>'P136_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_default=>'STATUS'
,p_source=>'STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767297282584126245)
,p_name=>'P136_STATUSPRIVILEGE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_prompt=>'Status'
,p_source=>'STATUSPRIVILEGE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_colspan=>2
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(849405186717573385)
,p_name=>'P136_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(847596272472224689)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select B.STATUSPRIVILEGE',
'  From module a, moduleprivilege b, bossuser c',
' Where a.modulecode = b.modulecode',
'   And b.bossusercode = c.bossusercode',
'   And c.loginname = :GLOBAL_LOGINNAME',
'   And A.ENTRYPAGENO = :APP_PAGE_ID',
'   AND B.COMPANYCODE = :GLOBAL_COMPANYCODE'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767298402644126245)
,p_name=>'P136_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767297999792126245)
,p_name=>'P136_UPDATEDAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_source=>'UPDATEDAYS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767296486571126244)
,p_name=>'P136_UPDATEPRIVILEGE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_prompt=>'Update'
,p_source=>'UPDATEPRIVILEGE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767295643171126244)
,p_name=>'P136_VIEWPRIVILEGE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_prompt=>'View'
,p_source=>'VIEWPRIVILEGE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_colspan=>2
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(767300822100126246)
,p_name=>'P136_VOUCHERPOSTINGDATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_item_source_plug_id=>wwv_flow_imp.id(767290156304126240)
,p_prompt=>'Voucher Posting Date'
,p_source=>'VOUCHERPOSTINGDATE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:ENTRY;ENTRY,SYSTEM;SYSTEM'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(595465596106637210)
,p_validation_name=>'ALLOWEDBACKDAYS'
,p_static_id=>'allowedbackdays'
,p_validation_sequence=>90
,p_validation=>':P136_MYERROR IS NULL'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'&P136_ERRORMESSAGE.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_imp.id(767301236461126246)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(595465214172637210)
,p_validation_name=>'CONTROL'
,p_static_id=>'control'
,p_validation_sequence=>80
,p_validation=>':P136_MYERROR IS NULL'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'&P136_ERRORMESSAGE.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_imp.id(767301999608126247)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(595463591059637210)
,p_validation_name=>'DELETE'
,p_static_id=>'delete'
,p_validation_sequence=>40
,p_validation=>':P136_MYERROR IS NULL'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'&P136_ERRORMESSAGE.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_imp.id(767296828724126245)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(595462845064637210)
,p_validation_name=>'INSERT'
,p_static_id=>'insert'
,p_validation_sequence=>20
,p_validation=>':P136_MYERROR IS NULL'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'&P136_ERRORMESSAGE.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_imp.id(767296032511126244)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(595464789597637210)
,p_validation_name=>'OTHER'
,p_static_id=>'other'
,p_validation_sequence=>70
,p_validation=>':P136_MYERROR IS NULL'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'&P136_ERRORMESSAGE.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_imp.id(767300398661126246)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(595464445167637210)
,p_validation_name=>'PRINT'
,p_static_id=>'print'
,p_validation_sequence=>60
,p_validation=>':P136_MYERROR IS NULL'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'&P136_ERRORMESSAGE.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_imp.id(767299607818126246)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(595463982920637210)
,p_validation_name=>'STATUS'
,p_static_id=>'status'
,p_validation_sequence=>50
,p_validation=>':P136_MYERROR IS NULL'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'&P136_ERRORMESSAGE.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_imp.id(767297282584126245)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(595463209851637210)
,p_validation_name=>'UPDATE'
,p_static_id=>'update'
,p_validation_sequence=>30
,p_validation=>':P136_MYERROR IS NULL'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'&P136_ERRORMESSAGE.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_imp.id(767296486571126244)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(595462355351637206)
,p_validation_name=>'VIEW'
,p_static_id=>'view'
,p_validation_sequence=>10
,p_validation=>':P136_MYERROR IS NULL'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'&P136_ERRORMESSAGE.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_imp.id(767295643171126244)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(595473070851637214)
,p_name=>'ALLOWEDBACKDAYS CHANGE'
,p_static_id=>'allowedbackdays-change'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P136_ALLOWEDBACKDAYS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595473546558637214)
,p_event_id=>wwv_flow_imp.id(595473070851637214)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P136_MYERROR,P136_ERRORMESSAGE',
  'items_to_submit', 'P136_MYERROR,P136_ERRORMESSAGE,P136_MODULECODE,P136_ALLOWEDBACKDAYS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '      FOR vModulePrivilege IN ( select',
    '  					a.BossUserCode,',
    '  					a.TNo,',
    '  					a.ViewPrivilege,',
    '  					a.InsertPrivilege,',
    '  					a.UpdatePrivilege,',
    '  					a.DeletePrivilege,',
    '  					a.PrintPrivilege,',
    '  					a.StatusPrivilege,',
    '  					a.OtherPrivilege,',
    '  					a.ControlPrivilege,',
    '  					a.UpdateDays,',
    '  					a.AllowedBackDays,',
    '  					a.AllowedForwardDays',
    '  			from ModulePrivilege a, BossUserRole b, BossUser c',
    '  			where a.BossUserCode = b.BossUserRoleCode',
    '  					and a.CompanyCode = b.CompanyCode',
    '  					and b.TNO = c.TNo',
    '  					and a.CompanyCode = :GLOBAL_COMPANYCODE',
    '  					and a.ModuleCode = :P136_MODULECODE',
    '  					and c.LoginName = :GLOBAL_LOGINNAME',
    '             ) LOOP',
    '              /*if vModulePrivilege.BossUserCode = :P136_BossUserCode then',
    '				',
    '				if GetModulePrivilegeExtra(''USERCANSETPRIVILEGEFORSELF'', :P136_ModuleCode, :GLOBAL_COMPANYCODE, :GLOBAL_LOGINNAME) != ''YES'' then',
    '						for vExtraPrivilege',
    '								in (',
    '										select',
    '												a.ExtraPrivilegeName',
    '										from ExtraPrivilege a',
    '										where a.ExtraPrivilegeCode = ''USERCANSETPRIVILEGEFORSELF''',
    '								)',
    '						loop',
    '								    :P136_MyError := ''ERROR'';',
    '                                    :P136_ErrorMessage := ''Please ask for Extra privilege '' || vExtraPrivilege.ExtraPrivilegeName || ''.'';',
    '                                exit;',
    '						end loop;',
    '				end if;							',
    '		    end if;',
    '            */',
    '              if :P136_MyError is null then',
    '',
    '                if nvl(:P136_AllowedBackDays, 0) > nvl(vModulePrivilege.AllowedBackDays, 0)  and vModulePrivilege.AllowedBackDays is not null then',
    '				',
    '                 :P136_MyError := ''ERROR'';',
    '                 :P136_ErrorMessage := ''Allowed to set Back Date Entry Days maximum '' ||  to_char(vModulePrivilege.AllowedBackDays) ;',
    '                END IF;',
    '              end if;',
    '             END LOOP;',
    '       ',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(595473993822637214)
,p_name=>'ALLOWEDFORWARDDAYS CHANGE'
,p_static_id=>'allowedforwarddays-change'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P136_ALLOWEDFORWARDDAYS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595474462648637216)
,p_event_id=>wwv_flow_imp.id(595473993822637214)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P136_MYERROR,P136_ERRORMESSAGE',
  'items_to_submit', 'P136_MYERROR,P136_ERRORMESSAGE,P136_MODULECODE,P136_ALLOWEDFORWARDDAYS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '      FOR vModulePrivilege IN ( select',
    '  					a.BossUserCode,',
    '  					a.TNo,',
    '  					a.ViewPrivilege,',
    '  					a.InsertPrivilege,',
    '  					a.UpdatePrivilege,',
    '  					a.DeletePrivilege,',
    '  					a.PrintPrivilege,',
    '  					a.StatusPrivilege,',
    '  					a.OtherPrivilege,',
    '  					a.ControlPrivilege,',
    '  					a.UpdateDays,',
    '  					a.AllowedBackDays,',
    '  					a.AllowedForwardDays',
    '  			from ModulePrivilege a, BossUserRole b, BossUser c',
    '  			where a.BossUserCode = b.BossUserRoleCode',
    '  					and a.CompanyCode = b.CompanyCode',
    '  					and b.TNO = c.TNo',
    '  					and a.CompanyCode = :GLOBAL_COMPANYCODE',
    '  					and a.ModuleCode = :P136_MODULECODE',
    '  					and c.LoginName = :GLOBAL_LOGINNAME',
    '             ) LOOP',
    '			/*if vModulePrivilege.BossUserCode = :P136_BossUserCode then',
    '				',
    '				if GetModulePrivilegeExtra(''USERCANSETPRIVILEGEFORSELF'', :P136_ModuleCode, :GLOBAL_COMPANYCODE, :GLOBAL_LOGINNAME) != ''YES'' then',
    '						for vExtraPrivilege',
    '								in (',
    '										select',
    '												a.ExtraPrivilegeName',
    '										from ExtraPrivilege a',
    '										where a.ExtraPrivilegeCode = ''USERCANSETPRIVILEGEFORSELF''',
    '								)',
    '						loop',
    '								    :P136_MyError := ''ERROR'';',
    '                                    :P136_ErrorMessage := ''Please ask for Extra privilege '' || vExtraPrivilege.ExtraPrivilegeName || ''.'';',
    '                                exit;',
    '						end loop;',
    '				end if;							',
    '		    end if;',
    '            */',
    '              if :P136_MyError is null then',
    '                if nvl(:P136_AllowedForwardDays, 0) > nvl(vModulePrivilege.AllowedForwardDays, 0)  and vModulePrivilege.AllowedForwardDays is not null then',
    '				',
    '                 :P136_MyError := ''ERROR'';',
    '                 :P136_ErrorMessage := ''Allowed to set Forward Date Entry Days maximum '' || to_char(vModulePrivilege.AllowedForwardDays) ;',
    '                END IF;',
    '              end if;',
    '             END LOOP;',
    '       ',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(595472201545637213)
,p_name=>'CONTROL CHANGE'
,p_static_id=>'control-change'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P136_CONTROLPRIVILEGE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595472675990637214)
,p_event_id=>wwv_flow_imp.id(595472201545637213)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P136_MYERROR,P136_ERRORMESSAGE',
  'items_to_submit', 'P136_MYERROR,P136_ERRORMESSAGE,P136_MODULECODE,P136_CONTROLPRIVILEGE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '      FOR vModulePrivilege IN ( select',
    '  					a.BossUserCode,',
    '  					a.TNo,',
    '  					a.ViewPrivilege,',
    '  					a.InsertPrivilege,',
    '  					a.UpdatePrivilege,',
    '  					a.DeletePrivilege,',
    '  					a.PrintPrivilege,',
    '  					a.StatusPrivilege,',
    '  					a.OtherPrivilege,',
    '  					a.ControlPrivilege,',
    '  					a.UpdateDays,',
    '  					a.AllowedBackDays,',
    '  					a.AllowedForwardDays',
    '  			from ModulePrivilege a, BossUserRole b, BossUser c',
    '  			where a.BossUserCode = b.BossUserRoleCode',
    '  					and a.CompanyCode = b.CompanyCode',
    '  					and b.TNO = c.TNo',
    '  					and a.CompanyCode = :GLOBAL_COMPANYCODE',
    '  					and a.ModuleCode = :P136_MODULECODE',
    '  					and c.LoginName = :GLOBAL_LOGINNAME',
    '             ) LOOP',
    '            /* if vModulePrivilege.BossUserCode = :P136_BossUserCode then',
    '				',
    '				if GetModulePrivilegeExtra(''USERCANSETPRIVILEGEFORSELF'', :P136_ModuleCode, :GLOBAL_COMPANYCODE, :GLOBAL_LOGINNAME) != ''YES'' then',
    '						for vExtraPrivilege',
    '								in (',
    '										select',
    '										 a.ExtraPrivilegeName',
    '										from ExtraPrivilege a',
    '										where a.ExtraPrivilegeCode = ''USERCANSETPRIVILEGEFORSELF''',
    '								)',
    '						loop',
    '								    :P136_MyError := ''ERROR'';',
    '                                    :P136_ErrorMessage := ''Please ask for Extra privilege '' || vExtraPrivilege.ExtraPrivilegeName || ''.'';',
    '                                exit;',
    '						end loop;',
    '				end if;							',
    '		    end if;',
    '            */',
    '              if :P136_MyError is null then',
    '',
    '                if :P136_ControlPrivilege = ''YES'' and vModulePrivilege.ControlPrivilege = ''NO'' then',
    '',
    '                 :P136_MyError := ''ERROR'';',
    '                 :P136_ErrorMessage := ''Please get Control Privilege for module '' ||  :P136_MODULENAME || '' then you may share it to others.'';',
    '                END IF;',
    '               END IF;',
    '             END LOOP;',
    '       ',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(595468631958637211)
,p_name=>'DELETE CHANGE'
,p_static_id=>'delete-change'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P136_DELETEPRIVILEGE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595469081494637212)
,p_event_id=>wwv_flow_imp.id(595468631958637211)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P136_MYERROR,P136_ERRORMESSAGE',
  'items_to_submit', 'P136_MYERROR,P136_ERRORMESSAGE,P136_MODULECODE,P136_DELETEPRIVILEGE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '      FOR vModulePrivilege IN ( select',
    '  					a.BossUserCode,',
    '  					a.TNo,',
    '  					a.ViewPrivilege,',
    '  					a.InsertPrivilege,',
    '  					a.UpdatePrivilege,',
    '  					a.DeletePrivilege,',
    '  					a.PrintPrivilege,',
    '  					a.StatusPrivilege,',
    '  					a.OtherPrivilege,',
    '  					a.ControlPrivilege,',
    '  					a.UpdateDays,',
    '  					a.AllowedBackDays,',
    '  					a.AllowedForwardDays',
    '  			from ModulePrivilege a, BossUserRole b, BossUser c',
    '  			where a.BossUserCode = b.BossUserRoleCode',
    '  					and a.CompanyCode = b.CompanyCode',
    '  					and b.TNO = c.TNo',
    '  					and a.CompanyCode = :GLOBAL_COMPANYCODE',
    '  					and a.ModuleCode = :P136_MODULECODE',
    '  					and c.LoginName = :GLOBAL_LOGINNAME',
    '             ) LOOP',
    '             /*if vModulePrivilege.BossUserCode = :P136_BossUserCode then',
    '				',
    '				if GetModulePrivilegeExtra(''USERCANSETPRIVILEGEFORSELF'', :P136_ModuleCode, :GLOBAL_COMPANYCODE, :GLOBAL_LOGINNAME) != ''YES'' then',
    '						for vExtraPrivilege',
    '								in (',
    '										select',
    '												a.ExtraPrivilegeName',
    '										from ExtraPrivilege a',
    '										where a.ExtraPrivilegeCode = ''USERCANSETPRIVILEGEFORSELF''',
    '								)',
    '						loop',
    '								    :P136_MyError := ''ERROR'';',
    '                                    :P136_ErrorMessage := ''Please ask for Extra privilege '' || vExtraPrivilege.ExtraPrivilegeName || ''.'';',
    '                                exit;',
    '						end loop;',
    '				end if;							',
    '		    end if;',
    '             */',
    '              if :P136_MyError is null then',
    '',
    '                if :P136_DeletePrivilege = ''YES'' and vModulePrivilege.DeletePrivilege = ''NO'' then',
    '',
    '                 :P136_MyError := ''ERROR'';',
    '                 :P136_ErrorMessage := ''Please get Delete Privilege for module '' ||  :P136_MODULENAME || '' then you may share it to others.'';',
    '                END IF;',
    '              end if;',
    '             END LOOP;',
    '       ',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(595478718025637217)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(595460133442637202)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595481698588637218)
,p_event_id=>wwv_flow_imp.id(595478718025637217)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(595460133442637202)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P136_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595481185512637218)
,p_event_id=>wwv_flow_imp.id(595478718025637217)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(595460133442637202)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P136_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595479738306637217)
,p_event_id=>wwv_flow_imp.id(595478718025637217)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P136_TNO,P136_STATUS',
  'language', 'PLSQL',
  'plsql_code', 'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P136_TNO,:P136_STATUS);',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595480164676637218)
,p_event_id=>wwv_flow_imp.id(595478718025637217)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(595460133442637202)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text('''');',
    '$(''#STATUS'').text($v(''P136_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595480714330637218)
,p_event_id=>wwv_flow_imp.id(595478718025637217)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(847596272472224689)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595479196987637217)
,p_event_id=>wwv_flow_imp.id(595478718025637217)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P136_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(595476754265637217)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(595459256155637199)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595477776169637217)
,p_event_id=>wwv_flow_imp.id(595476754265637217)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P136_TNO,P136_COMPANYCODE,P136_PURCHASEORDERNO',
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
    '						and a.ModuleTNo = '':P''||to_char(:APP_PAGE_ID)||''_TNo''',
    '						and d.LoginName = User',
    '						and a.isPass is null',
    '						and a.IsFail is null',
    '						and a.IsForwarded is null',
    '						and a.IsRebounded is null																				',
    '		;',
    '		vPassFail cPassFail%rowtype;',
    '    ',
    '    tTokenNo NUMBER;',
    '    TMP VARCHAR2(100) := :P60_TNO;',
    'begin',
    '		open cPassFail;',
    '		fetch cPassFail into vPassFail;',
    '		if cPassFail%FOUND then',
    '				tTokenNo := vPassFail.TokenNo;',
    '				close cPassFail;',
    '',
    '           	',
    '				update PassFail a',
    '				set a.IsFail = ''YES'',',
    '						a.remark = '':P''||to_char(:APP_PAGE_ID)||''_PASSFAILREMARK''',
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
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595478250056637217)
,p_event_id=>wwv_flow_imp.id(595476754265637217)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(847596272472224689)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595477275941637217)
,p_event_id=>wwv_flow_imp.id(595476754265637217)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P136_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P136_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(445914408540617191)
,p_name=>'Hide Nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>140
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(445914485234617192)
,p_event_id=>wwv_flow_imp.id(445914408540617191)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(595466755446637211)
,p_name=>'INSERT CHANGE'
,p_static_id=>'insert-change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P136_INSERTPRIVILEGE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595467322438637211)
,p_event_id=>wwv_flow_imp.id(595466755446637211)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P136_MYERROR,P136_ERRORMESSAGE',
  'items_to_submit', 'P136_MYERROR,P136_ERRORMESSAGE,P136_MODULECODE,P136_INSERTPRIVILEGE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '      FOR vModulePrivilege IN ( select',
    '  					a.BossUserCode,',
    '  					a.TNo,',
    '  					a.ViewPrivilege,',
    '  					a.InsertPrivilege,',
    '  					a.UpdatePrivilege,',
    '  					a.DeletePrivilege,',
    '  					a.PrintPrivilege,',
    '  					a.StatusPrivilege,',
    '  					a.OtherPrivilege,',
    '  					a.ControlPrivilege,',
    '  					a.UpdateDays,',
    '  					a.AllowedBackDays,',
    '  					a.AllowedForwardDays',
    '  			from ModulePrivilege a, BossUserRole b, BossUser c',
    '  			where a.BossUserCode = b.BossUserRoleCode',
    '  					and a.CompanyCode = b.CompanyCode',
    '  					and b.TNO = c.TNo',
    '  					and a.CompanyCode = :GLOBAL_COMPANYCODE',
    '  					and a.ModuleCode = :P136_MODULECODE',
    '  					and c.LoginName = :GLOBAL_LOGINNAME',
    '             ) LOOP',
    '             /*if vModulePrivilege.BossUserCode = :P136_BossUserCode then',
    '				',
    '				if GetModulePrivilegeExtra(''USERCANSETPRIVILEGEFORSELF'', :P136_ModuleCode, :GLOBAL_COMPANYCODE, :GLOBAL_LOGINNAME) != ''YES'' then',
    '						for vExtraPrivilege',
    '								in (',
    '										select',
    '												a.ExtraPrivilegeName',
    '										from ExtraPrivilege a',
    '										where a.ExtraPrivilegeCode = ''USERCANSETPRIVILEGEFORSELF''',
    '								)',
    '						loop',
    '								    :P136_MyError := ''ERROR'';',
    '                                    :P136_ErrorMessage := ''Please ask for Extra privilege '' || vExtraPrivilege.ExtraPrivilegeName || ''.'';',
    '                                exit;',
    '						end loop;',
    '				end if;							',
    '		    end if;',
    '            */',
    '',
    '              if :P136_MyError is null then',
    '',
    '                if :P136_InsertPrivilege = ''YES'' and vModulePrivilege.InsertPrivilege = ''NO'' then',
    '',
    '                 :P136_MyError := ''ERROR'';',
    '                 :P136_ErrorMessage := ''Please get Insert Privilege for module '' ||  :P136_MODULENAME || '' then you may share it to others.'';',
    '                END IF;',
    '              end if;',
    '             END LOOP;',
    '       ',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(595471340467637212)
,p_name=>'OTHER CHANGE'
,p_static_id=>'other-change'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P136_OTHERPRIVILEGE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595471775449637213)
,p_event_id=>wwv_flow_imp.id(595471340467637212)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P136_MYERROR,P136_ERRORMESSAGE',
  'items_to_submit', 'P136_MYERROR,P136_ERRORMESSAGE,P136_MODULECODE,P136_OTHERPRIVILEGE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '      FOR vModulePrivilege IN ( select',
    '  					a.BossUserCode,',
    '  					a.TNo,',
    '  					a.ViewPrivilege,',
    '  					a.InsertPrivilege,',
    '  					a.UpdatePrivilege,',
    '  					a.DeletePrivilege,',
    '  					a.PrintPrivilege,',
    '  					a.StatusPrivilege,',
    '  					a.OtherPrivilege,',
    '  					a.ControlPrivilege,',
    '  					a.UpdateDays,',
    '  					a.AllowedBackDays,',
    '  					a.AllowedForwardDays',
    '  			from ModulePrivilege a, BossUserRole b, BossUser c',
    '  			where a.BossUserCode = b.BossUserRoleCode',
    '  					and a.CompanyCode = b.CompanyCode',
    '  					and b.TNO = c.TNo',
    '  					and a.CompanyCode = :GLOBAL_COMPANYCODE',
    '  					and a.ModuleCode = :P136_MODULECODE',
    '  					and c.LoginName = :GLOBAL_LOGINNAME',
    '             ) LOOP',
    '            /* if vModulePrivilege.BossUserCode = :P136_BossUserCode then',
    '				',
    '				if GetModulePrivilegeExtra(''USERCANSETPRIVILEGEFORSELF'', :P136_ModuleCode, :GLOBAL_COMPANYCODE, :GLOBAL_LOGINNAME) != ''YES'' then',
    '						for vExtraPrivilege',
    '								in (',
    '										select',
    '												a.ExtraPrivilegeName',
    '										from ExtraPrivilege a',
    '										where a.ExtraPrivilegeCode = ''USERCANSETPRIVILEGEFORSELF''',
    '								)',
    '						loop',
    '								    :P136_MyError := ''ERROR'';',
    '                                    :P136_ErrorMessage := ''Please ask for Extra privilege '' || vExtraPrivilege.ExtraPrivilegeName || ''.'';',
    '                                exit;',
    '						end loop;',
    '				end if;							',
    '		    end if;',
    '            */',
    '              if :P136_MyError is null then',
    '',
    '                if :P136_OtherPrivilege = ''YES'' and vModulePrivilege.OtherPrivilege = ''NO'' then',
    '',
    '                 :P136_MyError := ''ERROR'';',
    '                 :P136_ErrorMessage := ''Please get Other Privilege for module '' ||  :P136_MODULENAME || '' then you may share it to others.'';',
    '                END IF;',
    '              end if;',
    '             END LOOP;',
    '       ',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(595474891843637216)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(595458854531637199)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595475868837637216)
,p_event_id=>wwv_flow_imp.id(595474891843637216)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P136_TNO,P136_COMPANYCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  tModuleCode  Varchar2(30);',
    '  TMP          vARCHAR2(100) ;--:= :P80_PICKUPREQUESTNO;',
    'cursor cPassFail is',
    '		select',
    '				a.TNo',
    '		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '		where a.ModuleFlowTNo = b.TNo',
    '				and b.TNo = c.TNo',
    '				and a.BossUserCode = c.BossUserCode',
    '				and c.BossUserCode = d.BossUserCode',
    '				and a.ModuleTNo = '':P''||:APP_PAGE_ID||''_TNo''',
    '				and d.LoginName = User',
    '				and a.isPass is null',
    '				and a.IsFail is null',
    '				and a.IsForwarded is null',
    '				and a.IsRebounded is null										',
    ';',
    'vPassFail cPassFail%rowtype;',
    'BEGIN',
    '',
    '    select',
    '    	d.ModuleCode, '':P''||:APP_PAGE_ID||''_''||labelcolumnname ',
    '                into tModuleCode,tmp',
    '    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
    '    where a.LocationCode = b.LocationCode',
    '    	and b.tno = c.tno',
    '    	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
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
    '				a.remark = '':P''||:APP_PAGE_ID||''_PASSFAILREMARK''',
    '			where a.TNo = vPassFail.TNo;',
    '			',
    '			close cPassFail;',
    '			',
    '			',
    '			SendPassFailForward(tModuleCode, '':P''||:APP_PAGE_ID||''_TNo'' , TMP, :global_CompanyCode );',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595476362523637216)
,p_event_id=>wwv_flow_imp.id(595474891843637216)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(847596272472224689)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595475368517637216)
,p_event_id=>wwv_flow_imp.id(595474891843637216)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P136_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P136_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(595470380912637212)
,p_name=>'PRINT CHANGE'
,p_static_id=>'print-change'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P136_PRINTPRIVILEGE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595470943239637212)
,p_event_id=>wwv_flow_imp.id(595470380912637212)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P136_MYERROR,P136_ERRORMESSAGE',
  'items_to_submit', 'P136_MYERROR,P136_ERRORMESSAGE,P136_MODULECODE,P136_PRINTPRIVILEGE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '      FOR vModulePrivilege IN ( select',
    '  					a.BossUserCode,',
    '  					a.TNo,',
    '  					a.ViewPrivilege,',
    '  					a.InsertPrivilege,',
    '  					a.UpdatePrivilege,',
    '  					a.DeletePrivilege,',
    '  					a.PrintPrivilege,',
    '  					a.StatusPrivilege,',
    '  					a.OtherPrivilege,',
    '  					a.ControlPrivilege,',
    '  					a.UpdateDays,',
    '  					a.AllowedBackDays,',
    '  					a.AllowedForwardDays',
    '  			from ModulePrivilege a, BossUserRole b, BossUser c',
    '  			where a.BossUserCode = b.BossUserRoleCode',
    '  					and a.CompanyCode = b.CompanyCode',
    '  					and b.TNO = c.TNo',
    '  					and a.CompanyCode = :GLOBAL_COMPANYCODE',
    '  					and a.ModuleCode = :P136_MODULECODE',
    '  					and c.LoginName = :GLOBAL_LOGINNAME',
    '             ) LOOP',
    '             /*if vModulePrivilege.BossUserCode = :P136_BossUserCode then',
    '				',
    '				if GetModulePrivilegeExtra(''USERCANSETPRIVILEGEFORSELF'', :P136_ModuleCode, :GLOBAL_COMPANYCODE, :GLOBAL_LOGINNAME) != ''YES'' then',
    '						for vExtraPrivilege',
    '								in (',
    '										select',
    '												a.ExtraPrivilegeName',
    '										from ExtraPrivilege a',
    '										where a.ExtraPrivilegeCode = ''USERCANSETPRIVILEGEFORSELF''',
    '								)',
    '						loop',
    '								    :P136_MyError := ''ERROR'';',
    '                                    :P136_ErrorMessage := ''Please ask for Extra privilege '' || vExtraPrivilege.ExtraPrivilegeName || ''.'';',
    '                                exit;',
    '						end loop;',
    '				end if;							',
    '		    end if;',
    '            */',
    '              if :P136_MyError is null then',
    '',
    '                if :P136_PrintPrivilege = ''YES'' and vModulePrivilege.PrintPrivilege = ''NO'' then',
    '',
    '                 :P136_MyError := ''ERROR'';',
    '                 :P136_ErrorMessage := ''Please get Print Privilege for module '' ||  :P136_MODULENAME || '' then you may share it to others.'';',
    '                END IF;',
    '              end if;',
    '             END LOOP;',
    '       ',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(595469451586637212)
,p_name=>'STATUS CHANGE'
,p_static_id=>'status-change'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P136_STATUSPRIVILEGE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595470009030637212)
,p_event_id=>wwv_flow_imp.id(595469451586637212)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P136_MYERROR,P136_ERRORMESSAGE',
  'items_to_submit', 'P136_MYERROR,P136_ERRORMESSAGE,P136_MODULECODE,P136_STATUSPRIVILEGE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '      FOR vModulePrivilege IN ( select',
    '  					a.BossUserCode,',
    '  					a.TNo,',
    '  					a.ViewPrivilege,',
    '  					a.InsertPrivilege,',
    '  					a.UpdatePrivilege,',
    '  					a.DeletePrivilege,',
    '  					a.PrintPrivilege,',
    '  					a.StatusPrivilege,',
    '  					a.OtherPrivilege,',
    '  					a.ControlPrivilege,',
    '  					a.UpdateDays,',
    '  					a.AllowedBackDays,',
    '  					a.AllowedForwardDays',
    '  			from ModulePrivilege a, BossUserRole b, BossUser c',
    '  			where a.BossUserCode = b.BossUserRoleCode',
    '  					and a.CompanyCode = b.CompanyCode',
    '  					and b.TNO = c.TNo',
    '  					and a.CompanyCode = :GLOBAL_COMPANYCODE',
    '  					and a.ModuleCode = :P136_MODULECODE',
    '  					and c.LoginName = :GLOBAL_LOGINNAME',
    '             ) LOOP',
    '             /*if vModulePrivilege.BossUserCode = :P136_BossUserCode then',
    '				',
    '				if GetModulePrivilegeExtra(''USERCANSETPRIVILEGEFORSELF'', :P136_ModuleCode, :GLOBAL_COMPANYCODE, :GLOBAL_LOGINNAME) != ''YES'' then',
    '						for vExtraPrivilege',
    '								in (',
    '										select',
    '												a.ExtraPrivilegeName',
    '										from ExtraPrivilege a',
    '										where a.ExtraPrivilegeCode = ''USERCANSETPRIVILEGEFORSELF''',
    '								)',
    '						loop',
    '								    :P136_MyError := ''ERROR'';',
    '                                    :P136_ErrorMessage := ''Please ask for Extra privilege '' || vExtraPrivilege.ExtraPrivilegeName || ''.'';',
    '                                exit;',
    '						end loop;',
    '				end if;							',
    '		    end if;',
    '            */',
    '',
    '              if :P136_MyError is null then',
    '',
    '                if :P136_StatusPrivilege = ''YES'' and vModulePrivilege.StatusPrivilege = ''NO'' then',
    '',
    '                 :P136_MyError := ''ERROR'';',
    '                 :P136_ErrorMessage := ''Please get Status Privilege for module '' ||  :P136_MODULENAME || '' then you may share it to others.'';',
    '                END IF;',
    '              end if;',
    '             END LOOP;',
    '       ',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(595467707861637211)
,p_name=>'UPDATE CHANGE'
,p_static_id=>'update-change'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P136_UPDATEPRIVILEGE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595468238722637211)
,p_event_id=>wwv_flow_imp.id(595467707861637211)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P136_MYERROR,P136_ERRORMESSAGE',
  'items_to_submit', 'P136_MYERROR,P136_ERRORMESSAGE,P136_MODULECODE,P136_UPDATEPRIVILEGE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '      FOR vModulePrivilege IN ( select',
    '  					a.BossUserCode,',
    '  					a.TNo,',
    '  					a.ViewPrivilege,',
    '  					a.InsertPrivilege,',
    '  					a.UpdatePrivilege,',
    '  					a.DeletePrivilege,',
    '  					a.PrintPrivilege,',
    '  					a.StatusPrivilege,',
    '  					a.OtherPrivilege,',
    '  					a.ControlPrivilege,',
    '  					a.UpdateDays,',
    '  					a.AllowedBackDays,',
    '  					a.AllowedForwardDays',
    '  			from ModulePrivilege a, BossUserRole b, BossUser c',
    '  			where a.BossUserCode = b.BossUserRoleCode',
    '  					and a.CompanyCode = b.CompanyCode',
    '  					and b.TNO = c.TNo',
    '  					and a.CompanyCode = :GLOBAL_COMPANYCODE',
    '  					and a.ModuleCode = :P136_MODULECODE',
    '  					and c.LoginName = :GLOBAL_LOGINNAME',
    '             ) LOOP',
    '             /*if vModulePrivilege.BossUserCode = :P136_BossUserCode then',
    '				',
    '				if GetModulePrivilegeExtra(''USERCANSETPRIVILEGEFORSELF'', :P136_ModuleCode, :GLOBAL_COMPANYCODE, :GLOBAL_LOGINNAME) != ''YES'' then',
    '						for vExtraPrivilege',
    '								in (',
    '										select',
    '												a.ExtraPrivilegeName',
    '										from ExtraPrivilege a',
    '										where a.ExtraPrivilegeCode = ''USERCANSETPRIVILEGEFORSELF''',
    '								)',
    '						loop',
    '								    :P136_MyError := ''ERROR'';',
    '                                    :P136_ErrorMessage := ''Please ask for Extra privilege '' || vExtraPrivilege.ExtraPrivilegeName || ''.'';',
    '                                exit;',
    '						end loop;',
    '				end if;							',
    '		    end if;',
    '            */',
    '              if :P136_MyError is null then',
    '',
    '                if :P136_UpdatePrivilege = ''YES'' and vModulePrivilege.UpdatePrivilege = ''NO'' then',
    '',
    '                 :P136_MyError := ''ERROR'';',
    '                 :P136_ErrorMessage := ''Please get Update Privilege for module '' ||  :P136_MODULENAME || '' then you may share it to others.'';',
    '                END IF;',
    '               end if;',
    '             END LOOP;',
    '       ',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(595465898181637210)
,p_name=>'VIEW CHANGE'
,p_static_id=>'view-change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P136_VIEWPRIVILEGE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(595466384151637211)
,p_event_id=>wwv_flow_imp.id(595465898181637210)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P136_MYERROR,P136_ERRORMESSAGE',
  'items_to_submit', 'P136_VIEWPRIVILEGE,P136_MYERROR,P136_ERRORMESSAGE,P136_MODULECODE,P136_MODULENAME',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '      FOR vModulePrivilege IN ( select',
    '  					a.BossUserCode,',
    '  					a.TNo,',
    '  					a.ViewPrivilege,',
    '  					a.InsertPrivilege,',
    '  					a.UpdatePrivilege,',
    '  					a.DeletePrivilege,',
    '  					a.PrintPrivilege,',
    '  					a.StatusPrivilege,',
    '  					a.OtherPrivilege,',
    '  					a.ControlPrivilege,',
    '  					a.UpdateDays,',
    '  					a.AllowedBackDays,',
    '  					a.AllowedForwardDays',
    '  			from ModulePrivilege a, BossUserRole b, BossUser c',
    '  			where a.BossUserCode = b.BossUserRoleCode',
    '  					and a.CompanyCode = b.CompanyCode',
    '  					and b.TNO = c.TNo',
    '  					and a.CompanyCode = :GLOBAL_COMPANYCODE',
    '  					and a.ModuleCode = :P136_MODULECODE',
    '  					and c.LoginName = :GLOBAL_LOGINNAME',
    '             ) LOOP',
    '             /*if vModulePrivilege.BossUserCode = :P136_BossUserCode then',
    '				',
    '				if GetModulePrivilegeExtra(''USERCANSETPRIVILEGEFORSELF'', :P136_ModuleCode, :GLOBAL_COMPANYCODE, :GLOBAL_LOGINNAME) != ''YES'' then',
    '						for vExtraPrivilege',
    '								in (',
    '										select',
    '												a.ExtraPrivilegeName',
    '										from ExtraPrivilege a',
    '										where a.ExtraPrivilegeCode = ''USERCANSETPRIVILEGEFORSELF''',
    '								)',
    '						loop',
    '								    :P136_MyError := ''ERROR'';',
    '                                    :P136_ErrorMessage := ''Please ask for Extra privilege '' || vExtraPrivilege.ExtraPrivilegeName || ''.'';',
    '                                exit;',
    '						end loop;',
    '				end if;							',
    '		    end if;',
    '            */',
    '              if :P136_MyError is null then',
    '',
    '                if :P136_ViewPrivilege = ''YES'' and vModulePrivilege.ViewPrivilege = ''NO'' then',
    '',
    '                 :P136_MyError := ''ERROR'';',
    '                 :P136_ErrorMessage := ''Please get View Privilege for module '' ||  :P136_MODULENAME || '' then you may share it to others.'';',
    '                END IF;',
    '              end if;',
    '             END LOOP;',
    '       -- :P136_MyError := ''ERROR'';',
    '       --          :P136_ErrorMessage := ''Please get View Privilege for module '' ||  :P136_MODULENAME || '' then you may share it to others.'';',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(595457816951637198)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(767290156304126240)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form User Privilege'
,p_static_id=>'initialize-form-user-privilege'
,p_internal_uid=>155071471700710674
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(595458191285637198)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(767290156304126240)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form User Privilege'
,p_static_id=>'process-form-user-privilege'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>155071846034710674
);
wwv_flow_imp.component_end;
end;
/
