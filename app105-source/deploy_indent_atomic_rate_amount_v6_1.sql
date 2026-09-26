whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on pagesize 100 linesize 280
connect -name IMART

declare
  l_action_json clob := q'~{"js_code":"(function(ctx){var m=ctx.data&&ctx.data.model,r=ctx.data&&ctx.data.record,el=ctx.triggeringElement;if(!m||!r||!el){return;}function n(v){if(v&&typeof v==='object'&&'v' in v){v=v.v;}v=Number(String(v==null?0:v).replace(/,/g,''));return Number.isFinite(v)?v:0;}var field=(el.id==='RATE'||el.id==='C835772576449646800')?'RATE':'INDENTQUANTITY1',raw=el.value;if(Math.abs(n(m.getValue(r,field))-n(raw))>0.0000001){m.setValue(r,field,raw);}var qty=field==='INDENTQUANTITY1'?n(raw):n(m.getValue(r,'INDENTQUANTITY1')),rate=field==='RATE'?n(raw):n(m.getValue(r,'RATE')),amount=qty*rate;if(Math.abs(n(m.getValue(r,'AMOUNT'))-amount)>0.0000001){m.setValue(r,'AMOUNT',amount);}})(this);"}~';
begin
  update apex_260100.wwv_flow_page_da_actions
     set attributes=l_action_json,
         last_updated_on=sysdate,
         last_updated_by=user
   where id=38654885063424864
     and event_id=38654365607424864
     and flow_id=105
     and page_id=108
     and security_group_id=4744311978888504
     and action='NATIVE_JAVASCRIPT_CODE';
  if sql%rowcount<>1 then
    raise_application_error(-20001,'Set Amount JavaScript action count mismatch');
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

select case when dbms_lob.instr(attributes,'m.setValue(r,field,raw)')>0
            then 'ATOMIC_FIELD_COMMIT_OK' else 'FIELD_COMMIT_MISSING' end field_status,
       case when dbms_lob.instr(attributes,'m.setValue(r,''AMOUNT'',amount)')>0
            then 'LOCAL_AMOUNT_UPDATE_OK' else 'AMOUNT_UPDATE_MISSING' end amount_status
  from apex_260100.wwv_flow_page_da_actions
 where id=38654885063424864
   and event_id=38654365607424864
   and flow_id=105 and page_id=108
   and security_group_id=4744311978888504;

exit
