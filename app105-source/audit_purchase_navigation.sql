set pagesize 200 linesize 260 trimspool on
connect -name IMART
select page_id, page_name, page_alias
  from apex_application_pages
 where application_id=105
   and page_id in (11,68,107,117,142,145,151,198,709,711,901,934,935,936,937,938,939,940)
 order by page_id;

select case when exists (
         select 1 from apex_application_page_regions
          where application_id=105 and page_id=901
            and instr(upper(region_source),'PURCHASE COMMAND CENTRE')>0
            and instr(region_source,'934')>0
       ) then 'BUSINESS_INSIGHTS_LINK_OK' else 'BUSINESS_INSIGHTS_LINK_MISSING' end status
  from dual;
exit
