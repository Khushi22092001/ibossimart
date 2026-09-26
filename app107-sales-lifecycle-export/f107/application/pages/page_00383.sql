prompt --application/pages/page_00383
begin
--   Manifest
--     PAGE: 00383
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>383
,p_name=>'Proforma Invoice'
,p_alias=>'PROFORMA-INVOICE'
,p_step_title=>'Proforma Invoice'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function formatDate(date) {',
'  var monthNames = [',
'    "JAN", "FEB", "MAR",',
'    "APR", "MAY", "JUN", "JUL",',
'    "AUG", "SEP", "OCT",',
'    "NOV", "DEC"',
'  ];',
'',
'  var day = date.getDate();',
'  var monthIndex = date.getMonth();',
'  var year = date.getFullYear();',
'',
'  return day + ''-'' + monthNames[monthIndex] + ''-'' + year;',
'}',
'',
'function generatePDF() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P175_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/CCInvoice11.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''&P_TNO='' + $(''#P383_TNO'').val() ',
'      ;',
'',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P383_BIREPORTURL'').val()',
'  var reportName =  ''PInvoice.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''"_paramsP_TNO":"'' + $(''#P383_TNO'').val() ',
'      ;',
'',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''&nQUser=''+ username +',
'              ''&nQPassword=''+ password +',
'              ''&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1",''+reportParams+''"}''',
'//alert(reportURL);',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'function calculatePInvoiceFields() {',
'    function getNum(itemId) {',
'        let val = apex.item(itemId).getValue();',
'        return (val && !isNaN(val)) ? parseFloat(val) : 0;',
'    }',
'',
'    // 1. Core Inputs',
'    let A = getNum("P383_SUMOFAMOUNT");',
'    let B = getNum("P383_SUMOFFOOTERAMOUNT");',
'    let C = A + B; ',
'    apex.item("P383_PINVOICEAMOUNTBEFOREROUND").setValue(C.toFixed(2));',
'',
'    // 2. (D) TDS Amount',
'    let tdsPercent = getNum("P383_LESS_TDS_PERCENT");',
'    let D = (A * tdsPercent) / 100;',
'    apex.item("P383_LESS_TDS_AMOUNT").setValue(D.toFixed(2));',
'',
'    // 3. (E) Amount After TDS',
'    let E = C - D;',
'    apex.item("P383_AMOUNT_AFTER_TDS").setValue(E.toFixed(2));',
'',
'    // 4. (F) Interest on LC',
'    let lcPercent = getNum("P383_INTREST_ON_LC_PERCENT");',
'    let lcDays = getNum("P383_INTREST_ON_LC_DAYS");',
'    let F = (E * (lcPercent / 100) / 365) * lcDays;',
'    apex.item("P383_INTREST_ON_LC_AMOUNT").setValue(F.toFixed(2));',
'',
'    // 5. (G) GST on Interest',
'    let G = (F * 18) / 100;',
'    apex.item("P383_GST_ON_INTREST").setValue(G.toFixed(2));',
'',
'    // =========================================================================',
unistr('    // \D83D\DCA1 AUTOMATED ROUNDING ARITHMETIC'),
'    // =========================================================================',
'    let unroundedNetPayable = F + G;',
'    let roundedNetPayable = Math.round(unroundedNetPayable); // Rounds to nearest whole integer',
'    let H = roundedNetPayable - unroundedNetPayable;        // Calculates variance (+ or -)',
'',
'    // Push calculations back to the visible APEX form fields',
'    apex.item("P383_ROUNDINGAMOUNT").setValue(H.toFixed(2));',
'    apex.item("P383_PINVOICEAMOUNT").setValue(roundedNetPayable.toFixed(2));',
'}',
'',
'',
'function calculateInvoiceFields() {',
unistr('    // \D83D\DCA1 \092F\0939 \0938\0941\0930\0915\094D\0937\093E \091A\0915\094D\0930 \0935\0948\0932\094D\092F\0942 \0915\094B \0939\0930 \0939\093E\0932 \092E\0947\0902 \0936\0941\0926\094D\0927 \0928\0902\092C\0930 \092E\0947\0902 \092C\0926\0932\0947\0917\093E (\092E\093E\0938\094D\0915 \0939\094B \092F\093E \0928 \0939\094B)'),
'    function getNum(itemId) {',
'        let item = apex.item(itemId);',
'        if (!item) return 0;',
'        ',
'        let val = item.getValue();',
'        ',
unistr('        // \092F\0926\093F \0935\0948\0932\094D\092F\0942 \0916\093E\0932\0940 \0939\0948 \092F\093E \0905\092A\0930\093F\092D\093E\0937\093F\0924 \0939\0948, \0924\094B DOM \090F\0932\093F\092E\0947\0902\091F \0938\0947 \0938\0940\0927\0947 \0909\0920\093E\090F\0901'),
'        if (!val || val.trim() === '''') {',
'            let el = document.getElementById(itemId);',
'            val = el ? el.value : ''0'';',
'        }',
'        ',
'        if (val) {',
unistr('            // \0938\0941\0930\0915\094D\0937\093E \0915\0947 \0932\093F\090F: \0905\0917\0930 \092B\093C\0949\0930\094D\092E\0947\091F\093F\0902\0917 \092E\093E\0938\094D\0915 \0915\0947 \0915\093E\0930\0923 \0915\092D\0940 \092D\0940 \0915\0949\092E\093E \0926\093F\0916\0947 \0924\094B \0909\0938\0947 \0939\091F\093E \0926\0947\0902'),
'            val = val.toString().replace(/,/g, '''').trim(); ',
'            let num = parseFloat(val);',
'            return (!isNaN(num)) ? num : 0;',
'        }',
'        ',
'        return 0;',
'    }',
'',
unistr('    // 1. \092E\0941\0916\094D\092F \0907\0928\092A\0941\091F\094D\0938 \092A\095D\0947\0902 (A \0914\0930 B)'),
'    let A = getNum("P383_SUMOFAMOUNT");',
'    let B = getNum("P383_SUMOFFOOTERAMOUNT");',
'    ',
unistr('    // \0921\0940\092C\0917\093F\0902\0917 \0915\0947 \0932\093F\090F \092C\094D\0930\093E\0909\091C\093C\0930 \0915\0902\0938\094B\0932 (F12) \092E\0947\0902 \091A\0947\0915 \0915\0930\0928\0947 \0939\0947\0924\0941'),
'    console.log("Calculated A: " + A + " | Calculated B: " + B);',
'',
'    let C = A + B; // Gross Amount',
'    ',
unistr('    // \0938\094D\0915\094D\0930\0940\0928 \092A\0930 \0935\0948\0932\094D\092F\0942 \0938\0947\091F \0915\0930\0947\0902 \0914\0930 \092A\094D\0930\094B\0917\094D\0930\093E\092E\0947\091F\093F\0915\0932\0940 \091A\0947\0902\091C \0915\094B \092B\094B\0930\094D\0938 \0915\0930\0947\0902'),
'    apex.item("P383_PINVOICEAMOUNTBEFOREROUND").setValue(C.toFixed(2), true);',
'',
unistr('    // 2. (D) TDS \0915\0940 \0917\0923\0928\093E'),
'    let tdsPercent = getNum("P383_LESS_TDS_PERCENT");',
'    let D = (A * tdsPercent) / 100;',
'    apex.item("P383_LESS_TDS_AMOUNT").setValue(D.toFixed(2), true);',
'',
'    // 3. (E) Amount After TDS',
'    let E = C - D;',
'    apex.item("P383_AMOUNT_AFTER_TDS").setValue(E.toFixed(2), true);',
'',
'    // 4. (F) Interest on LC',
'    let lcPercent = getNum("P383_INTREST_ON_LC_PERCENT");',
'    let lcDays = getNum("P383_INTREST_ON_LC_DAYS");',
'    let F = (E * (lcPercent / 100) / 365) * lcDays;',
'    apex.item("P383_INTREST_ON_LC_AMOUNT").setValue(F.toFixed(2), true);',
'',
'    // 5. (G) GST on Interest (18%)',
'    let G = (F * 18) / 100;',
'    apex.item("P383_GST_ON_INTREST").setValue(G.toFixed(2), true);',
'',
unistr('    // 6. \0938\094D\0935\091A\093E\0932\093F\0924 \0930\093E\0909\0902\0921\093F\0902\0917 \0917\0923\0928\093E'),
'    let unroundedNetPayable = E+ F + G;',
'    let roundedNetPayable = Math.round(unroundedNetPayable); ',
'    let H = roundedNetPayable - unroundedNetPayable;        ',
'',
unistr('    // \0938\094D\0915\094D\0930\0940\0928 \092A\0930 \092B\093E\0907\0928\0932 \0935\0948\0932\094D\092F\0942\095B \092D\0947\091C\0947\0902'),
'    apex.item("P383_ROUNDINGAMOUNT").setValue(H.toFixed(2), true);',
'    apex.item("P383_PINVOICEAMOUNT").setValue(roundedNetPayable.toFixed(2), true);',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// //Disable the Detail Region Add Row button if Transaction is in Readonly State',
'// var iro = $(''#P383_IS_READONLY'').val();',
'// if(iro == 1){',
'    ',
'//     // apex.region("Detail").widget().interactiveGrid("getActions").disable("selection-add-row");',
'',
'//     var ig$ = apex.region("Detail").widget();',
'//     var igActions = ig$.interactiveGrid("getActions");',
'//     // Disable Toolbar and Row Actions ',
'//     igActions.disable("selection-add-row"); // Toolbar button',
'//     igActions.disable("row-add-row");       // Row menu option',
'//     igActions.disable("row-duplicate");  ',
'',
'// }',
'',
'',
'// document.getElementById(''P383_LESS_TDS_PERCENT_LABEL'').parentElement.classList.remove(''col-1'');',
'// document.getElementById(''P383_LESS_TDS_PERCENT_LABEL'').parentElement.classList.add(''col-2'');',
'',
'// document.getElementById(''P383_INTREST_ON_LC_PERCENT_LABEL'').parentElement.classList.remove(''col-1'');',
'// document.getElementById(''P383_INTREST_ON_LC_PERCENT_LABEL'').parentElement.classList.add(''col-2'');'))
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.item-post-text{',
'    margin-left: 10px;',
'    font-size: smaller;',
'    font-style: italic;',
'    color: purple;',
'}',
'',
'.apex-item-display-only{',
'    text-align: left;',
'}',
'',
'#s_summary_region .apex-item-display-only{',
'    text-align: right;',
'}',
'',
'div.col.col-1:has(#P383_INTREST_ON_LC_DAYS_CONTAINER) {',
'  max-width: fit-content !important;',
'  flex-basis: 0;',
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
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28768213787866041)
,p_plug_name=>'Audit Info'
,p_static_id=>'audit-info'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28768340507866042)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'BEFORE_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30122386242939365)
,p_plug_name=>'Detail Footer'
,p_static_id=>'detail-footer'
,p_region_name=>'Detail_Footer'
,p_region_css_classes=>'js-dialog-size900x400'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       SNO,',
'       SN,',
'       --SERIALNO,',
'       FOOTERHEADCODE,',
'       LEGENDSCODE,',
'       FOOTERPERCENT,',
'       FOOTERVALUE',
'  from PINVOICEDETAILFOOTER',
'  Where TNO = :P383_TNO',
'    and SNO = :P383_DETAIL_SNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(30120412961939345)
,p_ajax_items_to_submit=>'P383_TNO,P383_DETAIL_SNO'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P383_TNO IS NOT NULL'
,p_plug_display_when_cond2=>'PLSQL'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30122736955939368)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30122600345939367)
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
 p_id=>wwv_flow_imp.id(30123173702939373)
,p_name=>'FOOTERHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Footerheadcode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_value_css_classes=>'is-readonly'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
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
 p_id=>wwv_flow_imp.id(30123420583939375)
,p_name=>'FOOTERPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footerpercent'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'is-readonly'
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
 p_id=>wwv_flow_imp.id(30123493989939376)
,p_name=>'FOOTERVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footervalue'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'is-readonly'
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
 p_id=>wwv_flow_imp.id(30123280818939374)
,p_name=>'LEGENDSCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LEGENDSCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Legendscode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_value_css_classes=>'is-readonly'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
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
 p_id=>wwv_flow_imp.id(30122988884939371)
