whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Login-only parser-phase composition: preserve all native APEX login items
   and processes while preventing a native-login frame before the branded DOM. */
@app105-source/business-insights-live-export/f105/application/pages/page_09999.sql

commit;
exit
