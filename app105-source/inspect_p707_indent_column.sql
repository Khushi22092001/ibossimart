set define off
whenever sqlerror exit sql.sqlcode rollback
connect -name IMART

set pagesize 100
set linesize 220
column db_column_name format a30
column column_html_expression format a120
select id,
       worksheet_id,
       db_column_name,
       column_html_expression
  from apex_260100.wwv_flow_worksheet_columns
 where flow_id = 105
   and page_id = 707
   and db_column_name = 'INDENTNO';
exit
