set pagesize 1000 linesize 320 trimspool on feedback off verify off heading on long 5000 longchunksize 5000
column source_type format a24
column page_id format 99999
column component_id format 9999999999999999999999
column component_name format a36
column target_text format a170

select 'BUTTON_REDIRECT' source_type, flow_step_id page_id, id component_id,
       button_name component_name, button_redirect_url target_text
  from apex_260100.wwv_flow_step_buttons
 where flow_id = 105
   and security_group_id = 4744311978888504
   and (instr(button_redirect_url, ':63:') > 0 or instr(button_redirect_url, 'P63_') > 0)
union all
select 'WORKSHEET_DETAIL', page_id, id, 'WORKSHEET', detail_link
  from apex_260100.wwv_flow_worksheets
 where flow_id = 105
   and security_group_id = 4744311978888504
   and (instr(detail_link, ':63:') > 0 or instr(detail_link, 'P63_') > 0)
union all
select 'REGION_COLUMN_LINK', page_id, id, name, link_target
  from apex_260100.wwv_flow_region_columns
 where flow_id = 105
   and security_group_id = 4744311978888504
   and (instr(link_target, ':63:') > 0 or instr(link_target, 'P63_') > 0)
order by page_id, source_type, component_name;

select owner, table_name, column_name, data_type
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name in ('WWV_FLOW_PAGE_PLUGS','WWV_FLOW_REGION_COLUMNS')
   and column_name in ('PLUG_SOURCE','PLUG_SOURCE_CLOB','DEFAULT_EXPRESSION','LINK_TARGET')
 order by table_name, column_name;

exit
