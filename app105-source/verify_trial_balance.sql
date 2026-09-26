connect -name IMART
set pagesize 200 linesize 240 trimspool on
column page_name format a36
column page_alias format a40
column region_name format a36
column item_name format a28
column list_entry_label format a32
column target format a70

prompt === page ===
select page_id,page_name,page_alias
  from apex_application_pages
 where application_id=105 and page_id=902;

prompt === regions ===
select display_sequence,region_name,source_type_code
  from apex_application_page_regions
 where application_id=105 and page_id=902
 order by display_sequence;

prompt === items ===
select display_sequence,item_name,display_as
  from apex_application_page_items
 where application_id=105 and page_id=902
 order by display_sequence;

prompt === forbidden dimension audit (must be zero) ===
select count(*) forbidden_item_count
  from apex_application_page_items
 where application_id=105 and page_id=902
   and upper(item_name) like '%PANEL%';

prompt === Accounts card target ===
select entry_text list_entry_label, entry_target target
  from apex_application_list_entries
 where application_id=105 and list_name='Business Insights' and entry_text='Accounts';
exit
