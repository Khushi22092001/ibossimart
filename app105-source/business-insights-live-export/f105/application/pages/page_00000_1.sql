prompt --application/pages/page_00000
begin
--   Manifest
--     PAGE: 00000
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
 p_id=>0
,p_name=>'Global Page'
,p_reload_on_submit=>null
,p_warn_on_unsaved_changes=>null
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
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Detail-grid scrollbar policy: preserve native IG operations and sizing. */',
'(function () {',
'  function fitDetailGrids() {',
'    document.querySelectorAll(''#tabcontainer .a-Tabs-panel .a-IG'').forEach(function (ig) {',
'      var grid = ig.querySelector(''.a-GV'');',
'      var body = ig.querySelector(''.a-GV-bdy'');',
'      var scroll = ig.querySelector(''.a-GV-w-scroll'');',
'      if (grid) { grid.style.setProperty(''height'', ''auto'', ''important''); grid.style.setProperty(''max-height'', ''none'', ''important''); }',
'      if (body) { body.style.setProperty(''height'', ''auto'', ''important''); body.style.setProperty(''max-height'', ''none'', ''important''); body.style.setProperty(''overflow-y'', ''hidden'', ''important''); }',
'      if (scroll) { scroll.style.setProperty(''overflow-x'', ''auto'', ''important''); scroll.style.setProperty(''overflow-y'', ''hidden'', ''important''); }',
'    });',
'  }',
'  [0, 120, 500, 1200].forEach(function (delay) { window.setTimeout(fitDetailGrids, delay); });',
'  document.addEventListener(''click'', function (event) {',
'    if (event.target.closest && event.target.closest(''#tabcontainer .t-Tabs-link'')) window.setTimeout(fitDetailGrids, 120);',
'  }, true);',
'  if (window.apex && apex.jQuery) apex.jQuery(document).on(''apexafterrefresh.transactionDetailFit'', fitDetailGrids);',
'}());',
'',
'',
'/* Empty Detail IG horizontal-scroll bridge. */',
'(function () {',
'  function restoreEmptyTracks() {',
'    document.querySelectorAll(''#tabcontainer .a-Tabs-panel .a-IG'').forEach(function (ig) {',
'      var body = ig.querySelector(''.a-GV-bdy'');',
'      var track = body && body.querySelector('':scope > .a-GV-w-scroll'');',
'      var header = ig.querySelector(''.a-GV-w-hdr'');',
'      if (!body || !track || !header || getComputedStyle(track).display !== ''none'') return;',
'      track.style.setProperty(''display'', ''block'', ''important'');',
'      track.style.setProperty(''position'', ''absolute'', ''important'');',
'      track.style.setProperty(''left'', ''0'', ''important'');',
'      track.style.setProperty(''right'', ''0'', ''important'');',
'      track.style.setProperty(''bottom'', ''0'', ''important'');',
'      track.style.setProperty(''height'', ''14px'', ''important'');',
'      track.style.setProperty(''overflow-x'', ''scroll'', ''important'');',
'      track.style.setProperty(''overflow-y'', ''hidden'', ''important'');',
'      var spacer = track.querySelector(''.hspl-grid-scroll-spacer'');',
'      if (!spacer) {',
'        spacer = document.createElement(''div'');',
'        spacer.className = ''hspl-grid-scroll-spacer'';',
'        track.appendChild(spacer);',
'        track.addEventListener(''scroll'', function () { header.scrollLeft = track.scrollLeft; }, { passive: true });',
'      }',
'      spacer.style.width = Math.max(2600, header.scrollWidth || 0) + ''px'';',
'    });',
'  }',
'  [160, 600, 1300].forEach(function (delay) { window.setTimeout(restoreEmptyTracks, delay); });',
'  document.addEventListener(''click'', function (event) {',
'    if (event.target.closest && event.target.closest(''#tabcontainer .t-Tabs-link'')) window.setTimeout(restoreEmptyTracks, 180);',
'  }, true);',
'  if (window.apex && apex.jQuery) apex.jQuery(document).on(''apexafterrefresh.emptyDetailTrack'', restoreEmptyTracks);',
'}());',
'',
'',
'/* Remove only the previous detail-grid inline sizing overrides. */',
'(function () {',
'  function restoreNativeDetailGridSizing() {',
'    document.querySelectorAll(''#tabcontainer .a-IG'').forEach(function (ig) {',
'      var grid = ig.querySelector(''.a-GV'');',
'      var body = ig.querySelector(''.a-GV-bdy'');',
'      var scroll = ig.querySelector(''.a-GV-w-scroll'');',
'      if (grid) { grid.style.removeProperty(''height''); grid.style.removeProperty(''max-height''); }',
'      if (body) { body.style.removeProperty(''height''); body.style.removeProperty(''max-height''); body.style.removeProperty(''overflow-y''); }',
'      if (scroll) { scroll.style.removeProperty(''overflow-x''); scroll.style.removeProperty(''overflow-y''); }',
'    });',
'  }',
'  [250, 750, 1600].forEach(function (delay) { window.setTimeout(restoreNativeDetailGridSizing, delay); });',
'  document.addEventListener(''click'', function (event) {',
'    if (event.target.closest && event.target.closest(''#tabcontainer .t-Tabs-link'')) window.setTimeout(restoreNativeDetailGridSizing, 260);',
'  }, true);',
'  if (window.apex && apex.jQuery) apex.jQuery(document).on(''apexafterrefresh.detailGridScrollbarCleanup'', function () { window.setTimeout(restoreNativeDetailGridSizing, 260); });',
'}());',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'/* Transaction Detail grids: only horizontal overflow stays inside the grid. */',
'#tabcontainer .a-Tabs-panel .a-IG .a-GV,',
'#tabcontainer .a-Tabs-panel .a-IG .a-GV-bdy {',
'  height: auto !important;',
'  max-height: none !important;',
'}',
'#tabcontainer .a-Tabs-panel .a-IG .a-GV-bdy { overflow-y: hidden !important; }',
'#tabcontainer .a-Tabs-panel .a-IG .a-GV-w-scroll {',
'  overflow-x: auto !important;',
'  overflow-y: hidden !important;',
'}',
'/* Filters are a register/report control, not a transaction-form control. */',
'html.hspl-compact-form .hspl-filter-trigger,',
'body.hspl-compact-form .hspl-filter-trigger { display: none !important; }',
'',
'',
'/* Empty Detail IGs still need a visible, usable horizontal scroll track. */',
'#tabcontainer .a-Tabs-panel .a-IG .a-GV-bdy { position: relative !important; padding-bottom: 14px !important; }',
'#tabcontainer .a-Tabs-panel .a-IG .a-GV-bdy > .a-GV-w-scroll[style*="display: none"] {',
'  display: block !important;',
'  position: absolute !important;',
'  inset: auto 0 0 0 !important;',
'  height: 14px !important;',
'  overflow-x: scroll !important;',
'  overflow-y: hidden !important;',
'}',
'#tabcontainer .a-Tabs-panel .a-IG .hspl-grid-scroll-spacer { width: 2600px; height: 1px; }',
'',
'',
'/* Standard 12px gap between transaction header and step navigation. */',
'body:has(#tabcontainer) .t-Body-title.hspl-hero-card { margin-bottom: 12px !important; }',
'',
'',
'/* Detail grid final scrollbar policy: native horizontal track only. */',
'#tabcontainer .a-IG .a-GV,',
'#tabcontainer .a-IG .a-GV-bdy {',
'  height: auto !important;',
'  min-height: 0 !important;',
'  max-height: none !important;',
'}',
'#tabcontainer .a-IG .a-GV-bdy {',
'  overflow-y: hidden !important;',
'  padding-bottom: 0 !important;',
'}',
'#tabcontainer .a-IG .a-GV-w-scroll {',
'  display: block !important;',
'  position: static !important;',
'  height: 14px !important;',
'  overflow-x: auto !important;',
'  overflow-y: hidden !important;',
'  scrollbar-width: auto;',
'}',
'#tabcontainer .a-IG .a-GV-bdy::-webkit-scrollbar:vertical,',
'#tabcontainer .a-IG .a-GV-w-scroll::-webkit-scrollbar:vertical { width: 0 !important; }',
''))
,p_protection_level=>'D'
,p_page_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<img src="#APP_FILES#logo_new4.png" alt="Oracle"style=" width:30px;height:18px;"/>',
'InfoMart Release 1.0'))
,p_page_component_map=>'14'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(44819602971098836)
,p_plug_name=>'Global Search'
,p_static_id=>'global-search'
,p_region_name=>'global_search'
,p_region_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--sm'
,p_region_attributes=>'style="overflow:hidden; display:none;"'
,p_plug_template=>1660973136434625155
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_SEARCH_REGION'
,p_ajax_items_to_submit=>'P0_NEW'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'custom_layout', 'N',
  'lazy_loading', 'Y',
  'minimum_characters', '2',
  'no_query_entered_message', wwv_flow_string.join(wwv_flow_t_varchar2(
    '<p class="margin-md" id="gs-info" style="border-radius: 10px; border: 1px dashed var(--ut-palette-primary-text); padding: 10px; color: #555454;">',
    '    <span id="header" style="font-size: 14px; font-weight: bold;">Global Search Functionality<span><br><br>',
    '    <span id="first_text" style="font-size: 14px; font-weight: normal;" >The ERP search interface allows users to locate available modules and specific transactions efficiently. Please adhere to the following guidelines:</span><br><br>',
    '    <span id="second_text" style="font-size: 14px; font-weight: normal;"><span style="font-weight: bold;">Initialization:</span> Enter a minimum of two characters to initiate the search process.<br>',
    '    <span style="font-weight: bold;">Transaction-Specific Search: </span>To locate a specific transaction, use the prefix <span style="font-weight:bold; color:red;">"TNO: [Transaction Number]"</span>. This format optimizes the search across all modul'
||'es for more accurate results. or user can directly enter the transaction no.</span>',
    '',
    '</p>')),
  'no_results_found_message', wwv_flow_string.join(wwv_flow_t_varchar2(
    '<span class="u-textCenter"><h5>',
    'No data Found',
    '</h5></span>')),
  'results_per_page', '15',
  'results_per_page_type', 'STATIC',
  'search_as_you_type', 'N',
  'search_page_item', 'P0_NEW',
  'show_result_count', 'N',
  'use_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_search_region_source(
 p_id=>wwv_flow_imp.id(48025386185854932)
