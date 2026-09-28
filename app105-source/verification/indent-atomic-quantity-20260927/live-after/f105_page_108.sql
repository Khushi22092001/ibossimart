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
--     PAGE: 108
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
null;
end;
/
prompt --application/pages/delete_00108
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>108);
end;
/
prompt --application/pages/page_00108
begin
wwv_flow_imp_page.create_page(
 p_id=>108
,p_name=>'Indent'
,p_alias=>'INDENT'
,p_step_title=>'Indent'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#myfunctions#MIN#.js'
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
'  var bireporturl = $(''#P108_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/Indent.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''&P_TNO='' + $(''#P108_TNO'').val() ',
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
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P108_BIREPORTURL'').val()',
'  var reportName =  ''Indent.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''"_paramsP_TNO":"'' + $(''#P108_TNO'').val() ',
'      ;',
'//alert($(''#P9993_TNO'').val());',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''&nQUser=''+ username +',
'              ''&nQPassword=''+ password +',
'              ''&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1",''+reportParams+''"}''',
'//alert(reportURL);',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'',
'',
'/* HSPL_PHASE1_FORM_CALC_SAFE_V1 */',
'(function(){',
'"use strict";',
'if(window.hsplPhase1SafeV1)return;window.hsplPhase1SafeV1=true;',
'var pid=Number(apex.env.APP_PAGE_ID||0),tries=0;',
'function n(v){if(v&&typeof v==="object"&&"v" in v)v=v.v;v=Number(String(v==null?0:v).replace(/,/g,""));return Number.isFinite(v)?v:0;}',
'function region(ids){var out=null;ids.some(function(id){try{var r=apex.region(id),m=r.widget().interactiveGrid("getViews","grid").model;if(m){out={r:r,m:m};return true;}}catch(e){}return false;});return out;}',
'function rows(m,fn){m.forEach(function(rec,i,id){var x=m.getRecordMetadata(id);if(!x.deleted&&!x.agg)fn(rec);});}',
'function sum(m,fields){var t={};fields.forEach(function(f){t[f]=0;});rows(m,function(r){fields.forEach(function(f){t[f]+=n(m.getValue(r,f));});});return t;}',
'function modelSet(m,r,f,v){if(m.getFieldKey(f)&&Math.abs(n(m.getValue(r,f))-n(v))>.0000001)m.setValue(r,f,v);}',
'function itemSet(id,v){var x=apex.item(id);if(x&&x.node&&Math.abs(n(x.getValue())-n(v))>.0000001)x.setValue(v,null,true);}',
'function summary(b,values){var h=b.r.element&&b.r.element[0];if(!h)return;var e=h.querySelector(".hspl-phase1-summary");if(!e){e=document.createElement("div");e.className="hspl-phase1-summary";e.setAttribute("role","status");e.style.cssText="display:'
||'flex;gap:18px;justify-content:flex-end;flex-wrap:wrap;padding:8px 12px;margin-top:6px;border:1px solid #d8dde6;border-radius:6px;background:#fff;font-variant-numeric:tabular-nums";h.appendChild(e);}e.innerHTML=values.map(function(x){return "<span>"+a'
||'pex.util.escapeHTML(x[0])+": <strong>"+n(x[1]).toLocaleString("en-IN",{minimumFractionDigits:2,maximumFractionDigits:3})+"</strong></span>";}).join("");}',
'function bind(b,key,fn){if(!b||b.m[key])return !!b;b.m[key]=true;b.m.subscribe({viewId:key,onChange:function(t,c){fn(b,t,c||{});}});fn(b,"refresh",{});return true;}',
'function indent(b,t,c){var f=c.field||c.fieldName;var x=sum(b.m,["INDENTQUANTITY1","QUANTITY1","AMOUNT"]);summary(b,[["Indent Qty",x.INDENTQUANTITY1],["Sanction Qty",x.QUANTITY1],["Amount",x.AMOUNT]]);}',
'function enquiry(b){var x=sum(b.m,["QUANTITY1","QUANTITY2"]);summary(b,[["Quantity 1",x.QUANTITY1],["Quantity 2",x.QUANTITY2]]);}',
'function quotation(b,t,c){var f=c.field||c.fieldName;if(c.record&&(f==="WITHOUTDISCOUNTRATE"||f==="DISCOUNTPERCENTAGE")){var base=n(b.m.getValue(c.record,"WITHOUTDISCOUNTRATE")),disc=base*n(b.m.getValue(c.record,"DISCOUNTPERCENTAGE"))/100;modelSet(b.'
||'m,c.record,"DISCOUNTRATE",disc);modelSet(b.m,c.record,"RATEAFTERDISCOUNT",base-disc);modelSet(b.m,c.record,"RATE",base-disc);}var x=sum(b.m,["AMOUNT","FOOTERAMOUNT","TOTALAMOUNT"]);itemSet("P710_SUMOFAMOUNT",x.AMOUNT);itemSet("P710_SUMOFFOOTERAMOUNT"'
||',x.FOOTERAMOUNT);itemSet("P710_QUOTATIONAMOUNT",x.TOTALAMOUNT);summary(b,[["Amount",x.AMOUNT],["Other / Footer",x.FOOTERAMOUNT],["Quotation Total",x.TOTALAMOUNT]]);}',
'function footer(b){var ft=sum(b.m,["FOOTERVALUE"]).FOOTERVALUE;itemSet("P710_DFTOTALAMOUNT",ft);itemSet("P710_FVALUE",ft);var d=region(["QuotationDetail","quotation-detail"]),s=String(apex.item("P710_SNO").getValue()||"");if(d&&s){rows(d.m,function(r'
||'){if(String(d.m.getValue(r,"SNO")||"")===s){var a=n(d.m.getValue(r,"AMOUNT"));modelSet(d.m,r,"FOOTERAMOUNT",ft);modelSet(d.m,r,"TOTALAMOUNT",a+ft);}});quotation(d,"footer",{});}}',
'function start(){var ok=false;if(pid===108)ok=bind(region(["Detail","item-detail"]),"hsplP108",indent);if(pid===708)ok=bind(region(["item-detail"]),"hsplP708",enquiry);if(pid===710){ok=bind(region(["QuotationDetail","quotation-detail"]),"hsplP710",qu'
||'otation);bind(region(["DetailFooter","detailfooter"]),"hsplP710Footer",footer);}if(!ok&&tries++<20)setTimeout(start,250);}',
'if(pid===708){document.addEventListener("click",function(ev){var b=ev.target.closest&&ev.target.closest("#GETITEM,#getitem");if(!b)return;if(b.dataset.hsplBusy==="Y"){ev.preventDefault();ev.stopImmediatePropagation();return;}b.dataset.hsplBusy="Y";se'
||'tTimeout(function(){b.disabled=true;b.setAttribute("aria-busy","true");},0);},true);apex.jQuery(document).on("apexafterrefresh.hsplP708 apexservererror.hsplP708","#item-detail",function(){var b=document.querySelector("#GETITEM,#getitem");if(b){b.disa'
||'bled=false;b.removeAttribute("aria-busy");delete b.dataset.hsplBusy;}});}',
'apex.jQuery(start);apex.jQuery(document).on("apexafterrefresh.hsplPhase1Safe",function(){tries=0;setTimeout(start,0);});',
'})();',
'',
'',
'/* HSPL_PHASE1_UNCHANGED_FOCUS_GUARD_V2 */',
'(function () {',
'  "use strict";',
'  if (window.hsplPhase1UnchangedFocusGuardV2) { return; }',
'  window.hsplPhase1UnchangedFocusGuardV2 = true;',
'',
'  function elementFromContext(ctx) {',
'    var el = ctx && ctx.browserEvent && ctx.browserEvent.target;',
'    if (!el && ctx) { el = ctx.triggeringElement; }',
'    if (el && el.jquery) { el = el[0]; }',
'    return el || null;',
'  }',
'',
'  function valueOf(el) {',
'    if (!el) { return ""; }',
'    if (el.type === "checkbox" || el.type === "radio") {',
'      return el.checked ? String(el.value == null ? "" : el.value) : "";',
'    }',
'    return String(el.value == null ? "" : el.value);',
'  }',
'',
'  document.addEventListener("focusin", function (event) {',
'    var el = event.target;',
'    if (el && el.dataset && el.matches("input,select,textarea")) {',
'      el.dataset.hsplPhase1FocusStart = valueOf(el);',
'    }',
'  }, true);',
'',
'  window.hsplPhase1WasEdited = function (ctx) {',
'    var el = elementFromContext(ctx);',
'    if (!el || !el.dataset) { return true; }',
'    var before = el.dataset.hsplPhase1FocusStart;',
'    if (before === undefined) { return true; }',
'    return before !== valueOf(el);',
'  };',
'',
'  window.hsplPhase1FocusNumber = function (ctx) {',
'    var n = Number(valueOf(elementFromContext(ctx)).replace(/,/g, ""));',
'    return Number.isFinite(n) ? n : 0;',
'  };',
'',
'  window.hsplPhase1ContextValue = function (ctx, field) {',
'    try {',
'      var item = apex.item(field);',
'      if (item && item.node) { return item.getValue(); }',
'    } catch (ignoreItem) {}',
'    try {',
'      var el = elementFromContext(ctx);',
'      var row = el && el.closest("tr");',
'      var recordId = row && row.getAttribute("data-id");',
'      var pageId = Number(apex.env.APP_PAGE_ID || 0);',
'      var regionId = pageId === 108 ? "Detail" : "QuotationDetail";',
'      var model = apex.region(regionId).widget().interactiveGrid("getViews", "grid").model;',
'      var record = recordId && model.getRecord(recordId);',
'      return record ? model.getValue(record, field) : null;',
'    } catch (ignoreGrid) { return null; }',
'  };',
'',
'  window.hsplPhase1IsBlank = function (value) {',
'    return value === null || value === undefined || String(value).trim() === "";',
'  };',
'})();',
'',
'',
'',
'',
'',
'',
'/* HSPL_INDENT_ATOMIC_QUANTITY_V1 */',
'(function () {',
'  "use strict";',
'  if (Number(apex.env.APP_PAGE_ID || 0) !== 108 || window.hsplIndentAtomicQuantityV1) { return; }',
'  window.hsplIndentAtomicQuantityV1 = true;',
'  var pending = null;',
'  var fields = ["INDENTQUANTITY1", "INDENTQUANTITY2", "QUANTITY1", "QUANTITY2", "QOH1"];',
'',
'  function scalar(value) {',
'    return value && typeof value === "object" && "v" in value ? value.v : value;',
'  }',
'',
'  function numeric(value) {',
'    value = scalar(value);',
'    if (value === null || value === undefined || String(value).trim() === "") { return null; }',
'    var parsed = Number(String(value).replace(/,/g, ""));',
'    return Number.isFinite(parsed) ? parsed : null;',
'  }',
'',
'  function fieldName(element) {',
'    var id = String(element && element.id || "").toUpperCase();',
'    var label = String(element && element.getAttribute("aria-labelledby") || "").toUpperCase();',
'    if (id === "INDENTQUANTITY1" || label.indexOf("INDENTQUANTITY1") >= 0) { return "INDENTQUANTITY1"; }',
'    if (id === "INDENTQUANTITY2" || label.indexOf("INDENTQUANTITY2") >= 0) { return "INDENTQUANTITY2"; }',
'    if (id === "QUANTITY1" || label.indexOf("QUANTITY1") >= 0) { return "QUANTITY1"; }',
'    if (id === "QUANTITY2" || label.indexOf("QUANTITY2") >= 0) { return "QUANTITY2"; }',
'    if (id === "QOH1" || id === "C835772166892646796" || label.indexOf("QOH1") >= 0) { return "QOH1"; }',
'    return null;',
'  }',
'',
'  function context(element, field) {',
'    try {',
'      var region = apex.region("Detail");',
'      var grid = region.widget().interactiveGrid("getViews", "grid");',
'      var model = grid.model;',
'      var row = element && element.closest && element.closest("tr[data-id]");',
'      var recordId = row && row.getAttribute("data-id");',
'      var record = recordId != null ? model.getRecord(recordId) : null;',
'      if (!record && grid.view$ && typeof grid.view$.grid === "function") {',
'        record = grid.view$.grid("getActiveRecord");',
'        recordId = record && model.getRecordId(record);',
'      }',
'      return record ? { region: region, grid: grid, model: model, record: record, recordId: recordId, field: field } : null;',
'    } catch (ignore) { return null; }',
'  }',
'',
'  function set(model, record, field, value) {',
'    var oldValue = scalar(model.getValue(record, field));',
'    var output = value === null || value === undefined ? "" : String(value);',
'    var oldNumber = numeric(oldValue);',
'    var newNumber = numeric(output);',
'    if ((oldNumber === null) !== (newNumber === null) || (oldNumber !== null && Math.abs(oldNumber - newNumber) > 0.0000001)) {',
'      model.setValue(record, field, output);',
'    }',
'  }',
'',
'  function validate(model, record) {',
'    var id = model.getRecordId(record);',
'    var indent1 = numeric(model.getValue(record, "INDENTQUANTITY1"));',
'    var sanction1 = numeric(model.getValue(record, "QUANTITY1"));',
'    var indent2 = numeric(model.getValue(record, "INDENTQUANTITY2"));',
'    var sanction2 = numeric(model.getValue(record, "QUANTITY2"));',
'    if (indent1 !== null && sanction1 !== null && sanction1 > indent1 + 0.0000001) {',
'      model.setValidity("error", id, "QUANTITY1", "Sanction Qty cannot be greater than Indent Qty. Indent: " + indent1 + " Sanctioned: " + sanction1 + ".");',
'    } else {',
'      model.setValidity("valid", id, "QUANTITY1");',
'    }',
'    if (indent2 !== null && sanction2 !== null && sanction2 > indent2 + 0.0000001) {',
'      model.setValidity("error", id, "QUANTITY2", "Secondary Sanction Qty cannot be greater than Secondary Indent Qty.");',
'    } else {',
'      model.setValidity("valid", id, "QUANTITY2");',
'    }',
'  }',
'',
'  function apply(element) {',
'    if (!pending || pending.element !== element) { return; }',
'    var job = pending;',
'    pending = null;',
'    var raw = String(element.value == null ? "" : element.value);',
'    if (raw === String(element.dataset.hsplIndentAtomicStart || "")) { return; }',
'    var model = job.model;',
'    var record = job.record;',
'    try {',
'      if (job.grid.view$ && typeof job.grid.view$.grid === "function") {',
'        job.grid.view$.grid("setActiveRecordValue", job.field);',
'      }',
'    } catch (ignoreCommit) {}',
'    set(model, record, job.field, raw);',
'    var value = numeric(raw);',
'    var factor = numeric(model.getValue(record, "MULTIPLYINGFACTOR"));',
'    var rate = numeric(model.getValue(record, "RATE")) || 0;',
'    if (job.field === "INDENTQUANTITY1") {',
'      set(model, record, "QUANTITY1", value);',
'      set(model, record, "AMOUNT", value === null ? 0 : value * rate);',
'      if (factor !== null && factor > 0) {',
'        set(model, record, "INDENTQUANTITY2", value === null ? null : value * factor);',
'        set(model, record, "QUANTITY2", value === null ? null : value * factor);',
'      }',
'    } else if (job.field === "INDENTQUANTITY2" && value !== null && value > 0 && factor !== null && factor > 0) {',
'      set(model, record, "INDENTQUANTITY1", value / factor);',
'      set(model, record, "QUANTITY1", value / factor);',
'      set(model, record, "QUANTITY2", value);',
'      set(model, record, "AMOUNT", value / factor * rate);',
'    } else if (job.field === "QUANTITY1" && factor !== null && factor > 0) {',
'      set(model, record, "QUANTITY2", value === null ? null : value * factor);',
'    } else if (job.field === "QUANTITY2" && value !== null && value > 0 && factor !== null && factor > 0) {',
'      set(model, record, "QUANTITY1", value / factor);',
'    } else if (job.field === "QOH1" && factor !== null && factor > 0) {',
'      set(model, record, "QOH2", value === null ? null : value * factor);',
'    }',
'    validate(model, record);',
'  }',
'',
'  document.addEventListener("focusin", function (event) {',
'    var element = event.target;',
'    if (!element || !element.closest || !element.closest("#Detail")) { return; }',
'    var field = fieldName(element);',
'    if (!field || fields.indexOf(field) < 0) { return; }',
'    element.dataset.hsplIndentAtomicStart = String(element.value == null ? "" : element.value);',
'    pending = null;',
'  }, true);',
'',
'  document.addEventListener("input", function (event) {',
'    var element = event.target;',
'    if (!element || !element.closest || !element.closest("#Detail")) { return; }',
'    var field = fieldName(element);',
'    if (!field || fields.indexOf(field) < 0) { return; }',
'    if (String(element.value) === String(element.dataset.hsplIndentAtomicStart || "")) { pending = null; return; }',
'    var ctx = context(element, field);',
'    if (ctx) { ctx.element = element; pending = ctx; }',
'  }, true);',
'',
'  document.addEventListener("keydown", function (event) {',
'    if (event.key === "Tab" || event.key === "Enter") { apply(event.target); }',
'  }, true);',
'  document.addEventListener("focusout", function (event) { apply(event.target); }, true);',
'  document.addEventListener("change", function (event) { apply(event.target); }, true);',
'})();',
'',
'/* HSPL_INDENT_PENDING_EDIT_V8 */',
'(function () {',
'  "use strict";',
'  if (window.hsplIndentPendingEditV8) { return; }',
'  window.hsplIndentPendingEditV8 = true;',
'  var pending = null;',
'  var clean = null;',
'  var manualRates = Object.create(null);',
'',
'  function n(value) {',
'    if (value && typeof value === "object" && "v" in value) { value = value.v; }',
'    var parsed = Number(String(value == null ? 0 : value).replace(/,/g, ""));',
'    return Number.isFinite(parsed) ? parsed : 0;',
'  }',
'',
'  function fieldName(element) {',
'    var id = element && element.id || "";',
'    if (id === "RATE" || id === "C835772576449646800") { return "RATE"; }',
'    var labelledBy = element && element.getAttribute("aria-labelledby") || "";',
'    if (labelledBy.indexOf("C835772576449646800") >= 0) { return "RATE"; }',
'    return null;',
'  }',
'',
'  function gridContext() {',
'    try {',
'      var region = apex.region("Detail");',
'      var grid = region.widget().interactiveGrid("getViews", "grid");',
'      return grid && grid.model ? { region: region, grid: grid, model: grid.model } : null;',
'    } catch (ignore) { return null; }',
'  }',
'',
'  function capture(element, field) {',
'    var ctx = gridContext();',
'    if (!ctx) { return null; }',
'    var recordId = null;',
'    try {',
'      if (ctx.grid.view$ && typeof ctx.grid.view$.grid === "function") {',
'        recordId = ctx.grid.view$.grid("getActiveRecordId");',
'      }',
'    } catch (ignoreGrid) {}',
'    var record = recordId != null ? ctx.model.getRecord(recordId) : null;',
'    if (!record) {',
'      var selected = ctx.region.widget().interactiveGrid("getSelectedRecords");',
'      if (selected && selected.length === 1) { record = selected[0]; }',
'    }',
'    if (!record) { return null; }',
'    if (recordId == null && typeof ctx.model.getRecordId === "function") {',
'      recordId = ctx.model.getRecordId(record);',
'    }',
'',
'    var qtySnapshot = n(ctx.model.getValue(record, "INDENTQUANTITY1"));',
'    if (recordId != null) {',
'      var row = document.querySelector(''#Detail_ig_grid_vc tbody tr[data-id="'' + String(recordId).replace(/"/g, ''\\"'') + ''"]'');',
'      var qtyCell = row && row.querySelectorAll("td")[6];',
'      if (qtyCell && String(qtyCell.textContent || "").trim() !== "") {',
'        qtySnapshot = n(qtyCell.textContent);',
'      }',
'    }',
'    return { element: element, field: field, raw: element.value, ctx: ctx,',
'             record: record, recordId: recordId, qtySnapshot: qtySnapshot };',
'  }',
'',
'  function bindRatePrecedence(ctx) {',
'    var model = ctx && ctx.model;',
'    if (!model || model.hsplIndentRatePrecedenceV9) { return; }',
'    model.hsplIndentRatePrecedenceV9 = true;',
'    model.subscribe({',
'      viewId: "hsplIndentRatePrecedenceV9",',
'      onChange: function (type, change) {',
'        var field = change && (change.field || change.fieldName);',
'        var record = change && change.record;',
'        if (!record || !field) { return; }',
'        var id = typeof model.getRecordId === "function" ? model.getRecordId(record) : null;',
'        if (field === "ITEMSPECIFICATIONCODE") {',
'          if (id != null) { delete manualRates[String(id)]; }',
'          return;',
'        }',
'        if (field !== "RATE") { return; }',
'        setTimeout(function () {',
'          var rate = n(model.getValue(record, "RATE"));',
'          var key = id == null ? null : String(id);',
'          if (key != null && Object.prototype.hasOwnProperty.call(manualRates, key)) {',
'            var manualRate = n(manualRates[key]);',
'            if (Math.abs(rate - manualRate) > 0.0000001) {',
'              model.setValue(record, "RATE", manualRates[key]);',
'            }',
'            rate = manualRate;',
'          }',
'          var amount = n(model.getValue(record, "INDENTQUANTITY1")) * rate;',
'          if (Math.abs(n(model.getValue(record, "AMOUNT")) - amount) > 0.0000001) {',
'            model.setValue(record, "AMOUNT", amount);',
'          }',
'        }, 0);',
'      }',
'    });',
'  }',
'',
'  function restoreClean(job) {',
'    setTimeout(function () {',
'      var current = gridContext();',
'      if (current && current.model === job.ctx.model) { job.ctx = current; }',
'      var model = job.ctx.model;',
'      if (Math.abs(n(model.getValue(job.record, job.field)) - n(job.fieldSnapshot)) > 0.0000001) {',
'        model.setValue(job.record, job.field, job.fieldSnapshot);',
'      }',
'      if (Math.abs(n(model.getValue(job.record, "AMOUNT")) - n(job.amountSnapshot)) > 0.0000001) {',
'        model.setValue(job.record, "AMOUNT", job.amountSnapshot);',
'      }',
'    }, 0);',
'  }',
'',
'  function finish(element) {',
'    if (!pending || pending.element !== element) {',
'      if (clean && clean.element === element) {',
'        var unchanged = clean;',
'        clean = null;',
'        restoreClean(unchanged);',
'      }',
'      return;',
'    }',
'    var job = pending;',
'    pending = null;',
'    clean = null;',
'    if (String(job.raw) === String(element.dataset.hsplIndentEditStart || "")) { return; }',
'    setTimeout(function () {',
'      var current = gridContext();',
'      if (current && current.model === job.ctx.model) { job.ctx = current; }',
'      var model = job.ctx.model;',
'      bindRatePrecedence(job.ctx);',
'      if (job.field === "RATE" && job.recordId != null) {',
'        manualRates[String(job.recordId)] = job.raw;',
'      }',
'      model.setValue(job.record, job.field, job.raw);',
'      var qty = job.field === "INDENTQUANTITY1" ? n(job.raw) : job.qtySnapshot;',
'      var rate = job.field === "RATE" ? n(job.raw) : n(model.getValue(job.record, "RATE"));',
'      var amount = qty * rate;',
'      if (Math.abs(n(model.getValue(job.record, "AMOUNT")) - amount) > 0.0000001) {',
'        model.setValue(job.record, "AMOUNT", amount);',
'      }',
'    }, 0);',
'  }',
'',
'  document.addEventListener("focusin", function (event) {',
'    var element = event.target;',
'    if (!element || !element.closest || !element.closest("#Detail")) { return; }',
'    if (!fieldName(element)) { return; }',
'    element.dataset.hsplIndentEditStart = String(element.value == null ? "" : element.value);',
'    pending = null;',
'    clean = capture(element, fieldName(element));',
'    if (clean) {',
'      clean.fieldSnapshot = clean.ctx.model.getValue(clean.record, clean.field);',
'      if (clean.recordId != null) {',
'        var row = document.querySelector(''#Detail_ig_grid_vc tbody tr[data-id="'' + String(clean.recordId).replace(/"/g, ''\\"'') + ''"]'');',
'        var cellIndex = clean.field === "RATE" ? 15 : 6;',
'        var fieldCell = row && row.querySelectorAll("td")[cellIndex];',
'        if (fieldCell && String(fieldCell.textContent || "").trim() !== "") {',
'          clean.fieldSnapshot = fieldCell.textContent;',
'        }',
'      }',
'      clean.amountSnapshot = clean.ctx.model.getValue(clean.record, "AMOUNT");',
'    }',
'  }, true);',
'',
'  document.addEventListener("input", function (event) {',
'    var element = event.target;',
'    if (!element || !element.closest || !element.closest("#Detail")) { return; }',
'    var field = fieldName(element);',
'    if (!field) { return; }',
'    if (String(element.value) === String(element.dataset.hsplIndentEditStart || "")) {',
'      pending = null;',
'      return;',
'    }',
'    pending = capture(element, field);',
'  }, true);',
'',
'  document.addEventListener("keydown", function (event) {',
'    if (event.key === "Tab" || event.key === "Enter") { finish(event.target); }',
'  }, true);',
'  document.addEventListener("focusout", function (event) { finish(event.target); }, true);',
'  document.addEventListener("change", function (event) { finish(event.target); }, true);',
'})();',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//apex.item(''P108_LOCATIONCODE'').setFocus();',
'',
'$(''#P108_REMARK'').on(''keydown'', function(e) {',
'    ',
'    if(e.shiftKey && e.which == 9) { ',
'        //shift was down when tab was pressed',
'        e.preventDefault(); ',
'        $(".apex-rds [href=''#General'']").trigger("click");',
'        apex.item(''P108_DEPARTMENTCODE'').setFocus();',
'    }',
'   else if(e.which == 9) { ',
'      e.preventDefault(); ',
'     // $(".apex-rds [href=''#Detail'']").trigger("click");',
'     // apex.item(''P23_NEW'').setFocus();',
'     apex.region("TABS").widget().aTabs("getTabs")["#SR_General"].moveNext();',
'',
'        apex.region( "Detail" ).widget().interactiveGrid( "getActions" ).set("edit", true);',
'   }',
'   ',
'});',
'',
'',
'/* HSPL_CROSSFORM_DETAIL_INTEGRITY_V1 */',
'(function(){',
'  "use strict";',
'  if(Number(apex.env.APP_PAGE_ID||0)!==108||window.hsplCrossformDetailIntegrityV1)return;',
'  window.hsplCrossformDetailIntegrityV1=true;',
'  var heldFromDetail=false;',
'  function inDetail(target){return !!(target&&target.closest&&target.closest("#detail,#Detail_ig,#item-detail,#item-detail_ig"));}',
'  document.addEventListener("keydown",function(event){',
'    if(event.key!=="Tab")return;',
'    if(!event.repeat){heldFromDetail=inDetail(event.target);return;}',
'    if(heldFromDetail){event.preventDefault();event.stopImmediatePropagation();}',
'  },true);',
'  document.addEventListener("keyup",function(event){if(event.key==="Tab")heldFromDetail=false;},true);',
'  window.addEventListener("blur",function(){heldFromDetail=false;});',
'  ',
'})();',
'',
''))
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
':root{',
'    --a-menu-font-size: 1.25rem !important;',
'}',
'',
'// Width Adjustment for Edit button in Interactive Report',
'.u-tC {',
'    width: 50px; /* Adjust the width as per your requirement */',
'}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1126326824023815957)
,p_plug_name=>'Attachment'
,p_static_id=>'attachment'
,p_region_name=>'Attachment'
,p_parent_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.TNO,',
'       A.ATTRIBUTEVALUE,',
'       A.ATTACHMENTBLOB,',
'       A.FILENAME,',
'       A.ATTRIBUTECODE,',
'       A.MODULETNO,',
'       A.MODULESNO,',
'       b.PARTYATTRIBUTEname',
'  from MODULEATTACHMENT A',
'  left join partyattribute b',
'    on a.ATTRIBUTECODE = b.PARTYATTRIBUTECODE',
' where A.MODULETNO = :P108_TNO'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P108_TNO'
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
 p_id=>wwv_flow_imp.id(1126327568598815965)
