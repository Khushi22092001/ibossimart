connect -name IMART
set pagesize 300 linesize 260 trimspool on
column list_name format a34
column entry_text format a34
column parent_entry_text format a34
column target format a90
select list_name, display_sequence, entry_text, parent_entry_text, entry_target target
  from apex_application_list_entries
 where application_id=105
   and (upper(entry_text) like '%DASHBOARD%'
        or upper(entry_text) like '%PORTLET%'
        or upper(entry_text) like '%BUSINESS%INSIGHT%'
        or list_name='Dashboard')
 order by list_name, display_sequence;

prompt === navigation list assigned to desktop UI ===
select user_interface_name, navigation_list_name
  from apex_application_user_interfaces
 where application_id=105;
exit