,p_name=>'SN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30122910648939370)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30122827940939369)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_parent_column_id=>wwv_flow_imp.id(30120818638939349)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(30122523856939366)
,p_internal_uid=>4703280850632635
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    // Fetch the value of the page item to check if the form state is read-only',
'    var isReadOnly = $v("P383_IS_READONLY");',
'',
'    // Generate a local copy of the default Interactive Grid toolbar architecture',
'    var toolbarData = apex.jQuery.apex.interactiveGrid.copyDefaultToolbar();',
'',
'    // Freeze data modification and hide row-level actions if state is read-only',
'    if (isReadOnly === "1" || isReadOnly === 1) {',
'        options.editable = false; ',
'    }',
'',
'    // Modify the toolbar controls if the toolbar metadata object exists',
'    if (toolbarData) {',
'',
'        // Remove core system control groups from the layout grid if read-only is true',
'        if (isReadOnly === "1" || isReadOnly === 1) {',
'            toolbarData.toolbarRemove("search");        // Hides search text field and Go button',
'            toolbarData.toolbarRemove("actions1");      // Hides default Actions Menu dropdown button',
'            toolbarData.toolbarRemove("actions2");      // Hides native Edit and Save controls',
'            toolbarData.toolbarRemove("actions3");      // Hides the standard Add Row operation',
'            toolbarData.toolbarRemove("actions4");      // Hides the report Reset configuration button',
'        }',
'',
'        // Apply the updated, clean structural metadata array back to the initialization options',
'        options.toolbarData = toolbarData;',
'    } else {',
'        // Fallback option to hide the container shell safely if metadata allocation fails',
'        options.toolbar = false; ',
'    }',
'',
'    // Return the modified configuration options object back to the APEX framework engine',
'    return options;',
'}',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(30206436539938930)
,p_interactive_grid_id=>wwv_flow_imp.id(30122523856939366)
,p_static_id=>'47872'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(30206610844938930)
,p_report_id=>wwv_flow_imp.id(30206436539938930)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30207501535938932)
,p_view_id=>wwv_flow_imp.id(30206610844938930)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(30122736955939368)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30208345996938934)
,p_view_id=>wwv_flow_imp.id(30206610844938930)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(30122827940939369)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30209308935938935)
,p_view_id=>wwv_flow_imp.id(30206610844938930)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(30122910648939370)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30210150637938937)
,p_view_id=>wwv_flow_imp.id(30206610844938930)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(30122988884939371)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30211977420938939)
,p_view_id=>wwv_flow_imp.id(30206610844938930)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(30123173702939373)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30212928048938940)
,p_view_id=>wwv_flow_imp.id(30206610844938930)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(30123280818939374)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30213746323938941)
,p_view_id=>wwv_flow_imp.id(30206610844938930)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(30123420583939375)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30214718386938943)
,p_view_id=>wwv_flow_imp.id(30206610844938930)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(30123493989939376)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28319866296624359)
,p_plug_name=>'Detail Section'
,p_static_id=>'detail-section'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30120412961939345)
,p_plug_name=>'Details'
,p_static_id=>'details'
,p_title=>'Item Details'
,p_region_name=>'Detail'
,p_parent_plug_id=>wwv_flow_imp.id(28319866296624359)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid,',
'       TNO,',
'       SNO,',
'       ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       getitemspecificationname(itemcode,itemspecificationcode) as ItemSpecificationName,',
'       DESCRIPTION,',
'       PACKINGTYPECODE,',
'       PACKINGNOS,',
'       GetMeasuringUnitNameFromItem(ITEMCODE) AS MEASURINGUNITNAME1,',
'       QUANTITY1,',
'       RATE,',
'       AMOUNT,',
'       FOOTERAMOUNT,',
'       TOTALAMOUNT,',
'       REMARK,',
'       ''FD'' as FD',
'    --    QUANTITY2,',
'    --    TOITEMCODE,',
'    --    TOITEMSPECIFICATIONCODE,',
'    --    STORAGELOCATIONCODE,',
'    --    PINVOICEQUANTITY1,',
'    --    RECEIVEDQUANTITY1,',
'    --    RECEIVEDQUANTITY2,',
'    --    PURCHASEBILLQUANTITY1,',
'    --    PURCHASEBILLQUANTITY2,',
'    --    MATERIALINQUANTITY1,',
'    --    MATERIALINQUANTITY2,',
'    --    GATEPASSQUANTITY1,',
'    --    GATEPASSQUANTITY2,',
'    --    ACCEPTEDQUANTITY1,',
'    --    ACCEPTEDQUANTITY2,',
'    --    INSPECTEDQUANTITY1,',
'    --    INSPECTEDQUANTITY2,',
'    --    JOINACCEPTEDQUANTITY1,',
'    --    JOINACCEPTEDQUANTITY2,',
'    --    JOININSPECTEDQUANTITY1,',
'    --    JOININSPECTEDQUANTITY2,',
'',
'    --    BAGWEIGHT,',
'    --    RATEMEASURINGUNITCODE,',
'    --    TAXRULECODE,',
'    --    WITHOUTDISCOUNTRATE,',
'       ',
'    --    DISCOUNTPERCENT,',
'    --    DISCOUNTPERUNIT,',
'    --    TOLERANCE,',
'    --    LOWERTOLERANCEPERCENT,',
'    --    HIGHERTOLERANCEPERCENT,',
'    --    DOCUMENTSTATUSCODE,',
'    --    DESPATCHCATEGORYCODE,',
'    --    WEIGHMENTTNO,',
'       ',
'From PINVOICEDETAIL',
'Where TNO = :P383_TNO '))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P383_TNO'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P383_TNO IS NOT NULL'
,p_plug_display_when_cond2=>'PLSQL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Item Details'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30122042764939361)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'is-readonly'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_item_css_classes=>'is-readOnly'
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
 p_id=>wwv_flow_imp.id(30120704480939348)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30120551111939347)
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
 p_id=>wwv_flow_imp.id(30121322041939354)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Description'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_imp.id(30121896527939360)
,p_name=>'FD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'FD'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:openModal(''Detail_Footer'')'
,p_link_text=>'&FD.'
,p_link_attributes=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch"'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="javascript:openModal(''Detail_Footer'')">',
' <span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">FD</span></a>'))
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30122065525939362)
,p_name=>'FOOTERAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Amount'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'is-readonly'
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
 p_id=>wwv_flow_imp.id(30120969699939351)
,p_name=>'ITEMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Item Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
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
 p_id=>wwv_flow_imp.id(30121048269939352)
,p_name=>'ITEMSPECIFICATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'ITEMSPECIFICATIONNAME:ITEMSPECIFICATIONNAME,ITEMCODE:ITEMCODE,MEASURINGUNITNAME1:MEASURINGUNITNAME1,ITEMCODE:P383_DETAILITEMCODE,ITEMSPECIFICATIONCODE:P383_DETAILITEMSPECIFICATIONCODE',
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '300',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '800')).to_clob
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(29804238574670402)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'TNO'
,p_ajax_items_to_submit=>'P383_SALESORDERTNO'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30121175686939353)
,p_name=>'ITEMSPECIFICATIONNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Item Specification Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(30121606280939357)
,p_name=>'MEASURINGUNITNAME1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MEASURINGUNITNAME1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(30121504005939356)
,p_name=>'PACKINGNOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PACKINGNOS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Packing Nos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_imp.id(30121360797939355)
,p_name=>'PACKINGTYPECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PACKINGTYPECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Packing Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'SELECT PACKINGTYPENAME,PACKINGTYPECODE FROM PACKINGTYPE ORDER BY 1'
,p_lov_display_extra=>true
,p_lov_display_null=>true
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30121686011939358)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_imp.id(30121769984939359)
,p_name=>'RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_imp.id(30122317757939364)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
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
 p_id=>wwv_flow_imp.id(28318851496624348)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28318683821624347)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SNO'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30120818638939349)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_default_type=>'ITEM'
,p_default_expression=>'P383_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30122157879939363)
,p_name=>'TOTALAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTALAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Amount'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'is-readonly'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(30120492895939346)
,p_internal_uid=>4701249889632615
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    // Fetch the value of the page item to check if the form state is read-only',
'    var isReadOnly = $v("P383_IS_READONLY");',
'',
'    // Generate a local copy of the default Interactive Grid toolbar architecture',
'    var toolbarData = apex.jQuery.apex.interactiveGrid.copyDefaultToolbar();',
'',
'    // Freeze data modification and hide row-level actions if state is read-only',
'    if (isReadOnly === "1" || isReadOnly === 1) {',
'        options.editable = false; ',
'    }',
'',
'    // Modify the toolbar controls if the toolbar metadata object exists',
'    if (toolbarData) {',
'',
'        // Remove core system control groups from the layout grid if read-only is true',
'        if (isReadOnly === "1" || isReadOnly === 1) {',
'            toolbarData.toolbarRemove("search");        // Hides search text field and Go button',
'            toolbarData.toolbarRemove("actions1");      // Hides default Actions Menu dropdown button',
'            toolbarData.toolbarRemove("actions2");      // Hides native Edit and Save controls',
'            toolbarData.toolbarRemove("actions3");      // Hides the standard Add Row operation',
'            toolbarData.toolbarRemove("actions4");      // Hides the report Reset configuration button',
'        }',
'',
'        // Apply the updated, clean structural metadata array back to the initialization options',
'        options.toolbarData = toolbarData;',
'    } else {',
'        // Fallback option to hide the container shell safely if metadata allocation fails',
'        options.toolbar = false; ',
'    }',
'',
'    // Return the modified configuration options object back to the APEX framework engine',
'    return options;',
'}',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(30188539449932362)
,p_interactive_grid_id=>wwv_flow_imp.id(30120492895939346)
,p_static_id=>'47693'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(30188647983932363)
,p_report_id=>wwv_flow_imp.id(30188539449932362)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(28364997947407119)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(28318683821624347)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>79
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(28396034340426534)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(28318851496624348)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30189580329932367)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(30120704480939348)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30190485737932368)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(30120818638939349)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>43
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30192251210932370)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(30120969699939351)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30193223392932371)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(30121048269939352)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30194114241932373)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(30121175686939353)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>194
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30194998454932374)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(30121322041939354)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30195928353932375)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(30121360797939355)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30196760305932376)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(30121504005939356)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30197728183932377)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(30121606280939357)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>55
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30198621423932378)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(30121686011939358)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30199511167932379)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(30121769984939359)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30200371153932380)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(30121896527939360)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>61
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30201331069932381)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(30122042764939361)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30202191297932382)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(30122065525939362)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30203085403932383)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(30122157879939363)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30203990260932384)
,p_view_id=>wwv_flow_imp.id(30188647983932363)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(30122317757939364)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28767661862866036)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_parent_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P383_IS_READONLY'
,p_plug_read_only_when2=>'1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28767989374866039)
,p_plug_name=>'GST Nature'
,p_static_id=>'gst-nature'
,p_parent_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P383_IS_READONLY'
,p_plug_read_only_when2=>'1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28767818943866037)
,p_plug_name=>'Party and Reference Details'
,p_static_id=>'party-and-reference-details'
,p_parent_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P383_IS_READONLY'
,p_plug_read_only_when2=>'1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30235007201989971)
,p_plug_name=>'PInvoice Footer'
,p_static_id=>'pinvoice-footer'
,p_title=>'Invoice Tax Detail'
,p_region_name=>'S_PInvoice_Footer'
,p_parent_plug_id=>wwv_flow_imp.id(28319866296624359)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       SNO,',
'       SERIALNO,',
'       FOOTERHEADCODE,',
'       LEGENDSCODE,',
'       FOOTERPERCENT,',
'       FOOTERVALUE',
'  from PINVOICEFOOTER',
'  Where TNO = :P383_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P383_TNO'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P383_TNO IS NOT NULL'
,p_plug_display_when_cond2=>'PLSQL'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P383_IS_READONLY'
,p_plug_read_only_when2=>'1'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Invoice Tax Detail'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30235747626989979)
,p_name=>'FOOTERHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Footer Head'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
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
 p_id=>wwv_flow_imp.id(30236039197989981)
,p_name=>'FOOTERPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Percent %'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(30801998917109632)
,p_name=>'FOOTERVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(30235891387989980)
,p_name=>'LEGENDSCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LEGENDSCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Legends '
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
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
 p_id=>wwv_flow_imp.id(30235732595989978)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Serialno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
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
 p_id=>wwv_flow_imp.id(30235529357989976)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30235415752989975)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(30235063237989972)
