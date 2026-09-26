set heading off feedback off pagesize 0 verify off echo off
connect -name IMART
select count(*) from apex_applications where application_id = 99910;
exit
