prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
end;
/
 
prompt APPLICATION 105 - Imart
--
-- Application Export:
--   Application:     105
--   Name:            Imart
--   Exported By:     IMART
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 143
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
null;
end;
/
prompt --application/pages/delete_00143
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>143);
end;
/
prompt --application/pages/page_00143
begin
wwv_flow_imp_page.create_page(
 p_id=>143
,p_name=>'Purchase Bill'
,p_alias=>'PURCHASE-BILL'
,p_step_title=>'Purchase Bill'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#myfunctions#MIN#.js',
''))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function GotoP321() {    ',
'var x = apex.item(''P143_TNO'').getValue();',
'var x1 = apex.item(''P143_SNO'').getValue();',
'var y = apex.item(''P143_DFAMOUNT'').getValue();',
'var y1 = apex.item(''P143_DFTOTALAMOUNT'').getValue();',
'var z1 = apex.item(''P143_FVALUE'').getValue();',
'',
'var url = "f?p=#APP_ID#:321:#SESSION#::NO:RP,321:P321_TNO,P321_SNO,P321_DFAMOUNT,P321_DFTOTALAMOUNT,P321_FVALUE:#P321_TNO#,#P321_SNO#,#P321_DFAMOUNT#,#P321_DFTOTALAMOUNT#,#P321_FVALUE#";',
'',
'url = url.replace("#APP_ID#", $v("pFlowId"));',
'url = url.replace("#SESSION#", $v("pInstance"));',
'url = url.replace("#P321_TNO#", x);',
'url = url.replace("#P321_SNO#", x1);',
'url = url.replace("#P321_DFAMOUNT#", y);',
'url = url.replace("#P321_DFTOTALAMOUNT#", y1);',
'url = url.replace("#P321_FVALUE#", z1);',
'',
'',
'apex.server.process("PREPARE_URL", {',
'x01: url',
'  }, {',
'  success: function(pData) {',
'   if (pData.success === true) {',
'     apex.navigation.redirect(pData.url);',
'   } else {',
'     console.log("FALSE");',
'   }',
' },',
'error: function(request, status, error) {',
'console.log("status---" + status + " error----" + error);',
'  }',
'});',
'}',
'',
'/* P143_DETAIL_SCROLL_LIVE_TOTAL_V1 */',
'(function () {',
'  var detailModel = null;',
'  var detailSubscription = null;',
'  var updateTimer = null;',
'',
'  function numberValue(value) {',
'    var parsed = Number(String(value == null ? '''' : value).replace(/,/g, '''').trim());',
'    return Number.isFinite(parsed) ? parsed : 0;',
'  }',
'',
'  function formatNumber(value, decimals) {',
'    return new Intl.NumberFormat(''en-IN'', {',
'      minimumFractionDigits: decimals,',
'      maximumFractionDigits: decimals',
'    }).format(numberValue(value));',
'  }',
'',
'  function ensureTotalLine() {',
'    var grid = document.getElementById(''Detail_ig'');',
'    var line = document.getElementById(''p143-live-total-line'');',
'    var table;',
'    var body;',
'    var sampleRow;',
'    var scroller;',
'    var dock;',
'    var dockScroll;',
'    var dockTable;',
'    var dockBody;',
'    var metricColumns = { qty1: 8, qty2: 10, amount: 12, footer: 14, bill: 15 };',
'    var footer;',
'    function alignDockToViewport() {',
'      var gridBottom = grid.getBoundingClientRect().bottom;',
'      var viewportBottom = scroller.getBoundingClientRect().bottom;',
'      var reservedGap = Math.max(0, Math.round(gridBottom - viewportBottom));',
'      /* Reclaim APEX''s responsive footer slot without resizing the detail grid. */',
'      dock.style.setProperty(''margin-top'', (-reservedGap) + ''px'', ''important'');',
'    }',
'    if (!grid) { return null; }',
'    table = grid.querySelector(''.a-GV-w-scroll .a-GV-table'');',
'    scroller = grid.querySelector(''.a-GV-w-scroll'');',
'    body = table && table.tBodies && table.tBodies[0];',
'    sampleRow = body && body.querySelector(''tr.a-GV-row:not(.u-invisible):not(.p143-grid-total-row)'');',
'    if (!body || !sampleRow || !scroller) { return null; }',
'    dock = grid._p143LiveTotalDock;',
'    if (!dock || !dock.isConnected) {',
'      dock = grid.nextElementSibling && grid.nextElementSibling.classList.contains(''p143-live-total-dock'') ? grid.nextElementSibling : null;',
'    }',
'    if (!dock) {',
'      dock = document.createElement(''div'');',
'      dock.className = ''p143-live-total-dock'';',
'      dock.innerHTML = ''<div class="p143-live-total-dock-scroll"><table class="p143-live-total-table" role="presentation"><tbody></tbody></table></div>'';',
'      grid.insertAdjacentElement(''afterend'', dock);',
'    }',
'    grid._p143LiveTotalDock = dock;',
'    dockScroll = dock.querySelector(''.p143-live-total-dock-scroll'');',
'    dockTable = dock.querySelector(''.p143-live-total-table'');',
'    dockBody = dockTable.tBodies[0];',
'    alignDockToViewport();',
'    if (!grid._p143TotalDockResizeObserver && window.ResizeObserver) {',
'      grid._p143TotalDockResizeObserver = new ResizeObserver(function () {',
'        window.requestAnimationFrame(alignDockToViewport);',
'      });',
'      grid._p143TotalDockResizeObserver.observe(grid);',
'      grid._p143TotalDockResizeObserver.observe(scroller);',
'    }',
'    dockScroll.style.setProperty(''width'', scroller.clientWidth + ''px'', ''important'');',
'    dockTable.style.width = Math.ceil(table.getBoundingClientRect().width) + ''px'';',
'    if (!scroller._p143TotalDockBound) {',
'      scroller._p143TotalDockBound = true;',
'      scroller._p143SyncTotalDock = function () {',
'        alignDockToViewport();',
'        dockScroll.style.setProperty(''width'', scroller.clientWidth + ''px'', ''important'');',
'        dockTable.style.width = Math.ceil(table.getBoundingClientRect().width) + ''px'';',
'        dockScroll.scrollLeft = scroller.scrollLeft;',
'      };',
'      scroller.addEventListener(''scroll'', scroller._p143SyncTotalDock, { passive: true });',
'      scroller.addEventListener(''wheel'', function () { window.requestAnimationFrame(scroller._p143SyncTotalDock); }, { passive: true });',
'      scroller.addEventListener(''keyup'', function () { window.requestAnimationFrame(scroller._p143SyncTotalDock); }, true);',
'    }',
'    if (!document._p143TotalDockScrollDelegate) {',
'      document._p143TotalDockScrollDelegate = true;',
'      document.addEventListener(''scroll'', function (event) {',
'        var liveScroller = event.target;',
'        var liveDockScroll;',
'        if (!liveScroller || !liveScroller.matches || !liveScroller.matches(''#Detail_ig .a-GV-w-scroll'')) return;',
'        liveDockScroll = document.querySelector(''.p143-live-total-dock-scroll'');',
'        if (liveDockScroll) liveDockScroll.scrollLeft = liveScroller.scrollLeft;',
'      }, true);',
'    }',
'    window.requestAnimationFrame(scroller._p143SyncTotalDock);',
'',
'    if (line && (line.tagName !== ''TR'' || line.parentNode !== dockBody)) {',
'      line.remove();',
'      line = null;',
'    }',
'    if (!line) {',
'      line = document.createElement(''tr'');',
'      line.id = ''p143-live-total-line'';',
'      line.className = ''a-GV-row p143-grid-total-row'';',
'      line.setAttribute(''role'', ''status'');',
'      line.setAttribute(''aria-live'', ''polite'');',
'      Array.prototype.forEach.call(sampleRow.cells, function (sampleCell, columnIndex) {',
'        var cell = document.createElement(''td'');',
'        var metricName = Object.keys(metricColumns).find(function (name) {',
'          return metricColumns[name] === columnIndex;',
'        });',
'        cell.className = sampleCell.className + '' p143-live-total-cell'';',
'        cell.style.width = sampleCell.getBoundingClientRect().width + ''px'';',
'        cell.style.minWidth = cell.style.width;',
'        cell.style.maxWidth = cell.style.width;',
'        if (columnIndex === 2) {',
'          cell.classList.add(''p143-live-total-title'');',
'          cell.innerHTML = ''<span class="fa fa-calculator" aria-hidden="true"></span><strong>Total</strong><small>Live</small>'';',
'        } else if (metricName) {',
'          cell.classList.add(''p143-live-total-metric'');',
'          if (metricName === ''bill'') { cell.classList.add(''p143-live-total-grand''); }',
'          cell.innerHTML = ''<strong data-p143-total="'' + metricName + ''">0.00</strong>'';',
'        }',
'        line.appendChild(cell);',
'      });',
'    }',
'    if (dockBody.lastElementChild !== line) {',
'      dockBody.appendChild(line);',
'    }',
'    footer = grid.querySelector(''.a-GV-footer'') ||',
'      document.querySelector(''#Detail .p143-relocated-grid-footer'');',
'    if (footer) {',
'      footer.classList.add(''p143-relocated-grid-footer'');',
'      dock.insertAdjacentElement(''afterend'', footer);',
'    }',
'    alignDockToViewport();',
'    return line;',
'  }',
'',
'  function restoreDetailVerticalScroll() {',
'    var scroller = document.querySelector(''#Detail_ig .a-GV-w-scroll'');',
'    if (scroller) {',
'      scroller.style.setProperty(''overflow-x'', ''auto'', ''important'');',
'      scroller.style.setProperty(''overflow-y'', ''auto'', ''important'');',
'    }',
'  }',
'',
'  function currentDetailView() {',
'    try {',
'      return apex.region(''Detail'').widget().interactiveGrid(''getViews'', ''grid'');',
'    } catch (ignore) {',
'      return null;',
'    }',
'  }',
'',
'  function updateTotalLine() {',
'    var line = ensureTotalLine();',
'    var view = currentDetailView();',
'    var qty1 = 0;',
'    var qty2 = 0;',
'    if (!line) { return; }',
'',
'    if (view && view.model) {',
'      view.model.forEach(function (record, index, recordId) {',
'        var metadata = view.model.getRecordMetadata(recordId);',
'        if (metadata && (metadata.deleted || metadata.agg)) { return; }',
'        qty1 += numberValue(view.model.getValue(record, ''QUANTITY1''));',
'        qty2 += numberValue(view.model.getValue(record, ''QUANTITY2''));',
'      });',
'    }',
'',
'    line.querySelector(''[data-p143-total="qty1"]'').textContent = formatNumber(qty1, 3);',
'    line.querySelector(''[data-p143-total="qty2"]'').textContent = formatNumber(qty2, 3);',
'    line.querySelector(''[data-p143-total="amount"]'').textContent = formatNumber(apex.item(''P143_SUMOFAMOUNT'').getValue(), 2);',
'    line.querySelector(''[data-p143-total="footer"]'').textContent = formatNumber(apex.item(''P143_SUMOFFOOTERAMOUNT'').getValue(), 2);',
'    line.querySelector(''[data-p143-total="bill"]'').textContent = formatNumber(apex.item(''P143_PURCHASEBILLAMOUNT'').getValue(), 2);',
'  }',
'',
'  function scheduleTotalUpdate() {',
'    window.clearTimeout(updateTimer);',
'    updateTimer = window.setTimeout(function () {',
'      restoreDetailVerticalScroll();',
'      updateTotalLine();',
'    }, 0);',
'  }',
'',
'  function bindDetailModel() {',
'    var view = currentDetailView();',
'    if (!view || !view.model) {',
'      restoreDetailVerticalScroll();',
'      ensureTotalLine();',
'      return;',
'    }',
'    if (detailModel !== view.model) {',
'      if (detailModel && detailSubscription) {',
'        try { detailModel.unSubscribe(detailSubscription); } catch (ignore) {}',
'      }',
'      detailModel = view.model;',
'      detailSubscription = detailModel.subscribe({',
'        onChange: function () {',
'          scheduleTotalUpdate();',
'          window.setTimeout(scheduleTotalUpdate, 80);',
'        }',
'      });',
'    }',
'    scheduleTotalUpdate();',
'  }',
'',
'  function initialiseDetailPresentation() {',
'    bindDetailModel();',
'    [160, 650, 1350].forEach(function (delay) {',
'      window.setTimeout(function () {',
'        restoreDetailVerticalScroll();',
'        bindDetailModel();',
'      }, delay);',
'    });',
'  }',
'',
'  if (document.readyState === ''loading'') {',
'    document.addEventListener(''DOMContentLoaded'', initialiseDetailPresentation, { once: true });',
'  } else {',
'    initialiseDetailPresentation();',
'  }',
'',
'  document.addEventListener(''apexafterrefresh'', function (event) {',
'    if (event.target && (event.target.id === ''Detail'' ||',
'        (event.target.closest && event.target.closest(''#Detail'')))) {',
'      window.setTimeout(initialiseDetailPresentation, 0);',
'    }',
'  }, true);',
'',
'  document.addEventListener(''click'', function (event) {',
'    if (event.target.closest && event.target.closest(''#tabcontainer .t-Tabs-link'')) {',
'      window.setTimeout(initialiseDetailPresentation, 180);',
'    }',
'  }, true);',
'',
'  if (window.apex && apex.jQuery) {',
'    apex.jQuery(document).on(''change.p143LiveTotal input.p143LiveTotal'',',
'      ''#P143_SUMOFAMOUNT,#P143_SUMOFFOOTERAMOUNT,#P143_PURCHASEBILLAMOUNT'',',
'      scheduleTotalUpdate);',
'  }',
'}());',
'',
'',
'/* HSPL_CROSSFORM_DETAIL_INTEGRITY_V1 */',
'(function(){',
'  "use strict";',
'  if(Number(apex.env.APP_PAGE_ID||0)!==143||window.hsplCrossformDetailIntegrityV1)return;',
'  window.hsplCrossformDetailIntegrityV1=true;',
'  var heldFromDetail=false;',
'  function inDetail(target){return !!(target&&target.closest&&target.closest("#detail,#Detail_ig"));}',
'  document.addEventListener("keydown",function(event){',
'    if(event.key!=="Tab")return;',
'    if(!event.repeat){heldFromDetail=inDetail(event.target);return;}',
'    if(heldFromDetail){event.preventDefault();event.stopImmediatePropagation();}',
'  },true);',
'  document.addEventListener("keyup",function(event){if(event.key==="Tab")heldFromDetail=false;},true);',
'  window.addEventListener("blur",function(){heldFromDetail=false;});',
'  ',
'  window.hsplP143OpenFd=function(anchor){',
'    try{',
'      var model=apex.region("Detail").widget().interactiveGrid("getViews","grid").model;',
'      var row=anchor&&anchor.closest&&anchor.closest("tr"),id=row&&row.getAttribute("data-id"),record=id&&model.getRecord(id);',
'      if(!record)throw new Error("Clicked detail row could not be identified.");',
'      function raw(v){return v&&typeof v==="object"&&"v" in v?v.v:v;}',
'      var sno=raw(model.getValue(record,"SNO")),amount=raw(model.getValue(record,"AMOUNT"));',
'      if(sno===null||sno===undefined||String(sno).trim()==="")throw new Error("Clicked row SNO is blank.");',
'      apex.item("P143_SNO").setValue(sno,null,true);',
'      apex.item("P143_DFAMOUNT").setValue(amount||0,null,true);',
'      GotoP321();',
'    }catch(error){',
'      apex.message.clearErrors();',
'      apex.message.showErrors([{type:"error",location:"page",message:error.message||"FD could not open for the clicked row.",unsafe:false}]);',
'    }',
'  };',
'',
'})();',
'',
''))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#mycss/MyIR (2)#MIN#.css',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* P143_DETAIL_SCROLL_LIVE_TOTAL_V1 */',
'html.page-143 #Detail_ig .a-GV-w-scroll {',
'  overflow-x: auto !important;',
'  overflow-y: auto !important;',
'  scrollbar-gutter: stable;',
'}',
'/* Purchase Bill is a form page; the global register filter trigger does not belong here. */',
'html.page-143 .t-Body-title > .hspl-filter-trigger {',
'  display: none !important;',
'}',
'html.page-143 #Detail .p143-relocated-grid-footer {',
'  display: flex !important;',
'  width: 100%;',
'  margin: 0 0 12px;',
'  border-top: 1px solid #e4e9f2;',
'  border-radius: 0 0 10px 10px;',
'  background: #fff;',
'}',
'html.page-143 #Detail .p143-grid-total-row .p143-live-total-cell {',
'  position: static;',
'  height: 46px;',
'  padding: 6px 6px;',
'  border-top: 0;',
'  border-bottom: 0;',
'  border-right: 1px solid rgba(99,102,241,.15);',
'  background: transparent !important;',
'  box-shadow: none;',
'  color: #172554;',
'  vertical-align: middle;',
'  font-weight: 700;',
'}',
'html.page-143 #Detail .p143-live-total-dock {',
'  position: relative;',
'  z-index: 8;',
'  width: 100%;',
'  height: 46px;',
'  margin: -33px 0 6px;',
'  overflow: hidden;',
'  border-top: 3px solid #6366f1;',
'  border-bottom: 1px solid #c7d2fe;',
'  background: linear-gradient(180deg,#eef2ff 0%,#e4eaff 100%);',
'  box-shadow: 0 -10px 24px rgba(30,64,175,.16), inset 0 1px 0 rgba(255,255,255,.9);',
'  border-radius: 12px;',
'}',
'html.page-143 #Detail .p143-live-total-dock-scroll { width: 100%; height: 46px; overflow: hidden; }',
'html.page-143 #Detail .p143-live-total-table { height: 46px; table-layout: fixed; border-collapse: separate; border-spacing: 0; }',
'html.page-143 #Detail .p143-grid-total-row .p143-live-total-title {',
'  color: #3347c8;',
'  background: linear-gradient(135deg,#eef4ff,#fff);',
'  white-space: nowrap;',
'}',
'html.page-143 #Detail .p143-grid-total-row .p143-live-total-title .fa { margin-right: 7px; font-size: 16px; }',
'html.page-143 #Detail .p143-grid-total-row .p143-live-total-title small {',
'  margin-left: 8px;',
'  padding: 2px 7px;',
'  border-radius: 999px;',
'  background: #e8f7ef;',
'  color: #16815d;',
'  font-size: 10px;',
'  font-weight: 700;',
'  letter-spacing: .06em;',
'  text-transform: uppercase;',
'}',
'html.page-143 #Detail .p143-grid-total-row .p143-live-total-metric { text-align: right; }',
'html.page-143 #Detail .p143-grid-total-row .p143-live-total-metric strong {',
'  color: #172554;',
'  font-size: 12px;',
'  font-variant-numeric: tabular-nums;',
'  white-space: nowrap;',
'}',
'html.page-143 #Detail .p143-grid-total-row .p143-live-total-grand {',
'  background: linear-gradient(135deg,#eef2ff,#f8faff);',
'}',
'html.page-143 #Detail .p143-grid-total-row .p143-live-total-grand strong { color: #4f46e5; font-size: 13px; }'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1339747377681970406)
,p_plug_name=>'Attachment'
,p_static_id=>'attachment'
,p_parent_plug_id=>wwv_flow_imp.id(596723559562907762)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.TNO,',
'       --A.SNO,',
'       --DESCRIPTION,',
'       A.ATTRIBUTEVALUE,',
'       A.ATTACHMENTBLOB,',
'       A.FILENAME,',
'       A.ATTRIBUTECODE,',
'       A.MODULETNO,',
'       A.MODULESNO,',
'       b.PARTYATTRIBUTEname',
'  from MODULEATTACHMENT A , partyattribute b',
'  WHERE A.MODULETNO = :P143_TNO',
'  and a.ATTRIBUTECODE = b.PARTYATTRIBUTECODE'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P143_TNO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Attachment'
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
 p_id=>wwv_flow_imp.id(1339748122256970414)
,p_max_row_count=>'1000000'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>400
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:1063:&SESSION.::&DEBUG.:1063:P1063_MODULETNO,P1063_ATTRIBUTECODE,P1063_MODULESNO,P1063_PARENT_FORMSTATUS:#MODULETNO#,#ATTRIBUTECODE#,#MODULESNO#&P143_FORMSTATUS.#SNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>899361777006043890
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1339748691742970419)
,p_db_column_name=>'ATTACHMENTBLOB'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Attachmentblob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1059364103461840727)
,p_db_column_name=>'ATTRIBUTECODE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Attributecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1186962977984785102)
,p_db_column_name=>'ATTRIBUTEVALUE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Attribute Value'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1339748762982970420)
,p_db_column_name=>'FILENAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Filename'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(907494892732155219)
,p_db_column_name=>'MODULESNO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Modulesno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(906100617398024168)
,p_db_column_name=>'MODULETNO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Moduletno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(502723189565667395)
,p_db_column_name=>'PARTYATTRIBUTENAME'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Attribute name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1339748281559970415)
,p_db_column_name=>'TNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1342393711654945868)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'371612'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PARTYATTRIBUTENAME:ATTRIBUTEVALUE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(602764497505017069)
,p_plug_name=>'Bill Details'
,p_static_id=>'bill-details'
,p_parent_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(895529906386569378)
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
 p_id=>wwv_flow_imp.id(1262928437104653924)
,p_plug_name=>'Common Fields'
,p_static_id=>'common-fields'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>30
,p_plug_display_point=>'AFTER_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(602764580134017070)
,p_plug_name=>'Currency'
,p_static_id=>'currency'
,p_parent_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(596723855758907765)
,p_plug_name=>'Detail'
,p_static_id=>'detail'
,p_region_name=>'Detail'
,p_parent_plug_id=>wwv_flow_imp.id(596723559562907762)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid , TNO,',
'       SNO,',
'       SERIALNO,',
'       PURCHASEORDERTNO,',
'       ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       DESCRIPTION,',
'       QUANTITY1,',
'       QUANTITY2,',
'       RATEMEASURINGUNITCODE,',
'       RATE,',
'       AMOUNT,',
'       FOOTERAMOUNT,',
'       TOTALAMOUNT,',
'       DOCUMENTSTATUSCODE,',
'       REMARK,',
'       OURRG23DNO,',
'       PARTYRG23DNO,',
'       ROUNDING,',
'       FOOTERAMOUNTWITHRATE,',
'       JOBORDERTNO,',
'       TAXRULECODE,',
'       PRORATA,',
'       QUALITYCODE,',
'       ''GRN'' as GRN,',
'       ''FD'' as FD,',
'       GetMeasuringUnit2NameFromItem(itemcode) as unit2,',
'       (SELECT PURCHASEORDERNO FROM PURCHASEORDER WHERE TNO = PURCHASEORDERTNO) as PURCHASEORDERNO',
'',
'  from PURCHASEBILLDETAIL',
'  where tno = :P143_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P143_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Detail'
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
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(600744460238249254)
,p_heading=>'Material'
,p_static_id=>'material'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(600744621640249255)
,p_heading=>'Primary'
,p_static_id=>'primary'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(600744733800249256)
,p_heading=>'Prorata'
,p_static_id=>'prorata'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(600744832875249257)
,p_heading=>'Secondary'
,p_static_id=>'secondary'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600741917011249228)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
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
 p_id=>wwv_flow_imp.id(600743278182249242)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600743392639249243)
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
 p_id=>wwv_flow_imp.id(596724710459907773)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(600744460238249254)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readOnly=true'
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
 p_id=>wwv_flow_imp.id(600742149207249231)
,p_name=>'DOCUMENTSTATUSCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCUMENTSTATUSCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
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
 p_id=>wwv_flow_imp.id(600744974025249259)
,p_name=>'FD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Fd'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>310
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:321:&SESSION.::&DEBUG.:Y,:P321_TNO,P321_SNO,P321_DFAMOUNT,P321_DFTOTALAMOUNT,P321_FVALUE:&TNO.,&SNO.,&AMOUNT.,&P143_DFTOTALAMOUNT.,&P143_FVALUE.'
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
,p_default_expression=>'<a href="javascript:hsplP143OpenFd(this)"><class="t-Button t-Button--simple t-Button--hot t-Button--stretch"><span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">FD</span></a>'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600741995781249229)
,p_name=>'FOOTERAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'FOOTERAMOUNT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600742663462249236)
,p_name=>'FOOTERAMOUNTWITHRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERAMOUNTWITHRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Amount With Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>240
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
 p_id=>wwv_flow_imp.id(600744938430249258)
,p_name=>'GRN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GRN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Grn'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>300
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript:openModal(''GRN'')'
,p_link_text=>'&GRN.'
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
,p_default_expression=>'<a href="javascript:openModal(''GRN'')"><span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">GRN</span></a>'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(596724480409907771)
,p_name=>'ITEMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(600744460238249254)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select itemname , itemcode from item'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_static_id=>'ITEMCODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(596724604742907772)
,p_name=>'ITEMSPECIFICATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Specification'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(600744460238249254)
,p_use_group_for=>'BOTH'
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
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ITEMSPECIFICATIONNAME , ITEMSPECIFICATIONCODE',
'from itemspecification',
'where tno in (select tno from item where itemcode = :ITEMCODE )'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ITEMCODE'
,p_ajax_items_to_submit=>'ITEMCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600742753769249237)
,p_name=>'JOBORDERTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOBORDERTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Jobordertno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>250
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
 p_id=>wwv_flow_imp.id(600742410887249233)
,p_name=>'OURRG23DNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OURRG23DNO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ourrg23dno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
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
 p_id=>wwv_flow_imp.id(600742502584249234)
,p_name=>'PARTYRG23DNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYRG23DNO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Partyrg23dno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
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
 p_id=>wwv_flow_imp.id(600743005830249239)
,p_name=>'PRORATA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRORATA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Prorata'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>270
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(600744733800249256)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_imp.id(58361940717166422)
,p_name=>'PURCHASEORDERNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEORDERNO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Purchase Order No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=true'
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
 p_id=>wwv_flow_imp.id(596724376860907770)
,p_name=>'PURCHASEORDERTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEORDERTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Purchase Order TNo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
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
 p_id=>wwv_flow_imp.id(600743077194249240)
,p_name=>'QUALITYCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Quality'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(600744733800249256)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_imp.id(596724770201907774)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Qty1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(600744621640249255)
,p_use_group_for=>'BOTH'
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600741619976249225)
,p_name=>'QUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Qty2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(600744832875249257)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
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
 p_id=>wwv_flow_imp.id(600741828487249227)
,p_name=>'RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
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
 p_id=>wwv_flow_imp.id(600741721567249226)
,p_name=>'RATEMEASURINGUNITCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATEMEASURINGUNITCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
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
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select measuringunitname , measuringunitcode',
'from measuringunit',
'where measuringunitcode in (select measuringunitcode1 from item where itemcode = :ITEMCODE)',
'union all',
'select measuringunitname , measuringunitcode',
'from measuringunit',
'where measuringunitcode in (select measuringunitcode2 from item where itemcode = :ITEMCODE)'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ITEMCODE'
,p_ajax_items_to_submit=>'ITEMCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600742339757249232)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
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
,p_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600742626370249235)
,p_name=>'ROUNDING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROUNDING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rounding'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>230
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
 p_id=>wwv_flow_imp.id(600743227298249241)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(596724264291907769)
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
 p_id=>wwv_flow_imp.id(596724241631907768)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_static_id=>'SNO'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600742927069249238)
