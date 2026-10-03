whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback off pagesize 500 linesize 32767 trimspool on
connect -name IMART

prompt === PURCHASE TRANSACTION FORM PAGES ===
select s.id page_id, s.name page_name, s.alias page_alias
  from apex_260100.wwv_flow_steps s
 where s.flow_id = 105
   and s.security_group_id = 4744311978888504
   and regexp_like(s.name,
       '^(Indent|Purchase Enquiry|Purchase Quotation|Comparative Statement|Rate Contract|Purchase Order|PO Amendment|Loading Advice|Weighment|Material In|GRN|Purchase Bill|Purchase Bill Pass|M[.]R[.]N[.])$',
       'i')
 order by s.id;

prompt === PAGE ITEM VIEW LAYOUT COLUMNS ===
select column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'APEX_APPLICATION_PAGE_ITEMS'
   and column_name in (
       'APPLICATION_ID','PAGE_ID','REGION_ID','REGION','ITEM_NAME','DISPLAY_SEQUENCE',
       'BEGIN_ON_NEW_ROW','BEGIN_ON_NEW_COLUMN','COLUMN_SPAN','GRID_COLUMN','LABEL','CONDITION_TYPE')
 order by column_id;

prompt === STATIC REGIONS WITH ONE TO SIX ITEMS ===
select p.page_id,
       s.name page_name,
       p.id region_id,
       p.plug_name region_name,
       p.region_name static_id,
       count(i.item_name) item_count,
       listagg(i.item_name || '[c' || nvl(to_char(i.grid_column), '-') || '/s' || nvl(to_char(i.column_span), '-') || ']', ', ')
         within group(order by i.display_sequence) items
  from apex_260100.wwv_flow_page_plugs p
  join apex_260100.wwv_flow_steps s
    on s.flow_id = p.flow_id
   and s.id = p.page_id
  join apex_application_page_items i
    on i.application_id = p.flow_id
   and i.page_id = p.page_id
   and i.region_id = p.id
 where p.flow_id = 105
   and p.security_group_id = 4744311978888504
   and p.plug_source_type = 'NATIVE_STATIC'
   and regexp_like(s.name,
       '^(Indent|Purchase Enquiry|Purchase Quotation|Comparative Statement|Rate Contract|Purchase Order|PO Amendment|Loading Advice|Weighment|Material In|GRN|Purchase Bill|Purchase Bill Pass|M[.]R[.]N[.])$',
       'i')
 group by p.page_id, s.name, p.id, p.plug_name, p.region_name
having count(i.item_name) between 1 and 6
 order by p.page_id, p.id;

exit
