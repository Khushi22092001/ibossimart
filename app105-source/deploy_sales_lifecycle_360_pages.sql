whenever sqlerror exit sql.sqlcode rollback
set define off
set verify off
set serveroutput on
connect -name IMART

@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\imart_slc_360_pkg.sql"

begin
  apex_application_install.set_application_id(105);
  apex_application_install.generate_offset;
end;
/

@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\sales_lifecycle_360_pages.sql"

commit;
prompt SALES_LIFECYCLE_360_PAGES_DEPLOYED
exit
