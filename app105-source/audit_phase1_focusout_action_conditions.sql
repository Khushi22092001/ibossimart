whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on pagesize 300 linesize 320
connect -name IMART

column event_name format a48
column action format a32
column client_condition_type format a28
column client_condition_expression format a90

select e.page_id,e.id event_id,e.name event_name,a.id action_id,a.action,
       a.event_result,a.action_sequence,
       nvl(a.client_condition_type,'-') client_condition_type,
       a.client_condition_expression
  from apex_260100.wwv_flow_page_da_events e
  join apex_260100.wwv_flow_page_da_actions a
    on a.flow_id=e.flow_id and a.page_id=e.page_id
   and a.event_id=e.id and a.security_group_id=e.security_group_id
 where e.flow_id=105
   and e.security_group_id=4744311978888504
   and ((e.page_id=108 and e.id in (
          38655220772424864,38674434078424870,38675385466424870,38676216658424870,
          38677161981424870,38678094661424870,38679011173424871,38679837553424871,
          38685015215424872,38685850495424873,38686755567424873,38689496568424874,
          38693986569424875,38695799794424875,38697214257424876,38698059739424876))
     or (e.page_id=710 and e.id in (
          41132957840923805,41134401336923805,41135242887923806,
          41168016454923814,41169860550923814,41173922492923815)))
 order by e.page_id,e.event_sequence,a.event_result,a.action_sequence,a.id;

exit
