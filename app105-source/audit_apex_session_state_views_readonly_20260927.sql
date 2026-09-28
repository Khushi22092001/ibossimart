whenever sqlerror exit sql.sqlcode rollback
set pagesize 100 linesize 220 feedback off verify off

select owner, table_name
  from all_tables
 where upper(table_name) like '%SESSION%'
   and (upper(owner) like 'APEX%' or upper(owner)='IMART')
 order by owner, table_name;

select owner, view_name
  from all_views
 where upper(view_name) like '%SESSION%'
   and (upper(owner) like 'APEX%' or upper(owner)='IMART')
 order by owner, view_name;

exit