,p_internal_uid=>4815820231683241
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    // Fetch the value of the page item to check if the form state is read-only',
'    var isReadOnly = $v("P383_IS_READONLY");',
'',
'    // Generate a local copy of the default Interactive Grid toolbar architecture',
'    var toolbarData = apex.jQuery.apex.interactiveGrid.copyDefaultToolbar();',
'',
'    // Freeze data modification and hide row-level actions if state is read-only',
'    if (isReadOnly === "1" || isReadOnly === 1) {',
'        options.editable = false; ',
'    }',
'',
'    // Modify the toolbar controls if the toolbar metadata object exists',
'    if (toolbarData) {',
'',
'        // Remove core system control groups from the layout grid if read-only is true',
'        if (isReadOnly === "1" || isReadOnly === 1) {',
'            toolbarData.toolbarRemove("search");        // Hides search text field and Go button',
'            toolbarData.toolbarRemove("actions1");      // Hides default Actions Menu dropdown button',
'            toolbarData.toolbarRemove("actions2");      // Hides native Edit and Save controls',
'            toolbarData.toolbarRemove("actions3");      // Hides the standard Add Row operation',
'            toolbarData.toolbarRemove("actions4");      // Hides the report Reset configuration button',
'        }',
'',
'        // Apply the updated, clean structural metadata array back to the initialization options',
'        options.toolbarData = toolbarData;',
'    } else {',
'        // Fallback option to hide the container shell safely if metadata allocation fails',
'        options.toolbar = false; ',
'    }',
'',
'    // Return the modified configuration options object back to the APEX framework engine',
'    return options;',
'}',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(30807552806115010)
,p_interactive_grid_id=>wwv_flow_imp.id(30235063237989972)
,p_static_id=>'53884'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(30807795300115010)
,p_report_id=>wwv_flow_imp.id(30807552806115010)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30809621688115016)
,p_view_id=>wwv_flow_imp.id(30807795300115010)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(30235415752989975)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30810510159115017)
,p_view_id=>wwv_flow_imp.id(30807795300115010)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(30235529357989976)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30811422881115018)
,p_view_id=>wwv_flow_imp.id(30807795300115010)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(30235732595989978)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30812319091115019)
,p_view_id=>wwv_flow_imp.id(30807795300115010)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(30235747626989979)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30813135251115020)
,p_view_id=>wwv_flow_imp.id(30807795300115010)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(30235891387989980)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30813990727115021)
,p_view_id=>wwv_flow_imp.id(30807795300115010)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(30236039197989981)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30814876926115022)
,p_view_id=>wwv_flow_imp.id(30807795300115010)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(30801998917109632)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29246197241799012)
,p_plug_name=>'Proforma Invoice'
,p_static_id=>'proforma-invoice'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       LOCATIONCODE,',
'       DOCTYPECODE,',
'       PINVOICENO,',
'       PINVOICEDATE,',
'       COMPANYCODE,',
'       FINANCIALYEARCODE,',
'       DEPARTMENTCODE,',
'       EMPLOYEECODE,',
'       PARTYCODE,',
'       AGENTCODE,',
'       CONSIGNEECODE,',
'       TRANSPORTERCODE,',
'       VEHICLETYPECODE,',
'       FREIGHTTYPECODE,',
'       DESPATCHCATEGORYCODE,',
'       OTHERCODE,',
'       TRANSACTIONTYPECODE,',
'       NATUREOFSUPPLYCODE,',
'       FREIGHTUNITCODE,',
'       CURRENCYUNITCODE,',
'       DESPATCHTNO,',
'       DESPATCHADVICETNO,',
'       SALESORDERTNO,',
'       PORECEIPTTNO,',
'       PURCHASEORDERTNO,',
'       OUTWARDRAKETNO,',
'       PINVOICETNO,',
'       FREIGHTCONTRACTTNO,',
'       INTERUNITTRANSFERTNO,',
'       LOADINGADVICETNO,',
'       MARINEINSURANCETNO,',
'       SOURCELOCATIONTNO,',
'       DESTINATIONLOCATIONTNO,',
'       DELIVERYDATE,',
'       LORRYDATE,',
'       REMOVALDATE,',
'       PREPARINGDATE,',
'       CURRENCYVALUE,',
'       SUMOFAMOUNT,',
'       SUMOFFOOTERAMOUNT,',
'       PINVOICEAMOUNT,',
'       FREIGHTADVANCE,',
'       FREIGHTRATE,',
'       FREIGHTPOSTEDTOSTOCK,',
'       MARINEINSURANCEAMOUNT,',
'       ADJUSTEDADVANCEAMOUNT,',
'       PAIDAMOUNT,',
'       DEDUCTEDAMOUNT,',
'       ROUNDINGAMOUNT,',
'       TOTALADVANCE,',
'       AMTAGAINSTPBG,',
'       PERCENTAGAINSTPBG,',
'       TOTALADVANCEPERCENT,',
'       ADVANCEPERCENT,',
'       ADVANCE,',
'       RUNNINGKM,',
'       DISTANCE,',
'       GROSSWEIGHT,',
'       TAREWEIGHT,',
'       NETWEIGHT,',
'       CHALANORINVOICE,',
'       VEHICLENO,',
'       DRIVERNAME,',
'       UNIONNAME,',
'       LORRYNO,',
'       TAXVEHICLENO,',
'       OLDVEHICLENO,',
'       ISDEPBBILL,',
'       ITEMWISEFOOTER,',
'       ISSITEPINVOICE,',
'       CREATELR,',
'       ADDBUSINESSPLACE,',
'       ADDBUSINESSPLACEBUYER,',
'       GSTINADVANCE,',
'       SUBJECTTEXT,',
'       REFERENCETEXT,',
'       TITLETEXT,',
'       REMARK,',
'       LETTERTEXT,',
'       CREATOR,',
'       CREATIONTIME,',
'       MODIFIEDBY,',
'       MODIFIEDTIME,',
'       PINVOICEAMOUNTBEFOREROUND, ',
'       STATUS,',
'       LESSTDSPERCENT,',
'       LESSTDSAMOUNT,',
'       AMOUNTAFTERTDS,',
'       INTRESTONLCPERCENT,',
'       INTRESTONLCDAYS,',
'       INTRESTONLCAMOUNT,',
'       GSTONINTREST',
'  from PINVOICE'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28768073752866040)
,p_plug_name=>'Summary'
,p_static_id=>'summary'
,p_region_name=>'s_summary_region'
,p_parent_plug_id=>wwv_flow_imp.id(30120412961939345)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P383_TNO IS NOT NULL'
,p_plug_display_when_cond2=>'PLSQL'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P383_IS_READONLY'
,p_plug_read_only_when2=>'1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30802104920109633)
,p_plug_name=>'Terms and Condition'
,p_static_id=>'terms-and-condition'
,p_parent_plug_id=>wwv_flow_imp.id(28319866296624359)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       TERMSANDCONDITIONHEADCODE,',
'       TERMSANDCONDITION',
'  from PINVOICETAC',
'  Where TNO = :P383_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(30120412961939345)
,p_ajax_items_to_submit=>'P383_TNO'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P383_TNO IS NOT NULL'
,p_plug_display_when_cond2=>'PLSQL'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P383_IS_READONLY'
,p_plug_read_only_when2=>'1'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30803643764109649)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30803838021109650)
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
 p_id=>wwv_flow_imp.id(30803515737109647)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30802590001109638)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30803431605109646)