,p_max_row_count=>'1000000'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:1063:&SESSION.::&DEBUG.:1063:P1063_MODULESNO,P1063_MODULETNO,P1063_PARENT_FORMSTATUS:#MODULESNO#,#MODULETNO#,&P108_FORMSTATUS.#SNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_attr=>'width:190px'
,p_internal_uid=>1094285052064406217
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1126328138084815970)
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
 p_id=>wwv_flow_imp.id(845943549803686278)
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
 p_id=>wwv_flow_imp.id(973542424326630653)
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
 p_id=>wwv_flow_imp.id(1126328209324815971)
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
 p_id=>wwv_flow_imp.id(694074339074000770)
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
 p_id=>wwv_flow_imp.id(692680063739869719)
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
 p_id=>wwv_flow_imp.id(601662254144478240)
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
 p_id=>wwv_flow_imp.id(1126327727901815966)
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
 p_id=>wwv_flow_imp.id(1128973157996791419)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'371612'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PARTYATTRIBUTENAME:ATTRIBUTEVALUE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(686864236994684886)
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
 p_id=>wwv_flow_imp.id(1054243385060752704)
,p_plug_name=>'Common Fields'
,p_static_id=>'common-fields'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'AFTER_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(676919799007061684)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_region_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
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
 p_id=>wwv_flow_imp.id(937163079457390733)
