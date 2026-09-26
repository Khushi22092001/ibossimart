prompt --application/pages/page_00502
begin
--   Manifest
--     PAGE: 00502
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
 p_id=>502
,p_name=>'Portlet Purchase'
,p_alias=>'PORTLET-PURCHASE'
,p_step_title=>'Portlet Purchase'
,p_warn_on_unsaved_changes=>'N'
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
' ',
'',
'/* p502-purchase-dashboard-alignment-v1 */',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R60204997871689918),',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R470053964037327124){',
'  grid-column:1 / -1!important;',
'  width:100%!important;',
'  max-width:none!important;',
'}',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R476707628844719499),',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R479572390112973462),',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R476700317533702782){grid-column:span 4!important}',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R477165269028055979),',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R477153650756035907),',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R479629663215735079){grid-column:span 8!important}',
'',
'html.page-502 #R60204997871689918,',
'html.page-502 #R60204997871689918 .t-Region-body{background:transparent!important;border:0!important;box-shadow:none!important;padding:0!important}',
'html.page-502 #R60204997871689918_cards{',
'  display:grid!important;',
'  grid-template-columns:repeat(4,minmax(0,1fr))!important;',
'  gap:16px!important;',
'  align-items:stretch!important;',
'  width:100%!important;',
'  margin:0!important;',
'  padding:0!important;',
'}',
'html.page-502 #R60204997871689918_cards > .i-Cards-item{',
'  display:block!important;',
'  width:auto!important;',
'  min-width:0!important;',
'  margin:0!important;',
'}',
'html.page-502 #R60204997871689918_cards .i-Card-wrap{',
'  box-sizing:border-box!important;',
'  width:100%!important;',
'  min-height:154px!important;',
'  height:100%!important;',
'}',
'@media(max-width:1180px){html.page-502 #R60204997871689918_cards{grid-template-columns:repeat(3,minmax(0,1fr))!important}}',
'@media(max-width:760px){html.page-502 #R60204997871689918_cards{grid-template-columns:repeat(2,minmax(0,1fr))!important}}',
'',
'',
'/* p502-purchase-dashboard-alignment-v2 */',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R60204997871689918),',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R470053964037327124){',
'  grid-column:1 / -1!important;',
'  width:100%!important;',
'  max-width:none!important;',
'}',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R476707628844719499),',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R479572390112973462),',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R476700317533702782){grid-column:span 4!important}',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R477165269028055979),',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R477153650756035907),',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R479629663215735079){grid-column:span 8!important}',
'/* Keep the three Purchase overview charts on one row. */',
'html.page-502 #R470053964037327124 .row > .col:has(#R470056276841327147),',
'html.page-502 #R470053964037327124 .row > .col:has(#R470054226647327126),',
'html.page-502 #R470053964037327124 .row > .col:has(#R470054335863327127){',
'  grid-column:span 4!important;',
'  width:auto!important;',
'  max-width:none!important;',
'}',
'',
'html.page-502 #R60204997871689918,',
'html.page-502 #R60204997871689918 .t-Region-body{background:transparent!important;border:0!important;box-shadow:none!important;padding:0!important}',
'html.page-502 #R60204997871689918_cards{',
'  display:grid!important;',
'  grid-template-columns:repeat(4,minmax(0,1fr))!important;',
'  gap:16px!important;',
'  align-items:stretch!important;',
'  width:100%!important;',
'  margin:0!important;',
'  padding:0!important;',
'}',
'html.page-502 #R60204997871689918_cards > .i-Cards-item{',
'  display:block!important;',
'  width:auto!important;',
'  min-width:0!important;',
'  margin:0!important;',
'}',
'html.page-502 #R60204997871689918_cards .i-Card-wrap{',
'  box-sizing:border-box!important;',
'  width:100%!important;',
'  min-height:154px!important;',
'  height:100%!important;',
'}',
'@media(max-width:1180px){html.page-502 #R60204997871689918_cards{grid-template-columns:repeat(3,minmax(0,1fr))!important}}',
'@media(max-width:760px){html.page-502 #R60204997871689918_cards{grid-template-columns:repeat(2,minmax(0,1fr))!important}}',
'',
'',
'/* p502-purchase-dashboard-alignment-v3 */',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R60204997871689918),',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R470053964037327124){',
'  grid-column:1 / -1!important;',
'  width:100%!important;',
'  max-width:none!important;',
'}',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R476707628844719499),',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R479572390112973462),',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R476700317533702782){grid-column:span 4!important}',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R477165269028055979),',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R477153650756035907),',
'html.page-502 .hspl-card-canvas > .row > .col:has(#R479629663215735079){grid-column:span 8!important}',
'/* Keep the three Purchase overview charts on one row. */',
'html.page-502 #R470053964037327124 .container.hspl-card-canvas{',
'  grid-template-columns:repeat(12,minmax(0,1fr))!important;',
'}',
'html.page-502 #R470053964037327124 .row > .col:has(#R470056276841327147),',
'html.page-502 #R470053964037327124 .row > .col:has(#R470054226647327126),',
'html.page-502 #R470053964037327124 .row > .col:has(#R470054335863327127){',
'  grid-column:span 4!important;',
'  width:auto!important;',
'  max-width:none!important;',
'}',
'',
'html.page-502 #R60204997871689918,',
'html.page-502 #R60204997871689918 .t-Region-body{background:transparent!important;border:0!important;box-shadow:none!important;padding:0!important}',
'html.page-502 #R60204997871689918_cards{',
'  display:grid!important;',
'  grid-template-columns:repeat(4,minmax(0,1fr))!important;',
'  gap:16px!important;',
'  align-items:stretch!important;',
'  width:100%!important;',
'  margin:0!important;',
'  padding:0!important;',
'}',
'html.page-502 #R60204997871689918_cards > .i-Cards-item{',
'  display:block!important;',
'  width:auto!important;',
'  min-width:0!important;',
'  margin:0!important;',
'}',
'html.page-502 #R60204997871689918_cards .i-Card-wrap{',
'  box-sizing:border-box!important;',
'  width:100%!important;',
'  min-height:154px!important;',
'  height:100%!important;',
'}',
'@media(max-width:1180px){html.page-502 #R60204997871689918_cards{grid-template-columns:repeat(3,minmax(0,1fr))!important}}',
'@media(max-width:760px){html.page-502 #R60204997871689918_cards{grid-template-columns:repeat(2,minmax(0,1fr))!important}}',
''))
,p_step_template=>2526646919027767344
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(60205532909689924)
,p_plug_name=>'Filters'
,p_static_id=>'filters'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>90
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(476707628844719499)
,p_plug_name=>'Item Group Purchase'
,p_static_id=>'item-group-purchase'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent9:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>4
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'1=2'
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(440935553914465058)
,p_region_id=>wwv_flow_imp.id(476707628844719499)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_legend_font_size=>'8'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(440936062316465058)
,p_chart_id=>wwv_flow_imp.id(440935553914465058)
,p_static_id=>'item-group-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Group Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select x.root_id,',
'       getitemname(x.root_id) As RootName,',
'       Sum(a.totalamount) Amount',
'  From bi_prevenue a,',
'       bi_datetime c,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'              -- ''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   and a.PbpassDate = c.Fin_Date  ',
'   and To_Char(a.PbpassDate,''YYYYMM'') like nvl(:P502_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P502_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P502_FINYEAR,''%'')',
'',
'--   And :P502_ITEMGROUP Is Null',
'--    Or X.ROOT_ID = &P502_ITEMGROUP',
'--   And (&P502_ITEMGROUP Is Null Or',
'--instr('':'' || &P502_ITEMGROUP || '':'', '':'' || X.PATH || '':'') > 0)',
' Group By x.root_id'))
,p_ajax_items_to_submit=>'P502_ITEMGROUP,P502_ITEM,P502_FIN_QTR,P502_FINYEAR'
,p_series_type=>'donut'
,p_series_name_column_name=>'ROOTNAME'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'ROOTNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'COMBO'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P502_ITEMGROUP'',&ROOT_ID.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(477165269028055979)
,p_plug_name=>'Item Group Supplier Purchase'
,p_static_id=>'item-group-supplier-purchase'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent10:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'1=2'
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(440940044734465060)
,p_region_id=>wwv_flow_imp.id(477165269028055979)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(440941732115465061)
,p_chart_id=>wwv_flow_imp.id(440940044734465060)
,p_static_id=>'item-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select TO_CHAR(to_date(:P502_MONTH,''YYYYMM''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(:P502_MONTH,''YYYYMM'')),''DD-MON-RRRR'') as ToDate,',
'''CO'' AS LOCATIONCODE,B.PARTYCODE, B.PARTYNAME, Sum(a.totalamount) Amount',
'  From bi_prevenue a,',
'       PARTY B,',
'       BI_DateTime c,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               --''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   And A.PARTYCODE = B.PARTYCODE',
'   and a.pbpassDate = c.Fin_Date  ',
'   and To_Char(a.pbpassDate,''YYYYMM'') like nvl(:P502_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P502_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P502_FINYEAR,''%'')',
'',
'   And (:P502_ITEMGROUP Is Null  Or X.ROOT_ID = :P502_ITEMGROUP)',
'--   And (&P502_ITEMGROUP Is Null Or',
'--instr('':'' || &P502_ITEMGROUP || '':'', '':'' || X.PATH || '':'') > 0)',
' Group By B.PARTYCODE, B.PARTYNAME',
' order by 6 desc',
'',
'/*',
'Select',
'      b.PartyCode,',
'      GetPartyName(b.PartyCode) PartyName,',
'      sum(b.TotalAmount)Amount',
'From  BI_DateTime a, BI_SRevenue b',
'Where a.Fin_Date = b.CCInvoiceDate',
'  and b.ItemCode like nvl(:P502_ITEM,''%'')',
'  and To_Char(b.CCInvoiceDate,''YYYYMM'') like nvl(:P502_MONTH,''%'')',
'  and a.Fin_Qtr like nvl(:P502_FIN_QTR,''%'')',
'  and replace(a.Fin_year,''-'','''') like nvl(:P502_FINYEAR,''%'')',
'Group by b.PartyCode',
'*/'))
,p_ajax_items_to_submit=>'P502_ITEM,P502_MONTH,P502_QUARTER,P502_FIN_QTR,P502_FINYEAR,P502_ITEMGROUP'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'PARTYNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:151:&SESSION.::&DEBUG.:151:P151_COMPANY,P151_FROMDATE,P151_TODATE,P151_ITEMGROUP,P151_PARTYNAME:&GLOBAL_COMPANYCODE.,&FROMDATE.,&TODATE.,&P502_ITEMGROUP.,&PARTYCODE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(440940514312465060)
,p_chart_id=>wwv_flow_imp.id(440940044734465060)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(440941115664465061)
,p_chart_id=>wwv_flow_imp.id(440940044734465060)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(479572390112973462)
,p_plug_name=>'Item Purchase'
,p_static_id=>'item-purchase'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent9:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>4
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(440942694468465062)
,p_region_id=>wwv_flow_imp.id(479572390112973462)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_legend_font_size=>'8'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(440943231490465062)
,p_chart_id=>wwv_flow_imp.id(440942694468465062)
,p_static_id=>'item-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Nvl(X.PARENTCODE, X.ITEMCODE) As PARENTCODE,',
'       getitemname(Nvl(X.PARENTCODE, X.ITEMCODE)) As RootName,',
'       Sum(a.totalamount) Amount',
'  From bi_prevenue a,',
'       bi_datetime c,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               --''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   and a.PBPassDate = c.Fin_Date  ',
'   and To_Char(a.PBPassDate,''YYYYMM'') like nvl(:P502_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P502_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P502_FINYEAR,''%'')',
'',
'   And (:P502_ITEMGROUP Is Null',
'    Or X.ROOT_ID = :P502_ITEMGROUP)',
'--   And (&P502_ITEMGROUP Is Null Or',
'--instr('':'' || &P502_ITEMGROUP || '':'', '':'' || X.PATH || '':'') > 0)',
' Group By Nvl(X.PARENTCODE, X.ITEMCODE)',
''))
,p_ajax_items_to_submit=>'P502_ITEM,P502_ITEMGROUP,P502_FIN_QTR,P502_MONTH,P502_FINYEAR,P502_QUARTER'
,p_series_type=>'donut'
,p_series_name_column_name=>'ROOTNAME'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'ROOTNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'COMBO'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P502_ITEM'',''&PARENTCODE.'');'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(479629663215735079)
,p_plug_name=>'item spec Supplier Purchase'
,p_static_id=>'item-spec-supplier-purchase'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent10:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(440944563659465063)
,p_region_id=>wwv_flow_imp.id(479629663215735079)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(440946181403465064)
,p_chart_id=>wwv_flow_imp.id(440944563659465063)
,p_static_id=>'item-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''01-''||nvl(TO_CHAR(to_date(:P502_MONTH,''YYYYMM''),''MM-RRRR''),to_char(sysdate,''MM-YYYY'')) AS FromDate,',
'TO_CHAR(last_day(to_date(:P502_MONTH,''YYYYMM'')),''DD-MM-RRRR'') as ToDate,',
'''CO'' AS LOCATIONCODE,B.PARTYCODE, B.PARTYNAME, Sum(a.totalamount) Amount',
'  From bi_prevenue a,',
'       PARTY B,',
'       BI_DateTime c,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               --''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   And A.PARTYCODE = B.PARTYCODE',
'   and a.PBPassDate = c.Fin_Date  ',
'   and To_Char(a.PBPassDate,''YYYYMM'') like nvl(:P502_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P502_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P502_FINYEAR,''%'')',
'   And (:P502_ITEMGROUP Is Null    Or X.ROOT_ID = :P502_ITEMGROUP)',
'   And (:P502_ITEM Is Null Or NVL(X.PARENTCODE,X.ITEMCODE) = :P502_ITEM)',
'   and (:P502_ITEMSPECIFICATION IS NULL OR A.ITEMSPECIFICATIONCODE = :P502_ITEMSPECIFICATION)',
' Group By B.PARTYCODE, B.PARTYNAME',
' order by 6 desc'))
,p_ajax_items_to_submit=>'P502_ITEMSPECIFICATION,P502_FIN_QTR,P502_MONTH,P502_FINYEAR,P502_ITEMGROUP,P502_QUARTER,P502_ITEM'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'PARTYNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:151:&SESSION.::&DEBUG.:151:P151_COMPANY,P151_FROMDATE,P151_TODATE,P151_ITEMGROUP,P151_PARTYNAME,P151_ITEM,P151_ITEMSPECIFICATION:&GLOBAL_COMPANYCODE.,&FROMDATE.,&TODATE.,&P502_ITEMGROUP.,&PARTYCODE.,&P502_ITEM.,&P502_ITEMSPECIFICATION.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(440944997107465063)
,p_chart_id=>wwv_flow_imp.id(440944563659465063)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(440945578125465063)
,p_chart_id=>wwv_flow_imp.id(440944563659465063)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(476700317533702782)
,p_plug_name=>'Item Specification Purchase'
,p_static_id=>'item-specification-purchase'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent9:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_plug_grid_column_span=>4
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(440933749817465057)
,p_region_id=>wwv_flow_imp.id(476700317533702782)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_legend_font_size=>'8'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(440934171942465057)
,p_chart_id=>wwv_flow_imp.id(440933749817465057)
,p_static_id=>'item-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select A.ITEMSPECIFICATIONCODE As ITEMSPECIFICATIONCODE,',
'       getitemSPECIFICATIONNAME(A.ITEMCODE, A.ITEMSPECIFICATIONCODE) As ItemSpecificationName,',
'       Sum(a.totalamount) Amount',
'  From bi_prevenue a,',
'       bi_datetime c,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               --''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   and a.PBPassDate = c.Fin_Date  ',
'   and To_Char(a.PBPassDate,''YYYYMM'') like nvl(:P502_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P502_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P502_FINYEAR,''%'')',
'',
'   And (:P502_ITEMGROUP Is Null',
'    Or X.ROOT_ID = :P502_ITEMGROUP)',
'   And (:P502_ITEM Is Null',
'    Or NVL(X.PARENTCODE,X.ITEMCODE) = :P502_ITEM)',
'--   And (&P502_ITEMGROUP Is Null Or',
'--instr('':'' || &P502_ITEMGROUP || '':'', '':'' || X.PATH || '':'') > 0)',
' Group By a.itemcode, a.itemspecificationcode',
''))
,p_ajax_items_to_submit=>'P502_ITEMSPECIFICATION,P502_ITEMGROUP,P502_ITEM'
,p_series_type=>'donut'
,p_series_name_column_name=>'ITEMSPECIFICATIONNAME'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'ITEMSPECIFICATIONNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'COMBO'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P502_ITEMSPECIFICATION'',''&ITEMSPECIFICATIONCODE.'');'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(477153650756035907)
,p_plug_name=>'Item Supplier Purchase'
,p_static_id=>'item-supplier-purchase'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent10:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(440937278329465059)
,p_region_id=>wwv_flow_imp.id(477153650756035907)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'value-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(440938980539465060)
,p_chart_id=>wwv_flow_imp.id(440937278329465059)
,p_static_id=>'item-supplier-revenue-bar-chart'
,p_seq=>10
,p_name=>'Item Supplier Revenue Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select TO_CHAR(to_date(:P502_MONTH,''YYYYMM''),''DD-MON-RRRR'') AS FromDate,',
'TO_CHAR(last_day(to_date(:P502_MONTH,''YYYYMM'')),''DD-MON-RRRR'') as ToDate,',
'''CO'' AS LOCATIONCODE,',
'B.PARTYCODE, B.PARTYNAME, Sum(a.totalamount) Amount',
'  From bi_prevenue a,',
'       PARTY B,',
'       BI_DateTime c,',
'       (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               --''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode Is Null',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x',
' Where A.ITEMCODE = X.ITEMCODE',
'   And A.PARTYCODE = B.PARTYCODE',
'   and a.PBPassDate = c.Fin_Date  ',
'   and To_Char(a.PBPassDate,''YYYYMM'') like nvl(:P502_MONTH,''%'')',
'   and c.Fin_Qtr like nvl(:P502_FIN_QTR,''%'')',
'   and replace(c.Fin_year,''-'','''') like nvl(:P502_FINYEAR,''%'')',
'   And (:P502_ITEMGROUP Is Null    Or X.ROOT_ID = :P502_ITEMGROUP)',
'   And (:P502_ITEM Is Null Or NVL(X.PARENTCODE,X.ITEMCODE) = :P502_ITEM)',
' Group By B.PARTYCODE, B.PARTYNAME',
' order by 6 desc'))
,p_ajax_items_to_submit=>'P502_ITEM,P502_MONTH,P502_QUARTER,P502_FIN_QTR,P502_FINYEAR'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'PARTYNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:151:&SESSION.::&DEBUG.:151:P151_COMPANY,P151_FROMDATE,P151_TODATE,P151_ITEM,P151_PARTYNAME:&GLOBAL_COMPANYCODE.,&FROMDATE.,&TODATE.,&P502_ITEM.,&PARTYCODE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(440937862009465059)
,p_chart_id=>wwv_flow_imp.id(440937278329465059)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(440938435252465059)
,p_chart_id=>wwv_flow_imp.id(440937278329465059)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(60204997871689918)
,p_name=>'New Card View Dashboard (Query based)'
,p_static_id=>'new-card-view-dashboard-query-based'
,p_template=>wwv_flow_imp.id(574763864839963122)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:iboss-disable-chart'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH RAW_DATES AS (',
'    SELECT ',
'        TO_DATE(TRIM(SUBSTR(:P502_DATE_RANGE, 1, INSTR(:P502_DATE_RANGE, '' - '') - 1)), ''DD-MM-YYYY'')    AS V_START,',
'        TO_DATE(TRIM(SUBSTR(:P502_DATE_RANGE, INSTR(:P502_DATE_RANGE, '' - '') + 3)), ''DD-MM-YYYY'')       AS V_END',
'    FROM DUAL',
')',
',DATE_PARAMS AS (',
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
'            WHEN V_END - V_START = 0    THEN '' yesterday''',
'            WHEN V_END - V_START = 6    THEN '' last 7 days''',
'            WHEN V_END - V_START = 29   THEN '' last 30 days''',
'            WHEN TRUNC(V_START, ''MM'') = V_START AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 1  THEN '' last month''',
'            WHEN TRUNC(V_START, ''Q'') = V_START  AND LAST_DAY(V_END) = V_END     AND MONTHS_BETWEEN(V_END + 1, V_START) = 3  THEN '' last quarter''',
'            WHEN TO_CHAR(V_START, ''MM'') = ''04''  AND TO_CHAR(V_END, ''MM'') = ''03'' AND MONTHS_BETWEEN(V_END + 1, V_START) = 12 THEN '' last FY''',
'            ELSE '' previous period''',
'        END AS PERIOD_LABEL',
'    FROM RAW_DATES',
')',
',PARSED_FILTERS AS (',
'    SELECT',
'        CAST(APEX_STRING.SPLIT(:P502_SUPPLIER, '':'')             AS APEX_T_VARCHAR2) AS ARR_PARTY,',
'        CAST(APEX_STRING.SPLIT(:P502_ITEM_CATEGORY, '':'')        AS APEX_T_VARCHAR2) AS ARR_CAT,',
'        CAST(APEX_STRING.SPLIT(:P502_ITEM_NAME, '':'')            AS APEX_T_VARCHAR2) AS ARR_ITEM,',
'        CAST(APEX_STRING.SPLIT(:P502_ITEM_SPECIFICATION, '':'')   AS APEX_T_VARCHAR2) AS ARR_SPEC',
'    FROM DUAL',
')',
',AGG_PO AS (',
'    SELECT',
'        ',
'        COUNT(DISTINCT CASE WHEN PO.PURCHASEORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN PO.PARTYCODE END) AS CURR_CLIENTS,',
'        COUNT(DISTINCT CASE WHEN PO.PURCHASEORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN PO.PARTYCODE END) AS LAG_CLIENTS,',
'        ',
'        COUNT(DISTINCT CASE WHEN PO.PURCHASEORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN PO.TNO END) AS CURR_ORDERS,',
'        COUNT(DISTINCT CASE WHEN PO.PURCHASEORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN PO.TNO END) AS LAG_ORDERS,',
'        ',
'        SUM(CASE WHEN PO.PURCHASEORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN POD.QUANTITY1 ELSE 0 END) AS CURR_PO_QTY,',
'        SUM(CASE WHEN PO.PURCHASEORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN POD.QUANTITY1 ELSE 0 END) AS LAG_PO_QTY,',
'        ',
'        SUM(CASE WHEN PO.PURCHASEORDERDATE BETWEEN DP.START_DATE AND DP.END_DATE THEN POD.AMOUNT ELSE 0 END) AS CURR_AMT,',
'        SUM(CASE WHEN PO.PURCHASEORDERDATE BETWEEN DP.PREV_START_DATE AND DP.PREV_END_DATE THEN POD.AMOUNT ELSE 0 END) AS LAG_AMT',
'',
'    FROM PURCHASEORDER PO',
'    LEFT JOIN PURCHASEORDERDETAIL POD ON PO.TNO = POD.TNO',
'    CROSS JOIN DATE_PARAMS DP',
'    CROSS JOIN PARSED_FILTERS F',
'    WHERE (:P502_SUPPLIER IS NULL OR PO.PARTYCODE MEMBER OF F.ARR_PARTY)',
'      AND (:P502_ITEM_NAME IS NULL OR POD.ITEMCODE MEMBER OF F.ARR_ITEM)',
'      AND (:P502_ITEM_SPECIFICATION IS NULL OR POD.ITEMSPECIFICATIONCODE MEMBER OF F.ARR_SPEC)',
'      AND (:P502_ITEM_CATEGORY IS NULL OR EXISTS (',
'          SELECT 1 FROM V_ITEM_DETAILS VI ',
'          WHERE VI.ITEMCODE = POD.ITEMCODE AND VI.ITEMCATEGORYCODE MEMBER OF F.ARR_CAT',
'      ))',
')',
',KPI_MATRIX AS (',
'    SELECT ',
'        A.SEQ, A.CARD_TITLE, A.CARD_ICON, A.BACKGROUND_COLOR, A.BORDER_COLOR, A.TEXT_COLOR, A.CARD_PRE_TEXT, A.CARD_POST_TEXT,',
'        CASE ',
'            WHEN A.SEQ = 1 THEN GET_FORMATED_SHORT_VALUE(S.CURR_CLIENTS)',
'            WHEN A.SEQ = 2 THEN GET_FORMATED_SHORT_VALUE(S.CURR_ORDERS)',
'            WHEN A.SEQ = 3 THEN GET_FORMATED_SHORT_VALUE(S.CURR_PO_QTY,3)',
'        END AS CARD_TEXT,',
'        CASE ',
'            WHEN A.SEQ = 1 THEN S.CURR_CLIENTS-S.LAG_CLIENTS ',
'            WHEN A.SEQ = 2 THEN S.CURR_ORDERS-S.LAG_ORDERS',
'            WHEN A.SEQ = 3 THEN S.CURR_PO_QTY-S.LAG_PO_QTY ',
'        END AS NET_DELTA,',
'        CASE ',
'            WHEN A.SEQ = 1 THEN S.LAG_CLIENTS ',
'            WHEN A.SEQ = 2 THEN S.LAG_ORDERS',
'            WHEN A.SEQ = 3 THEN S.LAG_PO_QTY',
'        END AS LAG_VALUE,',
'        CASE',
'        WHEN A.SEQ = 1 AND CHECK_MODULE_VIEW_ACCESS(''PURCHASEORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                APEX_PAGE.GET_URL(',
'                    p_page   => 380,',
'                    p_items  => ''P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEM,P380_ITEMSPECIFICATION,P380_ITEM_CATEGORY,P380_SALES_EXECUTIVE,P380_REGION_TO_DISPLAY,'',',
'                    p_values => TO_CHAR(DP.START_DATE, ''DD-MM-YYYY'') || '','' || TO_CHAR(DP.END_DATE, ''DD-MM-YYYY'') || '','' || COALESCE(:P504_PARTY, '''') || '','' || COALESCE(:P504_ITEM_NAME, '''') || '','' || COALESCE(:P504_ITEM_SPECIFICATION, '''')|| '','' || CO'
||'ALESCE(:P504_ITEM_CATEGORY, '''')|| '','' || COALESCE(:P504_SALES_EXECUTIVE, '''')||'',TOTAL_CLIENTS''',
'                )',
'            WHEN A.SEQ = 2 AND CHECK_MODULE_VIEW_ACCESS(''PURCHASEORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                APEX_PAGE.GET_URL(',
'                    p_page   => 380,',
'                    p_items  => ''P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEM,P380_ITEMSPECIFICATION,P380_ITEM_CATEGORY,P380_SALES_EXECUTIVE,P380_REGION_TO_DISPLAY,'',',
'                    p_values => TO_CHAR(DP.START_DATE, ''DD-MM-YYYY'') || '','' || TO_CHAR(DP.END_DATE, ''DD-MM-YYYY'') || '','' || COALESCE(:P504_PARTY, '''') || '','' || COALESCE(:P504_ITEM_NAME, '''') || '','' || COALESCE(:P504_ITEM_SPECIFICATION, '''')|| '','' || CO'
||'ALESCE(:P504_ITEM_CATEGORY, '''')|| '','' || COALESCE(:P504_SALES_EXECUTIVE, '''')||'',TOTAL_ORDERS''',
'                )',
'            WHEN A.SEQ = 3 AND CHECK_MODULE_VIEW_ACCESS(''PURCHASEORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                APEX_PAGE.GET_URL(',
'                    p_page   => 380,',
'                    p_items  => ''P380_FROMDATE,P380_TODATE,P380_PARTY,P380_ITEM,P380_ITEMSPECIFICATION,P380_ITEM_CATEGORY,P380_SALES_EXECUTIVE,P380_REGION_TO_DISPLAY,'',',
'                    p_values => TO_CHAR(DP.START_DATE, ''DD-MM-YYYY'') || '','' || TO_CHAR(DP.END_DATE, ''DD-MM-YYYY'') || '','' || COALESCE(:P504_PARTY, '''') || '','' || COALESCE(:P504_ITEM_NAME, '''') || '','' || COALESCE(:P504_ITEM_SPECIFICATION, '''')|| '','' || CO'
||'ALESCE(:P504_ITEM_CATEGORY, '''')|| '','' || COALESCE(:P504_SALES_EXECUTIVE, '''')||'',TOTAL_ORDERED_QTY''',
'                )',
'            ELSE APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':502:''||:APP_SESSION) ',
'        END AS CARD_LINK',
'    FROM AGG_PO S',
'    CROSS JOIN DATE_PARAMS DP',
'    CROSS JOIN (',
'        SELECT 1 AS SEQ,    ''Total Suppliers'' AS CARD_TITLE,''fa-users-alt'' AS CARD_ICON,    ''#E2F0D9'' AS BACKGROUND_COLOR,  ''#A9D08E'' AS BORDER_COLOR,  ''#1F4E3D'' AS TEXT_COLOR,    NULL AS CARD_PRE_TEXT,  NULL AS CARD_POST_TEXT  FROM DUAL UNION ALL',
'        SELECT 2,           ''Total Orders'',                 ''fa-shopping-cart'',             ''#e6f1fb'',                      ''#92bfe7'',                  ''#185fa5'',                  NULL,                   NULL                    FROM DUAL UNION ALL',
'        SELECT 3,           ''Total Ordered Qty'',            ''fa-cubes'',                     ''#fbeaf0'',                      ''#d389c9'',                  ''#993556'',                  NULL,                   ''MT''                    FROM DUAL UNION ALL',
'        SELECT 4,           ''Total Dispatched Qty'',         ''fa-truck'',                     ''#E0F2F1'',                      ''#80CBC4'',                  ''#004D40'',                  NULL,                   ''MT''                    FROM DUAL UNION ALL',
'        SELECT 5,           ''Total Pending Dispatch Qty'',   ''fa-hourglass-2'',               ''#FFF2CC'',                      ''#F8CBAD'',                  ''#7F6000'',                  NULL,                   ''MT''                    FROM DUAL UNION ALL',
unistr('        SELECT 6,           ''Total Amount'',                 ''fa-money-bag'',                 ''#FEF9E7'',                      ''#F9E79F'',                  ''#7D6608'',                  ''\20B9'',                    NULL                    FROM DUAL UNION ALL'),
'        SELECT 7,           ''Dispatched Qty Out'',           ''fa-sign-out'',                  ''#E8EAF6'',                      ''#C5CAE9'',                  ''#1A237E'',                  NULL,                   NULL                    FROM DUAL UNION ALL',
'        SELECT 8,           ''Pending Qty Out'',              ''fa-pause-circle-o'',            ''#FDF2E9'',                      ''#F5CBA7'',                  ''#6E2C00'',                  NULL,                   ''MT''                    FROM DUAL UNION ALL',
'        SELECT 9,           ''Cancelled Qty'',                ''fa-ban'',                       ''#FCE4D6'',                      ''#F4B084'',                  ''#C65911'',                  NULL,                   ''MT''                    FROM DUAL',
'    ) A',
')',
'SELECT ',
'    M.SEQ, M.CARD_TITLE, TRIM(M.CARD_TEXT) AS CARD_TEXT, M.CARD_POST_TEXT, M.CARD_PRE_TEXT, M.CARD_ICON, M.BACKGROUND_COLOR, M.BORDER_COLOR, M.TEXT_COLOR, M.CARD_LINK,',
'    CASE ',
'        WHEN M.LAG_VALUE = 0 AND M.NET_DELTA > 0 THEN ''+100%'' || DP.PERIOD_LABEL',
'        WHEN M.LAG_VALUE = 0 AND M.NET_DELTA = 0 THEN ''0%''',
'        ELSE CASE WHEN M.NET_DELTA > 0 THEN ''+'' ELSE '''' END || TO_CHAR(ROUND((M.NET_DELTA / M.LAG_VALUE) * 100, 1), ''FM999,990.0'') || ''%'' || DP.PERIOD_LABEL ',
'    END AS CARD_SUBTEXT,',
'    CASE WHEN M.NET_DELTA > 0 THEN ''fa-arrow-up'' WHEN M.NET_DELTA < 0 THEN ''fa-arrow-down'' ELSE ''fa-minus'' END AS TREND_ICON,',
'    CASE ',
'        -- Structural inversion logic for negative impact fields (Pending/Cancelled color rules)',
'        WHEN M.SEQ IN (5,8,9) THEN (CASE WHEN M.NET_DELTA > 0 THEN ''#C00000'' WHEN M.NET_DELTA < 0 THEN ''#2E7D32'' ELSE ''#595959'' END)',
'        ELSE (CASE WHEN M.NET_DELTA > 0 THEN ''#2E7D32'' WHEN M.NET_DELTA < 0 THEN ''#C00000'' ELSE ''#595959'' END)',
'    END AS TREND_COLOR',
'FROM KPI_MATRIX M',
'CROSS JOIN DATE_PARAMS DP',
'ORDER BY M.SEQ;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P502_DATE_RANGE,P502_SUPPLIER,P502_ITEM_CATEGORY,P502_ITEM_NAME,P502_ITEM_SPECIFICATION'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(56225064195302226)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.set_region_column_width(
 p_id=>wwv_flow_imp.id(60204997871689918)
,p_plug_column_width=>'style="margin-bottom: 10px;"'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60207193319689940)
,p_query_column_id=>7
,p_column_alias=>'BACKGROUND_COLOR'
,p_column_display_sequence=>70
,p_column_heading=>'Background Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60207282500689941)
,p_query_column_id=>8
,p_column_alias=>'BORDER_COLOR'
,p_column_display_sequence=>80
,p_column_heading=>'Border Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60207055161689939)
,p_query_column_id=>6
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>60
,p_column_heading=>'Card Icon'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60207461350689943)
,p_query_column_id=>10
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>100
,p_column_heading=>'Card Link'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60206816158689937)
,p_query_column_id=>4
,p_column_alias=>'CARD_POST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Post Text'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60206970069689938)
,p_query_column_id=>5
,p_column_alias=>'CARD_PRE_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Card Pre Text'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60207591563689944)
,p_query_column_id=>11
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>110
,p_column_heading=>'Card Subtext'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60206718988689936)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>30
,p_column_heading=>'Card Text'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60206677641689935)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Title'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60206567492689934)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60207351913689942)
,p_query_column_id=>9
,p_column_alias=>'TEXT_COLOR'
,p_column_display_sequence=>90
,p_column_heading=>'Text Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60207744909689946)
,p_query_column_id=>13
,p_column_alias=>'TREND_COLOR'
,p_column_display_sequence=>130
,p_column_heading=>'Trend Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60207642798689945)
,p_query_column_id=>12
,p_column_alias=>'TREND_ICON'
,p_column_display_sequence=>120
,p_column_heading=>'Trend Icon'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(470053964037327124)
,p_plug_name=>'Purchase'
,p_static_id=>'purchase'
,p_region_template_options=>'#DEFAULT#:t-Region--showIcon:t-Region--accent14:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs:margin-top-none:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(470054335863327127)
,p_plug_name=>'Purchase by Months'
,p_static_id=>'purchase-by-months'
,p_parent_plug_id=>wwv_flow_imp.id(470053964037327124)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--accent7:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(440928609759465054)
,p_region_id=>wwv_flow_imp.id(470054335863327127)
,p_chart_type=>'bar'
,p_height=>'250'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(440930324990465055)
,p_chart_id=>wwv_flow_imp.id(440928609759465054)
,p_static_id=>'months-bar-chart'
,p_seq=>10
,p_name=>'Months Bar Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      b.Fin_Qtr,',
'      b.Fin_Month,',
'      To_Char(a.PBPassDate,''MON-YYYY'') as Month,',
'      To_Char(a.PBPassDate,''YYYYMM'') as Monthyy,',
'      sum(a.TotalAmount)Amount',
'From  BI_PRevenue a, BI_DateTime b',
'Where a.PBPassDate = b.Fin_date',
'  --and b.Fin_Qtr like nvl(:P502_FIN_QTR,''%'')',
'  --and b.Fin_year like nvl(:P502_FINYEAR,''%'')',
'    and (b.Fin_Qtr = :P502_FIN_QTR or :P502_FIN_QTR is null)',
'    and (replace(b.Fin_year,''-'','''') = :P502_FINYEAR or :P502_FINYEAR is null)',
'Group by b.Fin_Qtr,',
'         b.Fin_Month,',
'         To_Char(a.PBPassDate,''MON-YYYY''),',
'         To_Char(a.PBPassDate,''YYYYMM'')',
'Order by  2 --To_Char(a.PBPassDate,''YYYYMM'')'))
,p_ajax_items_to_submit=>'P502_MONTH,P502_FIN_QTR,P502_FINYEAR'
,p_series_type=>'bar'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'MONTH'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P502_MONTH'',&MONTHYY.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(440929074910465055)
,p_chart_id=>wwv_flow_imp.id(440928609759465054)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(440929706954465055)
,p_chart_id=>wwv_flow_imp.id(440928609759465054)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(470054226647327126)
,p_plug_name=>'Purchase by Quarters'
,p_static_id=>'purchase-by-quarters'
,p_parent_plug_id=>wwv_flow_imp.id(470053964037327124)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--accent5:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(440926860888465053)
,p_region_id=>wwv_flow_imp.id(470054226647327126)
,p_chart_type=>'pie'
,p_height=>'250'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'smooth'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlightAndExplode'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(440927348738465053)
,p_chart_id=>wwv_flow_imp.id(440926860888465053)
,p_static_id=>'quater-pie-chart'
,p_seq=>10
,p_name=>'Quater Pie Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      a.Fin_Qtr_Name,',
'      a.Fin_Qtr,',
'      sum(c.TotalAmount)Amount',
'From  BI_DateTime a, BI_Prevenue c',
'Where a.Fin_Date = c.PBPassDate',
'  and replace(a.Fin_Year,''-'','''') like nvl(:P502_FINYEAR,''%'')',
'Group by a.Fin_Qtr_Name,',
'         a.Fin_Qtr',
'Order by 2'))
,p_ajax_items_to_submit=>'P502_FINYEAR'
,p_series_type=>'pie'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'FIN_QTR_NAME'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'COMBO'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:$s(''P502_FIN_QTR'',&FIN_QTR.);'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(470056276841327147)
,p_plug_name=>'Yearly Purchase'
,p_static_id=>'yearly-purchase'
,p_parent_plug_id=>wwv_flow_imp.id(470053964037327124)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--accent1:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(440931923158465056)
,p_region_id=>wwv_flow_imp.id(470056276841327147)
,p_chart_type=>'pie'
,p_height=>'250'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(440932387183465056)
,p_chart_id=>wwv_flow_imp.id(440931923158465056)
,p_static_id=>'yearly-revenue'
,p_seq=>10
,p_name=>'Yearly Revenue'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      a.Fin_Year FYNAME,',
'      REPLACE(a.Fin_Year,''-'','''') FYCODE,',
'      sum(TotalAmount)Amount',
'From  BI_DateTime a, BI_PRevenue b',
'Where a.Fin_Date = b.PBPassDate',
'Group by a.Fin_Year'))
,p_series_type=>'pie'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'FYNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'COMBO'
,p_threshold_display=>'onIndicator'
,p_link_target=>'JavaScript:$s(''P502_FINYEAR'' ,&FYCODE. );'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(60206447727689933)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(60205532909689924)
,p_button_name=>'SUBMIT'
,p_static_id=>'submit'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--stretch'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60205654608689925)
,p_name=>'P502_DATE_RANGE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(60205532909689924)
,p_prompt=>'Date Range'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_UC_DATE_RANGE_PICKER'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'NDP',
  'attribute_06', 'ranges',
  'attribute_07', 'DR',
  'attribute_09', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    ' ''Custom'': true,',
    ' ''Today'': [moment(), moment()],',
    ' ''Yesterday'': [moment().subtract(1, ''days''), moment().subtract(1, ''days'')],',
    ' ''Last 7 Days'': [moment().subtract(6, ''days''), moment()],',
    ' ''Last 30 Days'': [moment().subtract(29, ''days''), moment()],',
    ' ''This Month'': [moment().startOf(''month''), moment().endOf(''month'')],',
    ' ''Last Month'': [moment().subtract(1, ''month'').startOf(''month''), moment().subtract(1, ''month'').endOf(''month'')],',
    ' ''This Quarter'': [moment().startOf(''quarter''), moment().endOf(''quarter'')],',
    ' ''This FY Year'': [moment().month(3).startOf(''month'').isAfter(moment()) ? moment().subtract(1, ''year'').month(3).startOf(''month'') : moment().month(3).startOf(''month''), moment().month(3).startOf(''month'').isAfter(moment()) ? moment().month(2).endOf(''mont'
