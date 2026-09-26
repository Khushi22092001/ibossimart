set serveroutput on size unlimited
set pages 200
set lines 240
set trimspool on

select column_name, data_type
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_STEP_ITEMS'
   and (column_name like '%SOURCE%'
        or column_name like '%DEFAULT%'
        or column_name in ('ID','FLOW_ID','FLOW_STEP_ID','NAME','PLUG_ID'))
 order by column_id;

select id,
       flow_step_id,
       name,
       item_plug_id,
       source,
       source_type,
       use_cache_before_default,
       item_default,
       item_default_type
  from apex_260100.wwv_flow_step_items
 where flow_id = 105
   and name in ('P108_TNO','P108_FORMSTATUS','P108_ATTACHMENT_TNO',
                'P108_BIREPORTURL','P118_TNO','P118_FORMSTATUS')
 order by flow_step_id, name;

exit
