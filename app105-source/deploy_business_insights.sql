whenever sqlerror exit failure rollback
set define off
connect -name IMART

prompt Installing Business Insights shared list
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\shared_components\navigation\lists\business_insights.sql"

prompt Updating Dashboard list with Business Insights
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\shared_components\navigation\lists\dashboard.sql"

prompt Installing Business Insights page 901
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00901.sql"

commit;
exit
