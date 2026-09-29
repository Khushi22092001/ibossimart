whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_marker constant varchar2(80) := 'HSPL_P152_OTHER_DETAILS_TWO_COLUMNS_V1';
  l_css constant clob := q'~

/* HSPL_P152_OTHER_DETAILS_TWO_COLUMNS_V1
 * UI-only item layout: amount fields are paired on desktop while narrative
 * and final-total fields retain their full-width rows. */
@media (min-width: 1200px) {
  html.page-152 #other-details > .t-Region-bodyWrap > .t-Region-body > .container {
    display:grid!important;
    grid-template-columns:repeat(2,minmax(0,1fr))!important;
    column-gap:16px!important;
  }
  html.page-152 #other-details > .t-Region-bodyWrap > .t-Region-body > .container > .row { display:contents!important; }
  html.page-152 #other-details > .t-Region-bodyWrap > .t-Region-body > .container > .row > .col {
    width:auto!important;max-width:none!important;flex:initial!important;min-width:0!important;
  }
  html.page-152 #other-details .col:has(#P152_REMARK),
  html.page-152 #other-details .col:has(#P152_NETPAYABLEAMOUNT) { grid-column:1 / -1!important; }
}
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = to_clob(inline_css) || l_css,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 152
     and dbms_lob.instr(inline_css, l_marker) = 0;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Other Details two-column marker was already present or page 152 was not found.');
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

select dbms_lob.instr(inline_css, 'HSPL_P152_OTHER_DETAILS_TWO_COLUMNS_V1') as layout_marker
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 152;

exit
