set pagesize 200
set linesize 240
set long 50000
set longchunksize 50000
set trimspool on
connect -name IMART

prompt === PAGE STARTUP CODE ===
select id,
       dbms_lob.getlength(nvl(javascript_code, to_clob(''))) as javascript_bytes,
       dbms_lob.getlength(nvl(javascript_code_onload, to_clob(''))) as onload_bytes,
       dbms_lob.getlength(nvl(inline_css, to_clob(''))) as css_bytes,
       case when dbms_lob.instr(javascript_code, 'new MutationObserver') = 0
            then 'NO_STARTUP_OBSERVERS'
            else 'STARTUP_OBSERVER_PRESENT'
       end as observer_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 156
   and security_group_id = 4744311978888504;

prompt === VOUCHER LOV ITEMS ===
select name as item_name,
       display_as,
       dbms_lob.getlength(nvl(lov, to_clob(''))) as lov_source_bytes,
       lov_display_extra,
       lov_cascade_parent_items
  from apex_260100.wwv_flow_step_items
 where flow_id = 105
   and flow_step_id = 156
   and security_group_id = 4744311978888504
   and name in ('P156_LOCATIONCODE', 'P156_DOCTYPECODE', 'P156_MONEYTRANSFERMODECODE', 'P156_ACCOUNTCODE')
;

prompt === VOUCHER PAGE REGION SOURCES ===
select id,
       plug_name as name,
       plug_source_type,
       dbms_lob.getlength(nvl(plug_source, to_clob(''))) as source_bytes,
       query_type,
       plug_query_num_rows,
       lazy_loading,
       dbms_lob.substr(plug_source, 4000, 1) as source_text
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 156
   and security_group_id = 4744311978888504;

prompt === REGION LAZY-LOAD SETTINGS ===
select column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_PAGE_PLUGS'
   and column_name like '%LAZY%';

exit
