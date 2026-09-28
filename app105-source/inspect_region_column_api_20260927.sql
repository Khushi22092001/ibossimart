whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 500 linesize 240 trimspool on
select argument_name, data_type, position
  from all_arguments
 where owner = 'APEX_260100'
   and package_name = 'WWV_FLOW_IMP_PAGE'
   and object_name = 'CREATE_REGION_COLUMN'
 order by overload, sequence;
exit
