whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
@app105-source/deployments/purchaseorder-final-save-detail-sync-20260927/staged/f105_page_118.sql
exit