,p_region_id=>wwv_flow_imp.id(44819602971098836)
,p_search_config_id=>wwv_flow_imp.id(49009379762382066)
,p_use_as_initial_result=>false
,p_display_sequence=>10
,p_name=>'Module Search'
,p_static_id=>'module-search'
);
wwv_flow_imp_page.create_search_region_source(
 p_id=>wwv_flow_imp.id(48025448335854933)
,p_region_id=>wwv_flow_imp.id(44819602971098836)
,p_search_config_id=>wwv_flow_imp.id(49009902165390627)
,p_use_as_initial_result=>false
,p_display_sequence=>20
,p_name=>'Transaction Search'
,p_static_id=>'transaction-search'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7601280806805701)
,p_plug_name=>'Master Form Presentation'
,p_static_id=>'master-form-presentation'
,p_region_name=>'hspl-master-form-assets'
,p_plug_display_sequence=>999
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<link rel="stylesheet" href="#APP_FILES#hspl-master-forms.css?cb=20260831o"><script src="#APP_FILES#hspl-master-forms.js?cb=20260831t"></script>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(543429971007599060)
,p_plug_name=>'TITLE'
,p_static_id=>'title'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_region_attributes=>'Style="font-size : 50px";'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'BEFORE_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48025233763854931)
,p_name=>'P0_NEW'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(44819602971098836)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Search'
,p_placeholder=>'-- Enter Module Name or Transaction No to Search--'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(297559830502230643)
,p_name=>'P0_PARTYCODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(543429971007599060)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(44819767346098838)
,p_name=>'P0_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(44819602971098836)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(543430062354599061)
,p_name=>'P0_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(543429971007599060)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select page_title from apex_application_pages ',
'where application_id=:APP_ID ',
'and page_id=:APP_PAGE_ID;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>':APP_PAGE_NAME'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'Style="font-size : 18px"; "text-align: center'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--boldDisplay'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'format', 'HTML',
  'send_on_page_submit', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(48025530845854934)
