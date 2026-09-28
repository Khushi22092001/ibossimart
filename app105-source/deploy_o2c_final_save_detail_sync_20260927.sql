whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
@app105-source/deployments/o2c-final-save-detail-sync-20260927/staged/f105.sql
exit
