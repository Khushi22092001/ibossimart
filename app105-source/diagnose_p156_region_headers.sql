set pagesize 100
set linesize 240
connect -name IMART

select column_name, data_type
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_PAGE_PLUGS'
   and (column_name like '%HEADER%'
        or column_name like '%TITLE%'
        or column_name like '%TEMPLATE%')
 order by column_id;

prompt === CURRENT VOUCHER REGION HEADERS ===
select id, plug_name, '[' || nvl(title, 'NULL') || ']' as title,
       '[' || nvl(plug_header, 'NULL') || ']' as plug_header,
       plug_template,
       region_template_options, component_template_options,
       plug_new_grid_row, plug_new_grid_column, plug_display_sequence,
       plug_display_column, plug_grid_column_span
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 156
   and security_group_id = 4744311978888504
   and plug_name in ('Voucher', 'Voucher Detail', 'Voucher Created Automatically')
 order by plug_display_sequence;

exit
