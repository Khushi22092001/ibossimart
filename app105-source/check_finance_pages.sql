set pagesize 200 linesize 300 trimspool on
connect -name IMART
select page_id, page_name, page_alias, page_mode, authorization_scheme, build_option
from apex_application_pages
where application_id = 105 and page_id in (901,902,903,904,905,906,907,920)
order by page_id;
exit