,p_name=>'TAXRULECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAXRULECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Taxrulecode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>260
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
 p_id=>wwv_flow_imp.id(596724125619907767)
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
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P143_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600742073552249230)
,p_name=>'TOTALAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTALAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'TOTALAMOUNT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(461546501178383504)
,p_name=>'UNIT2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>320
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(600744832875249257)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(596723988285907766)
,p_internal_uid=>156337643034981242
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
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>400
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    //Tab and Shift-Tab will skip over cells that are read-only',
'    options.defaultGridViewOptions = {  ',
'        skipReadonlyCells: true  ',
'    };',
'    return options;',
'}'))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(600747208769255082)
,p_interactive_grid_id=>wwv_flow_imp.id(596723988285907766)
,p_static_id=>'1603609'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(600747435132255084)
,p_report_id=>wwv_flow_imp.id(600747208769255082)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(17468035495240096)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(58361940717166422)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>190.969
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(461886246831741600)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(461546501178383504)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>61
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600747867696255088)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(596724125619907767)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600748814099255092)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(596724241631907768)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600749699330255094)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(596724264291907769)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600750644746255096)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(596724376860907770)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>251
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600751501956255098)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(596724480409907771)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>193
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600752436288255100)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(596724604742907772)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>248
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600753312003255102)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(596724710459907773)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>126
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600754163105255104)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(596724770201907774)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600755059714255106)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(600741619976249225)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>73
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600755998720255113)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(600741721567249226)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>56
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600756903672255115)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(600741828487249227)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600757840110255117)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(600741917011249228)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600758690861255127)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(600741995781249229)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600759601391255129)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(600742073552249230)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600760518255255132)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(600742149207249231)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>59
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600761401916255134)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(600742339757249232)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600762277507255136)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(600742410887249233)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600763180436255138)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(600742502584249234)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600764107401255143)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(600742626370249235)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600765022066255147)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(600742663462249236)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600765899492255149)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(600742753769249237)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600766752979255151)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(600742927069249238)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600767740168255153)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(600743005830249239)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600768547718255155)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(600743077194249240)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600769537501255157)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(600743227298249241)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600771190864256119)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(600743278182249242)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600798328083408705)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(600744938430249258)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>73
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600799241241408707)
,p_view_id=>wwv_flow_imp.id(600747435132255084)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(600744974025249259)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600745117815249260)
,p_plug_name=>'DetailFooter'
,p_static_id=>'detailfooter'
,p_region_name=>'DetailFooter'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       SERIALNO,',
'       FOOTERHEADCODE,',
'       FOOTERPERCENT,',
'       FOOTERVALUE,',
'       TAXFORMCODE,',
'       INCLUDEDINRATE,',
'       INCLUDEDWITHRATE,',
'       LEGENDSCODE,',
'       SN',
'  from PURCHASEBILLDETAILFOOTER',
'  where tno = :P143_TNO',
'  and sno = :P143_SNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(596723855758907765)
,p_ajax_items_to_submit=>'P143_TNO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'DetailFooter'
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
 p_id=>wwv_flow_imp.id(600871165465726240)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600871342298726241)
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
 p_id=>wwv_flow_imp.id(600745700308249266)
,p_name=>'FOOTERHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Footer Head'
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
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'a.FOOTERHEADNAME,',
'a.FOOTERHEADCODE',
'FROM FOOTERHEAD a'))
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600745801141249267)
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
 p_id=>wwv_flow_imp.id(600745890638249268)
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
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}',
''))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600746048987249270)
,p_name=>'INCLUDEDINRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INCLUDEDINRATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Includedinrate'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>3
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
 p_id=>wwv_flow_imp.id(600746146149249271)
,p_name=>'INCLUDEDWITHRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INCLUDEDWITHRATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Includedwithrate'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>3
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
 p_id=>wwv_flow_imp.id(600746328838249272)
,p_name=>'LEGENDSCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LEGENDSCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Legends'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(608103493650164442)
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600745321716249262)
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
 p_id=>wwv_flow_imp.id(600745621421249265)
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
 p_id=>wwv_flow_imp.id(600746431950249273)
,p_name=>'SN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sn'
,p_heading_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(600745491778249264)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
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
,p_parent_column_id=>wwv_flow_imp.id(596724241631907768)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600746010731249269)
,p_name=>'TAXFORMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAXFORMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Taxformcode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
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
 p_id=>wwv_flow_imp.id(600745384799249263)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
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
,p_default_type=>'ITEM'
,p_default_expression=>'P143_TNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(600745210806249261)
,p_internal_uid=>160358865555322737
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
'function( options ) {',
'    //Tab and Shift-Tab will skip over cells that are read-only',
'    options.defaultGridViewOptions = {  ',
'        skipReadonlyCells: true  ',
'        ',
'    }',
'    return options;',
'}'))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(600801075324436321)
,p_interactive_grid_id=>wwv_flow_imp.id(600745210806249261)
,p_static_id=>'1604148'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(600801333854436321)
,p_report_id=>wwv_flow_imp.id(600801075324436321)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600801791851436322)
,p_view_id=>wwv_flow_imp.id(600801333854436321)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(600745321716249262)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600802657745436324)
,p_view_id=>wwv_flow_imp.id(600801333854436321)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(600745384799249263)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600803607709436327)
,p_view_id=>wwv_flow_imp.id(600801333854436321)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(600745491778249264)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600804454581436333)
,p_view_id=>wwv_flow_imp.id(600801333854436321)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(600745621421249265)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600805396915436335)
,p_view_id=>wwv_flow_imp.id(600801333854436321)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(600745700308249266)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600806251355436338)
,p_view_id=>wwv_flow_imp.id(600801333854436321)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(600745801141249267)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600807226599436342)
,p_view_id=>wwv_flow_imp.id(600801333854436321)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(600745890638249268)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600808091056436344)
,p_view_id=>wwv_flow_imp.id(600801333854436321)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(600746010731249269)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600809041683436347)
,p_view_id=>wwv_flow_imp.id(600801333854436321)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(600746048987249270)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600809932703436349)
,p_view_id=>wwv_flow_imp.id(600801333854436321)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(600746146149249271)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600810838106436352)
,p_view_id=>wwv_flow_imp.id(600801333854436321)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(600746328838249272)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600811723539436354)
,p_view_id=>wwv_flow_imp.id(600801333854436321)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(600746431950249273)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(601246796844391832)
,p_view_id=>wwv_flow_imp.id(600801333854436321)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(600871165465726240)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600814310547447241)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_parent_plug_id=>wwv_flow_imp.id(600814069625447239)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600581388345171811)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_region_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(596723559562907762)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       COMPANYCODE,',
'       FINANCIALYEARCODE,',
'       LOCATIONCODE,',
'       DOCTYPECODE,',
'       PURCHASEBILLNO,',
'       PURCHASEBILLDATE,',
'       PARTYBILLNO,',
'       PARTYBILLDATE,',
'       PURCHASEORDERTNO,',
'       CURRENCYUNITCODE,',
'       CURRENCYVALUE,',
'       PARTYCODE,',
'       SUMOFAMOUNT,',
'       SUMOFFOOTERAMOUNT,',
'       PURCHASEBILLAMOUNT,',
'       REMARK,',
'       ITEMWISEFOOTER,',
'       SUPPLIERCODE,',
'       MANUFACTURERCODE,',
'       SUMOFFOOTERAMOUNTWITHRATE,',
'       JOBORDERTNO,',
'       DELIVERYORDERTNO,',
'       RAKETNO,',
'       CREATOR,',
'       BILLEDON,',
'       EXCISEBILLNO,',
'       EXCISEBILLDATE,',
'       BILLEDITEM,',
'       UPDATELANDINGIFSUPPLEMENTARY,',
'       TRANCTIONTYPECODE,',
'       TRANSACTIONTYPECODE,',
'       NATUREOFSUPPLYCODE,',
'       PORTCODE,',
'       BILLOFENTRYTNO,',
'       CREATIONTIME,',
'       FREIGHTADVANCEAMOUNT,',
'       TAXINROUND,',
'       billinroundfigure,',
'       purchasebillamountbeforeround,',
'       roundoff',
'  from PURCHASEBILL'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(602764268318017067)
,p_plug_name=>'General'
,p_static_id=>'general-2'
,p_region_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600746501858249274)
,p_plug_name=>'GRN'
,p_static_id=>'grn'
,p_region_name=>'GRN'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.ROWID,',
'       a.GRNTNO,',
'       a.SNO,',
'       a.TNO,',
'       a.GRNSNO,',
'       a.DOCTYPECODE,',
'       b.acceptedquantity1,',
'       b.receivedquantity1,',
'       b.chalanquantity1,',
'       b.rejectedquantity1',
'  from PURCHASEBILLGRNDETAIL a , grndetail b',
'  where a.tno = :P143_TNO',
'  and a.sno = :P143_SNO',
'  and a.grntno = b.tno ',
'  and a.grnsno = b.sno '))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(596723855758907765)
,p_ajax_items_to_submit=>'P143_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'GRN'
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
 p_id=>wwv_flow_imp.id(607086884665783526)
,p_name=>'ACCEPTEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCEPTEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Acceptedquantity1'
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
 p_id=>wwv_flow_imp.id(600871725917726245)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600871804222726246)
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
 p_id=>wwv_flow_imp.id(607087080981783528)
,p_name=>'CHALANQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHALANQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Chalanquantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(600813286784447231)
,p_name=>'DOCTYPECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCTYPECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Doctypecode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(600813173228447230)
,p_name=>'GRNSNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GRNSNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Grnsno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(600812916558447227)
,p_name=>'GRNTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GRNTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Grn No'
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
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select grnno , tno from grn'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(607087022083783527)
,p_name=>'RECEIVEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIVEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Receivedquantity1'
,p_heading_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(607087145391783529)
,p_name=>'REJECTEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REJECTEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rejectedquantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(600812746526447226)
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
 p_id=>wwv_flow_imp.id(600812997151447228)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(596724241631907768)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600813130982447229)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
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
,p_default_type=>'ITEM'
,p_default_expression=>'P143_TNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(600812725623447225)
,p_internal_uid=>160426380372520701
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
 p_id=>wwv_flow_imp.id(600818315403454837)
,p_interactive_grid_id=>wwv_flow_imp.id(600812725623447225)
,p_static_id=>'1604320'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(600818539509454837)
,p_report_id=>wwv_flow_imp.id(600818315403454837)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600819035578454839)
,p_view_id=>wwv_flow_imp.id(600818539509454837)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(600812746526447226)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600819848088454842)
,p_view_id=>wwv_flow_imp.id(600818539509454837)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(600812916558447227)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>188.986
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600820752240454845)
,p_view_id=>wwv_flow_imp.id(600818539509454837)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(600812997151447228)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600821707171454848)
,p_view_id=>wwv_flow_imp.id(600818539509454837)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(600813130982447229)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600822581233454850)
,p_view_id=>wwv_flow_imp.id(600818539509454837)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(600813173228447230)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600823511784454852)
,p_view_id=>wwv_flow_imp.id(600818539509454837)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(600813286784447231)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(601254633638401899)
,p_view_id=>wwv_flow_imp.id(600818539509454837)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(600871725917726245)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(607103631188003789)
,p_view_id=>wwv_flow_imp.id(600818539509454837)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(607086884665783526)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(607104503750003793)
,p_view_id=>wwv_flow_imp.id(600818539509454837)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(607087022083783527)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(607105441042003795)
,p_view_id=>wwv_flow_imp.id(600818539509454837)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(607087080981783528)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(607107561179018471)
,p_view_id=>wwv_flow_imp.id(600818539509454837)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(607087145391783529)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600814069625447239)
,p_plug_name=>'GrnSelection'
,p_static_id=>'grnselection'
,p_region_name=>'GRNSelection'
,p_region_css_classes=>'js-dialog-size1400x750'
,p_region_template_options=>'#DEFAULT#:js-dialog-nosize'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600815198305447250)
,p_plug_name=>'GRNSelection1'
,p_static_id=>'grnselection-2'
,p_region_name=>'GRNSelection1'
,p_parent_plug_id=>wwv_flow_imp.id(600814069625447239)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       a.TNO,',
'       a.PURCHASEBILLTNO,',
'       a.PURCHASEORDERTNO,',
'       a.ISSELECTED,',
'       a.GRNTNO,',
'       a.GRNSNO,',
'       '' '' as PartyRefNo,',
'       b.ITEMCODE as Material,',
'       b.ITEMSPECIFICATIONCODE AS MATERIAL_DETAIL,',
'       b.RATEMEASURINGUNITCODE as Unit,',
'       b.CHALANQUANTITY1 as ChalanQty,',
'       b.RECEIVEDQUANTITY1 as Received,',
'       b.RECEIVEDQUANTITY1 as Accepted',
'  from GRNSELECTION_apex a, grndetail b ',
'  where a.tno = :P143_TNO',
'  and a.grntno = b.tno',
'  and a.GRNSNO = b.sno'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P143_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'GRNSelection1'
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
 p_id=>wwv_flow_imp.id(601382085701650826)
,p_name=>'ACCEPTED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCEPTED'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Accepted Qty'
,p_heading_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(600816475839447263)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600816580349447264)
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
 p_id=>wwv_flow_imp.id(600874636799726274)
,p_name=>'CHALANQTY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHALANQTY'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Chalan Qty'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(600815753115447256)
,p_name=>'GRNSNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GRNSNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Grnsno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600815695129447255)
,p_name=>'GRNTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GRNTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'GRN'
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
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select grnno , tno from grn'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600815621655447254)
,p_name=>'ISSELECTED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ISSELECTED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Isselected'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>3
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
 p_id=>wwv_flow_imp.id(600874368325726272)
,p_name=>'MATERIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MATERIAL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Material'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
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
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select itemname , itemcode from item'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(59189436953493265)
,p_name=>'MATERIAL_DETAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MATERIAL_DETAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Material Detail'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
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
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select itemSpecificationname , itemSpecificationcode from itemSpecification'
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
 p_id=>wwv_flow_imp.id(600874287069726271)
,p_name=>'PARTYREFNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYREFNO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party Ref No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1
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
 p_id=>wwv_flow_imp.id(600815491315447253)
,p_name=>'PURCHASEBILLTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEBILLTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Purchasebilltno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
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
 p_id=>wwv_flow_imp.id(55452722766090931)
,p_name=>'PURCHASEORDERTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEORDERTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Purchase Order No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'SELECT PURCHASEORDERNO, TNO FROM PURCHASEORDER '
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
 p_id=>wwv_flow_imp.id(601381970234650825)
,p_name=>'RECEIVED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIVED'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Received Qty'
,p_heading_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(600815422616447252)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>30
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
 p_id=>wwv_flow_imp.id(600874514072726273)
,p_name=>'UNIT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
,p_max_length=>10
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select MEASURINGUNITNAME , MEASURINGUNITCODE from measuringunit'
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
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(600815292816447251)
,p_internal_uid=>160428947565520727
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
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>200
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(600834800733507800)
,p_interactive_grid_id=>wwv_flow_imp.id(600815292816447251)
,p_static_id=>'1604485'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(600834950927507800)
,p_report_id=>wwv_flow_imp.id(600834800733507800)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(55821413403954713)
,p_view_id=>wwv_flow_imp.id(600834950927507800)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(55452722766090931)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>186.422
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(59469569166749278)
,p_view_id=>wwv_flow_imp.id(600834950927507800)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(59189436953493265)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>240
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600835463515507801)
,p_view_id=>wwv_flow_imp.id(600834950927507800)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(600815422616447252)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600836383480507803)
,p_view_id=>wwv_flow_imp.id(600834950927507800)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(600815491315447253)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600837267577507805)
,p_view_id=>wwv_flow_imp.id(600834950927507800)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(600815621655447254)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600838215276507807)
,p_view_id=>wwv_flow_imp.id(600834950927507800)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(600815695129447255)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>189.422
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600839051013507809)
,p_view_id=>wwv_flow_imp.id(600834950927507800)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(600815753115447256)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600845413867507828)
,p_view_id=>wwv_flow_imp.id(600834950927507800)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(600816475839447263)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(601388042633651187)
,p_view_id=>wwv_flow_imp.id(600834950927507800)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(600874287069726271)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(601388872972651190)
,p_view_id=>wwv_flow_imp.id(600834950927507800)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(600874368325726272)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(601389841934651193)
,p_view_id=>wwv_flow_imp.id(600834950927507800)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(600874514072726273)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>68
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(601390672411651196)
,p_view_id=>wwv_flow_imp.id(600834950927507800)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(600874636799726274)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115.422
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(601391599047651199)
,p_view_id=>wwv_flow_imp.id(600834950927507800)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(601381970234650825)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101.422
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(601392528469651201)
,p_view_id=>wwv_flow_imp.id(600834950927507800)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(601382085701650826)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110.469
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(596723559562907762)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_name=>'tabcontainer'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(602764421364017068)
,p_plug_name=>'Party Details'
,p_static_id=>'party-details'
,p_parent_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(447056177071861603)
,p_plug_name=>'Purchase Bill Pass Reference'
,p_static_id=>'purchase-bill-pass-reference'
,p_parent_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(602764701262017071)
,p_plug_name=>'Purchase Order'
,p_static_id=>'purchase-order'
,p_parent_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(602764909014017073)
,p_plug_name=>'Remark'
,p_static_id=>'remark'
,p_region_name=>'remark'
,p_parent_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(447354910990243096)
,p_plug_name=>'Summary'
,p_static_id=>'summary'
,p_parent_plug_id=>wwv_flow_imp.id(596723855758907765)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_column=>7
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600813358654447232)
,p_plug_name=>'Terms & Conditions'
,p_static_id=>'terms-conditions'
,p_region_name=>'TAC'
,p_parent_plug_id=>wwv_flow_imp.id(596723559562907762)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       TERMSANDCONDITIONHEADCODE,',
'       TERMSANDCONDITION',
'  from PURCHASEBILLTAC',
'  where tno = :P143_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(596723855758907765)
,p_ajax_items_to_submit=>'P143_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Terms & Conditions'
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
 p_id=>wwv_flow_imp.id(601382800800650833)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(601382937228650834)
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
 p_id=>wwv_flow_imp.id(600814006627447238)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600813742705447235)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(600813930181447237)
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
  'manual_entry', 'Y',
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
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'TERMSANDCONDITIONHEADCODE'
,p_ajax_items_to_submit=>'TERMSANDCONDITIONHEADCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600813763701447236)
,p_name=>'TERMSANDCONDITIONHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TERMSANDCONDITIONHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Terms And Condition Head'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
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
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_static_id=>'TERMSANDCONDITIONHEADCODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600813590508447234)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'tno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
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
,p_parent_column_id=>wwv_flow_imp.id(596724125619907767)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(600813480219447233)
,p_internal_uid=>160427134968520709
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
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_imp.id(600824850566462399)
,p_interactive_grid_id=>wwv_flow_imp.id(600813480219447233)
,p_static_id=>'1604386'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(600825106682462399)
,p_report_id=>wwv_flow_imp.id(600824850566462399)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600825590406462400)
,p_view_id=>wwv_flow_imp.id(600825106682462399)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(600813590508447234)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600826462084462403)
,p_view_id=>wwv_flow_imp.id(600825106682462399)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(600813742705447235)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600827435226462405)
,p_view_id=>wwv_flow_imp.id(600825106682462399)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(600813763701447236)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>463.323
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600828254618462407)
,p_view_id=>wwv_flow_imp.id(600825106682462399)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(600813930181447237)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600829203739462408)
,p_view_id=>wwv_flow_imp.id(600825106682462399)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(600814006627447238)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(601552756770357375)
,p_view_id=>wwv_flow_imp.id(600825106682462399)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(601382800800650833)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(602764829912017072)
,p_plug_name=>'Transaction And Nature'
,p_static_id=>'transaction-and-nature'
,p_parent_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(302136195944040309)
,p_button_sequence=>410
,p_button_plug_id=>wwv_flow_imp.id(895529906386569378)
,p_button_name=>'AddNew'
,p_static_id=>'addnew'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pillEnd'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.::'
,p_confirm_message=>'Want to Add New Record?'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600850946469545126)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1339747377681970406)
,p_button_name=>'ADDNEW_1'
,p_static_id=>'addnew-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'ADD NEW'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1063:&SESSION.::&DEBUG.:1063:P1063_MODULETNO:&P143_TNO.'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600817123858447269)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(600745117815249260)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600652847151768297)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(895529906386569378)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600815100794447249)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(600815198305447250)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600654083656768300)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(895529906386569378)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P143_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600653284781768299)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(895529906386569378)
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
,p_button_condition=>'P143_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600655317210768300)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(895529906386569378)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P143_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600655698347768300)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(895529906386569378)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P71_TNO.'
,p_button_condition=>'P143_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(188128736366893946)
,p_button_sequence=>420
,p_button_plug_id=>wwv_flow_imp.id(600813358654447232)
,p_button_name=>'GetDefault'
,p_static_id=>'getdefault'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get Default'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600817293418447271)
,p_button_sequence=>400
,p_button_plug_id=>wwv_flow_imp.id(596723855758907765)
,p_button_name=>'GetItem'
,p_static_id=>'getitem'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get Item'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600815039149447248)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(600814310547447241)
,p_button_name=>'GetRecode'
,p_static_id=>'getrecode'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get Record'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(499165754897520309)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(600746501858249274)
,p_button_name=>'GRNBack'
,p_static_id=>'grnback'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600817223067447270)
,p_button_sequence=>390
,p_button_plug_id=>wwv_flow_imp.id(596723855758907765)
,p_button_name=>'GRNDetail'
,p_static_id=>'grndetail'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Grn Detail'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600654900048768300)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(895529906386569378)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_static_id=>'PASS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P143_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600654526544768300)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(895529906386569378)
,p_button_name=>'PRINT_1'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P143_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600653700805768300)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(895529906386569378)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P143_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600656099287768300)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(895529906386569378)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P143_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P143_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(600609391977171831)
,p_branch_name=>'Go To Page 142'
,p_branch_action=>'f?p=&APP_ID.:142:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(600653284781768299)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(452830326008858185)
,p_name=>'P143_ALLOWEDBACK'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(1262928437104653924)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(452830594673860722)
,p_name=>'P143_ALLOWEDFORWARD'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(1262928437104653924)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600592958396171821)
,p_name=>'P143_BILLEDITEM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(602764497505017069)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_default=>'SUPPLIED'
,p_source=>'BILLEDITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600591815674171820)
,p_name=>'P143_BILLEDON'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(602764497505017069)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_default=>'CHALLAN'
,p_prompt=>'Billed On'
,p_source=>'BILLEDON'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:CHALLAN;CHALLAN,RECEIVED;RECEIVED'
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(55452857076090932)
,p_name=>'P143_BILLING_TYPE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(602764421364017068)
,p_prompt=>'Billing Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Challan;CHALLAN,Bill;BILL'
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(196094827515362577)
,p_name=>'P143_BILLINROUNDFIGURE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(602764497505017069)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_prompt=>'Bill In Round Figure'
,p_source=>'BILLINROUNDFIGURE'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Yes;YES,No;NO'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600595395275171823)
,p_name=>'P143_BILLOFENTRYTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(602764497505017069)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_source=>'BILLOFENTRYTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1349321148723895900)
,p_name=>'P143_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1262928437104653924)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1290702803507627508)
,p_name=>'P143_CALLEDFROMPAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1262928437104653924)
,p_item_default=>'142'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(608140170359356466)
,p_name=>'P143_CALLEDFROMTNO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1262928437104653924)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600814607023447244)
,p_name=>'P143_CHFROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(600814310547447241)
,p_prompt=>'Ch. From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600814714930447245)
,p_name=>'P143_CHTODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(600814310547447241)
,p_prompt=>'Ch. To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600582178028171814)
,p_name=>'P143_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600595755537171823)
,p_name=>'P143_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_default=>'GLOBAL_SYSDATE'
,p_item_default_type=>'ITEM'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600591432022171820)
,p_name=>'P143_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600585762863171816)
,p_name=>'P143_CURRENCYUNITCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(602764580134017070)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_default=>'1'
,p_prompt=>'Currency Unit'
,p_source=>'CURRENCYUNITCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CURRENCYUNITNAME , CURRENCYUNITCODE from currencyunit',
'where getdocumentstatuscode(''CURRENCYUNIT'',TNO) = ''ACTIVE'''))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(600586236985171816)
,p_name=>'P143_CURRENCYVALUE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(602764580134017070)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_prompt=>'Value'
,p_source=>'CURRENCYVALUE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>37
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600590553891171820)
,p_name=>'P143_DELIVERYORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_source=>'DELIVERYORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600816823175447266)
,p_name=>'P143_DFAMOUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(600745117815249260)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294284825552767362)
,p_name=>'P143_DFQUANTITY1'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(596723855758907765)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600816900758447267)
,p_name=>'P143_DFTOTALAMOUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(600745117815249260)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600583422009171815)
,p_name=>'P143_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(602764268318017067)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_prompt=>'Doc Type'
,p_source=>'DOCTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	a.DocTypeName as d,',
'	a.DocTypeCode as r',
'from DocType a, ModuleDocTypeDetail b , ModuleDocType c, Module d',
'where a.DocTypeCode = b.DocTypeCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = d.ModuleCode',
'    and c.CompanyCode = :global_CompanyCode',
'    and d.EntryPageNo = :APP_PAGE_ID'))
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(600592596718171820)
,p_name=>'P143_EXCISEBILLDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_source=>'EXCISEBILLDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600592244781171820)
,p_name=>'P143_EXCISEBILLNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_source=>'EXCISEBILLNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600582589886171815)
,p_name=>'P143_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1290702717028627507)
,p_name=>'P143_FORMSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1262928437104653924)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'begin',
'If :P143_TNO is null then',
'    return(''NEWRECORD'');',
'else',
'    return(''EDITRECORD'');',
'End if;',
'end ;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600596185090171823)
,p_name=>'P143_FREIGHTADVANCEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_source=>'FREIGHTADVANCEAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600814432565447242)
,p_name=>'P143_FROMDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(600814310547447241)
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600816997798447268)
,p_name=>'P143_FVALUE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(600745117815249260)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294284950210767363)
,p_name=>'P143_HSNCODE'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(596723855758907765)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600588565483171819)
,p_name=>'P143_ITEMWISEFOOTER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_source=>'ITEMWISEFOOTER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600590219798171820)
,p_name=>'P143_JOBORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_source=>'JOBORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600583008471171815)
,p_name=>'P143_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(602764268318017067)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_default=>'RC'
,p_prompt=>'Location'
,p_source=>'LOCATIONCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	a.LocationName as d,',
'	a.LocationCode as r',
'from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
'where a.LocationCode = b.LocationCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = d.ModuleCode ',
'	and c.CompanyCode = :global_CompanyCode',
'    and d.EntryPageNo = :APP_PAGE_ID'))
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(600589359980171819)
,p_name=>'P143_MANUFACTURERCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_source=>'MANUFACTURERCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600814785918447246)
,p_name=>'P143_MATERIAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(600814310547447241)
,p_prompt=>'Material'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select itemname , itemcode from item'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(1290698999711627470)
,p_name=>'P143_MODULEFLOW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1262928437104653924)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600594573373171822)
,p_name=>'P143_NATUREOFSUPPLYCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(602764829912017072)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_default=>'1'
,p_prompt=>'Nature Of Supply'
,p_source=>'NATUREOFSUPPLYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NATUREOFSUPPLYNAME , NATUREOFSUPPLYCODE from natureofsupply',
'where getdocumentstatuscode(''NATUREOFSUPPLY'',TNO) = ''ACTIVE''',
''))
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(1290107220607356204)
,p_name=>'P143_ONTHETABLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1262928437104653924)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600584948999171816)
,p_name=>'P143_PARTYBILLDATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(602764421364017068)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_prompt=>'Party Bill Date'
,p_source=>'PARTYBILLDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P143_PARTYBILLDATE',
  'min_date', 'ITEM',
  'min_item', 'P143_PARTYBILLDATE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600584638614171816)