,p_name=>'Close the global_search Region on click'
,p_static_id=>'close-the-global-search-region-on-click'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(48025691032854935)
,p_event_id=>wwv_flow_imp.id(48025530845854934)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '(function installGlobalSearchReset(attempt) {',
    '  var input = document.getElementById("P0_NEW");',
    '  if (!input) {',
    '    if (attempt < 40) window.setTimeout(function () { installGlobalSearchReset(attempt + 1); }, 50);',
    '    return;',
    '  }',
    '  function resetGlobalSearch(refreshResults) {',
    '    var hadValue = !!(input.value || input.dataset.hsplLastGlobalSearch);',
    '    input.value = "";',
    '    delete input.dataset.hsplLastGlobalSearch;',
    '    delete input.dataset.hsplGlobalSearchCursorState;',
    '    delete input.dataset.hsplGlobalSearchCursorWatch;',
    '    if (refreshResults && hadValue) {',
    '      window.setTimeout(function () {',
    '        var region = apex.region("global_search");',
    '        if (region && input.isConnected) region.refresh();',
    '      }, 0);',
    '    }',
    '  }',
    '  if (input.value) resetGlobalSearch(true);',
    '  if (input.dataset.hsplGlobalSearchResetInstalled === "1") return;',
    '  input.dataset.hsplGlobalSearchResetInstalled = "1";',
    '  apex.jQuery(document).off("click.hsplGlobalSearchOverlay", ".ui-widget-overlay").on("click.hsplGlobalSearchOverlay", ".ui-widget-overlay", function () {',
    '    resetGlobalSearch(true);',
    '    apex.theme.closeRegion("global_search");',
    '  });',
    '  var searchRegion = document.getElementById("global_search");',
    '  if (searchRegion) apex.jQuery(searchRegion).on("dialogclose.hsplGlobalSearchReset", function () { resetGlobalSearch(true); });',
    '  var dialog = input.closest(".ui-dialog");',
    '  if (dialog && window.MutationObserver) {',
    '    new MutationObserver(function () {',
    '      if (!dialog.getClientRects().length || window.getComputedStyle(dialog).display === "none") resetGlobalSearch(true);',
    '    }).observe(dialog, { attributes: true, attributeFilter: ["class", "style", "aria-hidden"] });',
    '  }',
    '  document.addEventListener("click", function (event) {',
    '    var closeButton = event.target.closest && event.target.closest(".ui-dialog-titlebar-close");',
    '    if (closeButton && closeButton.closest(".ui-dialog") && closeButton.closest(".ui-dialog").querySelector("#P0_NEW")) resetGlobalSearch(true);',
    '    if (event.target.closest && event.target.closest("#global_search_search a[href]")) resetGlobalSearch(true);',
    '  }, true);',
    '  window.addEventListener("pagehide", function () { resetGlobalSearch(false); });',
    '}(0));',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(48025716020854936)
