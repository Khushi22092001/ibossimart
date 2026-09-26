whenever sqlerror exit failure rollback
set define off
connect -name IMART

prompt Updating the live App 105 IronMart sidebar source
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\shared_components\navigation\lists\ironmart.sql"

commit;
exit
