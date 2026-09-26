whenever sqlerror exit failure rollback
set define off
connect -name IMART
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00904.sql"
commit;
exit
