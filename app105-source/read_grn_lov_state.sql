connect -name IMART
set pagesize 100
set linesize 240
column application_alias format a50
column application_name format a35
select application_id, application_alias, application_name
  from apex_applications
 where application_id in (100, 105)
 order by application_id;

column item_name format a28
column display_as format a24
column lov_named_lov format a28
column lov_cascade_parent_items format a70
column ajax_items_to_submit format a80
select item_name,
       display_as,
       lov_named_lov,
       lov_cascade_parent_items,
       ajax_items_to_submit
  from apex_application_page_items
 where application_id = 105
   and page_id = 146
   and item_name in ('P146_MATERIALINTNO', 'P146_LOADINGADVICETNO')
 order by item_name;
exit