,p_name=>'P143_PARTYBILLNO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(602764421364017068)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_prompt=>'Party Bill No'
,p_source=>'PARTYBILLNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P143_PARTYBILLNO'
,p_lov_cascade_parent_items=>'P143_LOCATIONCODE,P143_DOCTYPECODE,P143_PARTYCODE'
,p_ajax_items_to_submit=>'P143_LOCATIONCODE,P143_DOCTYPECODE,P143_PARTYCODE,P143_PARTYBILLNO'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>37
,p_cMaxlength=>100
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '500')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600586599442171816)
,p_name=>'P143_PARTYCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(602764421364017068)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_prompt=>'Party'
,p_source=>'PARTYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P143_PARTY'
,p_lov_cascade_parent_items=>'P143_LOCATIONCODE'
,p_ajax_items_to_submit=>'P143_LOCATIONCODE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '600')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1264755738472002668)
,p_name=>'P143_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1262928437104653924)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600595015747171822)
,p_name=>'P143_PORTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_source=>'PORTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600587829476171817)
,p_name=>'P143_PURCHASEBILLAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(447354910990243096)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_default=>'0'
,p_prompt=>'Purchase Bill Amount'
,p_format_mask=>'999999999.99'
,p_source=>'PURCHASEBILLAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(196095015451362578)
,p_name=>'P143_PURCHASEBILLAMOUNTBEFOREROUND'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(447354910990243096)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_prompt=>'Purchase Bill Amount Before Round'
,p_format_mask=>'9999999999.99'
,p_source=>'PURCHASEBILLAMOUNTBEFOREROUND'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600584175765171816)
,p_name=>'P143_PURCHASEBILLDATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(602764268318017067)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Purchase Bill Date'
,p_source=>'PURCHASEBILLDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P143_ALLOWEDFORWARD',
  'min_date', 'ITEM',
  'min_item', 'P143_ALLOWEDBACK',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600583746967171816)
,p_name=>'P143_PURCHASEBILLNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(602764268318017067)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_prompt=>'Purchase Bill No'
,p_source=>'PURCHASEBILLNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(447056558906861606)
,p_name=>'P143_PURCHASEBILLPASSDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(447056177071861603)
,p_item_default=>'select PBPASSDATE from pbpass where PURCHASEBILLTNO = :P143_TNO;'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(447056359325861604)
,p_name=>'P143_PURCHASEBILLPASSNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(447056177071861603)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PBPASSNO from pbpass where PURCHASEBILLTNO = :P143_TNO;',
''))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Purchase Bill Pass No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:152:&SESSION.::NO:RP,152:P152_TNO,P152_CALLEDFROMPAGE,P152_FORMSTATUS,P152_CALLEDFROMTNO:&P143_PURCHASEBILLPASSTNO.,143,CALLED,&P143_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_tag_attributes=>'readonly=true'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(447056401347861605)
,p_name=>'P143_PURCHASEBILLPASSTNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(447056177071861603)
,p_item_default=>'select tno from pbpass where PURCHASEBILLTNO = :P143_TNO;'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600585348337171816)
,p_name=>'P143_PURCHASEORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(602764701262017071)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_prompt=>'Purchase Order No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:118:&SESSION.::NO:RP,118:P118_TNO,P118_CALLEDFROMPAGE,P118_FORMSTATUS,P118_CALLEDFROMTNO:&P143_PURCHASEORDERTNO.,143,CALLED,&P143_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source=>'PURCHASEORDERTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P143_PURCHASEORDERTNO'
,p_lov_cascade_parent_items=>'P143_TNO,P143_LOCATIONCODE,P143_DOCTYPECODE'
,p_ajax_items_to_submit=>'P143_LOCATIONCODE,P143_DOCTYPECODE,P143_PURCHASEORDERTNO,P143_PARTYCODE,P143_PURCHASEBILLDATE,P143_TNO,P143_FORMSTATUS'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '400',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '500')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600591044104171820)
,p_name=>'P143_RAKETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_source=>'RAKETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600588193972171817)
,p_name=>'P143_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(602764909014017073)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>100
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(196095019051362579)
,p_name=>'P143_ROUNDOFF'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(447354910990243096)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_prompt=>'Round Off'
,p_format_mask=>'9999999999.99'
,p_source=>'ROUNDOFF'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600814213760447240)
,p_name=>'P143_SELECTEDGRN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(600814069625447239)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600814898446447247)
,p_name=>'P143_SPECIFICATION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(600814310547447241)
,p_prompt=>'Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ITEMSPECIFICATIONNAME , ITEMSPECIFICATIONCODE',
'from itemspecification',
'where tno in (select tno from item where itemcode = :P143_MATERIAL )'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P143_MATERIAL'
,p_ajax_items_to_submit=>'P143_MATERIAL'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(754685508874075439)
,p_name=>'P143_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1262928437104653924)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P143_TNO), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1264755574827002667)
,p_name=>'P143_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1262928437104653924)
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
 p_id=>wwv_flow_imp.id(600586976525171817)
,p_name=>'P143_SUMOFAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(447354910990243096)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_default=>'0'
,p_prompt=>'Sum Of Amount'
,p_format_mask=>'999999999.99'
,p_source=>'SUMOFAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600587393668171817)
,p_name=>'P143_SUMOFFOOTERAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(447354910990243096)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_default=>'0'
,p_prompt=>'Sum Of Footer Amount'
,p_format_mask=>'999999999.99'
,p_source=>'SUMOFFOOTERAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600589811474171820)
,p_name=>'P143_SUMOFFOOTERAMOUNTWITHRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_source=>'SUMOFFOOTERAMOUNTWITHRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600588947747171819)
,p_name=>'P143_SUPPLIERCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_source=>'SUPPLIERCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(212746548334770373)
,p_name=>'P143_TAXINROUND'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(602764497505017069)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_default=>'NO'
,p_prompt=>'Tax In Round Fig.'
,p_source=>'TAXINROUND'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Yes;YES,No;NO'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600581840763171812)
,p_name=>'P143_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600814470671447243)
,p_name=>'P143_TODATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(600814310547447241)
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600593755416171822)
,p_name=>'P143_TRANCTIONTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_source=>'TRANCTIONTYPECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600594221265171822)
,p_name=>'P143_TRANSACTIONTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(602764829912017072)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_prompt=>'Transaction Type'
,p_source=>'TRANSACTIONTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TRANSACTIONTYPENAME , TRANSACTIONTYPECODE from TRANSACTIONTYPE',
'where getdocumentstatuscode(''TRANSACTIONTYPE'',TNO) = ''ACTIVE''',
''))
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(600593393803171821)
,p_name=>'P143_UPDATELANDINGIFSUPPLEMENTARY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_item_source_plug_id=>wwv_flow_imp.id(600581388345171811)
,p_source=>'UPDATELANDINGIFSUPPLEMENTARY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447058797921861629)
,p_name=>'Calculate Detail Footer Amount'
,p_static_id=>'calculate-detail-footer-amount'
,p_event_sequence=>390
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(600745117815249260)
,p_triggering_element=>'LEGENDSCODE,FOOTERPERCENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447058898548861630)
,p_event_id=>wwv_flow_imp.id(447058797921861629)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'FOOTERVALUE',
  'items_to_submit', 'FOOTERHEADCODE,LEGENDSCODE,FOOTERPERCENT,P143_DFAMOUNT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare	',
    '	cursor cFooterSchemeDetail is',
    '		select a.* ',
    '		from FooterSchemeList a, FooterSchemeList c',
    '		where a.tno = c.tno',
    '			and a.Status = ''ACTIVE''',
    '			and c.FooterHeadCode = :FooterHeadCode',
    '			and a.sno < c.sno ',
    '			and a.companycode = :global_CompanyCode',
    '			and a.financialyearcode = :global_financialyearcode',
    '			and a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '			and c.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '		order by a.sno;',
    '	vFooterSchemeDetail cFooterSchemeDetail%ROWTYPE;',
    '	',
    '	cursor c3FooterSchemeDetail is',
    '		select a.* ',
    '		from FooterSchemeList a, FooterSchemeList c',
    '		where a.tno = c.tno',
    '			and a.Status = ''ACTIVE''',
    '			and c.FooterHeadCode = :FooterHeadCode',
    '			and a.companycode = :global_CompanyCode',
    '			and a.financialyearcode = :global_financialyearcode',
    '			and a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '			and c.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '		order by a.sno;',
    '	v3FooterSchemeDetail c3FooterSchemeDetail%ROWTYPE;',
    '',
    '',
    '	cursor c2FooterSchemeDetail is',
    '		select a.* ',
    '		from FooterSchemeList a',
    '		where a.Status = ''ACTIVE''',
    '			and a.FooterHeadCode = :FooterHeadCode',
    '			and a.companycode = :global_CompanyCode',
    '			and a.financialyearcode = :global_financialyearcode',
    '			and a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '		order by a.sno;',
    '	v2FooterSchemeDetail c2FooterSchemeDetail%ROWTYPE;',
    '	',
    '	myFormula varchar2(1000);',
    '	isFound varchar2(10);',
    '	fvalue number;',
    '    tTotalDetailAmount number;',
    '    tmp varchar2(100);',
    '	',
    'BEGIN',
    '  /*for vBookingDetail in',
    '        (',
    '        Select',
    '            sum(a.Amount) as TotalAmount',
    '        From BookingDetail a',
    '        Where a.Tno = :P93_Tno',
    '        )',
    '    loop',
    '        tTotalDetailAmount := vBookingDetail.TotalAmount;',
    '    end loop;*/',
    '    tTotalDetailAmount := :P143_DFAMOUNT;',
    '',
    '  open c2FooterSchemeDetail;',
    '  fetch c2FooterSchemeDetail into v2FooterSchemeDetail;',
    '  if c2FooterSchemeDetail%FOUND then',
    '  		if length(nvl(v2FooterSchemeDetail.Formula,''''))>0 then',
    '  				myFormula := v2FooterSchemeDetail.Formula;',
    '  				myFormula := replace(myFormula, ''.A.'', nvl(tTotalDetailAmount,0) );',
    '  				for vFooterSchemeDetail  in cFooterSchemeDetail ',
    '  				loop',
    '					if :FooterHeadCode = vFooterSchemeDetail.FooterHeadCode then',
    '							isFound := ''YES'';',
    '							myFormula := replace(myFormula, vFooterSchemeDetail.FooterHeadCode, nvl(:FooterValue,0) );',
    '							exit;',
    '					end if;',
    '  				end loop;',
    '  				',
    '  					myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(:FooterPercent,0) );',
    '  			',
    '  				for v3FooterSchemeDetail  in c3FooterSchemeDetail ',
    '  				loop',
    '  						myFormula := replace(myFormula, v3FooterSchemeDetail.FooterHeadCode, ''0'' );',
    '  				end loop;',
    '  				if (:legendscode is null and NVL(GetMYparametervalue(''LEGENDS''),''YES'') = ''NO'') then ',
    '					myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(:FooterPercent,0));',
    '					:footervalue := getvalue(myformula);',
    '			    end if;',
    '',
    '                ',
    '',
    '		  		if (:Legendscode is not null and  NVL(GetMyparametervalue(''LEGENDS''),''NO'')= ''YES'') then ',
    '		  				select getvalue(myFormula) into  fvalue 	from dual;',
    '',
    '                          ',
    '                      ',
    '		  				if :legendscode = ''PRA'' then ',
    '		  					 	:footervalue := nvl(round(fvalue,0),0);',
    '		  					',
    '',
    '                                 ',
    '                                ',
    '		  				end if;',
    '		  				',
    '		  				if :legendscode = ''PRD'' then ',
    '		  						:footervalue := (-1)* nvl(round(fvalue,0),0);',
    '		  					',
    '		  				end if;',
    '							if :legendscode is null then ',
    '									myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(:FooterPercent,0));',
    '							end if;',
    '							if :legendscode = ''PAA'' then ',
    '		  						:footervalue := nvl(fvalue,0);',
    '							end if;',
    '							',
    '							if :legendscode = ''PAD'' then ',
    '		  						:footervalue := (-1)* nvl(abs(fvalue),0);',
    '							end if;',
    '		  		END IF;',
    '		  	',
    '  			',
    '  		end if;',
    ' end if;',
    ' end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447059028302861631)
,p_event_id=>wwv_flow_imp.id(447058797921861629)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'FOOTERVALUE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447059287995861634)
,p_name=>'Calculate Detail Footer Total Amount value '
,p_static_id=>'calculate-detail-footer-total-amount-value'
,p_event_sequence=>410
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(600745117815249260)
,p_triggering_element=>'FOOTERVALUE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447353859074243085)
,p_event_id=>wwv_flow_imp.id(447059287995861634)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("DetailFooter").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("FOOTERVALUE");',
    'var totalAmt = 0;',
    '',
    'model.forEach(function(r) {',
    '  var total = parseFloat(r[totalKey], 10);',
    '',
    '  if (!isNaN(total)) {',
    '    totalAmt += total;',
    '  }',
    '});',
    '',
    '$s("P143_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447354351356243090)
,p_name=>'Calculate Detail Footer Total Amount value on get focus'
,p_static_id=>'calculate-detail-footer-total-amount-value-on-get-focus'
,p_event_sequence=>440
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(600745117815249260)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447354452311243091)
,p_event_id=>wwv_flow_imp.id(447354351356243090)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("DetailFooter").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("FOOTERVALUE");',
    'var totalAmt = 0;',
    '',
    'model.forEach(function(r) {',
    '  var total = parseFloat(r[totalKey], 10);',
    '',
    '  if (!isNaN(total)) {',
    '    totalAmt += total;',
    '  }',
    '});',
    '',
    '$s("P143_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447059158896861632)
,p_name=>'Calculate Detail Footer Total Amount value on loose focus'
,p_static_id=>'calculate-detail-footer-total-amount-value-on-loose-focus'
,p_event_sequence=>400
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(600745117815249260)
,p_triggering_element=>'FOOTERPERCENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447059190792861633)
,p_event_id=>wwv_flow_imp.id(447059158896861632)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("DetailFooter").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("FOOTERVALUE");',
    'var totalAmt = 0;',
    '',
    'model.forEach(function(r) {',
    '  var total = parseFloat(r[totalKey], 10);',
    '',
    '  if (!isNaN(total)) {',
    '    totalAmt += total;',
    '  }',
    '});',
    '',
    '$s("P143_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447354518662243092)
,p_name=>'Calculate Footer Total'
,p_static_id=>'calculate-footer-total'
,p_event_sequence=>450
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600817123858447269)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447354621689243093)
,p_event_id=>wwv_flow_imp.id(447354518662243092)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("DetailFooter").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("FOOTERVALUE");',
    'model.forEach(function(igrow,index, id) {',
    '     meta = model.getRecordMetadata(id);',
    '    n_amt = parseFloat(igrow[col_amt], 10);',
    '    if (!isNaN(n_amt) !== "" && !meta.deleted && !meta.agg) {',
    '        n_totamt += n_amt;',
    '    }',
    '});',
    'apex.item("P143_FVALUE").setValue(n_totamt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447058361793861624)
,p_name=>'Calculate Sum of Amount Value on Loose focus'
,p_static_id=>'calculate-sum-of-amount-value-on-loose-focus'
,p_event_sequence=>370
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(596723855758907765)
,p_triggering_element=>'AMOUNT,FD,FOOTERAMOUNT,TOTALAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447058475228861626)
,p_event_id=>wwv_flow_imp.id(447058361793861624)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("AMOUNT");',
    'var footerKey = model.getFieldKey("FOOTERAMOUNT");',
    'var grandtotalKey = model.getFieldKey("TOTALAMOUNT");',
    'var totalAmt = 0;',
    'var footerAmt = 0;',
    'var grandtotalAmt = 0;',
    '',
    'model.forEach(function(r, index, id) {',
    '    meta = model.getRecordMetadata(id);',
    '  var total = parseFloat(r[totalKey], 10);',
    '  var footer = parseFloat(r[footerKey], 10);',
    '  var grandtotal = parseFloat(r[grandtotalKey], 10);',
    '',
    '  if (!isNaN(total) && !meta.deleted && !meta.agg) {',
    '    totalAmt += total;',
    '  }',
    '',
    '  if (!isNaN(footer) && !meta.deleted && !meta.agg) {',
    '    footerAmt += footer;',
    '  }',
    '',
    '  if (!isNaN(grandtotal) && !meta.deleted && !meta.agg) {',
    '    grandtotalAmt += grandtotal;',
    '  }',
    '});',
    '',
    '$s("P143_SUMOFAMOUNT", totalAmt);',
    '$s("P143_SUMOFFOOTERAMOUNT", footerAmt);',
    '$s("P143_PURCHASEBILLAMOUNT", grandtotalAmt);',
    '	')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447058371518861625)
,p_event_id=>wwv_flow_imp.id(447058361793861624)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PURCHASEBILLAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'TOTALAMOUNT',
  'plsql_expression', ':TOTALAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198438960009447971)
,p_event_id=>wwv_flow_imp.id(447058361793861624)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'set P143_PURCHASEBILLAMOUNT'
,p_static_id=>'set-p143-purchasebillamount'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PURCHASEBILLAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PURCHASEBILLAMOUNT',
  'sql_query', 'select round(:P143_PURCHASEBILLAMOUNT,0) from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P143_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198438901951447970)
,p_event_id=>wwv_flow_imp.id(447058361793861624)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'set P143_PURCHASEBILLAMOUNTBEFOREROUND'
,p_static_id=>'set-p143-purchasebillamountbeforeround'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PURCHASEBILLAMOUNTBEFOREROUND'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PURCHASEBILLAMOUNT',
  'plsql_expression', ':P143_PURCHASEBILLAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P143_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198439029093447972)
,p_event_id=>wwv_flow_imp.id(447058361793861624)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'set P143_ROUNDOFF'
,p_static_id=>'set-p143-roundoff'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_ROUNDOFF'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PURCHASEBILLAMOUNT,P143_PURCHASEBILLAMOUNTBEFOREROUND',
  'sql_query', 'select :P143_PURCHASEBILLAMOUNT - :P143_PURCHASEBILLAMOUNTBEFOREROUND from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P143_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198439165343447973)
,p_event_id=>wwv_flow_imp.id(447058361793861624)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'set P143_ROUNDOFF'
,p_static_id=>'set-p143-roundoff-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PURCHASEBILLAMOUNTBEFOREROUND,P143_ROUNDOFF'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'sql_query', 'select 0 as a , 0 as b from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P143_BILLINROUNDFIGURE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600871486475726243)
,p_name=>'close'
,p_static_id=>'close'
,p_event_sequence=>250
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600817123858447269)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600871605774726244)
,p_event_id=>wwv_flow_imp.id(600871486475726243)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600745117815249260)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600874006774726268)
,p_name=>'Close'
,p_static_id=>'close-2'
,p_event_sequence=>300
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600815100794447249)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600874100007726269)
,p_event_id=>wwv_flow_imp.id(600874006774726268)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600814069625447239)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461545683666383496)
,p_event_id=>wwv_flow_imp.id(600874006774726268)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600817223067447270)
,p_build_option_id=>wwv_flow_imp.id(573771056156959416)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461545868179383497)
,p_event_id=>wwv_flow_imp.id(600874006774726268)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600817293418447271)
,p_build_option_id=>wwv_flow_imp.id(573771056156959416)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447056593639861607)
,p_name=>'Delete data if master record not found'
,p_static_id=>'delete-data-if-master-record-not-found'
,p_event_sequence=>330
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447056753697861608)
,p_event_id=>wwv_flow_imp.id(447056593639861607)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from purchasebilldetail a',
    '    where not exists (',
    '        select 1 from purchasebill  aa  ',
    '        where aa.tno = a.tno',
    '    );',
    '',
    'delete from purchasebilldetailfooter a',
    '    where not exists (',
    '        select 1 from purchasebill  aa  ',
    '        where aa.tno = a.tno',
    '    );',
    '',
    'delete from purchasebillgrndetail a',
    '    where not exists (',
    '        select 1 from purchasebill  aa  ',
    '        where aa.tno = a.tno',
    '    );',
    '',
    ' ',
    '',
    'delete from grnselection_apex a',
    '    where not exists (',
    '        select 1 from purchasebill  aa  ',
    '        where aa.tno = a.tno',
    '    );')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600666124525780476)
,p_name=>'Delete unsaved data'
,p_static_id=>'delete-unsaved-data'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600652847151768297)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455854610621081002)
,p_event_id=>wwv_flow_imp.id(600666124525780476)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'check detail entry'
,p_static_id=>'check-detail-entry'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO',
  'language', 'PLSQL',
  'plsql_code', 'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P143_TNO);',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600666489801780476)
,p_event_id=>wwv_flow_imp.id(600666124525780476)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from purchasebilldetail a',
    '    where not exists (',
    '        select 1 from purchasebill  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P143_TNO;',
    '',
    'delete from purchasebilldetailfooter a',
    '    where not exists (',
    '        select 1 from purchasebill  aa  ',
    '        where aa.tno = a.tno',
    '    )and a.tno = :P143_TNO;',
    '',
    'delete from purchasebillgrndetail a',
    '    where not exists (',
    '        select 1 from purchasebill  aa  ',
    '        where aa.tno = a.tno',
    '    )and a.tno = :P143_TNO;',
    '',
    ' ',
    '',
    'delete from grnselection_apex a',
    '    where not exists (',
    '        select 1 from purchasebill  aa  ',
    '        where aa.tno = a.tno',
    '    )and a.tno = :P143_TNO;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600667483003781802)
,p_event_id=>wwv_flow_imp.id(600666124525780476)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P143_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P143_CALLEDFROMTNO'').getValue();',
    '',
    '//var url = "f?p=#APP_ID#:80:#SESSION#::NO:RP,80:P156_TNO,P156_CALLEDFROMPAGE,P156_FORMSTATUS:#P156_TNO#,#P156_CALLEDFROMPAGE#,#P156_FORMSTATUS#";',
    '',
    '',
    'var url = "f?p=#APP_ID#:#2002#:#SESSION#::NO:RP,#2002#:P#2002#_TNO:#P2002_TNO#";',
    '//:P2002_TNO:#P2002_TNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#2002#", x);',
    'url = url.replace("#2002#", x);',
    'url = url.replace("#2002#", x);',
    '',
    'url = url.replace("#P2002_TNO#", y);',
    '//window.alert(x);',
    '//window.alert(y);',
    '//window.alert(url);',
    '',
    '',
    '//call',
    'apex.server.process("PREPARE_URL", {',
    'x01: url',
    '  }, {',
    '  success: function(pData) {',
    '   if (pData.success === true) {',
    '     apex.navigation.redirect(pData.url);',
    '   } else {',
    '     console.log("FALSE");',
    '   }',
    ' },',
    'error: function(request, status, error) {',
    'console.log("status---" + status + " error----" + error);',
    '  }',
    '});',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600673068657787351)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600674016666787351)
,p_event_id=>wwv_flow_imp.id(600673068657787351)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600653284781768299)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600674474778787351)
,p_event_id=>wwv_flow_imp.id(600673068657787351)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600653284781768299)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P143_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451809646942682830)
,p_event_id=>wwv_flow_imp.id(600673068657787351)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600653284781768299)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from pbpass where PURCHASEBILLTNO = :P143_TNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600673483288787351)
,p_event_id=>wwv_flow_imp.id(600673068657787351)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600653284781768299)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461545963455383498)
,p_name=>'Disable grndetail Button_1'
,p_static_id=>'disable-grndetail-button'
,p_event_sequence=>110
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461546257044383501)
,p_event_id=>wwv_flow_imp.id(461545963455383498)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600817223067447270)
,p_server_condition_type=>'ITEM_IS_NOT_NULL'
,p_server_condition_expr1=>'P143_PURCHASEBILLNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461546017040383499)
,p_event_id=>wwv_flow_imp.id(461545963455383498)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600817223067447270)
,p_server_condition_type=>'ITEM_IS_NULL'
,p_server_condition_expr1=>'P143_PURCHASEBILLNO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600678024843790813)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>100
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600678861940790813)
,p_event_id=>wwv_flow_imp.id(600678024843790813)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600656099287768300)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600678412140790813)
,p_event_id=>wwv_flow_imp.id(600678024843790813)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600656099287768300)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600674920542788385)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600675754223788385)
,p_event_id=>wwv_flow_imp.id(600674920542788385)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600653700805768300)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C',
'WHERE A.TNO = B.TNO',
'AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'AND B.BOSSUSERCODE = C.BOSSUSERCODE',
'AND C.BOSSUSERNAME = :APP_USER',
'AND B.UPDATEPRIVILEGE = ''NO''',
'UNION ALL',
'Select 1',
'  From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.UPDATEPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600675329788788385)
,p_event_id=>wwv_flow_imp.id(600674920542788385)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600653700805768300)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P143_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451809721619682831)
,p_event_id=>wwv_flow_imp.id(600674920542788385)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600653700805768300)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from pbpass where PURCHASEBILLTNO = :P143_TNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600676263798788385)
,p_event_id=>wwv_flow_imp.id(600674920542788385)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600653700805768300)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C',
'WHERE A.TNO = B.TNO',
'AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'AND B.BOSSUSERCODE = C.BOSSUSERCODE',
'AND C.BOSSUSERNAME = :APP_USER',
'AND B.UPDATEPRIVILEGE = ''YES''',
'UNION ALL',
'Select 1',
'  From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.UPDATEPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600676704161789615)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>90
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600677577026789616)
,p_event_id=>wwv_flow_imp.id(600676704161789615)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600656099287768300)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600677131837789616)
,p_event_id=>wwv_flow_imp.id(600676704161789615)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600656099287768300)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600660256622775416)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600656099287768300)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600663225497775418)
,p_event_id=>wwv_flow_imp.id(600660256622775416)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600656099287768300)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600662684389775418)
,p_event_id=>wwv_flow_imp.id(600660256622775416)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600656099287768300)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P143_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600661157481775417)
,p_event_id=>wwv_flow_imp.id(600660256622775416)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO,P143_STATUS',
  'language', 'PLSQL',
  'plsql_code', 'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P143_TNO,:P143_STATUS);',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600661709853775417)
