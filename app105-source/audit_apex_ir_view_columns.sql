set pagesize 300 linesize 220 trimspool on
connect -name IMART
select table_name,column_name
from all_tab_columns
where owner like 'APEX_%'
  and table_name in ('APEX_APPLICATION_PAGE_IR_COL','APEX_APPLICATION_PAGE_IR_RPT','APEX_APPLICATION_PAGE_RPT_COLS')
order by table_name,column_id;
exit
