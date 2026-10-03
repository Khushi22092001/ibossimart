whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Restore the tracked newer Home page: Popular Pages plus both workflow launchers. */
@business-insights-live-export/f105/application/pages/page_00001.sql

commit;
exit
