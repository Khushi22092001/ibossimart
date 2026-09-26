prompt --application/pages/page_00360
begin
--   Manifest
--     PAGE: 00360
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
 p_id=>360
,p_name=>'Task Dashboard'
,p_alias=>'TASK-DASHBOARD'
,p_step_title=>'Task Dashboard'
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
'/* =====================================================',
unistr('   TASK DASHBOARD \2014 MODERN SAAS THEME'),
'   Replace Entire CSS',
'   ===================================================== */',
'',
unistr('/* \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 VARIABLES \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 */'),
':root {',
'',
'  --primary:      #2563eb;',
'  --primary-soft: #eff6ff;',
'',
'  --success:      #059669;',
'  --success-soft: #ecfdf5;',
'',
'  --warning:      #d97706;',
'  --warning-soft: #fffbeb;',
'',
'  --danger:       #dc2626;',
'  --danger-soft:  #fef2f2;',
'',
'  --gray-50:     #f8fafc;',
'  --gray-100:    #f1f5f9;',
'  --gray-200:    #e2e8f0;',
'  --gray-400:    #94a3b8;',
'  --gray-600:    #475569;',
'  --gray-800:    #0f172a;',
'',
'  --white:       #ffffff;',
'',
'  --shadow-sm:   0 1px 4px rgba(0,0,0,0.04);',
'  --shadow-md:   0 6px 24px rgba(0,0,0,0.06);',
'  --shadow-lg:   0 12px 40px rgba(0,0,0,0.08);',
'',
'  --radius:      16px;',
'',
'  --font:        ''Inter'',''Plus Jakarta Sans'',-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Arial,sans-serif;',
'}',
'',
unistr('/* \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 GLOBAL \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 */'),
'',
'body, .t-Body, input, select, button, textarea {',
'  font-family: var(--font) !important;',
'}',
'',
'.t-Body {',
'  background: var(--gray-50) !important;',
'}',
'',
unistr('/* \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 HEADER FIX \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 */'),
'',
'.t-Header {',
'  background: #ffffff !important;',
'  box-shadow: var(--shadow-sm) !important;',
'}',
'',
'.t-Header .t-Button,',
'.t-Header .a-Button {',
'  border-radius: 10px !important;',
'}',
'',
unistr('/* \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 PAGE TITLE \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 */'),
'',
'#t_PageTitle,',
'.t-Body-title h1 {',
'  font-size: 26px !important;',
'  font-weight: 800 !important;',
'  color: var(--gray-800) !important;',
'  letter-spacing: -0.02em !important;',
'}',
'',
'#t_PageTitle::after,',
'.t-Body-title h1::after {',
'  display: none !important;',
'}',
'',
unistr('/* \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 STAT CARDS \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 */'),
'',
'.im-stat-card .t-Region-body {',
'  border-radius: var(--radius) !important;',
'  border: 1px solid var(--gray-200) !important;',
'  box-shadow: var(--shadow-md) !important;',
'  padding: 18px !important;',
'  transition: all 0.2s ease !important;',
'}',
'',
'.im-stat-card:hover .t-Region-body {',
'  transform: translateY(-4px) !important;',
'  box-shadow: var(--shadow-lg) !important;',
'}',
'',
'/* Pending */',
'.im-stat-pending-exec .t-Region-body {',
'  border-top: 4px solid var(--warning) !important;',
'  background: var(--warning-soft) !important;',
'}',
'',
'/* Verification */',
'.im-stat-pending-verif .t-Region-body {',
'  border-top: 4px solid var(--primary) !important;',
'  background: var(--primary-soft) !important;',
'}',
'',
'/* Completed */',
'.im-stat-completed .t-Region-body {',
'  border-top: 4px solid var(--success) !important;',
'  background: var(--success-soft) !important;',
'}',
'',
'/* Card title */',
'.im-stat-card .t-Region-title {',
'  font-size: 11px !important;',
'  font-weight: 700 !important;',
'  letter-spacing: 0.08em !important;',
'  text-transform: uppercase !important;',
'  color: var(--gray-400) !important;',
'}',
'',
'/* Big number */',
'.im-card-num {',
'  font-size: 28px !important;',
'  font-weight: 800 !important;',
'  letter-spacing: -0.03em !important;',
'}',
'',
'.im-stat-pending-exec .im-card-num  { color: var(--warning) !important; }',
'.im-stat-pending-verif .im-card-num { color: var(--primary) !important; }',
'.im-stat-completed .im-card-num     { color: var(--success) !important; }',
'',
unistr('/* \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 INTERACTIVE GRID \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 */'),
'',
'.im-task-table .t-Region-body,',
'.im-task-table.t-Region {',
'  border-radius: var(--radius) !important;',
'  border: 1px solid var(--gray-200) !important;',
'  box-shadow: var(--shadow-md) !important;',
'  overflow: hidden !important;',
'}',
'',
'/* Header */',
'.im-task-table .a-GV-header,',
'.im-task-table thead th,',
'.im-task-table .t-Report-colHead {',
'  background: var(--primary) !important;',
'  color: #fff !important;',
'  font-size: 11px !important;',
'  font-weight: 700 !important;',
'  letter-spacing: 0.07em !important;',
'  text-transform: uppercase !important;',
'  padding: 12px 14px !important;',
'  border: none !important;',
'}',
'',
'/* Rows */',
'.im-task-table .a-GV-cell,',
'.im-task-table tbody td {',
'  padding: 12px 14px !important;',
'  font-size: 13px !important;',
'  color: var(--gray-600) !important;',
'  border-bottom: 1px solid var(--gray-100) !important;',
'}',
'',
'/* Zebra */',
'.im-task-table tbody tr:nth-child(even) td {',
'  background: var(--gray-50) !important;',
'}',
'',
'/* Hover */',
'.im-task-table tbody tr:hover td {',
'  background: var(--primary-soft) !important;',
'  color: var(--gray-800) !important;',
'}',
'',
'/* Selected */',
'.im-task-table .a-GV-row.is-selected .a-GV-cell {',
'  background: var(--primary-soft) !important;',
'  border-left: 3px solid var(--primary) !important;',
'}',
'',
'/* Scroll Height */',
'.im-task-table .a-GV-scrollBody {',
'  height: 320px !important;',
'  overflow-y: auto !important;',
'}',
'',
unistr('/* \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 BUTTONS \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 */'),
'',
'.im-task-table .a-Button,',
'.im-task-table .a-IGT-btn {',
'  border-radius: 10px !important;',
'  font-size: 13px !important;',
'  border: 1px solid var(--gray-200) !important;',
'  background: var(--white) !important;',
'  color: var(--gray-600) !important;',
'  padding: 8px 16px !important;',
'  transition: all 0.2s ease !important;',
'}',
'',
'.im-task-table .a-Button:hover {',
'  background: var(--primary-soft) !important;',
'  color: var(--primary) !important;',
'  border-color: var(--primary) !important;',
'}',
'',
'/* Primary Button */',
'.im-task-table .a-Button--hot {',
'  background: var(--primary) !important;',
'  color: white !important;',
'  border: none !important;',
'  box-shadow: 0 6px 18px rgba(37,99,235,0.25) !important;',
'}',
'',
'.im-task-table .a-Button--hot:hover {',
'  transform: translateY(-1px) !important;',
'}',
'',
unistr('/* \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 SEARCH INPUT \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 */'),
'',
'.im-task-table input[type="search"],',
'.im-task-table input[type="text"] {',
'  border-radius: 10px !important;',
'  border: 1px solid var(--gray-200) !important;',
'  background: var(--gray-50) !important;',
'  padding: 8px 12px !important;',
'  font-size: 13px !important;',
'}',
'',
'.im-task-table input:focus {',
'  border-color: var(--primary) !important;',
'  box-shadow: 0 0 0 3px rgba(37,99,235,0.12) !important;',
'  background: var(--white) !important;',
'  outline: none !important;',
'}',
'',
unistr('/* \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 BADGES \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 */'),
'',
'.im-badge {',
'  display: inline-block;',
'  padding: 4px 10px;',
'  border-radius: 20px;',
'  font-size: 11px;',
'  font-weight: 700;',
'  text-transform: uppercase;',
'}',
'',
'.im-badge-pending { background: var(--warning-soft); color: var(--warning); }',
'.im-badge-done    { background: var(--success-soft); color: var(--success); }',
'.im-badge-review  { background: var(--primary-soft); color: var(--primary); }',
'.im-badge-overdue { background: var(--danger-soft);  color: var(--danger); }',
'',
unistr('/* \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 NAV BUTTONS \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500 */'),
'',
'.im-nav-btn {',
'  border-radius: 10px !important;',
'  font-size: 13px !important;',
'  font-weight: 600 !important;',
'  padding: 8px 18px !important;',
'  border: 1px solid #c9d8f6 !important;',
'  background: var(--white) !important;',
'  color: white !important;',
'  transition: all 0.2s ease !important;',
'}',
'',
'.im-nav-btn:hover {',
'  background: var(--primary-soft) !important;',
'}',
'',
'.im-nav-btn-primary {',
'  background: white !important;',
'  color: var(--primary) !important;',
'  border: none !important;',
'  box-shadow: var(--shadow-sm) !important;',
'}',
'',
'.im-nav-btn-primary:hover {',
'  background: var(--primary-soft) !important;',
'}',
'',
'/* =====================================================',
unistr('   INTERACTIVE GRID \2014 YELLOW COMPATIBLE THEME'),
'   Static ID: im-task-table',
'   ===================================================== */',
'',
'/* Region Styling */',
'#im-task-table .t-Region-body,',
'#im-task-table.t-Region {',
'  border-radius: 16px !important;',
'  border: 1px solid #e2e2e2 !important;',
'  box-shadow: 0 6px 20px rgba(0,0,0,0.06) !important;',
'  overflow: hidden !important;',
'}',
'',
unistr('/* HEADER \2014 DARK TO BALANCE YELLOW */'),
'#im-task-table .a-GV-header,',
'#im-task-table thead th,',
'#im-task-table .t-Report-colHead {',
'  background: #eef3fe !important;',
'  color: #ffffff !important;',
'  font-size: 11px !important;',
'  font-weight: 700 !important;',
'  letter-spacing: 0.07em !important;',
'  text-transform: uppercase !important;',
'  padding: 12px 14px !important;',
'  border: none !important;',
'}',
'',
'/* Zebra Rows */',
'#im-task-table tbody tr:nth-child(even) td {',
'  background: #fafafa !important;',
'}',
'',
'/* Cells */',
'#im-task-table td {',
'  padding: 12px 14px !important;',
'  font-size: 13px !important;',
'  color: #4b5563 !important;',
'  border-bottom: 1px solid #f1f1f1 !important;',
'}',
'',
unistr('/* Hover \2014 Soft Yellow Glow */'),
'#im-task-table tbody tr:hover td {',
'  background: #fff7e6 !important;',
'  color: #111827 !important;',
'}',
'',
'/* Selected Row */',
'#im-task-table .a-GV-row.is-selected .a-GV-cell {',
'  background: #fff3d6 !important;',
'  border-left: 4px solid #e9b14c !important;',
'}',
'',
'/* Scroll Height */',
'#im-task-table .a-GV-scrollBody {',
'  height: 320px !important;',
'  overflow-y: auto !important;',
'}',
'',
'/* Buttons */',
'#im-task-table .a-Button {',
'  border-radius: 10px !important;',
'  font-size: 13px !important;',
'  border: 1px solid #e5e7eb !important;',
'  background: #ffffff !important;',
'  color: #374151 !important;',
'  padding: 8px 16px !important;',
'  transition: all 0.2s ease !important;',
'}',
'',
'#im-task-table .a-Button:hover {',
'  background: #fff7e6 !important;',
'  border-color: #e9b14c !important;',
'  color: #b45309 !important;',
'}',
'',
'/* Primary Button */',
'#im-task-table .a-Button--hot {',
'  background: #e9b14c !important;',
'  color: #111 !important;',
'  border: none !important;',
'  box-shadow: 0 6px 18px rgba(233,177,76,0.3) !important;',
'}',
'',
'#im-task-table .a-Button--hot:hover {',
'  transform: translateY(-1px) !important;',
'}',
'',
'/* WIDE_GRID_HORIZONTAL_BAR_STANDARD_V1 */',
'/* A track appears only when the grid columns exceed the available width. */',
'.a-IG .a-GV-bdy {',
'  overflow-x: auto !important;',
'}',
'',
'.a-IG .a-GV-w-scroll {',
'  overflow-x: auto !important;',
'}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(56274839558473895)
,p_plug_name=>'Completed'
,p_static_id=>'completed'
,p_region_css_classes=>'im-stat-card im-stat-completed'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Completed'' AS card_title,',
'       COUNT(*) AS card_text',
'FROM taskinstance t',
'JOIN taskassignment ta ON t.assignment_id = ta.assignment_id',
'WHERE t.TaskStatus = ''Completed'' ',
'AND t.VerificationStatus = ''Verified''',
'AND (',
'    ta.employeecode = :GLOBAL_BOSSUSERCODE',
'    OR ta.assigned_by = :GLOBAL_BOSSUSERCODE',
')',
''))
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{"orderBys":[{"key":"CARD_TITLE","expr":"\"CARD_TITLE\" asc"}],"itemName":"P360_ORDER_BY"}'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P360_CARD_TITLE'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(45307825776600865)
,p_region_id=>wwv_flow_imp.id(56274839558473895)
,p_layout_type=>'GRID'
,p_component_css_classes=>'&CARD_CLASS.'
,p_card_css_classes=>' &CARD_CLASS.'
,p_title_adv_formatting=>false
,p_title_column_name=>'CARD_TITLE'
,p_title_css_classes=>' &CARD_CLASS.'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>true
,p_second_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="im-card-num">&CARD_TEXT.</span>',
''))
,p_media_adv_formatting=>false
,p_pk1_column_name=>'CARD_TITLE'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(45308362246600866)
,p_card_id=>wwv_flow_imp.id(45307825776600865)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:360:&SESSION.::&DEBUG.:360:P360_CARD_TITLE:&CARD_TITLE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(65605540250316425)
,p_plug_name=>'Pending Execution'
,p_static_id=>'pending-execution'
,p_region_css_classes=>'im-stat-card im-stat-pending-exec'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Pending Execution'' AS card_title,',
'       COUNT(*) AS card_text',
'FROM taskinstance t',
'JOIN taskassignment ta ON t.assignment_id = ta.assignment_id',
'WHERE t.TaskStatus = ''Pending''',
'AND ta.employeecode = :GLOBAL_BOSSUSERCODE',
''))
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{"orderBys":[{"key":"CARD_TITLE","expr":"\"CARD_TITLE\" asc"}],"itemName":"P360_ORDER_BY"}'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P360_CARD_TITLE'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(45318755144600876)
,p_region_id=>wwv_flow_imp.id(65605540250316425)
,p_layout_type=>'GRID'
,p_component_css_classes=>'&CARD_CLASS.'
,p_card_css_classes=>' &CARD_CLASS.'
,p_title_adv_formatting=>false
,p_title_column_name=>'CARD_TITLE'
,p_title_css_classes=>' &CARD_CLASS.'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>true
,p_second_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="im-card-num">&CARD_TEXT.</span>',
''))
,p_media_adv_formatting=>false
,p_pk1_column_name=>'CARD_TITLE'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(45319306832600876)
,p_card_id=>wwv_flow_imp.id(45318755144600876)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:360:&SESSION.::&DEBUG.:360:P360_CARD_TITLE:&CARD_TITLE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(56275121219473898)
,p_plug_name=>'Pending Verification'
,p_static_id=>'pending-verification'
,p_region_css_classes=>'im-stat-card im-stat-pending-verif'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Pending Verification'' AS card_title,',
'       COUNT(*) AS card_text',
'FROM taskinstance t',
'JOIN taskassignment ta ON t.assignment_id = ta.assignment_id',
'WHERE t.TaskStatus = ''Completed'' ',
'AND t.VerificationStatus = ''Pending Verification''',
'AND ta.assigned_by = :GLOBAL_BOSSUSERCODE'))
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{"orderBys":[{"key":"CARD_TITLE","expr":"\"CARD_TITLE\" asc"}],"itemName":"P360_ORDER_BY"}'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P360_CARD_TITLE'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(45309365513600867)
,p_region_id=>wwv_flow_imp.id(56275121219473898)
,p_layout_type=>'GRID'
,p_component_css_classes=>'&CARD_CLASS.'
,p_card_css_classes=>' &CARD_CLASS.'
,p_title_adv_formatting=>false
,p_title_column_name=>'CARD_TITLE'
,p_title_css_classes=>' &CARD_CLASS.'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>true
,p_second_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="im-card-num">&CARD_TEXT.</span>',
''))
,p_media_adv_formatting=>false
,p_pk1_column_name=>'CARD_TITLE'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(45309907475600867)
,p_card_id=>wwv_flow_imp.id(45309365513600867)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:360:&SESSION.::&DEBUG.:360:P360_CARD_TITLE:&CARD_TITLE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(65586483313043878)
,p_plug_name=>'Task Grid'
,p_static_id=>'task-grid'
,p_region_name=>'im-task-table'
,p_region_css_classes=>'im-task-table'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>80
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT t.Instance_id,',
'       t.Assignment_id,',
'       t.TaskCode,',
'       t.Instance_Date,',
'       t.TargetDate,',
'       t.Completed_Date,',
'       t.TaskStatus,',
'       t.VerificationStatus,',
'       t.MarksObtained_Employee,',
'       t.MarksObtained_Verifier,',
'       t.Comments,',
'       t.Verified_By,',
'       t.Verified_Date,',
'       t.EmployeeCode',
'FROM taskinstance t',
'JOIN taskassignment ta ON t.assignment_id = ta.assignment_id',
'WHERE (',
'    (ta.employeecode = :GLOBAL_BOSSUSERCODE AND (',
'        (:P360_CARD_TITLE = ''Pending Execution'' AND t.TaskStatus = ''Pending'')',
'        OR',
'        (:P360_CARD_TITLE = ''Completed'' AND t.TaskStatus = ''Completed'' AND t.VerificationStatus = ''Verified'')',
'    ))',
'    OR',
'    (ta.assigned_by = :GLOBAL_BOSSUSERCODE AND (',
'        (:P360_CARD_TITLE = ''Pending Verification'' AND t.TaskStatus = ''Completed'' AND t.VerificationStatus = ''Pending Verification'')',
'        OR',
'        (:P360_CARD_TITLE = ''Completed'' AND t.TaskStatus = ''Completed'' AND t.VerificationStatus = ''Verified'')',
'    ))',
')'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P360_CARD_TITLE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Courier'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#dde5ff'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#010106'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(65753676509984588)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(65753860209984589)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(55465567560206495)
,p_name=>'ASSIGNMENT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ASSIGNMENT_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Assignment Id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(56273151063473878)
,p_name=>'COMMENTS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMMENTS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Comments'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>500
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(56272696733473874)
,p_name=>'COMPLETED_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPLETED_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Completed Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'CASE WHEN :TaskStatus = ''Completed'' THEN TRUNC(SYSDATE) ELSE :Completed_Date END'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(56273881226473886)
,p_name=>'EMPLOYEECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMPLOYEECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Employee'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>310
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.employeename AS d,',
'       e.employeecode AS r',
'FROM employee e',
'JOIN taskassignment b',
'     ON e.employeecode = b.employeecode',
'WHERE b.assignment_id = :assignment_id;'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ASSIGNMENT_ID'
,p_ajax_items_to_submit=>'EMPLOYEECODE'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(56272422702473871)
,p_name=>'INSTANCE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INSTANCE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Instance Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(56272282974473870)
,p_name=>'INSTANCE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INSTANCE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(56272948221473876)
,p_name=>'MARKSOBTAINED_EMPLOYEE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MARKSOBTAINED_EMPLOYEE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Marksobtained Employee'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>260
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(56273015801473877)
,p_name=>'MARKSOBTAINED_VERIFIER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MARKSOBTAINED_VERIFIER'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Marksobtained Verifier'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>270
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(56272506699473872)
,p_name=>'TARGETDATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TARGETDATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Target Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(55465685475206496)
,p_name=>'TASKCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASKCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Task'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>true
,p_max_length=>50
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT a.taskname AS d,',
'       a.taskcode AS r',
'FROM task a',
'LEFT JOIN taskassignment b',
'       ON a.taskcode = b.taskcode',
'WHERE b.assignment_id = :assignment_id;',
''))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ASSIGNMENT_ID'
,p_ajax_items_to_submit=>'TASKCODE'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(56272567254473873)
,p_name=>'TASKSTATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASKSTATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Task Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_stretch=>'A'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Completed',
  'unchecked_value', 'Pending',
  'use_defaults', 'N')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P360_CARD_TITLE'