,p_name=>'TERMSANDCONDITION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TERMSANDCONDITION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Terms And Condition'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.termsandcondition a , a.termsandcondition b from TERMSANDCONDITIONHEADDETAIL a , TERMSANDCONDITIONHEAD b',
'where a.tno = b.tno',
'and b.tno = :TERMSANDCONDITIONHEADCODE'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'TERMSANDCONDITIONHEADCODE'
,p_ajax_items_to_submit=>'TERMSANDCONDITIONHEADCODE'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30803270303109645)
,p_name=>'TERMSANDCONDITIONHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TERMSANDCONDITIONHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Terms And Condition Head'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select TERMSANDCONDITIONHEADNAME , tno from TERMSANDCONDITIONHEAD'
,p_lov_display_extra=>true
,p_lov_display_null=>true
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(30802449329109637)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_parent_column_id=>wwv_flow_imp.id(30120818638939349)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(30802187285109634)
,p_internal_uid=>5382944278802903
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    // Fetch the value of the page item to check if the form state is read-only',
'    var isReadOnly = $v("P383_IS_READONLY");',
'',
'    // Generate a local copy of the default Interactive Grid toolbar architecture',
'    var toolbarData = apex.jQuery.apex.interactiveGrid.copyDefaultToolbar();',
'',
'    // Freeze data modification and hide row-level actions if state is read-only',
'    if (isReadOnly === "1" || isReadOnly === 1) {',
'        options.editable = false; ',
'    }',
'',
'    // Modify the toolbar controls if the toolbar metadata object exists',
'    if (toolbarData) {',
'',
'        // Remove core system control groups from the layout grid if read-only is true',
'        if (isReadOnly === "1" || isReadOnly === 1) {',
'            toolbarData.toolbarRemove("search");        // Hides search text field and Go button',
'            toolbarData.toolbarRemove("actions1");      // Hides default Actions Menu dropdown button',
'            toolbarData.toolbarRemove("actions2");      // Hides native Edit and Save controls',
'            toolbarData.toolbarRemove("actions3");      // Hides the standard Add Row operation',
'            toolbarData.toolbarRemove("actions4");      // Hides the report Reset configuration button',
'        }',
'',
'        // Apply the updated, clean structural metadata array back to the initialization options',
'        options.toolbarData = toolbarData;',
'    } else {',
'        // Fallback option to hide the container shell safely if metadata allocation fails',
'        options.toolbar = false; ',
'    }',
'',
'    // Return the modified configuration options object back to the APEX framework engine',
'    return options;',
'}',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(30823026758202934)
,p_interactive_grid_id=>wwv_flow_imp.id(30802187285109634)
,p_static_id=>'54038'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(30823242247202934)
,p_report_id=>wwv_flow_imp.id(30823026758202934)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30825036312202937)
,p_view_id=>wwv_flow_imp.id(30823242247202934)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(30802449329109637)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30825847123202938)
,p_view_id=>wwv_flow_imp.id(30823242247202934)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(30802590001109638)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30826842192202939)
,p_view_id=>wwv_flow_imp.id(30823242247202934)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(30803270303109645)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>455
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30827736363202940)
,p_view_id=>wwv_flow_imp.id(30823242247202934)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(30803431605109646)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30828639693202941)
,p_view_id=>wwv_flow_imp.id(30823242247202934)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(30803515737109647)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30833909888249010)
,p_view_id=>wwv_flow_imp.id(30823242247202934)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(30803643764109649)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(28768370614866043)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(28768340507866042)
,p_button_name=>'ADD_NEW'
,p_static_id=>'add-new'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pillEnd'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.:P&APP_PAGE_ID._FORMSTATUS:NEWRECORD'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P383_FORMSTATUS = ''EDITRECORD'' ',
'AND CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,383,''INSERT'') = 1 ',
'AND :P383_TNO IS NOT NULL'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(28319419260624354)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(30122386242939365)
,p_button_name=>'BACK_TO_DETAIL'
,p_static_id=>'back-to-detail'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(29306092801799041)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(28768340507866042)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:382:&APP_SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(29307458295799042)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(28768340507866042)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P383_FORMSTATUS = ''NEWRECORD'' ',
'-- AND CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,383,''INSERT'') = 1 ',
'AND :P383_TNO IS NULL'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(29306714642799042)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(28768340507866042)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P383_FORMSTATUS = ''EDITRECORD'' ',
'AND :P383_TNO IS NOT NULL'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(30124014091939381)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(30120412961939345)
,p_button_name=>'GET_DETAIL_ITEM'
,p_static_id=>'get-detail-item'
,p_button_static_id=>'S_GET_DETAIL_ITEM'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get Item'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(28768586302866045)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(28768340507866042)
,p_button_name=>'PRINT'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P383_FORMSTATUS = ''EDITRECORD'' AND :P383_TNO IS NOT NULL',
'--AND CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,383,''PRINT'') = 1'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(29307073890799042)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(28768340507866042)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P383_FORMSTATUS = ''EDITRECORD'' ',
'--AND CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,383,''UPDATE'') = 1 ',
'AND :P383_TNO IS NOT NULL'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(28768517460866044)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(28768340507866042)
,p_button_name=>'STATUS'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P383_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>':P383_FORMSTATUS = ''EDITRECORD'' AND :P383_TNO IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(29307785249799042)
,p_branch_name=>'Go To Page 382 after Delete'
,p_branch_action=>'f?p=&APP_ID.:382:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(29306714642799042)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(30120306577939344)
,p_branch_name=>'Stay on Page'
,p_branch_action=>'f?p=&APP_ID.:383:&SESSION.::&DEBUG.::P383_TNO,P383_FORMSTATUS:&P383_TNO.,EDITRECORD&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'CREATE,SAVE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29275274355799030)
,p_name=>'P383_ADDBUSINESSPLACE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(28767818943866037)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Add. Business Place'
,p_placeholder=>'Additional Business Place'
,p_source=>'ADDBUSINESSPLACE'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name||'', ''||address1||'', ''||address2||'', ''||address3 as address , CUSTOMERADDRESSCODE from customeraddress',
'where tno in (select tno from party where partycode =  :P383_CONSIGNEECODE)'))
,p_lov_cascade_parent_items=>'P383_CONSIGNEECODE'
,p_ajax_items_to_submit=>'P383_CONSIGNEECODE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29275697294799030)
,p_name=>'P383_ADDBUSINESSPLACEBUYER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(28767818943866037)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Buyer Address'
,p_placeholder=>'Buyer Address'
,p_source=>'ADDBUSINESSPLACEBUYER'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name||'', ''||address1||'', ''||address2||'', ''||address3 as address , CUSTOMERADDRESSCODE from customeraddress',
'where tno in (select tno from party where partycode =  :P383_PARTYCODE)'))
,p_lov_cascade_parent_items=>'P383_PARTYCODE'
,p_ajax_items_to_submit=>'P383_PARTYCODE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29264860379799026)
,p_name=>'P383_ADJUSTEDADVANCEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'ADJUSTEDADVANCEAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29268500261799028)
,p_name=>'P383_ADVANCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'ADVANCE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29268108985799028)
,p_name=>'P383_ADVANCEPERCENT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'ADVANCEPERCENT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29250530602799021)
,p_name=>'P383_AGENTCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(28767818943866037)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Agent'
,p_placeholder=>'Agent'
,p_source=>'AGENTCODE'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PARTYNAME , PARTYCODE from party',
'where PARTYTYPECODE=''AGENT'''))
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(28769938999866058)
,p_name=>'P383_ALLOWEDBACK'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P383_TNO), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(28769983315866059)
,p_name=>'P383_ALLOWEDFORWARD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P383_TNO), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31015027532266579)
,p_name=>'P383_AMOUNT_AFTER_TDS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(28768073752866040)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Amount After TDS'
,p_placeholder=>'Amount After TDS'
,p_source=>'AMOUNTAFTERTDS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true  style=" width: 158px; "'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29266912897799027)
,p_name=>'P383_AMTAGAINSTPBG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'AMTAGAINSTPBG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27384851638484452)
,p_name=>'P383_BIREPORTURL'
,p_item_sequence=>860
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29270861660799029)
,p_name=>'P383_CHALANORINVOICE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'CHALANORINVOICE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29248470766799020)
,p_name=>'P383_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_default=>':GLOBAL_COMPANYCODE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29250921208799021)
,p_name=>'P383_CONSIGNEECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(28767818943866037)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Consignee'
,p_placeholder=>'Consignee'
,p_source=>'CONSIGNEECODE'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'partyname , ',
'partycode from party    ',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'and :P383_DOCTYPECODE = ''PURCHASERETURN''',
'and partytypecode = ''SUPPLIER''',
'',
'union all    ',
'select partyname  , partycode from party    ',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'and :P383_DOCTYPECODE != ''PURCHASERETURN''',
'and partytypecode = ''CUSTOMER''',
'and :P383_FORMSTATUS = ''NEWRECORD''',
'',
'union all    ',
'select partyname , partycode from party    ',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'and :P383_DOCTYPECODE != ''PURCHASERETURN''',
'and partytypecode = ''CUSTOMER''',
'and :P383_FORMSTATUS = ''EDITRECORD''',
'and partycode = :P383_CONSIGNEECODE',
'',
'--||'' ''||getcityname(officecitycode) '))
,p_lov_cascade_parent_items=>'P383_DOCTYPECODE'
,p_ajax_items_to_submit=>'P383_DOCTYPECODE,P383_FORMSTATUS,P383_CONSIGNEECODE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>30
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29274854798799030)
,p_name=>'P383_CREATELR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'CREATELR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29278857733799032)
,p_name=>'P383_CREATIONTIME'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>830
,p_item_plug_id=>wwv_flow_imp.id(28768213787866041)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Creation Time'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29278456654799032)
,p_name=>'P383_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>820
,p_item_plug_id=>wwv_flow_imp.id(28768213787866041)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Created By'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29254526677799022)
,p_name=>'P383_CURRENCYUNITCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(28767989374866039)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_default=>'1'
,p_prompt=>'Currency Unit'
,p_placeholder=>'Currency Code'
,p_source=>'CURRENCYUNITCODE'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'CURRENCY UNIT'
,p_cSize=>32
,p_cMaxlength=>30
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29261654956799025)
,p_name=>'P383_CURRENCYVALUE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(28767989374866039)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Currency Value'
,p_placeholder=>'Currency Value'
,p_source=>'CURRENCYVALUE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29265729393799027)
,p_name=>'P383_DEDUCTEDAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'DEDUCTEDAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29260134317799024)
,p_name=>'P383_DELIVERYDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'DELIVERYDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29249324435799020)
,p_name=>'P383_DEPARTMENTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'DEPARTMENTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29255325461799022)
,p_name=>'P383_DESPATCHADVICETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'DESPATCHADVICETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29252499434799021)
,p_name=>'P383_DESPATCHCATEGORYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'DESPATCHCATEGORYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29254904956799022)
,p_name=>'P383_DESPATCHTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'DESPATCHTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29259733564799024)
,p_name=>'P383_DESTINATIONLOCATIONTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'DESTINATIONLOCATIONTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30233189988989953)
,p_name=>'P383_DETAIL_AMOUNT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(30120412961939345)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P383_DETAIL_AMOUNT'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'style="display:none;"'
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30233315060989954)
,p_name=>'P383_DETAIL_HSNCODE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(30120412961939345)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P383_DETAIL_HSNCODE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'style="display:none;"'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29705900933521272)
,p_name=>'P383_DETAIL_ITEMCODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(30120412961939345)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P383_DETAILITEMCODE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'style="display:none;"'
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29705944508521273)
,p_name=>'P383_DETAIL_ITEMSPECIFICATIONCODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(30120412961939345)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P383_DETAILITEMSPECIFICATIONCODE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'style="display:none;"'
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30232856724989950)
,p_name=>'P383_DETAIL_QUANTITY1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(30120412961939345)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P383_DETAIL_QUANTITY1'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'style="display:none;"'
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29862373391325772)
,p_name=>'P383_DETAIL_SNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(30120412961939345)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P383_DETAIL_SNO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'style="display:none;"'
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29269294091799028)
,p_name=>'P383_DISTANCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'DISTANCE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29247385807799018)
,p_name=>'P383_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(28767661862866036)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.DocTypeName,',
'a.DocTypeCode',
'from DocType a, ModuleDocTypeDetail b , ModuleDocType c',
'where a.DocTypeCode = b.DocTypeCode',
'and b.tno = c.tno',
'and c.companycode = :global_companycode',
'and c.ModuleCode = (Select ModuleCode from Module Where EntryPageNo = :APP_PAGE_ID)--GETMODULECODEFROMPAGE(:APP_PAGE_ID)',
'and (',
'     not exists(',
'         select ',
'             aa.TNo',
'         from ModulePrivilege aa, ModulePrivilegeDocType bb, BossUser cc',
'         where aa.tno = bb.tno',
'             and aa.BossUserCode = cc.BossUserCode',
'             and cc.LoginName = :GLOBAL_LOGINNAME',
'             and aa.ModuleCode = (Select ModuleCode from Module Where EntryPageNo = :APP_PAGE_ID)--GETMODULECODEFROMPAGE(:APP_PAGE_ID)',
'             and aa.CompanyCode = :global_CompanyCode',
'     )',
'     or',
'     exists(',
'         select ',
'             aa.TNo',
'         from ModulePrivilege aa, ModulePrivilegeDocType bb, BossUser cc',
'         where aa.tno = bb.tno',
'             and aa.BossUserCode = cc.BossUserCode',
'             and cc.LoginName = :GLOBAL_LOGINNAME',
'             and aa.ModuleCode = (Select ModuleCode from Module Where EntryPageNo = :APP_PAGE_ID)--GETMODULECODEFROMPAGE(:APP_PAGE_ID)',
'             and bb.DocTypeCode = a.DocTypeCode',
'             and aa.CompanyCode = :global_CompanyCode',
'     )',
')',
'order by a.DocTypeName',
'Fetch first row only'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Doc Type'
,p_placeholder=>'Doc Type'
,p_source=>'DOCTYPECODE'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'DOCTYPE1'
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29271702052799029)
,p_name=>'P383_DRIVERNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'DRIVERNAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29249643335799020)
,p_name=>'P383_EMPLOYEECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(28767661862866036)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Employee'
,p_placeholder=>'Employee'
,p_source=>'EMPLOYEECODE'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'EMPLOYEE'
,p_cSize=>32
,p_cMaxlength=>30
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29248881388799020)
,p_name=>'P383_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_default=>':GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(28768813304866047)
,p_name=>'P383_FORMSTATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	begin',
'	If :P383_TNO is null then',
'		return(''NEWRECORD'');',
'	else',
'		return(''EDITRECORD'');',
'	End if;',
'	end ;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29263248226799026)
,p_name=>'P383_FREIGHTADVANCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'FREIGHTADVANCE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29257679978799023)
,p_name=>'P383_FREIGHTCONTRACTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'FREIGHTCONTRACTTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29264044944799026)
,p_name=>'P383_FREIGHTPOSTEDTOSTOCK'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'FREIGHTPOSTEDTOSTOCK'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29263717193799026)
,p_name=>'P383_FREIGHTRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'FREIGHTRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29252076736799021)
,p_name=>'P383_FREIGHTTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'FREIGHTTYPECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29254096495799022)
,p_name=>'P383_FREIGHTUNITCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'FREIGHTUNITCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29269704117799028)
,p_name=>'P383_GROSSWEIGHT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'GROSSWEIGHT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29276045420799031)
,p_name=>'P383_GSTINADVANCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'GSTINADVANCE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31015053153266580)
,p_name=>'P383_GST_ON_INTREST'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(28768073752866040)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'GST on Interest'
,p_placeholder=>'GST on Interest'
,p_source=>'GSTONINTREST'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true  style=" width: 158px; "'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29258111216799023)
,p_name=>'P383_INTERUNITTRANSFERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'INTERUNITTRANSFERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31014927027266578)
,p_name=>'P383_INTREST_ON_LC_AMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(28768073752866040)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Calculated LC Amount'
,p_placeholder=>'LC Amount'
,p_source=>'INTRESTONLCAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true  style=" width: 158px; "'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31014744330266577)
,p_name=>'P383_INTREST_ON_LC_DAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(28768073752866040)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'LC Days'
,p_placeholder=>'Days'
,p_source=>'INTRESTONLCDAYS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style=" width: 158px; "'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31014725074266576)
,p_name=>'P383_INTREST_ON_LC_PERCENT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(28768073752866040)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Intrest On LC'
,p_placeholder=>'%'
,p_source=>'INTRESTONLCPERCENT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_tag_attributes=>'style=" width: 158px; "'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29273676833799030)
,p_name=>'P383_ISDEPBBILL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'ISDEPBBILL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29274541641799030)
,p_name=>'P383_ISSITEPINVOICE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'ISSITEPINVOICE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30805089251109663)
,p_name=>'P383_IS_READONLY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29274097179799030)
,p_name=>'P383_ITEMWISEFOOTER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'ITEMWISEFOOTER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31014601915266575)
,p_name=>'P383_LESS_TDS_AMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(28768073752866040)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Less TDS Amount'
,p_placeholder=>'TDS Amount'
,p_source=>'LESSTDSAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true  style=" width: 158px; "'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31014504477266574)
,p_name=>'P383_LESS_TDS_PERCENT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(28768073752866040)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Less TDS % on Purchase'
,p_placeholder=>'%'
,p_source=>'LESSTDSPERCENT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_tag_attributes=>'style=" width: 158px; "'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29278139400799031)
,p_name=>'P383_LETTERTEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'LETTERTEXT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29258470953799024)
,p_name=>'P383_LOADINGADVICETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'LOADINGADVICETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29246953659799018)
,p_name=>'P383_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(28767661862866036)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'	a.LocationCode',
'From Location a, ModuleLocationDetail b , ModuleLocation c',
'Where a.LocationCode = b.LocationCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = (Select ModuleCode from Module Where EntryPageNo = :APP_PAGE_ID)--GETMODULECODEFROMPAGE(:APP_PAGE_ID)',
'	and c.CompanyCode = :GLOBAL_COMPANYCODE',
'	and (',
'		not exists(',
'		Select ',
'			aa.TNo',
'		From ModulePrivilege aa, ModulePrivilegeLocation bb, BossUser cc',
'		Where aa.tno = bb.tno',
'			and aa.BossUserCode = cc.BossUserCode',
'			and cc.LoginName = :GLOBAL_LOGINNAME',
'			and aa.ModuleCode = (Select ModuleCode from Module Where EntryPageNo = :APP_PAGE_ID)--GETMODULECODEFROMPAGE(:APP_PAGE_ID)',
'			and aa.CompanyCode = :GLOBAL_COMPANYCODE',
'		)',
'		or',
'		exists(',
'		Select ',
'			aa.TNo',
'		From ModulePrivilege aa, ModulePrivilegeLocation bb, BossUser cc',
'		Where aa.tno = bb.tno',
'			and aa.BossUserCode = cc.BossUserCode',
'			and cc.LoginName = :GLOBAL_LOGINNAME',
'			and aa.ModuleCode = (Select ModuleCode from Module Where EntryPageNo = :APP_PAGE_ID)--GETMODULECODEFROMPAGE(:APP_PAGE_ID)',
'			and bb.LocationCode = a.LocationCode',
'			and aa.CompanyCode = :GLOBAL_COMPANYCODE',
'		)',
'	)',
'Order by a.LocationName',
'Fetch first row only'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Location'
,p_placeholder=>'Location'
,p_source=>'LOCATIONCODE'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'LOCATION2'
,p_cSize=>32
,p_cMaxlength=>30
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29260498279799024)
,p_name=>'P383_LORRYDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'LORRYDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29272463192799029)
,p_name=>'P383_LORRYNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'LORRYNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29264493482799026)
,p_name=>'P383_MARINEINSURANCEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'MARINEINSURANCEAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29258852982799024)
,p_name=>'P383_MARINEINSURANCETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'MARINEINSURANCETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29279694027799033)
,p_name=>'P383_MODIFIEDBY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>840
,p_item_plug_id=>wwv_flow_imp.id(28768213787866041)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Modified By'
,p_source=>'MODIFIEDBY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29280062142799033)
,p_name=>'P383_MODIFIEDTIME'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>850
,p_item_plug_id=>wwv_flow_imp.id(28768213787866041)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Modified Time'
,p_source=>'MODIFIEDTIME'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29253707042799022)
,p_name=>'P383_NATUREOFSUPPLYCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(28767989374866039)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_default=>'1'
,p_prompt=>'Nature of Supply'
,p_placeholder=>'Nature of Transaction'
,p_source=>'NATUREOFSUPPLYCODE'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'NATUREOFSUPPLYNAME AS D, NATUREOFSUPPLYCODE AS R',
'FROM NATUREOFSUPPLY',
'ORDER BY NATUREOFSUPPLYCODE'))
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29270466159799028)
,p_name=>'P383_NETWEIGHT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'NETWEIGHT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29273311629799029)
,p_name=>'P383_OLDVEHICLENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'OLDVEHICLENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29252939980799021)
,p_name=>'P383_OTHERCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'OTHERCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29256915603799023)
,p_name=>'P383_OUTWARDRAKETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'OUTWARDRAKETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29265245392799026)
,p_name=>'P383_PAIDAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'PAIDAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29250043466799020)
,p_name=>'P383_PARTYCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(28767818943866037)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Party'
,p_placeholder=>'Customer Name'
,p_source=>'PARTYCODE'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    partyname ,',
'    partycode from party    ',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'and :P383_DOCTYPECODE = ''PURCHASERETURN''',
'and partytypecode = ''SUPPLIER''',
'union all    ',
'select ',
'    partyname ,',
'    partycode ',
'from party    ',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'and :P383_DOCTYPECODE != ''PURCHASERETURN''',
'and partytypecode = ''CUSTOMER''',
'',
'----||'' ''||getcityname(officecitycode)'))
,p_lov_cascade_parent_items=>'P383_DOCTYPECODE'
,p_ajax_items_to_submit=>'P383_DOCTYPECODE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>30
,p_tag_attributes=>'style="width: auto;"'
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29267338114799027)
,p_name=>'P383_PERCENTAGAINSTPBG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'PERCENTAGAINSTPBG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29262921865799025)
,p_name=>'P383_PINVOICEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(28768073752866040)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Invoice Amount'
,p_placeholder=>'Invoice Amount'
,p_format_mask=>'99G99G99G99G990D00'
,p_source=>'PINVOICEAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true  style=" width: 158px; "'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30234792460989969)
,p_name=>'P383_PINVOICEAMOUNTBEFOREROUND'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(28768073752866040)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Gross Amount'
,p_placeholder=>'Gross Amount (Unrounded)'
,p_format_mask=>'99G99G99G99G990D00'
,p_source=>'PINVOICEAMOUNTBEFOREROUND'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true  style=" width: 158px; "'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29248166825799019)
,p_name=>'P383_PINVOICEDATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(28767661862866036)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_default=>'trunc(sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Invoice Date'
,p_placeholder=>'Invoice Date'
,p_source=>'PINVOICEDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P383_ALLOWEDFORWARD',
  'min_date', 'ITEM',
  'min_item', 'P383_ALLOWEDBACK',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29247744865799019)
