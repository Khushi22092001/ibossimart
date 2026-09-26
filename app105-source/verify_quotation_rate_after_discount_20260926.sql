whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 100 linesize 220
column region_name format a35
column name format a30
column item_type format a25
select page_id, region_name, name, item_type, is_visible
  from apex_260100.apex_appl_page_ig_columns
 where application_id = 105
   and page_id = 710
   and upper(name) = 'RATEAFTERDISCOUNT';
exit
