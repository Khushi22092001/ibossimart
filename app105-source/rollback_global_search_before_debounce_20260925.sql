whenever sqlerror exit failure rollback
set define off
connect -name IMART

prompt Restoring Page 0 Global Search backup
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\backups\global-search-before-debounce-20260925\page_00000_1.sql"

prompt Restoring Module Search backup
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\backups\global-search-before-debounce-20260925\imart_module_search_1.sql"

prompt Restoring Transaction Search backup
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\backups\global-search-before-debounce-20260925\transaction_search_1.sql"

commit;
exit
