whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_global_css clob := q'~

/* Standard 12px gap between transaction header and step navigation. */
body:has(#tabcontainer) .t-Body-title.hspl-hero-card { margin-bottom: 12px !important; }
~';
  l_p143_css clob := q'~

/* Purchase Bill follows the transaction header spacing standard. */
.t-Body-title.hspl-hero-card { margin-bottom: 12px !important; }
#tabcontainer { margin-top: 0 !important; }
.t-Body-title .hspl-filter-trigger { display: none !important; }
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = case when instr(nvl(inline_css, empty_clob()), 'Standard 12px gap between transaction header and step navigation.') = 0
                             then nvl(inline_css, empty_clob()) || l_global_css else inline_css end,
         last_updated_on = sysdate
   where flow_id=105 and id=0 and security_group_id=4744311978888504;
  if sql%rowcount <> 1 then raise_application_error(-20001, 'Global Page was not found'); end if;

  update apex_260100.wwv_flow_steps
     set inline_css = nvl(inline_css, empty_clob()) || l_p143_css,
         last_updated_on = sysdate
   where flow_id=105 and id=143 and security_group_id=4744311978888504;
  if sql%rowcount <> 1 then raise_application_error(-20002, 'Purchase Bill page was not found'); end if;
end;
/
commit;
begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,
    p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;
exit