,p_display_condition2=>'Pending Execution'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(56272812590473875)
,p_name=>'VERIFICATIONSTATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VERIFICATIONSTATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_RADIOGROUP'
,p_heading=>'Verification Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
,p_value_alignment=>'CENTER'
,p_stretch=>'A'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Verified;Verified,Rejected;Rejected,Pending Verification;Pending Verification'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P360_CARD_TITLE'
,p_display_condition2=>'Pending Verification'
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(56273237854473879)
,p_name=>'VERIFIED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VERIFIED_BY'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Verified By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>290
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT e.employeename AS d,',
'       e.employeecode AS r',
'FROM employee e',
'JOIN taskassignment b',
'     ON e.employeecode = b.assigned_by',
'WHERE b.assignment_id = :assignment_id;'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ASSIGNMENT_ID'
,p_ajax_items_to_submit=>'VERIFIED_BY'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(56273277482473880)
,p_name=>'VERIFIED_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VERIFIED_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Verified Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>300
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(65586598788043879)
,p_internal_uid=>33544082253634131
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(65620409626668393)
,p_interactive_grid_id=>wwv_flow_imp.id(65586598788043879)
,p_static_id=>'94656'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(65620585540668393)
,p_report_id=>wwv_flow_imp.id(65620409626668393)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56246649054243359)
,p_view_id=>wwv_flow_imp.id(65620585540668393)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(55465567560206495)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56247557196243361)
,p_view_id=>wwv_flow_imp.id(65620585540668393)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(55465685475206496)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>173
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56277825338475088)
,p_view_id=>wwv_flow_imp.id(65620585540668393)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(56272282974473870)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56278782548475092)
,p_view_id=>wwv_flow_imp.id(65620585540668393)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(56272422702473871)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56279830995475093)
,p_view_id=>wwv_flow_imp.id(65620585540668393)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(56272506699473872)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56280804965475094)
,p_view_id=>wwv_flow_imp.id(65620585540668393)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(56272567254473873)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56281826598475095)
,p_view_id=>wwv_flow_imp.id(65620585540668393)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(56272696733473874)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>165
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56282844187475096)
,p_view_id=>wwv_flow_imp.id(65620585540668393)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(56272812590473875)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>186
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56283808984475098)
,p_view_id=>wwv_flow_imp.id(65620585540668393)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(56272948221473876)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>224
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56284805777475099)
,p_view_id=>wwv_flow_imp.id(65620585540668393)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(56273015801473877)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>209
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56285762792475100)
,p_view_id=>wwv_flow_imp.id(65620585540668393)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(56273151063473878)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56286799291475101)
,p_view_id=>wwv_flow_imp.id(65620585540668393)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(56273237854473879)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>206
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56287842221475102)
,p_view_id=>wwv_flow_imp.id(65620585540668393)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(56273277482473880)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56312689389719877)
,p_view_id=>wwv_flow_imp.id(65620585540668393)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(56273881226473886)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>170
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(65793837885209923)
,p_view_id=>wwv_flow_imp.id(65620585540668393)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(65753676509984588)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>83
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(45307144373600864)
,p_button_sequence=>30
,p_button_name=>'AssignTask'
,p_static_id=>'assigntask'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Assign Task'
,p_button_position=>'BEFORE_NAVIGATION_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:356:&SESSION.::&DEBUG.:356::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(45306726170600864)
,p_button_sequence=>20
,p_button_name=>'CreateTask'
,p_static_id=>'createtask'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Create Task'
,p_button_position=>'BEFORE_NAVIGATION_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:355:&SESSION.::&DEBUG.:355::'
,p_confirm_message=>'Do You Want to crete a task?'
,p_confirm_style=>'information'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(65766929733984598)
,p_name=>'P360_CARD_TITLE'
,p_item_sequence=>10
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(65619990837316441)
,p_name=>'P360_ORDER_BY'
,p_item_sequence=>30
,p_item_default=>'CARD_TITLE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45320701677600877)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(65586483313043878)
,p_triggering_element=>'TASKSTATUS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45321209499600877)
,p_event_id=>wwv_flow_imp.id(45320701677600877)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'COMPLETED_DATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'TASKSTATUS',
  'plsql_expression', 'TRUNC(SYSDATE)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'TASKSTATUS'
