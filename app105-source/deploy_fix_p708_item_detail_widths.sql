whenever sqlerror exit sql.sqlcode rollback

connect -name IMART

declare
    l_item_specification_count pls_integer;
    l_remark_count             pls_integer;
begin
    /* Apply the widths to the primary report and its current derived report.
       The same column ids are shared by both views of Page 708 Item Detail. */
    update apex_260100.wwv_flow_ig_report_columns c
       set c.width = 520
     where c.column_id = 179881637012839581  /* ITEMSPECIFICATIONCODE */
       and c.view_id in (
           select v.id
             from apex_260100.wwv_flow_ig_reports r
             join apex_260100.wwv_flow_ig_report_views v
               on v.report_id = r.id
            where r.flow_id = 105
              and r.page_id = 708
              and r.interactive_grid_id = 179881106958839576
              and v.view_type = 'GRID'
       );
    l_item_specification_count := sql%rowcount;

    update apex_260100.wwv_flow_ig_report_columns c
       set c.width = 100
     where c.column_id = 179882038243839585  /* REMARK */
       and c.view_id in (
           select v.id
             from apex_260100.wwv_flow_ig_reports r
             join apex_260100.wwv_flow_ig_report_views v
               on v.report_id = r.id
            where r.flow_id = 105
              and r.page_id = 708
              and r.interactive_grid_id = 179881106958839576
              and v.view_type = 'GRID'
       );
    l_remark_count := sql%rowcount;

    if l_item_specification_count <> 2 or l_remark_count <> 2 then
        raise_application_error(
            -20001,
            'Expected two Item Detail report views; updated item specification=' ||
            l_item_specification_count || ', remark=' || l_remark_count
        );
    end if;

    commit;
end;
/

exit
