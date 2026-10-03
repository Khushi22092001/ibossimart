set sqlformat csv
set pagesize 5000
connect -name IMART
select object_name,argument_name,position,data_type from all_arguments where owner='APEX_260100' and package_name='WWV_FLOW_IMP_PAGE' and object_name in ('SET_PAGE','CREATE_PAGE_PLUG','CREATE_PAGE_BUTTON') and (position<8 or argument_name like '%CONDITION%' or argument_name like '%CATTR%') order by object_name,sequence;
select name,text from all_source where owner='APEX_260100' and name in ('WWV_FLOW_IMP','WWV_FLOW_IMP_PAGE') and type='PACKAGE' and lower(text) like '%g_page%';
select column_name from all_tab_columns where owner='APEX_260100' and table_name='WWV_FLOW_WORKSHEET_COLUMNS' and column_name in ('PAGE_ID','FLOW_ID','DB_COLUMN_NAME');
exit
