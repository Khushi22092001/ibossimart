whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART
@deployments/quotation-item-spec-cascade-20260926/f105_page_710.sql
commit;
exit
