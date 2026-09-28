whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Purchase Order Page 118 only: make the Ship To radio choices easier to distinguish. */
declare
  l_css    clob;
  l_marker constant varchar2(80) := 'HSPL_P118_GENERAL_SHIPTO_ALIGNMENT_V1';
begin
  select inline_css
    into l_css
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 118
     and security_group_id = 4744311978888504
   for update;

  if l_css is null or dbms_lob.instr(l_css, l_marker) = 0 then
    l_css := nvl(l_css, to_clob('')) || to_clob(chr(10)) || q'~
/* HSPL_P118_GENERAL_SHIPTO_ALIGNMENT_V1 */
@media (min-width: 768px) {
    #P118_SHIPTO .apex-item-grid-row {
        display: flex;
        align-items: center;
        column-gap: 28px;
    }
}~';
  end if;

  update apex_260100.wwv_flow_steps
     set inline_css = l_css,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 118
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Expected exactly one Purchase Order Page 118 update.');
  end if;

  commit;
end;
/

exit