,p_event_id=>wwv_flow_imp.id(600660256622775416)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text('''');',
    '$(''#STATUS'').text($v(''P143_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600663657106775418)
,p_event_id=>wwv_flow_imp.id(600660256622775416)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600662161058775417)
,p_event_id=>wwv_flow_imp.id(600660256622775416)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(895529906386569378)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600660680915775417)
,p_event_id=>wwv_flow_imp.id(600660256622775416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600671282894786365)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600671697632786365)
,p_event_id=>wwv_flow_imp.id(600671282894786365)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600654900048768300)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600672213325786365)
,p_event_id=>wwv_flow_imp.id(600671282894786365)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600655317210768300)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600672718742786365)
,p_event_id=>wwv_flow_imp.id(600671282894786365)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600655698347768300)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600658332767773229)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600655317210768300)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600659155018773229)
,p_event_id=>wwv_flow_imp.id(600658332767773229)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO,P143_COMPANYCODE,P143_PURCHASEORDERNO',
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
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600659741908773229)
,p_event_id=>wwv_flow_imp.id(600658332767773229)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(895529906386569378)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600658734142773229)
,p_event_id=>wwv_flow_imp.id(600658332767773229)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600817602329447274)
,p_name=>'Get Item'
,p_static_id=>'get-item'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600817293418447271)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(33494418682959565)
,p_event_id=>wwv_flow_imp.id(600817602329447274)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'insert into purchasebilldetailfooter'
,p_static_id=>'insert-into-purchasebilldetailfooter'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO,P143_BILLEDITEM,P143_BILLEDON',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Insert into PurchaseBillDetailfooter(',
    '            tno,',
    '            sno,',
    '            SN,',
    '			FOOTERHEADCODE,',
    '            FOOTERPERCENT,',
    '            FOOTERVALUE,',
    '            LEGENDSCODE',
    '	) ',
    '    (',
    '        select  a.TNo,',
    '                a.SNo,',
    '                globaltno.nextval,',
    '                b.FooterHeadCode,',
    '                b.FooterPercent,',
    '                (b.FooterPercent * a.amount) / 100,',
    '                b.LegendsCode',
    '                 ',
    '        from purchasebilldetail a , purchaseorderdetailfooter b , purchaseorderdetail c',
    '        where a.PURCHASEORDERTNO = b.tno',
    '        and a.itemcode = c.itemcode',
    '        and a.ITEMSPECIFICATIONCODE = c.ITEMSPECIFICATIONCODE',
    '        and c.tno = b.tno',
    '        and c.sno = b.sno',
    '        and a.tno = :P143_TNO',
    '    );',
    '',
    'update purchasebilldetail d',
    '   set d.footeramount = nvl((',
    '           select sum(f.footervalue)',
    '             from purchasebilldetailfooter f',
    '            where f.tno = d.tno',
    '              and f.sno = d.sno',
    '       ), 0),',
    '       d.totalamount = nvl(d.amount, 0) + nvl((',
    '           select sum(f.footervalue)',
    '             from purchasebilldetailfooter f',
    '            where f.tno = d.tno',
    '              and f.sno = d.sno',
    '       ), 0)',
    ' where d.tno = :P143_TNO;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600869727184726225)
,p_event_id=>wwv_flow_imp.id(600817602329447274)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO,P143_PARTYCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '',
    '    Cursor cPbill is',
    '				select ',
    '				         a.tno,',
    '								 b.itemcode,',
    '								 c.ItemName,',
    '								 b.ItemSpecificationCode,',
    '								 d.ItemSpecificationName,',
    '								 e.MeasuringUnitName as MeasuringUnitName1,',
    '								 f.MeasuringUnitName as MeasuringUnitName2,',
    '								 sum(b.Quantity1) as quantity1,',
    '								 sum(b.Quantity2) as quantity2,',
    '								 b.rate,',
    '								 g.MeasuringUnitname as Unit,',
    '								 sum(b.amount) as amount,',
    '								 sum(b.footeramount)as footeramount,',
    '								 sum(b.totalamount) as totalamount,',
    '								 po.purchaseorderno,',
    '								 b.Purchaseordertno',
    '',
    '						from purchasebill a, ',
    '								 Purchasebilldetail b,',
    '								 Item c, ',
    '								 ItemSpecification d, ',
    '								 MeasuringUnit e, ',
    '								 MeasuringUnit f, ',
    '								 MeasuringUnit g, ',
    '								 purchaseorder po',
    '								',
    '						where a.tno = b.tno',
    '								and b.itemcode = c.itemcode',
    '								and b.itemspecificationcode = d.itemspecificationcode',
    '								and c.tno = d.tno',
    '								and c.MeasuringUnitCode1 = e.MeasuringUnitCode(+)',
    '								and c.MeasuringUnitCode2 = f.MeasuringUnitCode(+)',
    '								and a.tno in (select PURCHASEBILLTNO from pbsupplimentarybill where ISRETRIEVE = ''NO'')',
    '   								and b.ratemeasuringUnitcode = g.measuringUnitcode',
    '								and b.purchaseordertno = po.tno',
    '								and a.partycode  = :P143_PARTYCODE',
    '								',
    '						group by ',
    '						    a.tno,',
    '								b.itemcode,',
    '								c.ItemName,',
    '								b.ItemSpecificationCode,',
    '								d.ItemSpecificationName,',
    '								e.MeasuringUnitName,',
    '								f.MeasuringUnitName,',
    '								b.rate,',
    '								g.MeasuringUnitname,',
    '								po.purchaseorderno,',
    '								b.Purchaseordertno',
    '								',
    '						order by',
    '								po.purchaseorderno,',
    '								c.ItemName,',
    '								d.ItemSpecificationName;',
    '',
    '				vpbill cPbill%ROWTYPE;',
    '',
    'begin',
    '',
    '        for vPbill in cPbill',
    '		loop',
    '',
    '            insert into purchasebilldetail',
    '                (',
    '                    tno,',
    '                    sno,',
    '                    PURCHASEORDERTNO,',
    '                    ITEMCODE,',
    '                    ITEMSPECIFICATIONCODE,',
    '                    RATEMEASURINGUNITCODE,',
    '                    QUANTITY1,',
    '                    RATE,',
    '                    AMOUNT,',
    '                    Totalamount',
    '                )',
    '                values',
    '                (',
    '                    :P143_TNO,',
    '                    globaltno.nextval,',
    '                    vPbill.purchaseorderTno,',
    '                    vPbill.ItemCode,',
    '                    vPbill.ItemSpecificationCode,',
    '                    vPbill.MeasuringUnitName1,',
    '                    round(vPbill.Quantity1,3),',
    '                    vPbill.RATE,',
    '                    vPbill.AMOUNT,',
    '                    vPbill.TOTALAMOUNT',
    '                );',
    '',
    '        end loop;',
    '',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600869829590726226)
,p_event_id=>wwv_flow_imp.id(600817602329447274)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(596723855758907765)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(63250033946405517)
,p_event_id=>wwv_flow_imp.id(600817602329447274)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_SUMOFAMOUNT,P143_SUMOFFOOTERAMOUNT,P143_PURCHASEBILLAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(amount), sum(footeramount), sum(totalamount)',
    '  from purchasebilldetail',
    ' where tno = :P143_TNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(497622516727954321)
,p_name=>'go to next tab'
,p_static_id=>'go-to-next-tab'
,p_event_sequence=>480
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P143_REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(497622574489954322)
,p_event_id=>wwv_flow_imp.id(497622516727954321)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_General"].moveNext();',
    '',
    'apex.region( "Detail" ).widget().interactiveGrid( "getActions" ).set("edit", true);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(499165828473520310)
,p_name=>'grnclose'
,p_static_id=>'grnclose'
,p_event_sequence=>490
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(499165754897520309)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(499165968311520311)
,p_event_id=>wwv_flow_imp.id(499165828473520310)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600746501858249274)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(445137533528320685)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>310
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(445137640459320686)
,p_event_id=>wwv_flow_imp.id(445137533528320685)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600743836089249247)
,p_name=>'Initialize SERIALNO Sequence'
,p_static_id=>'initialize-serialno-sequence'
,p_event_sequence=>150
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(596723855758907765)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600743849585249248)
,p_event_id=>wwv_flow_imp.id(600743836089249247)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SERIALNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SERIALNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    'mysno number;',
    'Begin',
    'If :SERIALNO  is null then',
    '    Select GlobalTNo.nextval into mysno from dual;',
    'else MYSNO := :SERIALNO;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600743628182249245)
,p_name=>'Initialize SNO Sequence'
,p_static_id=>'initialize-sno-sequence'
,p_event_sequence=>130
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(596723855758907765)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600743687924249246)
,p_event_id=>wwv_flow_imp.id(600743628182249245)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    'mysno number;',
    'Begin',
    'If :SNO is null then',
    '    Select GlobalTNo.nextval into mysno from dual;',
    'else MYSNO := :SNO;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447355132527243098)
,p_name=>'Initialize SNO Sequence_1'
,p_static_id=>'initialize-sno-sequence-2'
,p_event_sequence=>140
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(600813358654447232)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447355239705243099)
,p_event_id=>wwv_flow_imp.id(447355132527243098)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    'mysno number;',
    'Begin',
    'If :SNO is null then',
    '    Select GlobalTNo.nextval into mysno from dual;',
    'else MYSNO := :SNO;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600872928867726257)
,p_name=>'Insert Into GRNSelection'
,p_static_id=>'insert-into-grnselection'
,p_event_sequence=>260
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600815039149447248)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600872957373726258)
,p_event_id=>wwv_flow_imp.id(600872928867726257)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO,P143_PARTYCODE,P143_PURCHASEBILLDATE,P143_LOCATIONCODE,P143_FROMDATE,P143_TODATE,P143_CHFROMDATE,P143_CHTODATE,P143_MATERIAL,P143_SPECIFICATION,P143_PURCHASEORDERTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    'TMP NUMBER;',
    'begin',
    '',
    '   -- raise_application_error(-20000,:P143_TNO ||''-''||:P143_PARTYCODE||''-''||:P143_PURCHASEBILLDATE||''-''||:P143_LOCATIONCODE);',
    '   if :P143_TNO is null then',
    '        :P143_TNO := globaltno.nextval;',
    '   end if;',
    '',
    '   ',
    '        DELETE FROM grnselection_apex ;',
    '        delete from PurchaseBillGRNDetail aa where tno = :P143_TNO;',
    '        ',
    '        insert into grnselection_apex(',
    '        				TNO,',
    '        				GRNTNo,',
    '        				GRNSNo,',
    '        				PURCHASEBILLTNO,',
    '        				ISSELECTED,',
    '                        PURCHASEORDERTNO',
    '        		) ',
    '         ',
    '                    select',
    '        				:P143_TNO AS TNO,',
    '        				a.TNo AS GRNTNO,',
    '        				b.SNo AS GRNSNO,',
    '        				:P143_TNO AS PURCHASEBILLTNO,',
    '        				''YES'' AS ISSELECTED	,',
    '                        a.PurchaseOrderTNo',
    '        		from GRN a, GRNDetail b',
    '        		where a.TNo = b.TNo',
    '        				and a.PartyCode = :P143_PARTYCODE',
    '        				and a.GRNDate <= :P143_PURCHASEBILLDATE',
    '        				and getDocumentStatusCode(''GRN'', A.TNO) = ''ACTIVE''',
    '        				and a.locationcode = :P143_LOCATIONCODE',
    '                        and A.PURCHASEORDERTNO = :P143_PURCHASEORDERTNO ',
    '        				',
    '        				and ( :P143_FROMDATE IS NULL OR :P143_TODATE IS NULL OR A.GRNDATE BETWEEN :P143_FROMDATE AND :P143_TODATE)',
    '                        and ( :P143_CHFROMDATE IS NULL OR instr('':''||:P143_CHFROMDATE||'':'','':''||a.RefDocDate||'':'') >= 0 )',
    '        				and ( :P143_CHTODATE IS NULL OR instr('':''||:P143_CHTODATE||'':'','':''||a.RefDocDate||'':'') <= 0 )',
    '        				and ( :P143_MATERIAL IS NULL OR instr('':''||:P143_MATERIAL||'':'','':''||b.ItemCode||'':'') > 0 )',
    '        				and ( :P143_PURCHASEORDERTNO IS NULL OR instr('':''||:P143_PURCHASEORDERTNO||'':'','':''||b.PurchaseOrderTNo||'':'') > 0 )				',
    '        				and ( :P143_DELIVERYORDERTNO IS NULL OR instr('':''||:P143_DELIVERYORDERTNO||'':'','':''||a.DeliveryOrderTNo||'':'') > 0 )				',
    '        				and ( :P143_RAKETNO IS NULL OR instr('':''||:P143_RAKETNO||'':'','':''||a.RakeTNo||'':'') > 0 )				',
    '        				and ( :P143_SPECIFICATION IS NULL OR instr('':''||:P143_SPECIFICATION||'':'','':''||b.ItemSpecificationCode||'':'') > 0 )			',
    '        				and not exists(',
    '        						select',
    '        								aa.tno',
    '        						from GRNSelection_apex aa',
    '        						where aa.GRNTNo = a.TNo',
    '        						and aa.GRNSNo = b.SNo		',
    '        				)',
    '        				and not exists(',
    '        						select',
    '        								aa.tno',
    '        						from PurchaseBillGRNDetail aa',
    '        						where aa.GRNTNo = b.TNO',
    '        								and aa.GRNSNo = b.SNo',
    '        				)',
    '                ',
    '                ;',
    '                         ',
    '     ',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58361612658166419)
,p_event_id=>wwv_flow_imp.id(600872928867726257)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO,P143_PARTYCODE,P143_PURCHASEBILLDATE,P143_LOCATIONCODE,P143_FROMDATE,P143_TODATE,P143_CHFROMDATE,P143_CHTODATE,P143_MATERIAL,P143_SPECIFICATION,P143_PURCHASEORDERTNO,P143_BILLING_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    IF :P143_TNO IS NULL THEN :P143_TNO := globaltno.nextval; END IF;',
    '   -- Clear the temporary APEX selection table before inserting fresh records',
    '    DELETE FROM grnselection_apex;',
    '    -- Clear existing GRN details for this specific transaction to prevent duplicate entries',
    '    DELETE FROM PurchaseBillGRNDetail WHERE tno = :P143_TNO;',
    '    -- OPTIMIZED BULK INSERTION',
    '    INSERT INTO grnselection_apex (',
    '        tno,',
    '        grntno,',
    '        grnsno,',
    '        purchasebilltno,',
    '        isselected,',
    '        purchaseordertno',
    '    ) ',
    '    SELECT',
    '        :P143_TNO AS tno,',
    '        a.tno AS grntno,',
    '        b.sno AS grnsno,',
    '        :P143_TNO AS purchasebilltno,',
    '        ''YES'' AS isselected,',
    '        a.purchaseordertno',
    '    FROM GRN a',
    '    INNER JOIN GRNDetail b ON a.tno = b.tno',
    '    WHERE a.partycode           = :P143_PARTYCODE',
    '      AND a.locationcode        = :P143_LOCATIONCODE',
    '      AND ((:P143_BILLING_TYPE = ''CHALLAN'' AND a.REFDOCTYPECODE = ''CHLN'')',
    '            OR',
    '            (:P143_BILLING_TYPE <> ''CHALLAN'' AND a.REFDOCTYPECODE = ''BILL''))',
    '      AND ((:P143_BILLING_TYPE = ''CHALLAN'' AND :P143_PURCHASEORDERTNO IS NULL)',
    '            OR',
    '            (:P143_BILLING_TYPE <> ''CHALLAN'' AND a.purchaseordertno = :P143_PURCHASEORDERTNO))',
    '      AND a.grndate            <= :P143_PURCHASEBILLDATE',
    '      AND getDocumentStatusCode(''GRN'', a.tno) = ''ACTIVE''		',
    '      AND (:P143_FROMDATE   IS NULL OR a.grndate >= :P143_FROMDATE)',
    '      AND (:P143_TODATE     IS NULL OR a.grndate <= :P143_TODATE)      ',
    '      AND (:P143_CHFROMDATE IS NULL OR a.refdocdate >= :P143_CHFROMDATE)',
    '      AND (:P143_CHTODATE   IS NULL OR a.refdocdate <= :P143_CHTODATE)      ',
    '      AND (:P143_MATERIAL IS NULL OR b.itemcode IN (',
    '              SELECT regexp_substr(:P143_MATERIAL, ''[^:]+'', 1, LEVEL) ',
    '              FROM dual CONNECT BY regexp_substr(:P143_MATERIAL, ''[^:]+'', 1, LEVEL) IS NOT NULL',
    '          ))          ',
    '      AND (:P143_PURCHASEORDERTNO IS NULL OR b.purchaseordertno IN (',
    '              SELECT regexp_substr(:P143_PURCHASEORDERTNO, ''[^:]+'', 1, LEVEL) ',
    '              FROM dual CONNECT BY regexp_substr(:P143_PURCHASEORDERTNO, ''[^:]+'', 1, LEVEL) IS NOT NULL',
    '          ))				          ',
    '      AND (:P143_DELIVERYORDERTNO IS NULL OR a.deliveryordertno IN (',
    '              SELECT regexp_substr(:P143_DELIVERYORDERTNO, ''[^:]+'', 1, LEVEL) ',
    '              FROM dual CONNECT BY regexp_substr(:P143_DELIVERYORDERTNO, ''[^:]+'', 1, LEVEL) IS NOT NULL',
    '          ))				         ',
    '      AND (:P143_RAKETNO IS NULL OR a.raketno IN (',
    '              SELECT regexp_substr(:P143_RAKETNO, ''[^:]+'', 1, LEVEL) ',
    '              FROM dual CONNECT BY regexp_substr(:P143_RAKETNO, ''[^:]+'', 1, LEVEL) IS NOT NULL',
    '          ))				         ',
    '      AND (:P143_SPECIFICATION IS NULL OR b.itemspecificationcode IN (',
    '              SELECT regexp_substr(:P143_SPECIFICATION, ''[^:]+'', 1, LEVEL) ',
    '              FROM dual CONNECT BY regexp_substr(:P143_SPECIFICATION, ''[^:]+'', 1, LEVEL) IS NOT NULL',
    '          ))			',
    '      AND NOT EXISTS (',
    '          SELECT 1',
    '          FROM grnselection_apex aa',
    '          WHERE aa.grntno = a.tno',
    '            AND aa.grnsno = b.sno		',
    '      )',
    '      AND NOT EXISTS (',
    '          SELECT 1',
    '          FROM PurchaseBillGRNDetail aa',
    '          WHERE aa.grntno = b.tno',
    '            AND aa.grnsno = b.sno',
    '      )',
    '--   AND a.purchaseordertno    = :P143_PURCHASEORDERTNO ',
    ';',
    '                         ',
    'END;',
    '',
    '',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600873126126726259)
,p_event_id=>wwv_flow_imp.id(600872928867726257)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600815198305447250)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(188128969601895320)
,p_name=>'Insert into tac'
,p_static_id=>'insert-into-tac'
,p_event_sequence=>600
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(188128736366893946)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(188129393505895321)
,p_event_id=>wwv_flow_imp.id(188128969601895320)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO,P143_DOCTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from PURCHASEBILLTAC where tno = :P143_TNO;',
    'insert into PURCHASEBILLTAC',
    '(',
    '    TNO, ',
    '    SNO, ',
    '    TERMSANDCONDITIONHEADCODE, ',
    '    TERMSANDCONDITION',
    ')',
    '(',
    '    SELECT',
    '        :P143_TNO,',
    '        globaltno.nextval,',
    '        termsandconditionheadcode,',
    '        termsandconditionvalue',
    '    FROM',
    '        moduledoctypewisetacdetail',
    '    WHERE',
    '        tno IN (',
    '            SELECT',
    '                tno',
    '            FROM',
    '                moduledoctypewisetac',
    '            WHERE',
    '                    modulecode = getModuleCodeForPageNo(:APP_PAGE_ID)',
    '                AND doctypecode = :P143_DOCTYPECODE',
    '        )',
    ');',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(188129829536895321)
,p_event_id=>wwv_flow_imp.id(188128969601895320)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600813358654447232)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(499823883404593212)
,p_name=>'move tab'
,p_static_id=>'move-tab'
,p_event_sequence=>500
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P143_PURCHASEBILLPASSDATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(499824056302593213)
,p_event_id=>wwv_flow_imp.id(499823883404593212)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_General"].moveNext();',
    'apex.region( "Detail" ).widget().interactiveGrid( "getActions" ).set("edit", true);',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(499824137646593214)
,p_name=>'move tab1'
,p_static_id=>'move-tab-2'
,p_event_sequence=>510
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(596723855758907765)
,p_triggering_element=>'REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(499824214088593215)
,p_event_id=>wwv_flow_imp.id(499824137646593214)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if ( $(''#ITEMCODE'').val() === '''' ){',
    '    apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_Detail"].moveNext();',
    '    apex.region( "TAC" ).widget().interactiveGrid( "getActions" ).set("edit", true);',
    '',
    '    }')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(499824288764593216)
,p_name=>'move tab2'
,p_static_id=>'move-tab-3'
,p_event_sequence=>520
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(600813358654447232)
,p_triggering_element=>'TERMSANDCONDITION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(499824438904593217)
,p_event_id=>wwv_flow_imp.id(499824288764593216)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if ( $(''#TERMSANDCONDITIONHEADCODE'').val() === '''' ){',
    '    apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_TAC"].moveNext();',
    '',
    '',
    '    }')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(452588184781166920)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>420
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(600745117815249260)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(452588318764166921)
,p_event_id=>wwv_flow_imp.id(452588184781166920)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SN',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    'mysno number;',
    'Begin',
    'If :SN is null then',
    '    Select GlobalTNo.nextval into mysno from dual;',
    'else MYSNO := :SN;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(199885746814537061)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>610
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P143_ROUNDOFF'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(199885835738537062)
,p_event_id=>wwv_flow_imp.id(199885746814537061)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PURCHASEBILLAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PURCHASEBILLAMOUNTBEFOREROUND,P143_ROUNDOFF',
  'plsql_expression', 'nvl(:P143_PURCHASEBILLAMOUNTBEFOREROUND,0) + nvl(:P143_ROUNDOFF,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600817400857447272)
,p_name=>'Open Grn Selection'
,p_static_id=>'open-grn-selection'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600817223067447270)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(457785325571956790)
,p_event_id=>wwv_flow_imp.id(600817400857447272)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '       DELETE FROM grnselection_apex ;',
    '        delete from PurchaseBillGRNDetail aa where tno = :P143_TNO;',
    ' ')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600817474265447273)
,p_event_id=>wwv_flow_imp.id(600817400857447272)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600814069625447239)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(457785385163956791)
,p_event_id=>wwv_flow_imp.id(600817400857447272)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600815198305447250)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600656512666770639)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600654900048768300)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600657387738770642)
,p_event_id=>wwv_flow_imp.id(600656512666770639)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO,P143_COMPANYCODE,P143_STATUS',
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
    '             if :P143_STATUS = ''ACTIVE'' then',
    '        ',
    '                CREATEPAYMENTADVICEFORPO(:P143_TNO);',
    '',
    '              end if;',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600657881307770644)
,p_event_id=>wwv_flow_imp.id(600656512666770639)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(895529906386569378)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600656858513770639)
,p_event_id=>wwv_flow_imp.id(600656512666770639)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600873528284726263)
,p_name=>'PrepareData'
,p_static_id=>'preparedata'
,p_event_sequence=>290
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600815100794447249)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600873575061726264)
,p_event_id=>wwv_flow_imp.id(600873528284726263)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO,P143_SELECTEDGRN',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from grnselection_apex a',
    'where a.tno = :P143_TNO',
    'and  ( :P143_SELECTEDGRN IS NULL OR instr('':''||:P143_SELECTEDGRN||'':'','':''||A.GRNSNO||'':'') <= 0 );')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600873665191726265)
,p_event_id=>wwv_flow_imp.id(600873528284726263)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO,P143_BILLEDITEM,P143_BILLEDON',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    delete from purchasebilldetail where tno = :P143_TNO;',
    '    delete from purchasebillgrndetail where tno = :P143_TNO;',
    '    ',
    '    for vloop in (select distinct GRNTNO from grnselection_apex where tno = :P143_TNO )',
    '',
    '    loop',
    '        APEX_PBPrepareData(vloop.GRNTNO,:P143_TNO,:P143_BILLEDITEM,:P143_BILLEDON);',
    '    end loop;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(601382542072650830)
,p_event_id=>wwv_flow_imp.id(600873528284726263)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-3'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO,P143_BILLEDITEM,P143_BILLEDON',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Insert into PurchaseBillDetailfooter(',
    '            tno,',
    '            sno,',
    '            SN,',
    '			FOOTERHEADCODE,',
    '            FOOTERPERCENT,',
    '            FOOTERVALUE,',
    '            LEGENDSCODE',
    '	) ',
    '    (',
    '        select  a.TNo,',
    '                a.SNo,',
    '                globaltno.nextval,',
    '                b.FooterHeadCode,',
    '                b.FooterPercent,',
    '                (b.FooterPercent * a.amount) / 100,',
    '                b.LegendsCode',
    '                 ',
    '        from purchasebilldetail a , purchaseorderdetailfooter b , purchaseorderdetail c',
    '        where a.PURCHASEORDERTNO = b.tno',
    '        and a.itemcode = c.itemcode',
    '        and a.ITEMSPECIFICATIONCODE = c.ITEMSPECIFICATIONCODE',
    '        and c.tno = b.tno',
    '        and c.sno = b.sno',
    '        and a.tno = :P143_TNO',
    '    );')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600873862033726267)
,p_event_id=>wwv_flow_imp.id(600873528284726263)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(596723855758907765)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600873779163726266)
,p_event_id=>wwv_flow_imp.id(600873528284726263)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PURCHASEORDERTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select distinct PURCHASEORDERTNO from PURCHASEBILLDETAIL ',
    'where tno = :P143_TNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_BILLING_TYPE'
,p_client_condition_expression=>'BILL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(601382549735650831)
,p_event_id=>wwv_flow_imp.id(600873528284726263)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PURCHASEBILLAMOUNT,P143_SUMOFAMOUNT,P143_SUMOFFOOTERAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PURCHASEORDERTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' select PURCHASEORDERAMOUNT , SUMOFAMOUNT , SUMOFFOOTERAMOUNT from purchaseorder ',
    ' where tno = :P143_PURCHASEORDERTNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_BILLING_TYPE'
,p_client_condition_expression=>'BILL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(601382692806650832)
,p_event_id=>wwv_flow_imp.id(600873528284726263)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-3'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_TRANSACTIONTYPECODE,P143_NATUREOFSUPPLYCODE,P143_CURRENCYUNITCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PARTYCODE,P143_LOCATIONCODE,P143_PURCHASEORDERTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ',
    '	c.TransactionTypeCode,',
    '	d.NatureOfSupplyCode,',
    '	e.CurrencyUnitCode',
    'from GRN a, PurchaseOrder b, TransactionType c, NatureOfSupply d, CurrencyUnit e',
    'where a.PurchaseOrderTNo = b.TNo',
    '	and b.TransactionTypeCode = c.TransactionTypeCode(+)',
    '	and b.NatureOfSupplyCode = d.NatureOfSupplyCode(+)',
    '	and b.CurrencyUNitCode = e.CurrencyUNitCode(+)',
    '	and a.PartyCode = :P143_PARTYCODE',
    '	and a.CompanyCode = :global_companycode',
    '	and a.PurchaseOrderTNo is not null ',
    '   and  a.LocationCode = :P143_LOCATIONCODE',
    '    and b.tno = :P143_PURCHASEORDERTNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(501655101178822909)
