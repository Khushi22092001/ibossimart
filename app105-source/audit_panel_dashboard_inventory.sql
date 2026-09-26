set pagesize 300 linesize 260 trimspool on
connect -name IMART
select page_id,page_name,page_alias
from apex_application_pages
where application_id=105
  and (upper(page_name) like '%TRIAL BALANCE%'
    or upper(page_name) like '%PROFIT%LOSS%'
    or upper(page_name) like '%RECEIVABLE%'
    or upper(page_name) like '%PAYABLE%'
    or upper(page_name) like '%SALES LIFECYCLE%'
    or page_id between 901 and 940)
order by page_id;

select i.page_id,p.page_name,i.item_name,i.display_as,i.label
from apex_application_page_items i
join apex_application_pages p on p.application_id=i.application_id and p.page_id=i.page_id
where i.application_id=105 and upper(i.item_name) like '%PANEL%'
  and (i.page_id between 901 and 940 or i.page_id between 721 and 740)
order by i.page_id,i.item_name;

select page_id,page_name,
       sum(case when regexp_like(upper(nvl(region_source,' ')),'(^|[^A-Z])PANEL([^A-Z]|$)') then 1 else 0 end) panel_regions,
       count(*) total_regions
from apex_application_page_regions
where application_id=105 and (page_id between 901 and 940 or page_id between 721 and 740)
group by page_id,page_name
having sum(case when regexp_like(upper(nvl(region_source,' ')),'(^|[^A-Z])PANEL([^A-Z]|$)') then 1 else 0 end)>0
order by page_id;
exit
