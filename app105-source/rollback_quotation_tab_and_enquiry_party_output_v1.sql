whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
@app105-source/backups/quotation-before-tab-party-output-20260926-170525/live-before/f105_page_710.sql
commit
exit
