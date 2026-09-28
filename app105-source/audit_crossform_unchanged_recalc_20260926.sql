whenever sqlerror exit sql.sqlcode rollback
set pagesize 500 linesize 280 long 100000 feedback on verify off

prompt === FOCUS/KEY-BASED DETAIL EVENTS ON TARGET FORMS ===
select page_id,
       id event_id,
       name,
       bind_event_type,
       bind_event_type_custom,
       bind_type,
       bind_event_type,
       nvl(display_when_type,'ACTIVE') status
from apex_260100.wwv_flow_page_da_events
where flow_id=105
  and page_id in (69,108,118,140,143,146,152,155)
  and nvl(display_when_type,'ACTIVE') <> 'NEVER'
  and lower(nvl(bind_event_type,'-')) in ('focusout','blur','keyup','keydown','keypress')
order by page_id, name;

prompt === CALCULATION-LIKE EVENTS (ALL TRIGGERS) ===
select page_id,
       id event_id,
       name,
       bind_event_type,
       nvl(display_when_type,'ACTIVE') status
from apex_260100.wwv_flow_page_da_events
where flow_id=105
  and page_id in (69,108,118,140,143,146,152,155)
  and nvl(display_when_type,'ACTIVE') <> 'NEVER'
  and regexp_like(lower(name),'amount|rate|quantity|qty|balance|total|footer|unit|tax|discount')
order by page_id, name;

exit
