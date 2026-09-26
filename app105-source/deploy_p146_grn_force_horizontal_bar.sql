set define off
set serveroutput on

-- Page 146 only: force the native horizontal grid track to be visible.
declare
    l_marker constant varchar2(80) := 'GRN_DETAIL_FORCE_HORIZONTAL_BAR_V2';
    l_css    clob;
begin
    select inline_css
      into l_css
      from apex_260100.wwv_flow_steps
     where flow_id = 105
       and id = 146
       and security_group_id = 4744311978888504
       for update;

    if l_css is null or dbms_lob.instr(l_css, l_marker) = 0 then
        update apex_260100.wwv_flow_steps
           set inline_css = nvl(inline_css, to_clob('')) || to_clob(q'~

/* GRN_DETAIL_FORCE_HORIZONTAL_BAR_V2 */
html.page-146 #SR_GrnDetail .a-GV-bdy,
html.page-146 #SR_GrnDetail .a-GV-scrollBody,
html.page-146 #GrnDetail_ig .a-GV-bdy,
html.page-146 #GrnDetail_ig .a-GV-scrollBody {
  overflow-x: scroll !important;
  overflow-y: hidden !important;
}

html.page-146 #SR_GrnDetail .a-GV-w-scroll,
html.page-146 #GrnDetail_ig .a-GV-w-scroll {
  overflow-x: scroll !important;
  overflow-y: hidden !important;
}
~')
         where flow_id = 105
           and id = 146
           and security_group_id = 4744311978888504;
        dbms_output.put_line('Forced horizontal bar CSS added.');
    else
        dbms_output.put_line('Forced horizontal bar CSS already present.');
    end if;
end;
/
commit;

select case
         when dbms_lob.instr(inline_css, 'GRN_DETAIL_FORCE_HORIZONTAL_BAR_V2') > 0
           then 'VERIFIED: forced horizontal bar CSS is present'
         else 'ERROR: forced horizontal bar CSS is missing'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 146
   and security_group_id = 4744311978888504;
