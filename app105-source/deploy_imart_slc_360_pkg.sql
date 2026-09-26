whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\imart_slc_360_pkg.sql"
select object_name, status from user_objects where object_name='IMART_SLC_360';
select line, position, text from user_errors where name='IMART_SLC_360' order by sequence;
exit
