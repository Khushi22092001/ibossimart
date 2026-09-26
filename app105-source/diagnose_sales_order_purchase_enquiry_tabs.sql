whenever sqlerror exit sql.sqlcode rollback
set pagesize 100
set linesize 320
set long 200000
set longchunksize 200000
connect -name IMART

/* Read-only comparison of page CSS/JS and tab-container region metadata. */
select id page_id,
       name page_name,
       inline_css,
       javascript_code
  from apex_260100.wwv_flow_steps
 where flow_id=105 and id in (171,708)
 order by id;

select page_id,
       plug_name,
       static_id,
       plug_source_type,
       plug_display_sequence,
       plug_template
  from apex_260100.wwv_flow_page_plugs
 where flow_id=105
   and page_id in (171,708)
   and (static_id='tabcontainer' or plug_name like '%Detail%' or plug_name like '%General%')
 order by page_id, plug_display_sequence;

exit
