whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on pagesize 100 linesize 280
connect -name IMART

declare
  l_js clob := q'~
/* HSPL_INDENT_AMOUNT_CHANGE_ONLY_V4 */
(function () {
  "use strict";
  if (window.hsplIndentAmountChangeOnlyV4) { return; }
  window.hsplIndentAmountChangeOnlyV4 = true;

  function numberValue(value) {
    if (value && typeof value === "object" && "v" in value) { value = value.v; }
    var parsed = Number(String(value == null ? 0 : value).replace(/,/g, ""));
    return Number.isFinite(parsed) ? parsed : 0;
  }

  function detailContext() {
    try {
      var region = apex.region("Detail");
      var grid = region.widget().interactiveGrid("getViews", "grid");
      return grid && grid.model ? { region: region, grid: grid, model: grid.model } : null;
    } catch (ignore) { return null; }
  }

  function calculateRecord(model, record, changedField, changedValue) {
    if (!model || !record) { return; }
    var amountKey = model.getFieldKey("AMOUNT");
    if (amountKey === undefined || amountKey === null) { return; }
    var qty = changedField === "INDENTQUANTITY1"
      ? numberValue(changedValue)
      : numberValue(model.getValue(record, "INDENTQUANTITY1"));
    var rate = changedField === "RATE"
      ? numberValue(changedValue)
      : numberValue(model.getValue(record, "RATE"));
    var expected = qty * rate;
    var current = numberValue(model.getValue(record, "AMOUNT"));
    if (Math.abs(current - expected) > 0.0000001) {
      model.setValue(record, "AMOUNT", expected);
    }
  }

  function bindModel() {
    var context = detailContext();
    if (!context) { return false; }
    var model = context.model;
    if (!model.hsplIndentAmountChangeOnlyV4) {
      model.hsplIndentAmountChangeOnlyV4 = true;
      model.subscribe({
        viewId: "hsplIndentAmountChangeOnlyV4",
        onChange: function (type, change) {
          var field = change && (change.field || change.fieldName);
          if (change && change.record &&
              (field === "INDENTQUANTITY1" || field === "RATE")) {
            calculateRecord(model, change.record, field, model.getValue(change.record, field));
          }
        }
      });
    }
    return true;
  }

  function fieldFromElement(element) {
    var id = element && (element.id || element.name) || "";
    if (id === "INDENTQUANTITY1") { return "INDENTQUANTITY1"; }
    if (id === "RATE" || id === "C835772576449646800") { return "RATE"; }
    var labelledBy = element && element.getAttribute && element.getAttribute("aria-labelledby") || "";
    if (labelledBy.indexOf("INDENTQUANTITY1") >= 0) { return "INDENTQUANTITY1"; }
    if (labelledBy.indexOf("C835772576449646800") >= 0) { return "RATE"; }
    return null;
  }

  function recordFromElement(context, element) {
    try {
      var row = element && element.closest("tr");
      var recordId = row && row.getAttribute("data-id");
      var record = recordId && context.model.getRecord(recordId);
      if (record) { return record; }
      var selected = context.region.widget().interactiveGrid("getSelectedRecords");
      return selected && selected.length ? selected[0] : null;
    } catch (ignore) { return null; }
  }

  /* Native change fires only when the user actually changed the editor value. */
  document.addEventListener("change", function (event) {
    var element = event.target;
    if (!element || !element.closest || !element.closest("#Detail")) { return; }
    var field = fieldFromElement(element);
    if (!field) { return; }
    var editedValue = element.value;
    var context = detailContext();
    var record = context && recordFromElement(context, element);
    setTimeout(function () {
      context = detailContext() || context;
      if (!context) { return; }
      record = record || recordFromElement(context, element);
      calculateRecord(context.model, record, field, editedValue);
    }, 0);
  }, false);

  apex.jQuery(function () { bindModel(); });
  apex.jQuery(document).on("apexafterrefresh.hsplIndentAmountV4", "#Detail", bindModel);
})();
~';
begin
  update apex_260100.wwv_flow_steps
     set javascript_code=nvl(javascript_code,empty_clob())||chr(10)||l_js,
         last_updated_on=sysdate,
         last_updated_by=user
   where flow_id=105
     and id=108
     and security_group_id=4744311978888504
     and dbms_lob.instr(nvl(javascript_code,empty_clob()),
                        'HSPL_INDENT_AMOUNT_CHANGE_ONLY_V4')=0
     and dbms_lob.instr(nvl(javascript_code,empty_clob()),
                        'HSPL_INDENT_AMOUNT_CONSISTENCY_V3')=0;
  if sql%rowcount<>1 then
    raise_application_error(-20001,'Indent amount V4 install precondition/count mismatch');
  end if;
  commit;
end;
/

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30',
    p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504,
    p_default_application_id=>105,
    p_default_id_offset=>7541489808702750,
    p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select id page_id,
       case when dbms_lob.instr(javascript_code,'HSPL_INDENT_AMOUNT_CHANGE_ONLY_V4')>0
            then 'CHANGE_ONLY_V4_OK' else 'V4_MISSING' end v4_status,
       case when dbms_lob.instr(javascript_code,'HSPL_INDENT_AMOUNT_CONSISTENCY_V3')=0
            then 'RETRY_SCAN_V3_ABSENT' else 'V3_STILL_PRESENT' end v3_status
  from apex_260100.wwv_flow_steps
 where flow_id=105 and id=108 and security_group_id=4744311978888504;

select case when dbms_lob.instr(process_sql_clob,
                  'AMOUNT=nvl(:INDENTQUANTITY1,0) * nvl(:RATE,0)')>0
            then 'SERVER_SAVE_FORMULA_OK' else 'SERVER_SAVE_FORMULA_MISSING' end save_status
  from apex_260100.wwv_flow_step_processing
 where flow_id=105 and flow_step_id=108
   and process_name='Item Detail - Save Interactive Grid Data'
   and security_group_id=4744311978888504;

exit
