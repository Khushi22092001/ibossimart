set serveroutput on
connect -name IMART

declare
  l_count number;
begin
  for c in (
    select column_name
      from all_tab_columns
     where owner = 'APEX_260100'
       and table_name = 'WWV_FLOW_PAGE_PLUGS'
       and data_type in ('VARCHAR2', 'CHAR')
  ) loop
    begin
      execute immediate
        'select count(*) from apex_260100.wwv_flow_page_plugs' ||
        ' where flow_id = 105 and page_id = 156 and security_group_id = 4744311978888504' ||
        ' and id in (841841470566831271,607089419102783551,803352458305679688)' ||
        ' and ' || dbms_assert.simple_sql_name(c.column_name) || ' = ''Y''' into l_count;
      if l_count = 3 then
        dbms_output.put_line(c.column_name);
      end if;
    exception when others then null;
    end;
  end loop;
end;
/
exit