,p_plug_name=>'Indent'
,p_static_id=>'indent'
,p_region_name=>'TABS'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(573879776706959559)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       COMPANYCODE,',
'       FINANCIALYEARCODE,',
'       LOCATIONCODE,',
'       DOCTYPECODE,',
'       INDENTNO,',
'       DEPARTMENTCODE,',
'       WORKORDERTNO,',
'       REMARK,',
'       INDENTDATE,',
'       ISCOMBINEDINDENT,',
'       JOBORDERTNO,',
'       TASKSNO,',
'       MAINTENANCEPLANTNO,',
'       BREAKDOWNTNO,',
'       CREATOR,',
'       PROJECTTNO,',
'       RETENTIONMONEY,',
'       ACTIVETIME,',
'       MAJORTASKSNO,',
'       WBDSCODE,',
'       TASKNATURECODE,',
'       ITEMNATURECODE,',
'       ISAUTOINDENT,',
'       REQUISITIONTNO,',
'       EQUIPMENTMAINTENANCEORDERTNO,',
'       CREATIONTIME,',
'       REFINDENTTNO,',
'       VNO,',
'       NVL(getdocumentstatuscode(getmodulecodeforpageno(:APP_PAGE_ID),TNO),''Status'') as Status',
'  from INDENT'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(837024601150099904)
,p_plug_name=>'IndentDetailQuality'
,p_static_id=>'indentdetailquality'
,p_region_name=>'IndentDetailQuality'
,p_region_css_classes=>'js-dialog-size900x300'
,p_region_template_options=>'#DEFAULT#:js-dialog-nosize'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid , TNO,',
'       SNO,',
'       SERIALNO,',
'       QUALITYCODE,',
'       MINIMUMVALUE,',
'       MAXIMUMVALUE,',
'       TOLERANCE,',
'       REMARK,',
'       QUALITYVALUE',
'  from INDENTDETAILQUALITY',
'  where tno = :P108_TNO',
'  and sno = :P108_SNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(835770718886646782)
,p_ajax_items_to_submit=>'P108_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'IndentDetailQuality'
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
 p_id=>wwv_flow_imp.id(837025931993099917)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(837653045150405368)
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
 p_id=>wwv_flow_imp.id(837025336635099911)
,p_name=>'MAXIMUMVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAXIMUMVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Maximum Value'
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
 p_id=>wwv_flow_imp.id(837025214103099910)
,p_name=>'MINIMUMVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MINIMUMVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Minimum Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
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
 p_id=>wwv_flow_imp.id(837025144378099909)
,p_name=>'QUALITYCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Quality'
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
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select qualityname , qualitycode from quality',
'where getdocumentstatuscode(''QUALITY'',TNO) = ''ACTIVE'''))
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
 p_id=>wwv_flow_imp.id(837025634662099914)
,p_name=>'QUALITYVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYVALUE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Quality Value'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
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
 p_id=>wwv_flow_imp.id(837025519165099913)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(837025846225099916)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(837025071924099908)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Serialno'
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
 p_id=>wwv_flow_imp.id(837024940339099907)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
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
,p_parent_column_id=>wwv_flow_imp.id(835771085167646785)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(837024804519099906)
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
,p_default_type=>'ITEM'
,p_default_expression=>'P108_TNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(837025442517099912)
,p_name=>'TOLERANCE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOLERANCE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tolerance'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(837024764893099905)
,p_internal_uid=>804982248358690157
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
 p_id=>wwv_flow_imp.id(837639790801357591)
,p_interactive_grid_id=>wwv_flow_imp.id(837024764893099905)
,p_static_id=>'156008'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(837639962983357591)
,p_report_id=>wwv_flow_imp.id(837639790801357591)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(837640488421357594)
,p_view_id=>wwv_flow_imp.id(837639962983357591)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(837024804519099906)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(837641383366357598)
,p_view_id=>wwv_flow_imp.id(837639962983357591)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(837024940339099907)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>128
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(837642266821357602)
,p_view_id=>wwv_flow_imp.id(837639962983357591)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(837025071924099908)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(837643553205357607)
,p_view_id=>wwv_flow_imp.id(837639962983357591)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(837025144378099909)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(837644447419357611)
,p_view_id=>wwv_flow_imp.id(837639962983357591)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(837025214103099910)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(837645373186357615)
,p_view_id=>wwv_flow_imp.id(837639962983357591)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(837025336635099911)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(837646264554357619)
,p_view_id=>wwv_flow_imp.id(837639962983357591)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(837025442517099912)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(837647109334357623)
,p_view_id=>wwv_flow_imp.id(837639962983357591)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(837025519165099913)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(837648002798357628)
,p_view_id=>wwv_flow_imp.id(837639962983357591)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(837025634662099914)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(837659324655408567)
,p_view_id=>wwv_flow_imp.id(837639962983357591)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(837025846225099916)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(837660207991408576)
,p_view_id=>wwv_flow_imp.id(837639962983357591)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(837025931993099917)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(835770718886646782)
,p_plug_name=>'Item Detail'
,p_static_id=>'item-detail'
,p_region_name=>'Detail'
,p_parent_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       A.TNO,',
'       A.SNO,',
'       A.SERIALNO,',
'       A.ITEMCODE,',
'       A.ITEMSPECIFICATIONCODE,',
'       B.HSNCODE AS HSNCODE,',
'       A.DESCRIPTION,',
'       C.MEASURINGUNITCODE1 AS UOM,',
'       B.MULTIPLYINGFACTOR AS MULTIPLYINGFACTOR,',
'       A.INDENTQUANTITY1,',
'       A.QUANTITY1,',
'       A.INDENTQUANTITY2,',
'       A.QUANTITY2,',
'       A.QOH1,',
'       A.QOH2,',
'       A.PRIORITYCODE,',
'       A.REMARK,',
'       A.RATE,',
'       A.AMOUNT,',
'       A.JOBTYPECODE,',
'       A.REQUIREMENTTIMEINDAYS,',
'      -- BOMCODE,',
'',
'       A.ACCEPTANCEONCOMMISSIONING,',
'       A.DOCUMENTSTATUSCODE,',
'',
'       A.STOCKINHAND,',
'       A.ORDEREDQUANTITY1,',
'       A.ORDEREDQUANTITY2,',
'       A.PHYSICALQUANTITY1,',
'       A.PHYSICALQUANTITY2,',
'       A.EQUIPMENTTNO,      ',
'       A.STATUSMODIFICATIONTIME,',
'       A.STATUSMODIFICATIONBYUSER,',
'       A.ENQUIRYTNO,',
'       ''Q'' as Q,',
'       A.SN,',
'       d.measuringunitname as Unit1,',
'       e.measuringunitname as Unit2',
'  from INDENTDETAIL A, ITEMSPECIFICATION B, ITEM C , measuringunit D , measuringunit E',
'  where A.tno = :P108_TNO',
'    AND A.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
'    AND A.ITEMCODE = C.ITEMCODE',
'    and c.MEASURINGUNITCODE1 = d.measuringunitcode(+)',
'    and c.MEASURINGUNITCODE2 = e.measuringunitcode(+)',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P108_TNO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Item Detail'
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
 p_id=>wwv_flow_imp.id(676921135586061698)
