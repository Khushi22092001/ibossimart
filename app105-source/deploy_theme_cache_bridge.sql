set define off
whenever sqlerror exit sql.sqlcode rollback

declare
  l_deleted number;
begin
  /* The application-level CSS URL is the only loader we need. Remove every
     historical Page 0 cache bridge, including the obsolete refresh scripts
     embedded in older copies. */
  delete from apex_260100.wwv_flow_page_plugs
   where flow_id = 105
     and page_id = 0
     and dbms_lob.instr(lower(plug_source), 'hspl-theme.css') > 0;
  l_deleted := sql%rowcount;

  update apex_260100.wwv_flows
     set css_file_urls = regexp_replace(
       css_file_urls,
       '(#APP_FILES#hspl-theme[.]css[?]version=#APP_VERSION#[&]cb=)[^[:space:]]+',
       '#APP_FILES#hspl-theme.css?version=#APP_VERSION#&cb=20260911ca'
     )
   where id = 105
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Application 105 CSS cache URL was not updated');
  end if;

  dbms_output.put_line('Removed obsolete Page 0 theme bridges: ' || l_deleted);
  commit;
end;
/
exit
