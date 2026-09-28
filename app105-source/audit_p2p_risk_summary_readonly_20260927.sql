whenever sqlerror exit sql.sqlcode rollback
set pagesize 300 linesize 280 feedback on verify off

prompt === CALCULATION RACE SUMMARY BY PAGE ===
with pages(page_id,page_name) as (
  select 108,'Indent' from dual union all
  select 708,'Purchase Enquiry' from dual union all
  select 712,'Comparative Statement' from dual union all
  select 118,'Purchase Order' from dual union all
  select 155,'Loading Advice' from dual union all
  select 69,'Material In' from dual union all
  select 146,'GRN' from dual union all
  select 143,'Purchase Bill' from dual union all
  select 152,'Purchase Bill Pass' from dual union all
  select 140,'Payment Advice' from dual
), calc_events as (
  select e.*
  from apex_260100.wwv_flow_page_da_events e
  where e.flow_id=105
    and e.page_id in (108,708,712,118,155,69,146,143,152,140)
    and nvl(e.display_when_type,'ACTIVE') <> 'NEVER'
    and regexp_like(lower(e.name),'amount|rate|quantity|qty|balance|total|footer|unit|tax|discount|currency')
), risks as (
  select e.page_id,
         count(distinct e.id) calc_events,
         count(distinct case when lower(nvl(e.bind_event_type,'-')) in ('focusout','focusin','blur','keyup','keydown','keypress') then e.id end) focus_calc_events,
         sum(case when a.action in ('NATIVE_EXECUTE_PLSQL_CODE','NATIVE_SET_VALUE') and nvl(a.wait_for_result,'N')<>'Y' then 1 else 0 end) async_no_wait,
         sum(case when a.action in ('NATIVE_EXECUTE_PLSQL_CODE','NATIVE_SET_VALUE') and nvl(a.stop_execution_on_error,'N')<>'Y' then 1 else 0 end) no_stop_on_error,
         sum(case when regexp_like(dbms_lob.substr(a.attributes,4000,1),'(^|[[:space:]'';])commit[[:space:]]*;','i') then 1 else 0 end) cell_commits,
         sum(case when dbms_lob.instr(lower(a.attributes),'settimeout')>0 then 1 else 0 end) fixed_timers
  from calc_events e
  join apex_260100.wwv_flow_page_da_actions a on a.event_id=e.id
  group by e.page_id
)
select p.page_id,p.page_name,
       nvl(r.calc_events,0) calc_events,
       nvl(r.focus_calc_events,0) focus_calc_events,
       nvl(r.async_no_wait,0) async_no_wait,
       nvl(r.no_stop_on_error,0) no_stop_on_error,
       nvl(r.cell_commits,0) cell_commits,
       nvl(r.fixed_timers,0) fixed_timers
from pages p left join risks r on r.page_id=p.page_id
order by case p.page_id when 108 then 1 when 708 then 2 when 712 then 3 when 118 then 4 when 155 then 5 when 69 then 6 when 146 then 7 when 143 then 8 when 152 then 9 when 140 then 10 end;

prompt === FOCUS CALC EVENTS: CLASSIFY HEADER/UI VS DETAIL ===
select page_id,name,bind_event_type,triggering_element_type,triggering_element
from apex_260100.wwv_flow_page_da_events
where flow_id=105
  and page_id in (108,708,712,118,155,69,146,143,152,140)
  and nvl(display_when_type,'ACTIVE') <> 'NEVER'
  and lower(nvl(bind_event_type,'-')) in ('focusout','focusin','blur','keyup','keydown','keypress')
  and regexp_like(lower(name),'amount|rate|quantity|qty|balance|total|footer|unit|tax|discount|currency')
order by page_id,name;

prompt === FD NEW-ROW HANDLER / ROW FILTER CHECK ===
select s.id page_id,
       case s.id when 118 then case when dbms_lob.instr(s.javascript_code_onload,'hsplP118OpenFd')>0 or dbms_lob.instr(s.javascript_code,'hsplP118OpenFd')>0 then 'YES' else 'NO' end
                 when 143 then case when dbms_lob.instr(s.javascript_code,'hsplP143OpenFd')>0 then 'YES' else 'NO' end
                 when 152 then case when dbms_lob.instr(s.javascript_code,'hsplP152OpenFd')>0 then 'YES' else 'NO' end end clicked_row_handler,
       case when exists (
         select 1 from apex_260100.wwv_flow_page_plugs p
         where p.flow_id=105 and p.page_id=s.id and regexp_like(lower(p.plug_name),'footer')
           and dbms_lob.instr(upper(p.plug_source),'TNO')>0
           and dbms_lob.instr(upper(p.plug_source),'SNO')>0
           and dbms_lob.instr(upper(p.plug_source),'WHERE')>0
       ) then 'YES' else 'NO' end tno_sno_filter
from apex_260100.wwv_flow_steps s
where s.flow_id=105 and s.id in (118,143,152)
order by s.id;

prompt === VISIBLE TECHNICAL KEY COLUMNS ===
select c.page_id,p.plug_name,c.name,c.item_type,c.is_visible
from apex_260100.wwv_flow_region_columns c
join apex_260100.wwv_flow_page_plugs p on p.id=c.region_id
where c.flow_id=105
  and c.page_id in (108,708,712,118,155,69,146,143,152,140)
  and upper(c.name) in ('TNO','SNO')
  and nvl(c.is_visible,'N')='Y'
order by c.page_id,p.plug_name,c.name;

prompt === QUOTATION EXCLUSION ===
select id page_id,
       case when nvl(dbms_lob.instr(javascript_code,'HSPL_CROSSFORM_DETAIL_INTEGRITY_V1'),0)=0
                  and nvl(dbms_lob.instr(javascript_code_onload,'HSPL_CROSSFORM_DETAIL_INTEGRITY_V1'),0)=0
            then 'UNCHANGED' else 'MARKER_PRESENT' end status
from apex_260100.wwv_flow_steps where flow_id=105 and id=710;

exit
