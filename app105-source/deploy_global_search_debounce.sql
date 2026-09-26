whenever sqlerror exit failure rollback
set define off
connect -name IMART

prompt Updating Page 0 Global Search with controlled 300ms debounce
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00000_1.sql"

prompt Updating Module Search permission query
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\shared_components\navigation\search_config\imart_module_search_1.sql"

prompt Updating Transaction Search permission query
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\shared_components\navigation\search_config\transaction_search_1.sql"

commit;
exit
