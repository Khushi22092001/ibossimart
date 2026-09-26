set define off
set serveroutput on

-- Application 105 / Page 142 only: separate the title card from the report toolbar.
declare
    l_marker constant varchar2(80) := 'P142_PURCHASE_BILL_REPORT_TOOLBAR_GAP_V1';
    l_css    clob;
begin
    select inline_css
      into l_css
      from apex_260100.wwv_flow_steps
     where flow_id = 105
       and id = 142
       and security_group_id = 4744311978888504
       for update;

    if l_css is null or dbms_lob.instr(l_css, l_marker) = 0 then
        update apex_260100.wwv_flow_steps
           set inline_css = nvl(inline_css, to_clob('')) || to_clob(q'~

/* P142_PURCHASE_BILL_REPORT_TOOLBAR_GAP_V1 */
html.page-142 #MYID {
  margin-top: 16px;
}
~')
         where flow_id = 105
           and id = 142
           and security_group_id = 4744311978888504;
        dbms_output.put_line('Purchase Bill Register toolbar gap added.');
    else
        dbms_output.put_line('Purchase Bill Register toolbar gap already present.');
    end if;
end;
/
commit;

select case
         when dbms_lob.instr(inline_css, 'P142_PURCHASE_BILL_REPORT_TOOLBAR_GAP_V1') > 0
           then 'VERIFIED: Purchase Bill Register toolbar gap is present'
         else 'ERROR: Purchase Bill Register toolbar gap is missing'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 142
   and security_group_id = 4744311978888504;
