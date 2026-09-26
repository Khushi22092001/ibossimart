set pagesize 100
set linesize 260
connect -name IMART

select id,
       plug_name,
       plug_display_sequence,
       plug_source_type,
       plug_new_grid,
       plug_new_grid_row,
       plug_new_grid_column,
       plug_grid_column_span,
       plug_grid_row_css_classes,
       plug_grid_column_css_classes,
       plug_display_point
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 156
   and plug_name in ('Voucher', 'Voucher Detail', 'Cost Centre', 'Reference', 'Voucher Created Automatically')
 order by plug_display_sequence, id;

select case when dbms_lob.instr(nvl(inline_css, to_clob('')), 'WORKFLOW_LAYOUT_STANDARD_GAP_V1') > 0 then 'YES' else 'NO' end as standard_gap,
       dbms_lob.getlength(inline_css) as inline_css_length,
       dbms_lob.getlength(javascript_code) as javascript_length
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;

exit
