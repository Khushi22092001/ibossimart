whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlformat csv
connect -name IMART
spool app105-source/verification/register-date-default-metadata-20261003.csv
select table_name,column_name from all_tab_columns where owner='APEX_260100' and table_name in('WWV_FLOW_STEP_ITEMS','APEX_APPLICATION_PAGE_ITEMS','WWV_FLOW_STEP_COMPUTATIONS') and (column_name like '%DEFAULT%' or column_name like '%SOURCE%' or column_name like '%COMPUT%' or column_name in('ITEM_NAME','ITEM_SEQUENCE','ITEM_TYPE','PAGE_ID','FLOW_STEP_ID','ID','NAME','PLUG_ID','USE_CACHE_BEFORE_DEFAULT','SOURCE_USED')) order by table_name,column_id;
select i.id,i.flow_step_id page_id,s.name page_name,i.name,i.item_default,i.item_default_type,i.source,i.source_type,i.use_cache_before_default,i.format_mask from apex_260100.wwv_flow_step_items i join apex_260100.wwv_flow_steps s on s.flow_id=i.flow_id and s.id=i.flow_step_id where i.flow_id=105 and regexp_like(i.name,'^P[0-9]+_(FROM_?DATE|TO_?DATE)$') order by i.flow_step_id,i.name;
select flow_step_id page_id,computation_item,computation_point,computation_type,computation,compute_when_type,compute_when from apex_260100.wwv_flow_step_computations where flow_id=105 and regexp_like(computation_item,'^P[0-9]+_(FROM_?DATE|TO_?DATE)$') order by flow_step_id;
spool off
exit
