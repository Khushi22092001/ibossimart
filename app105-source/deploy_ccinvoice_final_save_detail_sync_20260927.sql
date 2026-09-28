whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
@app105-source/deployments/ccinvoice-final-save-detail-sync-20260927/staged/f105_page_175.sql
exit
