set pagesize 500
set linesize 220
connect -name IMART
select owner, package_name, object_name procedure_name, argument_name, position, data_type, in_out
  from all_arguments
 where owner = 'APEX_260100'
   and package_name in ('WWV_FLOW_IMP_PAGE','WWV_FLOW_API')
   and (object_name like '%PAGE%' or object_name like '%REMOVE%')
 order by package_name, object_name, overload, sequence;
exit
