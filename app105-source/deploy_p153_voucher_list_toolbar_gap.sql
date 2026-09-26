whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

/* Page 153: separate the Voucher List title card from its actual IG container. */
declare
  l_marker constant varchar2(80) := 'P153_VOUCHER_LIST_REPORT_TOOLBAR_GAP_V1';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = nvl(inline_css, to_clob('')) || to_clob(q'~

/* P153_VOUCHER_LIST_REPORT_TOOLBAR_GAP_V1 */
html.page-153 #voucherdetaillist {
  margin-top: 16px !important;
}
~'),
         last_updated_on = sysdate
   where flow_id = 105
     and id = 153
     and security_group_id = 4744311978888504
     and nvl(dbms_lob.instr(inline_css, l_marker), 0) = 0;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Voucher List gap already exists or Page 153 was not found.');
  end if;
end;
/
commit;

select case when dbms_lob.instr(inline_css, 'P153_VOUCHER_LIST_REPORT_TOOLBAR_GAP_V1') > 0
            then 'P153_GAP_DEPLOYED' else 'P153_GAP_CHECK_FAILED' end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 153 and security_group_id = 4744311978888504;

exit