,p_heading=>'Action'
,p_static_id=>'action'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(835858005238719968)
,p_heading=>'Material'
,p_static_id=>'material'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(835774238295646817)
,p_heading=>'Primary'
,p_static_id=>'primary'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(835858173910719969)
,p_heading=>'Secondary'
,p_static_id=>'secondary'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(835858244532719970)
,p_heading=>'Stock In Hand'
,p_static_id=>'stock-in-hand'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835773029604646805)
,p_name=>'ACCEPTANCEONCOMMISSIONING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCEPTANCEONCOMMISSIONING'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Acceptance On Commissioning'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
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
,p_default_type=>'STATIC'
,p_default_expression=>'NO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835772661666646801)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>200
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'9999999999.99'
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
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(704071257723854771)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(704071378999854772)
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
 p_id=>wwv_flow_imp.id(835771595425646790)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(835858005238719968)
,p_use_group_for=>'BOTH'
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835773168809646806)
,p_name=>'DOCUMENTSTATUSCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCUMENTSTATUSCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
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
,p_lov_source=>'select DOCUMENTSTATUSNAME , DOCUMENTSTATUSCODE from DOCUMENTSTATUS'
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
 p_id=>wwv_flow_imp.id(835774039972646815)
,p_name=>'ENQUIRYTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ENQUIRYTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>330
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835773793915646812)
,p_name=>'EQUIPMENTTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EQUIPMENTTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>300
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835771403362646789)
,p_name=>'HSNCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HSNCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'HSN'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(835858005238719968)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_max_length=>30
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835771770740646792)
,p_name=>'INDENTQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDENTQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Indent'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(835774238295646817)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'INDENTQUANTITY1'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835771931999646794)
,p_name=>'INDENTQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDENTQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Indent'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(835858173910719969)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'INDENTQUANTITY2'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835771243066646787)
,p_name=>'ITEMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(835858005238719968)
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
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select itemname , itemcode from item ',
'--where getdocumentstatuscode(''ITEM'',TNO) = ''ACTIVE''',
'where itemnaturecode not in (''SERVICES'')'))
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
 p_id=>wwv_flow_imp.id(835771393949646788)
,p_name=>'ITEMSPECIFICATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item Specification'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(835858005238719968)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '500')).to_clob
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
,p_static_id=>'ITEMSPECIFICATIONCODE'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835772765709646802)
,p_name=>'JOBTYPECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOBTYPECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835858597029719974)
,p_name=>'MULTIPLYINGFACTOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MULTIPLYINGFACTOR'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Multiplyingfactor'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>340
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>0
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835773388893646808)
,p_name=>'ORDEREDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDEREDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835773399463646809)
,p_name=>'ORDEREDQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDEREDQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835773580953646810)
,p_name=>'PHYSICALQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PHYSICALQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835773674396646811)
,p_name=>'PHYSICALQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PHYSICALQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835772386318646798)
,p_name=>'PRIORITYCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRIORITYCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Priority'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
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
,p_lov_source=>'select PRIORITYNAME , PRIORITYCODE from Priority'
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
 p_id=>wwv_flow_imp.id(706622941967209601)
,p_name=>'Q'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Q'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Q'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>370
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
 p_id=>wwv_flow_imp.id(835772166892646796)
,p_name=>'QOH1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QOH1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Primary'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(835858244532719970)
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
 p_id=>wwv_flow_imp.id(835772221221646797)
,p_name=>'QOH2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QOH2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Secondary'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(835858244532719970)
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
 p_id=>wwv_flow_imp.id(835771873336646793)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sanctioned'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(835774238295646817)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'QUANTITY1'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835772020658646795)
,p_name=>'QUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sanctioned'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(835858173910719969)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'QUANTITY2'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835772576449646800)
,p_name=>'RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>190
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'9999999999.99'
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
 p_id=>wwv_flow_imp.id(835772421681646799)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Purpose'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
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
 p_id=>wwv_flow_imp.id(835772868771646803)
,p_name=>'REQUIREMENTTIMEINDAYS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REQUIREMENTTIMEINDAYS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Required  In Days'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>220
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
 p_id=>wwv_flow_imp.id(835771144690646786)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sl No.'
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
 p_id=>wwv_flow_imp.id(704957402253641710)
,p_name=>'SN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sn'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>360
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GLOBALTNO'
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835771085167646785)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'SNO'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GLOBALTNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835773938755646814)
,p_name=>'STATUSMODIFICATIONBYUSER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STATUSMODIFICATIONBYUSER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>320
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835773811102646813)
,p_name=>'STATUSMODIFICATIONTIME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STATUSMODIFICATIONTIME'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>310
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835773214168646807)
,p_name=>'STOCKINHAND'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STOCKINHAND'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835770923332646784)
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
,p_static_id=>'TNO'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P108_TNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(706623049577209602)
,p_name=>'UNIT1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>380
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(835774238295646817)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(706623158719209603)
,p_name=>'UNIT2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>390
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(835858173910719969)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(835771601869646791)
,p_name=>'UOM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UOM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'UOM'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(835858005238719968)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_max_length=>30
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(835770889475646783)
,p_internal_uid=>803728372941237035
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
'}',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(835809941128708332)
,p_interactive_grid_id=>wwv_flow_imp.id(835770889475646783)
,p_static_id=>'137710'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(835810162244708332)
,p_report_id=>wwv_flow_imp.id(835809941128708332)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(540959334154634964)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(706622941967209601)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(540960347050634969)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(706623049577209602)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>52
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(540961233741634971)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(706623158719209603)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>56
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(704084985530098377)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(704071257723854771)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(705451029508525943)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(704957402253641710)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835810665745708334)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(835770923332646784)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835811517508708338)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(835771085167646785)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835812409509708342)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(835771144690646786)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>62
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835813301512708346)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(835771243066646787)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>262
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835814207135708350)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(835771393949646788)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>376
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835815166797708354)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(835771403362646789)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835816037553708358)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(835771595425646790)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>184
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835816995102708362)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(835771601869646791)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835817874389708366)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(835771770740646792)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835818766705708370)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(835771873336646793)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>99
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835819692197708374)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(835771931999646794)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>84
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835820591332708378)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(835772020658646795)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835821424427708382)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(835772166892646796)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835822308675708386)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(835772221221646797)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>103
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835823186904708390)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(835772386318646798)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835824050575708394)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(835772421681646799)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835824941167708399)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(835772576449646800)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>99.984
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835825823473708403)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(835772661666646801)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835826710705708407)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(835772765709646802)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835827689578708411)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(835772868771646803)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835829409824708420)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(835773029604646805)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835830363985708424)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(835773168809646806)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835831210755708428)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(835773214168646807)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835832153149708432)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(835773388893646808)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835833039764708436)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(835773399463646809)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835833990636708440)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(835773580953646810)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835834811186708444)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(835773674396646811)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835835768311708448)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(835773793915646812)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835836647499708452)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(835773811102646813)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835837580678708457)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(835773938755646814)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835838492729708461)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(835774039972646815)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(835922486940005623)
,p_view_id=>wwv_flow_imp.id(835810162244708332)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(835858597029719974)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38607438429424834)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(835770718886646782)
,p_button_name=>'ADD'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::P9_TNO:&P108_TNO.'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38588735505424820)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(686864236994684886)
,p_button_name=>'AddNew'
,p_static_id=>'addnew'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pillEnd'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.::'
,p_confirm_message=>'Want to Add New Record? '
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38638257909424854)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1126326824023815957)
,p_button_name=>'ADDNEW_1'
,p_static_id=>'addnew-2'
,p_button_static_id=>'ADDNEW_1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'ADD NEW'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1063:&SESSION.::&DEBUG.:1063:P1063_MODULETNO:&P108_TNO.'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38587158811424819)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(686864236994684886)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38588370194424820)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(686864236994684886)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P108_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38587575437424819)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(686864236994684886)
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
,p_button_condition=>'P108_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38585601967424819)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(686864236994684886)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P108_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38585938188424819)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(686864236994684886)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P108_TNO.'
,p_button_condition=>'P108_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38585148946424818)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(686864236994684886)
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
,p_button_condition=>'P108_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38586815241424819)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(686864236994684886)
,p_button_name=>'PRINT_1'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P108_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38607829143424834)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(835770718886646782)
,p_button_name=>'Reresh'
,p_static_id=>'reresh'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Reresh'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38587953494424820)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(686864236994684886)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P108_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38586334060424819)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(686864236994684886)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P108_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P108_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(38700831167424877)
,p_branch_name=>'Go To Page 201'
,p_branch_action=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(38587575437424819)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937227127948390834)
,p_name=>'P108_ACTIVETIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'ACTIVETIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(553278840990146608)
,p_name=>'P108_ALLOWEDBACK'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(1054243385060752704)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(553279142385148945)
,p_name=>'P108_ALLOWEDFORWARD'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(1054243385060752704)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1209000000000108108)
,p_name=>'P108_ATTACHMENT_TNO'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(1054243385060752704)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_tno number;',
'begin',
'    if :P108_TNO is not null then',
'        return :P108_TNO;',
'    end if;',
'    select GlobalTNo.nextval into l_tno from dual;',
'    return l_tno;',
'end;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1140689994610994722)
,p_name=>'P108_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1054243385060752704)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937225520773390833)
,p_name=>'P108_BREAKDOWNTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'BREAKDOWNTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1082071649394726330)
,p_name=>'P108_CALLEDFROMPAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1054243385060752704)
,p_item_default=>'107'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(546256102348318317)
,p_name=>'P108_CALLEDFROMTNO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1054243385060752704)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937220290540390830)
,p_name=>'P108_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937230292207390835)
,p_name=>'P108_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937225869354390833)
,p_name=>'P108_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937234859989390837)
,p_name=>'P108_DEPARTMENTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(676919799007061684)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_prompt=>'Department'
,p_source=>'DEPARTMENTCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       a.DepartmentName,',
'       a.Departmentcode',
'from ',
'       Department a',
'where getdocumentstatuscode(''DEPARTMENT'',A.TNO) = ''ACTIVE''',
''))
,p_cSize=>100
,p_cMaxlength=>30
,p_colspan=>6
,p_grid_label_column_span=>1
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
 p_id=>wwv_flow_imp.id(937234107833390836)
,p_name=>'P108_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(676919799007061684)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
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
'    and d.EntryPageNo = :APP_PAGE_ID',
'    AND getdocumentstatuscode(''DOCTYPE'',A.TNO) = ''ACTIVE'''))
,p_cSize=>100
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
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
 p_id=>wwv_flow_imp.id(937242449532390841)
