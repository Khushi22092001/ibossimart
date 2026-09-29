whenever sqlerror exit sql.sqlcode rollback
set serveroutput on
connect -name IMART

/* Page 321 is the Purchase Bill Detail Footer modal opened from the FD link.
   This changes only its dialog viewport dimensions; its IG, items, DAs and
   processing remain unchanged. */
begin
  update apex_260100.wwv_flow_steps
     set dialog_width = 720,
         dialog_height = 650
   where flow_id = 105
     and id = 321;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Purchase Bill Detail Footer dialog page was not found.');
  end if;

  update apex_260100.wwv_flows
     set files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate
   where id = 105
     and security_group_id = 4744311978888504;
  commit;
end;
/

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30', p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504, p_default_application_id=>105,
    p_default_id_offset=>7541489808702750, p_default_owner=>'IMART'
  );
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select page_id, dialog_width, dialog_height, dialog_resizable
  from apex_260100.apex_application_pages
 where application_id = 105
   and page_id = 321;

exit
