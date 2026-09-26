whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART
@app105-source/business-insights-live-export/f105/application/pages/page_00710_1.sql
commit;
exit