,p_name=>'P383_PINVOICENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(28767661862866036)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Invoice No'
,p_placeholder=>'Invoice No'
,p_source=>'PINVOICENO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29257262652799023)
,p_name=>'P383_PINVOICETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'PINVOICETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29256103418799023)
,p_name=>'P383_PORECEIPTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'PORECEIPTTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29261334090799025)
,p_name=>'P383_PREPARINGDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'PREPARINGDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29256493405799023)
,p_name=>'P383_PURCHASEORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'PURCHASEORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29276851527799031)
,p_name=>'P383_REFERENCETEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'REFERENCETEXT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29277742476799031)
,p_name=>'P383_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'REMARK'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29260882105799025)
,p_name=>'P383_REMOVALDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'REMOVALDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29266085527799027)
,p_name=>'P383_ROUNDINGAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(28768073752866040)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Rounding Amount'
,p_placeholder=>'Round Amount'
,p_format_mask=>'99G99G99G99G990D00'
,p_source=>'ROUNDINGAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true  style=" width: 158px; "'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29268861502799028)
,p_name=>'P383_RUNNINGKM'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'RUNNINGKM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29255694395799022)
,p_name=>'P383_SALESORDERTNO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(28767818943866037)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Sales Order No'
,p_placeholder=>'Sales Order No'
,p_source=>'SALESORDERTNO'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'     A.salesorderno ||'' (''||a.SalesOrderDate||'')'', ',
'     A.tno ',
'from salesorder A',
'where a.locationcode = :P383_LOCATIONCODE',
'  and a.PartyCode = :P383_PARTYCODE'))
,p_lov_cascade_parent_items=>'P383_LOCATIONCODE,P383_PARTYCODE'
,p_ajax_items_to_submit=>'P383_LOCATIONCODE,P383_PARTYCODE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>255
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29259337249799024)
,p_name=>'P383_SOURCELOCATIONTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'SOURCELOCATIONTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(28768741609866046)
,p_name=>'P383_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_use_cache_before_default=>'NO'
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P383_TNO), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29276517720799031)
,p_name=>'P383_SUBJECTTEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'SUBJECTTEXT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29262112277799025)
,p_name=>'P383_SUMOFAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(28768073752866040)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Sum of Amount'
,p_placeholder=>'Amount'
,p_format_mask=>'99G99G99G99G990D00'
,p_source=>'SUMOFAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true  style=" width: 158px; "'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29262515669799025)
,p_name=>'P383_SUMOFFOOTERAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(28768073752866040)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Sum of Footer Amount'
,p_placeholder=>'Footer Amount'
,p_format_mask=>'99G99G99G99G990D00'
,p_source=>'SUMOFFOOTERAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true  style=" width: 158px; "'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29270120579799028)
,p_name=>'P383_TAREWEIGHT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'TAREWEIGHT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29272921886799029)
,p_name=>'P383_TAXVEHICLENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'TAXVEHICLENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29277329077799031)
,p_name=>'P383_TITLETEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'TITLETEXT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29246553107799015)
,p_name=>'P383_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29266473550799027)
,p_name=>'P383_TOTALADVANCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'TOTALADVANCE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29267652381799027)
,p_name=>'P383_TOTALADVANCEPERCENT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'TOTALADVANCEPERCENT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29253250426799022)
,p_name=>'P383_TRANSACTIONTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(28767989374866039)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_prompt=>'Transaction Type'
,p_placeholder=>'Transaction Type'
,p_source=>'TRANSACTIONTYPECODE'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'TRANSACTION TYPE'
,p_cSize=>32
,p_cMaxlength=>30
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29251244471799021)
,p_name=>'P383_TRANSPORTERCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'TRANSPORTERCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29272049478799029)
,p_name=>'P383_UNIONNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'UNIONNAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29271285958799029)
,p_name=>'P383_VEHICLENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'VEHICLENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29251664471799021)
,p_name=>'P383_VEHICLETYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_item_source_plug_id=>wwv_flow_imp.id(29246197241799012)
,p_source=>'VEHICLETYPECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(29279371605799033)
,p_validation_name=>'P383_CREATIONTIME must be timestamp'
,p_static_id=>'p383-creationtime-must-be-timestamp'
,p_validation_sequence=>810
,p_validation=>'P383_CREATIONTIME'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(29278857733799032)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(29280638127799033)
,p_validation_name=>'P383_MODIFIEDTIME must be timestamp'
,p_static_id=>'p383-modifiedtime-must-be-timestamp'
,p_validation_sequence=>830
,p_validation=>'P383_MODIFIEDTIME'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(29280062142799033)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28318086086624341)
,p_name=>'Calculate Foter based on Tax Rule of Detail Region'
,p_static_id=>'calculate-foter-based-on-tax-rule-of-detail-region'
,p_event_sequence=>130
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(30120412961939345)
,p_triggering_element=>'QUANTITY1,RATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28318226218624342)
,p_event_id=>wwv_flow_imp.id(28318086086624341)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'ITEMCODE,QUANTITY1,AMOUNT,FOOTERAMOUNT,TOTALAMOUNT',
  'items_to_submit', 'P383_TNO,DTL_SNO,ITEMSPECIFICATIONCODE,RATE,P383_PARTYCODE,P383_TRANSACTIONTYPECODE,ITEMCODE,QUANTITY1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    PRC_SLS_PINV_CALC_ITEM_TAX (',
    '        P_TNO                   => :P383_TNO,',
    '        P_SNO                   => :DTL_SNO,              -- Main grid line item serial row number alias',
    '        P_ITEMSPECIFICATIONCODE => :ITEMSPECIFICATIONCODE,',
    '        P_RATE                  => :RATE,',
    '        P_PARTYCODE             => :P383_PARTYCODE,       -- Header level party code variable',
    '        P_TRANSACTIONTYPECODE   => :P383_TRANSACTIONTYPECODE,',
    '        P_ITEMCODE              => :ITEMCODE,',
    '        P_QUANTITY1             => :QUANTITY1,',
    '        P_AMOUNT                => :AMOUNT,',
    '        P_DTL_AMOUNT            => :P383_DETAIL_AMOUNT,',
    '        P_DTL_QUANTITY1         => :P383_DETAIL_QUANTITY1, -- Passes back rounded formatted metric',
    '        P_DTL_HSNCODE           => :P383_DETAIL_HSNCODE,  -- Maps to grid column if exists',
    '        P_FOOTERAMOUNT          => :FOOTERAMOUNT,         -- Returns computed line level tax sum',
    '        P_TOTALAMOUNT           => :TOTALAMOUNT           -- Total line currency sum',
    '    );',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_build_option_id=>wwv_flow_imp.id(583251259988425780)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28318400907624344)
,p_event_id=>wwv_flow_imp.id(28318086086624341)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'ITEMCODE,AMOUNT,FOOTERAMOUNT,TOTALAMOUNT,P383_DETAIL_QUANTITY1,P383_DETAIL_AMOUNT,P383_DETAIL_HSNCODE',
  'items_to_submit', 'ITEMCODE,ITEMSPECIFICATIONCODE,QUANTITY1,RATE,DTL_TNO,DTL_SNO,P383_PARTYCODE,P383_TRANSACTIONTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    V_MFACTOR         NUMBER;',
    '    V_UOM_DECIMAL     NUMBER;',
    '    V_COLLECTION_NAME VARCHAR2(30) := ''C_FOOTER_DETAIL'';',
    '    V_DTL_HSNCODE     VARCHAR2(30);',
    '',
    '    v_num_rate        NUMBER := 0;',
    '    v_num_qty         NUMBER := 0;',
    '    v_num_amount      NUMBER := 0;',
    '    v_num_footer_amt  NUMBER := 0;',
    '    ',
    '    v_clean_rate      VARCHAR2(100);',
    '    v_clean_qty       VARCHAR2(100);',
    'BEGIN',
    '    v_clean_rate := REGEXP_REPLACE(:RATE, ''[^0-9.]'', '''');',
    '    v_clean_qty  := REGEXP_REPLACE(:QUANTITY1, ''[^0-9.]'', '''');',
    '',
    '    IF VALIDATE_CONVERSION(v_clean_rate AS NUMBER) = 1 THEN',
    '        v_num_rate := TO_NUMBER(v_clean_rate);',
    '    END IF;',
    '',
    '    IF VALIDATE_CONVERSION(v_clean_qty AS NUMBER) = 1 THEN',
    '        v_num_qty := TO_NUMBER(v_clean_qty);',
    '    END IF;',
    '',
    '    IF :ITEMCODE IS NULL AND :ITEMSPECIFICATIONCODE IS NOT NULL THEN',
    '        BEGIN',
    '            SELECT B."ITEMCODE" INTO :ITEMCODE ',
    '              FROM "ITEMSPECIFICATION" A',
    '              JOIN "ITEM" B ON A."TNO" = B."TNO"',
    '             WHERE A."ITEMSPECIFICATIONCODE" = :ITEMSPECIFICATIONCODE',
    '               AND ROWNUM = 1;',
    '        EXCEPTION ',
    '            WHEN NO_DATA_FOUND THEN :ITEMCODE := NULL;',
    '        END;',
    '    END IF;',
    '',
    '    BEGIN',
    '        SELECT MAX("MULTIPLYINGFACTOR"), MAX(TRIM("HSNCODE"))',
    '          INTO V_MFACTOR, V_DTL_HSNCODE ',
    '          FROM "ITEMSPECIFICATION" ',
    '         WHERE "ITEMSPECIFICATIONCODE" = :ITEMSPECIFICATIONCODE;',
    '    EXCEPTION ',
    '        WHEN NO_DATA_FOUND THEN ',
    '            V_MFACTOR := NULL; ',
    '            V_DTL_HSNCODE := NULL;',
    '    END;',
    '',
    '    v_num_amount := v_num_rate * v_num_qty;',
    '    ',
    '    :AMOUNT                 := LTRIM(TO_CHAR(v_num_amount, ''FM99999999990.00''));',
    '    :P383_DETAIL_AMOUNT     := :AMOUNT;',
    '    :P383_DETAIL_QUANTITY1  := :QUANTITY1;',
    '    :P383_DETAIL_HSNCODE    := V_DTL_HSNCODE;',
    '    ',
    '    IF NOT APEX_COLLECTION.COLLECTION_EXISTS(V_COLLECTION_NAME) THEN',
    '        APEX_COLLECTION.CREATE_COLLECTION(V_COLLECTION_NAME);',
    '    ELSE',
    '       ',
    '        APEX_COLLECTION.DELETE_MEMBERS (',
    '            p_collection_name => V_COLLECTION_NAME,',
    unistr('            p_attr_number     => 2, -- C002 \0915\0949\0932\092E'),
    '            p_attr_value      => TO_CHAR(:DTL_SNO)',
    '        );',
    '    END IF;',
    '',
    '    IF v_num_rate > 0 THEN',
    '        FOR VLOOP IN (',
    '            SELECT ',
    '                C."FOOTERHEADCODE" AS HEAD_CODE, ',
    '                B."TAXRATE"        AS TAX_RATE,',
    '                ROUND((v_num_amount * B."TAXRATE") / 100, 2) AS TAX_VAL,',
    '                A."LEGENDSCODE"    AS LEG_CODE',
    '            FROM "TAXRULEDETAIL" A',
    '            JOIN "TAXRULEDETAILFOOTER" B ON A."TNO" = B."TNO" AND A."SNO" = B."SNO"',
    '            JOIN "FOOTERHEAD" C           ON B."FOOTERHEADCODE" = C."FOOTERHEADCODE"',
    '            JOIN "TAXRULE" D              ON A."TNO" = D."TNO"',
    '            JOIN "TAXRULEHSN" E           ON D."TNO" = E."TNO"',
    '            JOIN "PARTY" F                ON D."TAXREGISTRATIONTYPECODE" = F."TAXREGISTRATIONTYPECODE"',
    '            WHERE F."PARTYCODE"           = :P383_PARTYCODE',
    '              AND D."TRANSACTIONTYPECODE" = :P383_TRANSACTIONTYPECODE',
    '              AND E."HSNCODE"             = V_DTL_HSNCODE',
    '        ) LOOP',
    '            APEX_COLLECTION.ADD_MEMBER(',
    '                P_COLLECTION_NAME => V_COLLECTION_NAME,',
    '                P_C001            => TO_CHAR(:DTL_TNO),',
    '                P_C002            => TO_CHAR(:DTL_SNO),',
    '                P_C003            => TO_CHAR(GLOBALTNO.NEXTVAL),',
    '                P_C004            => VLOOP.HEAD_CODE,',
    '                P_C005            => VLOOP.LEG_CODE,',
    '                P_C006            => LTRIM(TO_CHAR(VLOOP.TAX_RATE, ''FM990.00'')),',
    '                P_C007            => LTRIM(TO_CHAR(VLOOP.TAX_VAL, ''FM99999999990.00''))',
    '            );',
    '            ',
    '            v_num_footer_amt := v_num_footer_amt + VLOOP.TAX_VAL;',
    '        END LOOP;',
    '    END IF;',
    '',
    '    :FOOTERAMOUNT := LTRIM(TO_CHAR(v_num_footer_amt, ''FM99999999990.00''));',
    '    :TOTALAMOUNT  := LTRIM(TO_CHAR(v_num_amount + v_num_footer_amt, ''FM99999999990.00'')); ',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_build_option_id=>wwv_flow_imp.id(583251259988425780)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28318316372624343)
