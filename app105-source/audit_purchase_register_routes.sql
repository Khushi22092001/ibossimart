set pagesize 50000
set linesize 260
set feedback off
set verify off
connect -name IMART

prompt === PURCHASE/GRN/MATERIAL/FREIGHT/PAYMENT PAGES ===
select page_id, page_name, page_alias
from apex_application_pages
where application_id = 105
  and regexp_like(upper(page_name), 'PURCHASE|GRN|MATERIAL IN|INDENT|ENQUIRY|QUOTATION|COMPARATIVE|FREIGHT|SUPPLIER|VENDOR|PAYMENT|BILL PASS|ITEM 360|ANALYTICS')
order by page_id;

prompt === CANDIDATE PAGE ITEMS ===
select page_id, item_name
from apex_application_page_items
where application_id = 105
  and page_id in (
    select page_id from apex_application_pages
    where application_id = 105
      and regexp_like(upper(page_name), 'PURCHASE|GRN|MATERIAL IN|INDENT|ENQUIRY|QUOTATION|COMPARATIVE|FREIGHT|SUPPLIER|VENDOR|PAYMENT|BILL PASS')
  )
order by page_id, item_name;

exit
