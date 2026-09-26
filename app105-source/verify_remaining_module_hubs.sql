set pagesize 100
set linesize 220
connect -name IMART
select page_id,page_name,page_alias
  from apex_application_pages
 where application_id=105
   and page_id between 820 and 826
 order by page_id;

select modulegroupcode,modulegroupname,pageno
  from modulegroup
 where modulegroupcode in ('153','151','142','152','140','143','134')
 order by modulegroupcode;

select page_id,count(*) region_count
  from apex_application_page_regions
 where application_id=105
   and page_id between 820 and 826
 group by page_id
 order by page_id;
exit
