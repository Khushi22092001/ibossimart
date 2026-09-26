whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on pagesize 100 linesize 280
connect -name IMART

declare
  l_code clob;
  l_pos  pls_integer;
  l_action_json clob := q'~{"js_code":"(function(ctx){var m=ctx.data&&ctx.data.model,r=ctx.data&&ctx.data.record;if(!m||!r){return;}function n(v){if(v&&typeof v==='object'&&'v' in v){v=v.v;}v=Number(String(v==null?0:v).replace(/,/g,''));return Number.isFinite(v)?v:0;}var amount=n(m.getValue(r,'INDENTQUANTITY1'))*n(m.getValue(r,'RATE'));if(Math.abs(n(m.getValue(r,'AMOUNT'))-amount)>0.0000001){m.setValue(r,'AMOUNT',amount);}})(this);"}~';
begin
  select javascript_code
    into l_code
    from apex_260100.wwv_flow_steps
   where flow_id=105
     and id=108
     and security_group_id=4744311978888504
   for update;

  l_pos := dbms_lob.instr(l_code,'/* HSPL_INDENT_RATE_COMMIT_V5 */');
  if l_pos=0 then
    raise_application_error(-20001,'Indent Rate V5 marker missing');
  end if;
  dbms_lob.trim(l_code,l_pos-1);

  update apex_260100.wwv_flow_steps
     set javascript_code=l_code,
         last_updated_on=sysdate,
         last_updated_by=user
   where flow_id=105
     and id=108
     and security_group_id=4744311978888504;

  update apex_260100.wwv_flow_page_da_events
     set display_when_type=null,
         last_updated_on=sysdate,
         last_updated_by=user
   where id=38654365607424864
     and flow_id=105
     and page_id=108
     and security_group_id=4744311978888504
     and name='Set Amount';
  if sql%rowcount<>1 then
    raise_application_error(-20002,'Set Amount DA event count mismatch');
  end if;

  update apex_260100.wwv_flow_page_da_actions
     set action='NATIVE_JAVASCRIPT_CODE',
         affected_elements_type=null,
         affected_region_id=null,
         affected_button_id=null,
         affected_elements=null,
         wait_for_result='N',
         attributes=l_action_json,
         last_updated_on=sysdate,
         last_updated_by=user
   where id=38654885063424864
     and event_id=38654365607424864
     and flow_id=105
     and page_id=108
     and security_group_id=4744311978888504;
  if sql%rowcount<>1 then
    raise_application_error(-20003,'Set Amount DA action count mismatch');
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

select case when dbms_lob.instr(javascript_code,'HSPL_INDENT_RATE_COMMIT_V5')=0
            then 'GLOBAL_V5_LISTENER_REMOVED' else 'GLOBAL_V5_LISTENER_REMAINS' end listener_status,
       case when dbms_lob.instr(javascript_code,'HSPL_INDENT_AMOUNT_CHANGE_ONLY_V4')=0
            then 'GLOBAL_V4_LISTENER_ABSENT' else 'GLOBAL_V4_LISTENER_REMAINS' end v4_status,
       case when dbms_lob.instr(javascript_code,'modelSet(b.m,c.record,"AMOUNT"')=0
            then 'LEGACY_AMOUNT_SUBSCRIBER_ABSENT' else 'LEGACY_AMOUNT_SUBSCRIBER_REMAINS' end legacy_status
  from apex_260100.wwv_flow_steps
 where flow_id=105 and id=108 and security_group_id=4744311978888504;

select e.name,
       case when e.display_when_type is null then 'DA_ENABLED' else e.display_when_type end event_status,
       a.action,
       case when dbms_lob.instr(a.attributes,'ctx.data&&ctx.data.record')>0
            then 'ORIGINATING_RECORD_CONTEXT_OK' else 'ACTION_CONTEXT_MISSING' end action_status
  from apex_260100.wwv_flow_page_da_events e
  join apex_260100.wwv_flow_page_da_actions a on a.event_id=e.id
 where e.id=38654365607424864
   and a.id=38654885063424864
   and e.flow_id=105 and e.page_id=108
   and e.security_group_id=4744311978888504;

select case when dbms_lob.instr(process_sql_clob,
                  'AMOUNT=nvl(:INDENTQUANTITY1,0) * nvl(:RATE,0)')>0
            then 'SERVER_SAVE_FORMULA_OK' else 'SERVER_SAVE_FORMULA_MISSING' end save_status
  from apex_260100.wwv_flow_step_processing
 where flow_id=105 and flow_step_id=108
   and process_name='Item Detail - Save Interactive Grid Data'
   and security_group_id=4744311978888504;

exit
