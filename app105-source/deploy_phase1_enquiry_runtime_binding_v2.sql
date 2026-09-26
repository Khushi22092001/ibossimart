whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on
connect -name IMART

declare
  l_js clob;
begin
  select javascript_code into l_js
    from apex_260100.wwv_flow_steps
   where flow_id=105 and id=708 and security_group_id=4744311978888504
   for update;

  l_js:=replace(l_js,
    'if(pid===708)ok=bind(region(["item-detail"]),"hsplP708",enquiry);',
    'if(pid===708)ok=bind(region(["item-detail","R179881005997839575"]),"hsplP708",enquiry);');
  l_js:=replace(l_js,'#GETITEM,#getitem"','#GETITEM,#getitem,#B40530680715907070"');
  l_js:=replace(l_js,'"#item-detail",function()','"#item-detail,#R179881005997839575",function()');

  update apex_260100.wwv_flow_steps
     set javascript_code=l_js,last_updated_on=sysdate,last_updated_by=user
   where flow_id=105 and id=708 and security_group_id=4744311978888504;
  if sql%rowcount<>1 then raise_application_error(-20001,'Page 708 runtime binding update failed'); end if;
  commit;
end;
/

begin
  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504,p_default_application_id=>105,
    p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select case when dbms_lob.instr(javascript_code,'R179881005997839575')>0
             and dbms_lob.instr(javascript_code,'B40530680715907070')>0
            then 'P708_BINDING_V2_OK' else 'P708_BINDING_V2_MISSING' end status
  from apex_260100.wwv_flow_steps where flow_id=105 and id=708;
exit
