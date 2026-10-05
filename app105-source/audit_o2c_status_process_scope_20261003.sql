whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 1000
set linesize 320
set long 20000
set longchunksize 20000
connect -name IMART

prompt === O2C REGISTER PAGES ===
select id page_id,name,alias
  from apex_260100.wwv_flow_steps
 where flow_id=105
   and id in(154,160,170,174,190,273,701,704)
 order by id;

prompt === O2C REPORT REGIONS ===
select page_id,id region_id,plug_name,plug_source_type,static_id
  from apex_260100.wwv_flow_page_plugs
 where flow_id=105
   and page_id in(154,160,170,174,190,273,701,704)
   and (plug_source_type in('NATIVE_IR','NATIVE_IG') or regexp_like(plug_name,'report|register','i'))
 order by page_id,id;

prompt === GENERIC KPI CONFIG ===
select page_id,region_id,region_label,state,region_static_id,
       status_expression,process_expression,grain_label
  from imart_rkpi_config
 where page_id in(154,160,170,174,190,273,701,704)
 order by page_id,region_id;

prompt === TRANSACTION KPI CONFIG ===
select page_id,region_id,region_label,module_code
  from imart_tx_kpi_config
 where page_id in(154,160,170,174,190,273,701,704)
 order by page_id;

prompt === RELEVANT TABLE COLUMNS ===
select table_name,column_id,column_name,data_type
  from user_tab_columns
 where regexp_like(table_name,'^(SALESENQUIRY|SALESQUOTATION|PORECEIPT|SALESORDER|LOADINGADVICE|DESPATCHADVICE|CCINVOICE|BILLRECEIPT)(DETAIL|FOOTER)?$','i')
 order by table_name,column_id;

prompt === RELEVANT FOREIGN KEYS ===
select a.table_name,a.constraint_name,c.column_name,
       r.table_name referenced_table,rc.column_name referenced_column
  from user_constraints a
  join user_cons_columns c on c.constraint_name=a.constraint_name
  join user_constraints r on r.constraint_name=a.r_constraint_name
  join user_cons_columns rc on rc.constraint_name=r.constraint_name and rc.position=c.position
 where a.constraint_type='R'
   and regexp_like(a.table_name,'SALESENQUIRY|SALESQUOTATION|PORECEIPT|SALESORDER|LOADINGADVICE|DESPATCHADVICE|CCINVOICE|BILLRECEIPT','i')
 order by a.table_name,a.constraint_name,c.position;

exit
