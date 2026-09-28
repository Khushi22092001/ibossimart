whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set define off
set echo off
set feedback off
set heading off
set pagesize 0
set linesize 32767
set long 10000000
set longchunksize 10000000
set trimspool on
spool C:/Users/shree/Documents/git_projects_temp_cscollection_before.sql
select dbms_metadata.get_ddl('PROCEDURE','CSCOLLECTION') from dual;
spool off
exit
