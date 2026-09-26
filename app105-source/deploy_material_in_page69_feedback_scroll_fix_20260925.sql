whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

prompt Deploying Material In Page 69 notification and Detail horizontal-scroll fix...
@app105-source/business-insights-live-export/f105/application/pages/page_00069_1.sql

commit;
prompt Material In Page 69 fix deployed.
exit