,p_name=>'Recalculate Amounts'
,p_static_id=>'recalculate-amounts'
,p_event_sequence=>540
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(596723855758907765)
,p_triggering_element=>'QUANTITY1,RATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(501657005531822916)
,p_event_id=>wwv_flow_imp.id(501655101178822909)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'recalculate amount- javascript'
,p_static_id=>'recalculate-amount-javascript'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var widget      = apex.region(''Detail'').widget();',
    'var grid        = widget.interactiveGrid(''getViews'',''grid'');  ',
    'var model       = grid.model; ',
    'var gtotal = 0;',
    'var sumoffooteramount = 0;',
    'var sumofamount       = 0;',
    'var sumoftotalamount  = 0;',
    'var detailsno         = 0;',
    'var amount            = 0;',
    'var totalfooter       = 0;',
    '',
    'model.forEach(function(r,index) {',
    '    try{',
    '    var record = r;',
    '    rec = record[index];',
    '',
    '    var quantity1           = model.getValue(record,''QUANTITY1'');',
    '    var rate           = model.getValue(record,''RATE'');',
    '',
    '    //var withoutdiscountrate = model.getValue(record,''WITHOUTDISCOUNTRATE'');',
    '    //var discountpercentage  = model.getValue(record,''DISCOUNTPERCENTAGE'');',
    '    //var discountrate        = model.getValue(record,''DISCOUNTRATE'');',
    '    //var rateafterdiscount   = model.getValue(record,''RATEAFTERDISCOUNT'');',
    '    var footeramount        = model.getValue(record,''FOOTERAMOUNT'');',
    '    var detailsno           = model.getValue(record,''SNO'');',
    '    var totalamount         = 0;',
    '    //rate                    = parseFloat(withoutdiscountrate) - parseFloat(discountrate) ;',
    '    amount                  = quantity1 * rate ;',
    '// loop for footer',
    'var footerwidget      = apex.region(''DetailFooter'').widget();',
    'var footergrid        = footerwidget.interactiveGrid(''getViews'',''grid'');  ',
    'var footermodel       = footergrid.model; ',
    'var totalfooter = 0;',
    'try{',
    'apex.region(''FooterDetail'').call(''getActions'').set(''edit'', true);',
    'footermodel.forEach(function(f,findex) {',
    '    var footerrecord = f;',
    '     footerrec = footerrecord[findex];',
    'var legends           = footermodel.getValue(footerrecord,''LEGENDSCODE'');',
    'var legendscode       = legends.v;',
    '',
    '    var footerheadcode        = footermodel.getValue(footerrecord,''FOOTERHEADCODE'');',
    '    var footerpercentage         = footermodel.getValue(footerrecord,''FOOTERPERCENT'');',
    '    var footervalue           = footermodel.getValue(footerrecord,''FOOTERVALUE'');',
    '    var footersno             = footermodel.getValue(footerrecord,''SNO'');',
    '',
    'if (footersno == detailsno){',
    '',
    '//alert('' old footer value ''+footervalue);  ',
    '   // var footervalue = 0;',
    '   var footerpercent =0;',
    '     if (footerpercentage !='''' || footerpercentage !=null)',
    '       footerpercent = parseFloat(footerpercentage);',
    '',
    '    if (legendscode == ''PRA''){',
    '        footervalue = Math.round((parseFloat(amount) * parseFloat(footerpercent)) / 100) ;',
    '    } else ',
    '        if (legendscode == ''PAA''){',
    '    ',
    '            footervalue = ((parseFloat(amount) * parseFloat(footerpercent)) / 100).toFixed(2) ;',
    '        } else ',
    '            if (legendscode == ''OQA''){',
    '                footervalue = ((parseFloat(quantity1) * parseFloat(footerpercent)) / 100).toFixed(2) ;',
    '            } else',
    '                if (legendscode == ''OQD''){',
    '                footervalue = (-1) * ((parseFloat(quantity1) * parseFloat(footerpercent)) / 100).toFixed(2) ;',
    '                }  else footervalue = footervalue;',
    '',
    '   totalfooter += footervalue;',
    ' //  alert(''total footer value ''+footervalue);',
    '   footermodel.setValue(footerrecord,''FOOTERVALUE'',footervalue)',
    '  //  alert(totalamount);',
    ' // apex.item(''P143_FVALUE'').setValue(totalfooter);',
    '} else totalfooter = footeramount;',
    '} ',
    '// checked sno end;',
    ')',
    '} catch (ex){}',
    '// close footer loop',
    '//totalfooter = apex.item(''P143_FVALUE'').getValue();',
    '',
    'totalamount             = amount + totalfooter;',
    '',
    '',
    '',
    '',
    'model.setValue(record,''FOOTERAMOUNT'',totalfooter);',
    '//alert(totalamount); ',
    '  ',
    '',
    'model.setValue(record,''RATE'',rate)  ; ',
    'model.setValue(record,''AMOUNT'',amount)  ; ',
    'model.setValue(record,''TOTALAMOUNT'',totalamount)  ; ',
    '',
    '   sumoffooteramount +=   totalfooter;',
    '   sumofamount       +=   amount;',
    '   sumoftotalamount  +=   totalamount;',
    '',
    'apex.item(''P143_SUMOFFOOTERAMOUNT'').setValue(sumoffooteramount);',
    'apex.item(''P143_SUMOFAMOUNT'').setValue(sumofamount);',
    'apex.item(''P143_PURCHASEBILLAMOUNT'').setValue(sumoftotalamount);',
    '    } catch(ex){}',
    '})',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(501655972534822916)
,p_event_id=>wwv_flow_imp.id(501655101178822909)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'set amount'
,p_static_id=>'set-amount'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'AMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,RATE',
  'plsql_expression', ':quantity1 * :rate',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(501655534197822914)
,p_event_id=>wwv_flow_imp.id(501655101178822909)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'set rate'
,p_static_id=>'set-rate'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,RATE,AMOUNT,WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE,DISCOUNTRATE,RATEAFTERDISCOUNT',
  'plsql_expression', ':WITHOUTDISCOUNTRATE - :DISCOUNTRATE',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(501656490042822916)
,p_event_id=>wwv_flow_imp.id(501655101178822909)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'set total amount'
,p_static_id=>'set-total-amount'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTALAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,RATE,FOOTERAMOUNT',
  'plsql_expression', '(:quantity1 * :rate) + :FOOTERAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600869860434726227)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600850946469545126)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600869951689726228)
,p_event_id=>wwv_flow_imp.id(600869860434726227)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1339747377681970406)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600873225176726260)
,p_name=>'Select GRN'
,p_static_id=>'select-grn'
,p_event_sequence=>270
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(600815198305447250)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600873261177726261)
,p_event_id=>wwv_flow_imp.id(600873225176726260)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var i, i_grntno = ":", ',
    '',
    'model = this.data.model;',
    '',
    'for ( i = 0; i < this.data.selectedRecords.length; i++ ) {',
    '    ',
    '     ',
    '    i_grntno += model.getValue( this.data.selectedRecords[i], "GRNTNO") + ":";',
    '    ',
    '}',
    '',
    'apex.item( "P143_SELECTEDGRN" ).setValue (i_grntno);')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600873382125726262)
,p_event_id=>wwv_flow_imp.id(600873225176726260)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_SELECTEDGRN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(601382171975650827)
,p_name=>'Select GRN_1'
,p_static_id=>'select-grn-2'
,p_event_sequence=>280
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(600815198305447250)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(601382342999650828)
,p_event_id=>wwv_flow_imp.id(601382171975650827)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var config = apex.region("GRNSelection1").widget().interactiveGrid("getViews", "grid");',
    'var selectedRecords = config.model.getSelectedRecords();',
    '',
    'var extractedValues = selectedRecords.map(function(record) {',
    '    return config.model.getValue(record, ''GRNTNO''); ',
    '}).join('':'');',
    '',
    '$s("P143_SELECTEDGRN", extractedValues);',
    '',
    '',
    '',
    '// var model =apex.region("GRNSelection1").widget().interactiveGrid("getViews", "grid").model.getSelectedRecords()',
    '',
    '// var extractedValues = model.map(function(record) {',
    '//     return record[4];',
    '// }).join('':'');',
    '',
    '// $s("P143_SELECTEDGRN",extractedValues);',
    '')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58361712436166420)
,p_event_id=>wwv_flow_imp.id(601382171975650827)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var grid = apex.region(''GRNSelection1'').call(''getViews'', ''grid'');',
    'var selectedRecords = grid.view$.grid(''getSelectedRecords'');',
    'var ids = [];',
    '',
    'selectedRecords.forEach(function(record) {',
    '    ids.push(record[5]); // First column (GRNTNO)',
    '});',
    '',
    'apex.item(''P143_SELECTEDGRN'').setValue(ids.join('':''));',
    'console.log(apex.item(''P143_SELECTEDGRN'').getValue());')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600870122546726229)
,p_name=>'Set Amount'
,p_static_id=>'set-amount'
,p_event_sequence=>210
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(596723855758907765)
,p_triggering_element=>'QUANTITY1,RATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600870225012726230)
,p_event_id=>wwv_flow_imp.id(600870122546726229)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'AMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,RATE',
  'sql_query', 'select nvl(:QUANTITY1,0)*nvl(:RATE,0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(294863693611514220)
,p_name=>'set amount'
,p_static_id=>'set-amount-2'
,p_event_sequence=>580
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(596723855758907765)
,p_triggering_element=>'QUANTITY1,QUANTITY2,RATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(294864092029514223)
,p_event_id=>wwv_flow_imp.id(294863693611514220)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1,QUANTITY2,RATE,AMOUNT,TOTALAMOUNT,P143_FORMSTATUS,FOOTERAMOUNT',
  'items_to_submit', 'QUANTITY1,QUANTITY2,RATE,AMOUNT,TOTALAMOUNT,TNO,SNO,ITEMCODE,ITEMSPECIFICATIONCODE,RATEMEASURINGUNITCODE,P143_PARTYCODE,P143_TRANSACTIONTYPECODE,P143_HSNCODE,P143_FORMSTATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    '    unit1 varchar2(30);',
    '    unit2 varchar2(30);',
    '    tmp    number;',
    '    phsn varchar(30);',
    ' ',
    'begin',
    '--  APEX_UTIL.SET_SESSION_STATE (',
    '--      ''QUANTITY1'',',
    '--      :QUANTITY1);',
    '--  APEX_UTIL.SET_SESSION_STATE (',
    '--      ''QUANTITY2'',',
    '--      :QUANTITY2);',
    '--  APEX_UTIL.SET_SESSION_STATE (',
    '--      ''ITEMCODE'',',
    '--      :ITEMCODE);',
    '--  APEX_UTIL.SET_SESSION_STATE (',
    '--      ''ITEMSPECIFICATIONCODE'',',
    '--      :ITEMSPECIFICATIONCODE);',
    '--raise_application_error(-20000,''Qty ''||:quantity1);',
    '     :Quantity1 := round(:QUANTITY1 ,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ;',
    '    select max(MULTIPLYINGFACTOR) into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;      ',
    '    :quantity2 := round(:QUANTITY1*nvl(mfactor,1),3);',
    '',
    '    FOR vloop in ( select MEASURINGUNITCODE1,MEASURINGUNITCODE2 from item where itemcode = :itemcode) loop',
    '    unit1 := vloop.measuringunitcode1;',
    '    unit2 := vloop.measuringunitcode2;',
    '    end loop;',
    '    ',
    '    if :RATEMEASURINGUNITCODE = unit1 then',
    '       :AMOUNT := nvl(:RATE,0)*nvl(:QUANTITY1,0);',
    '    else ',
    '       :AMOUNT := nvl(:RATE,0)*nvl(:QUANTITY2,0);',
    '    end if;',
    '    ',
    '    :P143_DFAMOUNT   := :Amount ;',
    '    :P143_DFQUANTITY1 := :Quantity1;',
    '',
    '    for vloop in (',
    '        select trim(hsncode) hsncode from itemspecification where itemspecificationcode = :itemspecificationcode',
    '    ) loop',
    '        :P143_HSNCODE := vloop.hsncode;',
    '    end loop;',
    '     ',
    '    if nvl(:Rate,0) > 0 then',
    '    --raise_application_error(-20000,''100'');',
    '     -- RAISE_APPLICATION_ERROR(-20000,''party ''||:P143_PARTYCODE||''tr type ''||:P143_TRANSACTIONTYPECODE||'' hsn ''||:P143_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P143_DFAMOUNT||'' specs''||:itemspecificationcode);',
    '',
    '   DELETE FROM PURCHASEBILLDETAILFOOTER WHERE TNO = :TNO AND SNO = :SNO;',
    '',
    '    for vTaxRule',
    '    				in (',
    '    					select',
    '    						rownum as slno,',
    '    						b.TNo,',
    '    						b.SNO,',
    '    						a.LegendsCode,',
    '    						c.FooterHeadCode,',
    '    						c.FooterHeadName,',
    '    						b.TaxRate as FooterPercent,',
    '                            (:AMOUNT * B.TAXrATE) /100 AS FooterValue',
    '    					from TaxRuleDetail a, TaxRuleDetailFooter b, FooterHead c, TaxRule d, TaxRuleHSN e, party F',
    '    					where a.TNO = b.TNo',
    '    						and a.SNO = b.SNo',
    '    						and b.FooterHeadCode = c.FooterHeadCode',
    '    						and a.TNO = d.TNo',
    '                            and d.tno = e.tno',
    '                            and d.TaxRegistrationTypeCode = f.TaxRegistrationTypeCode',
    '                            and f.PartyCode = :P143_PARTYCODE',
    '                            And d.transactiontypecode = :P143_TRANSACTIONTYPECODE',
    '                            and e.HSNCODE = :P143_HSNCODE',
    '                            ',
    '    					--order by b.SNo',
    '    				)',
    '    			loop',
    '   -- raise_application_error(-20000,phsn);	',
    '   --if nvl(:rate,0) > 0 then',
    '   --RAISE_APPLICATION_ERROR(-20000,''party ''||:P143_PARTYCODE||''tr type ''||:P143_TRANSACTIONTYPECODE||'' hsn ''||:P143_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P143_DFAMOUNT||'' specs''||:itemspecificationcode||'' footervalue ''||vTaxRule.Footer'
||'Value);',
    '   --end if;',
    '    			    Insert into PURCHASEBILLDETAILFOOTER',
    '                    (tno,sno,sn,footerheadcode,footerpercent,footervalue,serialno,legendscode)',
    '    				values',
    '                    (:TNO,:SNO,globaltno.nextval, vTaxRule.FooterHeadCode,vTaxRule.FooterPercent,vTaxRule.FooterValue,vTaxRule.Slno,vTaxRule.LegendsCode);',
    '    			end loop; -- for vTaxRule',
    '                commit;',
    '    end if;',
    '',
    '   ----',
    '   SELECT SUM(FOOTERVALUE) INTO :footeramount from PURCHASEBILLDETAILFOOTER',
    '   where tno = :TNO',
    '     and sno = :SNO;',
    '   ',
    '   :Totalamount := nvl(:amount,0) + nvl(:footeramount,0);',
    '',
    'end;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'Y')).to_clob
,p_wait_for_result=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(294865131509514224)
,p_event_id=>wwv_flow_imp.id(294863693611514220)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600745117815249260)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(294864639559514224)
,p_event_id=>wwv_flow_imp.id(294863693611514220)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'set summary'
,p_static_id=>'set-summary'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'setTimeout(function(){',
    'let model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model; // retrieve the model',
    'let quantity1_total = 0;',
    'let quantity2_total = 0;',
    'let discountrate_total = 0;',
    'let amount_total = 0;',
    'let footeramount_total = 0;',
    'let totalamount_total = 0;',
    '',
    'model.forEach(function(record, index, id) {',
    '    meta = model.getRecordMetadata(id);',
    '    if (model.getValue(record, "QUANTITY1") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity1_total += Number(model.getValue(record, "QUANTITY1"));',
    '    }',
    '    if (model.getValue(record, "QUANTITY2") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity2_total += Number(model.getValue(record, "QUANTITY2"));',
    '    }',
    '    if (model.getValue(record, "DISCOUNTRATE") !== "" && !meta.deleted && !meta.agg) {',
    '        discountrate_total += Number(model.getValue(record, "DISCOUNTRATE"));',
    '    }',
    '    if (model.getValue(record, "AMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        amount_total += Number(model.getValue(record, "AMOUNT"));',
    '    }',
    '    if (model.getValue(record, "FOOTERAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        footeramount_total += Number(model.getValue(record, "FOOTERAMOUNT"));',
    '    }',
    '    if (model.getValue(record, "TOTALAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        totalamount_total += Number(model.getValue(record, "TOTALAMOUNT"));',
    '    }',
    '});',
    '',
    '$s(''P143_SUMOFAMOUNT'',amount_total);',
    '$s(''P143_SUMOFFOOTERAMOUNT'',footeramount_total);',
    '$s(''P143_PURCHASEBILLAMOUNT'',totalamount_total);',
    '',
    '},400',
    ');',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(293459628908354881)
,p_name=>'set amount_1'
,p_static_id=>'set-amount-3'
,p_event_sequence=>590
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(596723855758907765)
,p_triggering_element=>'QUANTITY1,QUANTITY2,RATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(33493193637959552)
,p_event_id=>wwv_flow_imp.id(293459628908354881)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'QUANTITY1,QUANTITY2,RATE,AMOUNT,TOTALAMOUNT,TNO,SNO,ITEMCODE,ITEMSPECIFICATIONCODE,RATEMEASURINGUNITCODE,P143_PARTYCODE,P143_TRANSACTIONTYPECODE,P143_HSNCODE,P143_FORMSTATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    '    unit1 varchar2(30);',
    '    unit2 varchar2(30);',
    '    tmp    number;',
    '    phsn varchar(30);',
    ' ',
    'begin',
    '',
    '     ',
    '     :AMOUNT := nvl(:RATE,0)*nvl(:QUANTITY1,0);',
    '    ',
    '    ',
    '    :P143_DFAMOUNT   := :Amount ;',
    '    :P143_DFQUANTITY1 := :Quantity1;',
    '',
    '    for vloop in (',
    '        select trim(hsncode) hsncode from itemspecification where itemspecificationcode = :itemspecificationcode',
    '    ) loop',
    '        :P143_HSNCODE := vloop.hsncode;',
    '    end loop;',
    '     ',
    '    if nvl(:Rate,0) > 0 then',
    '    --raise_application_error(-20000,''100'');',
    '     -- RAISE_APPLICATION_ERROR(-20000,''party ''||:P143_PARTYCODE||''tr type ''||:P143_TRANSACTIONTYPECODE||'' hsn ''||:P143_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P143_DFAMOUNT||'' specs''||:itemspecificationcode);',
    '',
    '   DELETE FROM PURCHASEBILLDETAILFOOTER WHERE TNO = :TNO AND SNO = :SNO;',
    '',
    '    for vTaxRule',
    '    				in (',
    '    					select',
    '    						rownum as slno,',
    '    						b.TNo,',
    '    						b.SNO,',
    '    						a.LegendsCode,',
    '    						c.FooterHeadCode,',
    '    						c.FooterHeadName,',
    '    						b.TaxRate as FooterPercent,',
    '                            (:AMOUNT * B.TAXrATE) /100 AS FooterValue',
    '    					from TaxRuleDetail a, TaxRuleDetailFooter b, FooterHead c, TaxRule d, TaxRuleHSN e, party F',
    '    					where a.TNO = b.TNo',
    '    						and a.SNO = b.SNo',
    '    						and b.FooterHeadCode = c.FooterHeadCode',
    '    						and a.TNO = d.TNo',
    '                            and d.tno = e.tno',
    '                            and d.TaxRegistrationTypeCode = f.TaxRegistrationTypeCode',
    '                            and f.PartyCode = :P143_PARTYCODE',
    '                            And d.transactiontypecode = :P143_TRANSACTIONTYPECODE',
    '                            and e.HSNCODE = :P143_HSNCODE',
    '                            ',
    '    					--order by b.SNo',
    '    				)',
    '    			loop',
    '   -- raise_application_error(-20000,phsn);	',
    '   --if nvl(:rate,0) > 0 then',
    '   --RAISE_APPLICATION_ERROR(-20000,''party ''||:P143_PARTYCODE||''tr type ''||:P143_TRANSACTIONTYPECODE||'' hsn ''||:P143_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P143_DFAMOUNT||'' specs''||:itemspecificationcode||'' footervalue ''||vTaxRule.Footer'
||'Value);',
    '   --end if;',
    '    			    Insert into PURCHASEBILLDETAILFOOTER',
    '                    (tno,sno,sn,footerheadcode,footerpercent,footervalue,serialno,legendscode)',
    '    				values',
    '                    (:TNO,:SNO,globaltno.nextval, vTaxRule.FooterHeadCode,vTaxRule.FooterPercent,vTaxRule.FooterValue,vTaxRule.Slno,vTaxRule.LegendsCode);',
    '    			end loop; -- for vTaxRule',
    '    end if;',
    '',
    '   ----',
    '   SELECT SUM(FOOTERVALUE) INTO :footeramount from PURCHASEBILLDETAILFOOTER',
    '   where tno = :TNO',
    '     and sno = :SNO;',
    '   ',
    '   :Totalamount := nvl(:amount,0) + nvl(:footeramount,0);',
    '',
    'end;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(293459685737354882)
,p_event_id=>wwv_flow_imp.id(293459628908354881)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY2,AMOUNT,FOOTERAMOUNT,TOTALAMOUNT,P143_DFAMOUNT',
  'items_to_submit', 'TNO,SNO,ITEMSPECIFICATIONCODE,QUANTITY1,RATE,P143_TAXINROUND',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  tlegendscode varchar2(30);',
    '  tfooterheadcode varchar2(30);',
    '  tfooterpercent  number;',
    '  tfootervalue    number;',
    '  tfooteramount   number;',
    '  mfactor		  number;',
    '',
    'begin',
    '   select max(multiplyingfactor) into mfactor from itemspecification where itemspecificationcode = :itemspecificationcode;',
    '   :quantity2             := mfactor * :quantity1 ;',
    '   ',
    '   :quantity2             := round(:QUANTITY2,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ;',
    '   ',
    '  ',
    '   :amount := nvl(:QUANTITY1,0) *nvl(:RATE,0);',
    '   ---',
    '   :P143_DFAMOUNT := :amount;',
    '',
    '',
    '--raise_application_error(-20001,'' Qty2 ''||to_char(:quantity2,0)||'' d.amt ''||nvl(:DISCREPANCYAMOUNT,0)||'' r qty ''||nvl(:rejectedquantity1,0)||'' amt ''||nvl(:amount,0));',
    '',
    '',
    '   --- ',
    '     for vfooter in (',
    '	    Select * From PurchaseBillDetailFooter a where tno = :TNO and SNO = :SNO',
    '	 ) loop',
    '	 ',
    '		--if vfooter.legendscode = ''PRA'' then ',
    '        if :P143_TAXINROUND=''YES'' then',
    '			tfootervalue := round((:amount * vfooter.footerpercent ) /100,0);',
    '            tlegendscode := ''PRA'';',
    '		end if;',
    '',
    '		if vfooter.legendscode = ''PRD'' then ',
    '			tfootervalue := (-1)* round((:amount * vfooter.footerpercent ) /100,0);',
    '',
    '		end if;',
    '		if :P143_TAXINROUND=''NO'' then  ',
    '			tfootervalue := round((:amount * vfooter.footerpercent ) /100,2);',
    '            tlegendscode := ''PAA'';',
    '		end if;',
    '',
    '		if vfooter.legendscode = ''PAD'' then ',
    '			tfootervalue := (-1)* round((:amount * vfooter.footerpercent ) /100,2);',
    '		end if;',
    '		if vfooter.legendscode = ''OQA'' then ',
    '			tfootervalue := (-1)* round((nvl(:RejectedQuantity1,0) * vfooter.footerpercent ) /100,2);',
    '		end if;',
    '		',
    '		update PurchaseBillDetailFooter x',
    '		   set x.footervalue = tfootervalue,',
    '               x.legendscode = nvl(tlegendscode,vfooter.legendscode)',
    '		 where x.tno = vfooter.tno',
    '		   and x.sno = vfooter.sno',
    '		   and x.sn = vfooter.sn',
    '		   and x.footerheadcode = vfooter.Footerheadcode',
    '		   ;',
    '	 end loop;',
    '	 select sum(footervalue) into tfooteramount ',
    '	 from PurchaseBillDetailFooter ',
    '	 where tno = :tno',
    '	   and sno = :sno;',
    '	   ',
    '	   :FooterAmount := nvl(tfooteramount,0);',
    '	   :totalamount  := nvl(:Amount,0) + nvl(:FooterAmount,0);',
    '	 ',
    'end;',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(293459949979354884)
,p_event_id=>wwv_flow_imp.id(293459628908354881)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600745117815249260)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209260926143850001)
,p_event_id=>wwv_flow_imp.id(293459628908354881)
,p_event_result=>'TRUE'
,p_action_sequence=>15
,p_execute_on_page_init=>'N'
,p_name=>'Recalculate Purchase Bill line atomically'
,p_static_id=>'recalculate-purchase-bill-line-atomically'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'SNO,QUANTITY1,QUANTITY2,AMOUNT,FOOTERAMOUNT,TOTALAMOUNT,P143_DFAMOUNT,P143_DFQUANTITY1',
  'items_to_submit', 'TNO,SNO,ITEMCODE,ITEMSPECIFICATIONCODE,QUANTITY1,QUANTITY2,RATE,RATEMEASURINGUNITCODE,P143_PARTYCODE,P143_TRANSACTIONTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '  if :SNO is null then',
    '    select globaltno.nextval into :SNO from dual;',
    '  end if;',
    '',
    '  imart_purchasebill_calc.recalculate_line(',
    '    p_tno                   => :TNO,',
    '    p_sno                   => :SNO,',
    '    p_itemcode              => :ITEMCODE,',
    '    p_itemspecificationcode => :ITEMSPECIFICATIONCODE,',
    '    p_quantity1             => :QUANTITY1,',
    '    p_quantity2             => :QUANTITY2,',
    '    p_rate                  => :RATE,',
    '    p_rate_uom              => :RATEMEASURINGUNITCODE,',
    '    p_partycode             => :P143_PARTYCODE,',
    '    p_transactiontypecode   => :P143_TRANSACTIONTYPECODE,',
    '    o_quantity1             => :QUANTITY1,',
    '    o_quantity2             => :QUANTITY2,',
    '    o_amount                => :AMOUNT,',
    '    o_footeramount          => :FOOTERAMOUNT,',
    '    o_totalamount           => :TOTALAMOUNT',
    '  );',
    '',
    '  :P143_DFAMOUNT := :AMOUNT;',
    '  :P143_DFQUANTITY1 := :QUANTITY1;',
    'end;')),
  'show_processing', 'N',
  'suppress_change_event', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(293459785523354883)
,p_event_id=>wwv_flow_imp.id(293459628908354881)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'set summary'
,p_static_id=>'set-summary'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'const model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model;',
    'let amountTotal = 0;',
    'let footerTotal = 0;',
    'let beforeRound = 0;',
    '',
    'model.forEach(function(record, index, id) {',
    '  const meta = model.getRecordMetadata(id);',
    '  if (meta.deleted || meta.agg) { return; }',
    '  amountTotal += Number(model.getValue(record, "AMOUNT")) || 0;',
    '  footerTotal += Number(model.getValue(record, "FOOTERAMOUNT")) || 0;',
    '  beforeRound += Number(model.getValue(record, "TOTALAMOUNT")) || 0;',
    '});',
    '',
    'const roundBill = String($v("P143_BILLINROUNDFIGURE")).toUpperCase() === "YES";',
    'const finalAmount = roundBill ? Math.round(beforeRound) : beforeRound;',
    'const roundOff = finalAmount - beforeRound;',
    '',
    '$s("P143_SUMOFAMOUNT", amountTotal);',
    '$s("P143_SUMOFFOOTERAMOUNT", footerTotal);',
    '$s("P143_PURCHASEBILLAMOUNTBEFOREROUND", beforeRound);',
    '$s("P143_ROUNDOFF", roundOff);',
    '$s("P143_PURCHASEBILLAMOUNT", finalAmount);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(596723683013907763)
,p_name=>'Set Currency Value'
,p_static_id=>'set-currency-value'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P143_CURRENCYUNITCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(596723784213907764)
,p_event_id=>wwv_flow_imp.id(596723683013907763)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_CURRENCYVALUE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_CURRENCYUNITCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select CURRENCYVALUE from currencyunit',
    'where CURRENCYUNITCODE = :P143_CURRENCYUNITCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(502723543565667398)
,p_name=>'set decimal qty1'
,p_static_id=>'set-decimal-qty'
,p_event_sequence=>560
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(596723855758907765)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(502723595325667399)
,p_event_id=>wwv_flow_imp.id(502723543565667398)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,ITEMCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '  round(:QUANTITY1 ,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(502723743951667400)
,p_name=>'set decimal qty2'
,p_static_id=>'set-decimal-qty-2'
,p_event_sequence=>570
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(596723855758907765)
,p_triggering_element=>'QUANTITY2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(502723827053667401)
,p_event_id=>wwv_flow_imp.id(502723743951667400)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY2,ITEMCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '  round(:QUANTITY2,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447057751779861618)
,p_name=>'Set DFAMOUNT'
,p_static_id=>'set-dfamount'
,p_event_sequence=>340
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(596723855758907765)
,p_triggering_element=>'AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447057786945861619)
,p_event_id=>wwv_flow_imp.id(447057751779861618)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_DFAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNT',
  'sql_query', 'select nvl(:AMOUNT,0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195453411940133688)
,p_name=>'set footer'
,p_static_id=>'set-footer'
,p_event_sequence=>355
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(596723855758907765)
,p_triggering_element=>'FOOTERAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195453446563133689)
,p_event_id=>wwv_flow_imp.id(195453411940133688)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'FOOTERAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'TNO,SNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(sum(footervalue),0) from purchasebilldetailfooter',
    'where tno = :tno',
    'and sno = :sno')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447058086828861622)
,p_name=>'Set Footer and Total Amount'
,p_static_id=>'set-footer-and-total-amount'
,p_event_sequence=>360
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(596723855758907765)
,p_triggering_element=>'AMOUNT,FD,FOOTERAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447058242775861623)
,p_event_id=>wwv_flow_imp.id(447058086828861622)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTALAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_FVALUE,P143_DFAMOUNT',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(:P143_FVALUE,0)+nvl(:P143_DFAMOUNT,0) as A',
    'from dual  ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'GREATER_THAN'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P143_FVALUE'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(503410103096376928)
,p_event_id=>wwv_flow_imp.id(447058086828861622)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTALAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNT,FOOTERAMOUNT',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(:AMOUNT,0)+nvl(:FOOTERAMOUNT,0) as A',
    'from dual  ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447354690331243094)
,p_name=>'Set Footer Total'
,p_static_id=>'set-footer-total'
,p_event_sequence=>460
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600817123858447269)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447354845220243095)
,p_event_id=>wwv_flow_imp.id(447354690331243094)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var widget = apex.region(''Detail'').widget();',
    'var grid = widget.interactiveGrid("getViews", "grid");',
    'var model = grid.model;',
    '',
    '// Get the selected records',
    'var selectedRecords = grid.getSelectedRecords();',
    '',
    '// Iterate over the selected records and set a value in a specific column',
    'for (var i = 0; i < selectedRecords.length; i++) {',
    '  var record = selectedRecords[i];',
    '  var columnAlias1 = "FOOTERAMOUNT"; // Replace with the alias of the column you want to set a value for',
    '  var value1 = $v("P143_FVALUE"); // Replace with the new value you want to set',
    '  var columnAlias2 = "TOTALAMOUNT"; // Replace with the alias of the column you want to set a value for',
    '  var value2 =  (parseInt($v("P143_FVALUE"), 10)+ parseInt($v("P143_DFAMOUNT"), 10)).toString(); // Replace with the new value you want to set',
    '  ',
    '',
    '  model.setValue(record, columnAlias1, value1);',
    '  model.setValue(record, columnAlias2, value2);',
    '}',
    '//var selectedRowIds = grid.getSelectedRowIds();',
    '//var view = grid.view();',
    '//// Iterate over the array to access each selected row ID',
    '////for (var i = 0; i < selectedRowIds.length; i++) {',
    '////  var rowId = selectedRowIds[i];',
    '////  // Access or manipulate the row ID as needed',
    '////}',
    '//var rowId = selectedRecords[0];',
    '//view.setSelection(rowId, false);',
    '//console.log(apex.region(''Detail'').getSelectedRowIds())',
    '//console.log(apex.region(''Detail'').getViewId())',
    '//grid.refresh();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600870724785726235)
,p_name=>'Set Other Values'
,p_static_id=>'set-other-values'
,p_event_sequence=>220
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P143_PARTYBILLNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447057440361861615)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Disable GetItem Button'
,p_static_id=>'disable-getitem-button'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600817293418447271)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P143_PURCHASEORDERTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447057322154861614)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Disable GRNDetail'
,p_static_id=>'disable-grndetail'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600817223067447270)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P143_PURCHASEORDERTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447057570375861617)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'Enable GetItem Button'
,p_static_id=>'enable-getitem-button'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600817293418447271)
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P143_PURCHASEORDERTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447057552618861616)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Enable GRNDetail'
,p_static_id=>'enable-grndetail'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600817223067447270)
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P143_PURCHASEORDERTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600870947129726238)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_PURCHASEORDERTNO,P143_TNO,P143_FORMSTATUS,P143_PARTYBILLNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--if :P143_FORMSTATUS = ''NEWRECORD'' then',
    '',
    '    delete from PURCHASEBILLDETAIL where tno = :P143_TNO;',
    '    ',
    '    insert into PURCHASEBILLDETAIL',
    '    (',
    '        tno,',
    '        sno,',
    '        PURCHASEORDERTNO,',
    '        ITEMCODE,',
    '        ITEMSPECIFICATIONCODE,',
    '        QUANTITY1,',
    '        QUANTITY2,',
    '        RATEMEASURINGUNITCODE,',
    '        RATE,',
    '        AMOUNT,',
    '        FOOTERAMOUNT,',
    '        TOTALAMOUNT',
    '    )',
    '    ',
    '    (',
    '        select',
    '            :P143_TNO,',
    '            a.SNo,',
    '            b.TNo as PurchaseOrderTNO,',
    '            a.ItemCode,',
    '            a.ItemSpecificationCode,',
    '            a.ChalanQuantity1,',
    '            a.ChalanQuantity2,',
    '            b.RateMeasuringUnitcode,',
    '            b.Rate,',
    '            a.ChalanQuantity1 * b.Rate,',
    '            e.footeramount,',
    '            e.totalamount',
    '    from GRNDetail a, BOMPurchaseOrderDetail b, Item c, ItemSpecification d , PurchaseOrderDetail e',
    '    where a.PurchaseOrderTNo = b.TNo ',
    '            and a.ItemCode = b.ItemCode',
    '            and a.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.ItemCode = c.ItemCode',
    '            and a.ItemSpecificationCode = d.ItemSpecificationCode',
    '            and a.TNo in (select tno from grn where  REFDOCTYPECODE = ''BILL'' and  RefDocNo = :P143_PARTYBILLNO and purchaseordertno = a.PurchaseOrderTNo )',
    '            and e.tno = a.PurchaseOrderTNo',
    '             and e.ItemCode = b.ItemCode',
    '            and e.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.PurchaseOrderTno = :P143_PURCHASEORDERTNO',
    '    union all',
    '    select',
    '            :P143_TNO,',
    '            e.SNo,',
    '            e.TNo as PurchaseOrderTNO,',
    '            e.ItemCode,',
    '            e.ItemSpecificationCode,',
    '            e.Quantity1,',
    '            e.Quantity2,',
    '            b.RateMeasuringUnitcode,',
    '            b.Rate,',
    '            e.Quantity1 * b.Rate,',
    '            e.footeramount,',
    '            e.totalamount',
    '    from  BOMPurchaseOrderDetail b, Item c, ItemSpecification d , PurchaseOrderDetail e',
    '    where b.TNo = e.TNo',
    '            and b.ItemCode = e.ItemCode',
    '            and b.ItemSpecificationCode = e.ItemSpecificationCode',
    '            and b.ItemCode = c.ItemCode',
    '            and b.ItemSpecificationCode = d.ItemSpecificationCode ',
    '            and e.itemcode in (select itemcode from item where itemnaturecode = ''SERVICES'')',
    '            and e.Tno = :P143_PURCHASEORDERTNO',
    '            ',
    '            ',
    '            ',
    '    ) ;',
    '     ',
    '',
    '--end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(298910372552175650)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_PURCHASEORDERTNO,P143_TNO,P143_FORMSTATUS,P143_PARTYBILLNO,P143_PURCHASEBILLDATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--if :P143_FORMSTATUS = ''NEWRECORD'' then',
    '',
    '    delete from PURCHASEBILLDETAIL where tno = :P143_TNO;',
    '    ',
    '    insert into PURCHASEBILLDETAIL',
    '    (',
    '        tno,',
    '        sno,',
    '        PURCHASEORDERTNO,',
    '        ITEMCODE,',
    '        ITEMSPECIFICATIONCODE,',
    '        QUANTITY1,',
    '        QUANTITY2,',
    '        RATEMEASURINGUNITCODE,',
    '        RATE,',
    '        AMOUNT,',
    '        FOOTERAMOUNT,',
    '        TOTALAMOUNT',
    '    )',
    '    (select :P143_TNO , globaltno.nextval, PurchaseOrderTNO, ItemCode, ItemSpecificationCode,',
    '     ChalanQuantity1 , ChalanQuantity2 , RateMeasuringUnitcode , Rate , amt , footeramount , totalamount ',
    '     from ',
    '    (',
    '        select',
    '            :P143_TNO,',
    '            a.SNo,',
    '            b.TNo as PurchaseOrderTNO,',
    '            a.ItemCode,',
    '            a.ItemSpecificationCode,',
    '            a.ChalanQuantity1,',
    '            a.ChalanQuantity2,',
    '            b.RateMeasuringUnitcode,',
    '           case when nvl(f.EFFECTIVEFROMDATE,sysdate) <= :P143_PURCHASEBILLDATE then',
    '            nvl(g.rate,e.rate)',
    '            else',
    '            e.rate',
    '            end rate,',
    '            a.ChalanQuantity1 * b.Rate as amt,',
    '            e.footeramount,',
    '            e.totalamount',
    '    from GRNDetail a, BOMPurchaseOrderDetail b, Item c, ItemSpecification d , PurchaseOrderDetail e ,',
    '            poamendment f , poamendmentdetail g',
    '    where a.PurchaseOrderTNo = b.TNo ',
    '            and a.ItemCode = b.ItemCode',
    '            and a.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.ItemCode = c.ItemCode',
    '            and a.ItemSpecificationCode = d.ItemSpecificationCode',
    '            and a.TNo in (select tno from grn where  REFDOCTYPECODE = ''BILL'' and  RefDocNo = :P143_PARTYBILLNO and purchaseordertno = a.PurchaseOrderTNo )',
    '            and e.tno = a.PurchaseOrderTNo',
    '             and e.ItemCode = b.ItemCode',
    '            and e.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.PurchaseOrderTno = :P143_PURCHASEORDERTNO',
    '             and f.PurchaseOrderTno(+) = a.PurchaseOrderTNo',
    '            and f.tno = g.tno(+)',
    '            and a.ItemCode = g.ItemCode(+)',
    '            and a.ItemSpecificationCode = g.ItemSpecificationCode(+)',
    '    union all',
    '    select',
    '            :P143_TNO,',
    '            e.SNo,',
    '            e.TNo as PurchaseOrderTNO,',
    '            e.ItemCode,',
    '            e.ItemSpecificationCode,',
    '            e.Quantity1,',
    '            e.Quantity2,',
    '            b.RateMeasuringUnitcode,',
    '            b.Rate,',
    '            e.Quantity1 * b.Rate,',
    '            e.footeramount,',
    '            e.totalamount',
    '    from  BOMPurchaseOrderDetail b, Item c, ItemSpecification d , PurchaseOrderDetail e',
    '    where b.TNo = e.TNo',
    '            and b.ItemCode = e.ItemCode',
    '            and b.ItemSpecificationCode = e.ItemSpecificationCode',
    '            and b.ItemCode = c.ItemCode',
    '            and b.ItemSpecificationCode = d.ItemSpecificationCode ',
    '            and e.itemcode in (select itemcode from item where itemnaturecode = ''SERVICES'')',
    '            and e.Tno = :P143_PURCHASEORDERTNO',
    '            ',
    '            ',
    '            ',
    '    )) ;',
    '     ',
    '',
    '--end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600872046256726249)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-3'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_PURCHASEORDERTNO,P143_TNO,P143_FORMSTATUS,P143_PARTYBILLNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--if :P143_FORMSTATUS = ''NEWRECORD'' then',
    '',
    '   --raise_application_error(-20000,''101'');',
    '',
    '    delete from PurchaseBillGRNDetail where tno = :P143_TNO;',
    '    ',
    '   Insert into PurchaseBillGRNDetail(',
    '			TNO,',
    '			SNo,',
    '			GRNTNo,',
    '			GRNSNo',
    '	)',
    '    (',
    '        select',
    '           :P143_TNO,',
    '            g.SNo,',
    '            a.TNo,',
    '            a.SNo',
    '    from GRNDetail a, BOMPurchaseOrderDetail b, Item c, ItemSpecification d , PurchaseOrderDetail e , purchasebilldetail g',
    '    where a.PurchaseOrderTNo = b.TNo ',
    '            and a.ItemCode = b.ItemCode',
    '            and a.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.ItemCode = c.ItemCode',
    '            and a.ItemSpecificationCode = d.ItemSpecificationCode',
    '            and a.TNo in (select tno from grn where REFDOCTYPECODE = ''BILL'' and RefDocNo = :P143_PARTYBILLNO and purchaseordertno = a.purchaseordertno)',
    '            and e.tno = a.PurchaseOrderTNo',
    '             and e.ItemCode = b.ItemCode',
    '            and e.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.PurchaseOrderTno = :P143_PURCHASEORDERTNO',
    '             and g.ItemCode = a.ItemCode',
    '            and g.ItemSpecificationCode = a.ItemSpecificationCode',
    '             and g.ItemCode = b.ItemCode',
    '            and g.ItemSpecificationCode = b.ItemSpecificationCode',
    '           and g.PurchaseOrderTno = :P143_PURCHASEORDERTNO',
    '            and g.tno =  :P143_TNO',
    '            ',
    '            ',
    '    );',
    '',
    '--end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600872392271726252)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-4'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_PURCHASEORDERTNO,P143_TNO,P143_FORMSTATUS,P143_PARTYBILLNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    'TMP NUMBER;',
    'BEGIN',
    '',
    'delete from PurchaseBillDetailfooter where tno = :P143_TNO;',
    'COMMIT;',
    '       Insert into PurchaseBillDetailfooter(',
    '                tno,',
    '                sno,',
    '                SN,',
    '    			FOOTERHEADCODE,',
    '                FOOTERPERCENT,',
    '                FOOTERVALUE,',
    '                LEGENDSCODE',
    '    	)',
    '        (',
    '        select ',
    '           :P143_TNO,',
    '            D.SNo,',
    '            b.SERIALNO,',
    '            b.FooterHeadCode,',
    '            b.FooterPercent,',
    '            case when b.legendscode   = ''PRA'' then',
    '                    ROUND(D.amount * b.footerpercent / 100 , 2 )',
    '                 when b.legendscode   = ''PRD'' then',
    '                    ROUND(D.amount * b.footerpercent / 100 , 2 ) * -1',
    '                 when b.legendscode =''PAA'' then',
    '                    round(D.amount * b.footerpercent / 100 , 2) ',
    '                 when b.legendscode =''PAD'' then',
    '                    round(D.amount * b.footerpercent / 100 , 2) ',
    '                 when b.legendscode IN  (''LSA'',''LSD'') then',
    '                    round(b.footervalue , 2)',
    '                 when b.legendscode = (''OQA'') then',
    '                    round(D.QUANTITY1 * B.FOOTERPERCENT , 2)',
    '                 WHEN b.legendscode = (''OQD'') then',
    '                    round((D.QUANTITY1 * B.FOOTERPERCENT),2) * -1',
    '            end footervalue,',
    '            --b.FooterValue,',
    '            b.LegendsCode',
    '        from GRNDetail a, PurchaseOrderDetailfooter b , PurchaseOrderDetail c, PurchaseBillDetail d',
    '        where a.PurchaseOrderTNo = b.TNo ',
    '        and a.PurchaseOrderTNo = c.TNo ',
    '        and b.tno = c.tno',
    '        and c.sno = b.sno',
    '        and c.itemcode = d.itemcode',
    '        and c.itemspecificationcode = d.itemspecificationcode',
    '        and d.tno = :P143_TNO',
    '        and a.ItemCode = c.ItemCode',
    '        and a.ItemSpecificationCode = c.ItemSpecificationCode',
    '        and a.TNo in (select tno from grn where REFDOCTYPECODE = ''BILL'' and RefDocNo = :P143_PARTYBILLNO and purchaseordertno = a.purchaseordertno)     ',
    '        and a.PurchaseOrderTno = :P143_PURCHASEORDERTNO   ',
    '',
    '        union all ',
    '',
    '        select ',
    '           :P143_TNO,',
    '            D.SNo,',
    '            b.SERIALNO,',
    '            b.FooterHeadCode,',
    '            b.FooterPercent,',
    '            case when b.legendscode   = ''PRA'' then',
    '                    ROUND(D.amount * b.footerpercent / 100 , 2 )',
    '                 when b.legendscode   = ''PRD'' then',
    '                    ROUND(D.amount * b.footerpercent / 100 , 2 ) * -1',
    '                 when b.legendscode =''PAA'' then',
    '                    round(D.amount * b.footerpercent / 100 , 2) ',
    '                 when b.legendscode =''PAD'' then',
    '                    round(D.amount * b.footerpercent / 100 , 2) ',
    '                 when b.legendscode IN  (''LSA'',''LSD'') then',
    '                    round(b.footervalue , 2)',
    '                 when b.legendscode = (''OQA'') then',
    '                    round(D.QUANTITY1 * B.FOOTERPERCENT , 2)',
    '                 WHEN b.legendscode = (''OQD'') then',
    '                    round((D.QUANTITY1 * B.FOOTERPERCENT),2) * -1',
    '            end footervalue,',
    '            --b.FooterValue,',
    '            b.LegendsCode',
    '        from  PurchaseOrderDetailfooter b , PurchaseOrderDetail c, PurchaseBillDetail d',
    '        where  b.tno = c.tno',
    '        and b.sno = c.sno',
    '        and c.itemcode = d.itemcode',
    '        and c.itemspecificationcode = d.itemspecificationcode',
    '        and c.itemcode in (select itemcode from item where itemnaturecode = ''SERVICES'')',
    '        and b.tno = :P143_PURCHASEORDERTNO',
    '        and d.tno = :P143_TNO    ',
    '    );',
    '',
    ' for vloop in (',
    '      select tno,sno,sum(footervalue) footervalue',
    '      from PurchaseBillDetailfooter',
    '      where tno = :P143_TNO',
    '      group by tno,sno',
    ' ) loop',
    '',
    '        update PurchaseBillDetail x set x.footeramount =  vloop.footervalue,',
    '                                         X.TOTALAMOUNT = X.AMOUNT +  vloop.footervalue',
    '        where tno = vloop.tno',
    '          and sno = vloop.sno',
    '          ;',
    '          commit;',
    ' end loop;',
    '',
    '--end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600871094518726239)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(596723855758907765)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600872236366726250)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600746501858249274)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600872516842726253)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600745117815249260)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600870751375726236)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PARTYBILLDATE,P143_PURCHASEORDERTNO,P143_TRANSACTIONTYPECODE,P143_NATUREOFSUPPLYCODE,P143_CURRENCYUNITCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PARTYCODE,P143_LOCATIONCODE,P143_PARTYBILLNO,P143_FORMSTATUS',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ',
    '	',
    '	a.RefDocDate ,',
    '	a.PurchaseOrderTNo,',
    '	c.TransactionTypeCode,',
    '	d.NatureOfSupplyCode,',
    '	e.CurrencyUnitCode',
    'from GRN a, PurchaseOrder b, TransactionType c, NatureOfSupply d, CurrencyUnit e',
    'where a.PurchaseOrderTNo = b.TNo',
    '	and b.TransactionTypeCode = c.TransactionTypeCode(+)',
    '	and b.NatureOfSupplyCode = d.NatureOfSupplyCode(+)',
    '	and b.CurrencyUNitCode = e.CurrencyUNitCode(+)',
    '	and a.PartyCode = :P143_PARTYCODE',
    '	and a.CompanyCode = :global_companycode',
    '	and a.PurchaseOrderTNo is not null ',
    '    and  a.LocationCode = :P143_LOCATIONCODE',
    '    and a.RefDocNo = :P143_PARTYBILLNO',
    '	and (not exists(',
    '		select ',
    '			aa.TNo',
    '		from PurchaseBillGRNDetail aa, PurchaseBill pb ',
    '		where aa.GRNTNo = a.TNo',
    '		  and pb.TNo = aa.TNo)',
    '      OR  :p143_formstatus=''EDITRECORD''',
    '    )',
    '    /*UNION ALL',
    '    select ',
    '	',
    '	a.RefDocDate ,',
    '	a.PurchaseOrderTNo,',
    '	c.TransactionTypeCode,',
    '	d.NatureOfSupplyCode,',
    '	e.CurrencyUnitCode',
    'from GRN a, PurchaseOrder b, TransactionType c, NatureOfSupply d, CurrencyUnit e',
    'where a.PurchaseOrderTNo = b.TNo',
    '	and b.TransactionTypeCode = c.TransactionTypeCode(+)',
    '	and b.NatureOfSupplyCode = d.NatureOfSupplyCode(+)',
    '	and b.CurrencyUNitCode = e.CurrencyUNitCode(+)',
    '	and a.PartyCode = :P143_PARTYCODE',
    '	and a.CompanyCode = :global_companycode',
    '	and a.PurchaseOrderTNo is not null ',
    '    and  a.LocationCode = :P143_LOCATIONCODE',
    '    and a.RefDocNo = :P143_PARTYBILLNO',
    '    and :p143_formstatus=''EDITRECORD''',
    '    */')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P143_PURCHASEORDERTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447354988988243097)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_SUMOFAMOUNT,P143_SUMOFFOOTERAMOUNT,P143_PURCHASEBILLAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(amount) , sum(footeramount) , sum(totalamount)',
    'from purchasebilldetail',
    'where tno = :P143_TNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209260926143850003)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>95
