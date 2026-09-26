set long 200000
set pagesize 500
set linesize 220
connect -name IMART
select id, dbms_lob.getlength(inline_css) as css_length,
       dbms_lob.getlength(javascript_code_onload) as onload_length,
       last_updated_on
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 143 and security_group_id = 4744311978888504;

select plug_name, plug_new_grid_row, plug_new_grid_column, plug_display_column, plug_grid_column_span
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105 and page_id = 156
   and plug_name in ('Voucher', 'Voucher Detail', 'Voucher Created Automatically')
 order by plug_display_sequence;
exit
