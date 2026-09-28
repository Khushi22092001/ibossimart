set pagesize 100
set linesize 240
connect -name IMART

column plug_name format a32
column has_compact_js format a3
column has_compact_css format a3

prompt === Purchase Order General order ===
select plug_name,
       plug_display_sequence,
       plug_new_grid_row
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 118
   and security_group_id = 4744311978888504
   and plug_name in (
     'Currency', 'Select Indent', 'Texts', 'GST In Nature And Transaction',
     'Other Informations', 'PO Amendment Detail'
   )
 order by plug_display_sequence;

prompt === Page 118 compact-layout markers ===
select case when dbms_lob.instr(javascript_code_onload, 'HSPL_P118_COMPACT_GENERAL_V1') > 0 then 'YES' else 'NO' end as has_compact_js,
       case when dbms_lob.instr(inline_css, 'HSPL_P118_COMPACT_GENERAL_V1') > 0 then 'YES' else 'NO' end as has_compact_css
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 118
   and security_group_id = 4744311978888504;

exit
