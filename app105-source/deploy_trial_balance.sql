whenever sqlerror exit failure rollback
set define off
connect -name IMART

prompt Installing Trial Balance Intelligence page 902
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00902.sql"

prompt Linking the Accounts insight card to page 902
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\shared_components\navigation\lists\business_insights.sql"

commit;
exit
