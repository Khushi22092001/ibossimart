whenever sqlerror exit failure rollback
set define off
connect -name IMART

declare
  l_original_bytes constant pls_integer := 351496;
  l_blob           blob;
begin
  select file_content
    into l_blob
    from apex_260100.wwv_flow_static_files
   where flow_id = 105
     and security_group_id = 4744311978888504
     and file_name = 'hspl-theme.js'
   for update;

  if dbms_lob.getlength(l_blob) < l_original_bytes then
    raise_application_error(-20001, 'Static JavaScript is shorter than the verified pre-layout version');
  end if;

  dbms_lob.trim(l_blob, l_original_bytes);

  update apex_260100.wwv_flow_static_files
     set last_updated_on = sysdate,
         last_updated_by = 'CODEX'
   where flow_id = 105
     and security_group_id = 4744311978888504
     and file_name = 'hspl-theme.js';

  update apex_260100.wwv_flows
     set javascript_file_urls = regexp_replace(
           javascript_file_urls,
           '#APP_FILES#hspl-theme[.]js[^[:space:]]*',
           '#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260928p118rollbackv1'),
         files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate,
         last_updated_by = 'CODEX'
   where id = 105
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Application 105 JavaScript cache URL was not updated');
  end if;
  commit;
end;
/

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd      => '2026.03.30',
    p_release                 => '26.1.2',
    p_default_workspace_id    => 4744311978888504,
    p_default_application_id  => 105,
    p_default_id_offset       => 7541489808702750,
    p_default_owner           => 'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select dbms_lob.getlength(file_content) as javascript_bytes
  from apex_260100.wwv_flow_static_files
 where flow_id = 105
   and security_group_id = 4744311978888504
   and file_name = 'hspl-theme.js';

exit
