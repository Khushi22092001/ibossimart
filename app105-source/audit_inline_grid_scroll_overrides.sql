whenever sqlerror exit sql.sqlcode rollback
set pagesize 300
set linesize 240
connect -name IMART

/* Read-only: enumerate page-local grid scroll patches before touching any
   shared selector. */
select id page_id,
       name page_name,
       case when dbms_lob.instr(nvl(inline_css, to_clob('')),
              'WORKFLOW_LAYOUT_HORIZONTAL_GRID_SCROLL_V1') > 0
            then 'FORCE_SCROLL' end as force_scroll,
       case when dbms_lob.instr(nvl(inline_css, to_clob('')),
              'WIDE_GRID_HORIZONTAL_BAR_STANDARD_V1') > 0
            then 'WIDE_SCROLL' end as wide_scroll,
       case when dbms_lob.instr(nvl(inline_css, to_clob('')),
              'a-GV-scrollBody') > 0
            then 'SCROLLBODY_RULE' end as scrollbody_rule
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and security_group_id = 4744311978888504
   and (dbms_lob.instr(nvl(inline_css, to_clob('')),
          'WORKFLOW_LAYOUT_HORIZONTAL_GRID_SCROLL_V1') > 0
     or dbms_lob.instr(nvl(inline_css, to_clob('')),
          'WIDE_GRID_HORIZONTAL_BAR_STANDARD_V1') > 0
     or dbms_lob.instr(nvl(inline_css, to_clob('')), 'a-GV-scrollBody') > 0)
 order by id;

exit