,p_execute_on_page_init=>'N'
,p_name=>'Normalize imported Purchase Bill calculations'
,p_static_id=>'normalize-imported-purchase-bill-calculations-209260926143850003'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO,P143_PARTYCODE,P143_TRANSACTIONTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  l_q1 number;',
    '  l_q2 number;',
    '  l_amount number;',
    '  l_footer number;',
    '  l_total number;',
    'begin',
    '  update purchasebilldetailfooter f',
    '     set f.footervalue = imart_purchasebill_calc.footer_value(',
    '       f.legendscode,',
    '       (select d.amount from purchasebilldetail d where d.tno=f.tno and d.sno=f.sno),',
    '       f.footerpercent, f.footervalue,',
    '       (select d.quantity1 from purchasebilldetail d where d.tno=f.tno and d.sno=f.sno)',
    '     )',
    '   where f.tno = :P143_TNO;',
    '',
    '  for r in (',
    '    select sno, itemcode, itemspecificationcode, quantity1, quantity2,',
    '           rate, ratemeasuringunitcode',
    '      from purchasebilldetail',
    '     where tno = :P143_TNO',
    '  ) loop',
    '    imart_purchasebill_calc.recalculate_line(',
    '      :P143_TNO, r.sno, r.itemcode, r.itemspecificationcode,',
    '      r.quantity1, r.quantity2, r.rate, r.ratemeasuringunitcode,',
    '      :P143_PARTYCODE, :P143_TRANSACTIONTYPECODE,',
    '      l_q1, l_q2, l_amount, l_footer, l_total',
    '    );',
    '  end loop;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(196095332089362582)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>150
,p_execute_on_page_init=>'N'
,p_name=>'set P143_PURCHASEBILLAMOUNT'
,p_static_id=>'set-p143-purchasebillamount'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PURCHASEBILLAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PURCHASEBILLAMOUNT',
  'sql_query', 'select round(:P143_PURCHASEBILLAMOUNT,0) from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(196095234641362581)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>140
,p_execute_on_page_init=>'N'
,p_name=>'set P143_PURCHASEBILLAMOUNTBEFOREROUND'
,p_static_id=>'set-p143-purchasebillamountbeforeround'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PURCHASEBILLAMOUNTBEFOREROUND'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PURCHASEBILLAMOUNT',
  'plsql_expression', ':P143_PURCHASEBILLAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(196095424777362583)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>160
,p_execute_on_page_init=>'N'
,p_name=>'set P143_ROUNDOFF'
,p_static_id=>'set-p143-roundoff'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_ROUNDOFF'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PURCHASEBILLAMOUNT,P143_PURCHASEBILLAMOUNTBEFOREROUND',
  'sql_query', 'select :P143_PURCHASEBILLAMOUNT - :P143_PURCHASEBILLAMOUNTBEFOREROUND from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(63250149490405518)
,p_event_id=>wwv_flow_imp.id(600870724785726235)
,p_event_result=>'TRUE'
,p_action_sequence=>170
,p_execute_on_page_init=>'N'
,p_name=>'set transaction type'
,p_static_id=>'set-transaction-type'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_TRANSACTIONTYPECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PARTYCODE , P143_LOCATIONCODE , P143_DOCTYPECODE , P143_COMPANYCODE , :P143_PURCHASEBILLDATE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select GetTransactionTypeCodeFor(:P143_PARTYCODE , :P143_LOCATIONCODE , :P143_DOCTYPECODE , :P143_COMPANYCODE , :P143_PURCHASEBILLDATE)',
    'from dual;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461546331488383502)
