set pagesize 200
set linesize 220
connect -name IMART

select column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_STEPS'
   and (column_name like '%JAVASCRIPT%' or column_name like '%CSS%')
 order by column_id;

exit