,p_name=>'P108_EQUIPMENTMAINTENANCEORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(676919799007061684)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'EQUIPMENTMAINTENANCEORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937220735007390830)
,p_name=>'P108_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1082071562915726329)
,p_name=>'P108_FORMSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1054243385060752704)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'begin',
'If :P108_TNO is null then',
'    return(''NEWRECORD'');',
'else',
'    return(''EDITRECORD'');',
'End if;',
'end ;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937236077656390838)
,p_name=>'P108_INDENTDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(676919799007061684)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Indent Date'
,p_format_mask=>'DD-MM-RRRR'
,p_source=>'INDENTDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>100
,p_cMaxlength=>255
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P108_ALLOWEDFORWARD',
  'min_date', 'ITEM',
  'min_item', 'P108_ALLOWEDBACK',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937234425578390837)
,p_name=>'P108_INDENTNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(676919799007061684)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_prompt=>'Indent No'
,p_source=>'INDENTNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
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
 p_id=>wwv_flow_imp.id(937229093933390834)
,p_name=>'P108_ISAUTOINDENT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'ISAUTOINDENT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937223926843390833)
,p_name=>'P108_ISCOMBINEDINDENT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'ISCOMBINEDINDENT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937228658664390834)
,p_name=>'P108_ITEMNATURECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'ITEMNATURECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937236893831390839)
,p_name=>'P108_JOBORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(676919799007061684)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'JOBORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937233612860390836)
,p_name=>'P108_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(676919799007061684)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
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
'	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
'	and c.CompanyCode = :global_CompanyCode',
'    and d.EntryPageNo = :APP_PAGE_ID',
'    --AND getdocumentstatuscode(''LOCATION'',A.TNO) = ''ACTIVE'''))
,p_cSize=>100
,p_cMaxlength=>30
,p_tag_css_classes=>'Mandatory'
,p_grid_label_column_span=>1
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
 p_id=>wwv_flow_imp.id(937225069072390833)
,p_name=>'P108_MAINTENANCEPLANTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'MAINTENANCEPLANTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937227502566390834)
,p_name=>'P108_MAJORTASKSNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'MAJORTASKSNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1082067845598726292)
,p_name=>'P108_MODULEFLOW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1054243385060752704)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1081476066494455026)
,p_name=>'P108_ONTHETABLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1054243385060752704)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1056124584359101490)
,p_name=>'P108_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1054243385060752704)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937238837727390840)
,p_name=>'P108_PROJECTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(676919799007061684)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'PROJECTTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937230720144390836)
,p_name=>'P108_REFINDENTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'REFINDENTTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937235656765390838)
,p_name=>'P108_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(676919799007061684)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_prompt=>'Remark'
,p_placeholder=>'Remark'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:9997:&APP_SESSION.:::9997:P9997_TEXT:&P108_REMARK."><span class="fa fa-search"></span></a>',
''))
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>87
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
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
 p_id=>wwv_flow_imp.id(937229466624390835)
,p_name=>'P108_REQUISITIONTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'REQUISITIONTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937239216806390840)
,p_name=>'P108_RETENTIONMONEY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(676919799007061684)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'RETENTIONMONEY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(836628106253589855)
,p_name=>'P108_SNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(835770718886646782)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(835826979707646873)
,p_name=>'P108_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1056124420714101489)
,p_name=>'P108_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1054243385060752704)
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
 p_id=>wwv_flow_imp.id(937228306129390834)
,p_name=>'P108_TASKNATURECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'TASKNATURECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937224721955390833)
,p_name=>'P108_TASKSNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'TASKSNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937219859069390827)
,p_name=>'P108_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937231037384390837)
,p_name=>'P108_VNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'VNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937227881109390834)
,p_name=>'P108_WBDSCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'WBDSCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(937235248232390837)
,p_name=>'P108_WORKORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(676919799007061684)
,p_item_source_plug_id=>wwv_flow_imp.id(937163079457390733)
,p_source=>'WORKORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38689496568424874)
,p_name=>'check Indent and sanction qty'
,p_static_id=>'check-indent-and-sanction-qty'
,p_event_sequence=>440
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38689969188424874)
,p_event_id=>wwv_flow_imp.id(38689496568424874)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// Get the sanctioned quantity and indent quantity values for the current row',
    'var sanctionedQty = apex.region("Detail").widget().interactiveGrid("getSelectedRecords")[0][''INDENTQUANTITY1''];',
    'var indentQty = apex.region("Detail").widget().interactiveGrid("getSelectedRecords")[0][''QUANTITY1''];',
    '',
    '// Check if the sanctioned quantity is greater than the indent quantity',
    'if(parseFloat(sanctionedQty) > parseFloat(indentQty)) {',
    '    // Display an alert message',
    '    alert("Sanctioned quantity cannot be greater than indent quantity.");',
    '',
    '    // Set focus back to the sanctioned quantity field',
    '    apex.region("Detail").widget().interactiveGrid("getActions").focus(''QUANTITY1'');',
    '}',
    '')))).to_clob
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'window.hsplPhase1WasEdited(this)'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38680758867424871)
,p_name=>'checkDuplicate'
,p_static_id=>'checkduplicate'
,p_event_sequence=>360
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38681233843424871)
,p_event_id=>wwv_flow_imp.id(38680758867424871)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var $te = $(this.triggeringElement);',
    '',
    'var cur_rowId = $te.closest(''tr'').data(''id'');',
    '',
    'var cur_item_num = apex.item( ''ITEMSPECIFICATIONCODE'' ).getValue().toUpperCase();',
    '',
    'var widget = apex.region(''Detail'').widget();',
    '',
    'var grid = widget.interactiveGrid(''getViews'', ''grid'');',
    '',
    'var model = grid.model;',
    '',
    'apex.message.clearErrors();',
    '',
    'model.forEach(function(record) {',
    '',
    'if (cur_rowId != model.getValue(record, ''ITEMSPECIFICATIONCODE'')) {',
    '',
    'if (cur_item_num == model.getValue(record, ''ITEMSPECIFICATIONCODE'').toUpperCase()) {',
    '',
    'apex.item( ''ITEMSPECIFICATIONCODE'' ).setValue( '''' );',
    '',
    'apex.message.showErrors([{',
    '',
    'type: ''error'',',
    '',
    'location: ''page'',',
    '',
    'message: Item Specification already exists. Please select other specification or use this Item Number -''+model.getValue(record, ''ITEMSPECIFICATIONCODE''),',
    '',
    'unsafe: false',
    '',
    '}]);',
    '',
    '}}})')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38681774523424871)
,p_event_id=>wwv_flow_imp.id(38680758867424871)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'varmodel = apex.region("Detail").widget().interactiveGrid("getViews","grid").model;',
    'var v_spname, v_spcode;',
    'var val = $v("ITEMSPECIFICATIONCODE");',
    'var num = [];',
    'v_spcode = MODEL.GETfIELDKEY("ITEMSPECIVICATIONCODE");',
    'model.forEach(function(igrow) {',
    '    num.unshift(igrow[v_spcode]);',
    '    console.log(num);',
    '    console.log(num.indexof(val));',
    '    if(num.indexof(val) >-1){',
    '        letresponse = prompt("Duplicate","");',
    '        if (response == null||response==""){',
    '            $("#ITEMSPECIFICATIONCODE").val(''test'')',
    '        }else{',
    '            $(#ITEMSPECIFICATIONCODE").val(response);',
    '        }',
    '            ',
    '        }',
    '    });',
    '',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38665692831424867)
,p_name=>'DISABLE DELETE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-delete-button-for-updateprivillege'
,p_event_sequence=>220
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38666135914424867)
,p_event_id=>wwv_flow_imp.id(38665692831424867)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(38587575437424819)
,p_server_condition_type=>'FUNCTION_BODY'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  tmp number;',
'begin',
'     for vloop in (',
'        ',
'        Select 1',
'          From MODULEPRIVILEGE A',
'         Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'           And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'           And a.companycode = :GLOBAL_COMPANYCODE',
'           AND A.DELETEPRIVILEGE = ''NO''',
'     ) loop',
'           tmp := 1;',
'           exit;',
'     end loop;',
'',
'     select count(*) into tmp from purchaseorder a where a.indenttno = :P108_TNO ;',
'     if nvl(tmp,0) = 0 then',
'        return false;',
'     else',
'        return true;',
'     end if;',
'end;'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38667146073424868)
,p_event_id=>wwv_flow_imp.id(38665692831424867)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(38587575437424819)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from purchaseorder',
'where indenttno = :P108_TNO;'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38667710636424868)
,p_event_id=>wwv_flow_imp.id(38665692831424867)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(38587953494424820)
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38666704489424868)
,p_event_id=>wwv_flow_imp.id(38665692831424867)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(38587575437424819)
,p_server_condition_type=>'FUNCTION_BODY'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  tmp number;',
'  tmp1 number;',
'begin',
'     for vloop in (',
'               Select 1',
'          From MODULEPRIVILEGE A',
'         Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'           And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'           And a.companycode = :GLOBAL_COMPANYCODE',
'           AND A.DELETEPRIVILEGE = ''YES''',
'     ) loop',
'           tmp1 := 1;',
'           exit;',
'     end loop;',
'',
'     select count(*) into tmp from purchaseorder a where a.indenttno = :P108_TNO ;',
'     if nvl(tmp,0) > 0 then',
'        return false;',
'     else',
'        if nvl(tmp1,0) > 0 then',
'           return true;',
'        else ',
'            return false;',
'        end if;',
'     end if;',
'end;'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38669510931424868)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>240
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38670462456424869)
,p_event_id=>wwv_flow_imp.id(38669510931424868)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(38586815241424819)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.PRINTPRIVILEGE= ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38669935242424868)
,p_event_id=>wwv_flow_imp.id(38669510931424868)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(38586815241424819)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.PRINTPRIVILEGE= ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38663727505424866)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>210
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38664286007424867)
,p_event_id=>wwv_flow_imp.id(38663727505424866)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(38587953494424820)
,p_server_condition_type=>'FUNCTION_BODY'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  tmp number;',
'begin',
'     for vloop in (',
'        SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C',
'        WHERE A.TNO = B.TNO',
'        AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'        AND B.BOSSUSERCODE = C.BOSSUSERCODE',
'        AND C.BOSSUSERNAME = :APP_USER',
'        AND B.UPDATEPRIVILEGE = ''NO''',
'        UNION ALL',
'        Select 1',
'          From MODULEPRIVILEGE A',
'         Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'           And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'           And a.companycode = :GLOBAL_COMPANYCODE',
'           AND A.UPDATEPRIVILEGE = ''NO''',
'     ) loop',
'           tmp := 1;',
'           exit;',
'     end loop;',
'',
'     select count(*) into tmp from purchaseorder a where a.indenttno = :P108_TNO ;',
'     if nvl(tmp,0) = 0 then',
'        return false;',
'     else',
'        return true;',
'     end if;',
'end;'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38665249849424867)
,p_event_id=>wwv_flow_imp.id(38663727505424866)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(38587953494424820)
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38664751477424867)
,p_event_id=>wwv_flow_imp.id(38663727505424866)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(38587953494424820)
,p_server_condition_type=>'FUNCTION_BODY'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  tmp number;',
'  tmp1 number;',
'begin',
'     for vloop in (',
'        SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C',
'        WHERE A.TNO = B.TNO',
'        AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'        AND B.BOSSUSERCODE = C.BOSSUSERCODE',
'        AND C.BOSSUSERNAME = :APP_USER',
'        AND B.UPDATEPRIVILEGE = ''YES''',
'        UNION ALL',
'        Select 1',
'          From MODULEPRIVILEGE A',
'         Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'           And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'           And a.companycode = :GLOBAL_COMPANYCODE',
'           AND A.UPDATEPRIVILEGE = ''YES''',
'     ) loop',
'           tmp1 := 1;',
'           exit;',
'     end loop;',
'',
'     select count(*) into tmp from purchaseorder a where a.indenttno = :P108_TNO ;',
'     if nvl(tmp,0) > 0 then',
'        return false;',
'     else',
'        if nvl(tmp1,0) > 0 then',
'           return true;',
'        else ',
'            return false;',
'        end if;',
'     end if;',
'end;'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38668107134424868)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>230
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38669049404424868)
,p_event_id=>wwv_flow_imp.id(38668107134424868)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(38586334060424819)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.STATUSPRIVILEGE = ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38668565869424868)
,p_event_id=>wwv_flow_imp.id(38668107134424868)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(38586334060424819)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.STATUSPRIVILEGE = ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38657050115424865)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38586334060424819)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38660604392424866)
,p_event_id=>wwv_flow_imp.id(38657050115424865)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(38586334060424819)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P108_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38660032016424865)
,p_event_id=>wwv_flow_imp.id(38657050115424865)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(38586334060424819)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38658031394424865)
,p_event_id=>wwv_flow_imp.id(38657050115424865)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P108_TNO,P108_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--SetDocumentStatusCode(''PURCHASEORDER'',13604,:P108_STATUS);',
    'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P108_TNO,:P108_STATUS);',
    'UPDATE INDENTDETAIL A SET A.DOCUMENTSTATUSCODE = :P108_STATUS',
    'WHERE A.TNO = :P108_TNO;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38658612651424865)
