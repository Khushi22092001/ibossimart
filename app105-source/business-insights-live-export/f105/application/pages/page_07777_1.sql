prompt --application/pages/page_07777
begin
--   Manifest
--     PAGE: 07777
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
 p_id=>7777
,p_name=>'Prototype and Testing'
,p_alias=>'PROTOTYPE-AND-TESTING'
,p_step_title=>'Prototype and Testing'
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
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(55453379023090937)
,p_plug_name=>'Dashboards cards'
,p_static_id=>'dashboards-cards'
,p_parent_plug_id=>wwv_flow_imp.id(54352268150196455)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select entry_text        as title,',
'       entry_target      as card_link,',
'       ENTRY_IMAGE       as card_icon,',
'       null              as card_desc, ',
'       null              as card_badge',
'  from apex_application_list_entries',
' where application_id = :APP_ID',
'   and list_name = ''Dashboard Portlet View'' ',
' order by display_sequence'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'APP_ID'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(55455897827090962)
,p_region_id=>wwv_flow_imp.id(55453379023090937)
,p_layout_type=>'GRID'
,p_grid_column_count=>4
,p_title_adv_formatting=>false
,p_title_column_name=>'TITLE'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_css_classes=>'&CARD_ICON.'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(55456007107090963)
,p_card_id=>wwv_flow_imp.id(55455897827090962)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'&CARD_LINK.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54352351823196456)
,p_plug_name=>'Mismatched Stock'
,p_static_id=>'mismatched-stock'
,p_parent_plug_id=>wwv_flow_imp.id(54352268150196455)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH stock_hierarchy (',
'    STOCK_TNO, STOCKMODULECODE, STOCKMODULETNO, STOCK_TRANSACTION_NO, ',
'    STORAGELOCATIONCODE, ITEMCODE, ITEMSPECIFICATIONCODE, STOCKQUANTITY1, ',
'    USEDSTOCK_TNO, MODULECODE, MODULETNO, USEDSTOCK_TRANSACTION_NO, ',
'    USEDSTOCKQUANTITY1, HIERARCHY_LEVEL, STOCK_TRACE_PATH, MODULE_TRACE_PATH, ',
'    CONSUMED_IN_THIS_TXN, CONSUMPTION_TYPE, ORDER_PATH',
') AS (',
'    -- Level 1: Original stock entries for multiple IDs',
'    SELECT ',
'        s.TNO,',
'        s.STOCKMODULECODE,',
'        s.STOCKMODULETNO,',
'        GETMODULENO(s.STOCKMODULECODE, s.STOCKMODULETNO) AS STOCK_TRANSACTION_NO,',
'        s.STORAGELOCATIONCODE,',
'        s.ITEMCODE,',
'        s.ITEMSPECIFICATIONCODE,',
'        s.STOCKQUANTITY1,',
'        us.TNO,',
'        us.MODULECODE,',
'        us.MODULETNO,',
'        GETMODULENO(us.MODULECODE, us.MODULETNO) AS USEDSTOCK_TRANSACTION_NO,',
'        us.USEDSTOCKQUANTITY1,',
'        1 AS HIERARCHY_LEVEL,',
'        TO_CHAR(s.TNO) AS STOCK_TRACE_PATH,',
'        TO_CHAR(s.STOCKMODULETNO) AS MODULE_TRACE_PATH,',
'        NVL(us.USEDSTOCKQUANTITY1, 0) AS CONSUMED_IN_THIS_TXN,',
'        CASE ',
'            WHEN us.MODULECODE = ''CCINVOICE'' THEN ''FINAL - SOLD''',
'            WHEN us.MODULECODE IN (''PRODUCTION'', ''STOCKJOURNAL'') THEN ''INTERMEDIATE - GENERATING NEW STOCK''',
'            ELSE ''UNKNOWN''',
'        END AS CONSUMPTION_TYPE,',
'        LPAD(TO_CHAR(s.STOCKMODULETNO), 20, ''0'') || ''/'' || LPAD(TO_CHAR(s.TNO), 20, ''0'') AS ORDER_PATH',
'    FROM STOCK s',
'    LEFT JOIN USEDSTOCK us ON s.TNO = us.STOCKTNO',
'    WHERE s.STOCKMODULETNO IN (55723308,55690336,55693653,55697334,55697468,55699703,55708245,55742484,55754958,55769416,55790052,55815997)',
'      AND s.STOCKMODULECODE IN (''STOCKJOURNAL'', ''PRODUCTION'')',
'    ',
'    UNION ALL',
'    ',
'    -- Level 2+: Recursive part',
'    SELECT ',
'        s.TNO,',
'        s.STOCKMODULECODE,',
'        s.STOCKMODULETNO,',
'        GETMODULENO(s.STOCKMODULECODE, s.STOCKMODULETNO) AS STOCK_TRANSACTION_NO,',
'        s.STORAGELOCATIONCODE,',
'        s.ITEMCODE,',
'        s.ITEMSPECIFICATIONCODE,',
'        s.STOCKQUANTITY1,',
'        us.TNO,',
'        us.MODULECODE,',
'        us.MODULETNO,',
'        GETMODULENO(us.MODULECODE, us.MODULETNO) AS USEDSTOCK_TRANSACTION_NO,',
'        us.USEDSTOCKQUANTITY1,',
'        sh.HIERARCHY_LEVEL + 1,',
'        sh.STOCK_TRACE_PATH || '' -> '' || TO_CHAR(s.TNO),',
'        sh.MODULE_TRACE_PATH || '' -> '' || TO_CHAR(s.STOCKMODULETNO),',
'        NVL(us.USEDSTOCKQUANTITY1, 0),',
'        CASE ',
'            WHEN us.MODULECODE = ''CCINVOICE'' THEN ''FINAL - SOLD''',
'            WHEN us.MODULECODE IN (''PRODUCTION'', ''STOCKJOURNAL'') THEN ''INTERMEDIATE - GENERATING NEW STOCK''',
'            ELSE ''UNKNOWN''',
'        END,',
'        sh.ORDER_PATH || ''/'' || LPAD(TO_CHAR(s.TNO), 20, ''0'')',
'    FROM stock_hierarchy sh',
'    INNER JOIN STOCK s ON s.STOCKMODULETNO = sh.MODULETNO ',
'                     AND s.STOCKMODULECODE = sh.MODULECODE',
'    LEFT JOIN USEDSTOCK us ON s.TNO = us.STOCKTNO',
'    WHERE sh.MODULECODE IN (''STOCKJOURNAL'', ''PRODUCTION'')',
'      AND sh.HIERARCHY_LEVEL < 50',
')',
'SELECT ',
'    sh.HIERARCHY_LEVEL,',
'    sh.STOCK_TNO,',
'    sh.STOCKMODULECODE,',
'    sh.STOCKMODULETNO,',
'    sh.STOCK_TRANSACTION_NO,',
'    sh.STORAGELOCATIONCODE,',
'    vi.ITEMNAME,',
'    sh.ITEMCODE,',
'    vi.ITEMSPECIFICATIONNAME,',
'    sh.ITEMSPECIFICATIONCODE,',
'    sh.STOCKQUANTITY1,',
'    sh.USEDSTOCK_TNO,',
'    sh.MODULECODE,',
'    sh.MODULETNO,',
'    sh.USEDSTOCK_TRANSACTION_NO,',
'    sh.USEDSTOCKQUANTITY1,',
'    sh.CONSUMED_IN_THIS_TXN,',
'    (sh.STOCKQUANTITY1 - sh.CONSUMED_IN_THIS_TXN) AS REMAINING_BALANCE,',
'    CASE ',
'        WHEN (sh.STOCKQUANTITY1 - sh.CONSUMED_IN_THIS_TXN) <= 0 THEN ''FULLY CONSUMED''',
'        WHEN sh.CONSUMED_IN_THIS_TXN > 0 AND (sh.STOCKQUANTITY1 - sh.CONSUMED_IN_THIS_TXN) > 0 THEN ''PARTIALLY CONSUMED''',
'        ELSE ''UNTOUCHED / FULL BALANCE''',
'    END AS BALANCE_STATUS,',
'    sh.STOCK_TRACE_PATH,',
'    sh.MODULE_TRACE_PATH,',
'    sh.CONSUMPTION_TYPE,',
'    CASE ',
'        WHEN sh.MODULECODE = ''CCINVOICE'' THEN ''FULLY CONSUMED - SOLD''',
'        WHEN sh.MODULECODE IN (''STOCKJOURNAL'', ''PRODUCTION'') THEN ''PARTIALLY CONSUMED - NEW STOCK GENERATED''',
'        WHEN sh.MODULECODE IS NULL AND sh.STOCKQUANTITY1 > 0 THEN ''NOT CONSUMED YET - REMAINING IN STOCK''',
'        ELSE ''UNKNOWN STATUS''',
'    END AS FINAL_STATUS',
'FROM stock_hierarchy sh',
'LEFT JOIN V_ITEM_DETAILS vi ON vi.ITEMCODE = sh.ITEMCODE ',
'                           AND vi.ITEMSPECIFICATIONCODE = sh.ITEMSPECIFICATIONCODE',
'ORDER BY sh.ORDER_PATH, sh.HIERARCHY_LEVEL;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(54352488647196457)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>36885476521967141
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(55452218139090926)
,p_db_column_name=>'BALANCE_STATUS'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Balance Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(55452103716090924)
,p_db_column_name=>'CONSUMED_IN_THIS_TXN'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Consumed In This Txn'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(55452540567090929)
,p_db_column_name=>'CONSUMPTION_TYPE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Consumption Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(55452706085090930)
,p_db_column_name=>'FINAL_STATUS'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Final Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54352605823196458)
,p_db_column_name=>'HIERARCHY_LEVEL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Hierarchy Level'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54353307480196465)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Itemcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54353128610196464)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Itemname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(55451336792090917)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Itemspecificationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54353361268196466)
,p_db_column_name=>'ITEMSPECIFICATIONNAME'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Itemspecificationname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(55451660437090920)
,p_db_column_name=>'MODULECODE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Modulecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(55451716276090921)
,p_db_column_name=>'MODULETNO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Moduletno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(55452418294090928)
,p_db_column_name=>'MODULE_TRACE_PATH'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Module Trace Path'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(55452187387090925)
,p_db_column_name=>'REMAINING_BALANCE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Remaining Balance'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54352746199196460)
,p_db_column_name=>'STOCKMODULECODE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Stockmodulecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54352863961196461)
,p_db_column_name=>'STOCKMODULETNO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Stockmoduletno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(55451502460090918)
,p_db_column_name=>'STOCKQUANTITY1'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Stockquantity1'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54352711385196459)
,p_db_column_name=>'STOCK_TNO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Stock Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(55452337238090927)
,p_db_column_name=>'STOCK_TRACE_PATH'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Stock Trace Path'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54352937697196462)
,p_db_column_name=>'STOCK_TRANSACTION_NO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Stock Transaction No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54353020883196463)
,p_db_column_name=>'STORAGELOCATIONCODE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Storagelocationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(55452007221090923)
,p_db_column_name=>'USEDSTOCKQUANTITY1'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Usedstockquantity1'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(55451537716090919)
,p_db_column_name=>'USEDSTOCK_TNO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Usedstock Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(55451864421090922)
,p_db_column_name=>'USEDSTOCK_TRANSACTION_NO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Usedstock Transaction No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(55464695282093122)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'379977'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'HIERARCHY_LEVEL:STOCKMODULECODE:STOCK_TRANSACTION_NO:ITEMNAME:ITEMSPECIFICATIONNAME:STOCKQUANTITY1:MODULECODE:USEDSTOCK_TRANSACTION_NO:USEDSTOCKQUANTITY1:CONSUMED_IN_THIS_TXN:REMAINING_BALANCE:BALANCE_STATUS:STOCK_TRACE_PATH:MODULE_TRACE_PATH:CONSUMP'
||'TION_TYPE:FINAL_STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54352268150196455)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(96755327593182624)
,p_name=>'New Card View Dashboard'
,p_static_id=>'new-card-view-dashboard'
,p_template=>2072724515482255512
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#:iboss-disable-trends:iboss-disable-chart:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- WITH RAW_DATES AS (',
'--     SELECT ',
'--         TO_DATE(TRIM(SUBSTR(:P7777_DATE_RANGE, 1, INSTR(:P7777_DATE_RANGE, '' - '') - 1)), ''DD-MM-YYYY'')    AS V_START,',
'--         TO_DATE(TRIM(SUBSTR(:P7777_DATE_RANGE, INSTR(:P7777_DATE_RANGE, '' - '') + 3)), ''DD-MM-YYYY'')       AS V_END',
'--     FROM DUAL',
'-- ),',
'-- DATE_PARAMS AS (',
'--     SELECT ',
'--         V_START AS START_DATE,',
'--         V_END AS END_DATE,',
'--         CASE ',
'--             WHEN TRUNC(V_START, ''MM'') = V_START AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 1  THEN ADD_MONTHS(TRUNC(V_START, ''MM''), -1)',
'--             WHEN TRUNC(V_START, ''Q'') = V_START  AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 3  THEN ADD_MONTHS(TRUNC(V_START, ''Q''), -3)',
'--             WHEN TO_CHAR(V_START, ''MM'') = ''04''  AND TO_CHAR(V_END, ''MM'') = ''03'' AND MONTHS_BETWEEN(V_END + 1, V_START) = 12 THEN ADD_MONTHS(V_START, -12)',
'--             ELSE V_START - (V_END - V_START + 1)',
'--         END AS PREV_START_DATE,',
'--         CASE ',
'--             WHEN TRUNC(V_START, ''MM'') = V_START AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 1  THEN LAST_DAY(ADD_MONTHS(V_END, -1))',
'--             WHEN TRUNC(V_START, ''Q'') = V_START  AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 3  THEN LAST_DAY(ADD_MONTHS(V_END, -3))',
'--             WHEN TO_CHAR(V_START, ''MM'') = ''04''  AND TO_CHAR(V_END, ''MM'') = ''03'' AND MONTHS_BETWEEN(V_END + 1, V_START) = 12 THEN ADD_MONTHS(V_END, -12)',
'--             ELSE V_START - 1',
'--         END AS PREV_END_DATE,',
'--         CASE ',
'--             WHEN V_END - V_START = 0    THEN ''yesterday''',
'--             WHEN V_END - V_START = 6    THEN ''last 7 days''',
'--             WHEN V_END - V_START = 29   THEN ''last 30 days''',
'--             WHEN TRUNC(V_START, ''MM'') = V_START AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 1  THEN ''last month''',
'--             WHEN TRUNC(V_START, ''Q'') = V_START  AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 3  THEN ''last quarter''',
'--             WHEN TO_CHAR(V_START, ''MM'') = ''04''  AND TO_CHAR(V_END, ''MM'') = ''03'' AND MONTHS_BETWEEN(V_END + 1, V_START) = 12 THEN ''last FY''',
'--             ELSE ''previous period''',
'--         END AS PERIOD_LABEL',
'--     FROM RAW_DATES',
'-- ),',
'-- -- CARD 1: Total Clients',
'-- CARD_1 AS (',
'--     SELECT ',
'--         1                       AS SEQ,',
'--         ''Total Clients''         AS CARD_TITLE,',
'--         TO_CHAR(CURR_CLIENTS)   AS CARD_TEXT,',
'--         NULL                    AS CARD_POST_TEXT,',
'--         NULL                    AS CARD_PRE_TEXT,',
'--         ''fa-users-alt''          AS CARD_ICON,',
'--         ''#E2F0D9''               AS BACKGROUND_COLOR,',
'--         ''#A9D08E''               AS BORDER_COLOR,',
'--         ''#1F4E3D''               AS TEXT_COLOR,',
'--         CASE WHEN LAG_CLIENTS = 0 AND CURR_CLIENTS > 0 THEN ''+100%'' || DP.PERIOD_LABEL',
'--              WHEN LAG_CLIENTS = 0 AND CURR_CLIENTS = 0 THEN ''0%''',
'--              ELSE CASE WHEN CURR_CLIENTS > LAG_CLIENTS THEN ''+'' ',
'--              ELSE '''' END || TO_CHAR(ROUND(((CURR_CLIENTS - LAG_CLIENTS) / LAG_CLIENTS) * 100, 1), ''FM999,990.0'') || ''%'' || DP.PERIOD_LABEL ',
'--         END AS CARD_SUBTEXT,',
'--         CASE WHEN CURR_CLIENTS > LAG_CLIENTS THEN ''fa-arrow-up'' ',
'--              WHEN CURR_CLIENTS < LAG_CLIENTS THEN ''fa-arrow-down'' ',
'--              ELSE ''fa-minus'' ',
'--         END AS TREND_ICON,',
'--         CASE WHEN CURR_CLIENTS > LAG_CLIENTS THEN ''#2E7D32'' ',
'--              WHEN CURR_CLIENTS < LAG_CLIENTS THEN ''#C00000'' ',
'--              ELSE ''#595959'' ',
'--         END AS TREND_COLOR,',
'--         CASE WHEN CHECK_MODULE_VIEW_ACCESS(''SALESORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'--             APEX_PAGE.GET_URL(',
'--             p_page   => 170,',
'--             p_items  => ''P170_FROMDATE,P170_TODATE,P170_PARTY,P170_ITEM,P170_ITEMSPECIFICATION'',',
'--             p_values => TO_CHAR(DP.START_DATE, ''DD-MM-YYYY'') || '','' || ',
'--                         TO_CHAR(DP.END_DATE, ''DD-MM-YYYY'') || '','' || ',
'--                         COALESCE(:P7777_PARTY, '''') || '','' || ',
'--                         COALESCE(:P7777_ITEM_NAME, '''') || '','' || ',
'--                         COALESCE(:P7777_ITEM_SPECIFICATION, '''')',
'--             )',
'--             ELSE APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:504:&APP_SESSION.'') ',
'--         END AS CARD_LINK',
'--     FROM (',
'--         SELECT ',
'--             COUNT(DISTINCT CASE WHEN SO.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN SO.PARTYCODE END) AS CURR_CLIENTS,',
'--             COUNT(DISTINCT CASE WHEN SO.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN SO.PARTYCODE END) AS LAG_CLIENTS',
'--         FROM SALESORDER SO',
'--         JOIN SALESORDERDETAIL SOD ON SO.TNO = SOD.TNO',
'--         CROSS JOIN DATE_PARAMS DP',
'--         WHERE (:P7777_PARTY IS NULL OR SO.PARTYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_PARTY, '':''))))',
'--           AND (:P7777_ITEM_CATEGORY IS NULL OR EXISTS (SELECT 1 FROM V_ITEM_DETAILS VI WHERE VI.ITEMCODE = SOD.ITEMCODE AND VI.ITEMCATEGORYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_CATEGORY, '':'')))))          ',
'--           AND (:P7777_ITEM_NAME IS NULL OR SOD.ITEMCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_NAME, '':''))))',
'--           AND (:P7777_ITEM_SPECIFICATION IS NULL OR SOD.ITEMSPECIFICATIONCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_SPECIFICATION, '':''))))',
'--           AND (:P7777_SALES_EXECUTIVE IS NULL OR SO.SALESEXECUTIVECODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_SALES_EXECUTIVE, '':''))))',
'--     ) CROSS JOIN DATE_PARAMS DP',
'-- ),',
'-- -- CARD 2: Total Orders',
'-- CARD_2 AS (',
'--     SELECT ',
'--         2                           AS SEQ,',
'--         ''Total Orders''              AS CARD_TITLE,',
'--         TO_CHAR(CURR_ORDERS)        AS CARD_TEXT,',
'--         NULL                        AS CARD_POST_TEXT,',
'--         NULL                        AS CARD_PRE_TEXT,',
'--         ''fa-shopping-cart''          AS CARD_ICON,',
'--         ''#e6f1fb''                   AS BACKGROUND_COLOR,',
'--         ''#92bfe7''                   AS BORDER_COLOR,',
'--         ''#185fa5''                   AS TEXT_COLOR,',
'--         CASE ',
'--              WHEN LAG_ORDERS = 0 AND CURR_ORDERS > 0 THEN ''+100%'' || DP.PERIOD_LABEL',
'--              WHEN LAG_ORDERS = 0 AND CURR_ORDERS = 0 THEN ''0%''',
'--              ELSE CASE WHEN CURR_ORDERS > LAG_ORDERS THEN ''+'' ELSE '''' END || TO_CHAR(ROUND(((CURR_ORDERS - LAG_ORDERS) / LAG_ORDERS) * 100, 1), ''FM999,990.0'') || ''%'' || DP.PERIOD_LABEL ',
'--         END AS CARD_SUBTEXT,',
'--         CASE WHEN CURR_ORDERS > LAG_ORDERS THEN ''fa-arrow-up'' ',
'--              WHEN CURR_ORDERS < LAG_ORDERS THEN ''fa-arrow-down'' ',
'--              ELSE ''fa-minus'' ',
'--         END AS TREND_ICON,',
'--         CASE WHEN CURR_ORDERS > LAG_ORDERS THEN ''#2E7D32'' ',
'--              WHEN CURR_ORDERS < LAG_ORDERS THEN ''#C00000'' ',
'--              ELSE ''#595959'' ',
'--         END AS TREND_COLOR,',
'--         NULL AS CARD_LINK',
'--     FROM (',
'--         SELECT ',
'--             COUNT(DISTINCT CASE WHEN SO.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN SO.TNO END) AS CURR_ORDERS,',
'--             COUNT(DISTINCT CASE WHEN SO.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN SO.TNO END) AS LAG_ORDERS',
'--         FROM SALESORDER SO',
'--         JOIN SALESORDERDETAIL SOD ON SO.TNO = SOD.TNO',
'--         CROSS JOIN DATE_PARAMS DP',
'--         WHERE (:P7777_PARTY IS NULL OR SO.PARTYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_PARTY, '':''))))',
'--           AND (:P7777_ITEM_CATEGORY IS NULL OR EXISTS (SELECT 1 FROM V_ITEM_DETAILS VI WHERE VI.ITEMCODE = SOD.ITEMCODE AND VI.ITEMCATEGORYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_CATEGORY, '':'')))))          ',
'--           AND (:P7777_ITEM_NAME IS NULL OR SOD.ITEMCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_NAME, '':''))))',
'--           AND (:P7777_ITEM_SPECIFICATION IS NULL OR SOD.ITEMSPECIFICATIONCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_SPECIFICATION, '':''))))',
'--           AND (:P7777_SALES_EXECUTIVE IS NULL OR SO.SALESEXECUTIVECODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_SALES_EXECUTIVE, '':''))))',
'--     ) CROSS JOIN DATE_PARAMS DP',
'-- ),',
'-- -- CARD 3: Total Ordered Qty',
'-- CARD_3 AS (',
'--     SELECT ',
'--         3 AS SEQ,',
'--         ''Total Ordered Qty'' AS CARD_TITLE,',
'--         TO_CHAR(CURR_QTY, ''999,999,990.999'') AS CARD_TEXT,',
'--         ''MT'' AS CARD_POST_TEXT,',
'--         NULL AS CARD_PRE_TEXT,',
'--         ''fa-cubes'' AS CARD_ICON,',
'--         ''#fbeaf0'' AS BACKGROUND_COLOR,',
'--         ''#d389c9'' AS BORDER_COLOR,',
'--         ''#993556'' AS TEXT_COLOR,',
'--         CASE ',
'--             WHEN LAG_QTY = 0 AND CURR_QTY > 0 THEN ''+100%'' || DP.PERIOD_LABEL',
'--             WHEN LAG_QTY = 0 AND CURR_QTY = 0 THEN ''0%''',
'--             ELSE CASE WHEN CURR_QTY > LAG_QTY THEN ''+'' ELSE '''' END || ',
'--                  TO_CHAR(ROUND(((CURR_QTY - LAG_QTY) / LAG_QTY) * 100, 1), ''FM999,990.0'') || ''%'' || DP.PERIOD_LABEL',
'--         END AS CARD_SUBTEXT,',
'--         CASE WHEN CURR_QTY > LAG_QTY THEN ''fa-arrow-up'' WHEN CURR_QTY < LAG_QTY THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'--         CASE WHEN CURR_QTY > LAG_QTY THEN ''#2E7D32'' WHEN CURR_QTY < LAG_QTY THEN ''#C00000'' ELSE ''#595959'' END AS TREND_COLOR,',
'--         NULL AS CARD_LINK',
'--     FROM (',
'--         SELECT ',
'--             SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN SOD.QUANTITY1 ELSE 0 END) AS CURR_QTY,',
'--             SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN SOD.QUANTITY1 ELSE 0 END) AS LAG_QTY',
'--         FROM SALESORDER SO',
'--         JOIN SALESORDERDETAIL SOD ON SO.TNO = SOD.TNO',
'--         CROSS JOIN DATE_PARAMS DP',
'--         WHERE (:P7777_PARTY IS NULL OR SO.PARTYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_PARTY, '':''))))',
'--           AND (:P7777_ITEM_CATEGORY IS NULL OR EXISTS (SELECT 1 FROM V_ITEM_DETAILS VI WHERE VI.ITEMCODE = SOD.ITEMCODE AND VI.ITEMCATEGORYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_CATEGORY, '':'')))))          ',
'--           AND (:P7777_ITEM_NAME IS NULL OR SOD.ITEMCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_NAME, '':''))))',
'--           AND (:P7777_ITEM_SPECIFICATION IS NULL OR SOD.ITEMSPECIFICATIONCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_SPECIFICATION, '':''))))',
'--           AND (:P7777_SALES_EXECUTIVE IS NULL OR SO.SALESEXECUTIVECODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_SALES_EXECUTIVE, '':''))))',
'--     ) CROSS JOIN DATE_PARAMS DP',
'-- ),',
'-- -- CARD 4: Total Dispatched Qty',
'-- CARD_4 AS (',
'--     SELECT ',
'--         4 AS SEQ,',
'--         ''Total Dispatched Qty'' AS CARD_TITLE,',
'--         TO_CHAR(CURR_QTY, ''999,999,990.999'') AS CARD_TEXT,',
'--         ''MT'' AS CARD_POST_TEXT,',
'--         NULL AS CARD_PRE_TEXT,',
'--         ''fa-truck'' AS CARD_ICON,',
'--         ''#E0F2F1'' AS BACKGROUND_COLOR,',
'--         ''#80CBC4'' AS BORDER_COLOR,',
'--         ''#004D40'' AS TEXT_COLOR,',
'--         CASE ',
'--             WHEN LAG_QTY = 0 AND CURR_QTY > 0 THEN ''+100%'' || DP.PERIOD_LABEL',
'--             WHEN LAG_QTY = 0 AND CURR_QTY = 0 THEN ''0%''',
'--             ELSE CASE WHEN CURR_QTY > LAG_QTY THEN ''+'' ELSE '''' END || ',
'--                  TO_CHAR(ROUND(((CURR_QTY - LAG_QTY) / LAG_QTY) * 100, 1), ''FM999,990.0'') || ''%'' || DP.PERIOD_LABEL',
'--         END AS CARD_SUBTEXT,',
'--         CASE WHEN CURR_QTY > LAG_QTY THEN ''fa-arrow-up'' WHEN CURR_QTY < LAG_QTY THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'--         CASE WHEN CURR_QTY > LAG_QTY THEN ''#2E7D32'' WHEN CURR_QTY < LAG_QTY THEN ''#C00000'' ELSE ''#595959'' END AS TREND_COLOR,',
'--         NULL AS CARD_LINK',
'--     FROM (',
'--         SELECT ',
'--             SUM(CASE WHEN DA.DESPATCHADVICEDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN DAD.QUANTITY1 ELSE 0 END) AS CURR_QTY,',
'--             SUM(CASE WHEN DA.DESPATCHADVICEDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN DAD.QUANTITY1 ELSE 0 END) AS LAG_QTY',
'--         FROM DESPATCHADVICEDETAIL DAD',
'--         JOIN DESPATCHADVICE DA ON DAD.TNO = DA.TNO',
'--         WHERE (:P7777_PARTY IS NULL OR DA.PARTYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_PARTY, '':''))))',
'--           AND (:P7777_ITEM_CATEGORY IS NULL OR EXISTS (SELECT 1 FROM V_ITEM_DETAILS VI WHERE VI.ITEMCODE = DAD.ITEMCODE AND VI.ITEMCATEGORYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_CATEGORY, '':'')))))          ',
'--           AND (:P7777_ITEM_NAME IS NULL OR DAD.ITEMCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_NAME, '':''))))',
'--           AND (:P7777_ITEM_SPECIFICATION IS NULL OR DAD.ITEMSPECIFICATIONCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_SPECIFICATION, '':''))))',
'--           AND (:P7777_SALES_EXECUTIVE IS NULL OR EXISTS (SELECT 1 FROM SALESORDER SO WHERE SO.TNO = DA.REFERENCETNO AND SO.SALESEXECUTIVECODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_SALES_EXECUTIVE, '':'') ) ) )  )',
'--         CROSS JOIN DATE_PARAMS DP',
'--     ) CROSS JOIN DATE_PARAMS DP',
'-- ),',
'-- -- CARD 5: Total Pending Dispatch Qty',
'-- CARD_5 AS (',
'--     SELECT ',
'--         5 AS SEQ,',
'--         ''Total Pending Dispatch Qty'' AS CARD_TITLE,',
'--         TO_CHAR(CURR_QTY, ''999,999,990.999'') AS CARD_TEXT,',
'--         ''MT'' AS CARD_POST_TEXT,',
'--         NULL AS CARD_PRE_TEXT,',
'--         ''fa-hourglass-2'' AS CARD_ICON,',
'--         ''#FFF2CC'' AS BACKGROUND_COLOR,',
'--         ''#F8CBAD'' AS BORDER_COLOR,',
'--         ''#7F6000'' AS TEXT_COLOR,',
'--         CASE ',
'--             WHEN LAG_QTY = 0 AND CURR_QTY > 0 THEN ''+100%'' || DP.PERIOD_LABEL',
'--             WHEN LAG_QTY = 0 AND CURR_QTY = 0 THEN ''0%''',
'--             ELSE CASE WHEN CURR_QTY > LAG_QTY THEN ''+'' ELSE '''' END || ',
'--                  TO_CHAR(ROUND(((CURR_QTY - LAG_QTY) / LAG_QTY) * 100, 1), ''FM999,990.0'') || ''%'' || DP.PERIOD_LABEL',
'--         END AS CARD_SUBTEXT,',
'--         CASE WHEN CURR_QTY > LAG_QTY THEN ''fa-arrow-up'' WHEN CURR_QTY < LAG_QTY THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'--         CASE WHEN CURR_QTY > LAG_QTY THEN ''#C00000'' WHEN CURR_QTY < LAG_QTY THEN ''#2E7D32'' ELSE ''#595959'' END AS TREND_COLOR,',
'--         NULL AS CARD_LINK',
'--     FROM (',
'--         SELECT ',
'--             SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE ',
'--                 THEN GREATEST(SOD.QUANTITY1 - COALESCE((SELECT SUM(DAD2.QUANTITY1) FROM DESPATCHADVICEDETAIL DAD2 JOIN DESPATCHADVICE DA2 ON DAD2.TNO = DA2.TNO WHERE DA2.REFERENCETNO = SO.TNO AND DAD2.ITEMCODE = SOD.ITEMCODE AND DAD2.ITEMSPECIFICA'
||'TIONCODE = SOD.ITEMSPECIFICATIONCODE), 0), 0)',
'--                 ELSE 0 END) AS CURR_QTY,',
'--             SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE ',
'--                 THEN GREATEST(SOD.QUANTITY1 - COALESCE((SELECT SUM(DAD2.QUANTITY1) FROM DESPATCHADVICEDETAIL DAD2 JOIN DESPATCHADVICE DA2 ON DAD2.TNO = DA2.TNO WHERE DA2.REFERENCETNO = SO.TNO AND DAD2.ITEMCODE = SOD.ITEMCODE AND DAD2.ITEMSPECIFICA'
||'TIONCODE = SOD.ITEMSPECIFICATIONCODE), 0), 0)',
'--                 ELSE 0 END) AS LAG_QTY',
'--         FROM SALESORDER SO',
'--         JOIN SALESORDERDETAIL SOD ON SO.TNO = SOD.TNO',
'--         CROSS JOIN DATE_PARAMS DP',
'--         WHERE (:P7777_PARTY IS NULL OR SO.PARTYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_PARTY, '':''))))',
'--           AND (:P7777_ITEM_CATEGORY IS NULL OR EXISTS (SELECT 1 FROM V_ITEM_DETAILS VI WHERE VI.ITEMCODE = SOD.ITEMCODE AND VI.ITEMCATEGORYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_CATEGORY, '':'')))))          ',
'--           AND (:P7777_ITEM_NAME IS NULL OR SOD.ITEMCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_NAME, '':''))))',
'--           AND (:P7777_ITEM_SPECIFICATION IS NULL OR SOD.ITEMSPECIFICATIONCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_SPECIFICATION, '':''))))',
'--           AND (:P7777_SALES_EXECUTIVE IS NULL OR SO.SALESEXECUTIVECODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_SALES_EXECUTIVE, '':''))))',
'--     ) CROSS JOIN DATE_PARAMS DP',
'-- ),',
'-- -- CARD 6: Total Amount',
'-- CARD_6 AS (',
'--     SELECT ',
'--         6 AS SEQ,',
'--         ''Total Amount'' AS CARD_TITLE,',
'--         TO_CHAR(CURR_AMT, ''999,999,990.999'') AS CARD_TEXT,',
'--         NULL AS CARD_POST_TEXT,',
unistr('--         ''\20B9'' AS CARD_PRE_TEXT,'),
'--         ''fa-money-bag'' AS CARD_ICON,',
'--         ''#FEF9E7'' AS BACKGROUND_COLOR,',
'--         ''#F9E79F'' AS BORDER_COLOR,',
'--         ''#7D6608'' AS TEXT_COLOR,',
'--         CASE ',
'--             WHEN LAG_AMT = 0 AND CURR_AMT > 0 THEN ''+100%'' || DP.PERIOD_LABEL',
'--             WHEN LAG_AMT = 0 AND CURR_AMT = 0 THEN ''0%''',
'--             ELSE CASE WHEN CURR_AMT > LAG_AMT THEN ''+'' ELSE '''' END || ',
'--                  TO_CHAR(ROUND(((CURR_AMT - LAG_AMT) / LAG_AMT) * 100, 1), ''FM999,990.0'') || ''%'' || DP.PERIOD_LABEL',
'--         END AS CARD_SUBTEXT,',
'--         CASE WHEN CURR_AMT > LAG_AMT THEN ''fa-arrow-up'' WHEN CURR_AMT < LAG_AMT THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'--         CASE WHEN CURR_AMT > LAG_AMT THEN ''#2E7D32'' WHEN CURR_AMT < LAG_AMT THEN ''#C00000'' ELSE ''#595959'' END AS TREND_COLOR,',
'--         NULL AS CARD_LINK',
'--     FROM (',
'--         SELECT ',
'--             SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN SOD.AMOUNT ELSE 0 END) AS CURR_AMT,',
'--             SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN SOD.AMOUNT ELSE 0 END) AS LAG_AMT',
'--         FROM SALESORDER SO',
'--         JOIN SALESORDERDETAIL SOD ON SO.TNO = SOD.TNO',
'--         CROSS JOIN DATE_PARAMS DP',
'--         WHERE (:P7777_PARTY IS NULL OR SO.PARTYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_PARTY, '':''))))',
'--           AND (:P7777_ITEM_CATEGORY IS NULL OR EXISTS (SELECT 1 FROM V_ITEM_DETAILS VI WHERE VI.ITEMCODE = SOD.ITEMCODE AND VI.ITEMCATEGORYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_CATEGORY, '':'')))))          ',
'--           AND (:P7777_ITEM_NAME IS NULL OR SOD.ITEMCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_NAME, '':''))))',
'--           AND (:P7777_ITEM_SPECIFICATION IS NULL OR SOD.ITEMSPECIFICATIONCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_SPECIFICATION, '':''))))',
'--           AND (:P7777_SALES_EXECUTIVE IS NULL OR SO.SALESEXECUTIVECODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_SALES_EXECUTIVE, '':''))))',
'--     ) CROSS JOIN DATE_PARAMS DP',
'-- ),',
'-- -- CARD 7: Loading Qty Out',
'-- CARD_7 AS (',
'--     SELECT ',
'--         7 AS SEQ,',
'--         ''Dispatched Qty Out'' AS CARD_TITLE,',
'--         TO_CHAR(CURR_QTY, ''999,999,990.999'') AS CARD_TEXT,',
'--         NULL AS CARD_POST_TEXT,',
'--         NULL AS CARD_PRE_TEXT,',
'--         ''fa-sign-out'' AS CARD_ICON,',
'--         ''#E8EAF6'' AS BACKGROUND_COLOR,',
'--         ''#C5CAE9'' AS BORDER_COLOR,',
'--         ''#1A237E'' AS TEXT_COLOR,',
'--         CASE ',
'--             WHEN LAG_QTY = 0 AND CURR_QTY > 0 THEN ''+100%'' || DP.PERIOD_LABEL',
'--             WHEN LAG_QTY = 0 AND CURR_QTY = 0 THEN ''0%''',
'--             ELSE CASE WHEN CURR_QTY > LAG_QTY THEN ''+'' ELSE '''' END || ',
'--                  TO_CHAR(ROUND(((CURR_QTY - LAG_QTY) / LAG_QTY) * 100, 1), ''FM999,990.0'') || ''%'' || DP.PERIOD_LABEL',
'--         END AS CARD_SUBTEXT,',
'--         CASE WHEN CURR_QTY > LAG_QTY THEN ''fa-arrow-up'' WHEN CURR_QTY < LAG_QTY THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'--         CASE WHEN CURR_QTY > LAG_QTY THEN ''#2E7D32'' WHEN CURR_QTY < LAG_QTY THEN ''#C00000'' ELSE ''#595959'' END AS TREND_COLOR,',
'--         NULL AS CARD_LINK',
'--     FROM (',
'--         SELECT ',
'--             SUM(CASE WHEN LA.LOADINGADVICEDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN LAD.QUANTITY1 ELSE 0 END) AS CURR_QTY,',
'--             SUM(CASE WHEN LA.LOADINGADVICEDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN LAD.QUANTITY1 ELSE 0 END) AS LAG_QTY',
'--         FROM LOADINGADVICEDETAIL LAD',
'--         JOIN LOADINGADVICE LA ON LAD.TNO = LA.TNO',
'--         CROSS JOIN DATE_PARAMS DP',
'--         WHERE (:P7777_PARTY IS NULL OR LA.PARTYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_PARTY, '':''))))',
'--           AND (:P7777_ITEM_CATEGORY IS NULL OR EXISTS (SELECT 1 FROM V_ITEM_DETAILS VI WHERE VI.ITEMCODE = LAD.ITEMCODE AND VI.ITEMCATEGORYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_CATEGORY, '':'')))))          ',
'--           AND (:P7777_ITEM_NAME IS NULL OR LAD.ITEMCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_NAME, '':''))))',
'--           AND (:P7777_ITEM_SPECIFICATION IS NULL OR LAD.ITEMSPECIFICATIONCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_SPECIFICATION, '':''))))',
'--           AND (:P7777_SALES_EXECUTIVE IS NULL OR EXISTS (SELECT 1 FROM SALESORDER SO WHERE SO.TNO = LA.REFERENCETNO AND SO.SALESEXECUTIVECODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_SALES_EXECUTIVE, '':'')))))',
'--     ) CROSS JOIN DATE_PARAMS DP',
'-- ),',
'-- -- CARD 8: Pending Loading Qty',
'-- CARD_8 AS (',
'--     SELECT ',
'--         8 AS SEQ,',
'--         ''Pending Qty Out'' AS CARD_TITLE,',
'--         TO_CHAR(CURR_QTY, ''999,999,990.999'') AS CARD_TEXT,',
'--         ''MT'' AS CARD_POST_TEXT,',
'--         NULL AS CARD_PRE_TEXT,',
'--         ''fa-pause-circle-o'' AS CARD_ICON,',
'--         ''#FDF2E9'' AS BACKGROUND_COLOR,',
'--         ''#F5CBA7'' AS BORDER_COLOR,',
'--         ''#6E2C00'' AS TEXT_COLOR,',
'--         CASE ',
'--             WHEN LAG_QTY = 0 AND CURR_QTY > 0 THEN ''+100%'' || DP.PERIOD_LABEL',
'--             WHEN LAG_QTY = 0 AND CURR_QTY = 0 THEN ''0%''',
'--             ELSE CASE WHEN CURR_QTY > LAG_QTY THEN ''+'' ELSE '''' END || ',
'--                  TO_CHAR(ROUND(((CURR_QTY - LAG_QTY) / LAG_QTY) * 100, 1), ''FM999,990.0'') || ''%'' || DP.PERIOD_LABEL',
'--         END AS CARD_SUBTEXT,',
'--         CASE WHEN CURR_QTY > LAG_QTY THEN ''fa-arrow-up'' WHEN CURR_QTY < LAG_QTY THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'--         CASE WHEN CURR_QTY > LAG_QTY THEN ''#C00000'' WHEN CURR_QTY < LAG_QTY THEN ''#2E7D32'' ELSE ''#595959'' END AS TREND_COLOR,',
'--         NULL AS CARD_LINK',
'--     FROM (',
'--         SELECT ',
'--             SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE ',
'--                 THEN GREATEST(SOD.QUANTITY1 - COALESCE((SELECT SUM(LAD2.QUANTITY1) FROM LOADINGADVICEDETAIL LAD2 JOIN LOADINGADVICE LA2 ON LAD2.TNO = LA2.TNO WHERE LA2.SALESORDERTNO = SO.TNO AND LAD2.ITEMCODE = SOD.ITEMCODE AND LAD2.ITEMSPECIFICAT'
||'IONCODE = SOD.ITEMSPECIFICATIONCODE), 0), 0)',
'--                 ELSE 0 END) AS CURR_QTY,',
'--             SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE ',
'--                 THEN GREATEST(SOD.QUANTITY1 - COALESCE((SELECT SUM(LAD2.QUANTITY1) FROM LOADINGADVICEDETAIL LAD2 JOIN LOADINGADVICE LA2 ON LAD2.TNO = LA2.TNO WHERE LA2.SALESORDERTNO = SO.TNO AND LAD2.ITEMCODE = SOD.ITEMCODE AND LAD2.ITEMSPECIFICAT'
||'IONCODE = SOD.ITEMSPECIFICATIONCODE), 0), 0)',
'--                 ELSE 0 END) AS LAG_QTY',
'--         FROM SALESORDER SO',
'--         JOIN SALESORDERDETAIL SOD ON SO.TNO = SOD.TNO',
'--         CROSS JOIN DATE_PARAMS DP',
'--         WHERE (:P7777_PARTY IS NULL OR SO.PARTYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_PARTY, '':''))))',
'--           AND (:P7777_ITEM_CATEGORY IS NULL OR EXISTS (SELECT 1 FROM V_ITEM_DETAILS VI WHERE VI.ITEMCODE = SOD.ITEMCODE AND VI.ITEMCATEGORYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_CATEGORY, '':'')))))          ',
'--           AND (:P7777_ITEM_NAME IS NULL OR SOD.ITEMCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_NAME, '':''))))',
'--           AND (:P7777_ITEM_SPECIFICATION IS NULL OR SOD.ITEMSPECIFICATIONCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_SPECIFICATION, '':''))))',
'--           AND (:P7777_SALES_EXECUTIVE IS NULL OR SO.SALESEXECUTIVECODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_SALES_EXECUTIVE, '':''))))',
'--     ) CROSS JOIN DATE_PARAMS DP',
'-- ),',
'-- -- CARD 9: Cancelled Qty',
'-- CARD_9 AS (',
'--     SELECT ',
'--         9 AS SEQ,',
'--         ''Cancelled Qty'' AS CARD_TITLE,',
'--         TO_CHAR(CURR_QTY, ''999,999,990.999'') AS CARD_TEXT,',
'--         ''MT'' AS CARD_POST_TEXT,',
'--         NULL AS CARD_PRE_TEXT,',
'--         ''fa-ban'' AS CARD_ICON,',
'--         ''#FCE4D6'' AS BACKGROUND_COLOR,',
'--         ''#F4B084'' AS BORDER_COLOR,',
'--         ''#C65911'' AS TEXT_COLOR,',
'--         CASE ',
'--             WHEN LAG_QTY = 0 AND CURR_QTY > 0 THEN ''+100%'' || DP.PERIOD_LABEL',
'--             WHEN LAG_QTY = 0 AND CURR_QTY = 0 THEN ''0%''',
'--             ELSE CASE WHEN CURR_QTY > LAG_QTY THEN ''+'' ELSE '''' END || ',
'--                  TO_CHAR(ROUND(((CURR_QTY - LAG_QTY) / LAG_QTY) * 100, 1), ''FM999,990.0'') || ''%'' || DP.PERIOD_LABEL',
'--         END AS CARD_SUBTEXT,',
'--         CASE WHEN CURR_QTY > LAG_QTY THEN ''fa-arrow-up'' WHEN CURR_QTY < LAG_QTY THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'--         CASE WHEN CURR_QTY > LAG_QTY THEN ''#C00000'' WHEN CURR_QTY < LAG_QTY THEN ''#2E7D32'' ELSE ''#595959'' END AS TREND_COLOR,',
'--         NULL AS CARD_LINK',
'--     FROM (',
'--         SELECT ',
'--             SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE AND GETDOCUMENTSTATUSCODE(''SALESORDER'', SO.TNO) = ''SHORTCLOSED''',
'--                 THEN GREATEST(SOD.QUANTITY1 - COALESCE((SELECT SUM(DAD2.QUANTITY1) FROM DESPATCHADVICEDETAIL DAD2 JOIN DESPATCHADVICE DA2 ON DAD2.TNO = DA2.TNO WHERE DA2.REFERENCETNO = SO.TNO AND DAD2.ITEMCODE = SOD.ITEMCODE AND DAD2.ITEMSPECIFICA'
||'TIONCODE = SOD.ITEMSPECIFICATIONCODE), 0) - COALESCE((SELECT SUM(LAD2.QUANTITY1) FROM LOADINGADVICEDETAIL LAD2 JOIN LOADINGADVICE LA2 ON LAD2.TNO = LA2.TNO WHERE LA2.SALESORDERTNO = SO.TNO AND LAD2.ITEMCODE = SOD.ITEMCODE AND LAD2.ITEMSPECIFICATIONCO'
||'DE = SOD.ITEMSPECIFICATIONCODE), 0), 0)',
'--                 ELSE 0 END) AS CURR_QTY,',
'--             SUM(CASE WHEN SO.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE AND GETDOCUMENTSTATUSCODE(''SALESORDER'', SO.TNO) = ''SHORTCLOSED''',
'--                 THEN GREATEST(SOD.QUANTITY1 - COALESCE((SELECT SUM(DAD2.QUANTITY1) FROM DESPATCHADVICEDETAIL DAD2 JOIN DESPATCHADVICE DA2 ON DAD2.TNO = DA2.TNO WHERE DA2.REFERENCETNO = SO.TNO AND DAD2.ITEMCODE = SOD.ITEMCODE AND DAD2.ITEMSPECIFICA'
||'TIONCODE = SOD.ITEMSPECIFICATIONCODE), 0) - COALESCE((SELECT SUM(LAD2.QUANTITY1) FROM LOADINGADVICEDETAIL LAD2 JOIN LOADINGADVICE LA2 ON LAD2.TNO = LA2.TNO WHERE LA2.SALESORDERTNO = SO.TNO AND LAD2.ITEMCODE = SOD.ITEMCODE AND LAD2.ITEMSPECIFICATIONCO'
||'DE = SOD.ITEMSPECIFICATIONCODE), 0), 0)',
'--                 ELSE 0 END) AS LAG_QTY',
'--         FROM SALESORDER SO',
'--         JOIN SALESORDERDETAIL SOD ON SO.TNO = SOD.TNO',
'--         CROSS JOIN DATE_PARAMS DP',
'--         WHERE (:P7777_PARTY IS NULL OR SO.PARTYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_PARTY, '':''))))',
'--           AND (:P7777_ITEM_CATEGORY IS NULL OR EXISTS (SELECT 1 FROM V_ITEM_DETAILS VI WHERE VI.ITEMCODE = SOD.ITEMCODE AND VI.ITEMCATEGORYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_CATEGORY, '':'')))))          ',
'--           AND (:P7777_ITEM_NAME IS NULL OR SOD.ITEMCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_NAME, '':''))))',
'--           AND (:P7777_ITEM_SPECIFICATION IS NULL OR SOD.ITEMSPECIFICATIONCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_SPECIFICATION, '':''))))',
'--           AND (:P7777_SALES_EXECUTIVE IS NULL OR SO.SALESEXECUTIVECODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_SALES_EXECUTIVE, '':''))))',
'--     ) CROSS JOIN DATE_PARAMS DP',
'-- )',
'-- SELECT * FROM CARD_1',
'-- UNION ALL SELECT * FROM CARD_2',
'-- UNION ALL SELECT * FROM CARD_3',
'-- UNION ALL SELECT * FROM CARD_4',
'-- UNION ALL SELECT * FROM CARD_5',
'-- UNION ALL SELECT * FROM CARD_6',
'-- UNION ALL SELECT * FROM CARD_7',
'-- UNION ALL SELECT * FROM CARD_8',
'-- UNION ALL SELECT * FROM CARD_9',
'SELECT 1 FROM DUAL;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P7777_DATE_RANGE,P7777_PARTY,P7777_ITEM_CATEGORY,P7777_ITEM_NAME,P7777_ITEM_SPECIFICATION,P7777_SALES_EXECUTIVE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(56225064195302226)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'NO DATA FOUND'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_imp.id(573771056156959416)
);
wwv_flow_imp_page.set_region_column_width(
 p_id=>wwv_flow_imp.id(96755327593182624)
,p_plug_column_width=>'style="margin-bottom: 10px;"'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57377367339328711)
,p_query_column_id=>1
,p_column_alias=>'1'
,p_column_display_sequence=>10
,p_column_heading=>'1'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(95822590187428867)
,p_name=>'New Card View Dashboard_VIEW BASED'
,p_static_id=>'new-card-view-dashboard-view-based'
,p_region_name=>'Card_Dashboard'
,p_template=>2072724515482255512
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#:iboss-disable-trends:iboss-disable-chart:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH RAW_DATES AS (',
'    SELECT ',
'        TO_DATE(TRIM(SUBSTR(:P7777_DATE_RANGE, 1, INSTR(:P7777_DATE_RANGE, '' - '') - 1)), ''DD-MM-YYYY'')    AS V_START,',
'        TO_DATE(TRIM(SUBSTR(:P7777_DATE_RANGE, INSTR(:P7777_DATE_RANGE, '' - '') + 3)), ''DD-MM-YYYY'')       AS V_END',
'    FROM DUAL',
'),',
'DATE_PARAMS AS (',
'    SELECT ',
'        V_START AS START_DATE,',
'        V_END AS END_DATE,',
'        CASE ',
'            WHEN TRUNC(V_START, ''MM'') = V_START AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 1  THEN ADD_MONTHS(TRUNC(V_START, ''MM''), -1)',
'            WHEN TRUNC(V_START, ''Q'') = V_START  AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 3  THEN ADD_MONTHS(TRUNC(V_START, ''Q''), -3)',
'            WHEN TO_CHAR(V_START, ''MM'') = ''04''  AND TO_CHAR(V_END, ''MM'') = ''03'' AND MONTHS_BETWEEN(V_END + 1, V_START) = 12 THEN ADD_MONTHS(V_START, -12)',
'            ELSE V_START - (V_END - V_START + 1)',
'        END AS PREV_START_DATE,',
'        CASE ',
'            WHEN TRUNC(V_START, ''MM'') = V_START AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 1  THEN LAST_DAY(ADD_MONTHS(V_END, -1))',
'            WHEN TRUNC(V_START, ''Q'') = V_START  AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 3  THEN LAST_DAY(ADD_MONTHS(V_END, -3))',
'            WHEN TO_CHAR(V_START, ''MM'') = ''04''  AND TO_CHAR(V_END, ''MM'') = ''03'' AND MONTHS_BETWEEN(V_END + 1, V_START) = 12 THEN ADD_MONTHS(V_END, -12)',
'            ELSE V_START - 1',
'        END AS PREV_END_DATE,',
'        CASE ',
'            WHEN V_END - V_START = 0    THEN ''yesterday''',
'            WHEN V_END - V_START = 6    THEN ''last 7 days''',
'            WHEN V_END - V_START = 29   THEN ''last 30 days''',
'            WHEN TRUNC(V_START, ''MM'') = V_START AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 1  THEN ''last month''',
'            WHEN TRUNC(V_START, ''Q'') = V_START  AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 3  THEN ''last quarter''',
'            WHEN TO_CHAR(V_START, ''MM'') = ''04''  AND TO_CHAR(V_END, ''MM'') = ''03'' AND MONTHS_BETWEEN(V_END + 1, V_START) = 12 THEN ''last FY''',
'            ELSE ''previous period''',
'        END AS PERIOD_LABEL',
'    FROM RAW_DATES',
'),',
'CHART_RAW_DATA AS (',
'    SELECT ',
'        CASE ',
'            WHEN (DP.END_DATE - DP.START_DATE) = 0  THEN ''00:00-12:00''',
'            WHEN (DP.END_DATE - DP.START_DATE) = 1  THEN ''12:00-23:59''',
'            WHEN (DP.END_DATE - DP.START_DATE) <= 7 THEN TO_CHAR(V.SALESORDERDATE, ''DD-Mon'')',
'            WHEN (DP.END_DATE - DP.START_DATE) BETWEEN 8 AND 35 THEN ''Week '' || TO_CHAR(V.SALESORDERDATE, ''W'')',
'            ELSE TO_CHAR(V.SALESORDERDATE, ''Mon-YY'')',
'        END AS LABEL_TEXT,',
'        CASE ',
'            WHEN (DP.END_DATE - DP.START_DATE) = 0  THEN TO_DATE(''01-01-2000'', ''DD-MM-YYYY'') + 0',
'            WHEN (DP.END_DATE - DP.START_DATE) = 1  THEN TO_DATE(''01-01-2000'', ''DD-MM-YYYY'') + 1',
'            WHEN (DP.END_DATE - DP.START_DATE) <= 7 THEN TRUNC(V.SALESORDERDATE, ''DD'')',
'            WHEN (DP.END_DATE - DP.START_DATE) BETWEEN 8 AND 35 THEN TRUNC(V.SALESORDERDATE, ''W'')',
'            ELSE TRUNC(V.SALESORDERDATE, ''MM'')',
'        END AS SORT_DATE,',
'        COUNT(DISTINCT V.PARTYCODE) AS MTH_CLIENTS,',
'        COUNT(DISTINCT V.SALES_ORDER_TNO) AS MTH_ORDERS,',
'        SUM(V.ORDERED_QTY) AS MTH_ORDERED_QTY,',
'        SUM(V.DISPATCHED_QTY) AS MTH_DISPATCHED_QTY,',
'        SUM(V.PENDING_DESPATCH_QTY) AS MTH_PENDING_QTY,',
'        SUM(V.BASE_AMOUNT) AS MTH_AMOUNT,',
'        SUM(V.LOADINGADVICE_QTY) AS MTH_LOADING_QTY,',
'        SUM(V.PENDING_LOADING_QTY) AS MTH_PENDING_LOADING_QTY,',
'        SUM(V.CANCELLED_QTY) AS MTH_CANCELLED_QTY',
'    FROM V_DASHBOARD_SALES_SUMMARY V',
'    CROSS JOIN DATE_PARAMS DP',
'    WHERE V.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE',
'    GROUP BY ',
'        CASE ',
'            WHEN (DP.END_DATE - DP.START_DATE) = 0 THEN ''00:00-12:00''',
'            WHEN (DP.END_DATE - DP.START_DATE) = 1 THEN ''12:00-23:59''',
'            WHEN (DP.END_DATE - DP.START_DATE) <= 7 THEN TO_CHAR(V.SALESORDERDATE, ''DD-Mon'')',
'            WHEN (DP.END_DATE - DP.START_DATE) BETWEEN 8 AND 35 THEN ''Week '' || TO_CHAR(V.SALESORDERDATE, ''W'')',
'            ELSE TO_CHAR(V.SALESORDERDATE, ''Mon-YY'')',
'        END,',
'        CASE ',
'            WHEN (DP.END_DATE - DP.START_DATE) = 0 THEN TO_DATE(''01-01-2000'', ''DD-MM-YYYY'') + 0',
'            WHEN (DP.END_DATE - DP.START_DATE) = 1 THEN TO_DATE(''01-01-2000'', ''DD-MM-YYYY'') + 1',
'            WHEN (DP.END_DATE - DP.START_DATE) <= 7 THEN TRUNC(V.SALESORDERDATE, ''DD'')',
'            WHEN (DP.END_DATE - DP.START_DATE) BETWEEN 8 AND 35 THEN TRUNC(V.SALESORDERDATE, ''W'')',
'            ELSE TRUNC(V.SALESORDERDATE, ''MM'')',
'        END',
'),',
'CHART_STRINGS AS (',
'    SELECT ',
'        LISTAGG(LABEL_TEXT, '','')                WITHIN GROUP (ORDER BY SORT_DATE) AS FINAL_LABELS,',
'        LISTAGG(MTH_CLIENTS, '','')               WITHIN GROUP (ORDER BY SORT_DATE) AS DATA_CLIENTS,',
'        LISTAGG(MTH_ORDERS, '','')                WITHIN GROUP (ORDER BY SORT_DATE) AS DATA_ORDERS,',
'        LISTAGG(MTH_ORDERED_QTY, '','')           WITHIN GROUP (ORDER BY SORT_DATE) AS DATA_ORDERED_QTY,',
'        LISTAGG(MTH_DISPATCHED_QTY, '','')        WITHIN GROUP (ORDER BY SORT_DATE) AS DATA_DISPATCHED_QTY,',
'        LISTAGG(MTH_PENDING_QTY, '','')           WITHIN GROUP (ORDER BY SORT_DATE) AS DATA_PENDING_QTY,',
'        LISTAGG(MTH_AMOUNT, '','')                WITHIN GROUP (ORDER BY SORT_DATE) AS DATA_AMOUNT,',
'        LISTAGG(MTH_LOADING_QTY, '','')           WITHIN GROUP (ORDER BY SORT_DATE) AS DATA_LOADING_QTY,',
'        LISTAGG(MTH_PENDING_LOADING_QTY, '','')   WITHIN GROUP (ORDER BY SORT_DATE) AS DATA_PENDING_LOADING_QTY,',
'        LISTAGG(MTH_CANCELLED_QTY, '','')         WITHIN GROUP (ORDER BY SORT_DATE) AS DATA_CANCELLED_QTY',
'    FROM CHART_RAW_DATA',
'),',
'BASE_METRICS AS (',
'    SELECT ',
'        DP.START_DATE, DP.END_DATE,',
'        MAX(DP.PERIOD_LABEL) AS TREND_PERIOD,',
'        COUNT(DISTINCT CASE WHEN V.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN V.PARTYCODE END) AS CURR_TOTAL_CLIENTS,',
'        COUNT(DISTINCT CASE WHEN V.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN V.PARTYCODE END) AS PREV_TOTAL_CLIENTS,',
'        COUNT(DISTINCT CASE WHEN V.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN V.SALES_ORDER_TNO END) AS CURR_TOTAL_ORDERS,',
'        COUNT(DISTINCT CASE WHEN V.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN V.SALES_ORDER_TNO END) AS PREV_TOTAL_ORDERS,',
'        SUM(CASE WHEN V.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN V.ORDERED_QTY ELSE 0 END) AS CURR_ORDERED_QTY,',
'        SUM(CASE WHEN V.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN V.ORDERED_QTY ELSE 0 END) AS PREV_ORDERED_QTY,',
'        SUM(CASE WHEN V.DESPATCHADVICEDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN V.DISPATCHED_QTY ELSE 0 END) AS CURR_DISPATCHED_QTY,',
'        SUM(CASE WHEN V.DESPATCHADVICEDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN V.DISPATCHED_QTY ELSE 0 END) AS PREV_DISPATCHED_QTY,',
'        SUM(CASE WHEN V.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN V.PENDING_DESPATCH_QTY ELSE 0 END) AS CURR_PENDING_QTY,',
'        SUM(CASE WHEN V.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN V.PENDING_DESPATCH_QTY ELSE 0 END) AS PREV_PENDING_QTY,',
'        SUM(CASE WHEN V.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN V.BASE_AMOUNT ELSE 0 END) AS CURR_BASE_AMOUNT,',
'        SUM(CASE WHEN V.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN V.BASE_AMOUNT ELSE 0 END) AS PREV_BASE_AMOUNT,',
'        SUM(CASE WHEN V.LOADINGADVICEDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN V.LOADINGADVICE_QTY ELSE 0 END) AS CURR_LOADING_QTY,',
'        SUM(CASE WHEN V.LOADINGADVICEDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN V.LOADINGADVICE_QTY ELSE 0 END) AS PREV_LOADING_QTY,',
'        SUM(CASE WHEN V.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN V.PENDING_LOADING_QTY ELSE 0 END) AS CURR_PENDING_LOADING_QTY,',
'        SUM(CASE WHEN V.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN V.PENDING_LOADING_QTY ELSE 0 END) AS PREV_PENDING_LOADING_QTY,',
'        SUM(CASE WHEN V.SALESORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN V.CANCELLED_QTY ELSE 0 END) AS CURR_CANCELLED_QTY,',
'        SUM(CASE WHEN V.SALESORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN V.CANCELLED_QTY ELSE 0 END) AS PREV_CANCELLED_QTY',
'    FROM V_DASHBOARD_SALES_SUMMARY V ',
'    CROSS JOIN DATE_PARAMS DP',
'    WHERE (',
'        (V.SALESORDERDATE >= DP.PREV_START_DATE AND V.SALESORDERDATE <= DP.END_DATE) OR',
'        (V.DESPATCHADVICEDATE >= DP.PREV_START_DATE AND V.DESPATCHADVICEDATE <= DP.END_DATE) OR',
'        (V.LOADINGADVICEDATE >= DP.PREV_START_DATE AND V.LOADINGADVICEDATE <= DP.END_DATE)',
'    )',
'    AND (:P7777_PARTY IS NULL OR V.PARTYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_PARTY, '':''))))',
'    AND (:P7777_ITEM_CATEGORY IS NULL OR V.ITEMCATEGORYCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_CATEGORY, '':''))))',
'    AND (:P7777_ITEM_NAME IS NULL OR V.ITEMCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_NAME, '':''))))',
'    AND (:P7777_ITEM_SPECIFICATION IS NULL OR V.ITEMSPECIFICATIONCODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_ITEM_SPECIFICATION, '':''))))',
'    AND (:P7777_SALES_EXECUTIVE IS NULL OR V.SALESEXECUTIVECODE IN (SELECT column_value FROM TABLE(APEX_STRING.SPLIT(:P7777_SALES_EXECUTIVE, '':''))))',
'    GROUP BY DP.START_DATE, DP.END_DATE',
')',
'SELECT * FROM (',
'    -- CARD 1: Total Clients',
'    SELECT 1                    AS SEQ, ',
'    ''Total Clients''             AS CARD_TITLE, ',
'    TO_CHAR(CURR_TOTAL_CLIENTS) AS CARD_TEXT, ',
'    NULL                        AS CARD_POST_TEXT, ',
'    NULL                        AS CARD_PRE_TEXT, ',
'    ''fa-users-alt''              AS CARD_ICON,',
'    ''#E2F0D9''                   AS BACKGROUND_COLOR, ',
'    ''#A9D08E''                   AS BORDER_COLOR,',
'    ''#1F4E3D''                   AS TEXT_COLOR,',
'    CASE WHEN PREV_TOTAL_CLIENTS = 0 AND CURR_TOTAL_CLIENTS > 0 THEN ''+100%'' WHEN PREV_TOTAL_CLIENTS = 0 AND CURR_TOTAL_CLIENTS = 0 THEN ''0%'' ELSE CASE WHEN CURR_TOTAL_CLIENTS > PREV_TOTAL_CLIENTS THEN ''+'' ELSE '''' END || TO_CHAR(ROUND(((CURR_TOTAL_CL'
||'IENTS - PREV_TOTAL_CLIENTS) / PREV_TOTAL_CLIENTS) * 100, 1), ''FM999,990.0'') || ''%''|| TREND_PERIOD END AS CARD_SUBTEXT,',
'    CASE WHEN CURR_TOTAL_CLIENTS > PREV_TOTAL_CLIENTS THEN ''fa-arrow-up'' WHEN CURR_TOTAL_CLIENTS < PREV_TOTAL_CLIENTS THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'    CASE WHEN CURR_TOTAL_CLIENTS > PREV_TOTAL_CLIENTS THEN ''#2E7D32'' WHEN CURR_TOTAL_CLIENTS < PREV_TOTAL_CLIENTS THEN ''#C00000'' ELSE ''#595959'' END AS TREND_COLOR,',
'    ''bar''                       AS CHART_TYPE,',
'    CS.FINAL_LABELS             AS CHART_LABELS,',
'    CS.DATA_CLIENTS             AS CHART_DATA,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''SALESORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 ',
'    THEN',
'        APEX_PAGE.GET_URL(',
'        p_page   => 170,',
'        p_items  => ''P170_FROMDATE,P170_TODATE,P170_PARTY,P170_ITEM,P170_ITEMSPECIFICATION'',',
'        p_values => TO_CHAR(bm.START_DATE, ''DD-MM-YYYY'') || '','' || ',
'                    TO_CHAR(bm.END_DATE, ''DD-MM-YYYY'') || '','' || ',
'                    COALESCE(:P7777_PARTY, '''') || '','' || ',
'                    COALESCE(:P7777_ITEM_NAME, '''') || '','' || ',
'                    COALESCE(:P7777_ITEM_SPECIFICATION, '''')',
'    )',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:504:&APP_SESSION.'')',
'    END AS CARD_LINK',
'    FROM BASE_METRICS BM ',
'    CROSS JOIN CHART_STRINGS CS',
'',
'    UNION ALL',
'',
'    -- CARD 2: Total Orders',
'    SELECT 2                    AS SEQ, ',
'    ''Total Orders''              AS CARD_TITLE, ',
'    TO_CHAR(CURR_TOTAL_ORDERS)  AS CARD_TEXT, ',
'    NULL                        AS CARD_POST_TEXT, ',
'    NULL                        AS CARD_PRE_TEXT, ',
'    ''fa-shopping-cart''          AS CARD_ICON,',
'    ''#e6f1fb''                   AS BACKGROUND_COLOR, ',
'    ''#92bfe7''                   AS BORDER_COLOR,',
'    ''#185fa5''                   AS TEXT_COLOR,',
'    CASE WHEN PREV_TOTAL_ORDERS = 0 AND CURR_TOTAL_ORDERS > 0 THEN ''+100%'' WHEN PREV_TOTAL_ORDERS = 0 AND CURR_TOTAL_ORDERS = 0 THEN ''0%'' ELSE CASE WHEN CURR_TOTAL_ORDERS > PREV_TOTAL_ORDERS THEN ''+'' ELSE '''' END || TO_CHAR(ROUND(((CURR_TOTAL_ORDERS -'
||' PREV_TOTAL_ORDERS) / PREV_TOTAL_ORDERS) * 100, 1), ''FM999,990.0'') || ''%''|| TREND_PERIOD END AS CARD_SUBTEXT,',
'    CASE WHEN CURR_TOTAL_ORDERS > PREV_TOTAL_ORDERS THEN ''fa-arrow-up'' WHEN CURR_TOTAL_ORDERS < PREV_TOTAL_ORDERS THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'    CASE WHEN CURR_TOTAL_ORDERS > PREV_TOTAL_ORDERS THEN ''#2E7D32'' WHEN CURR_TOTAL_ORDERS < PREV_TOTAL_ORDERS THEN ''#C00000'' ELSE ''#595959'' END AS TREND_COLOR,',
'    ''line''                      AS CHART_TYPE,',
'    CS.FINAL_LABELS             AS CHART_LABELS,',
'    CS.DATA_ORDERS              AS CHART_DATA,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''SALESORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:170:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:504:&APP_SESSION.'')',
'    END                         AS CARD_LINK',
'    FROM BASE_METRICS BM ',
'    CROSS JOIN CHART_STRINGS CS',
'',
'    UNION ALL',
'',
'    -- CARD 3: Total Ordered Qty',
'    SELECT 3                    AS SEQ, ',
'    ''Total Ordered Qty''         AS CARD_TITLE, ',
'    TO_CHAR(CURR_ORDERED_QTY, ''999,999,990.999'') AS CARD_TEXT, ',
'    ''MT''                        AS CARD_POST_TEXT, ',
'    NULL                        AS CARD_PRE_TEXT, ',
'    ''fa-cubes''                  AS CARD_ICON,',
'    ''#fbeaf0''                   AS BACKGROUND_COLOR, ',
'    ''#d389c9''                   AS BORDER_COLOR,',
'    ''#993556''                   AS TEXT_COLOR,',
'    CASE WHEN PREV_ORDERED_QTY = 0 AND CURR_ORDERED_QTY > 0 THEN ''+100%'' WHEN PREV_ORDERED_QTY = 0 AND CURR_ORDERED_QTY = 0 THEN ''0%'' ELSE CASE WHEN CURR_ORDERED_QTY > PREV_ORDERED_QTY THEN ''+'' ELSE '''' END || TO_CHAR(ROUND(((CURR_ORDERED_QTY - PREV_O'
||'RDERED_QTY) / PREV_ORDERED_QTY) * 100, 1), ''FM999,990.0'') || ''%''|| TREND_PERIOD END AS CARD_SUBTEXT,',
'    CASE WHEN CURR_ORDERED_QTY > PREV_ORDERED_QTY THEN ''fa-arrow-up'' WHEN CURR_ORDERED_QTY < PREV_ORDERED_QTY THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'    CASE WHEN CURR_ORDERED_QTY > PREV_ORDERED_QTY THEN ''#2E7D32'' WHEN CURR_ORDERED_QTY < PREV_ORDERED_QTY THEN ''#C00000'' ELSE ''#595959'' END AS TREND_COLOR,',
'    ''bar''                       AS CHART_TYPE,',
'    CS.FINAL_LABELS             AS CHART_LABELS,',
'    CS.DATA_ORDERED_QTY         AS CHART_DATA,',
'    NULL                        AS CARD_LINK',
'    FROM BASE_METRICS BM ',
'    CROSS JOIN CHART_STRINGS CS',
'',
'    UNION ALL',
'',
'    -- CARD 4: Total Dispatched Qty',
'    SELECT 4                    AS SEQ, ',
'    ''Total Dispatched Qty''      AS CARD_TITLE, ',
'    TO_CHAR(CURR_DISPATCHED_QTY, ''999,999,990.999'') AS CARD_TEXT, ',
'    ''MT''                        AS CARD_POST_TEXT, ',
'    NULL                        AS CARD_PRE_TEXT, ',
'    ''fa-truck''                  AS CARD_ICON,',
'    ''#E0F2F1''                   AS BACKGROUND_COLOR, ',
'    ''#80CBC4''                   AS BORDER_COLOR,',
'    ''#004D40''                   AS TEXT_COLOR,',
'    CASE WHEN PREV_DISPATCHED_QTY = 0 AND CURR_DISPATCHED_QTY > 0 THEN ''+100%'' WHEN PREV_DISPATCHED_QTY = 0 AND CURR_DISPATCHED_QTY = 0 THEN ''0%'' ELSE CASE WHEN CURR_DISPATCHED_QTY > PREV_DISPATCHED_QTY THEN ''+'' ELSE '''' END || TO_CHAR(ROUND(((CURR_DI'
||'SPATCHED_QTY - PREV_DISPATCHED_QTY) / PREV_DISPATCHED_QTY) * 100, 1), ''FM999,990.0'') || ''%''|| TREND_PERIOD END AS CARD_SUBTEXT,',
'    CASE WHEN CURR_DISPATCHED_QTY > PREV_DISPATCHED_QTY THEN ''fa-arrow-up'' WHEN CURR_DISPATCHED_QTY < PREV_DISPATCHED_QTY THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'    CASE WHEN CURR_DISPATCHED_QTY > PREV_DISPATCHED_QTY THEN ''#2E7D32'' WHEN CURR_DISPATCHED_QTY < PREV_DISPATCHED_QTY THEN ''#C00000'' ELSE ''#595959'' END AS TREND_COLOR,',
'    ''bar''                       AS CHART_TYPE,',
'    CS.FINAL_LABELS             AS CHART_LABELS,',
'    CS.DATA_DISPATCHED_QTY      AS CHART_DATA,',
'	NULL                        AS CARD_LINK',
'    FROM BASE_METRICS BM ',
'    CROSS JOIN CHART_STRINGS CS',
'',
'    UNION ALL',
'',
'    -- CARD 5: Total Pending Qty',
'    SELECT 5                    AS SEQ, ',
'    ''Total Pending Qty''         AS CARD_TITLE, ',
'    TO_CHAR(CURR_PENDING_QTY, ''999,999,990.999'') AS CARD_TEXT, ',
'    ''MT''                        AS CARD_POST_TEXT, ',
'    NULL                        AS CARD_PRE_TEXT, ',
'    ''fa-hourglass-2''            AS CARD_ICON,',
'    ''#FFF2CC''                   AS BACKGROUND_COLOR, ',
'    ''#F8CBAD''                   AS BORDER_COLOR,',
'    ''#7F6000''                   AS TEXT_COLOR,',
'    CASE WHEN PREV_PENDING_QTY = 0 AND CURR_PENDING_QTY > 0 THEN ''+100%'' WHEN PREV_PENDING_QTY = 0 AND CURR_PENDING_QTY = 0 THEN ''0%'' ELSE CASE WHEN CURR_PENDING_QTY > PREV_PENDING_QTY THEN ''+'' ELSE '''' END || TO_CHAR(ROUND(((CURR_PENDING_QTY - PREV_P'
||'ENDING_QTY) / PREV_PENDING_QTY) * 100, 1), ''FM999,990.0'') || ''%''|| TREND_PERIOD END AS CARD_SUBTEXT,',
'    CASE WHEN CURR_PENDING_QTY > PREV_PENDING_QTY THEN ''fa-arrow-up'' WHEN CURR_PENDING_QTY < PREV_PENDING_QTY THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'    CASE WHEN CURR_PENDING_QTY > PREV_PENDING_QTY THEN ''#C00000'' WHEN CURR_PENDING_QTY < PREV_PENDING_QTY THEN ''#2E7D32'' ELSE ''#595959'' END AS TREND_COLOR,',
'    ''bar''                       AS CHART_TYPE,',
'    CS.FINAL_LABELS             AS CHART_LABELS,',
'    CS.DATA_PENDING_QTY         AS CHART_DATA,',
'	NULL                        AS CARD_LINK',
'    FROM BASE_METRICS BM ',
'    CROSS JOIN CHART_STRINGS CS',
'',
'    UNION ALL',
'',
'    -- CARD 6: Total Amount',
'    SELECT 6                    AS SEQ, ',
'    ''Total Amount''              AS CARD_TITLE, ',
'    TO_CHAR(CURR_BASE_AMOUNT, ''999,999,990.999'') AS CARD_TEXT, ',
'    NULL                        AS CARD_POST_TEXT, ',
unistr('    ''\20B9''                         AS CARD_PRE_TEXT, '),
'    ''fa-money-bag''              AS CARD_ICON,',
'    ''#FEF9E7''                   AS BACKGROUND_COLOR, ',
'    ''#F9E79F''                   AS BORDER_COLOR,',
'    ''#7D6608''                   AS TEXT_COLOR,',
'    CASE WHEN PREV_BASE_AMOUNT = 0 AND CURR_BASE_AMOUNT > 0 THEN ''+100%'' WHEN PREV_BASE_AMOUNT = 0 AND CURR_BASE_AMOUNT = 0 THEN ''0%'' ELSE CASE WHEN CURR_BASE_AMOUNT > PREV_BASE_AMOUNT THEN ''+'' ELSE '''' END || TO_CHAR(ROUND(((CURR_BASE_AMOUNT - PREV_B'
||'ASE_AMOUNT) / PREV_BASE_AMOUNT) * 100, 1), ''FM999,990.0'') || ''%''|| TREND_PERIOD END AS CARD_SUBTEXT,',
'    CASE WHEN CURR_BASE_AMOUNT > PREV_BASE_AMOUNT THEN ''fa-arrow-up'' WHEN CURR_BASE_AMOUNT < PREV_BASE_AMOUNT THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'    CASE WHEN CURR_BASE_AMOUNT > PREV_BASE_AMOUNT THEN ''#2E7D32'' WHEN CURR_BASE_AMOUNT < PREV_BASE_AMOUNT THEN ''#C00000'' ELSE ''#595959'' END AS TREND_COLOR,',
'    ''line''                      AS CHART_TYPE,',
'    CS.FINAL_LABELS             AS CHART_LABELS,',
'    CS.DATA_AMOUNT              AS CHART_DATA,',
'	NULL                        AS CARD_LINK',
'    FROM BASE_METRICS BM ',
'    CROSS JOIN CHART_STRINGS CS',
'',
'    UNION ALL',
'',
'    -- CARD 7: Dispatched Quantity Out',
'    SELECT 7                    AS SEQ, ',
'    ''Dispatched Quantity Out''   AS CARD_TITLE, ',
'    TO_CHAR(CURR_LOADING_QTY, ''999,999,990.999'') AS CARD_TEXT, ',
'    NULL                        AS CARD_POST_TEXT, ',
'    NULL                        AS CARD_PRE_TEXT, ',
'    ''fa-sign-out''               AS CARD_ICON,',
'    ''#E8EAF6''                   AS BACKGROUND_COLOR, ',
'    ''#C5CAE9''                   AS BORDER_COLOR,',
'    ''#1A237E''                   AS TEXT_COLOR,',
'    CASE WHEN PREV_LOADING_QTY = 0 AND CURR_LOADING_QTY > 0 THEN ''+100%'' WHEN PREV_LOADING_QTY = 0 AND CURR_LOADING_QTY = 0 THEN ''0%'' ELSE CASE WHEN CURR_LOADING_QTY > PREV_LOADING_QTY THEN ''+'' ELSE '''' END || TO_CHAR(ROUND(((CURR_LOADING_QTY - PREV_L'
||'OADING_QTY) / PREV_LOADING_QTY) * 100, 1), ''FM999,990.0'') || ''%''|| TREND_PERIOD END AS CARD_SUBTEXT,',
'    CASE WHEN CURR_LOADING_QTY > PREV_LOADING_QTY THEN ''fa-arrow-up'' WHEN CURR_LOADING_QTY < PREV_LOADING_QTY THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'    CASE WHEN CURR_LOADING_QTY > PREV_LOADING_QTY THEN ''#2E7D32'' WHEN CURR_LOADING_QTY < PREV_LOADING_QTY THEN ''#C00000'' ELSE ''#595959'' END AS TREND_COLOR,',
'    ''bar''                       AS CHART_TYPE,',
'    CS.FINAL_LABELS             AS CHART_LABELS,',
'    CS.DATA_LOADING_QTY         AS CHART_DATA,',
'	NULL                        AS CARD_LINK',
'    FROM BASE_METRICS BM ',
'    CROSS JOIN CHART_STRINGS CS',
'',
'    UNION ALL',
'',
'    -- CARD 8: Pending Quantity Out',
'    SELECT 8                    AS SEQ, ',
'    ''Pending Quantity Out''      AS CARD_TITLE, ',
'    TO_CHAR(CURR_PENDING_LOADING_QTY, ''999,999,990.999'') AS CARD_TEXT, ',
'    ''MT''                        AS CARD_POST_TEXT, ',
'    NULL                        AS CARD_PRE_TEXT, ',
'    ''fa-pause-circle-o''         AS CARD_ICON,',
'    ''#FDF2E9''                   AS BACKGROUND_COLOR, ',
'    ''#F5CBA7''                   AS BORDER_COLOR,',
'    ''#6E2C00''                   AS TEXT_COLOR,',
'    CASE WHEN PREV_PENDING_LOADING_QTY = 0 AND CURR_PENDING_LOADING_QTY > 0 THEN ''+100%'' WHEN PREV_PENDING_LOADING_QTY = 0 AND CURR_PENDING_LOADING_QTY = 0 THEN ''0%'' ELSE CASE WHEN CURR_PENDING_LOADING_QTY > PREV_PENDING_LOADING_QTY THEN ''+'' ELSE '''' '
||'END || TO_CHAR(ROUND(((CURR_PENDING_LOADING_QTY - PREV_PENDING_LOADING_QTY) / PREV_PENDING_LOADING_QTY) * 100, 1), ''FM999,990.0'') || ''%''|| TREND_PERIOD END AS CARD_SUBTEXT,',
'    CASE WHEN CURR_PENDING_LOADING_QTY > PREV_PENDING_LOADING_QTY THEN ''fa-arrow-up'' WHEN CURR_PENDING_LOADING_QTY < PREV_PENDING_LOADING_QTY THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'    CASE WHEN CURR_PENDING_LOADING_QTY > PREV_PENDING_LOADING_QTY THEN ''#C00000'' WHEN CURR_PENDING_LOADING_QTY < PREV_PENDING_LOADING_QTY THEN ''#2E7D32'' ELSE ''#595959'' END AS TREND_COLOR,',
'    ''bar''                       AS CHART_TYPE,',
'    CS.FINAL_LABELS             AS CHART_LABELS,',
'    CS.DATA_PENDING_LOADING_QTY AS CHART_DATA,',
'	NULL                        AS CARD_LINK',
'    FROM BASE_METRICS BM ',
'    CROSS JOIN CHART_STRINGS CS',
'',
'    UNION ALL',
'',
'    -- CARD 9: Cancelled Quantity',
'    SELECT 9                    AS SEQ, ',
'    ''Cancelled Quantity''        AS CARD_TITLE, ',
'    TO_CHAR(CURR_CANCELLED_QTY, ''999,999,990.999'') AS CARD_TEXT, ',
'    ''MT''                        AS CARD_POST_TEXT, ',
'    NULL                        AS CARD_PRE_TEXT, ',
'    ''fa-ban''                    AS CARD_ICON,',
'    ''#FCE4D6''                   AS BACKGROUND_COLOR, ',
'    ''#F4B084''                   AS BORDER_COLOR,',
'    ''#C65911''                   AS TEXT_COLOR,',
'    CASE WHEN PREV_CANCELLED_QTY = 0 AND CURR_CANCELLED_QTY > 0 THEN ''+100%'' WHEN PREV_CANCELLED_QTY = 0 AND CURR_CANCELLED_QTY = 0 THEN ''0%'' ELSE CASE WHEN CURR_CANCELLED_QTY > PREV_CANCELLED_QTY THEN ''+'' ELSE '''' END || TO_CHAR(ROUND(((CURR_CANCELLE'
||'D_QTY - PREV_CANCELLED_QTY) / PREV_CANCELLED_QTY) * 100, 1), ''FM999,990.0'') || ''%''|| TREND_PERIOD END AS CARD_SUBTEXT,',
'    CASE WHEN CURR_CANCELLED_QTY > PREV_CANCELLED_QTY THEN ''fa-arrow-up'' WHEN CURR_CANCELLED_QTY < PREV_CANCELLED_QTY THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'    CASE WHEN CURR_CANCELLED_QTY > PREV_CANCELLED_QTY THEN ''#C00000'' WHEN CURR_CANCELLED_QTY < PREV_CANCELLED_QTY THEN ''#2E7D32'' ELSE ''#595959'' END AS TREND_COLOR,',
'    ''bar''                       AS CHART_TYPE,',
'    CS.FINAL_LABELS             AS CHART_LABELS,',
'    CS.DATA_CANCELLED_QTY       AS CHART_DATA,',
'	NULL                        AS CARD_LINK',
'    FROM BASE_METRICS BM ',
'    CROSS JOIN CHART_STRINGS CS',
') ORDER BY SEQ;'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P7777_DATE_RANGE,P7777_PARTY,P7777_ITEM_CATEGORY,P7777_ITEM_NAME,P7777_ITEM_SPECIFICATION,P7777_SALES_EXECUTIVE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(56225064195302226)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'NO DATA FOUND'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.set_region_column_width(
 p_id=>wwv_flow_imp.id(95822590187428867)
,p_plug_column_width=>'style="margin-bottom: 10px;"'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57374635489327373)
,p_query_column_id=>7
,p_column_alias=>'BACKGROUND_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Background Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57374956809327373)
,p_query_column_id=>8
,p_column_alias=>'BORDER_COLOR'
,p_column_display_sequence=>60
,p_column_heading=>'Border Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57374305776327372)
,p_query_column_id=>6
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>40
,p_column_heading=>'Card Icon'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57376543934327376)
,p_query_column_id=>16
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>170
,p_column_heading=>'Card Link'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57372646091327370)
,p_query_column_id=>4
,p_column_alias=>'CARD_POST_TEXT'
,p_column_display_sequence=>110
,p_column_heading=>'Card Post Text'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57373054702327371)
,p_query_column_id=>5
,p_column_alias=>'CARD_PRE_TEXT'
,p_column_display_sequence=>120
,p_column_heading=>'Card Pre Text'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57370676005327367)
,p_query_column_id=>10
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>130
,p_column_heading=>'Card Subtext'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57373851455327372)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>20
,p_column_heading=>'Card Text'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57373497282327371)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57371849196327369)
,p_query_column_id=>15
,p_column_alias=>'CHART_DATA'
,p_column_display_sequence=>160
,p_column_heading=>'Chart Data'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57371498995327368)
,p_query_column_id=>14
,p_column_alias=>'CHART_LABELS'
,p_column_display_sequence=>150
,p_column_heading=>'Chart Labels'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57371061160327368)
,p_query_column_id=>13
,p_column_alias=>'CHART_TYPE'
,p_column_display_sequence=>140
,p_column_heading=>'Chart Type'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57372293826327370)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>100
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57375400269327374)
,p_query_column_id=>9
,p_column_alias=>'TEXT_COLOR'
,p_column_display_sequence=>70
,p_column_heading=>'Text Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57376203829327375)
,p_query_column_id=>12
,p_column_alias=>'TREND_COLOR'
,p_column_display_sequence=>90
,p_column_heading=>'Trend Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(57375793035327374)
,p_query_column_id=>11
,p_column_alias=>'TREND_ICON'
,p_column_display_sequence=>80
,p_column_heading=>'Trend Icon'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp.component_end;
end;
/
