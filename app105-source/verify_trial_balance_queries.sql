connect -name IMART
set serveroutput on
declare
  l_cursor integer;
begin
  for r in (
    select region_name, region_source
      from apex_application_page_regions
     where application_id=105
       and page_id=902
       and source_type_code='SQL_QUERY'
     order by display_sequence
  ) loop
    l_cursor := dbms_sql.open_cursor;
    begin
      dbms_sql.parse(l_cursor, r.region_source, dbms_sql.native);
      dbms_output.put_line('OK: '||r.region_name);
      dbms_sql.close_cursor(l_cursor);
    exception
      when others then
        if dbms_sql.is_open(l_cursor) then dbms_sql.close_cursor(l_cursor); end if;
        dbms_output.put_line('FAILED: '||r.region_name||' -> '||sqlerrm);
        raise;
    end;
  end loop;
end;
/
exit