||'h'') : moment().add(1, ''year'').month(2).endOf(''month'')]',
    '}',
    '')),
  'attribute_10', 'alwaysShowCalendars:linkedCalendars:showDropdowns:showWeekNumbers',
  'attribute_15', 'onIconClick')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450425479445271771)
,p_name=>'P502_FINYEAR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(470056276841327147)
,p_prompt=>'F.Year'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450413406602271766)
,p_name=>'P502_FIN_QTR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(470054226647327126)
,p_prompt=>'Quarter'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60205846109689927)
,p_name=>'P502_FY_BEGIN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(60205532909689924)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60205919054689928)
,p_name=>'P502_FY_END'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(60205532909689924)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459946644972918110)
,p_name=>'P502_ITEM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(479572390112973462)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459951560362938364)
,p_name=>'P502_ITEMGROUP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(476707628844719499)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459942077759921641)
,p_name=>'P502_ITEMSPECIFICATION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(476700317533702782)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60206125538689930)
,p_name=>'P502_ITEM_CATEGORY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(60205532909689924)
,p_prompt=>'Item Category'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT ',
'    IC.ITEMCATEGORYNAME D, ',
'    IC.ITEMCATEGORYCODE R ',
'FROM ITEMCATEGORY IC',
'JOIN ITEM I ON I.ITEMCATEGORYCODE = IC.ITEMCATEGORYCODE'))
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60206278041689931)
,p_name=>'P502_ITEM_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(60205532909689924)
,p_prompt=>'Item'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'     VI.ITEMNAME D,',
'     VI.ITEMCODE R',
'FROM INDENTDETAIL Id',
'JOIN V_ITEM_DETAILS VI ON VI.ITEMCODE = ID.ITEMCODE',
'WHERE (:P504_ITEM_CATEGORY is null or  VI.ITEMCATEGORYCODE = :P502_ITEM_CATEGORY )'))
,p_lov_cascade_parent_items=>'P502_ITEM_CATEGORY'
,p_ajax_items_to_submit=>'P502_ITEM_NAME'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60206356437689932)
,p_name=>'P502_ITEM_SPECIFICATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(60205532909689924)
,p_prompt=>'Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'     vi.ITEMSPECIFICATIONNAME D,',
'     vi.ITEMSPECIFICATIONCODE R',
'FROM V_ITEM_DETAILS vi',
'WHERE (:P504_ITEM_NAME is null or  vi.ITEMCODE = :P502_ITEM_NAME )'))
,p_lov_cascade_parent_items=>'P502_ITEM_NAME'
,p_ajax_items_to_submit=>'P502_ITEM_SPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450419422466271768)
,p_name=>'P502_MONTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(470054335863327127)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450419803158271768)
,p_name=>'P502_QUARTER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(470054335863327127)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60206040110689929)
,p_name=>'P502_SUPPLIER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(60205532909689924)
,p_prompt=>'Supplier'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'    Distinct ',
'    p.PartyName||'' - ''||Getcityname(p.OfficeCityCode) D,',
'    a.PartyCode R ',
'from GRN A',
'join party p on a.partycode = p.partycode'))
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441596081724232815)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>120
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441596508429232816)
,p_event_id=>wwv_flow_imp.id(441596081724232815)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '//$("#t_Body_nav").hide();',
    '//$(this).treeView("collapse", n$)')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(440956277567465068)
