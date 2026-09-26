whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on pagesize 100 linesize 280
connect -name IMART

declare
  l_code clob;
  l_pos pls_integer;
  l_js clob := q'~
/* HSPL_INDENT_PENDING_EDIT_V8 */
(function () {
  "use strict";
  if (window.hsplIndentPendingEditV8) { return; }
  window.hsplIndentPendingEditV8 = true;
  var pending = null;

  function n(value) {
    if (value && typeof value === "object" && "v" in value) { value = value.v; }
    var parsed = Number(String(value == null ? 0 : value).replace(/,/g, ""));
    return Number.isFinite(parsed) ? parsed : 0;
  }

  function fieldName(element) {
    var id = element && element.id || "";
    if (id === "INDENTQUANTITY1") { return "INDENTQUANTITY1"; }
    if (id === "RATE" || id === "C835772576449646800") { return "RATE"; }
    var labelledBy = element && element.getAttribute("aria-labelledby") || "";
    if (labelledBy.indexOf("INDENTQUANTITY1") >= 0) { return "INDENTQUANTITY1"; }
    if (labelledBy.indexOf("C835772576449646800") >= 0) { return "RATE"; }
    return null;
  }

  function gridContext() {
    try {
      var region = apex.region("Detail");
      var grid = region.widget().interactiveGrid("getViews", "grid");
      return grid && grid.model ? { region: region, grid: grid, model: grid.model } : null;
    } catch (ignore) { return null; }
  }

  function capture(element, field) {
    var ctx = gridContext();
    if (!ctx) { return null; }
    var recordId = null;
    try {
      if (ctx.grid.view$ && typeof ctx.grid.view$.grid === "function") {
        recordId = ctx.grid.view$.grid("getActiveRecordId");
      }
    } catch (ignoreGrid) {}
    var record = recordId != null ? ctx.model.getRecord(recordId) : null;
    if (!record) {
      var selected = ctx.region.widget().interactiveGrid("getSelectedRecords");
      if (selected && selected.length === 1) { record = selected[0]; }
    }
    if (!record) { return null; }
    if (recordId == null && typeof ctx.model.getRecordId === "function") {
      recordId = ctx.model.getRecordId(record);
    }

    var qtySnapshot = n(ctx.model.getValue(record, "INDENTQUANTITY1"));
    if (recordId != null) {
      var row = document.querySelector('#Detail_ig_grid_vc tbody tr[data-id="' + String(recordId).replace(/"/g, '\\"') + '"]');
      var qtyCell = row && row.querySelectorAll("td")[6];
      if (qtyCell && String(qtyCell.textContent || "").trim() !== "") {
        qtySnapshot = n(qtyCell.textContent);
      }
    }
    return { element: element, field: field, raw: element.value, ctx: ctx,
             record: record, qtySnapshot: qtySnapshot };
  }

  function finish(element) {
    if (!pending || pending.element !== element) { return; }
    var job = pending;
    pending = null;
    if (String(job.raw) === String(element.dataset.hsplIndentEditStart || "")) { return; }
    setTimeout(function () {
      var current = gridContext();
      if (current && current.model === job.ctx.model) { job.ctx = current; }
      var model = job.ctx.model;
      model.setValue(job.record, job.field, job.raw);
      var qty = job.field === "INDENTQUANTITY1" ? n(job.raw) : job.qtySnapshot;
      var rate = job.field === "RATE" ? n(job.raw) : n(model.getValue(job.record, "RATE"));
      var amount = qty * rate;
      if (Math.abs(n(model.getValue(job.record, "AMOUNT")) - amount) > 0.0000001) {
        model.setValue(job.record, "AMOUNT", amount);
      }
    }, 0);
  }

  document.addEventListener("focusin", function (event) {
    var element = event.target;
    if (!element || !element.closest || !element.closest("#Detail")) { return; }
    if (!fieldName(element)) { return; }
    element.dataset.hsplIndentEditStart = String(element.value == null ? "" : element.value);
    pending = null;
  }, true);

  document.addEventListener("input", function (event) {
    var element = event.target;
    if (!element || !element.closest || !element.closest("#Detail")) { return; }
    var field = fieldName(element);
    if (!field) { return; }
    if (String(element.value) === String(element.dataset.hsplIndentEditStart || "")) {
      pending = null;
      return;
    }
    pending = capture(element, field);
  }, true);

  document.addEventListener("keydown", function (event) {
    if (event.key === "Tab" || event.key === "Enter") { finish(event.target); }
  }, true);
  document.addEventListener("focusout", function (event) { finish(event.target); }, true);
  document.addEventListener("change", function (event) { finish(event.target); }, true);
})();
~';
begin
  select javascript_code into l_code from apex_260100.wwv_flow_steps
   where flow_id=105 and id=108 and security_group_id=4744311978888504 for update;
  l_pos:=dbms_lob.instr(l_code,'/* HSPL_INDENT_CAPTURE_COMMIT_V7 */');
  if l_pos=0 then raise_application_error(-20001,'V7 marker missing'); end if;
  dbms_lob.trim(l_code,l_pos-1);
  dbms_lob.append(l_code,l_js);
  update apex_260100.wwv_flow_steps set javascript_code=l_code,last_updated_on=sysdate,last_updated_by=user
   where flow_id=105 and id=108 and security_group_id=4744311978888504;
  update apex_260100.wwv_flow_page_da_events set display_when_type='NEVER',last_updated_on=sysdate,last_updated_by=user
   where id=38654365607424864 and flow_id=105 and page_id=108 and security_group_id=4744311978888504;
  commit;
end;
/

begin
  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select case when dbms_lob.instr(javascript_code,'HSPL_INDENT_PENDING_EDIT_V8')>0 then 'PENDING_EDIT_V8_OK' else 'V8_MISSING' end v8_status,
       case when dbms_lob.instr(javascript_code,'HSPL_INDENT_CAPTURE_COMMIT_V7')=0 then 'V7_REMOVED' else 'V7_REMAINS' end v7_status
  from apex_260100.wwv_flow_steps where flow_id=105 and id=108 and security_group_id=4744311978888504;
exit
