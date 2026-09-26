whenever sqlerror exit failure rollback
connect -name IMART

set long 10000

select page_id, region_name, name, item_type, static_id, group_id, use_group_for,
       stretch, item_width, item_height, item_css_classes, item_attributes,
       is_required, max_length, lov_type, lov_display_extra, lov_display_null,
       lov_cascade_parent_items, attributes
  from apex_260100.apex_appl_page_ig_columns
 where application_id = 105
   and ((page_id = 81 and name = 'COMPANYCODE')
     or (page_id = 171 and name = 'ITEMCODE'))
 order by page_id;

exit
