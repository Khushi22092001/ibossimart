whenever sqlerror exit failure rollback
set define off
connect -name IMART

prompt Restoring Global Search state from before the 180ms speed change
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\backups\global-search-before-180ms-20260925\page_00000_1.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\backups\global-search-before-180ms-20260925\imart_module_search_1.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\backups\global-search-before-180ms-20260925\transaction_search_1.sql"

commit;
exit
