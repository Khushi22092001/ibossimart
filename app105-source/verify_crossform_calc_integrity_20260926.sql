whenever sqlerror exit sql.sqlcode rollback
set pagesize 300 linesize 260 long 100000 serveroutput on size unlimited feedback on verify off

prompt === DEPLOYED PAGES (PURCHASE QUOTATION 710 MUST NOT APPEAR) ===
select id page_id, name page_name,
       case when dbms_lob.instr(javascript_code,'HSPL_CROSSFORM_DETAIL_INTEGRITY_V1') > 0
                  or dbms_lob.instr(javascript_code_onload,'HSPL_CROSSFORM_DETAIL_INTEGRITY_V1') > 0
            then 'YES' else 'NO' end integrity_marker
from apex_260100.wwv_flow_steps
where flow_id=105 and id in (69,108,118,140,143,146,152,155,710)
order by id;

prompt === SAVE-TIME CALCULATION GUARDS ===
select flow_step_id page_id, process_sequence, process_name, process_when
from apex_260100.wwv_flow_step_processing
where flow_id=105
  and process_name in (
    'Verify Purchase Order calculations before commit',
    'Verify Purchase Bill calculations before commit',
    'Verify Purchase Bill Pass calculations before commit'
  )
order by flow_step_id;

declare
  l_cursor integer;
begin
  for r in (
    select flow_step_id page_id, process_name, process_sql_clob
    from apex_260100.wwv_flow_step_processing
    where flow_id=105
      and process_name in (
        'Verify Purchase Order calculations before commit',
        'Verify Purchase Bill calculations before commit',
        'Verify Purchase Bill Pass calculations before commit'
      )
    order by flow_step_id
  ) loop
    l_cursor:=dbms_sql.open_cursor;
    dbms_sql.parse(l_cursor,r.process_sql_clob,dbms_sql.native);
    dbms_sql.close_cursor(l_cursor);
    dbms_output.put_line('PAGE '||r.page_id||' SAVE_GUARD_PLSQL_PARSE=OK');
  end loop;
exception when others then
  if dbms_sql.is_open(l_cursor) then dbms_sql.close_cursor(l_cursor); end if;
  raise;
end;
/

prompt === PURCHASE ORDER FD ROW CONTEXT ===
select name, link_target
from apex_260100.wwv_flow_region_columns
where flow_id=105 and page_id=118 and name='FD';

select plug_name,
       case when instr(upper(plug_source),'WHERE TNO = :P118_TNO')>0 and instr(upper(plug_source),'SNO = :P118_SNO')>0 then 'ROW_FILTER_OK' else 'ROW_FILTER_MISSING' end fd_filter
from apex_260100.wwv_flow_page_plugs
where flow_id=105 and page_id=118 and plug_name='FooterDetail';

prompt === ACTUAL-CHANGE CALCULATION EVENTS ===
select page_id, name, bind_event_type, nvl(display_when_type,'ACTIVE') status
from apex_260100.wwv_flow_page_da_events
where flow_id=105
  and (
    (page_id=140 and name in ('Calculate Net Amount','calculate net amount','Calculate total amount','set amount_')) or
    (page_id=152 and name in ('set amount','set amount_1','set amount_2','set amount_3')) or
    (page_id=69 and name in ('Check Pending Qty','Set Balance','Set Quantity1','Set Quantity2','Set Units')) or
    (page_id=146 and name in ('Set Accepted Quantity1','Set amount','Set ReceivedQuantity1','Set ReceivedQuantity2','Set sum of qty1'))
  )
order by page_id, name;

prompt === PURCHASE QUOTATION UNTOUCHED MARKER CHECK ===
select id page_id,
       case when nvl(dbms_lob.instr(javascript_code,'HSPL_CROSSFORM_DETAIL_INTEGRITY_V1'),0)=0
                  and nvl(dbms_lob.instr(javascript_code_onload,'HSPL_CROSSFORM_DETAIL_INTEGRITY_V1'),0)=0
            then 'UNCHANGED_BY_CROSSFORM_DEPLOY' else 'ERROR_MARKER_FOUND' end quotation_status
from apex_260100.wwv_flow_steps
where flow_id=105 and id=710;

exit
