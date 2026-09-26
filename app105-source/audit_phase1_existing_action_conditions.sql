whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on pagesize 100 linesize 300
connect -name IMART

column client_condition_type format a24
column client_condition_element format a50
column client_condition_expression format a80

select page_id,id,event_id,action,client_condition_type,
       client_condition_element,client_condition_expression
  from apex_260100.wwv_flow_page_da_actions
 where flow_id=105
   and security_group_id=4744311978888504
   and id in (38677667579424870,38685440064424873,38687277287424873)
 order by page_id,id;

exit
