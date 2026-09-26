set serveroutput on
set pagesize 100
set linesize 240
connect -name IMART

prompt === APEX RELEASE ===
select version_no
  from apex_release;

prompt === APEX IMAGE PREFIX ===
begin
  dbms_output.put_line(apex_instance_admin.get_parameter('IMAGE_PREFIX'));
end;
/

prompt === ORDS-RELATED APEX INSTANCE PARAMETERS ===
select parameter_name, parameter_value
  from apex_instance_parameters
 where upper(parameter_name) like '%IMAGE%'
    or upper(parameter_name) like '%STATIC%'
 order by parameter_name;

exit
