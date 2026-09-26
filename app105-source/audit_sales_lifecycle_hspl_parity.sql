whenever sqlerror exit failure rollback
set define off
connect -name IMART
set pages 500 lines 260 long 100000 trimspool on
column region_name format a45
column source_type format a32
column page_name format a45
column page_alias format a38
column object_name format a42
column column_name format a36

prompt === App 105 Page 721 regions ===
select display_sequence, region_name, source_type, static_id
  from apex_application_page_regions
 where application_id = 105
   and page_id = 721
 order by display_sequence, region_id;

prompt === App 105 SLC-related pages ===
select page_id, page_name, page_alias
  from apex_application_pages
 where application_id = 105
   and (upper(page_name) like '%SALES%'
     or upper(page_name) like '%VEHICLE%'
     or upper(page_name) like '%CATEGORY%'
     or upper(page_name) like '%CUSTOMER%'
     or upper(page_name) like '%CREDIT%'
     or upper(page_name) like '%COLLECTION%'
     or upper(page_name) like '%WEIGH%'
     or upper(page_name) like '%DISPATCH%')
 order by page_id;

prompt === Candidate IMART tables/views ===
select owner, object_name, object_type
  from all_objects
 where owner = user
   and object_type in ('TABLE','VIEW','MATERIALIZED VIEW')
   and (upper(object_name) like '%SALE%'
     or upper(object_name) like '%CONFIRM%'
     or upper(object_name) like '%CREDIT%'
     or upper(object_name) like '%COLLECT%'
     or upper(object_name) like '%RECEIPT%'
     or upper(object_name) like '%CUSTOMER%'
     or upper(object_name) like '%PARTY%'
     or upper(object_name) like '%VEHICLE%'
     or upper(object_name) like '%WEIGH%')
 order by object_type, object_name;

prompt === Candidate columns in likely business objects ===
select table_name object_name, column_id, column_name, data_type
  from user_tab_columns
 where (upper(table_name) like '%SALE%'
     or upper(table_name) like '%CREDIT%'
     or upper(table_name) like '%PARTY%'
     or upper(table_name) like '%CUSTOMER%'
     or upper(table_name) like '%RECEIPT%')
   and (upper(column_name) like '%LIMIT%'
     or upper(column_name) like '%CREDIT%'
     or upper(column_name) like '%BALANCE%'
     or upper(column_name) like '%PARTY%'
     or upper(column_name) like '%CUSTOMER%'
     or upper(column_name) like '%DATE%'
     or upper(column_name) like '%AMOUNT%'
     or upper(column_name) like '%TNO%')
 order by table_name, column_id;

exit
