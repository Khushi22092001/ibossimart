whenever sqlerror exit sql.sqlcode rollback
set define off

prompt Updating Purchase Order save-guard order only
@@deployments/crossform-calc-integrity-20260926/f105_page_118.sql
commit;
prompt Purchase Order save-guard order updated
exit
