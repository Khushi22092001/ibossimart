whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on pagesize 1000 linesize 320 long 5000
connect -name IMART
column page_name format a34
column region_name format a38
column name format a14
column item_type format a28
column heading format a18

select c.page_id, c.page_name, c.region_id, c.region_name,
       c.column_id, c.name, c.item_type, c.is_visible column_visible,
       c.heading, c.enable_hide,
       listagg(distinct nvl(r.is_visible,'NULL'), ',') within group (order by nvl(r.is_visible,'NULL')) report_visible
  from apex_260100.apex_appl_page_ig_columns c
  left join apex_260100.apex_appl_page_ig_rpt_columns r
    on r.application_id = c.application_id
   and r.page_id = c.page_id
   and r.region_id = c.region_id
   and r.column_id = c.column_id
 where c.application_id = 105
   and upper(c.name) in ('TNO','SNO')
 group by c.page_id, c.page_name, c.region_id, c.region_name,
          c.column_id, c.name, c.item_type, c.is_visible,
          c.heading, c.enable_hide
 order by c.page_id, c.region_id, c.name;

exit
