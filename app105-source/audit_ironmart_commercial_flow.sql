whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback off heading on pagesize 200 linesize 220 trimspool on
connect -name IMART

prompt === IRONMART COMMERCIAL FLOW COUNTS ===
select 'SALESENQUIRY' object_name, count(*) row_count from salesenquiry
union all select 'SALESQUOTATION', count(*) from salesquotation
union all select 'SALESORDER', count(*) from salesorder
union all select 'DESPATCHADVICE', count(*) from despatchadvice
union all select 'MATERIALOUT', count(*) from materialout
union all select 'WEIGHMENT', count(*) from weighment
union all select 'CCINVOICE', count(*) from ccinvoice
union all select 'EINVOICE', count(*) from einvoice
union all select 'PURCHASEORDER', count(*) from purchaseorder
order by 1;

prompt === ACTIVE APEX PAGES FOR THE COMMERCIAL FLOW ===
select page_id, page_name
  from apex_application_pages
 where application_id = 105
   and regexp_like(upper(page_name), 'SALES|QUOTATION|ORDER|DESPATCH|DISPATCH|WEIGH|INVOICE|MATERIAL OUT')
 order by page_id;

exit success
