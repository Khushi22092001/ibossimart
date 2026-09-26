whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

/* Page 156: explicit visual order for the full-width grid items. */
declare
  l_css clob := q'~

/* P156_EXPLICIT_SECTION_ORDER_V5 */
html.page-156 .container.hspl-card-canvas > .row > .col:has(#P156_LOCATIONCODE) {
  order: 1 !important;
}
html.page-156 .container.hspl-card-canvas > .row > .col:has(#VOUCHERDETAIL),
html.page-156 .container.hspl-card-canvas > .row > .col:has(#VOUCHERDETAIL_ig) {
  order: 2 !important;
}
html.page-156 .container.hspl-card-canvas > .row > .col:has(#R803352458305679688) {
  order: 3 !important;
}
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = nvl(inline_css, to_clob('')) || l_css,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 156
     and security_group_id = 4744311978888504
     and nvl(dbms_lob.instr(inline_css, 'P156_EXPLICIT_SECTION_ORDER_V5'), 0) = 0;
  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Voucher section-order CSS already exists or Page 156 was not found.');
  end if;
end;
/
commit;

select case when dbms_lob.instr(inline_css, 'P156_EXPLICIT_SECTION_ORDER_V5') > 0
            then 'P156_SECTION_ORDER_DEPLOYED'
            else 'P156_SECTION_ORDER_CHECK_FAILED'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;

exit
