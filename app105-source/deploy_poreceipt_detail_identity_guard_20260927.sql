whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
@app105-source/deployments/poreceipt-detail-identity-guard-20260927/staged/poreceiptdetail_biu_identity_guard.sql
exit
