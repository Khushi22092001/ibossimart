whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_css_marker constant varchar2(200) := '/* Page 156 — keep the three authored Voucher regions in one vertical, full-width flow. */';
  l_js_marker  constant varchar2(200) := '/* Voucher is a native APEX form, not a compact-card page.';
  l_css clob;
  l_js clob;
begin
  select inline_css, javascript_code_onload into l_css, l_js
    from apex_260100.wwv_flow_steps
   where flow_id = 105 and id = 156 and security_group_id = 4744311978888504
   for update;

  if dbms_lob.instr(l_css, l_css_marker) > 0 then
    l_css := dbms_lob.substr(l_css, dbms_lob.instr(l_css, l_css_marker) - 1, 1);
  end if;
  if dbms_lob.instr(l_js, l_js_marker) > 0 then
    l_js := dbms_lob.substr(l_js, dbms_lob.instr(l_js, l_js_marker) - 1, 1);
  end if;

  update apex_260100.wwv_flow_steps
     set inline_css = l_css,
         javascript_code_onload = l_js,
         last_updated_on = sysdate
   where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;

  update apex_260100.wwv_flow_page_plugs
     set plug_new_grid_row = 'Y',
         plug_new_grid_column = 'Y',
         plug_display_column = null,
         plug_grid_column_span = 12,
         last_updated_on = sysdate
   where flow_id = 105 and page_id = 156 and security_group_id = 4744311978888504
     and plug_name in ('Voucher', 'Voucher Detail', 'Voucher Created Automatically');
  if sql%rowcount <> 3 then raise_application_error(-20001, 'Voucher regions were not found'); end if;
end;
/
commit;
begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30', p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504, p_default_application_id=>105,
    p_default_id_offset=>7541489808702750, p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;
exit
