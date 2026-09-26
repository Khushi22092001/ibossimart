connect -name IMART
set pagesize 300 linesize 280 trimspool on
column application_name format a42
column alias format a30
column list_name format a32
column entry_text format a32
column target format a85

select application_id, application_name, alias
  from apex_applications
 where application_id in (105,107)
 order by application_id;

prompt === App 107 dashboard-related lists ===
select list_name,display_sequence,entry_text,parent_entry_text,entry_target target
  from apex_application_list_entries
 where application_id=107
   and (upper(entry_text) like '%DASHBOARD%'
        or upper(entry_text) like '%PORTLET%'
        or upper(entry_text) like '%BUSINESS%INSIGHT%'
        or upper(list_name) like '%DASHBOARD%')
 order by list_name,display_sequence;

prompt === App 107 target pages ===
select page_id,page_name,page_alias
  from apex_application_pages
 where application_id=107 and page_id in (901,902)
 order by page_id;
exit
