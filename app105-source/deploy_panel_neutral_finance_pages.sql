whenever sqlerror exit failure rollback
set define off verify off
connect -name IMART

prompt Installing panel-neutral Trial Balance Analytics links
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00903.sql"

prompt Installing panel-neutral Accounts Receivable controls
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00910.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00914.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00915.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00918.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00919.sql"

prompt Installing panel-neutral Accounts Payable controls
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00923.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00926.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00928.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00929.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00932.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00933.sql"

commit;
prompt PANEL_NEUTRAL_FINANCE_PAGES_DEPLOYED
exit
