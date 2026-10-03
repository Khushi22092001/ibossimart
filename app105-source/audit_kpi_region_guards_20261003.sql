whenever sqlerror exit sql.sqlcode rollback
set define off
set feedback off
set sqlformat csv
connect -name IMART
spool app105-source/verification/kpi-region-guards-20261003.csv
select column_name from all_tab_columns where owner='APEX_260100' and table_name='WWV_FLOW_PAGE_PLUGS' and regexp_like(column_name,'ROLE|SECUR|COND|LANGUAGE');
select m.modulecode,m.modulename,m.pageno,m.entrypageno,m.isactive,m.mastertablename from module m where m.modulecode in('VEHICLE','EMPLOYEE','QUALITY','QUALITYTYPE','ITEMQUALITY','CURRENCYUNIT','PAYMENTADVICE','BOM','AGENTCOMMISSION','GSTR9','PENDINGDESPATCH','QUALIFICATIONTYPE','QUALIFICATION');
spool off
exit
