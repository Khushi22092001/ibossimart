whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on pagesize 100 linesize 260 long 5000
connect -name IMART

prompt === Enquiry indent selector buttons ===
select id, button_name, button_image_alt, button_sequence
  from apex_260100.wwv_flow_step_buttons
 where flow_id = 105
   and security_group_id = 4744311978888504
   and flow_step_id = 708
   and id in (40543521212907076,999708001000000001)
 order by button_sequence;

prompt === Separate all-indent action ===
select e.id event_id, e.name event_name, e.bind_event_type,
       a.id action_id, nvl(a.name,a.action) action_name, a.action
  from apex_260100.wwv_flow_page_da_events e
  join apex_260100.wwv_flow_page_da_actions a on a.event_id = e.id
 where e.flow_id = 105
   and e.security_group_id = 4744311978888504
   and e.page_id = 708
   and e.id = 999708001000000002
 order by a.action_sequence;

exit
