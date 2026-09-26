whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on

/*
  Add a horizontal track only to pages that contain at least one Interactive
  Grid with ten or more columns.  Vertical scrolling is intentionally left
  unchanged by this application-wide standard.
*/
declare
  l_marker constant varchar2(80) := 'WIDE_GRID_HORIZONTAL_BAR_STANDARD_V1';
  l_css clob;
  l_append_css clob := q'~

/* WIDE_GRID_HORIZONTAL_BAR_STANDARD_V1 */
/* A track appears only when the grid columns exceed the available width. */
.a-IG .a-GV-bdy {
  overflow-x: auto !important;
}

.a-IG .a-GV-w-scroll {
  overflow-x: auto !important;
}
~';
  l_updated number := 0;
begin
  for r in (
    select page_id
      from (
        select page_id, region_id
          from apex_260100.apex_appl_page_ig_columns
         where application_id = 105
         group by page_id, region_id
        having count(*) >= 10
      )
     group by page_id
  ) loop
    select inline_css
      into l_css
      from apex_260100.wwv_flow_steps
     where flow_id = 105
       and id = r.page_id
       and security_group_id = 4744311978888504
       for update;

    if l_css is null or dbms_lob.instr(l_css, l_marker) = 0 then
      l_css := nvl(l_css, to_clob('')) || l_append_css;
      update apex_260100.wwv_flow_steps
         set inline_css = l_css,
             last_updated_on = sysdate
       where flow_id = 105
         and id = r.page_id
         and security_group_id = 4744311978888504;
      l_updated := l_updated + 1;
    end if;
  end loop;
  commit;
  dbms_output.put_line('WIDE_GRID_PAGES_UPDATED=' || l_updated);
end;
/

select count(*) as wide_grid_pages_with_horizontal_standard
  from apex_260100.wwv_flow_steps s
 where s.flow_id = 105
   and s.security_group_id = 4744311978888504
   and dbms_lob.instr(nvl(s.inline_css, to_clob('')), 'WIDE_GRID_HORIZONTAL_BAR_STANDARD_V1') > 0;

exit
