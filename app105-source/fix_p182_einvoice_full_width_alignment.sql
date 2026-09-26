whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on

/* Page 182 / E-Invoice: restore the report region to the full content width. */
declare
  l_marker constant varchar2(80) := 'P182_EINVOICE_FULL_WIDTH_ALIGNMENT_V1';
  l_css clob;
  l_append_css clob := q'~

/* P182_EINVOICE_FULL_WIDTH_ALIGNMENT_V1 */
html.page-182 .hspl-card-canvas > .row > .col:has(#S_Einvoice),
html.page-182 #S_Einvoice {
  grid-column: 1 / -1 !important;
  width: 100% !important;
  max-width: none !important;
}
~';
begin
  select inline_css
    into l_css
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 182
     and security_group_id = 4744311978888504
     for update;

  if l_css is null or dbms_lob.instr(l_css, l_marker) = 0 then
    l_css := nvl(l_css, to_clob('')) || l_append_css;
    update apex_260100.wwv_flow_steps
       set inline_css = l_css,
           last_updated_on = sysdate
     where flow_id = 105
       and id = 182
       and security_group_id = 4744311978888504;
  end if;
  commit;
end;
/

select case
         when dbms_lob.instr(inline_css, 'P182_EINVOICE_FULL_WIDTH_ALIGNMENT_V1') > 0
         then 'P182_EINVOICE_FULL_WIDTH_ALIGNMENT_DEPLOYED'
         else 'P182_EINVOICE_FULL_WIDTH_ALIGNMENT_MISSING'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 182
   and security_group_id = 4744311978888504;

exit
