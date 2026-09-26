whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on pagesize 200 linesize 280
connect -name IMART

declare
  l_guard clob := q'~
/* HSPL_PHASE1_UNCHANGED_FOCUS_GUARD_V2 */
(function () {
  "use strict";
  if (window.hsplPhase1UnchangedFocusGuardV2) { return; }
  window.hsplPhase1UnchangedFocusGuardV2 = true;

  function elementFromContext(ctx) {
    var el = ctx && ctx.browserEvent && ctx.browserEvent.target;
    if (!el && ctx) { el = ctx.triggeringElement; }
    if (el && el.jquery) { el = el[0]; }
    return el || null;
  }

  function valueOf(el) {
    if (!el) { return ""; }
    if (el.type === "checkbox" || el.type === "radio") {
      return el.checked ? String(el.value == null ? "" : el.value) : "";
    }
    return String(el.value == null ? "" : el.value);
  }

  document.addEventListener("focusin", function (event) {
    var el = event.target;
    if (el && el.dataset && el.matches("input,select,textarea")) {
      el.dataset.hsplPhase1FocusStart = valueOf(el);
    }
  }, true);

  window.hsplPhase1WasEdited = function (ctx) {
    var el = elementFromContext(ctx);
    if (!el || !el.dataset) { return true; }
    var before = el.dataset.hsplPhase1FocusStart;
    if (before === undefined) { return true; }
    return before !== valueOf(el);
  };

  window.hsplPhase1FocusNumber = function (ctx) {
    var n = Number(valueOf(elementFromContext(ctx)).replace(/,/g, ""));
    return Number.isFinite(n) ? n : 0;
  };

  window.hsplPhase1ContextValue = function (ctx, field) {
    try {
      var item = apex.item(field);
      if (item && item.node) { return item.getValue(); }
    } catch (ignoreItem) {}
    try {
      var el = elementFromContext(ctx);
      var row = el && el.closest("tr");
      var recordId = row && row.getAttribute("data-id");
      var pageId = Number(apex.env.APP_PAGE_ID || 0);
      var regionId = pageId === 108 ? "Detail" : "QuotationDetail";
      var model = apex.region(regionId).widget().interactiveGrid("getViews", "grid").model;
      var record = recordId && model.getRecord(recordId);
      return record ? model.getValue(record, field) : null;
    } catch (ignoreGrid) { return null; }
  };

  window.hsplPhase1IsBlank = function (value) {
    return value === null || value === undefined || String(value).trim() === "";
  };
})();
~';
begin
  update apex_260100.wwv_flow_steps
     set javascript_code=nvl(javascript_code,empty_clob())||chr(10)||l_guard,
         last_updated_on=sysdate,
         last_updated_by=user
   where flow_id=105
     and id in (108,710)
     and security_group_id=4744311978888504
     and dbms_lob.instr(nvl(javascript_code,empty_clob()),
                        'HSPL_PHASE1_UNCHANGED_FOCUS_GUARD_V2')=0;
  if sql%rowcount<>2 then
    raise_application_error(-20001,'Page guard install count mismatch: expected 2');
  end if;

  /* Actions without a pre-existing business condition. */
  update apex_260100.wwv_flow_page_da_actions
     set client_condition_type='JAVASCRIPT_EXPRESSION',
         client_condition_element=null,
         client_condition_expression='window.hsplPhase1WasEdited(this)',
         last_updated_on=sysdate,
         last_updated_by=user
   where flow_id=105
     and security_group_id=4744311978888504
     and client_condition_type is null
     and id in (
       38674977479424870,38675816645424870,38676751442424870,
       38686357986424873,38689969188424874,38694503624424875,
       38696787679424876,38696237413424875,38697635604424876,
       38698594956424876,
       41133498461923805,41133945231923805,41134826836923806,
       41135801765923806,41168478745923814,41168971108923814,
       41169483388923814
     );
  if sql%rowcount<>17 then
    raise_application_error(-20002,'Unconditioned action guard count mismatch: expected 17');
  end if;

  /* Preserve original > 0 checks and add the edited-value guard. */
  update apex_260100.wwv_flow_page_da_actions
     set client_condition_type='JAVASCRIPT_EXPRESSION',
         client_condition_element=null,
         client_condition_expression='window.hsplPhase1WasEdited(this) && window.hsplPhase1FocusNumber(this) > 0',
         last_updated_on=sysdate,
         last_updated_by=user
   where flow_id=105
     and security_group_id=4744311978888504
     and id in (38677667579424870,38685440064424873)
     and client_condition_type='GREATER_THAN'
     and client_condition_expression='0';
  if sql%rowcount<>2 then
    raise_application_error(-20003,'Greater-than condition guard count mismatch: expected 2');
  end if;

  /* Preserve original QUANTITY2-is-null rule and add the edited-value guard. */
  update apex_260100.wwv_flow_page_da_actions
     set client_condition_type='JAVASCRIPT_EXPRESSION',
         client_condition_element=null,
         client_condition_expression=
           'window.hsplPhase1WasEdited(this) && window.hsplPhase1IsBlank(window.hsplPhase1ContextValue(this,''QUANTITY2''))',
         last_updated_on=sysdate,
         last_updated_by=user
   where flow_id=105
     and security_group_id=4744311978888504
     and id=38687277287424873
     and client_condition_type='NULL'
     and client_condition_element='QUANTITY2';
  if sql%rowcount<>1 then
    raise_application_error(-20004,'Null condition guard count mismatch: expected 1');
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
       case when dbms_lob.instr(javascript_code,
              'HSPL_PHASE1_UNCHANGED_FOCUS_GUARD_V2')>0 then 'GUARD_OK' else 'MISSING' end guard_status
  from apex_260100.wwv_flow_steps
 where flow_id=105 and id in (108,710)
   and security_group_id=4744311978888504
 order by id;

select page_id,count(*) guarded_actions
  from apex_260100.wwv_flow_page_da_actions
 where flow_id=105
   and security_group_id=4744311978888504
   and client_condition_type='JAVASCRIPT_EXPRESSION'
   and client_condition_expression like 'window.hsplPhase1WasEdited(this)%'
   and id in (
       38674977479424870,38675816645424870,38676751442424870,
       38677667579424870,38685440064424873,38686357986424873,
       38687277287424873,38689969188424874,38694503624424875,
       38696787679424876,38696237413424875,38697635604424876,
       38698594956424876,41133498461923805,41133945231923805,
       41134826836923806,41135801765923806,41168478745923814,
       41168971108923814,41169483388923814)
 group by page_id order by page_id;

exit
