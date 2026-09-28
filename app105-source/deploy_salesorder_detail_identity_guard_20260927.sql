whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
@app105-source/deployments/salesorder-detail-identity-guard-20260927/staged/salesorderdetail_biu_identity_guard.sql
exit
