whenever sqlerror exit sql.sqlcode rollback
set serveroutput on
connect -name IMART

/* Purchase Bill (page 143): visual override only for the Party Popup LOV.
   The grid, LOV, validations, source, DAs, processes, and saved data are unchanged. */
declare
  l_css clob := q'~

/* P143_PARTY_FULL_WIDTH_V1 */
html.page-143 #P143_PARTYCODE_CONTAINER,
html.page-143 #P143_PARTYCODE_CONTAINER .t-Form-inputContainer,
html.page-143 #P143_PARTYCODE_CONTAINER .apex-item-group--popup-lov {
  width: 100% !important;
  max-width: none !important;
}
html.page-143 #P143_PARTYCODE_CONTAINER .apex-item-group--popup-lov {
  display: flex !important;
}
html.page-143 #P143_PARTYCODE_CONTAINER .apex-item-popup-lov {
  flex: 1 1 auto !important;
  min-width: 0 !important;
  width: auto !important;
}
~';
  l_grid_css clob := q'~

/* P143_PARTY_GRID_SPAN_12_V1 */
html.page-143 #R602764421364017068 .hspl-semantic-cell--standard:has(#P143_PARTYCODE_CONTAINER) {
  grid-column: span 12 !important;
}
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = case
           when instr(inline_css, 'P143_PARTY_FULL_WIDTH_V1') = 0
            and instr(inline_css, 'P143_PARTY_GRID_SPAN_12_V1') = 0
             then nvl(inline_css, to_clob('')) || l_css || l_grid_css
           when instr(inline_css, 'P143_PARTY_FULL_WIDTH_V1') = 0
             then nvl(inline_css, to_clob('')) || l_css
           when instr(inline_css, 'P143_PARTY_GRID_SPAN_12_V1') = 0
             then nvl(inline_css, to_clob('')) || l_grid_css
           else inline_css
         end
   where flow_id = 105
     and id = 143;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Purchase Bill page was not found.');
  end if;

  update apex_260100.wwv_flows
     set files_version   = files_version + 1,
         version_scn     = dbms_flashback.get_system_change_number,
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

select case when instr(inline_css, 'P143_PARTY_FULL_WIDTH_V1') > 0
                 and instr(inline_css, 'P143_PARTY_GRID_SPAN_12_V1') > 0
            then 'P143_PARTY_FULL_WIDTH_AND_SPAN_PRESENT'
            else 'P143_PARTY_FULL_WIDTH_V1_MISSING'
       end as verification
  from apex_260100.apex_application_pages
 where application_id = 105
   and page_id = 143;

exit
