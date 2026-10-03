whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 100
set linesize 260
set long 12000
connect -name IMART

select page_id,
       region_id,
       dbms_lob.substr(status_expression, 4000, 1) old_status_expression,
       dbms_lob.substr(recent_predicate, 2000, 1) old_recent_predicate,
       dbms_lob.substr(mine_predicate, 2000, 1) old_mine_predicate
  from imart_p2p_notcreated_cfg_bak
 order by page_id;

prompt === Existing transaction KPI config/cards ===
select page_id, region_id, region_label, dbms_lob.substr(classifier_sql, 4000, 1) classifier_sql
  from imart_tx_kpi_config
 order by page_id;

select page_id, seq, code, label, note
  from imart_tx_kpi_cards
 order by page_id, seq;

prompt === Inspection-like database objects/columns ===
select table_name, column_id, column_name, data_type
  from user_tab_columns
 where (table_name like '%INSPECT%' or column_name like '%INSPECT%')
 order by table_name, column_id;

exit
