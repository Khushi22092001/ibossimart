whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on pagesize 100 linesize 280
connect -name IMART

declare
  l_code clob;
  l_pos  pls_integer;
  l_legacy varchar2(1000) := q'~if(c.record&&(f==="INDENTQUANTITY1"||f==="RATE"))modelSet(b.m,c.record,"AMOUNT",n(b.m.getValue(c.record,"INDENTQUANTITY1"))*n(b.m.getValue(c.record,"RATE")));~';
  l_js   clob := q'~
/* HSPL_INDENT_RATE_COMMIT_V5 */
(function () {
  "use strict";
  if (window.hsplIndentRateCommitV5) { return; }
  window.hsplIndentRateCommitV5 = true;

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

  function fieldFromElement(element) {
    var id = element && (element.id || element.name) || "";
    if (id === "INDENTQUANTITY1") { return "INDENTQUANTITY1"; }
    if (id === "RATE" || id === "C835772576449646800") { return "RATE"; }
    var labelledBy = element && element.getAttribute && element.getAttribute("aria-labelledby") || "";
    if (labelledBy.indexOf("INDENTQUANTITY1") >= 0) { return "INDENTQUANTITY1"; }
    if (labelledBy.indexOf("C835772576449646800") >= 0) { return "RATE"; }
    return null;
  }

  function originatingRecord(context, element) {
    try {
      var row = element && element.closest("tr[data-id]");
      var recordId = row && row.getAttribute("data-id");
      if (!recordId && context.grid && typeof context.grid.getActiveRecordId === "function") {
        recordId = context.grid.getActiveRecordId();
      }
      var record = recordId != null ? context.model.getRecord(recordId) : null;
      if (record) { return record; }
      var selected = context.region.widget().interactiveGrid("getSelectedRecords");
      return selected && selected.length === 1 ? selected[0] : null;
    } catch (ignore) { return null; }
  }

  function sameNumber(left, right) {
    return Math.abs(numberValue(left) - numberValue(right)) <= 0.0000001;
  }

  function commitAndCalculate(context, record, field, editedValue) {
    if (!context || !record) { return; }
    var model = context.model;

    /* Preserve the user's actual editor value if row navigation outran IG commit. */
    if (!sameNumber(model.getValue(record, field), editedValue)) {
      model.setValue(record, field, editedValue);
    }

    var qty = field === "INDENTQUANTITY1"
      ? numberValue(editedValue)
      : numberValue(model.getValue(record, "INDENTQUANTITY1"));
    var rate = field === "RATE"
      ? numberValue(editedValue)
      : numberValue(model.getValue(record, "RATE"));
    var expected = qty * rate;
    if (!sameNumber(model.getValue(record, "AMOUNT"), expected)) {
      model.setValue(record, "AMOUNT", expected);
    }
  }

  /* Capture before Tab can activate another row; run once after native IG commit. */
  document.addEventListener("change", function (event) {
    var element = event.target;
    if (!element || !element.closest || !element.closest("#Detail")) { return; }
    var field = fieldFromElement(element);
    if (!field) { return; }
    var context = detailContext();
    var record = context && originatingRecord(context, element);
    var editedValue = element.value;
    if (!context || !record) { return; }
    setTimeout(function () {
      var current = detailContext();
      if (current && current.model === context.model) { context = current; }
      commitAndCalculate(context, record, field, editedValue);
    }, 0);
  }, true);
})();
~';
begin
  select javascript_code
    into l_code
    from apex_260100.wwv_flow_steps
   where flow_id=105
     and id=108
     and security_group_id=4744311978888504
   for update;

  if dbms_lob.instr(l_code,'HSPL_INDENT_RATE_COMMIT_V5')>0 then
    raise_application_error(-20001,'Indent Rate V5 already installed');
  end if;

  if dbms_lob.instr(l_code,l_legacy)=0 then
    raise_application_error(-20003,'Legacy synchronous Indent amount subscriber not found');
  end if;
  l_code := replace(l_code,l_legacy,'');

  l_pos := dbms_lob.instr(l_code,'/* HSPL_INDENT_AMOUNT_CHANGE_ONLY_V4 */');
  if l_pos=0 then
    raise_application_error(-20002,'Indent amount V4 marker missing');
  end if;

  dbms_lob.trim(l_code,l_pos-1);
  dbms_lob.append(l_code,l_js);

  update apex_260100.wwv_flow_steps
     set javascript_code=l_code,
         last_updated_on=sysdate,
         last_updated_by=user
   where flow_id=105
     and id=108
     and security_group_id=4744311978888504;
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

select case when dbms_lob.instr(javascript_code,'HSPL_INDENT_RATE_COMMIT_V5')>0
            then 'RATE_COMMIT_V5_OK' else 'V5_MISSING' end v5_status,
       case when dbms_lob.instr(javascript_code,'HSPL_INDENT_AMOUNT_CHANGE_ONLY_V4')=0
            then 'V4_REMOVED' else 'V4_STILL_PRESENT' end v4_status,
       case when dbms_lob.instr(javascript_code,'modelSet(b.m,c.record,"AMOUNT"')=0
            then 'LEGACY_AMOUNT_SUBSCRIBER_REMOVED' else 'LEGACY_AMOUNT_SUBSCRIBER_REMAINS' end subscriber_status
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