,p_event_id=>wwv_flow_imp.id(28318086086624341)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-3'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'ITEMCODE,AMOUNT,P383_DETAIL_AMOUNT,P383_DETAIL_QUANTITY1,P383_DETAIL_HSNCODE,FOOTERAMOUNT,TOTALAMOUNT,P383_DETAIL_SNO',
  'items_to_submit', 'ITEMCODE,ITEMSPECIFICATIONCODE,RATE,QUANTITY1,P383_TNO,SNO,P383_PARTYCODE,P383_TRANSACTIONTYPECODE,AMOUNT,P383_DETAIL_SNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    v_mfactor     NUMBER;',
    '    v_dtl_hsncode VARCHAR2(30);',
    'BEGIN',
    '    -- Fetch ITEMCODE if missing but SPECIFICATIONCODE exists',
    '    IF :itemcode IS NULL AND :itemspecificationcode IS NOT NULL THEN',
    '        BEGIN',
    '            SELECT b.itemcode ',
    '              INTO :itemcode ',
    '              FROM itemspecification a',
    '              JOIN item b ON a.tno = b.tno',
    '             WHERE a.itemspecificationcode = :itemspecificationcode',
    '               AND ROWNUM = 1;',
    '        EXCEPTION ',
    '            WHEN NO_DATA_FOUND THEN ',
    '                :itemcode := NULL;',
    '        END;',
    '    END IF;',
    '',
    '    -- Fetch HSN Code and Multiplying Factor (Aggregates don''t throw NO_DATA_FOUND)',
    '    SELECT MAX(multiplyingfactor), MAX(TRIM(hsncode))',
    '      INTO v_mfactor, v_dtl_hsncode ',
    '      FROM itemspecification ',
    '     WHERE itemspecificationcode = :itemspecificationcode;',
    '',
    '    -- Basic Calculations and Value Assignments',
    '    :amount                 := NVL(:rate, 0) * NVL(:quantity1, 0);',
    '    :p383_detail_amount     := :amount;',
    '    :p383_detail_quantity1  := :quantity1;',
    '    :p383_detail_hsncode    := v_dtl_hsncode;',
    '    :footeramount           := 0;',
    '    :P383_DETAIL_SNO        := :SNO;',
    '    ',
    '    -- Process Tax/Footer Details if Rate exists',
    '    IF NVL(:rate, 0) > 0 THEN',
    '        ',
    '        DELETE FROM pinvoicedetailfooter ',
    '         WHERE tno = :P383_TNO ',
    '           AND sno = :P383_DETAIL_SNO;',
    '',
    '        FOR vloop IN (',
    '            SELECT c.footerheadcode AS head_code, ',
    '                   b.taxrate        AS tax_rate,',
    '                   ROUND((:amount * b.taxrate) / 100, 2) AS tax_val,',
    '                   a.legendscode    AS leg_code',
    '              FROM taxruledetail a',
    '              JOIN taxruledetailfooter b ON a.tno = b.tno AND a.sno = b.sno',
    '              JOIN footerhead c          ON b.footerheadcode = c.footerheadcode',
    '              JOIN taxrule d             ON a.tno = d.tno',
    '              JOIN taxrulehsn e          ON d.tno = e.tno',
    '              JOIN party f               ON d.taxregistrationtypecode = f.taxregistrationtypecode',
    '             WHERE f.partycode           = :p383_partycode',
    '               AND d.transactiontypecode = :p383_transactiontypecode',
    '               AND e.hsncode             = v_dtl_hsncode',
    '        ) LOOP',
    '            ',
    '            INSERT INTO pinvoicedetailfooter (',
    '                tno, ',
    '                sno, ',
    '                sn, ',
    '                footerheadcode, ',
    '                legendscode, ',
    '                footerpercent, ',
    '                footervalue',
    '            ) VALUES (',
    '                :P383_TNO, ',
    '                :P383_DETAIL_SNO, ',
    '                globaltno.NEXTVAL, ',
    '                vloop.head_code, ',
    '                vloop.leg_code, ',
    '                vloop.tax_rate, ',
    '                vloop.tax_val',
    '            );',
    '            ',
    '            :footeramount := :footeramount + vloop.tax_val;',
    '        END LOOP;',
    '    END IF;',
    '',
    '    :totalamount := :amount + :footeramount;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28318937944624349)
,p_event_id=>wwv_flow_imp.id(28318086086624341)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(30122386242939365)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28318538438624345)
,p_event_id=>wwv_flow_imp.id(28318086086624341)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'Set Summary'
,p_static_id=>'set-summary'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// 1. Keep a short delay to guarantee the server-side PL/SQL finishes writing to the IG cells',
    'setTimeout(function() {',
    '    let igRegion = apex.region("Detail");',
    '    if (!igRegion) return;',
    '',
    '    let gridView = igRegion.widget().interactiveGrid("getViews", "grid");',
    '    let model = gridView ? gridView.model : null;',
    '    if (!model) return;',
    '',
    '    let amount_total = 0;',
    '    let footeramount_total = 0;',
    '    let totalamount_total = 0;',
    '',
    '    // Helper function to safely strip masks/spaces and cast cleanly to a number',
    '    function cleanCellNumber(record, columnName) {',
    '        let cellVal = model.getValue(record, columnName);',
    '        if (cellVal !== null && cellVal !== undefined && cellVal !== "") {',
    '            // Strip any commas, currency characters, or extra whitespace spaces',
    '            let cleaned = cellVal.toString().replace(/[^0-9.]/g, '''').trim();',
    '            let num = parseFloat(cleaned);',
    '            return (!isNaN(num)) ? num : 0;',
    '        }',
    '        return 0;',
    '    }',
    '',
    '    // 2. Loop through all active data model rows safely',
    '    model.forEach(function(record, index, id) {',
    '        let meta = model.getRecordMetadata(id);',
    '        ',
    '        // Ensure we completely skip deleted lines and aggregation footer summary lines',
    '        if (meta && !meta.deleted && !meta.agg) {',
    '            amount_total       += cleanCellNumber(record, "AMOUNT");',
    '            footeramount_total += cleanCellNumber(record, "FOOTERAMOUNT");',
    '            totalamount_total  += cleanCellNumber(record, "TOTALAMOUNT");',
    '        }',
    '    });',
    '',
    '    // 3. Push totals back quietly to page components using native fixed strings',
    '    $s(''P383_SUMOFAMOUNT'', amount_total.toFixed(2));',
    '    $s(''P383_SUMOFFOOTERAMOUNT'', footeramount_total.toFixed(2));',
    '',
    '    // 4. Fire custom handshake calculation engine directly to force updates across form headers',
    '    if (typeof calculateInvoiceFields === "function") {',
    '        calculateInvoiceFields();',
    '    }',
    '',
    '}, 300); // 300ms is the sweet spot to ensure the UI thread finishes processing cell mutations',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(30234465477989966)
,p_name=>'Calculate PInvoice Amount'
,p_static_id=>'calculate-pinvoice-amount'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P383_SUMOFAMOUNT,P383_SUMOFFOOTERAMOUNT,P383_LESS_TDS_PERCENT,P383_INTREST_ON_LC_PERCENT,P383_INTREST_ON_LC_DAYS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30234560101989967)
,p_event_id=>wwv_flow_imp.id(30234465477989966)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'calculateInvoiceFields();',
    '',
    '',
    '',
    '',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28319547810624355)
,p_name=>'Close Region'
,p_static_id=>'close-region'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(28319419260624354)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28319597126624356)
,p_event_id=>wwv_flow_imp.id(28319547810624355)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(30122386242939365)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(30805738731109669)
,p_name=>'Disable/Enable Delete Button'
,p_static_id=>'disable-enable-delete-button'
,p_event_sequence=>170
,p_condition_element=>'P383_TNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30805999312109672)
,p_event_id=>wwv_flow_imp.id(30805738731109669)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_name=>'Disabled but not on Fire Initialization'
,p_static_id=>'disabled-but-not-on-fire-initialization'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(29306714642799042)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''DELETE'') = 0',
'OR',
'GETDOCUMENTSTATUSCODE(GETMODULECODEFORPAGENO(:APP_PAGE_ID),:P383_TNO) IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30805853952109671)
,p_event_id=>wwv_flow_imp.id(30805738731109669)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(29306714642799042)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''DELETE'') = 0',
'OR ',
'GETDOCUMENTSTATUSCODE(GETMODULECODEFORPAGENO(:APP_PAGE_ID),:P383_TNO) IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30805818660109670)
,p_event_id=>wwv_flow_imp.id(30805738731109669)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(29306714642799042)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''DELETE'') = 1',
'AND',
'GETDOCUMENTSTATUSCODE(GETMODULECODEFORPAGENO(:APP_PAGE_ID),:P383_TNO) NOT IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(29088378072019829)
,p_name=>'Disable/Enable Print Button'
,p_static_id=>'disable-enable-print-button'
,p_event_sequence=>180
,p_condition_element=>'P383_TNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29088737711019832)
,p_event_id=>wwv_flow_imp.id(29088378072019829)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_name=>'Disabled but not on Fire Initialization'
,p_static_id=>'disabled-but-not-on-fire-initialization'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(28768586302866045)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''PRINT'') = 0',
''))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29088621618019831)
,p_event_id=>wwv_flow_imp.id(29088378072019829)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(28768586302866045)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''PRINT'') = 0'
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29088505040019830)
,p_event_id=>wwv_flow_imp.id(29088378072019829)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(28768586302866045)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''PRINT'') = 1'
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(30805293239109665)
,p_name=>'Disable/Enable Save Button'
,p_static_id=>'disable-enable-save-button'
,p_event_sequence=>160
,p_condition_element=>'P383_TNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30805594840109668)
,p_event_id=>wwv_flow_imp.id(30805293239109665)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_name=>'Disabled but not on Fire Initialization'
,p_static_id=>'disabled-but-not-on-fire-initialization'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(29307073890799042)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''UPDATE'') = 0',
'OR',
'GETDOCUMENTSTATUSCODE(GETMODULECODEFORPAGENO(:APP_PAGE_ID),:P383_TNO) IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30805493723109667)
,p_event_id=>wwv_flow_imp.id(30805293239109665)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(29307073890799042)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''UPDATE'') = 0',
'OR',
'GETDOCUMENTSTATUSCODE(GETMODULECODEFORPAGENO(:APP_PAGE_ID),:P383_TNO) IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30805438544109666)
,p_event_id=>wwv_flow_imp.id(30805293239109665)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(29307073890799042)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''UPDATE'') = 1',
'AND',
'GETDOCUMENTSTATUSCODE(GETMODULECODEFORPAGENO(:APP_PAGE_ID),:P383_TNO) NOT IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(30804028000109652)
,p_name=>'Disable/Enable Status Button'
,p_static_id=>'disable-enable-status-button'
,p_event_sequence=>150
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30805221777109664)
,p_event_id=>wwv_flow_imp.id(30804028000109652)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_name=>'Disabled but not on Fire Initialization'
,p_static_id=>'disabled-but-not-on-fire-initialization'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(28768517460866044)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''STATUS'') = 0'
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30804395179109656)
,p_event_id=>wwv_flow_imp.id(30804028000109652)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(28768517460866044)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''STATUS'') = 0'
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30804131337109653)
,p_event_id=>wwv_flow_imp.id(30804028000109652)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(28768517460866044)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''STATUS'') = 1'
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(30804576349109658)
,p_name=>'Document Status'
,p_static_id=>'document-status'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(28768517460866044)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30806091635109673)
,p_event_id=>wwv_flow_imp.id(30804576349109658)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text('''');',
    '$(''#STATUS'').text($v(''P383_STATUS''));')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30804697814109659)
,p_event_id=>wwv_flow_imp.id(30804576349109658)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(28768340507866042)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30804799847109660)
,p_event_id=>wwv_flow_imp.id(30804576349109658)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P383_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30806184834109674)
,p_event_id=>wwv_flow_imp.id(30804576349109658)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Reload Page'
,p_static_id=>'reload-page'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'location.reload()',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30804887052109661)
,p_event_id=>wwv_flow_imp.id(30804576349109658)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Set Document Status'
,p_static_id=>'set-document-status'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P383_TNO,P383_STATUS',
  'language', 'PLSQL',
  'plsql_code', 'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P383_TNO,:P383_STATUS);',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(30804157362109654)
,p_name=>'Hide Navigation'
,p_static_id=>'hide-navigation'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30804306716109655)
,p_event_id=>wwv_flow_imp.id(30804157362109654)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(30231079138989932)
,p_name=>'Insert into Collection'
,p_static_id=>'insert-into-collection'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(30124014091939381)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_required_patch=>wwv_flow_imp.id(583251259988425780)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30231162942989933)
,p_event_id=>wwv_flow_imp.id(30231079138989932)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P383_SUMOFAMOUNT,P383_SUMOFFOOTERAMOUNT',
  'items_to_submit', 'P383_TNO,P383_SALESORDERTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    V_COLLECTION_NAME   VARCHAR2(30) := ''C_ITEM_DETAILS'';',
    'BEGIN',
    '',
    '    IF APEX_COLLECTION.COLLECTION_EXISTS(P_COLLECTION_NAME => V_COLLECTION_NAME) THEN',
    '        APEX_COLLECTION.TRUNCATE_COLLECTION(P_COLLECTION_NAME => V_COLLECTION_NAME);',
    '    ELSE',
    '        APEX_COLLECTION.CREATE_COLLECTION(P_COLLECTION_NAME => V_COLLECTION_NAME);',
    '    END IF;',
    '',
    '    FOR VLOOP IN (',
    '        SELECT A."ITEMCODE",',
    '               A."ITEMSPECIFICATIONCODE",',
    '               A."DESCRIPTION",',
    '               A."PACKINGTYPECODE",',
    '               A."PACKINGNOS",',
    '               A."QUANTITY1",',
    '               A."RATE",',
    '               A."AMOUNT",',
    '               A."FOOTERAMOUNT",',
    '               A."TOTALAMOUNT",',
    '               A."REMARK",',
    '               GETITEMSPECIFICATIONNAME(A."ITEMCODE", A."ITEMSPECIFICATIONCODE") AS V_SPEC_NAME,',
    '               GETMEASURINGUNITNAMEFROMITEM(A."ITEMCODE")                        AS V_UOM_NAME,',
    '               GREATEST(NVL(GETUOMDECIMAL(GETMEASURINGUNITCODEFROMITEM(A.ITEMCODE)), 3), 3) AS V_UOM_DECIMAL',
    '          FROM "SALESORDERDETAIL" A',
    '         WHERE A."TNO" = :P383_SALESORDERTNO',
    '         ORDER BY A."SNO"',
    '    ) LOOP',
    '        APEX_COLLECTION.ADD_MEMBER(',
    '            P_COLLECTION_NAME => V_COLLECTION_NAME,',
    '            P_C001            => :P383_TNO,',
    '            P_C002            => PINVOICEDETAIL_SEQ.NEXTVAL,',
    '            P_C003            => VLOOP."ITEMCODE",',
    '            P_C004            => VLOOP."ITEMSPECIFICATIONCODE",',
    '            P_C005            => VLOOP.V_SPEC_NAME,',
    '            P_C006            => VLOOP."DESCRIPTION",',
    '            P_C007            => VLOOP."PACKINGTYPECODE",',
    '            P_C008            => TO_CHAR(VLOOP."PACKINGNOS"), ',
    '            P_C009            => VLOOP.V_UOM_NAME,',
    '            P_C010            => TO_CHAR(ROUND(NVL(VLOOP."QUANTITY1", 0), VLOOP.V_UOM_DECIMAL)),',
    '            P_C011            => TO_CHAR(VLOOP."RATE"),',
    '            P_C012            => TO_CHAR(VLOOP."AMOUNT"),',
    '            P_C013            => TO_CHAR(VLOOP."FOOTERAMOUNT"),',
    '            P_C014            => TO_CHAR(VLOOP."TOTALAMOUNT"),',
    '            P_C015            => VLOOP."REMARK"',
    '        );',
    '',
    '        :P383_SUMOFAMOUNT := TO_CHAR(VLOOP."AMOUNT");',
    '        :P383_SUMOFFOOTERAMOUNT := TO_CHAR(VLOOP."FOOTERAMOUNT");',
    '    END LOOP;',
    '',
    '    -- Calculate instant single-pass aggregations for the APEX layout fields',
    '    SELECT TO_CHAR(NVL(SUM(A.AMOUNT), 0)), ',
    '           TO_CHAR(NVL(SUM(A.FOOTERAMOUNT), 0))',
    '      INTO :P383_SUMOFAMOUNT, ',
    '           :P383_SUMOFFOOTERAMOUNT',
    '      FROM SALESORDERDETAIL A',
    '     WHERE A.TNO = :P383_SALESORDERTNO;',
    '',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31015190257266581)
