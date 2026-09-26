whenever sqlerror exit failure rollback
set define off verify off
connect -name IMART

prompt Installing hidden legacy-scope columns for AR registers
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00908.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00909.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00911.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00913.sql"

prompt Installing hidden legacy-scope columns for AP registers
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00921.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00922.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00924.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00926.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00927.sql"

commit;
prompt PANEL_HIDDEN_REGISTER_COLUMNS_DEPLOYED
exit
