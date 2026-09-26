set pages 1000
set lines 200
select column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_PAGE_PLUGS'
   and (column_name like '%CSS%' or column_name like '%TEMPLATE%' or column_name like '%SOURCE%')
 order by column_id;

select plug_name, static_id, plug_template, plug_source_type
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 1;
exit
