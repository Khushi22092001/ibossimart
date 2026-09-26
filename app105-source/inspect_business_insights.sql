whenever sqlerror exit failure rollback
set define off
connect -name IMART
set pagesize 200 linesize 260 trimspool on
column page_name format a35
column page_alias format a30
column list_name format a30
column entry_text format a35
column entry_target format a90

prompt === Pages 500 and available 900-series ===
select application_id, page_id, page_name, page_alias
  from apex_application_pages
 where application_id = 105
   and (page_id = 500 or page_id between 900 and 920)
 order by page_id;

prompt === Dashboard list entries ===
select application_id, list_name, entry_text, display_sequence, entry_target
  from apex_application_list_entries
 where application_id = 105
   and upper(list_name) like 'DASHBOARD%'
 order by list_name, display_sequence;

prompt === Component IDs ===
select list_name, list_id
  from apex_application_lists
 where application_id = 105
   and list_name in ('Dashboard','Dashboard Portlet View');

prompt === Page 500 region metadata ===
select page_id, region_id, region_name, region_type, source_type, display_sequence
  from apex_application_page_regions
 where application_id = 105 and page_id = 500
 order by display_sequence;
exit
