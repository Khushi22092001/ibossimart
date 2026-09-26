set pagesize 200 linesize 240 trimspool on
connect -name IMART

prompt === SLC drill target contract ===
with expected(page_id,page_name,item_name) as (
  select 722,'Sales Quotation 360','P722_TNO' from dual union all
  select 723,'Sales Order 360','P723_TNO' from dual union all
  select 724,'Vehicle 360','P724_VEHICLE' from dual union all
  select 725,'Category 360','P725_CATEGORY' from dual union all
  select 726,'Item Sales Analysis','P726_ITEMCODE' from dual union all
  select 161,'Despatch Advice','P161_TNO' from dual union all
  select 168,'Material Out','P168_TNO' from dual union all
  select 168,'Material Out','P168_FORMSTATUS' from dual union all
  select 133,'Weighment','P133_TNO' from dual union all
  select 175,'CC Invoice','P175_TNO' from dual union all
  select 175,'CC Invoice','P175_FORMSTATUS' from dual union all
  select 182,'E-Invoice','P182_TNO' from dual union all
  select 910,'Debtor 360','P910_PARTY' from dual union all
  select 174,'CC Invoice Register','P174_AGENTCODE' from dual
)
select e.page_id,
       e.page_name expected_page,
       p.page_name actual_page,
       e.item_name,
       case when p.page_id is null then 'MISSING PAGE'
            when i.item_name is null then 'MISSING ITEM'
            else 'OK' end status
from expected e
left join apex_application_pages p
  on p.application_id=105 and p.page_id=e.page_id
left join apex_application_page_items i
  on i.application_id=105 and i.page_id=e.page_id and i.item_name=e.item_name
order by e.page_id,e.item_name;

exit
