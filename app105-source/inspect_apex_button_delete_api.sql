set pagesize 500 linesize 260 trimspool on feedback off verify off heading on
column owner format a15
column object_name format a40
column procedure_name format a55

select owner, object_name, procedure_name
  from all_procedures
 where owner = 'APEX_260100'
   and (upper(procedure_name) like '%DELETE%BUTTON%'
        or upper(procedure_name) like '%REMOVE%BUTTON%'
        or upper(procedure_name) like '%BUTTON%DELETE%'
        or upper(procedure_name) like '%BUTTON%REMOVE%')
 order by object_name, procedure_name;

exit
