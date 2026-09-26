set pagesize 500 linesize 240 trimspool on feedback off verify off heading on
column owner format a20
column object_name format a35
column procedure_name format a45

select owner, object_name, procedure_name
  from all_procedures
 where owner = 'APEX_260100'
   and object_name in ('WWV_FLOW_IMP_PAGE','WWV_FLOW_API')
   and (upper(procedure_name) like '%BUTTON%'
        or upper(procedure_name) like '%COMPONENT%'
        or upper(procedure_name) like '%CACHE%')
 order by object_name, procedure_name;

select owner, package_name, object_name as procedure_name,
       argument_name, position, data_type, in_out
  from all_arguments
 where owner = 'APEX_260100'
   and package_name in ('WWV_FLOW_IMP_PAGE','WWV_FLOW_API')
   and (upper(object_name) like '%BUTTON%'
        or upper(object_name) like '%COMPONENT%'
        or upper(object_name) like '%CACHE%')
 order by package_name, object_name, sequence;

exit
