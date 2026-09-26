whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on pagesize 100 linesize 280
connect -name IMART

declare
  l_code clob;
  l_old1 varchar2(300) := '  var clean = null;';
  l_new1 varchar2(500) := '  var clean = null;'||chr(10)||'  var manualRates = Object.create(null);';
  l_old2 varchar2(300) := '  function restoreClean(job) {';
  l_new2 varchar2(5000) := q'~  function bindRatePrecedence(ctx) {
    var model = ctx && ctx.model;
    if (!model || model.hsplIndentRatePrecedenceV9) { return; }
    model.hsplIndentRatePrecedenceV9 = true;
    model.subscribe({
      viewId: "hsplIndentRatePrecedenceV9",
      onChange: function (type, change) {
        var field = change && (change.field || change.fieldName);
        var record = change && change.record;
        if (!record || !field) { return; }
        var id = typeof model.getRecordId === "function" ? model.getRecordId(record) : null;
        if (field === "ITEMSPECIFICATIONCODE") {
          if (id != null) { delete manualRates[String(id)]; }
          return;
        }
        if (field !== "RATE") { return; }
        setTimeout(function () {
          var rate = n(model.getValue(record, "RATE"));
          var key = id == null ? null : String(id);
          if (key != null && Object.prototype.hasOwnProperty.call(manualRates, key)) {
            var manualRate = n(manualRates[key]);
            if (Math.abs(rate - manualRate) > 0.0000001) {
              model.setValue(record, "RATE", manualRates[key]);
            }
            rate = manualRate;
          }
          var amount = n(model.getValue(record, "INDENTQUANTITY1")) * rate;
          if (Math.abs(n(model.getValue(record, "AMOUNT")) - amount) > 0.0000001) {
            model.setValue(record, "AMOUNT", amount);
          }
        }, 0);
      }
    });
  }

  function restoreClean(job) {~';
  l_old3 varchar2(500) := q'~      var model = job.ctx.model;
      model.setValue(job.record, job.field, job.raw);~';
  l_new3 varchar2(1500) := q'~      var model = job.ctx.model;
      bindRatePrecedence(job.ctx);
      if (job.field === "RATE" && job.recordId != null) {
        manualRates[String(job.recordId)] = job.raw;
      }
      model.setValue(job.record, job.field, job.raw);~';
begin
  select javascript_code into l_code from apex_260100.wwv_flow_steps
   where flow_id=105 and id=108 and security_group_id=4744311978888504 for update;
  if dbms_lob.instr(l_code,'HSPL_INDENT_PENDING_EDIT_V8')=0 then raise_application_error(-20001,'V8 marker missing'); end if;
  if dbms_lob.instr(l_code,'hsplIndentRatePrecedenceV9')>0 then raise_application_error(-20002,'V9 already installed'); end if;
  if dbms_lob.instr(l_code,l_old1)=0 or dbms_lob.instr(l_code,l_old2)=0 or dbms_lob.instr(l_code,l_old3)=0 then
    raise_application_error(-20003,'V9 patch precondition missing');
  end if;
  l_code:=replace(replace(replace(l_code,l_old1,l_new1),l_old2,l_new2),l_old3,l_new3);
  update apex_260100.wwv_flow_steps set javascript_code=l_code,last_updated_on=sysdate,last_updated_by=user
   where flow_id=105 and id=108 and security_group_id=4744311978888504;
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

select case when dbms_lob.instr(javascript_code,'hsplIndentRatePrecedenceV9')>0 then 'MANUAL_RATE_PRECEDENCE_V9_OK' else 'V9_MISSING' end v9_status,
       case when dbms_lob.instr(javascript_code,'delete manualRates[String(id)]')>0 then 'NEW_ITEM_UNLOCK_OK' else 'NEW_ITEM_UNLOCK_MISSING' end unlock_status
  from apex_260100.wwv_flow_steps where flow_id=105 and id=108 and security_group_id=4744311978888504;

select case when dbms_lob.instr(process_sql_clob,'AMOUNT=nvl(:INDENTQUANTITY1,0) * nvl(:RATE,0)')>0 then 'SERVER_SAVE_FORMULA_OK' else 'SERVER_SAVE_FORMULA_MISSING' end save_status
  from apex_260100.wwv_flow_step_processing
 where flow_id=105 and flow_step_id=108 and process_name='Item Detail - Save Interactive Grid Data' and security_group_id=4744311978888504;
exit
