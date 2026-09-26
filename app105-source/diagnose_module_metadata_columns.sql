whenever sqlerror exit sql.sqlcode rollback
set pagesize 200
set linesize 260
connect -name IMART

select column_id, column_name, data_type
  from all_tab_columns
 where owner = 'IMART'
   and table_name = 'MODULE'
 order by column_id;

exit