,p_name=>'Set Other values'
,p_static_id=>'set-other-values-2'
,p_event_sequence=>470
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P143_PURCHASEORDERTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461546372588383503)
,p_event_id=>wwv_flow_imp.id(461546331488383502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_TRANSACTIONTYPECODE,P143_NATUREOFSUPPLYCODE,P143_CURRENCYUNITCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PURCHASEORDERTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select b.TransactionTypeCode ,b.NatureOfSupplyCode , b.CurrencyUNitCode',
    'from purchaseorder b where tno = :P143_PURCHASEORDERTNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(196095523347362584)
,p_name=>'Set Other Values based on bill round off'
,p_static_id=>'set-other-values-based-on-bill-round-off'
,p_event_sequence=>230
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P143_BILLINROUNDFIGURE'
,p_condition_element=>'P143_PARTYBILLNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(196095920409362588)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Disable GetItem Button'
,p_static_id=>'disable-getitem-button'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600817293418447271)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P143_PURCHASEORDERTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(196095779881362586)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Disable GRNDetail'
,p_static_id=>'disable-grndetail'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600817223067447270)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P143_PURCHASEORDERTNO'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(196096103317362589)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'Enable GetItem Button'
,p_static_id=>'enable-getitem-button'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600817293418447271)
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P143_PURCHASEORDERTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(196095914763362587)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Enable GRNDetail'
,p_static_id=>'enable-grndetail'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600817223067447270)
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P143_PURCHASEORDERTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(196096186814362590)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_PURCHASEORDERTNO,P143_TNO,P143_FORMSTATUS,P143_PARTYBILLNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--if :P143_FORMSTATUS = ''NEWRECORD'' then',
    '',
    '    delete from PURCHASEBILLDETAIL where tno = :P143_TNO;',
    '    ',
    '    insert into PURCHASEBILLDETAIL',
    '    (',
    '        tno,',
    '        sno,',
    '        PURCHASEORDERTNO,',
    '        ITEMCODE,',
    '        ITEMSPECIFICATIONCODE,',
    '        QUANTITY1,',
    '        QUANTITY2,',
    '        RATEMEASURINGUNITCODE,',
    '        RATE,',
    '        AMOUNT,',
    '        FOOTERAMOUNT,',
    '        TOTALAMOUNT',
    '    )',
    '    ',
    '    (',
    '        select',
    '            :P143_TNO,',
    '            a.SNo,',
    '            b.TNo as PurchaseOrderTNO,',
    '            a.ItemCode,',
    '            a.ItemSpecificationCode,',
    '            a.ChalanQuantity1,',
    '            a.ChalanQuantity2,',
    '            b.RateMeasuringUnitcode,',
    '            b.Rate,',
    '            a.ChalanQuantity1 * b.Rate,',
    '            e.footeramount,',
    '            e.totalamount',
    '    from GRNDetail a, BOMPurchaseOrderDetail b, Item c, ItemSpecification d , PurchaseOrderDetail e',
    '    where a.PurchaseOrderTNo = b.TNo ',
    '            and a.ItemCode = b.ItemCode',
    '            and a.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.ItemCode = c.ItemCode',
    '            and a.ItemSpecificationCode = d.ItemSpecificationCode',
    '            and a.TNo in (select tno from grn where  REFDOCTYPECODE = ''BILL'' and  RefDocNo = :P143_PARTYBILLNO and purchaseordertno = a.PurchaseOrderTNo )',
    '            and e.tno = a.PurchaseOrderTNo',
    '             and e.ItemCode = b.ItemCode',
    '            and e.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.PurchaseOrderTno = :P143_PURCHASEORDERTNO',
    '    union all',
    '    select',
    '            :P143_TNO,',
    '            e.SNo,',
    '            e.TNo as PurchaseOrderTNO,',
    '            e.ItemCode,',
    '            e.ItemSpecificationCode,',
    '            e.Quantity1,',
    '            e.Quantity2,',
    '            b.RateMeasuringUnitcode,',
    '            b.Rate,',
    '            e.Quantity1 * b.Rate,',
    '            e.footeramount,',
    '            e.totalamount',
    '    from  BOMPurchaseOrderDetail b, Item c, ItemSpecification d , PurchaseOrderDetail e',
    '    where b.TNo = e.TNo',
    '            and b.ItemCode = e.ItemCode',
    '            and b.ItemSpecificationCode = e.ItemSpecificationCode',
    '            and b.ItemCode = c.ItemCode',
    '            and b.ItemSpecificationCode = d.ItemSpecificationCode ',
    '            and e.itemcode in (select itemcode from item where itemnaturecode = ''SERVICES'')',
    '            and e.Tno = :P143_PURCHASEORDERTNO',
    '            ',
    '            ',
    '            ',
    '    ) ;',
    '     ',
    '',
    '--end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(196096309763362591)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_PURCHASEORDERTNO,P143_TNO,P143_FORMSTATUS,P143_PARTYBILLNO,P143_PURCHASEBILLDATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--if :P143_FORMSTATUS = ''NEWRECORD'' then',
    '',
    '    delete from PURCHASEBILLDETAIL where tno = :P143_TNO;',
    '    ',
    '    insert into PURCHASEBILLDETAIL',
    '    (',
    '        tno,',
    '        sno,',
    '        PURCHASEORDERTNO,',
    '        ITEMCODE,',
    '        ITEMSPECIFICATIONCODE,',
    '        QUANTITY1,',
    '        QUANTITY2,',
    '        RATEMEASURINGUNITCODE,',
    '        RATE,',
    '        AMOUNT,',
    '        FOOTERAMOUNT,',
    '        TOTALAMOUNT',
    '    )',
    '    (select :P143_TNO , globaltno.nextval, PurchaseOrderTNO, ItemCode, ItemSpecificationCode,',
    '     ChalanQuantity1 , ChalanQuantity2 , RateMeasuringUnitcode , Rate , amt , footeramount , totalamount ',
    '     from ',
    '    (',
    '        select',
    '            :P143_TNO,',
    '            a.SNo,',
    '            b.TNo as PurchaseOrderTNO,',
    '            a.ItemCode,',
    '            a.ItemSpecificationCode,',
    '            a.ChalanQuantity1,',
    '            a.ChalanQuantity2,',
    '            b.RateMeasuringUnitcode,',
    '           case when nvl(f.EFFECTIVEFROMDATE,sysdate) <= :P143_PURCHASEBILLDATE then',
    '            nvl(g.rate,e.rate)',
    '            else',
    '            e.rate',
    '            end rate,',
    '            a.ChalanQuantity1 * b.Rate as amt,',
    '            e.footeramount,',
    '            e.totalamount',
    '    from GRNDetail a, BOMPurchaseOrderDetail b, Item c, ItemSpecification d , PurchaseOrderDetail e ,',
    '            poamendment f , poamendmentdetail g',
    '    where a.PurchaseOrderTNo = b.TNo ',
    '            and a.ItemCode = b.ItemCode',
    '            and a.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.ItemCode = c.ItemCode',
    '            and a.ItemSpecificationCode = d.ItemSpecificationCode',
    '            and a.TNo in (select tno from grn where  REFDOCTYPECODE = ''BILL'' and  RefDocNo = :P143_PARTYBILLNO and purchaseordertno = a.PurchaseOrderTNo )',
    '            and e.tno = a.PurchaseOrderTNo',
    '             and e.ItemCode = b.ItemCode',
    '            and e.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.PurchaseOrderTno = :P143_PURCHASEORDERTNO',
    '             and f.PurchaseOrderTno(+) = a.PurchaseOrderTNo',
    '            and f.tno = g.tno(+)',
    '            and a.ItemCode = g.ItemCode(+)',
    '            and a.ItemSpecificationCode = g.ItemSpecificationCode(+)',
    '    union all',
    '    select',
    '            :P143_TNO,',
    '            e.SNo,',
    '            e.TNo as PurchaseOrderTNO,',
    '            e.ItemCode,',
    '            e.ItemSpecificationCode,',
    '            e.Quantity1,',
    '            e.Quantity2,',
    '            b.RateMeasuringUnitcode,',
    '            b.Rate,',
    '            e.Quantity1 * b.Rate,',
    '            e.footeramount,',
    '            e.totalamount',
    '    from  BOMPurchaseOrderDetail b, Item c, ItemSpecification d , PurchaseOrderDetail e',
    '    where b.TNo = e.TNo',
    '            and b.ItemCode = e.ItemCode',
    '            and b.ItemSpecificationCode = e.ItemSpecificationCode',
    '            and b.ItemCode = c.ItemCode',
    '            and b.ItemSpecificationCode = d.ItemSpecificationCode ',
    '            and e.itemcode in (select itemcode from item where itemnaturecode = ''SERVICES'')',
    '            and e.Tno = :P143_PURCHASEORDERTNO',
    '            ',
    '            ',
    '            ',
    '    )) ;',
    '     ',
    '',
    '--end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(196096416016362592)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-3'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_PURCHASEORDERTNO,P143_TNO,P143_FORMSTATUS,P143_PARTYBILLNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--if :P143_FORMSTATUS = ''NEWRECORD'' then',
    '',
    '   --raise_application_error(-20000,''101'');',
    '',
    '    delete from PurchaseBillGRNDetail where tno = :P143_TNO;',
    '    ',
    '   Insert into PurchaseBillGRNDetail(',
    '			TNO,',
    '			SNo,',
    '			GRNTNo,',
    '			GRNSNo',
    '	)',
    '    (',
    '        select',
    '           :P143_TNO,',
    '            g.SNo,',
    '            a.TNo,',
    '            a.SNo',
    '    from GRNDetail a, BOMPurchaseOrderDetail b, Item c, ItemSpecification d , PurchaseOrderDetail e , purchasebilldetail g',
    '    where a.PurchaseOrderTNo = b.TNo ',
    '            and a.ItemCode = b.ItemCode',
    '            and a.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.ItemCode = c.ItemCode',
    '            and a.ItemSpecificationCode = d.ItemSpecificationCode',
    '            and a.TNo in (select tno from grn where REFDOCTYPECODE = ''BILL'' and RefDocNo = :P143_PARTYBILLNO and purchaseordertno = a.purchaseordertno)',
    '            and e.tno = a.PurchaseOrderTNo',
    '             and e.ItemCode = b.ItemCode',
    '            and e.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.PurchaseOrderTno = :P143_PURCHASEORDERTNO',
    '             and g.ItemCode = a.ItemCode',
    '            and g.ItemSpecificationCode = a.ItemSpecificationCode',
    '             and g.ItemCode = b.ItemCode',
    '            and g.ItemSpecificationCode = b.ItemSpecificationCode',
    '           and g.PurchaseOrderTno = :P143_PURCHASEORDERTNO',
    '            and g.tno =  :P143_TNO',
    '            ',
    '            ',
    '    );',
    '',
    '--end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198436215829447943)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-4'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_PURCHASEORDERTNO,P143_TNO,P143_FORMSTATUS,P143_PARTYBILLNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    'TMP NUMBER;',
    'BEGIN',
    '',
    'delete from PurchaseBillDetailfooter where tno = :P143_TNO;',
    'COMMIT;',
    '       Insert into PurchaseBillDetailfooter(',
    '                tno,',
    '                sno,',
    '                SN,',
    '    			FOOTERHEADCODE,',
    '                FOOTERPERCENT,',
    '                FOOTERVALUE,',
    '                LEGENDSCODE',
    '    	)',
    '        (',
    '        select ',
    '           :P143_TNO,',
    '            D.SNo,',
    '            b.SERIALNO,',
    '            b.FooterHeadCode,',
    '            b.FooterPercent,',
    '            case when b.legendscode   = ''PRA'' then',
    '                    ROUND(D.amount * b.footerpercent / 100 , 2 )',
    '                 when b.legendscode   = ''PRD'' then',
    '                    ROUND(D.amount * b.footerpercent / 100 , 2 ) * -1',
    '                 when b.legendscode =''PAA'' then',
    '                    round(D.amount * b.footerpercent / 100 , 2) ',
    '                 when b.legendscode =''PAD'' then',
    '                    round(D.amount * b.footerpercent / 100 , 2) ',
    '                 when b.legendscode IN  (''LSA'',''LSD'') then',
    '                    round(b.footervalue , 2)',
    '                 when b.legendscode = (''OQA'') then',
    '                    round(D.QUANTITY1 * B.FOOTERPERCENT , 2)',
    '                 WHEN b.legendscode = (''OQD'') then',
    '                    round((D.QUANTITY1 * B.FOOTERPERCENT),2) * -1',
    '            end footervalue,',
    '            --b.FooterValue,',
    '            b.LegendsCode',
    '        from GRNDetail a, PurchaseOrderDetailfooter b , PurchaseOrderDetail c, PurchaseBillDetail d',
    '        where a.PurchaseOrderTNo = b.TNo ',
    '        and a.PurchaseOrderTNo = c.TNo ',
    '        and b.tno = c.tno',
    '        and c.sno = b.sno',
    '        and c.itemcode = d.itemcode',
    '        and c.itemspecificationcode = d.itemspecificationcode',
    '        and d.tno = :P143_TNO',
    '        and a.ItemCode = c.ItemCode',
    '        and a.ItemSpecificationCode = c.ItemSpecificationCode',
    '        and a.TNo in (select tno from grn where REFDOCTYPECODE = ''BILL'' and RefDocNo = :P143_PARTYBILLNO and purchaseordertno = a.purchaseordertno)     ',
    '        and a.PurchaseOrderTno = :P143_PURCHASEORDERTNO   ',
    '',
    '        union all ',
    '',
    '        select ',
    '           :P143_TNO,',
    '            D.SNo,',
    '            b.SERIALNO,',
    '            b.FooterHeadCode,',
    '            b.FooterPercent,',
    '            case when b.legendscode   = ''PRA'' then',
    '                    ROUND(D.amount * b.footerpercent / 100 , 2 )',
    '                 when b.legendscode   = ''PRD'' then',
    '                    ROUND(D.amount * b.footerpercent / 100 , 2 ) * -1',
    '                 when b.legendscode =''PAA'' then',
    '                    round(D.amount * b.footerpercent / 100 , 2) ',
    '                 when b.legendscode =''PAD'' then',
    '                    round(D.amount * b.footerpercent / 100 , 2) ',
    '                 when b.legendscode IN  (''LSA'',''LSD'') then',
    '                    round(b.footervalue , 2)',
    '                 when b.legendscode = (''OQA'') then',
    '                    round(D.QUANTITY1 * B.FOOTERPERCENT , 2)',
    '                 WHEN b.legendscode = (''OQD'') then',
    '                    round((D.QUANTITY1 * B.FOOTERPERCENT),2) * -1',
    '            end footervalue,',
    '            --b.FooterValue,',
    '            b.LegendsCode',
    '        from  PurchaseOrderDetailfooter b , PurchaseOrderDetail c, PurchaseBillDetail d',
    '        where  b.tno = c.tno',
    '        and b.sno = c.sno',
    '        and c.itemcode = d.itemcode',
    '        and c.itemspecificationcode = d.itemspecificationcode',
    '        and c.itemcode in (select itemcode from item where itemnaturecode = ''SERVICES'')',
    '        and b.tno = :P143_PURCHASEORDERTNO',
    '        and d.tno = :P143_TNO    ',
    '    );',
    '',
    ' for vloop in (',
    '      select tno,sno,sum(footervalue) footervalue',
    '      from PurchaseBillDetailfooter',
    '      where tno = :P143_TNO',
    '      group by tno,sno',
    ' ) loop',
    '',
    '        update PurchaseBillDetail x set x.footeramount =  vloop.footervalue,',
    '                                         X.TOTALAMOUNT = X.AMOUNT +  vloop.footervalue',
    '        where tno = vloop.tno',
    '          and sno = vloop.sno',
    '          ;',
    '          commit;',
    ' end loop;',
    '',
    '--end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198436297638447944)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(596723855758907765)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198436396491447945)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600746501858249274)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198436450751447946)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600745117815249260)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(196095620537362585)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PARTYBILLDATE,P143_PURCHASEORDERTNO,P143_TRANSACTIONTYPECODE,P143_NATUREOFSUPPLYCODE,P143_CURRENCYUNITCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PARTYCODE,P143_LOCATIONCODE,P143_PARTYBILLNO,P143_FORMSTATUS',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ',
    '	',
    '	a.RefDocDate ,',
    '	a.PurchaseOrderTNo,',
    '	c.TransactionTypeCode,',
    '	d.NatureOfSupplyCode,',
    '	e.CurrencyUnitCode',
    'from GRN a, PurchaseOrder b, TransactionType c, NatureOfSupply d, CurrencyUnit e',
    'where a.PurchaseOrderTNo = b.TNo',
    '	and b.TransactionTypeCode = c.TransactionTypeCode(+)',
    '	and b.NatureOfSupplyCode = d.NatureOfSupplyCode(+)',
    '	and b.CurrencyUNitCode = e.CurrencyUNitCode(+)',
    '	and a.PartyCode = :P143_PARTYCODE',
    '	and a.CompanyCode = :global_companycode',
    '	and a.PurchaseOrderTNo is not null ',
    '    and  a.LocationCode = :P143_LOCATIONCODE',
    '    and a.RefDocNo = :P143_PARTYBILLNO',
    '	and (not exists(',
    '		select ',
    '			aa.TNo',
    '		from PurchaseBillGRNDetail aa, PurchaseBill pb ',
    '		where aa.GRNTNo = a.TNo',
    '		  and pb.TNo = aa.TNo)',
    '      OR  :p143_formstatus=''EDITRECORD''',
    '    )',
    '    /*UNION ALL',
    '    select ',
    '	',
    '	a.RefDocDate ,',
    '	a.PurchaseOrderTNo,',
    '	c.TransactionTypeCode,',
    '	d.NatureOfSupplyCode,',
    '	e.CurrencyUnitCode',
    'from GRN a, PurchaseOrder b, TransactionType c, NatureOfSupply d, CurrencyUnit e',
    'where a.PurchaseOrderTNo = b.TNo',
    '	and b.TransactionTypeCode = c.TransactionTypeCode(+)',
    '	and b.NatureOfSupplyCode = d.NatureOfSupplyCode(+)',
    '	and b.CurrencyUNitCode = e.CurrencyUNitCode(+)',
    '	and a.PartyCode = :P143_PARTYCODE',
    '	and a.CompanyCode = :global_companycode',
    '	and a.PurchaseOrderTNo is not null ',
    '    and  a.LocationCode = :P143_LOCATIONCODE',
    '    and a.RefDocNo = :P143_PARTYBILLNO',
    '    and :p143_formstatus=''EDITRECORD''',
    '    */')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P143_PURCHASEORDERTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198436547923447947)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_SUMOFAMOUNT,P143_SUMOFFOOTERAMOUNT,P143_PURCHASEBILLAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(amount) , sum(footeramount) , sum(totalamount)',
    'from purchasebilldetail',
    'where tno = :P143_TNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209260926143850004)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>95
,p_execute_on_page_init=>'N'
,p_name=>'Normalize imported Purchase Bill calculations'
,p_static_id=>'normalize-imported-purchase-bill-calculations-209260926143850004'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO,P143_PARTYCODE,P143_TRANSACTIONTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  l_q1 number;',
    '  l_q2 number;',
    '  l_amount number;',
    '  l_footer number;',
    '  l_total number;',
    'begin',
    '  update purchasebilldetailfooter f',
    '     set f.footervalue = imart_purchasebill_calc.footer_value(',
    '       f.legendscode,',
    '       (select d.amount from purchasebilldetail d where d.tno=f.tno and d.sno=f.sno),',
    '       f.footerpercent, f.footervalue,',
    '       (select d.quantity1 from purchasebilldetail d where d.tno=f.tno and d.sno=f.sno)',
    '     )',
    '   where f.tno = :P143_TNO;',
    '',
    '  for r in (',
    '    select sno, itemcode, itemspecificationcode, quantity1, quantity2,',
    '           rate, ratemeasuringunitcode',
    '      from purchasebilldetail',
    '     where tno = :P143_TNO',
    '  ) loop',
    '    imart_purchasebill_calc.recalculate_line(',
    '      :P143_TNO, r.sno, r.itemcode, r.itemspecificationcode,',
    '      r.quantity1, r.quantity2, r.rate, r.ratemeasuringunitcode,',
    '      :P143_PARTYCODE, :P143_TRANSACTIONTYPECODE,',
    '      l_q1, l_q2, l_amount, l_footer, l_total',
    '    );',
    '  end loop;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198436814930447949)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>160
,p_execute_on_page_init=>'N'
,p_name=>'set P143_PURCHASEBILLAMOUNT'
,p_static_id=>'set-p143-purchasebillamount'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PURCHASEBILLAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PURCHASEBILLAMOUNT',
  'sql_query', 'select round(:P143_PURCHASEBILLAMOUNT,0) from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198436678435447948)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>140
,p_execute_on_page_init=>'N'
,p_name=>'set P143_PURCHASEBILLAMOUNTBEFOREROUND'
,p_static_id=>'set-p143-purchasebillamountbeforeround'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PURCHASEBILLAMOUNTBEFOREROUND'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PURCHASEBILLAMOUNT',
  'plsql_expression', ':P143_PURCHASEBILLAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198436847486447950)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>180
,p_execute_on_page_init=>'N'
,p_name=>'set P143_ROUNDOFF'
,p_static_id=>'set-p143-roundoff'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_ROUNDOFF'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PURCHASEBILLAMOUNT,P143_PURCHASEBILLAMOUNTBEFOREROUND',
  'sql_query', 'select :P143_PURCHASEBILLAMOUNT - :P143_PURCHASEBILLAMOUNTBEFOREROUND from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198436962939447951)
,p_event_id=>wwv_flow_imp.id(196095523347362584)
,p_event_result=>'TRUE'
,p_action_sequence=>200
,p_execute_on_page_init=>'N'
,p_name=>'set P143_ROUNDOFF'
,p_static_id=>'set-p143-roundoff-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PURCHASEBILLAMOUNTBEFOREROUND,P143_ROUNDOFF'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'sql_query', 'select 0 as a , 0 as b from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_BILLINROUNDFIGURE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(198437042498447952)
,p_name=>'Set Other Values based on tax round off'
,p_static_id=>'set-other-values-based-on-tax-round-off'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P143_TAXINROUND'
,p_condition_element=>'P143_PARTYBILLNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198437442839447956)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Disable GetItem Button'
,p_static_id=>'disable-getitem-button'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600817293418447271)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P143_PURCHASEORDERTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198437252285447954)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Disable GRNDetail'
,p_static_id=>'disable-grndetail'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600817223067447270)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P143_PURCHASEORDERTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198437599947447957)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'Enable GetItem Button'
,p_static_id=>'enable-getitem-button'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600817293418447271)
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P143_PURCHASEORDERTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198437366282447955)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Enable GRNDetail'
,p_static_id=>'enable-grndetail'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600817223067447270)
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P143_PURCHASEORDERTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198437643893447958)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_PURCHASEORDERTNO,P143_TNO,P143_FORMSTATUS,P143_PARTYBILLNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--if :P143_FORMSTATUS = ''NEWRECORD'' then',
    '',
    '    delete from PURCHASEBILLDETAIL where tno = :P143_TNO;',
    '    ',
    '    insert into PURCHASEBILLDETAIL',
    '    (',
    '        tno,',
    '        sno,',
    '        PURCHASEORDERTNO,',
    '        ITEMCODE,',
    '        ITEMSPECIFICATIONCODE,',
    '        QUANTITY1,',
    '        QUANTITY2,',
    '        RATEMEASURINGUNITCODE,',
    '        RATE,',
    '        AMOUNT,',
    '        FOOTERAMOUNT,',
    '        TOTALAMOUNT',
    '    )',
    '    ',
    '    (',
    '        select',
    '            :P143_TNO,',
    '            a.SNo,',
    '            b.TNo as PurchaseOrderTNO,',
    '            a.ItemCode,',
    '            a.ItemSpecificationCode,',
    '            a.ChalanQuantity1,',
    '            a.ChalanQuantity2,',
    '            b.RateMeasuringUnitcode,',
    '            b.Rate,',
    '            a.ChalanQuantity1 * b.Rate,',
    '            e.footeramount,',
    '            e.totalamount',
    '    from GRNDetail a, BOMPurchaseOrderDetail b, Item c, ItemSpecification d , PurchaseOrderDetail e',
    '    where a.PurchaseOrderTNo = b.TNo ',
    '            and a.ItemCode = b.ItemCode',
    '            and a.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.ItemCode = c.ItemCode',
    '            and a.ItemSpecificationCode = d.ItemSpecificationCode',
    '            and a.TNo in (select tno from grn where  REFDOCTYPECODE = ''BILL'' and  RefDocNo = :P143_PARTYBILLNO and purchaseordertno = a.PurchaseOrderTNo )',
    '            and e.tno = a.PurchaseOrderTNo',
    '             and e.ItemCode = b.ItemCode',
    '            and e.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.PurchaseOrderTno = :P143_PURCHASEORDERTNO',
    '    union all',
    '    select',
    '            :P143_TNO,',
    '            e.SNo,',
    '            e.TNo as PurchaseOrderTNO,',
    '            e.ItemCode,',
    '            e.ItemSpecificationCode,',
    '            e.Quantity1,',
    '            e.Quantity2,',
    '            b.RateMeasuringUnitcode,',
    '            b.Rate,',
    '            e.Quantity1 * b.Rate,',
    '            e.footeramount,',
    '            e.totalamount',
    '    from  BOMPurchaseOrderDetail b, Item c, ItemSpecification d , PurchaseOrderDetail e',
    '    where b.TNo = e.TNo',
    '            and b.ItemCode = e.ItemCode',
    '            and b.ItemSpecificationCode = e.ItemSpecificationCode',
    '            and b.ItemCode = c.ItemCode',
    '            and b.ItemSpecificationCode = d.ItemSpecificationCode ',
    '            and e.itemcode in (select itemcode from item where itemnaturecode = ''SERVICES'')',
    '            and e.Tno = :P143_PURCHASEORDERTNO',
    '            ',
    '            ',
    '            ',
    '    ) ;',
    '     ',
    '',
    '--end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198437724213447959)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_PURCHASEORDERTNO,P143_TNO,P143_FORMSTATUS,P143_PARTYBILLNO,P143_PURCHASEBILLDATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--if :P143_FORMSTATUS = ''NEWRECORD'' then',
    '',
    '    delete from PURCHASEBILLDETAIL where tno = :P143_TNO;',
    '    ',
    '    insert into PURCHASEBILLDETAIL',
    '    (',
    '        tno,',
    '        sno,',
    '        PURCHASEORDERTNO,',
    '        ITEMCODE,',
    '        ITEMSPECIFICATIONCODE,',
    '        QUANTITY1,',
    '        QUANTITY2,',
    '        RATEMEASURINGUNITCODE,',
    '        RATE,',
    '        AMOUNT,',
    '        FOOTERAMOUNT,',
    '        TOTALAMOUNT',
    '    )',
    '    (select :P143_TNO , globaltno.nextval, PurchaseOrderTNO, ItemCode, ItemSpecificationCode,',
    '     ChalanQuantity1 , ChalanQuantity2 , RateMeasuringUnitcode , Rate , amt , footeramount , totalamount ',
    '     from ',
    '    (',
    '        select',
    '            :P143_TNO,',
    '            a.SNo,',
    '            b.TNo as PurchaseOrderTNO,',
    '            a.ItemCode,',
    '            a.ItemSpecificationCode,',
    '            a.ChalanQuantity1,',
    '            a.ChalanQuantity2,',
    '            b.RateMeasuringUnitcode,',
    '           case when nvl(f.EFFECTIVEFROMDATE,sysdate) <= :P143_PURCHASEBILLDATE then',
    '            nvl(g.rate,e.rate)',
    '            else',
    '            e.rate',
    '            end rate,',
    '            a.ChalanQuantity1 * b.Rate as amt,',
    '            e.footeramount,',
    '            e.totalamount',
    '    from GRNDetail a, BOMPurchaseOrderDetail b, Item c, ItemSpecification d , PurchaseOrderDetail e ,',
    '            poamendment f , poamendmentdetail g',
    '    where a.PurchaseOrderTNo = b.TNo ',
    '            and a.ItemCode = b.ItemCode',
    '            and a.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.ItemCode = c.ItemCode',
    '            and a.ItemSpecificationCode = d.ItemSpecificationCode',
    '            and a.TNo in (select tno from grn where  REFDOCTYPECODE = ''BILL'' and  RefDocNo = :P143_PARTYBILLNO and purchaseordertno = a.PurchaseOrderTNo )',
    '            and e.tno = a.PurchaseOrderTNo',
    '             and e.ItemCode = b.ItemCode',
    '            and e.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.PurchaseOrderTno = :P143_PURCHASEORDERTNO',
    '             and f.PurchaseOrderTno(+) = a.PurchaseOrderTNo',
    '            and f.tno = g.tno(+)',
    '            and a.ItemCode = g.ItemCode(+)',
    '            and a.ItemSpecificationCode = g.ItemSpecificationCode(+)',
    '    union all',
    '    select',
    '            :P143_TNO,',
    '            e.SNo,',
    '            e.TNo as PurchaseOrderTNO,',
    '            e.ItemCode,',
    '            e.ItemSpecificationCode,',
    '            e.Quantity1,',
    '            e.Quantity2,',
    '            b.RateMeasuringUnitcode,',
    '            b.Rate,',
    '            e.Quantity1 * b.Rate,',
    '            e.footeramount,',
    '            e.totalamount',
    '    from  BOMPurchaseOrderDetail b, Item c, ItemSpecification d , PurchaseOrderDetail e',
    '    where b.TNo = e.TNo',
    '            and b.ItemCode = e.ItemCode',
    '            and b.ItemSpecificationCode = e.ItemSpecificationCode',
    '            and b.ItemCode = c.ItemCode',
    '            and b.ItemSpecificationCode = d.ItemSpecificationCode ',
    '            and e.itemcode in (select itemcode from item where itemnaturecode = ''SERVICES'')',
    '            and e.Tno = :P143_PURCHASEORDERTNO',
    '            ',
    '            ',
    '            ',
    '    )) ;',
    '     ',
    '',
    '--end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198437871086447960)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-3'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_PURCHASEORDERTNO,P143_TNO,P143_FORMSTATUS,P143_PARTYBILLNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--if :P143_FORMSTATUS = ''NEWRECORD'' then',
    '',
    '   --raise_application_error(-20000,''101'');',
    '',
    '    delete from PurchaseBillGRNDetail where tno = :P143_TNO;',
    '    ',
    '   Insert into PurchaseBillGRNDetail(',
    '			TNO,',
    '			SNo,',
    '			GRNTNo,',
    '			GRNSNo',
    '	)',
    '    (',
    '        select',
    '           :P143_TNO,',
    '            g.SNo,',
    '            a.TNo,',
    '            a.SNo',
    '    from GRNDetail a, BOMPurchaseOrderDetail b, Item c, ItemSpecification d , PurchaseOrderDetail e , purchasebilldetail g',
    '    where a.PurchaseOrderTNo = b.TNo ',
    '            and a.ItemCode = b.ItemCode',
    '            and a.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.ItemCode = c.ItemCode',
    '            and a.ItemSpecificationCode = d.ItemSpecificationCode',
    '            and a.TNo in (select tno from grn where REFDOCTYPECODE = ''BILL'' and RefDocNo = :P143_PARTYBILLNO and purchaseordertno = a.purchaseordertno)',
    '            and e.tno = a.PurchaseOrderTNo',
    '             and e.ItemCode = b.ItemCode',
    '            and e.ItemSpecificationCode = b.ItemSpecificationCode',
    '            and a.PurchaseOrderTno = :P143_PURCHASEORDERTNO',
    '             and g.ItemCode = a.ItemCode',
    '            and g.ItemSpecificationCode = a.ItemSpecificationCode',
    '             and g.ItemCode = b.ItemCode',
    '            and g.ItemSpecificationCode = b.ItemSpecificationCode',
    '           and g.PurchaseOrderTno = :P143_PURCHASEORDERTNO',
    '            and g.tno =  :P143_TNO',
    '            ',
    '            ',
    '    );',
    '',
    '--end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198437923357447961)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-4'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_PURCHASEORDERTNO,P143_TNO,P143_FORMSTATUS,P143_PARTYBILLNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    'TMP NUMBER;',
    'BEGIN',
    '',
    'delete from PurchaseBillDetailfooter where tno = :P143_TNO;',
    'COMMIT;',
    '       Insert into PurchaseBillDetailfooter(',
    '                tno,',
    '                sno,',
    '                SN,',
    '    			FOOTERHEADCODE,',
    '                FOOTERPERCENT,',
    '                FOOTERVALUE,',
    '                LEGENDSCODE',
    '    	)',
    '        (',
    '        select ',
    '           :P143_TNO,',
    '            D.SNo,',
    '            b.SERIALNO,',
    '            b.FooterHeadCode,',
    '            b.FooterPercent,',
    '            case when b.legendscode   = ''PRA'' then',
    '                    ROUND(D.amount * b.footerpercent / 100 , 2 )',
    '                 when b.legendscode   = ''PRD'' then',
    '                    ROUND(D.amount * b.footerpercent / 100 , 2 ) * -1',
    '                 when b.legendscode =''PAA'' then',
    '                    round(D.amount * b.footerpercent / 100 , 2) ',
    '                 when b.legendscode =''PAD'' then',
    '                    round(D.amount * b.footerpercent / 100 , 2) ',
    '                 when b.legendscode IN  (''LSA'',''LSD'') then',
    '                    round(b.footervalue , 2)',
    '                 when b.legendscode = (''OQA'') then',
    '                    round(D.QUANTITY1 * B.FOOTERPERCENT , 2)',
    '                 WHEN b.legendscode = (''OQD'') then',
    '                    round((D.QUANTITY1 * B.FOOTERPERCENT),2) * -1',
    '            end footervalue,',
    '            --b.FooterValue,',
    '            b.LegendsCode',
    '        from GRNDetail a, PurchaseOrderDetailfooter b , PurchaseOrderDetail c, PurchaseBillDetail d',
    '        where a.PurchaseOrderTNo = b.TNo ',
    '        and a.PurchaseOrderTNo = c.TNo ',
    '        and b.tno = c.tno',
    '        and c.sno = b.sno',
    '        and c.itemcode = d.itemcode',
    '        and c.itemspecificationcode = d.itemspecificationcode',
    '        and d.tno = :P143_TNO',
    '        and a.ItemCode = c.ItemCode',
    '        and a.ItemSpecificationCode = c.ItemSpecificationCode',
    '        and a.TNo in (select tno from grn where REFDOCTYPECODE = ''BILL'' and RefDocNo = :P143_PARTYBILLNO and purchaseordertno = a.purchaseordertno)     ',
    '        and a.PurchaseOrderTno = :P143_PURCHASEORDERTNO   ',
    '',
    '        union all ',
    '',
    '        select ',
    '           :P143_TNO,',
    '            D.SNo,',
    '            b.SERIALNO,',
    '            b.FooterHeadCode,',
    '            b.FooterPercent,',
    '            case when b.legendscode   = ''PRA'' then',
    '                    ROUND(D.amount * b.footerpercent / 100 , 2 )',
    '                 when b.legendscode   = ''PRD'' then',
    '                    ROUND(D.amount * b.footerpercent / 100 , 2 ) * -1',
    '                 when b.legendscode =''PAA'' then',
    '                    round(D.amount * b.footerpercent / 100 , 2) ',
    '                 when b.legendscode =''PAD'' then',
    '                    round(D.amount * b.footerpercent / 100 , 2) ',
    '                 when b.legendscode IN  (''LSA'',''LSD'') then',
    '                    round(b.footervalue , 2)',
    '                 when b.legendscode = (''OQA'') then',
    '                    round(D.QUANTITY1 * B.FOOTERPERCENT , 2)',
    '                 WHEN b.legendscode = (''OQD'') then',
    '                    round((D.QUANTITY1 * B.FOOTERPERCENT),2) * -1',
    '            end footervalue,',
    '            --b.FooterValue,',
    '            b.LegendsCode',
    '        from  PurchaseOrderDetailfooter b , PurchaseOrderDetail c, PurchaseBillDetail d',
    '        where  b.tno = c.tno',
    '        and b.sno = c.sno',
    '        and c.itemcode = d.itemcode',
    '        and c.itemspecificationcode = d.itemspecificationcode',
    '        and c.itemcode in (select itemcode from item where itemnaturecode = ''SERVICES'')',
    '        and b.tno = :P143_PURCHASEORDERTNO',
    '        and d.tno = :P143_TNO    ',
    '    );',
    '',
    ' for vloop in (',
    '      select tno,sno,sum(footervalue) footervalue',
    '      from PurchaseBillDetailfooter',
    '      where tno = :P143_TNO',
    '      group by tno,sno',
    ' ) loop',
    '',
    '        update PurchaseBillDetail x set x.footeramount =  vloop.footervalue,',
    '                                         X.TOTALAMOUNT = X.AMOUNT +  vloop.footervalue',
    '        where tno = vloop.tno',
    '          and sno = vloop.sno',
    '          ;',
    '          commit;',
    ' end loop;',
    '',
    '--end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198438023863447962)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(596723855758907765)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198438166476447963)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600746501858249274)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198438255550447964)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600745117815249260)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198437124933447953)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PARTYBILLDATE,P143_PURCHASEORDERTNO,P143_TRANSACTIONTYPECODE,P143_NATUREOFSUPPLYCODE,P143_CURRENCYUNITCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PARTYCODE,P143_LOCATIONCODE,P143_PARTYBILLNO,P143_FORMSTATUS',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ',
    '	',
    '	a.RefDocDate ,',
    '	a.PurchaseOrderTNo,',
    '	c.TransactionTypeCode,',
    '	d.NatureOfSupplyCode,',
    '	e.CurrencyUnitCode',
    'from GRN a, PurchaseOrder b, TransactionType c, NatureOfSupply d, CurrencyUnit e',
    'where a.PurchaseOrderTNo = b.TNo',
    '	and b.TransactionTypeCode = c.TransactionTypeCode(+)',
    '	and b.NatureOfSupplyCode = d.NatureOfSupplyCode(+)',
    '	and b.CurrencyUNitCode = e.CurrencyUNitCode(+)',
    '	and a.PartyCode = :P143_PARTYCODE',
    '	and a.CompanyCode = :global_companycode',
    '	and a.PurchaseOrderTNo is not null ',
    '    and  a.LocationCode = :P143_LOCATIONCODE',
    '    and a.RefDocNo = :P143_PARTYBILLNO',
    '	and (not exists(',
    '		select ',
    '			aa.TNo',
    '		from PurchaseBillGRNDetail aa, PurchaseBill pb ',
    '		where aa.GRNTNo = a.TNo',
    '		  and pb.TNo = aa.TNo)',
    '      OR  :p143_formstatus=''EDITRECORD''',
    '    )',
    '    /*UNION ALL',
    '    select ',
    '	',
    '	a.RefDocDate ,',
    '	a.PurchaseOrderTNo,',
    '	c.TransactionTypeCode,',
    '	d.NatureOfSupplyCode,',
    '	e.CurrencyUnitCode',
    'from GRN a, PurchaseOrder b, TransactionType c, NatureOfSupply d, CurrencyUnit e',
    'where a.PurchaseOrderTNo = b.TNo',
    '	and b.TransactionTypeCode = c.TransactionTypeCode(+)',
    '	and b.NatureOfSupplyCode = d.NatureOfSupplyCode(+)',
    '	and b.CurrencyUNitCode = e.CurrencyUNitCode(+)',
    '	and a.PartyCode = :P143_PARTYCODE',
    '	and a.CompanyCode = :global_companycode',
    '	and a.PurchaseOrderTNo is not null ',
    '    and  a.LocationCode = :P143_LOCATIONCODE',
    '    and a.RefDocNo = :P143_PARTYBILLNO',
    '    and :p143_formstatus=''EDITRECORD''',
    '    */')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P143_PURCHASEORDERTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198438320953447965)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_SUMOFAMOUNT,P143_SUMOFFOOTERAMOUNT,P143_PURCHASEBILLAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(amount) , sum(footeramount) , sum(totalamount)',
    'from purchasebilldetail',
    'where tno = :P143_TNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209260926143850005)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>95
