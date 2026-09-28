whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
@app105-source/deployments/salesquotation-final-save-integrity-20260927/staged/f105_page_705.sql
exit
