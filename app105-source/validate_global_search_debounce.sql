whenever sqlerror exit failure rollback
set define off
set pagesize 200
set linesize 240
set long 100000
set longchunksize 100000
connect -name IMART

prompt === Page 0 inherited Global Search Dynamic Actions ===
select application_id,
       page_id,
       dynamic_action_name,
       when_event_internal_name,
       execution_type_code,
       execution_time,
       execution_immediate
  from apex_application_page_da
 where application_id = 105
   and page_id = 0
   and static_id in ('global-search-300ms-debounce', 'global-search-enter-dedupe')
 order by dynamic_action_sequence;

prompt === Debounce action code marker ===
select dynamic_action_name,
       case when dbms_lob.instr(to_clob(attributes), 'hsplLastGlobalSearch') > 0
            then 'PRESENT' else 'MISSING' end as code_marker
  from apex_application_page_da_acts
 where application_id = 105
   and page_id = 0
   and dynamic_action_name in ('Global Search 300ms Debounce', 'Global Search Enter Dedupe')
 order by dynamic_action_name;

prompt === Keyboard cursor preservation marker ===
select dynamic_action_name,
       case when dbms_lob.instr(to_clob(attributes), 'hsplGlobalSearchCursor') > 0
              and dbms_lob.instr(to_clob(attributes), 'hspl-search-result-active') > 0
            then 'PRESENT' else 'MISSING' end as cursor_preservation
  from apex_application_page_da_acts
 where application_id = 105
   and page_id = 0
   and dynamic_action_name = 'Global Search 300ms Debounce';

prompt === Global Search region exists ===
select application_id, page_id, region_name, static_id
  from apex_application_page_regions
 where application_id = 105
   and (page_id = 0 or upper(region_name) like '%GLOBAL SEARCH%')
 order by page_id, region_name;

prompt === Search configuration source checks ===
select application_id,
       label,
       static_id,
       case when dbms_lob.instr(upper(to_clob(search_source)), 'EXISTS') > 0
            then 'EXISTS' else 'JOIN' end as permission_filter,
       case when dbms_lob.instr(upper(to_clob(search_source)), 'LEFT JOIN MODULEPRIVILEGE') > 0
            then 'LEGACY_JOIN' else 'NO_LEGACY_JOIN' end as legacy_join
  from apex_appl_search_configs
 where application_id = 105
 order by label;

prompt === Search Config query excerpts ===
select label, dbms_lob.substr(to_clob(search_source), 2000, 1) as search_source
  from apex_appl_search_configs
 where application_id = 105
 order by label;

exit