,p_name=>'Custom DA for Open Dialog and set Focus'
,p_static_id=>'custom-da-for-open-dialog-and-set-focus'
,p_event_sequence=>70
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#global_search'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogopen'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(48025867932854937)
,p_event_id=>wwv_flow_imp.id(48025716020854936)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''#P0_NEW'').focus();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(910250925000000001)
,p_name=>'Global Search 180ms Debounce'
,p_static_id=>'global-search-180ms-debounce'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P0_NEW'
,p_bind_type=>'bind'
,p_execution_type=>'DEBOUNCE'
,p_execution_time=>180
,p_execution_immediate=>false
,p_bind_event_type=>'input'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(910250925000000002)
,p_event_id=>wwv_flow_imp.id(910250925000000001)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '(function () {',
    '  var input = document.getElementById("P0_NEW");',
    '  var region = apex.region("global_search");',
    '  if (!input || !region) return;',
    '  var searchValue = String(input.value || "").replace(/\s+/g, " ").trim();',
    '  if (input.dataset.hsplLastGlobalSearch === searchValue) return;',
    '  input.dataset.hsplLastGlobalSearch = searchValue;',
    '  var selector = ".a-SearchResults-item, .a-SearchResult";',
    '  function liveDialog() {',
    '    return input.closest(".ui-dialog") || document.getElementById("global-search");',
    '  }',
    '  function isVisible(element) {',
    '    if (!element || !element.isConnected || !element.getClientRects().length) return false;',
    '    var style = window.getComputedStyle(element);',
    '    return style.display !== "none" && style.visibility !== "hidden";',
    '  }',
    '  function visibleItems(dialog) {',
    '    return dialog ? Array.prototype.filter.call(dialog.querySelectorAll(selector), function (item) {',
    '      return isVisible(item) && !item.closest(".ui-dialog-titlebar,.t-Region-header") && item.querySelector("a[href],[role=link]");',
    '    }) : [];',
    '  }',
    '  function rememberCursor(target) {',
    '    if (target === input) { delete input.dataset.hsplGlobalSearchCursorState; return; }',
    '    var dialog = liveDialog();',
    '    var card = target && target.closest && target.closest(selector);',
    '    if (!dialog || !card || !dialog.contains(card)) return;',
    '    var items = visibleItems(dialog);',
    '    var index = items.indexOf(card);',
    '    var link = card.querySelector("a[href],[role=link]");',
    '    if (index < 0 || !link) return;',
    '    input.dataset.hsplGlobalSearchCursorState = JSON.stringify({',
    '      index: index,',
    '      href: link.getAttribute("href") || "",',
    '      label: link.textContent.replace(/\s+/g, " ").trim()',
    '    });',
    '  }',
    '  function restoreCursor() {',
    '    var state;',
    '    try { state = JSON.parse(input.dataset.hsplGlobalSearchCursorState || "null"); } catch (ignore) { state = null; }',
    '    var dialog = liveDialog();',
    '    if (!state || !isVisible(dialog)) return;',
    '    var focused = document.activeElement;',
    '    if (focused && focused !== document.body && focused !== input && !dialog.contains(focused)) return;',
    '    var newItems = visibleItems(dialog);',
    '    if (!newItems.length) return;',
    '    var target = newItems.filter(function (item) {',
    '      var link = item.querySelector("a[href],[role=link]");',
    '      return link && ((state.href && link.getAttribute("href") === state.href) || (state.label && link.textContent.replace(/\s+/g, " ").trim() === state.label));',
    '    })[0] || newItems[Math.min(state.index, newItems.length - 1)];',
    '    newItems.forEach(function (item) {',
    '      var selected = item === target;',
    '      item.tabIndex = selected ? 0 : -1;',
    '      item.classList.toggle("hspl-search-result-active", selected);',
    '    });',
    '    target.focus({ preventScroll: true });',
    '    try { target.scrollIntoView({ block: "nearest" }); } catch (ignore) {}',
    '  }',
    '  function watchCursorThroughRefresh() {',
    '    var watchId = String((parseInt(input.dataset.hsplGlobalSearchCursorWatch || "0", 10) || 0) + 1);',
    '    var deadline = window.performance.now() + 3000;',
    '    input.dataset.hsplGlobalSearchCursorWatch = watchId;',
    '    function check() {',
    '      if (input.dataset.hsplGlobalSearchCursorWatch !== watchId) return;',
    '      var dialog = liveDialog();',
    '      var hasState = !!input.dataset.hsplGlobalSearchCursorState;',
    '      var hasActiveItem = dialog && dialog.querySelector(".hspl-search-result-active");',
    '      if (hasState && isVisible(dialog) && !hasActiveItem && visibleItems(dialog).length) restoreCursor();',
    '      if (window.performance.now() < deadline) window.requestAnimationFrame(check);',
    '    }',
    '    window.requestAnimationFrame(check);',
    '  }',
    '  if (input.dataset.hsplGlobalSearchCursorInstalled !== "1") {',
    '    input.dataset.hsplGlobalSearchCursorInstalled = "1";',
    '    document.addEventListener("focusin", function (event) { rememberCursor(event.target); }, true);',
    '    document.addEventListener("keydown", function (event) {',
    '      if (/^(ArrowDown|ArrowUp|Home|End)$/.test(event.key)) {',
    '        rememberCursor(document.activeElement);',
    '        watchCursorThroughRefresh();',
    '      }',
    '    }, true);',
    '    apex.jQuery(document).on("apexafterrefresh.hsplGlobalSearchCursor", function () { window.requestAnimationFrame(restoreCursor); });',
    '    var observeRoot = liveDialog();',
    '    if (observeRoot && window.MutationObserver) {',
    '      new MutationObserver(function () { restoreCursor(); window.requestAnimationFrame(restoreCursor); }).observe(observeRoot, { childList: true, subtree: true });',
    '    }',
    '  }',
    '  rememberCursor(document.activeElement);',
    '  if (searchValue.length === 1) {',
    '    var typedValue = input.value;',
    '    input.value = "";',
    '    region.refresh();',
    '    input.value = typedValue;',
    '    return;',
    '  }',
    '  region.refresh();',
    '}());')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(910250925000000003)
