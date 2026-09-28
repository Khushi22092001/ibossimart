whenever sqlerror exit sql.sqlcode rollback
set define off
prompt Deploying actual-change-only detail calculations (Purchase Quotation excluded)
@@deployments/crossform-unchanged-recalc-20260926/f105_page_69.sql
@@deployments/crossform-unchanged-recalc-20260926/f105_page_108.sql
@@deployments/crossform-unchanged-recalc-20260926/f105_page_118.sql
@@deployments/crossform-unchanged-recalc-20260926/f105_page_140.sql
@@deployments/crossform-unchanged-recalc-20260926/f105_page_143.sql
@@deployments/crossform-unchanged-recalc-20260926/f105_page_146.sql
@@deployments/crossform-unchanged-recalc-20260926/f105_page_152.sql
@@deployments/crossform-unchanged-recalc-20260926/f105_page_155.sql
commit;
prompt Actual-change-only deployment complete
exit