,p_event_id=>wwv_flow_imp.id(38657050115424865)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text($v(''P108_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38659112058424865)
,p_event_id=>wwv_flow_imp.id(38657050115424865)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38659588509424865)
,p_event_id=>wwv_flow_imp.id(38657050115424865)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38657610408424865)
,p_event_id=>wwv_flow_imp.id(38657050115424865)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P108_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38661877320424866)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>190
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38662342552424866)
,p_event_id=>wwv_flow_imp.id(38661877320424866)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(38585148946424818)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P108_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38662878216424866)
,p_event_id=>wwv_flow_imp.id(38661877320424866)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(38585601967424819)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P108_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38663364394424866)
,p_event_id=>wwv_flow_imp.id(38661877320424866)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(38585938188424819)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P108_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38648793121424862)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38585601967424819)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38649798598424862)
,p_event_id=>wwv_flow_imp.id(38648793121424862)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P108_TNO,P108_COMPANYCODE,P108_PURCHASEORDERNO,P108_PASSFAILREMARK',
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
    '						--and a.ModuleTNo = '':P''||to_char(:APP_PAGE_ID)||''_TNo''',
    '                        AND A.ModuleTno = :P108_TNO',
    '						--and d.LoginName = User',
    '						AND d.BossuserName = :APP_USER',
    '                        and a.isPass is null',
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
    '						a.remark = :P108_PASSFAILREMARK',
    '				where a.TNo = vPassFail.TNo;',
    '				COMMIT;',
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
 p_id=>wwv_flow_imp.id(38650804609424863)
,p_event_id=>wwv_flow_imp.id(38648793121424862)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38651277055424863)
,p_event_id=>wwv_flow_imp.id(38648793121424862)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(686864236994684886)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38649306989424862)
,p_event_id=>wwv_flow_imp.id(38648793121424862)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P108_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38650299074424863)
,p_event_id=>wwv_flow_imp.id(38648793121424862)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'UPDATE DOCUMENTSTATUS OF DETAIL'
,p_static_id=>'update-documentstatus-of-detail'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P108_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'update indentdetail a set documentstatuscode = getdocumentstatuscode(''INDENT'',:P108_TNO)',
    'WHERE TNO = :P108_TNO',
    ';')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38671802386424869)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>260
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38586815241424819)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38672257128424869)
,p_event_id=>wwv_flow_imp.id(38671802386424869)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38690394894424874)
,p_name=>'Go to Department '
,p_static_id=>'go-to-department'
,p_event_sequence=>450
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P108_INDENTDATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38690820358424874)
,p_event_id=>wwv_flow_imp.id(38690394894424874)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P108_DEPARTMENTCODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38687691753424873)
,p_name=>'Go to Next Tab'
,p_static_id=>'go-to-next-tab'
,p_event_sequence=>420
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P108_REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38688145110424873)
,p_event_id=>wwv_flow_imp.id(38687691753424873)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("TABS").widget().aTabs("getTabs")["#SR_General"].moveNext();',
    '// TABS IS THE STATIC ID OF TAB CONTAINER',
    '// #SR_PRODUCTION  PRODUCTION IS STATIC ID OF CURRENT TAB REGION',
    '',
    '//apex.region("InputDetail").widget().interactiveGrid("getActions").invoke("selection-add-row"); ',
    '',
    'apex.region("Detail").widget().interactiveGrid("getActions").set("edit",true);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38699853061424876)
,p_name=>'go to next tab'
,p_static_id=>'go-to-next-tab-2'
,p_event_sequence=>540
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'HSNCODE'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'ITEMSPECIFICATIONCODE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38700369567424876)
,p_event_id=>wwv_flow_imp.id(38699853061424876)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("TABS").widget().aTabs("getTabs")["#SR_Detail"].moveNext();',
    '',
    'apex.item(''ADDNEW_1'').setFocus();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38682205744424872)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>370
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38682621983424872)
,p_event_id=>wwv_flow_imp.id(38682205744424872)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38652565188424863)
,p_name=>'Initialize SNO Sequence'
,p_static_id=>'initialize-sno-sequence'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38653091283424864)
,p_event_id=>wwv_flow_imp.id(38652565188424863)
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
    'else null ; --MYSNO := :SNO;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38656165342424864)
,p_name=>'Initialize SNO Sequence1'
,p_static_id=>'initialize-sno-sequence-2'
,p_event_sequence=>140
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(837024601150099904)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38656704500424865)
,p_event_id=>wwv_flow_imp.id(38656165342424864)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
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
 p_id=>wwv_flow_imp.id(38693085868424875)
,p_name=>'move tab'
,p_static_id=>'move-tab'
,p_event_sequence=>470
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'REQUIREMENTTIMEINDAYS'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'ITEMCODE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38693607598424875)
,p_event_id=>wwv_flow_imp.id(38693085868424875)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("TABS").widget().aTabs("getTabs")["#SR_Detail"].moveNext();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38672655028424869)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>270
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38607438429424834)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38673155928424869)
,p_event_id=>wwv_flow_imp.id(38672655028424869)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(835770718886646782)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38673532638424869)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>280
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38607829143424834)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38674098913424869)
,p_event_id=>wwv_flow_imp.id(38673532638424869)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(835770718886646782)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38683090190424872)
,p_name=>'New_4'
,p_static_id=>'new-3'
,p_event_sequence=>380
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38587158811424819)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38684106480424872)
,p_event_id=>wwv_flow_imp.id(38683090190424872)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'check detail'
,p_static_id=>'check-detail'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P108_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P108_TNO);',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38684598630424872)
,p_event_id=>wwv_flow_imp.id(38683090190424872)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P108_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P108_CALLEDFROMTNO'').getValue();',
    '',
    '//var url = "f?p=#APP_ID#:80:#SESSION#::NO:RP,80:P108_TNO,P108_CALLEDFROMPAGE,P108_FORMSTATUS:#P108_TNO#,#P108_CALLEDFROMPAGE#,#P108_FORMSTATUS#";',
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
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38683559494424872)
,p_event_id=>wwv_flow_imp.id(38683090190424872)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P108_CALLEDFROMTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P108_MODULETNO',
  'plsql_expression', ':P108_MODULETNO',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'ITEM_IS_NULL'
,p_server_condition_expr1=>'P108_CALLEDFROMTNO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38691257217424874)
,p_name=>'New_2'
,p_static_id=>'new-4'
,p_event_sequence=>460
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'RATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38691731571424874)
,p_event_id=>wwv_flow_imp.id(38691257217424874)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// Get the model for the interactive grid',
    'var model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model;',
    '',
    '// Get the column indexes for rate and quantity columns',
    'var rateColumn = model.getFieldKey("RATE");',
    'var quantityColumn = model.getFieldKey("INDENTQUANTITY1");',
    'var amountColumn = model.getFieldKey("AMOUNT");',
    '',
    '// Loop through all the records',
    'model.forEach(function(igRow) {',
    '    // Get the values of rate and quantity for the current row',
    '    var rate = igRow.getValue(rateColumn);',
    '    var quantity = igRow.getValue(quantityColumn);',
    '',
    '    // Calculate the amount for the current row',
    '    var amount = rate * quantity;',
    '',
    '    // Set the calculated amount in the amount column',
    '    igRow.set(amountColumn, amount);',
    '});',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38692192331424874)
,p_name=>'number check'
,p_static_id=>'number-check'
,p_event_sequence=>465
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'REQUIREMENTTIMEINDAYS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38692629898424874)
,p_event_id=>wwv_flow_imp.id(38692192331424874)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'REQUIREMENTTIMEINDAYS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '  if not regexp_like(:REQUIREMENTTIMEINDAYS, ''^\d+$'')',
    '  then',
    '    raise_application_error(-20000, ''Digits only'');',
    '  end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38645904778424860)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38585148946424818)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38646838465424862)
,p_event_id=>wwv_flow_imp.id(38645904778424860)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P108_TNO,P108_COMPANYCODE,P108_PURCHASEORDERNO,P108_PASSFAILREMARK',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  tModuleCode  Varchar2(30);',
    '  TMP          vARCHAR2(100) := :P108_PURCHASEORDERNO;',
    'cursor cPassFail is',
    '		select',
    '				a.TNo',
    '		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '		where a.ModuleFlowTNo = b.TNo',
    '				and b.TNo = c.TNo',
    '				and a.BossUserCode = c.BossUserCode',
    '				and c.BossUserCode = d.BossUserCode',
    '				and a.ModuleTNo = :P108_TNO --'':P''||:APP_PAGE_ID||''_TNo''',
    '				--and d.LoginName = User',
    '                AND D.BOSSUSERNAME = :APP_USER',
    '				and a.isPass is null',
    '				and a.IsFail is null',
    '				and a.IsForwarded is null',
    '				and a.IsRebounded is null										',
    ';',
    'vPassFail cPassFail%rowtype;',
    'BEGIN',
    '',
    '    /*select',
    '    	d.ModuleCode, '':P''||:APP_PAGE_ID||''_''||labelcolumnname ',
    '                into tModuleCode,tmp',
    '    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
    '    where a.LocationCode = b.LocationCode',
    '    	and b.tno = c.tno',
    '    	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
    '    	and c.CompanyCode = :global_CompanyCode',
    '        and d.EntryPageNo = :APP_PAGE_ID',
    '        ;',
    '    */',
    '			',
    '	open cPassFail;',
    '	fetch cPassFail into vPassFail;',
    '	if cPassFail%FOUND then',
    '			',
    '		',
    '			update PassFail a',
    '			set a.IsPass = ''YES'',',
    '				a.remark = :P108_PASSFAILREMARK',
    '			where a.TNo = vPassFail.TNo;',
    '			COMMIT;',
    '			close cPassFail;',
    '			',
    '			',
    '			SendPassFailForward(getModuleCodeForPageNo(:APP_PAGE_ID), :P108_TNO , TMP, :global_CompanyCode );',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38647909170424862)
,p_event_id=>wwv_flow_imp.id(38645904778424860)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38648320464424862)
,p_event_id=>wwv_flow_imp.id(38645904778424860)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(686864236994684886)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38646327836424861)
,p_event_id=>wwv_flow_imp.id(38645904778424860)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P108_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38647325295424862)
,p_event_id=>wwv_flow_imp.id(38645904778424860)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'update documentstatus of detail'
,p_static_id=>'update-documentstatus-of-detail'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P108_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'update indentdetail a set documentstatuscode = getdocumentstatuscode(''INDENT'',:P108_TNO)',
    'WHERE TNO = :P108_TNO',
    ';')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38660972348424866)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38586334060424819)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38661510650424866)
