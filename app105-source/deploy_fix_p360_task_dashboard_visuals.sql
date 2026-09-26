whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_css clob;
begin
  select inline_css
    into l_css
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 360
     and security_group_id = 4744311978888504
   for update;

  /* Keep the Task Dashboard inside the same light visual system as the rest
     of the application. These substitutions only affect its page inline CSS. */
  l_css := regexp_replace(
    l_css,
    '@import url[(]''https://fonts[.]googleapis[.]com/css2[?]family=Plus[+]Jakarta[+]Sans:wght@400;500;600;700;800[&]display=swap''[)][;][[:space:]]*',
    '');
  l_css := replace(l_css,
    '--font:        ''Plus Jakarta Sans'', sans-serif;',
    '--font:        ''Inter'',''Plus Jakarta Sans'',-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Arial,sans-serif;');
  l_css := replace(l_css,
    'background: var(--gray-800) !important;',
    'background: var(--white) !important;' || chr(10) || '              border-bottom: 1px solid var(--gray-200) !important;');
  l_css := replace(l_css,
    'border: 1px solid rgba(255,255,255,0.3) !important;',
    'border: 1px solid #c9d8f6 !important;');
  l_css := replace(l_css,
    'background: rgba(255,255,255,0.1) !important;',
    'background: var(--white) !important;');
  l_css := replace(l_css,
    'color: white !important;' || chr(10) || '              transition: all 0.2s ease !important;',
    'color: var(--primary) !important;' || chr(10) || '              transition: all 0.2s ease !important;');
  l_css := replace(l_css,
    'background: rgba(255,255,255,0.2) !important;',
    'background: var(--primary-soft) !important;');
  l_css := replace(l_css,
    'background: #1f2937 !important;   /* dark charcoal */',
    'background: #f3f6fc !important;');
  l_css := replace(l_css,
    'color: #ffffff !important;' || chr(10) || '              font-size: 11px !important;' || chr(10) || '              font-weight: 700 !important;' || chr(10) || '              letter-spacing: 0.07em !important;' || chr(10) || '              text-transform: uppercase !important;' || chr(10) || '              padding: 12px 14px !important;' || chr(10) || '              border: none !important;',
    'color: #374151 !important;' || chr(10) || '              font-size: 11px !important;' || chr(10) || '              font-weight: 700 !important;' || chr(10) || '              letter-spacing: 0.07em !important;' || chr(10) || '              text-transform: uppercase !important;' || chr(10) || '              padding: 12px 14px !important;' || chr(10) || '              border-bottom: 1px solid #d9e1ef !important;');

  if dbms_lob.instr(l_css, '#1f2937 !important') > 0 then
    raise_application_error(-20001, 'Task Dashboard dark table header remains in page CSS');
  end if;

  update apex_260100.wwv_flow_steps
     set inline_css = l_css,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 360
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Task Dashboard page CSS was not updated');
  end if;
end;
/
commit;

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
exit
