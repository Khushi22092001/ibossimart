whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
@app105-source/backups/enquiry-before-tab-scope-20260926-165531/live-before/f105_page_708.sql
commit
exit