,p_event_id=>wwv_flow_imp.id(30231079138989932)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.event.trigger(document, ''runInvoiceMath'');',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31014429810266573)
,p_event_id=>wwv_flow_imp.id(30231079138989932)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Set Summary'
,p_static_id=>'set-summary'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '//setTimeout(function(){',
    'let model = apex.region("Details").widget().interactiveGrid("getViews", "grid").model; // retrieve the model',
    'let amount_total = 0;',
    'let footeramount_total = 0;',
    'let totalamount_total = 0;',
    'let quantity1_total = 0;',
    '',
    'model.forEach(function(record, index, id) {',
    '    meta = model.getRecordMetadata(id);',
    '    ',
    '    if (model.getValue(record, "AMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        amount_total += Number(model.getValue(record, "AMOUNT"));',
    '    }',
    '   ',
    '    if (model.getValue(record, "FOOTERAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        footeramount_total += Number(model.getValue(record, "FOOTERAMOUNT"));',
    '    }',
    '    if (model.getValue(record, "TOTALAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        totalamount_total += Number(model.getValue(record, "TOTALAMOUNT"));',
    '    }',
    '});',
    '',
    '',
    '$s(''P383_SUMOFAMOUNT'',amount_total);',
    '$s(''P383_SUMOFFOOTERAMOUNT'',footeramount_total);',
    '// $s(''P175_CCINVOICEAMOUNT'',totalamount_total);',
    '',
    '//},400',
    '//);',
    '')))).to_clob
,p_build_option_id=>wwv_flow_imp.id(583251259988425780)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28317076845624331)
,p_name=>'Insert into PInvoice Detail Table'
,p_static_id=>'insert-into-pinvoice-detail-table'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(30124014091939381)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28318996071624350)
,p_event_id=>wwv_flow_imp.id(28317076845624331)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P383_SUMOFAMOUNT,P383_SUMOFFOOTERAMOUNT,P383_PINVOICEAMOUNTBEFOREROUND,P383_ROUNDINGAMOUNT,P383_PINVOICEAMOUNT',
  'items_to_submit', 'P383_TNO,P383_SALESORDERTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    V_SUM_AMOUNT       NUMBER := 0;',
    '    V_SUM_FOOTERAMOUNT NUMBER := 0;',
    '    V_BEFORE_ROUND     NUMBER := 0;',
    '    V_ROUND_AMT        NUMBER := 0;',
    '    V_FINAL_NET        NUMBER := 0;',
    'BEGIN',
    '    -- DELETE OLD RELEVANT DATA FOR CLEAN INSERT',
    '    DELETE FROM PINVOICEDETAIL WHERE TNO = :P383_TNO;',
    '    DELETE FROM PINVOICEDETAILFOOTER WHERE TNO = :P383_TNO;',
    '    ',
    '    -- INSERT BULK DATA INTO PINVOICEDETAIL USING ITERATIVE RECORD HANDLING OR CLEAN SELECT',
    '    INSERT INTO PINVOICEDETAIL ',
    '    (',
    '        TNO,',
    '        SNO,',
    '        ITEMCODE, ',
    '        ITEMSPECIFICATIONCODE, ',
    '        DESCRIPTION, ',
    '        PACKINGTYPECODE, ',
    '        PACKINGNOS, ',
    '        QUANTITY1, ',
    '        RATE, ',
    '        AMOUNT, ',
    '        FOOTERAMOUNT, ',
    '        TOTALAMOUNT,',
    '        REMARK',
    '    )',
    '    SELECT',
    '        :P383_TNO,',
    '        PINVOICEDETAIL_SEQ.NEXTVAL,',
    '        A.ITEMCODE,',
    '        A.ITEMSPECIFICATIONCODE,',
    '        A.DESCRIPTION,',
    '        A.PACKINGTYPECODE,',
    '        A.PACKINGNOS,',
    '        A.QUANTITY1,',
    '        A.RATE,',
    '        A.AMOUNT,',
    '        A.FOOTERAMOUNT,',
    '        A.TOTALAMOUNT,',
    '        A.REMARK',
    '    FROM (',
    '        SELECT',
    '            SOD.ITEMCODE,',
    '            SOD.ITEMSPECIFICATIONCODE,',
    '            SOD.DESCRIPTION,',
    '            SOD.PACKINGTYPECODE,',
    '            SOD.PACKINGNOS,',
    '            ROUND(NVL(SOD.QUANTITY1, 0), GREATEST(NVL(GETUOMDECIMAL(GETMEASURINGUNITCODEFROMITEM(SOD.ITEMCODE)), 3), 3)) AS QUANTITY1,',
    '            SOD.RATE,',
    '            SOD.AMOUNT,',
    '            SOD.FOOTERAMOUNT,',
    '            SOD.TOTALAMOUNT,',
    '            SOD.REMARK',
    '        FROM SALESORDERDETAIL SOD',
    '        WHERE SOD.TNO = :P383_SALESORDERTNO',
    '        ORDER BY SOD.SNO',
    '    ) A;',
    '',
    '    -- INSERT INTO PINVOICEDETAILFOOTER WITH ACCURATE SNO MAPPING ',
    '    INSERT INTO PINVOICEDETAILFOOTER ',
    '    (',
    '        TNO, ',
    '        SNO, ',
    '        SN, ',
    '        SERIALNO, ',
    '        FOOTERHEADCODE, ',
    '        FOOTERPERCENT, ',
    '        FOOTERVALUE, ',
    '        LEGENDSCODE',
    '    )',
    '    SELECT ',
    '        :P383_TNO,',
    '        PDF.NEW_SNO,',
    '        GLOBALTNO.NEXTVAL, ',
    '        PDF.SERIALNO,',
    '        PDF.FOOTERHEADCODE,',
    '        PDF.FOOTERPERCENT,',
    '        PDF.FOOTERVALUE,',
    '        PDF.LEGENDSCODE      ',
    '    FROM (',
    '        SELECT ',
    '            C.SNO AS NEW_SNO,',
    '            B.SERIALNO,',
    '            B.FOOTERHEADCODE,',
    '            B.FOOTERPERCENT,',
    '            ROUND((C.AMOUNT * B.FOOTERPERCENT) / 100, 2) AS FOOTERVALUE,',
    '            B.LEGENDSCODE',
    '        FROM SALESORDERDETAIL A',
    '        JOIN SALESORDERDETAILFOOTER B ON A.TNO = B.TNO AND A.SNO = B.SNO',
    '        JOIN PINVOICEDETAIL C ON C.TNO = :P383_TNO AND A.ITEMCODE = C.ITEMCODE AND NVL(A.ITEMSPECIFICATIONCODE, ''X'') = NVL(C.ITEMSPECIFICATIONCODE, ''X'')',
    '        WHERE A.TNO = :P383_SALESORDERTNO',
    '        ORDER BY A.SNO, B.SERIALNO',
    '    ) PDF;',
    '',
    '',
    '    -- CALCULATE AGGREGATE SUMMARY FROM FRESHLY INSERTED DETAILS',
    '    SELECT NVL(SUM(P.AMOUNT), 0), ',
    '           NVL(SUM(P.FOOTERAMOUNT), 0)',
    '      INTO V_SUM_AMOUNT, ',
    '           V_SUM_FOOTERAMOUNT',
    '      FROM PINVOICEDETAIL P',
    '     WHERE P.TNO = :P383_TNO;',
    '',
    '    -- APPLY ROUNDING MATHEMATICAL LOGIC',
    '    V_BEFORE_ROUND := V_SUM_AMOUNT + V_SUM_FOOTERAMOUNT;',
    '    V_FINAL_NET    := ROUND(V_BEFORE_ROUND);',
    '    V_ROUND_AMT    := V_FINAL_NET - V_BEFORE_ROUND;',
    '',
    '    -- UPDATE MASTER TABLE (PINVOICE)',
    '    -- UPDATE PINVOICE',
    '    --    SET SUMOFAMOUNT                = V_SUM_AMOUNT,',
    '    --        SUMOFFOOTERAMOUNT          = V_SUM_FOOTERAMOUNT,',
    '    --        PINVOICEAMOUNTBEFOREROUND  = V_BEFORE_ROUND,',
    '    --        ROUNDINGAMOUNT             = V_ROUND_AMT,',
    '    --        PINVOICEAMOUNT             = V_FINAL_NET',
    '    --  WHERE TNO = :P383_TNO;',
    '',
    '    -- ASSIGN VALUES TO APEX PAGE ITEMS TO SHOW ON SCREEN',
    '    :P383_SUMOFAMOUNT               := V_SUM_AMOUNT;',
    '    :P383_SUMOFFOOTERAMOUNT         := V_SUM_FOOTERAMOUNT;',
    '    :P383_PINVOICEAMOUNTBEFOREROUND := V_BEFORE_ROUND;',
    '    :P383_ROUNDINGAMOUNT            := V_ROUND_AMT;',
    '    :P383_PINVOICEAMOUNT            := V_FINAL_NET;',
    '',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28317314517624333)
,p_event_id=>wwv_flow_imp.id(28317076845624331)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.event.trigger(document, ''runInvoiceMath'');',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28319082735624351)
,p_event_id=>wwv_flow_imp.id(28317076845624331)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Detail Footer Region'
,p_static_id=>'refresh-detail-footer-region'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(30122386242939365)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28317448823624334)
,p_event_id=>wwv_flow_imp.id(28317076845624331)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Detail Region'
,p_static_id=>'refresh-detail-region'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(30120412961939345)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(44133373480811325)
,p_name=>'PDF'
,p_static_id=>'pdf'
,p_event_sequence=>230
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(28768586302866045)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(44133463072811326)
,p_event_id=>wwv_flow_imp.id(44133373480811325)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(31418590485026432)
,p_name=>'Recalculate Entire Invoice Layout'
,p_static_id=>'recalculate-entire-invoice-layout'
,p_event_sequence=>200
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'runInvoiceMath'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31418662453026433)
,p_event_id=>wwv_flow_imp.id(31418590485026432)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'calculateInvoiceFields();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28769147982866051)
,p_name=>'Set Currency Unit Value'
,p_static_id=>'set-currency-unit-value'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P383_CURRENCYUNITCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28769340787866052)
,p_event_id=>wwv_flow_imp.id(28769147982866051)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P383_CURRENCYVALUE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P383_CURRENCYUNITCODE',
  'sql_query', 'Select a.currencyvalue From currencyunit a where a.currencyunitcode = :P383_CURRENCYUNITCODE',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(30120068701939342)
,p_name=>'Set Currency Unit Value on Page Load'
,p_static_id=>'set-currency-unit-value-on-page-load'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30903198667789074)
,p_event_id=>wwv_flow_imp.id(30120068701939342)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_name=>'Disable Get Item Button'
,p_static_id=>'disable-get-item-button'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var iro = $v(''P383_IS_READONLY'');',
    'if (iro == 1){',
    '    $(''#S_GET_DETAIL_ITEM'').prop(''disabled'',''true'')',
    '}',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30120175712939343)
,p_event_id=>wwv_flow_imp.id(30120068701939342)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P383_CURRENCYVALUE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P383_CURRENCYUNITCODE',
  'sql_query', 'Select a.currencyvalue From currencyunit a where a.currencyunitcode = :P383_CURRENCYUNITCODE',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28319659431624357)
