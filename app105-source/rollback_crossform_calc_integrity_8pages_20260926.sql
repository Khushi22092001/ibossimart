whenever sqlerror exit sql.sqlcode rollback
set define off

prompt Rolling back cross-form calculation integrity deployment (8 changed pages only)

@@backups/crossform-calc-integrity-before-20260926-224201/live-before/f105_page_108.sql
@@backups/crossform-calc-integrity-before-20260926-224201/live-before/f105_page_118.sql
@@backups/crossform-calc-integrity-before-20260926-224201/live-before/f105_page_140.sql
@@backups/crossform-calc-integrity-before-20260926-224201/live-before/f105_page_143.sql
@@backups/crossform-calc-integrity-before-20260926-224201/live-before/f105_page_146.sql
@@backups/crossform-calc-integrity-before-20260926-224201/live-before/f105_page_152.sql
@@backups/crossform-calc-integrity-before-20260926-224201/live-before/f105_page_155.sql
@@backups/crossform-calc-integrity-before-20260926-224201/live-before/f105_page_69.sql

commit;
prompt Rollback complete. Purchase Quotation page 710 was never part of this deployment.
exit
