whenever sqlerror exit sql.sqlcode rollback
set pagesize 100
set linesize 300
set long 10000
connect -name IMART

select id page_id,
       name page_name,
       dbms_lob.substr(
         inline_css,
         1800,
         greatest(1, dbms_lob.instr(inline_css, 'a-GV-w-scroll') - 250)
       ) css_excerpt
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id in (69,108,171,708)
 order by id;

exit
