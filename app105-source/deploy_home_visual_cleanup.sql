whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Home-only visual cleanup: remove hero action controls and Popular visit text. */
@app105-source/business-insights-live-export/f105/application/pages/page_00001.sql

commit;
exit