,p_name=>'Global Search Enter Dedupe'
,p_static_id=>'global-search-enter-dedupe'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P0_NEW'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(910250925000000004)
,p_event_id=>wwv_flow_imp.id(910250925000000003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if (this.browserEvent && this.browserEvent.which === 13) {',
    '  var input = document.getElementById("P0_NEW");',
    '  if (input) input.dataset.hsplLastGlobalSearch = String(input.value || "").replace(/\s+/g, " ").trim();',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(303886531276316175)
,p_name=>'menu tooltip'
,p_static_id=>'menu-tooltip'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(303886631963316176)
,p_event_id=>wwv_flow_imp.id(303886531276316175)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("#t_TreeNav").treeView("option", "tooltip", {',
    '    content: function(cb, node) {',
    '        return node.label;',
    '    }',
    '} );',
    '$("#t_TreeNav").tooltip("option", "items", ".a-TreeView-content");')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(303886913633316179)
,p_name=>'menu tooltip_1'
,p_static_id=>'menu-tooltip-2'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(303887044403316180)
,p_event_id=>wwv_flow_imp.id(303886913633316179)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'try {',
    '',
    '  //Tooltip for Menu Text',
    '  $("#t_TreeNav").treeView("option", "tooltip", {',
    '    content: function (cb, node) {',
    '      var ttText;',
    '',
    '      // Only display the tooltip if the menu is collapsed ...',
    '      if ($(".js-navCollapsed ").length > 0) {',
    '        ttText = node.label;',
    '      }',
    '      else {',
    '        ttText = "";',
    '      }',
    '      return ttText;',
    '    },',
    '    position: {',
    '      my: "left+5 center", at: "right center"',
    '    }',
    '  });',
    '',
    '  //This tells the tooltip to show up for the whole node content including the icon.',
    '  $("#t_TreeNav").tooltip("option", "items", ".a-TreeView-content");',
    '}',
    'catch (err) {',
    '  // Do nothing ...',
    '',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(576502731919099925)
,p_name=>'Notification'
,p_static_id=>'notification'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(576502832659099926)
,p_event_id=>wwv_flow_imp.id(576502731919099925)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-apex-notification'
,p_action=>'PLUGIN_APEX.NOTIFICATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    '    "refresh": 0,',
    '    "mainIcon": "fa-bell",',
    '    "mainIconColor": "white",',
    '    "mainIconBackgroundColor": "rgba(70,70,70,0.9)",',
    '    "mainIconBlinking": false,',
    '    "counterBackgroundColor": "rgb(232, 55, 55 )",',
    '    "counterFontColor": "white",',
    '    "linkTargetBlank": false,',
    '    "showAlways": false,',
    '    "browserNotifications": {',
    '        "enabled": true,',
    '        "cutBodyTextAfter": 100,',
    '        "link": false',
    '    },',
    '    "accept": {',
    '        "color": "#44e55c",',
    '        "icon": "fa-check"',
    '    },',
    '    "decline": {',
    '        "color": "#b73a21",',
    '        "icon": "fa-close"',
    '    },',
    '    "hideOnRefresh": true',
    '}')),
  'attribute_02', 'notification-menu',
  'attribute_04', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select ''fa-wrench'' As NOTE_ICON,',
    '       ''#10779f'' As NOTE_ICON_COLOR,',
    '       b.modulename As NOTE_HEADER,',
    '       A.MENULABEL || ''-'' || TO_CHAR(A.QUEUEDATE, ''DD-MM-RRRR HH24:MI'') ||'' Remark : ''||',
    '       (Select aa.remark',
    '          From passfail aa',
    '         Where aa.tokenno < a.tokenno',
    '           And aa.moduletno = a.ModuleTNo',
    '           And Rownum = 1) As NOTE_TEXT,',
    '          null as NOTE_LINK,',
    '          --''f?p='' || :APP_ID || '':'' ||to_char(b.entrypageno) || '':'' ||:APP_SESSION || ''::NO::'' || ''P'' ||to_char(b.entrypageno) ||''_TNO,P'' ||to_char(b.entrypageno) ||''_CALLEDFROMPAGE,P''||to_char(b.entrypageno)||''_FORMSTATUS'' || '':'' ||A.MODULETNO || '''
||','' || :APP_PAGE_ID||'',''||''CALLED''||'':NO'' As NOTE_LINK, ',
    '       ',
    '       ''#10779f'' As NOTE_COLOR,',
    '       --NULL AS NOTE_ACCEPT,',
    '       --Order By aa.moduletno, aa.tokenno Desc) As NOTE_ACCEPT,',
    '       --''javascript:alert("Declined");void(0);'' As NOTE_DECLINE,',
    '       Null As NOTE_ACCEPT,',
    '       Null As NOTE_DECLINE,',
    '       0    As NO_BROWSER_NOTIFICATION',
    '  From ONTHETABLE_APEX a, Module b',
    ' Where a.modulecode = b.modulecode',
    '--order by a.QUEUEDATE desc',
    '')),
  'attribute_05', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(606898458885733058)
,p_name=>'sideMenuExpandCollapse'
,p_static_id=>'sidemenuexpandcollapse'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(606898588248733059)
,p_event_id=>wwv_flow_imp.id(606898458885733058)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("#t_Body_nav").show();',
    '//$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')))).to_clob
);
wwv_flow_imp.component_end;
end;
/
