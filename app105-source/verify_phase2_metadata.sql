whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on pagesize 100 linesize 240
connect -name IMART

prompt === Comparative Statement enquiry triggers ===
select page_id, id event_id, name, bind_event_type, triggering_element
  from apex_260100.wwv_flow_page_da_events
 where flow_id = 105
   and security_group_id = 4744311978888504
   and page_id = 712
   and id in (41256473709930957, 41261040277930959, 41261954176930959)
 order by event_sequence;

prompt === Purchase Order guarded calculation actions ===
select e.page_id, e.name event_name, a.id action_id,
       nvl(a.client_condition_type,'NONE') client_condition_type,
       a.client_condition_expression
  from apex_260100.wwv_flow_page_da_events e
  join apex_260100.wwv_flow_page_da_actions a on a.event_id = e.id
 where e.flow_id = 105
   and e.security_group_id = 4744311978888504
   and e.page_id = 118
   and a.id in (169392439963939436,169392997012939436,169434784590939455,
                169435787963939455,169435321455939455,169416155065939447,
                169410782383939444)
 order by e.event_sequence, a.action_sequence;

prompt === Loading Advice guarded quantity actions ===
select e.page_id, e.name event_name, a.id action_id,
       nvl(a.client_condition_type,'NONE') client_condition_type,
       a.client_condition_expression
  from apex_260100.wwv_flow_page_da_events e
  join apex_260100.wwv_flow_page_da_actions a on a.event_id = e.id
 where e.flow_id = 105
   and e.security_group_id = 4744311978888504
   and e.page_id = 155
   and a.id in (504252154641611502,298910182674175648,504251975427611501,
                504251265194611493,502722333458667386,502722564804667388,
                603659565181893066)
 order by e.event_sequence, a.action_sequence;

prompt === Item Master Rate UOM sample and fallback rule ===
select itemcode, measuringunitcode1 primary_uom, measuringunitcode2 secondary_uom,
       case when cast(null as varchar2(30)) = measuringunitcode2 then 'SECONDARY' else 'PRIMARY' end blank_uom_uses,
       case when measuringunitcode2 = measuringunitcode2 then 'SECONDARY' else 'PRIMARY' end explicit_secondary_uses
  from item
 where measuringunitcode1 is not null
 fetch first 5 rows only;

exit