,p_event_id=>wwv_flow_imp.id(38660972348424866)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(686864236994684886)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38670868376424869)
,p_name=>'REFRESH'
,p_static_id=>'refresh-2'
,p_event_sequence=>250
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38638257909424854)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38671413895424869)
,p_event_id=>wwv_flow_imp.id(38670868376424869)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1126326824023815957)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38654365607424864)
,p_name=>'Set Amount'
,p_static_id=>'set-amount'
,p_event_sequence=>110
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'INDENTQUANTITY1,RATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38654885063424864)
,p_event_id=>wwv_flow_imp.id(38654365607424864)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '(function(ctx){var el=ctx.triggeringElement,be=ctx.browserEvent||{},target=be.target||{},old=[];try{old=JSON.parse(document.body.getAttribute(''data-hspl-amount-debug'')||''[]'');}catch(e){}old.push({eventType:be.type,which:be.which,elementId:el&&el.id,e'
||'lementValue:el&&el.value,targetId:target.id,targetValue:target.value,originalTargetId:be.originalEvent&&be.originalEvent.target&&be.originalEvent.target.id,originalTargetValue:be.originalEvent&&be.originalEvent.target&&be.originalEvent.target.value})'
||';document.body.setAttribute(''data-hspl-amount-debug'',JSON.stringify(old));})(this);')).to_clob
,p_wait_for_result=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38693986569424875)
,p_name=>'set decimal for ind_qty1'
,p_static_id=>'set-decimal-for-ind-qty'
,p_event_sequence=>480
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'INDENTQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38694503624424875)
,p_event_id=>wwv_flow_imp.id(38693986569424875)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INDENTQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'INDENTQUANTITY1,ITEMCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    '   select',
    '    round(:INDENTQUANTITY1 ,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ',
    'from dual ;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'window.hsplPhase1WasEdited(this)'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38694859920424875)
,p_name=>'set decimal for ind_qty1_1'
,p_static_id=>'set-decimal-for-ind-qty-2'
,p_event_sequence=>490
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'INDENTQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38695403156424875)
,p_event_id=>wwv_flow_imp.id(38694859920424875)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INDENTQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'INDENTQUANTITY1,ITEMCODE',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    v_number NUMBER := 123.4;',
    '    v_decimal_places NUMBER := 3; -- Define the number of decimal places here',
    '    v_formatted_number VARCHAR2(20);',
    'BEGIN',
    '   select',
    '    round(:INDENTQUANTITY1 ,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ',
    '    into v_number',
    'from dual ;',
    '',
    '   select getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) into v_decimal_places from dual;',
    '    -- Format the number with trailing zeros after decimal based on v_decimal_places',
    '    v_formatted_number := TO_CHAR(v_number, ''999999.'' || RPAD(''9'', v_decimal_places, ''0''));',
    '    ',
    '--raise_application_error(-20001,v_formatted_number);',
    '    return (v_formatted_number);',
    'END;',
    '')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38697214257424876)
,p_name=>'set decimal for ind_qty2'
,p_static_id=>'set-decimal-for-ind-qty-3'
,p_event_sequence=>510
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'INDENTQUANTITY2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38697635604424876)
,p_event_id=>wwv_flow_imp.id(38697214257424876)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INDENTQUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'INDENTQUANTITY2,ITEMCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    'round(:INDENTQUANTITY2,getuomdecimal(GetMeasuringUnit2CodeFromItem(:ITEMCODE)) )',
    'from dual')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'window.hsplPhase1WasEdited(this)'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38695799794424875)
,p_name=>'set decimal for qty1'
,p_static_id=>'set-decimal-for-qty'
,p_event_sequence=>500
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38696237413424875)
,p_event_id=>wwv_flow_imp.id(38695799794424875)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'INDENTQUANTITY1,QUANTITY1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if to_number(:QUANTITY1) > to_number(:INDENTQUANTITY1) then ',
    '    raise_application_error(-20000,''Saction Qty Cannot be greater then Indent Qty. Indent: ''',
    '    ||:INDENTQUANTITY1||'' Sanctioned:''||:QUANTITY1||''.'');',
    '',
    'end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'window.hsplPhase1WasEdited(this)'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38696787679424876)
,p_event_id=>wwv_flow_imp.id(38695799794424875)
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
    'round(:QUANTITY1 ,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) )',
    'from dual')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'window.hsplPhase1WasEdited(this)'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38698059739424876)
,p_name=>'set decimal for qty2'
,p_static_id=>'set-decimal-for-qty-2'
,p_event_sequence=>520
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'QUANTITY2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38698594956424876)
,p_event_id=>wwv_flow_imp.id(38698059739424876)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INDENTQUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY2,ITEMCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    'round(:QUANTITY2,getuomdecimal(GetMeasuringUnit2CodeFromItem(:ITEMCODE)) )',
    'from dual')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'window.hsplPhase1WasEdited(this)'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38678094661424870)
,p_name=>'Set HSN'
,p_static_id=>'set-hsn'
,p_event_sequence=>330
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38678542587424871)
,p_event_id=>wwv_flow_imp.id(38678094661424870)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'HSNCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select hsncode from itemspecification',
    'where itemspecificationcode = :ITEMSPECIFICATIONCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38653425711424864)
,p_name=>'Set page item sno'
,p_static_id=>'set-page-item-sno'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38653993126424864)
,p_event_id=>wwv_flow_imp.id(38653425711424864)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var pSno,',
    'model = this.data.model;',
    '',
    'pSNO = model.getValue( this.data.selectedRecords[0], "SNO");',
    '',
    'apex.item( "P108_SNO" ).setValue (pSNO);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38655220772424864)
,p_name=>'Set Primary Stock Qty'
,p_static_id=>'set-primary-stock-qty'
,p_event_sequence=>120
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38655774321424864)
,p_event_id=>wwv_flow_imp.id(38655220772424864)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QOH1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P108_LOCATIONCODE,ITEMCODE,ITEMSPECIFICATIONCODE,P108_INDENTDATE',
  'plsql_expression', 'GetGLItemOpeningQuantity1(:P108_LOCATIONCODE, :ITEMCODE, :ITEMSPECIFICATIONCODE , :global_companycode, to_date(:P108_INDENTDATE,''DD-MM-RRRR'')+1 ) ',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38674434078424870)
,p_name=>'Set Quantity2'
,p_static_id=>'set-quantity'
,p_event_sequence=>290
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'INDENTQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38674977479424870)
,p_event_id=>wwv_flow_imp.id(38674434078424870)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INDENTQUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'INDENTQUANTITY1,ITEMSPECIFICATIONCODE',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '    return :INDENTQUANTITY1*mfactor;',
    '    exception when others then',
    '        null;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'window.hsplPhase1WasEdited(this)'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38675385466424870)
,p_name=>'Set Quantity2_1'
,p_static_id=>'set-quantity-2'
,p_event_sequence=>300
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38675816645424870)
,p_event_id=>wwv_flow_imp.id(38675385466424870)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,ITEMSPECIFICATIONCODE',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    for vloop in (',
    '    select MULTIPLYINGFACTOR  from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE',
    '    ) loop',
    '        mfactor := vloop.MULTIPLYINGFACTOR;',
    '    end loop;',
    '    return :QUANTITY1*mfactor;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'window.hsplPhase1WasEdited(this)'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38676216658424870)
,p_name=>'Set Quantity2_1_2'
,p_static_id=>'set-quantity-3'
,p_event_sequence=>310
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'QOH1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38676751442424870)
,p_event_id=>wwv_flow_imp.id(38676216658424870)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QOH2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE,QOH1',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    for vloop in (',
    '    select MULTIPLYINGFACTOR  from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE',
    '    ) loop',
    '        mfactor := vloop.MULTIPLYINGFACTOR;',
    '    end loop;',
    '    return :QOH1*mfactor;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'window.hsplPhase1WasEdited(this)'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38677161981424870)
,p_name=>'Set Quantity2_1_1'
,p_static_id=>'set-quantity-4'
,p_event_sequence=>320
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'QUANTITY2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38677667579424870)
,p_event_id=>wwv_flow_imp.id(38677161981424870)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY2,ITEMSPECIFICATIONCODE',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '    return :QUANTITY2/mfactor;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_expression=>'window.hsplPhase1WasEdited(this) && window.hsplPhase1FocusNumber(this) > 0'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38685015215424872)
,p_name=>'Set Quantity1'
,p_static_id=>'set-quantity-5'
,p_event_sequence=>390
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'INDENTQUANTITY2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38685440064424873)
,p_event_id=>wwv_flow_imp.id(38685015215424872)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INDENTQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'INDENTQUANTITY2,ITEMSPECIFICATIONCODE,UNIT2,ITEMCODE,INDENTQUANTITY1',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '  nvl(NVL(:INDENTQUANTITY2,0) / NVL(A.MULTIPLYINGFACTOR,0) , :INDENTQUANTITY1)',
    'from itemspecification a',
    'where a.itemspecificationcode = :ITEMSPECIFICATIONCODE',
    '  and NVL(:INDENTQUANTITY2 ,0) > 0',
    '  and GetMeasuringUnit2NameFromItem(:ITEMCODE) IS NOT NULL ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_expression=>'window.hsplPhase1WasEdited(this) && window.hsplPhase1FocusNumber(this) > 0'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38688539530424873)
,p_name=>'set rate'
,p_static_id=>'set-rate'
,p_event_sequence=>430
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38689083660424873)
,p_event_id=>wwv_flow_imp.id(38688539530424873)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'TNO,ITEMCODE,ITEMSPECIFICATIONCODE,P108_INDENTDATE',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    'rtvalue number;',
    'begin',
    '    for vRate',
    '    		in (			',
    '    				Select',
    '    					a.TNo,',
    '    					a.StockDate,',
    '    					c.PartyName,',
    '    					a.Rate',
    '    				from Stock a, GRN b, Party c',
    '    			where a.grntno = b.tno',
    '    				and b.PartyCode = c.PartyCode',
    '    				and a.itemcode = :itemcode',
    '    				and a.itemspecificationcode = :itemspecificationcode',
    '    				and a.StockDate <= :P108_Indentdate',
    '    				and a.IndentTNo != :TNo									  	    ',
    '    				and nvl(a.StockQuantity1, 0) > 0 ',
    '    			Order by a.StockDate desc, a.TNo desc',
    '    		 )',
    '    loop',
    '    		',
    '    		rtvalue := vRate.Rate;',
    '    		exit;',
    '    end loop;		  							',
    '    return rtvalue;',
    'end ;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38698947206424876)
,p_name=>'set readonly secondary'
,p_static_id=>'set-readonly-secondary'
,p_event_sequence=>530
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'UNIT1'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'UNIT2'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38699471035424876)
,p_event_id=>wwv_flow_imp.id(38698947206424876)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("#INDENTQUANTITY2").attr(''readonly'',''readonly'');',
    '$("#QUANTITY2").attr(''readonly'',''readonly'');',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38685850495424873)
,p_name=>'Set Sanctioned'
,p_static_id=>'set-sanctioned'
,p_event_sequence=>400
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'INDENTQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38686357986424873)
,p_event_id=>wwv_flow_imp.id(38685850495424873)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'INDENTQUANTITY1',
  'plsql_expression', ':INDENTQUANTITY1',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'window.hsplPhase1WasEdited(this)'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38686755567424873)
,p_name=>'Set Sanctioned2'
,p_static_id=>'set-sanctioned-2'
,p_event_sequence=>410
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'INDENTQUANTITY2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38687277287424873)
,p_event_id=>wwv_flow_imp.id(38686755567424873)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'INDENTQUANTITY2',
  'plsql_expression', ':INDENTQUANTITY2',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_expression=>'window.hsplPhase1WasEdited(this) && window.hsplPhase1IsBlank(window.hsplPhase1ContextValue(this,''QUANTITY2''))'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38679011173424871)
,p_name=>'Set Unit1'
,p_static_id=>'set-unit'
,p_event_sequence=>340
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'ITEMCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38679480869424871)
,p_event_id=>wwv_flow_imp.id(38679011173424871)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'UNIT1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE',
  'plsql_expression', 'GetMeasuringUnitNameFromItem(:ITEMCODE)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38679837553424871)
