set pagesize 200 linesize 220 feedback off heading on
select owner, package_name, object_name, overload, position, argument_name, data_type
  from all_arguments
 where argument_name = 'P_JAVASCRIPT_FILE_URLS'
 order by owner, package_name, object_name, overload, sequence;
exit
