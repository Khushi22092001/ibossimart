set define off
set linesize 220
set pagesize 1000
connect -name IMART
spool app105-source/report_markup_scope.txt
select r.page_id,p.page_name,r.region_name,r.source_type,r.static_id from apex_application_page_regions r join apex_application_pages p on p.application_id=r.application_id and p.page_id=r.page_id where r.application_id=105 and r.source_type in('Interactive Grid','Classic Report') and (regexp_like(p.page_name,'Register|List|Master','i') or r.source_type='Classic Report') order by r.source_type,r.page_id;
spool off
exit
