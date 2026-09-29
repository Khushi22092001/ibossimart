set pagesize 200
set linesize 220
connect -name IMART

select p.id,
       p.region_name,
       parent.region_name as parent_region,
       p.plug_display_sequence,
       p.plug_new_grid,
       p.plug_new_grid_row,
       p.plug_new_grid_column,
       p.plug_display_column,
       p.plug_grid_column_span
  from apex_260100.wwv_flow_page_plugs p
  left join apex_260100.wwv_flow_page_plugs parent
    on parent.id = p.parent_plug_id
 where p.flow_id = 105
   and p.page_id = 143
   and (p.region_name = 'Detail'
        or p.parent_plug_id in (
          select id
            from apex_260100.wwv_flow_page_plugs
           where flow_id = 105
             and page_id = 143
             and region_name = 'Detail'
        ));

select item_name,
       grid_column,
       grid_column_span,
       grid_label_column_span,
       begins_on_new_row
  from apex_260100.apex_application_page_items
 where application_id = 105
   and page_id = 143
   and item_name in (
     'P143_SUMOFAMOUNT', 'P143_SUMOFFOOTERAMOUNT',
     'P143_PURCHASEBILLAMOUNTBEFOREROUND', 'P143_ROUNDOFF',
     'P143_PURCHASEBILLAMOUNT'
   )
 order by item_name;

exit