,p_name=>'Set Unit2'
,p_static_id=>'set-unit-2'
,p_event_sequence=>350
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'ITEMCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38680343900424871)
,p_event_id=>wwv_flow_imp.id(38679837553424871)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'UNIT2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE',
  'plsql_expression', 'GetMeasuringUnit2NameFromItem(:ITEMCODE)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38651627001424863)
,p_name=>'Set UOM'
,p_static_id=>'set-uom'
,p_event_sequence=>40
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(835770718886646782)
,p_triggering_element=>'ITEMCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38652120648424863)
,p_event_id=>wwv_flow_imp.id(38651627001424863)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'UOM'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select MEASURINGUNITNAME from MEASURINGUNIT where MEASURINGUNITCODE in (',
    '                                                        select MEASURINGUNITCODE1 from item',
    '                                                        where itemcode = :ITEMCODE  )')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38643041912424859)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Detail'
,p_static_id=>'delete-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from INDENTDETAIL where tno = :P108_TNO;',
'delete from INDENTDETAILQUALITY where tno = :P108_TNO;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38587575437424819)
,p_internal_uid=>6600525378015111
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38642650843424859)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete master if Detail is not saved'
,p_static_id=>'delete-master-if-detail-is-not-saved'
,p_process_sql_clob=>'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P108_TNO);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>6600134309015111
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38645102835424860)
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
'     if :P108_Tno is null then',
'        Select GlobalTno.NextVal into :P108_Tno From Dual;',
'     end if;',
'    ----',
'    if :P108_INDENTNO is null then',
'            SetDocNoNext(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P108_LocationCode,',
'                    :P108_DocTypeCode,',
'                    NULL,',
'                    TO_DATE(:P108_INDENTDATE, ''DD-MM-RRRR'')',
'                );',
'        :P108_INDENTNO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P108_LocationCode,',
'                    :P108_DocTypeCode,',
'                    NULL,',
'                    TO_DATE(:P108_INDENTDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>6602586301015112
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38643897086424860)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get TNo'
,p_static_id=>'get-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P108_TNO is null then',
'    :P108_TNO := GlobalTNo.nextval;',
'    :P108_FORMSTATUS := ''NEWRECORD'';',
'else',
'    :P108_FORMSTATUS := ''EDITRECORD'';',
'End if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>6601380552015112
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38644704103424860)
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
'       :P108_MODULEFLOW := ''YES'';',
'   else',
'       :P108_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P108_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P108_ONTHETABLE := ''YES'' ;',
'   else',
'       :P108_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>6602187569015112
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38614956027424839)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(837024601150099904)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'IndentDetailQuality - Save Interactive Grid Data'
,p_static_id=>'indentdetailquality-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>6572439493015091
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38627162454424844)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(937163079457390733)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Indent'
,p_static_id=>'initialize-form-indent'
,p_internal_uid=>6584645920015096
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38608712330424835)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(835770718886646782)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Item Detail - Save Interactive Grid Data'
,p_static_id=>'item-detail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'tsno number;',
'Begin',
'    if :ITEMCODE is not null then',
'            case :APEX$ROW_STATUS',
'                when ''C'' then',
'              ',
'                    select globaltno.nextval into tsno from dual;',
'               ',
'',
'                    Insert Into indentdetail (                 ',
'                            TNO,',
'                            ITEMCODE,',
'                            ITEMSPECIFICATIONCODE,',
'                            QUANTITY1,',
'                            QUANTITY2,',
'                            REQUIREMENTTIMEINDAYS,',
'                            STOCKINHAND,',
'                            REMARK,',
'                            DESCRIPTION,',
'                            SNO,',
'                            DOCUMENTSTATUSCODE,',
'                            SERIALNO,',
'                            ORDEREDQUANTITY1,',
'                            ORDEREDQUANTITY2,',
'                            QOH1,',
'                            QOH2,',
'                            JOBTYPECODE,',
'                            INDENTQUANTITY1,',
'                            INDENTQUANTITY2,',
'                            RATE,',
'                            AMOUNT,',
'                            BOMCODE,',
'                            ACCEPTANCEONCOMMISSIONING,',
'                            PHYSICALQUANTITY1,',
'                            PHYSICALQUANTITY2,',
'                            EQUIPMENTTNO,',
'                            PRIORITYCODE,',
'                            STATUSMODIFICATIONTIME,',
'                            STATUSMODIFICATIONBYUSER,',
'                            ENQUIRYTNO,',
'                            SN',
'',
'                    )',
'                    Values (',
'                        :TNO,',
'                        :ITEMCODE,',
'                        :ITEMSPECIFICATIONCODE,',
'                        :QUANTITY1,',
'                        :QUANTITY2,',
'                        :REQUIREMENTTIMEINDAYS,',
'                        :STOCKINHAND,',
'                        :REMARK,',
'                        :DESCRIPTION,',
'                        tSNO,',
'                        :DOCUMENTSTATUSCODE,',
'                        :SERIALNO,',
'                        :ORDEREDQUANTITY1,',
'                        :ORDEREDQUANTITY2,',
'                        :QOH1,',
'                        :QOH2,',
'                        :JOBTYPECODE,',
'                        :INDENTQUANTITY1,',
'                        :INDENTQUANTITY2,',
'                        :RATE,',
'                        nvl(:INDENTQUANTITY1,0) * nvl(:RATE,0),',
'                        :BOMCODE,',
'                        :ACCEPTANCEONCOMMISSIONING,',
'                        :PHYSICALQUANTITY1,',
'                        :PHYSICALQUANTITY2,',
'                        :EQUIPMENTTNO,',
'                        :PRIORITYCODE,',
'                        :STATUSMODIFICATIONTIME,',
'                        :STATUSMODIFICATIONBYUSER,',
'                        :ENQUIRYTNO,',
'                        :SN',
'',
'                    );',
'                ',
'                when ''U'' then',
'                    update indentdetail Set',
'                          TNO=:TNO,',
'                            ITEMCODE=:ITEMCODE,',
'                            ITEMSPECIFICATIONCODE=:ITEMSPECIFICATIONCODE,',
'                            QUANTITY1=:QUANTITY1,',
'                            QUANTITY2=:QUANTITY2,',
'                            REQUIREMENTTIMEINDAYS=:REQUIREMENTTIMEINDAYS,',
'                            STOCKINHAND=:STOCKINHAND,',
'                            REMARK=:REMARK,',
'                            DESCRIPTION=:DESCRIPTION,',
'                            SNO=:SNO,',
'                            DOCUMENTSTATUSCODE=:DOCUMENTSTATUSCODE,',
'                            SERIALNO=:SERIALNO,',
'                            ORDEREDQUANTITY1=:ORDEREDQUANTITY1,',
'                            ORDEREDQUANTITY2=:ORDEREDQUANTITY2,',
'                            QOH1=:QOH1,',
'                            QOH2=:QOH2,',
'                            JOBTYPECODE=:JOBTYPECODE,',
'                            INDENTQUANTITY1=:INDENTQUANTITY1,',
'                            INDENTQUANTITY2=:INDENTQUANTITY2,',
'                            RATE=:RATE,',
'                            AMOUNT=nvl(:INDENTQUANTITY1,0) * nvl(:RATE,0),',
'                            BOMCODE=:BOMCODE,',
'                            ACCEPTANCEONCOMMISSIONING=:ACCEPTANCEONCOMMISSIONING,',
'                            PHYSICALQUANTITY1=:PHYSICALQUANTITY1,',
'                            PHYSICALQUANTITY2=:PHYSICALQUANTITY2,',
'                            EQUIPMENTTNO=:EQUIPMENTTNO,',
'                            PRIORITYCODE=:PRIORITYCODE,',
'                            STATUSMODIFICATIONTIME=:STATUSMODIFICATIONTIME,',
'                            STATUSMODIFICATIONBYUSER=:STATUSMODIFICATIONBYUSER,',
'                            ENQUIRYTNO=:ENQUIRYTNO,',
'                            SN=:SN',
'',
'                    WHERE TNO = :P108_TNO',
'                      and SNO = :SNO;',
'',
'                when ''D'' then',
'                    Delete From indentdetail',
'                    Where TNo = :P108_TNO',
'                      and SNO = :SNO',
'                      ;',
'            end case;',
'        end if;',
'        exception when others then',
'            raise_application_error(-20010, sqlerrm);',
'',
'End;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>6566195796015087
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38627606523424844)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(937163079457390733)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Indent'
,p_static_id=>'process-form-indent'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>6585089989015096
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38643447267424859)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P108_TNO, :P108_INDENTNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38588370194424820)
,p_internal_uid=>6600930733015111
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38642219899424859)
,p_process_sequence=>90
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Allowed Date'
,p_static_id=>'set-allowed-date'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   TSQL VARCHAR2(4000);',
'   TDATE VARCHAR2(100) ;',
'   date1 varchar2(30);',
'BEGIN',
'',
'if :P108_FORMSTATUS=''NEWRECORD'' then',
'        select',
'        		trunc(sysdate) - nvl(b.AllowedBackDays, 0) as AllowedBack,',
'        		trunc(sysdate) + nvl(b.AllowedForwardDays, 0) AllowedForward	',
'        		--a.FreezeDate',
'                INTO :P108_ALLOWEDBACK,:P108_ALLOWEDFORWARD',
'        from Module a, ModulePrivilege b, BossUser c',
'        where a.ModuleCode = GetModuleCodeForpageNo(:APP_PAGE_ID)',
'        		and a.ModuleCode = b.ModuleCode',
'        		and b.BossUsercode = c.BossUserCode',
'        		and c.LoginName = :GLOBAL_LOGINNAME',
'        		and b.CompanyCode = :GLOBAL_CompanyCode',
'        ',
'        ;',
'else',
'    :P108_ALLOWEDBACK       := :P108_INDENTDATE ; ',
'    :P108_ALLOWEDFORWARD    := :P108_INDENTDATE ;',
' end if;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>6599703365015111
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38644255950424860)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Allowed Date as per Module Privilege'
,p_static_id=>'set-allowed-date-as-per-module-privilege'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for vloop in (',
'Select a.AllowBackDateEntry,',
'       a.FreezeDate,',
'       ''P'' || a.EntryPageNo || ''_'' || a.Transactiondatecolumn As DateColumnName,',
'       to_char(Trunc(Sysdate) - nvl(to_number(b.allowedbackdays),0),''DD-MM-RRRR'') As MinAllowedDate,',
'       to_char(Trunc(Sysdate) + nvl(to_number(b.allowedforwarddays),0),''DD-MM-RRRR'') as MaxAllowedDate,',
'       ''P'' || a.EntryPageNo || ''_FROMDATE'' as pageitem,',
'       '':GLOBAL_FROMDATE'' as Globaldate',
'  From Module a, Moduleprivilege b',
' Where a.ModuleCode = b.ModuleCode',
'   And a.EntryPageNo = :APP_PAGE_ID',
'   And b.bossusercode = :GLOBAL_BOSSUSERCODE',
') loop',
'    :P0_FROMDATE := vloop.MinAllowedDate;',
'    :P0_TODATE   := vloop.MaxAllowedDate;',
' End loop;',
'   ',
''))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>6601739416015112
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38645417199424860)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validation'
,p_static_id=>'validation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tmp number;',
'begin',
'    IF :P108_FORMSTATUS IN (''NEWRECORD'',''EDITRECORD'') THEN',
'        select count(*) into tmp from indentdetail where tno = :P108_TNO',
'        group by itemcode , itemspecificationcode;',
'        ',
'        if nvl(tmp,0) >=2 then',
'        ',
'            raise_application_error(-20000 , ''CANNOT SAVE SAME ITEM SAME SPECIFICATION TWICE IN SAME INDENT.'');',
'',
'        end if;',
'    END IF;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>6602900665015112
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