,p_name=>'Set SNO'
,p_static_id=>'set-sno'
,p_event_sequence=>220
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(30120412961939345)
,p_triggering_element=>'ITEMSPECIFICATIONNAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28319767533624358)
,p_event_id=>wwv_flow_imp.id(28319659431624357)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P383_DETAIL_SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'plsql_expression', ':SNO',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28317762676624338)
,p_name=>'Set the Detail on Selection Change of Detail Region '
,p_static_id=>'set-the-detail-on-selection-change-of-detail-region'
,p_event_sequence=>110
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(30120412961939345)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28317936614624339)
,p_event_id=>wwv_flow_imp.id(28317762676624338)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var p_Sno, ',
    '    p_Item, ',
    '    p_Item_specification,',
    '    p_Qty,',
    '    p_Item_Amount,',
    '    model = this.data.model;',
    '',
    'p_Sno                   = model.getValue( this.data.selectedRecords[0], "SNO");',
    'p_Item                  = model.getValue( this.data.selectedRecords[0], "ITEMCODE");',
    'p_Item_specification    = model.getValue( this.data.selectedRecords[0], "ITEMSPECIFICATIONCODE");',
    'p_Qty                   = model.getValue( this.data.selectedRecords[0], "QUANTITY1");',
    'p_Item_Amount           = model.getValue( this.data.selectedRecords[0], "AMOUNT");',
    '',
    '',
    '',
    '//Set the SNO',
    'apex.item( "P383_DETAIL_SNO" ).setValue (p_Sno);',
    '//Set the Item Quantity',
    'apex.item( "P383_DETAIL_QUANTITY1" ).setValue (p_Qty);',
    '//Set the Item',
    'apex.item( "P383_DETAIL_ITEMCODE" ).setValue (p_Item);',
    '//Set the Item Specification',
    'apex.item( "P383_DETAIL_ITEMSPECIFICATIONCODE").setValue(p_Item_specification?.v || p_Item_specification);',
    '//Set the Item Amount',
    'apex.item( "P383_DETAIL_AMOUNT" ).setValue (p_Item_Amount);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28317646076624336)
,p_name=>'Set the SNO on Row Initialization of Detail Region '
,p_static_id=>'set-the-sno-on-row-initialization-of-detail-region'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(30120412961939345)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28317709717624337)
,p_event_id=>wwv_flow_imp.id(28317646076624336)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = this.data.model;',
    'var record = this.data.record;',
    '',
    'if ( !model.getValue(record, "SNO") ) {',
    '    apex.server.process("GET_SEQUENCE_VAL", {}, {',
    '        success: function(pData) {',
    '            model.setValue(record, "SNO", pData.sno.toString());',
    '        }',
    '    });',
    '}',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28769681999866056)
,p_name=>'Set Values for Consignee and Agent'
,p_static_id=>'set-values-for-consignee-and-agent'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P383_SALESORDERTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28769761005866057)
,p_event_id=>wwv_flow_imp.id(28769681999866056)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P383_CONSIGNEECODE,P383_AGENTCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P383_SALESORDERTNO',
  'sql_query', 'Select ConsigneeCode, AgentCode From SalesOrder Where TNo = :P383_SALESORDERTNO',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28769360896866053)
,p_name=>'Set Values for Consignee and Transaction Type'
,p_static_id=>'set-values-for-consignee-and-transaction-type'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P383_PARTYCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28769450328866054)
,p_event_id=>wwv_flow_imp.id(28769360896866053)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Set Consignee'
,p_static_id=>'set-consignee'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P383_CONSIGNEECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P383_PARTYCODE',
  'plsql_expression', ':P383_PARTYCODE',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28769560051866055)
,p_event_id=>wwv_flow_imp.id(28769360896866053)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Set Transaction Type'
,p_static_id=>'set-transaction-type'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P383_TRANSACTIONTYPECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P383_PARTYCODE,P383_LOCATIONCODE,P383_DOCTYPECODE,P383_COMPANYCODE,P383_PINVOICEDATE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select GetTransactionTypeCodeFor(:P383_PARTYCODE,:P383_LOCATIONCODE,:P383_DOCTYPECODE,:P383_COMPANYCODE, :P383_PINVOICEDATE) ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(30234912915989970)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calculate Footer'
,p_static_id=>'calculate-footer'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_base_sno NUMBER := 0;',
'BEGIN',
'    DELETE FROM PINVOICEDETAILFOOTER A',
'    WHERE NOT EXISTS (',
'        SELECT 1 FROM PINVOICEDETAIL AA  ',
'        WHERE AA.TNO = A.TNO',
'          AND AA.SNO = A.SNO',
'    );',
'    ',
'    DELETE FROM PINVOICEFOOTER WHERE TNO = :P383_TNO;',
'',
'    SELECT COALESCE(MAX(SNO), 0)',
'      INTO v_base_sno',
'      FROM PINVOICEFOOTER;',
'',
'    INSERT INTO PINVOICEFOOTER (',
'        TNO,',
'        SNO,',
'        SERIALNO,',
'        FOOTERHEADCODE,',
'        LEGENDSCODE,        ',
'        FOOTERPERCENT,',
'        FOOTERVALUE',
'    )',
'    SELECT ',
'        :P383_TNO,',
'        v_base_sno + ROW_NUMBER() OVER (ORDER BY FOOTERHEADCODE, LEGENDSCODE) AS SNO, ',
'        ROW_NUMBER() OVER (ORDER BY FOOTERHEADCODE, LEGENDSCODE) AS SERIALNO,        ',
'        FOOTERHEADCODE,',
'        LEGENDSCODE,',
'        FOOTERPERCENT, ',
'        ROUND(SUM(FOOTERVALUE), 2) AS SUMOFVALUE ',
'    FROM PINVOICEDETAILFOOTER',
'    WHERE TNO = :P383_TNO',
'    GROUP BY FOOTERHEADCODE, LEGENDSCODE,FOOTERPERCENT;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>4815669909683239
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(28769062037866050)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generate Document No'
,p_static_id=>'generate-document-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_MODULE_CODE VARCHAR2(30);',
'BEGIN',
'    V_MODULE_CODE := GETMODULECODEFORPAGENO(:APP_PAGE_ID);',
'',
'    IF :P383_PINVOICENO IS NULL THEN',
'        ',
'        SETDOCNONEXT(',
'            pModuleCode        => V_MODULE_CODE,',
'            pCompanyCode       => :GLOBAL_COMPANYCODE,',
'            pFinancialYearCode => :GLOBAL_FINANCIALYEARCODE,',
'            pLocationCode      => :P383_LOCATIONCODE,',
'            pDocTypeCode       => :P383_DOCTYPECODE,',
'            pOtherCode         => NULL,',
'            pTransactionDate   => :P383_PINVOICEDATE',
'        );',
'',
'        :P383_PINVOICENO := GETDOCNO(',
'            pModuleCode        => V_MODULE_CODE,',
'            pCompanyCode       => :GLOBAL_COMPANYCODE,',
'            pFinancialYearCode => :GLOBAL_FINANCIALYEARCODE,',
'            pLocationCode      => :P383_LOCATIONCODE,',
'            pDocTypeCode       => :P383_DOCTYPECODE,',
'            pOtherCode         => NULL,',
'            pTransactionDate   => :P383_PINVOICEDATE',
'        );',
'        ',
'    END IF;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>3349819031559319
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(30232629287989947)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_SEQUENCE_VAL'
,p_static_id=>'get-sequence-val'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''sno'', GLOBALTNO.NEXTVAL);',
'    apex_json.close_object;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>4813386281683216
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(29308307488799043)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(29246197241799012)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Proforma Invoice'
,p_static_id=>'initialize-form-proforma-invoice'
,p_internal_uid=>3889064482492312
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(30803588237109648)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PREPARE_URL'
,p_static_id=>'prepare-url'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   result varchar2(2000);',
'begin',
'   result:=apex_util.prepare_url(apex_application.g_x01);',
'   apex_json.open_object;',
'   apex_json.write(''success'', true);',
'   apex_json.write(''url'', result);',
'   apex_json.close_object;',
'exception',
' when others then',
'   apex_json.open_object;',
'   apex_json.write(''success'', false);',
'   apex_json.write(''message'', sqlerrm);',
'   apex_json.close_object;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>5384345230802917
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(29308661283799043)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(29246197241799012)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Proforma Invoice'
,p_static_id=>'process-form-proforma-invoice'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>3889418277492312
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(28319267565624353)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(30122386242939365)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Save- IG Data (Detail Footer Region)'
,p_static_id=>'save-ig-data-detail-footer-region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>6002610980719734
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(28319227830624352)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(30120412961939345)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Save- IG Data (Detail Region)'
,p_static_id=>'save-ig-data-detail-region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'dml_plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Begin',
    '            if :itemcode is null and :itemspecificationcode is not null then',
    '                select itemcode INTO :ITEMCODE from  itemspecification a, item b',
    '                where a.tno = b.tno',
    '                  and a.itemspecificationcode = :ITEMSPECIFICATIONCODE',
    '                  AND ROWNUM = 1',
    '                  ;',
    '   ',
    '            end if;',
    ' ',
    '    case :APEX$ROW_STATUS',
    '',
    '        when ''C'' then',
    '           Insert Into PInvoiceDetail (                 ',
    '                   TNO              ,',
    '                   SNO              ,',
    '                   ITEMCODE         ,',
    '                   ITEMSPECIFICATIONCODE,',
    '                   DESCRIPTION      ,',
    '                   QUANTITY1        ,',
    '                   QUANTITY2        ,',
    '                   RATE             ,',
    '                   AMOUNT           ,',
    '                   FOOTERAMOUNT     ,',
    '                   TOTALAMOUNT      ,',
    '                   REMARK           ,',
    '                   TAXRULECODE      ,',
    '                   PACKINGTYPECODE  ,',
    '                   PACKINGNOS ,',
    '                   RATEMEASURINGUNITCODE ,',
    '                   DESPATCHCATEGORYCODE',
    '            )',
    '            Values (',
    '                   :P383_TNO              ,',
    '                   :SNO              ,',
    '                   :ITEMCODE         ,',
    '                   :ITEMSPECIFICATIONCODE,',
    '                   :DESCRIPTION      ,',
    '                   :QUANTITY1        ,',
    '                   :QUANTITY2        ,',
    '                   :RATE             ,',
    '                   :AMOUNT           ,',
    '                   :FOOTERAMOUNT     ,',
    '                   :TOTALAMOUNT      ,',
    '                   :REMARK           ,',
    '                   :TAXRULECODE      ,',
    '                   :PACKINGTYPECODE  ,',
    '                   :PACKINGNOS ,',
    '                   :RATEMEASURINGUNITCODE ,',
    '                   :P383_TRANSACTIONTYPECODE',
    '  ',
    '            );',
    '        ',
    '        when ''U'' then',
    '            update PInvoiceDetail Set',
    '                TNO              =     :P383_TNO          ,',
    '                SNO              =     :SNO          ,',
    '                ITEMCODE         =     :ITEMCODE     ,',
    '                ITEMSPECIFICATIONCODE         =     :ITEMSPECIFICATIONCODE,',
    '                DESCRIPTION      =     :DESCRIPTION  ,',
    '                QUANTITY1        =     :QUANTITY1    ,',
    '                QUANTITY2        =     :QUANTITY2    ,',
    '                RATE             =     :RATE         ,',
    '                AMOUNT           =     :AMOUNT       ,',
    '                FOOTERAMOUNT     =     :FOOTERAMOUNT ,',
    '                TOTALAMOUNT      =     :TOTALAMOUNT  ,',
    '                REMARK           =     :REMARK       ,',
    '                TAXRULECODE      =     :TAXRULECODE  ,',
    '                PACKINGTYPECODE  =     :PACKINGTYPECODE,',
    '                PACKINGNOS       =     :PACKINGNOS ,',
    '                RATEMEASURINGUNITCODE = :RATEMEASURINGUNITCODE ,',
    '                DESPATCHCATEGORYCODE = :P383_TRANSACTIONTYPECODE',
    '       WHERE TNO = :P383_TNO',
    '         AND SNO = :SNO',
    '           ;',
    '',
    '        when ''D'' then',
    '            Delete From PInvoiceDetail',
    '            Where TNo = :P383_TNO',
    '              and SNO = :SNO',
    '              ;',
    '',
    '            Delete From PINVOICEDETAILFOOTER a Where a.Tno = :P383_TNO AND SNO = :SNO;',
    '',
    '    end case;',
    'exception when others then',
    '    raise_application_error(-20010, sqlerrm);',
    'End;')),
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'target_type', 'PLSQL_CODE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>6002571245719733
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(28770053069866060)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Configutations'
,p_static_id=>'set-configutations'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Set Allowed Back/Forward Dates',
'    IF :P383_FORMSTATUS = ''NEWRECORD'' THEN ',
'',
'    select',
'    		trunc(sysdate) - nvl(b.AllowedBackDays, 0) as AllowedBack,',
'    		trunc(sysdate) + nvl(b.AllowedForwardDays, 0) AllowedForward	',
'            INTO :P383_ALLOWEDBACK,:P383_ALLOWEDFORWARD',
'    from Module a, ModulePrivilege b, BossUser c',
'    where a.ModuleCode = GetModuleCodeForpageNo(:APP_PAGE_ID)',
'    		and a.ModuleCode = b.ModuleCode',
'    		and b.BossUsercode = c.BossUserCode',
'    		and c.LoginName = :GLOBAL_LOGINNAME',
'    		and b.CompanyCode = :GLOBAL_CompanyCode',
'            ;',
'',
'    else',
'        :P383_ALLOWEDBACK       := :P383_PINVOICEDATE ; ',
'        :P383_ALLOWEDFORWARD    := :P383_PINVOICEDATE ;',
'     end if;',
'',
'--Set Status',
':P383_STATUS := NVL(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P383_TNO), ''Status'');',
'',
'--Set Is Read Only',
'BEGIN',
'    SELECT COALESCE(MAX(1), 0)',
'      INTO :P383_IS_READONLY',
'      FROM DocumentStatusDetail ',
'     WHERE MODULETNO = :P383_TNO ',
'       AND DOCUMENTSTATUSCODE IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')',
'       AND ROWNUM = 1;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3350810063559329
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(30803937270109651)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(30802104920109633)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Terms and Condition - Save Interactive Grid Data'
,p_static_id=>'terms-and-condition-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>5384694263802920
);
wwv_flow_imp.component_end;
end;
/