,p_client_condition_expression=>'Completed'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45321526476600877)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(65605540250316425)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45322064752600877)
,p_event_id=>wwv_flow_imp.id(45321526476600877)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(65586483313043878)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45322532196600877)
,p_event_id=>wwv_flow_imp.id(45321526476600877)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(65586483313043878)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P360_CARD_TITLE'
,p_client_condition_expression=>'Pending Execution'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45322977787600878)
,p_name=>'New_1_1'
,p_static_id=>'new-3'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(56275121219473898)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45323486845600878)
,p_event_id=>wwv_flow_imp.id(45322977787600878)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(65586483313043878)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45324015280600878)
,p_event_id=>wwv_flow_imp.id(45322977787600878)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(65586483313043878)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P360_CARD_TITLE'
,p_client_condition_expression=>'Pending Verification'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45324377255600878)
,p_name=>'New_1_1_1'
,p_static_id=>'new-4'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(56274839558473895)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45324868576600878)
,p_event_id=>wwv_flow_imp.id(45324377255600878)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(65586483313043878)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45325366614600878)
,p_event_id=>wwv_flow_imp.id(45324377255600878)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(65586483313043878)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P360_CARD_TITLE'
,p_client_condition_expression=>'Completed'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45325725184600878)
,p_name=>'New_2'
,p_static_id=>'new-5'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(65586483313043878)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45318053192600875)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(65586483313043878)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'New - Save Interactive Grid Data'
,p_static_id=>'new-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'N',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>13275536658191127
);
wwv_flow_imp.component_end;
end;
/
