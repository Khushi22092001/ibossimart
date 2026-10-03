whenever sqlerror exit sql.sqlcode rollback
set define off
set feedback off
set heading on
set pagesize 0
set linesize 32767
set trimspool on
set sqlformat csv

connect -name IMART

spool app105-source/master-insights-plan/existing_analytics_columns.csv
select table_name,
       column_id,
       column_name,
       data_type,
       data_length
  from user_tab_columns
 where table_name in (
       'BI_RECEIVABLE','BI_SALES_AGENT','PCC_PURCHASEORDER',
       'PCC_PURCHASEBILL','PCC_FREIGHTADVICE','PENDINGBILLS',
       'V_STOCKCARD','STOCKCARD','V_DASHBOARD_SALES_SUMMARY',
       'V_LATEST_ACTIVE_SALESORDERS','V_LATEST_PURCHASE_ORDERS',
       'SLC_SALESORDER','SLC_SALESCONFIRM','SLC_SCBALANCE'
   )
 order by table_name, column_id;
spool off

spool app105-source/master-insights-plan/existing_analytics_views.csv
select view_name,
       text_vc view_sql
  from user_views
 where view_name in (
       'BI_RECEIVABLE','BI_SALES_AGENT','PCC_PURCHASEORDER',
       'PCC_PURCHASEBILL','PCC_FREIGHTADVICE','PENDINGBILLS',
       'V_STOCKCARD','STOCKCARD','V_DASHBOARD_SALES_SUMMARY',
       'V_LATEST_ACTIVE_SALESORDERS','V_LATEST_PURCHASE_ORDERS',
       'SLC_SALESORDER','SLC_SALESCONFIRM','SLC_SCBALANCE'
   )
 order by view_name;
spool off

spool app105-source/master-insights-plan/existing_360_source.csv
select name, type, line, text
  from user_source
 where name in (
       'D_PREPAREPURCHASEORDERFORSUPPLIER360VIEW',
       'D_PREPARESALESORDERFORCUSTOMER360VIEW',
       'GETPENDINGPOQUANTITY1','GETPENDINGPOQUANTITY2',
       'GETPENDINGSOQUANTITY1','GETPENDINGORDERVALUE',
       'APEX_GETPENDINGAMOUNT'
   )
 order by name, type, line;
spool off

spool app105-source/master-insights-plan/apex_analytics_regions.csv
select p.page_id,
       s.name page_name,
       s.alias page_alias,
       p.id region_id,
       p.plug_name region_name,
       p.static_id region_static_id,
       p.plug_source_type,
       p.query_table,
       dbms_lob.substr(p.plug_source, 3900, 1) region_source_01,
       dbms_lob.substr(p.plug_source, 3900, 3901) region_source_02,
       dbms_lob.substr(p.plug_source, 3900, 7801) region_source_03,
       dbms_lob.substr(p.plug_source, 3900, 11701) region_source_04
  from apex_260100.wwv_flow_page_plugs p
  join apex_260100.wwv_flow_steps s
    on s.flow_id = p.flow_id
   and s.id = p.page_id
 where p.flow_id = 105
   and p.page_id in (
       10,11,103,117,118,127,128,141,142,143,144,145,146,
       160,161,170,171,174,175,210,260,281,283,291,298,
       327,329,362,376,378,379,384,388,403,404,407,
       519,722,723,929,934,937,939,941
   )
   and p.plug_source is not null
 order by p.page_id, p.plug_display_sequence, p.id;
spool off

exit
