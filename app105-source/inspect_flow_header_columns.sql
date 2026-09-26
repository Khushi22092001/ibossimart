whenever sqlerror exit sql.sqlcode rollback
set define off
set pages 1000
set lines 300
connect -name IMART
select column_id, column_name, data_type
  from all_tab_columns
 where owner='APEX_260100'
   and table_name='WWV_FLOWS'
   and (
        lower(column_name) like '%javascript%'
     or lower(column_name) like '%header%'
     or lower(column_name) like '%body%'
     or lower(column_name) like '%html%'
     or lower(column_name) like '%navigation%'
     or lower(column_name) like '%template%'
   )
 order by column_id;
exit
