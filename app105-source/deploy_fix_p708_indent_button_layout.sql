whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Purchase Enquiry Page 708 only: force the two existing indent actions into
   separate native grid spans. Their actions, labels, and dynamic actions stay unchanged. */
declare
  l_css    clob;
  l_marker constant varchar2(80) := 'HSPL_P708_INDENT_BUTTON_LAYOUT_V1';
  l_contrast_marker constant varchar2(80) := 'HSPL_P708_INDENT_BUTTON_CONTRAST_V1';
begin
  select inline_css
    into l_css
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 708
     and security_group_id = 4744311978888504
   for update;

  if l_css is null or dbms_lob.instr(l_css, l_marker) = 0 then
    l_css := nvl(l_css, to_clob('')) || to_clob(chr(10)) || q'~
/* HSPL_P708_INDENT_BUTTON_LAYOUT_V1 */
@media (min-width: 768px) {
    html.page-708 .col:has(#B40543521212907076) {
        grid-column: 3 / span 4 !important;
        flex: none !important;
        width: auto !important;
        max-width: none !important;
    }

    html.page-708 .col:has(#B999708001000000001) {
        grid-column: 7 / span 6 !important;
        flex: none !important;
        width: auto !important;
        max-width: none !important;
    }
}~';
  end if;

  if l_css is null or dbms_lob.instr(l_css, l_contrast_marker) = 0 then
    l_css := nvl(l_css, to_clob('')) || to_clob(chr(10)) || q'~
/* HSPL_P708_INDENT_BUTTON_CONTRAST_V1 */
html.page-708 #B999708001000000001 {
    background: #e7edfb !important;
    border: 1px solid #b9c8ee !important;
    box-shadow: 0 1px 2px rgba(30, 64, 175, 0.10) !important;
    color: #23458c !important;
}

html.page-708 #B999708001000000001:hover,
html.page-708 #B999708001000000001:focus-visible {
    background: #dce6fb !important;
    border-color: #94aae0 !important;
}~';
  end if;

  update apex_260100.wwv_flow_steps
     set inline_css = l_css,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 708
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Expected exactly one Purchase Enquiry Page 708 update.');
  end if;

  commit;
end;
/

exit
