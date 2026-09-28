set pagesize 100
set linesize 220
connect -name IMART

select column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_STEPS'
   and (column_name like '%CSS%' or column_name like '%JAVASCRIPT%' or column_name like '%JAVA_SCRIPT%' or column_name in ('ID', 'FLOW_ID'))
 order by column_id;

select id,
       dbms_lob.getlength(inline_css) as inline_css_bytes,
       dbms_lob.getlength(javascript_code) as javascript_bytes
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 146;
