whenever sqlerror exit sql.sqlcode rollback
set pagesize 500
set linesize 300
set long 200000
set longchunksize 200000
connect -name IMART

/* Read-only audit. Use the application dictionary view because the internal
   WWV view is workspace-context sensitive in SQLcl. */
select column_id, column_name, data_type
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'APEX_APPL_PAGE_IG_COLUMNS'
 order by column_id;

/* Establish the actual Item fields on the two pages under comparison. */
select c.page_id, c.page_name, c.region_id, c.region_name,
       c.name, c.heading, c.item_type, c.item_width, c.item_height,
       c.static_id, c.html_dom_id, c.lov_type, c.lov_display_extra,
       c.read_only_condition_type
  from apex_260100.apex_appl_page_ig_columns c
 where c.application_id = 105
   and c.page_id in (171,708)
   and (upper(c.name) like '%ITEM%' or upper(c.heading) like '%ITEM%')
 order by c.page_id, c.region_id, c.display_sequence;

/* List every grid column whose user-facing heading or internal name represents
   an Item field. No changes are made. */
select c.page_id,
       c.page_name,
       c.region_name,
       c.region_id,
       c.name column_name,
       c.heading,
       c.item_type,
       c.item_width,
       c.item_height,
       c.html_dom_id,
       c.lov_type,
       c.lov_display_extra,
       c.read_only_condition_type
  from apex_260100.apex_appl_page_ig_columns c
 where c.application_id = 105
   and (upper(c.name) like '%ITEM%'
        or upper(c.heading) like '%ITEM%')
 order by c.page_id, c.region_name, c.display_sequence;

/* Compact risk inventory: editable Item-code Popup LOVs only.  A blank DOM ID
   does not by itself prove a defect, but it matches the P708 configuration and
   is therefore the visual-review cohort. */
select c.page_id,
       c.page_name,
       c.region_name,
       c.region_id,
       c.name,
       c.heading,
       c.html_dom_id,
       c.static_id column_static_id,
       c.item_width,
       c.item_height,
       c.read_only_condition_type,
       case when c.html_dom_id is null then 'REVIEW: DOM ID BLANK'
            else 'BASELINE: DOM ID SET' end review_status
  from apex_260100.apex_appl_page_ig_columns c
 where c.application_id = 105
   and c.name = 'ITEMCODE'
   and c.item_type = 'NATIVE_POPUP_LOV'
 order by case when c.html_dom_id is null then 0 else 1 end,
          c.page_id, c.region_name;

select column_id, column_name, data_type
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'APEX_APPL_PAGE_IGS'
 order by column_id;

exit
