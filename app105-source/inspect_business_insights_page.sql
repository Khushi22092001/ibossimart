whenever sqlerror exit failure rollback
set define off
connect -name IMART
set lines 240 pages 100 long 100000 longchunksize 32767

select column_name
  from all_tab_columns
 where owner='APEX_260100'
   and table_name='WWV_FLOW_PAGE_PLUGS'
   and column_name in ('FLOW_ID','FLOW_STEP_ID','ID','NAME','STATIC_ID','SOURCE_TYPE','PLUG_SOURCE','LIST_ID','LIST_TEMPLATE_ID')
 order by column_id;

select id, name, static_id, source_type, list_id, list_template_id,
       dbms_lob.getlength(plug_source) source_length
  from apex_260100.wwv_flow_page_plugs
 where flow_id=105
   and flow_step_id=901;

exit
