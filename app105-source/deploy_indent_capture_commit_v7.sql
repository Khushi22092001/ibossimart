whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on pagesize 100 linesize 280
connect -name IMART

declare
  l_js clob := q'~
/* HSPL_INDENT_CAPTURE_COMMIT_V7 */
(function () {
  "use strict";
  if (window.hsplIndentCaptureCommitV7) { return; }
  window.hsplIndentCaptureCommitV7 = true;

  function n(value) {
    if (value && typeof value === "object" && "v" in value) { value = value.v; }
    var parsed = Number(String(value == null ? 0 : value).replace(/,/g, ""));
    return Number.isFinite(parsed) ? parsed : 0;
  }

  function context() {
    try {
      var region = apex.region("Detail");
      var grid = region.widget().interactiveGrid("getViews", "grid");
      return grid && grid.model ? { region: region, grid: grid, model: grid.model } : null;
    } catch (ignore) { return null; }
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

  function activeRecordId(ctx) {
    try {
      if (ctx.grid.view$ && typeof ctx.grid.view$.grid === "function") {
        return ctx.grid.view$.grid("getActiveRecordId");
      }
    } catch (ignoreGrid) {}
    try {
      if (typeof ctx.grid.getActiveRecordId === "function") {
        return ctx.grid.getActiveRecordId();
      }
    } catch (ignoreView) {}
    return null;
  }

  document.addEventListener("change", function (event) {
    var element = event.target;
    if (!element || !element.closest || !element.closest("#Detail")) { return; }
    var field = fieldName(element);
    if (!field) { return; }

    var ctx = context();
    if (!ctx) { return; }
    var recordId = activeRecordId(ctx);
    var record = recordId != null ? ctx.model.getRecord(recordId) : null;
    if (!record) {
      var selected = ctx.region.widget().interactiveGrid("getSelectedRecords");
      if (selected && selected.length === 1) { record = selected[0]; }
    }
    if (!record) { return; }

    var raw = element.value;
    var qtySnapshot = n(ctx.model.getValue(record, "INDENTQUANTITY1"));
    if (field === "RATE" && recordId != null) {
      var row = document.querySelector('#Detail_ig_grid_vc tbody tr[data-id="' + String(recordId).replace(/"/g, '\\"') + '"]');
      var qtyCell = row && row.querySelectorAll("td")[6];
      if (qtyCell && String(qtyCell.textContent || "").trim() !== "") {
        qtySnapshot = n(qtyCell.textContent);
      }
    }

    setTimeout(function () {
      var current = context();
      if (current && current.model === ctx.model) { ctx = current; }
      var model = ctx.model;
      model.setValue(record, field, raw);
      var qty = field === "INDENTQUANTITY1" ? n(raw) : qtySnapshot;
      var rate = field === "RATE" ? n(raw) : n(model.getValue(record, "RATE"));
      var amount = qty * rate;
      if (Math.abs(n(model.getValue(record, "AMOUNT")) - amount) > 0.0000001) {
        model.setValue(record, "AMOUNT", amount);
      }
    }, 0);
  }, true);
})();
~';
begin
  update apex_260100.wwv_flow_steps
     set javascript_code=javascript_code||chr(10)||l_js,
         last_updated_on=sysdate,
         last_updated_by=user
   where flow_id=105 and id=108
     and security_group_id=4744311978888504
     and dbms_lob.instr(javascript_code,'HSPL_INDENT_CAPTURE_COMMIT_V7')=0
     and dbms_lob.instr(javascript_code,'HSPL_INDENT_RATE_COMMIT_V5')=0
     and dbms_lob.instr(javascript_code,'HSPL_INDENT_AMOUNT_CHANGE_ONLY_V4')=0
     and dbms_lob.instr(javascript_code,'modelSet(b.m,c.record,"AMOUNT"')=0;
  if sql%rowcount<>1 then raise_application_error(-20001,'V7 page JavaScript precondition/count mismatch'); end if;

  update apex_260100.wwv_flow_page_da_events
     set display_when_type='NEVER',last_updated_on=sysdate,last_updated_by=user
   where id=38654365607424864 and flow_id=105 and page_id=108
     and security_group_id=4744311978888504 and name='Set Amount';
  if sql%rowcount<>1 then raise_application_error(-20002,'Set Amount DA disable count mismatch'); end if;
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

select case when dbms_lob.instr(javascript_code,'HSPL_INDENT_CAPTURE_COMMIT_V7')>0 then 'CAPTURE_COMMIT_V7_OK' else 'V7_MISSING' end v7_status,
       case when dbms_lob.instr(javascript_code,'grid("getActiveRecordId")')>0 then 'ACTIVE_ROW_CAPTURE_OK' else 'ACTIVE_ROW_CAPTURE_MISSING' end row_status
  from apex_260100.wwv_flow_steps
 where flow_id=105 and id=108 and security_group_id=4744311978888504;

select case when display_when_type='NEVER' then 'BLANK_VALUE_DA_DISABLED' else 'DA_STILL_ENABLED' end da_status
  from apex_260100.wwv_flow_page_da_events
 where id=38654365607424864 and flow_id=105 and page_id=108 and security_group_id=4744311978888504;

exit
