whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on

/* Page 182 / E-Invoice: keep the Interactive Grid Save action on-brand. */
declare
  l_marker constant varchar2(80) := 'P182_EINVOICE_SAVE_PRIMARY_COLOR_V1';
  l_css clob;
  l_append_css clob := q'~

/* P182_EINVOICE_SAVE_PRIMARY_COLOR_V1 */
html.page-182 #S_Einvoice_ig .a-Toolbar .a-Button--hot {
  background-color: #5b57d9 !important;
  border-color: #5b57d9 !important;
  color: #ffffff !important;
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
         when dbms_lob.instr(inline_css, 'P182_EINVOICE_SAVE_PRIMARY_COLOR_V1') > 0
         then 'P182_EINVOICE_SAVE_PRIMARY_COLOR_DEPLOYED'
         else 'P182_EINVOICE_SAVE_PRIMARY_COLOR_MISSING'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 182
   and security_group_id = 4744311978888504;

exit
