set pagesize 200
set linesize 220
connect -name IMART

select argument_name, position, data_type, in_out, default_value
  from all_arguments
 where owner = 'APEX_260100'
   and package_name = 'WWV_FLOW_IMP_PAGE'
   and object_name = 'CREATE_PAGE_ITEM'
 order by sequence;

exit
