whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on
connect -name IMART
declare
  l_code clob;
  l_old varchar2(2000) := q'~      if (Math.abs(n(model.getValue(record, "AMOUNT")) - amount) > 0.0000001) {
        model.setValue(record, "AMOUNT", amount);
      }~';
  l_new varchar2(4000) := q'~      var beforeAmount = model.getValue(record, "AMOUNT");
      var setResult = "same";
      if (Math.abs(n(beforeAmount) - amount) > 0.0000001) {
        setResult = String(model.setValue(record, "AMOUNT", amount));
      }
      document.body.setAttribute("data-hspl-v7-debug", JSON.stringify({recordId:recordId,raw:raw,qtySnapshot:qtySnapshot,qty:qty,rate:rate,amount:amount,beforeAmount:beforeAmount,afterAmount:model.getValue(record,"AMOUNT"),setResult:setResult}));~';
begin
  select javascript_code into l_code from apex_260100.wwv_flow_steps
   where flow_id=105 and id=108 and security_group_id=4744311978888504 for update;
  if dbms_lob.instr(l_code,l_old)=0 then raise_application_error(-20001,'V7 amount snippet missing'); end if;
  l_code:=replace(l_code,l_old,l_new);
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
exit
