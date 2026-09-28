whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
@app105-source/deployments/billreceipt-detail-identity-guard-20260927/staged/dfreightbillreceiptdetail_biu_identity_guard.sql
exit
