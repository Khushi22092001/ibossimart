set pagesize 1000
set linesize 240
set feedback off
connect -name IMART
select page_id, page_name, page_alias
from apex_application_pages
where application_id=105
  and regexp_like(upper(page_name),'ACCOUNT.*LEDGER|LEDGER.*ACCOUNT')
order by page_id;
select page_id, item_name
from apex_application_page_items
where application_id=105 and page_id in (11,258)
order by page_id,item_name;
exit
