set pages 200
set lines 240
set long 20000
set longchunksize 20000

select column_name, data_type
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_PAGE_DA_ACTIONS'
   and (column_name in ('ID','FLOW_ID','FLOW_STEP_ID','EVENT_ID','ACTION','ACTION_SEQUENCE')
        or column_name like '%CODE%'
        or column_name like '%ATTRIBUTE%'
        or column_name like 'AFFECTED%')
 order by column_id;

select id, event_id, action_sequence, action,
       affected_elements_type, affected_region_id,
       attribute_01, attribute_02, attribute_03,
       substr(attributes,1,4000) attributes
  from apex_260100.wwv_flow_page_da_actions
 where flow_id = 105
   and id = 38671413895424869;

exit
