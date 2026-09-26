set define off
set serveroutput on
set feedback on

-- Targeted deployment for Application 105 / Page 146 only.
-- Preserve existing page CSS and append the GRN Detail grid rule once.
declare
    l_marker constant varchar2(80) := 'GRN_DETAIL_HORIZONTAL_ENTRY_ONLY_V1';
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

/* GRN_DETAIL_HORIZONTAL_ENTRY_ONLY_V1 */
html.page-146 #SR_GrnDetail .a-GV-bdy,
html.page-146 #SR_GrnDetail .a-GV-scrollBody,
html.page-146 #GrnDetail_ig .a-GV-bdy,
html.page-146 #GrnDetail_ig .a-GV-scrollBody {
  overflow-y: hidden !important;
}

html.page-146 #SR_GrnDetail .a-GV-w-scroll,
html.page-146 #GrnDetail_ig .a-GV-w-scroll {
  overflow-x: auto !important;
  overflow-y: hidden !important;
}
~')
         where flow_id = 105
           and id = 146
           and security_group_id = 4744311978888504;
        dbms_output.put_line('P146 CSS rule added.');
    else
        dbms_output.put_line('P146 CSS rule already present; no duplicate added.');
    end if;
end;
/
commit;

select case
         when dbms_lob.instr(inline_css, 'GRN_DETAIL_HORIZONTAL_ENTRY_ONLY_V1') > 0
           then 'VERIFIED: Page 146 scrollbar rule is present'
         else 'ERROR: Page 146 scrollbar rule is missing'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 146
   and security_group_id = 4744311978888504;
