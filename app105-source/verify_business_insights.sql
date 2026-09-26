whenever sqlerror exit failure rollback
set define off
connect -name IMART
set pagesize 100 linesize 240

prompt === Business Insights page ===
select application_id, page_id, page_name, page_alias
  from apex_application_pages
 where application_id = 105 and page_id = 901;

prompt === Dashboard menu entry ===
select list_name, entry_text, display_sequence, entry_target
  from apex_application_list_entries
 where application_id = 105 and list_name = 'Dashboard'
 order by display_sequence;

prompt === Business Insights cards ===
select list_name, entry_text, display_sequence, entry_image
  from apex_application_list_entries
 where application_id = 105 and list_name = 'Business Insights'
 order by display_sequence;

prompt === Page region ===
select page_id, region_name, source_type, display_sequence
  from apex_application_page_regions
 where application_id = 105 and page_id = 901;
exit
