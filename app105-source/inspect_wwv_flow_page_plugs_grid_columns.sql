set pagesize 100
set linesize 200
connect -name IMART

select column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_PAGE_PLUGS'
   and (column_name like '%GRID%' or column_name like '%COLUMN%' or column_name like '%NEW%ROW%' or column_name in ('ID', 'PAGE_ID', 'NAME'))
 order by column_id;