,p_name=>'REFRESH'
,p_static_id=>'refresh'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P502_ITEMSPECIFICATION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440956777636465068)
,p_event_id=>wwv_flow_imp.id(440956277567465068)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(479629663215735079)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(440950673664465065)
,p_name=>'Refresh Customer Region'
,p_static_id=>'refresh-customer-region'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P502_ITEMGROUP'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440951185330465066)
,p_event_id=>wwv_flow_imp.id(440950673664465065)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(477165269028055979)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(440951611762465066)
,p_name=>'REFRESH ITEM'
,p_static_id=>'refresh-item'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P502_ITEMGROUP'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440952635978465066)
,p_event_id=>wwv_flow_imp.id(440951611762465066)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(479572390112973462)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440952161203465066)
,p_event_id=>wwv_flow_imp.id(440951611762465066)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P502_ITEM'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P502_ITEM',
  'sql_query', 'SELECT NULL FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(440949774816465065)
,p_name=>'Refresh Item Region'
,p_static_id=>'refresh-item-region'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P502_MONTH'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440950350347465065)
,p_event_id=>wwv_flow_imp.id(440949774816465065)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P502_ITEMGROUP'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(440954465259465067)
,p_name=>'REFRESH ITEM SPECIFICATION'
,p_static_id=>'refresh-item-specification'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P502_ITEM'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440954903304465067)
,p_event_id=>wwv_flow_imp.id(440954465259465067)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(477153650756035907)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440955467618465067)
,p_event_id=>wwv_flow_imp.id(440954465259465067)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(476700317533702782)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440955914525465068)
,p_event_id=>wwv_flow_imp.id(440954465259465067)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(479629663215735079)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(440953037737465066)
,p_name=>'REFRESH ITEMSPECIFICATION'
,p_static_id=>'refresh-itemspecification'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P502_ITEMGROUP'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440953494899465067)
,p_event_id=>wwv_flow_imp.id(440953037737465066)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(476700317533702782)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440954029831465067)
,p_event_id=>wwv_flow_imp.id(440953037737465066)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(479629663215735079)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(440946980187465064)
,p_name=>'Refresh Month Chart'
,p_static_id=>'refresh-month-chart'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P502_FIN_QTR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440947561422465064)
,p_event_id=>wwv_flow_imp.id(440946980187465064)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P502_MONTH'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440948030244465064)
,p_event_id=>wwv_flow_imp.id(440946980187465064)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(470054335863327127)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(440948394170465065)
,p_name=>'Refresh Quarter Chart'
,p_static_id=>'refresh-quarter-chart'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P502_FINYEAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440948881433465065)
,p_event_id=>wwv_flow_imp.id(440948394170465065)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P502_FIN_QTR,P502_MONTH'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440949372283465065)
,p_event_id=>wwv_flow_imp.id(440948394170465065)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(470054226647327126)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(60205756304689926)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Default Values'
,p_static_id=>'get-default-values'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    :P502_FY_BEGIN      := :GLOBAL_FINANCIALYEARBEGIN;',
'    :P502_FY_END        := :GLOBAL_FINANCIALYEAREND;',
'    IF :P502_DATE_RANGE IS NULL THEN',
'        :P502_DATE_RANGE    :=  :P502_FY_BEGIN||'' - ''||:P502_FY_END;',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>42738744179460610
);
wwv_flow_imp.component_end;
end;
/
