set pagesize 500
set linesize 240
connect -name IMART

select owner, package_name, object_name, overload, position, argument_name, data_type
  from all_arguments
 where package_name = 'WWV_FLOW_IMP_PAGE'
   and object_name = 'CREATE_PAGE_DA_EVENT'
 order by owner, overload, sequence;

select table_name, column_name
  from all_tab_columns
 where table_name like 'APEX%PAGE%DA%'
 order by table_name, column_id;

exit
