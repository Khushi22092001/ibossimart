whenever sqlerror exit sql.sqlcode rollback
set pagesize 100
set linesize 300
set long 4000
connect -name IMART

select da.id as action_id,
       da.event_id,
       da.action,
       da.attributes as javascript_code
  from apex_260100.wwv_flow_page_da_actions da
  join apex_260100.wwv_flow_page_da_events de
    on de.id = da.event_id
 where da.flow_id = 105
   and da.page_id = 708
   and de.page_id = 708
   and de.triggering_button_id = 40521193095907066
 order by da.action_sequence;

exit
