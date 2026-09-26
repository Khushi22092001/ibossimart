whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on pagesize 100 linesize 280
connect -name IMART

declare
  l_code clob;
  l_old1 varchar2(1000) := q'~    return { element: element, field: field, raw: element.value, ctx: ctx,
             record: record, qtySnapshot: qtySnapshot };~';
  l_new1 varchar2(1200) := q'~    return { element: element, field: field, raw: element.value, ctx: ctx,
             record: record, recordId: recordId, qtySnapshot: qtySnapshot };~';
  l_old2 varchar2(1000) := q'~    if (clean) {
      clean.fieldSnapshot = element.value;
      clean.amountSnapshot = clean.ctx.model.getValue(clean.record, "AMOUNT");
    }~';
  l_new2 varchar2(3000) := q'~    if (clean) {
      clean.fieldSnapshot = clean.ctx.model.getValue(clean.record, clean.field);
      if (clean.recordId != null) {
        var row = document.querySelector('#Detail_ig_grid_vc tbody tr[data-id="' + String(clean.recordId).replace(/"/g, '\\"') + '"]');
        var cellIndex = clean.field === "RATE" ? 15 : 6;
        var fieldCell = row && row.querySelectorAll("td")[cellIndex];
        if (fieldCell && String(fieldCell.textContent || "").trim() !== "") {
          clean.fieldSnapshot = fieldCell.textContent;
        }
      }
      clean.amountSnapshot = clean.ctx.model.getValue(clean.record, "AMOUNT");
    }~';
begin
  select javascript_code into l_code from apex_260100.wwv_flow_steps
   where flow_id=105 and id=108 and security_group_id=4744311978888504 for update;
  if dbms_lob.instr(l_code,l_old1)=0 or dbms_lob.instr(l_code,l_old2)=0 then
    raise_application_error(-20001,'V8.2 visible-cell snapshot precondition missing');
  end if;
  l_code:=replace(replace(l_code,l_old1,l_new1),l_old2,l_new2);
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

select case when dbms_lob.instr(javascript_code,'clean.field === "RATE" ? 15 : 6')>0 then 'VISIBLE_CELL_SNAPSHOT_OK' else 'VISIBLE_CELL_SNAPSHOT_MISSING' end status
  from apex_260100.wwv_flow_steps where flow_id=105 and id=108 and security_group_id=4744311978888504;
exit
