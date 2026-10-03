whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* The login page is public and must not initialize authenticated-only
   notification/master-form runtime from Global Page 0. */
@app105-source/business-insights-live-export/f105/application/pages/page_00000_1.sql

commit;
exit
