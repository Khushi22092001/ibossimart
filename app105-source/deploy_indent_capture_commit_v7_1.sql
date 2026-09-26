whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on pagesize 100 linesize 280
connect -name IMART

declare
  l_code clob;
  l_old varchar2(2000) := q'~    if (!record) { return; }

    var raw = element.value;~';
  l_new varchar2(2000) := q'~    if (!record) { return; }
    if (recordId == null && typeof ctx.model.getRecordId === "function") {
      recordId = ctx.model.getRecordId(record);
    }

    var raw = element.value;~';
begin
  select javascript_code into l_code
    from apex_260100.wwv_flow_steps
   where flow_id=105 and id=108 and security_group_id=4744311978888504
   for update;
  if dbms_lob.instr(l_code,'HSPL_INDENT_CAPTURE_COMMIT_V7')=0 then
    raise_application_error(-20001,'V7 marker missing');
  end if;
  if dbms_lob.instr(l_code,l_old)=0 then
    raise_application_error(-20002,'V7 selected-record snippet missing');
  end if;
  l_code := replace(l_code,l_old,l_new);
  update apex_260100.wwv_flow_steps
     set javascript_code=l_code,last_updated_on=sysdate,last_updated_by=user
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

select case when dbms_lob.instr(javascript_code,'recordId = ctx.model.getRecordId(record)')>0
            then 'SELECTED_RECORD_ID_RESOLUTION_OK' else 'RECORD_ID_RESOLUTION_MISSING' end status
  from apex_260100.wwv_flow_steps
 where flow_id=105 and id=108 and security_group_id=4744311978888504;
exit
