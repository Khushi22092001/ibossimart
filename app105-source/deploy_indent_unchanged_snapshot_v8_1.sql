whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on pagesize 100 linesize 280
connect -name IMART

declare
  l_code clob;
  l_old1 varchar2(200) := '  var pending = null;';
  l_new1 varchar2(300) := '  var pending = null;'||chr(10)||'  var clean = null;';
  l_old2 varchar2(1000) := q'~  function finish(element) {
    if (!pending || pending.element !== element) { return; }
    var job = pending;
    pending = null;~';
  l_new2 varchar2(4000) := q'~  function restoreClean(job) {
    setTimeout(function () {
      var current = gridContext();
      if (current && current.model === job.ctx.model) { job.ctx = current; }
      var model = job.ctx.model;
      if (Math.abs(n(model.getValue(job.record, job.field)) - n(job.fieldSnapshot)) > 0.0000001) {
        model.setValue(job.record, job.field, job.fieldSnapshot);
      }
      if (Math.abs(n(model.getValue(job.record, "AMOUNT")) - n(job.amountSnapshot)) > 0.0000001) {
        model.setValue(job.record, "AMOUNT", job.amountSnapshot);
      }
    }, 0);
  }

  function finish(element) {
    if (!pending || pending.element !== element) {
      if (clean && clean.element === element) {
        var unchanged = clean;
        clean = null;
        restoreClean(unchanged);
      }
      return;
    }
    var job = pending;
    pending = null;
    clean = null;~';
  l_old3 varchar2(1000) := q'~    element.dataset.hsplIndentEditStart = String(element.value == null ? "" : element.value);
    pending = null;~';
  l_new3 varchar2(2000) := q'~    element.dataset.hsplIndentEditStart = String(element.value == null ? "" : element.value);
    pending = null;
    clean = capture(element, fieldName(element));
    if (clean) {
      clean.fieldSnapshot = element.value;
      clean.amountSnapshot = clean.ctx.model.getValue(clean.record, "AMOUNT");
    }~';
begin
  select javascript_code into l_code from apex_260100.wwv_flow_steps
   where flow_id=105 and id=108 and security_group_id=4744311978888504 for update;
  if dbms_lob.instr(l_code,'HSPL_INDENT_PENDING_EDIT_V8')=0 then raise_application_error(-20001,'V8 marker missing'); end if;
  if dbms_lob.instr(l_code,l_old1)=0 or dbms_lob.instr(l_code,l_old2)=0 or dbms_lob.instr(l_code,l_old3)=0 then
    raise_application_error(-20002,'V8 snapshot patch precondition missing');
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

select case when dbms_lob.instr(javascript_code,'function restoreClean(job)')>0 then 'UNCHANGED_SNAPSHOT_GUARD_OK' else 'SNAPSHOT_GUARD_MISSING' end status
  from apex_260100.wwv_flow_steps where flow_id=105 and id=108 and security_group_id=4744311978888504;
exit
