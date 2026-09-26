set pagesize 100
set linesize 220
connect -name IMART
select flow_id, list_item_link_text, list_item_link_target, static_id
  from apex_260100.wwv_flow_list_items
 where flow_id = 105
   and static_id = 'home';
exit
