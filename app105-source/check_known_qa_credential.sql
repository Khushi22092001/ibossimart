set heading off feedback off pagesize 0
connect -name IMART
select case when validatebossuser('boss','webboss123') then 'MATCH' else 'NO_MATCH' end from dual;
exit
