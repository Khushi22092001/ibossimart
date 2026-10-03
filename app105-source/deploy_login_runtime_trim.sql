whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Page Zero is shared by every page. Keep authenticated-only widgets out of
   the public login response; Page 9999 has its own dedicated UI. */
@app105-source/business-insights-live-export/f105/application/pages/page_00000_1.sql

commit;
exit
