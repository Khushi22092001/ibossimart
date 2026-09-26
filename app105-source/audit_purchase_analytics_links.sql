set pagesize 200 linesize 260 trimspool on
connect -name IMART

prompt === Purchase Analytics live page ===
select page_id,page_name,page_alias
from apex_application_pages
where application_id=105 and page_id=940;

prompt === Business Insights navigation target ===
select entry_text,entry_target
from apex_application_list_entries
where application_id=105
  and list_name='Business Insights'
  and entry_text in ('Purchase Command Center','Purchase Analytics','Sales Lifecycle')
order by display_sequence;

prompt === Purchase Analytics target items ===
with expected(page_id,item_name) as (
  select 935,'P935_SUPPLIER' from dual union all
  select 936,'P936_ITEMCODE' from dual union all
  select 940,'P940_FROMDATE' from dual union all
  select 940,'P940_TODATE' from dual union all
  select 940,'P940_COMPANY' from dual union all
  select 940,'P940_LOCATION' from dual
)
select e.page_id,e.item_name,
       case when i.item_name is null then 'MISSING' else 'OK' end status
from expected e
left join apex_application_page_items i
  on i.application_id=105 and i.page_id=e.page_id and i.item_name=e.item_name
order by e.page_id,e.item_name;

prompt === Page 940 region inventory ===
select source_type,count(*) region_count
from apex_application_page_regions
where application_id=105 and page_id=940
group by source_type
order by source_type;

exit
