set echo off feedback off verify off pagesize 0 linesize 32767 trimspool on
set sqlformat json
spool .theme-analysis-900-100/component-sql/report-drawer-inventory.json
select p.page_id,p.page_name,p.page_alias,
 (select count(*) from apex_application_page_regions f where f.application_id=100 and f.page_id=p.page_id and f.source_type='Form') forms,
 r.region_id,r.static_id,r.region_name,r.source_type,
 (select count(*) from apex_application_page_items i where i.application_id=100 and i.page_id=p.page_id and i.region_id=r.region_id and i.display_as_code not in ('NATIVE_HIDDEN','NATIVE_DISPLAY_ONLY')) items,
 (select count(*) from apex_application_page_items i where i.application_id=100 and i.page_id=p.page_id and i.region_id=r.region_id and i.display_as_code not in ('NATIVE_HIDDEN','NATIVE_DISPLAY_ONLY') and exists (select 1 from apex_application_page_regions q where q.application_id=100 and q.page_id=p.page_id and q.source_type in ('Report','Interactive Report','Interactive Grid') and instr(upper(q.region_source),':'||i.item_name)>0)) query_items
from apex_application_pages p join apex_application_page_regions r on r.application_id=p.application_id and r.page_id=p.page_id
where p.application_id=100
order by p.page_id,r.display_sequence;
spool off
set feedback on
