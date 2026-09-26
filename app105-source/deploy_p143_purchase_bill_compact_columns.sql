set define off
set serveroutput on

-- Application 105 / Page 143 only: remove the unused gap below General.
declare
    l_marker constant varchar2(80) := 'P143_PURCHASE_BILL_COMPACT_COLUMNS_V1';
    l_css    clob;
begin
    select inline_css
      into l_css
      from apex_260100.wwv_flow_steps
     where flow_id = 105
       and id = 143
       and security_group_id = 4744311978888504
       for update;

    if l_css is null or dbms_lob.instr(l_css, l_marker) = 0 then
        update apex_260100.wwv_flow_steps
           set inline_css = nvl(inline_css, to_clob('')) || to_clob(q'~

/* P143_PURCHASE_BILL_COMPACT_COLUMNS_V1 */
html.page-143 #SR_General .container.hspl-card-canvas {
  position: relative;
  grid-template-rows: auto auto;
}

/* Keep Party/Currency/Transaction sections in the right column without
   forcing Bill Details and later sections to wait for their full height. */
html.page-143 #SR_General .hspl-form-column-stack--left {
  position: absolute;
  top: 0;
  right: 0;
  width: calc((100% - 12px) / 2);
}

html.page-143 #SR_General .row > .col.col-start:first-child {
  grid-column: 1;
  grid-row: 1;
}

html.page-143 #SR_General .hspl-form-column-stack--right {
  grid-column: 1;
  grid-row: 2;
  align-self: start;
}
~')
         where flow_id = 105
           and id = 143
           and security_group_id = 4744311978888504;
        dbms_output.put_line('Purchase Bill compact column layout added.');
    else
        dbms_output.put_line('Purchase Bill compact column layout already present.');
    end if;
end;
/
commit;

select case
         when dbms_lob.instr(inline_css, 'P143_PURCHASE_BILL_COMPACT_COLUMNS_V1') > 0
           then 'VERIFIED: Purchase Bill compact column layout is present'
         else 'ERROR: Purchase Bill compact column layout is missing'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 143
   and security_group_id = 4744311978888504;
