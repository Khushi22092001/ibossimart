set pagesize 200
set linesize 200
connect -name IMART

select column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_PAGE_PLUGS'
   and (upper(column_name) like '%GRID%'
        or upper(column_name) like '%DISPLAY%'
        or upper(column_name) like '%PARENT%'
        or upper(column_name) like '%SEQUENCE%')
 order by column_id;

exit