,p_execute_on_page_init=>'N'
,p_name=>'Normalize imported Purchase Bill calculations'
,p_static_id=>'normalize-imported-purchase-bill-calculations-209260926143850005'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P143_TNO,P143_PARTYCODE,P143_TRANSACTIONTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  l_q1 number;',
    '  l_q2 number;',
    '  l_amount number;',
    '  l_footer number;',
    '  l_total number;',
    'begin',
    '  update purchasebilldetailfooter f',
    '     set f.footervalue = imart_purchasebill_calc.footer_value(',
    '       f.legendscode,',
    '       (select d.amount from purchasebilldetail d where d.tno=f.tno and d.sno=f.sno),',
    '       f.footerpercent, f.footervalue,',
    '       (select d.quantity1 from purchasebilldetail d where d.tno=f.tno and d.sno=f.sno)',
    '     )',
    '   where f.tno = :P143_TNO;',
    '',
    '  for r in (',
    '    select sno, itemcode, itemspecificationcode, quantity1, quantity2,',
    '           rate, ratemeasuringunitcode',
    '      from purchasebilldetail',
    '     where tno = :P143_TNO',
    '  ) loop',
    '    imart_purchasebill_calc.recalculate_line(',
    '      :P143_TNO, r.sno, r.itemcode, r.itemspecificationcode,',
    '      r.quantity1, r.quantity2, r.rate, r.ratemeasuringunitcode,',
    '      :P143_PARTYCODE, :P143_TRANSACTIONTYPECODE,',
    '      l_q1, l_q2, l_amount, l_footer, l_total',
    '    );',
    '  end loop;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198438520952447967)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>150
,p_execute_on_page_init=>'N'
,p_name=>'set P143_PURCHASEBILLAMOUNT'
,p_static_id=>'set-p143-purchasebillamount'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PURCHASEBILLAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PURCHASEBILLAMOUNT',
  'sql_query', 'select round(:P143_PURCHASEBILLAMOUNT,0) from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198438505642447966)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>140
,p_execute_on_page_init=>'N'
,p_name=>'set P143_PURCHASEBILLAMOUNTBEFOREROUND'
,p_static_id=>'set-p143-purchasebillamountbeforeround'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PURCHASEBILLAMOUNTBEFOREROUND'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PURCHASEBILLAMOUNT',
  'plsql_expression', ':P143_PURCHASEBILLAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198438686301447968)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>160
,p_execute_on_page_init=>'N'
,p_name=>'set P143_ROUNDOFF'
,p_static_id=>'set-p143-roundoff'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_ROUNDOFF'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PURCHASEBILLAMOUNT,P143_PURCHASEBILLAMOUNTBEFOREROUND',
  'sql_query', 'select :P143_PURCHASEBILLAMOUNT - :P143_PURCHASEBILLAMOUNTBEFOREROUND from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(198438743671447969)
,p_event_id=>wwv_flow_imp.id(198437042498447952)
,p_event_result=>'TRUE'
,p_action_sequence=>170
,p_execute_on_page_init=>'N'
,p_name=>'set P143_ROUNDOFF'
,p_static_id=>'set-p143-roundoff-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PURCHASEBILLAMOUNTBEFOREROUND,P143_ROUNDOFF'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'sql_query', 'select 0 as a , 0 as b from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P143_BILLINROUNDFIGURE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600744290027249252)
,p_name=>'Set P143_SNO'
,p_static_id=>'set-p143-sno'
,p_event_sequence=>170
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(596723855758907765)
,p_triggering_element=>'SNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600744404649249253)
,p_event_id=>wwv_flow_imp.id(600744290027249252)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'sql_query', 'select :SNO from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600744079829249250)
,p_name=>'Set Page Item SNO'
,p_static_id=>'set-page-item-sno'
,p_event_sequence=>160
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(596723855758907765)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600744204126249251)
,p_event_id=>wwv_flow_imp.id(600744079829249250)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var pSno;',
    'model = this.data.model;',
    '',
    'pSNO = model.getValue( this.data.selectedRecords[0], "SNO");',
    '',
    'apex.item( "P143_SNO" ).setValue (pSNO);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(501247206626516501)
,p_name=>'set pbtotal'
,p_static_id=>'set-pbtotal'
,p_event_sequence=>550
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P143_SUMOFFOOTERAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(501247324276516502)
,p_event_id=>wwv_flow_imp.id(501247206626516501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PURCHASEBILLAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_SUMOFAMOUNT,P143_SUMOFFOOTERAMOUNT',
  'plsql_expression', ':P143_SUMOFAMOUNT+:P143_SUMOFFOOTERAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447058617799861627)
,p_name=>'Set Serial No for Detail'
,p_static_id=>'set-serial-no-for-detail'
,p_event_sequence=>380
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(600745117815249260)
,p_triggering_element=>'FOOTERHEADCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447058731575861628)
,p_event_id=>wwv_flow_imp.id(447058617799861627)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SERIALNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'FOOTERHEADCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select',
    '      SNO',
    'From  FOOTERSCHEMEDETAIL',
    'Where FooterHeadCode = :FOOTERHEADCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(55452976980090933)
,p_name=>'Set the Purchase Order Mandatory on Bill'
,p_static_id=>'set-the-purchase-order-mandatory-on-bill'
,p_event_sequence=>620
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P143_BILLING_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(55453069735090934)
,p_event_id=>wwv_flow_imp.id(55452976980090933)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var v_po = apex.item(''P143_PURCHASEORDERTNO'');',
    'var v_billing_type = $v(this.triggeringElement.id); ',
    '',
    'var $poContainer = $(v_po.node).closest(''.t-Form-fieldContainer'');',
    '',
    'if (v_billing_type === ''BILL'') {',
    '    $(v_po.node).prop("required", true);',
    '    $poContainer.addClass("is-required");',
    '} else {',
    '    $(v_po.node).prop("required", false);',
    '    $poContainer.removeClass("is-required");',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447057880712861620)
,p_name=>'Set Total Amount'
,p_static_id=>'set-total-amount'
,p_event_sequence=>350
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(596723855758907765)
,p_triggering_element=>'AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447058055503861621)
,p_event_id=>wwv_flow_imp.id(447057880712861620)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTALAMOUNT,FOOTERAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNT,FOOTERAMOUNT',
  'sql_query', 'select nvl(:AMOUNT,0) , nvl(:FOOTERAMOUNT,0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447056055160861601)
,p_name=>'Set transaction Type'
,p_static_id=>'set-transaction-type'
,p_event_sequence=>320
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P143_PARTYCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447056161033861602)
,p_event_id=>wwv_flow_imp.id(447056055160861601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_TRANSACTIONTYPECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P143_PARTYCODE,P143_LOCATIONCODE,P143_DOCTYPECODE,P143_COMPANYCODE,P143_PURCHASEBILLDATE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select GetTransactionTypeCodeFor(:P143_PARTYCODE , :P143_LOCATIONCODE , :P143_DOCTYPECODE , :P143_COMPANYCODE , :P143_PURCHASEBILLDATE)',
    'from dual;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447354111560243088)
,p_name=>'Set Value- Final value of Detail footer on Loose Focus'
,p_static_id=>'set-value-final-value-of-detail-footer-on-loose-focus'
,p_event_sequence=>430
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(600745117815249260)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447354197127243089)
,p_event_id=>wwv_flow_imp.id(447354111560243088)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("DetailFooter").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("FOOTERVALUE");',
    'model.forEach(function(igrow) {',
    '    n_amt = parseInt(igrow[col_amt], 10);',
    '    if (!isNaN(n_amt)) {',
    '        n_totamt += n_amt;',
    '    }',
    '});',
    'apex.item("P143_FVALUE").setValue(n_totamt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(501171280451381921)
,p_name=>'skip focus to partycode '
,p_static_id=>'skip-focus-to-partycode'
,p_event_sequence=>530
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P143_PURCHASEBILLDATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'EXISTS'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM CODESCHEME A',
'WHERE A.MODULECODE = getmodulecodeforpageno(:APP_PAGE_ID)',
'AND CODESCHEME=''AUTO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(501171760881381961)
,p_event_id=>wwv_flow_imp.id(501171280451381921)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P143_PARTYCODE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600679570424794251)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Detail'
,p_static_id=>'delete-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from purchasebilldetail where tno = :P143_TNO;',
'delete from purchasebilldetailfooter where tno = :P143_TNO;',
'delete from purchasebillgrndetail where tno = :P143_TNO;',
'delete from purchasebilltac where tno = :P143_TNO;',
'delete from purchasebillfooter where tno = :P143_TNO;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(600653284781768299)
,p_internal_uid=>160293225173867727
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(452831075156863226)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete master if Detail is not saved'
,p_static_id=>'delete-master-if-detail-is-not-saved'
,p_process_sql_clob=>'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P143_TNO);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>13846205957165242
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600743470889249244)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(596723855758907765)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Detail - Save Interactive Grid Data'
,p_static_id=>'detail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'            Insert Into purchasebilldetail (                 ',
'										TNO,',
'					SNO,',
'					SERIALNO,',
'					PURCHASEORDERTNO,',
'					ITEMCODE,',
'					ITEMSPECIFICATIONCODE,',
'					DESCRIPTION,',
'					QUANTITY1,',
'					QUANTITY2,',
'					RATEMEASURINGUNITCODE,',
'					RATE,',
'					AMOUNT,',
'					FOOTERAMOUNT,',
'					TOTALAMOUNT,',
'					DOCUMENTSTATUSCODE,',
'					REMARK,',
'					OURRG23DNO,',
'					PARTYRG23DNO,',
'					ROUNDING,',
'					FOOTERAMOUNTWITHRATE,',
'					JOBORDERTNO,',
'					TAXRULECODE,',
'					PRORATA,',
'					QUALITYCODE',
'',
'            )',
'            Values (',
'									:TNO,',
'					:SNO,',
'					:SERIALNO,',
'					:PURCHASEORDERTNO,',
'					:ITEMCODE,',
'					:ITEMSPECIFICATIONCODE,',
'					:DESCRIPTION,',
'					:QUANTITY1,',
'					:QUANTITY2,',
'					:RATEMEASURINGUNITCODE,',
'					:RATE,',
'					:AMOUNT,',
'					:FOOTERAMOUNT,',
'					:TOTALAMOUNT,',
'					:DOCUMENTSTATUSCODE,',
'					:REMARK,',
'					:OURRG23DNO,',
'					:PARTYRG23DNO,',
'					:ROUNDING,',
'					:FOOTERAMOUNTWITHRATE,',
'					:JOBORDERTNO,',
'					:TAXRULECODE,',
'					:PRORATA,',
'					:QUALITYCODE',
'',
'            );',
'        ',
'        when ''U'' then',
'            update purchasebilldetail Set',
'									  TNO=:TNO,',
'					SNO=:SNO,',
'					SERIALNO=:SERIALNO,',
'					PURCHASEORDERTNO=:PURCHASEORDERTNO,',
'					ITEMCODE=:ITEMCODE,',
'					ITEMSPECIFICATIONCODE=:ITEMSPECIFICATIONCODE,',
'					DESCRIPTION=:DESCRIPTION,',
'					QUANTITY1=:QUANTITY1,',
'					QUANTITY2=:QUANTITY2,',
'					RATEMEASURINGUNITCODE=:RATEMEASURINGUNITCODE,',
'					RATE=:RATE,',
'					AMOUNT=:AMOUNT,',
'					FOOTERAMOUNT=:FOOTERAMOUNT,',
'					TOTALAMOUNT=:TOTALAMOUNT,',
'					DOCUMENTSTATUSCODE=:DOCUMENTSTATUSCODE,',
'					REMARK=:REMARK,',
'					OURRG23DNO=:OURRG23DNO,',
'					PARTYRG23DNO=:PARTYRG23DNO,',
'					ROUNDING=:ROUNDING,',
'					FOOTERAMOUNTWITHRATE=:FOOTERAMOUNTWITHRATE,',
'					JOBORDERTNO=:JOBORDERTNO,',
'					TAXRULECODE=:TAXRULECODE,',
'					PRORATA=:PRORATA,',
'					QUALITYCODE=:QUALITYCODE',
'',
'',
'            WHERE TNO = :P143_TNO',
'              and rowid = :ROWID;',
'',
'        when ''D'' then',
'            Delete From purchasebilldetail',
'            Where TNo = :P143_TNO',
'              and SNO = :SNO',
'              ;',
'    end case;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>160357125638322720
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600871350158726242)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(600745117815249260)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'DetailFooter - Save Interactive Grid Data'
,p_static_id=>'detailfooter-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>160485004907799718
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600859414855631510)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Document No'
,p_static_id=>'get-document-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tmp         number ;',
'begin',
'     if :P143_Tno is null then',
'        Select GlobalTno.NextVal into :P143_Tno From Dual;',
'     end if;',
'    ----',
'    if :P143_PURCHASEBILLNO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P143_LocationCode,',
'					:P143_DocTypeCode,',
'					NULL,',
'					TO_DATE(:P143_PURCHASEBILLDATE, ''DD-MM-RRRR'')',
'				);',
'        :P143_PURCHASEBILLNO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P143_LocationCode,',
'                    :P143_DocTypeCode,',
'                    NULL,',
'                    TO_DATE(:P143_PURCHASEBILLDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>160473069604704986
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600651836877765641)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get TNo'
,p_static_id=>'get-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P143_TNO is null then',
'    :P143_TNO := GlobalTNo.nextval;',
'    :P143_FORMSTATUS := ''NEWRECORD'';',
'else',
'    :P143_FORMSTATUS := ''EDITRECORD'';',
'End if;',
'APEX_UTIL.SET_SESSION_STATE (',
'    ''P143_FORMSTATUS'',',
'    :P143_FORMSTATUS);',
'',
'APEX_UTIL.SET_SESSION_STATE (',
'    ''P143_TNO'',',
'    :P143_TNO);',
'',
'',
'  :P143_STATUS :=  nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P143_TNO), ''Status'');',
'',
'  if :P143_BILLINROUNDFIGURE is null then',
'        :P143_BILLINROUNDFIGURE := ''YES'';',
'  end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>160265491626839117
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600652094119766698)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GetOnTheTable'
,p_static_id=>'getonthetable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'tmp  number;',
'tmp1 number;',
'begin',
' -------- Checking Module Flow Prepared Or Not ',
'   select count(*) into tmp1 from moduleflow where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) and getdocumentstatuscode(''MODULEFLOW'',TNO)=''ACTIVE'';',
'   if nvl(tmp1,0) > 0 then',
'       :P143_MODULEFLOW := ''YES'';',
'   else',
'       :P143_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P143_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P143_ONTHETABLE := ''YES'' ;',
'   else',
'       :P143_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>160265748868840174
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600871871683726247)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(600746501858249274)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'GRN - Save Interactive Grid Data'
,p_static_id=>'grn-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>160485526432799723
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600816649991447265)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(600815198305447250)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'GRNSelection1 - Save Interactive Grid Data'
,p_static_id=>'grnselection1-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>160430304740520741
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600609846947171831)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(600581388345171811)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Purchase Bill'
,p_static_id=>'initialize-form-purchase-bill'
,p_internal_uid=>160223501696245307
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(605319897700850235)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert into footer'
,p_static_id=>'insert-into-footer'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from purchasebillfooter where tno = :P143_TNO;',
'',
'insert into purchasebillfooter',
'    (',
'        TNO,',
'        FOOTERHEADCODE,',
'        FOOTERVALUE',
'    )',
'    (',
'        select ',
'            :P143_TNO,',
'            FOOTERHEADCODE,',
'            sum(FOOTERVALUE)',
'',
'        from purchasebilldetailfooter',
'        where tno = :P143_TNO',
'        group by FOOTERHEADCODE',
'    );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>164933552449923711
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600680212898799677)
,p_process_sequence=>60
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
,p_internal_uid=>160293867647873153
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600610338352171831)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(600581388345171811)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Purchase Bill'
,p_static_id=>'process-form-purchase-bill'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>160223993101245307
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(209260926143850002)
,p_process_sequence=>85
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reconcile Purchase Bill financials'
,p_static_id=>'reconcile-purchase-bill-financials'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :REQUEST in (''CREATE'', ''SAVE'') then',
'    imart_purchasebill_calc.reconcile_bill(:P143_TNO);',
'',
'    select sumofamount,',
'           sumoffooteramount,',
'           purchasebillamountbeforeround,',
'           roundoff,',
'           purchasebillamount',
'      into :P143_SUMOFAMOUNT,',
'           :P143_SUMOFFOOTERAMOUNT,',
'           :P143_PURCHASEBILLAMOUNTBEFOREROUND,',
'           :P143_ROUNDOFF,',
'           :P143_PURCHASEBILLAMOUNT',
'      from purchasebill',
'     where tno = :P143_TNO;',
'  end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>209260926143850002
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600679926920796132)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P143_TNO, :P143_PURCHASEORDERNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(600654083656768300)
,p_internal_uid=>160293581669869608
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(452830844364862098)
,p_process_sequence=>110
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Allowed Date'
,p_static_id=>'set-allowed-date'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P143_FORMSTATUS = ''NEWRECORD'' THEN ',
'',
'select',
'		trunc(sysdate) - nvl(b.AllowedBackDays, 0) as AllowedBack,',
'		trunc(sysdate) + nvl(b.AllowedForwardDays, 0) AllowedForward	',
'		--a.FreezeDate',
'        INTO :P143_ALLOWEDBACK,:P143_ALLOWEDFORWARD',
'from Module a, ModulePrivilege b, BossUser c',
'where a.ModuleCode = GetModuleCodeForpageNo(:APP_PAGE_ID)',
'		and a.ModuleCode = b.ModuleCode',
'		and b.BossUsercode = c.BossUserCode',
'		and c.LoginName = :GLOBAL_LOGINNAME',
'		and b.CompanyCode = :GLOBAL_CompanyCode',
'        ;',
'',
'else',
'     :P143_ALLOWEDBACK       := :P143_PURCHASEBILLDATE ; ',
'    :P143_ALLOWEDFORWARD    := :P143_PURCHASEBILLDATE ;',
' end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>13845975165164114
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(601383008785650835)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(600813358654447232)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Terms & Conditions - Save Interactive Grid Data'
,p_static_id=>'terms-conditions-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>160996663534724311
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90014320260926086)
,p_process_sequence=>86
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Verify Purchase Bill calculations before commit'
,p_static_id=>'verify-pb-calculations-before-commit'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_errors varchar2(3000); l_count pls_integer:=0; l_amount number; l_footer number;',
'  l_sa number:=0; l_sf number:=0; l_st number:=0;',
'  procedure add_error(p varchar2) is begin l_count:=l_count+1; if l_count<=8 then l_errors:=l_errors||case when l_errors is null then null else '' | '' end||p; end if; end;',
'  function different(a number,b number,t number) return boolean is begin return abs(nvl(a,0)-nvl(b,0))>t; end;',
'begin',
'  for d in (select d.*,i.measuringunitcode2 unit2,nvl((select sum(f.footervalue) from purchasebilldetailfooter f where f.tno=d.tno and f.sno=d.sno),0) fs from purchasebilldetail d join item i on i.itemcode=d.itemcode where d.tno=:P143_TNO order by d.'
||'sno) loop',
'    l_amount:=nvl(d.rate,0)*case when d.unit2 is not null and upper(trim(d.ratemeasuringunitcode))=upper(trim(d.unit2)) then nvl(d.quantity2,0) else nvl(d.quantity1,0) end;',
'    l_footer:=d.fs;',
'    if different(d.amount,l_amount,.01) then add_error(''SNO ''||d.sno||'' Amount expected ''||l_amount||'', found ''||nvl(d.amount,0)); end if;',
'    if different(d.footeramount,l_footer,.01) then add_error(''SNO ''||d.sno||'' FD/Other expected ''||l_footer||'', found ''||nvl(d.footeramount,0)); end if;',
'    if different(d.totalamount,l_amount+l_footer,.01) then add_error(''SNO ''||d.sno||'' Total expected ''||(l_amount+l_footer)||'', found ''||nvl(d.totalamount,0)); end if;',
'    l_sa:=l_sa+nvl(d.amount,0); l_sf:=l_sf+nvl(d.footeramount,0); l_st:=l_st+nvl(d.totalamount,0);',
'  end loop;',
'  for h in (select sumofamount,sumoffooteramount,purchasebillamountbeforeround from purchasebill where tno=:P143_TNO) loop',
'    if different(h.sumofamount,l_sa,.01) then add_error(''Summary Amount mismatch''); end if;',
'    if different(h.sumoffooteramount,l_sf,.01) then add_error(''Summary Footer mismatch''); end if;',
'    if different(h.purchasebillamountbeforeround,l_st,.01) then add_error(''Bill Amount Before Round mismatch''); end if;',
'  end loop;',
'  if l_errors is not null then raise_application_error(-20052,''Save blocked - Purchase Bill calculation mismatch: ''||l_errors||''. No data from this save was committed.''); end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST in (''SAVE'',''CREATE'')'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_internal_uid=>90014320260926086
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
