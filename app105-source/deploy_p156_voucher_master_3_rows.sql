whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

/* Page 156: compact Voucher Master into four columns and three logical rows. */
declare
  l_css clob := q'~

/* P156_VOUCHER_MASTER_THREE_ROWS_V1 */
html.page-156 #R841841470566831271 .row.hspl-semantic-row {
  display: grid !important;
  grid-template-columns: repeat(4, minmax(0, 1fr)) !important;
  gap: 12px 18px !important;
}
html.page-156 #R841841470566831271 .row.hspl-semantic-row > .col {
  display: block !important;
  width: auto !important;
  min-width: 0 !important;
  max-width: none !important;
  margin: 0 !important;
  padding: 0 !important;
}

html.page-156 .col:has(#P156_LOCATIONCODE_CONTAINER) { grid-column: 1; grid-row: 1; }
html.page-156 .col:has(#P156_DOCTYPECODE_CONTAINER) { grid-column: 2; grid-row: 1; }
html.page-156 .col:has(#P156_VOUCHERDATE_CONTAINER) { grid-column: 3; grid-row: 1; }
html.page-156 .col:has(#P156_VOUCHERNO_CONTAINER) { grid-column: 4; grid-row: 1; }
html.page-156 .col:has(#P156_REFERENCETNO_CONTAINER) { grid-column: 1; grid-row: 2; }
html.page-156 .col:has(#P156_MONEYTRANSFERMODECODE_CONTAINER) { grid-column: 2; grid-row: 2; }
html.page-156 .col:has(#P156_ACCOUNTCODE_CONTAINER) { grid-column: 3; grid-row: 2; }
html.page-156 .col:has(#P156_MONEYTRANSFERREFERENCENO_CONTAINER) { grid-column: 4; grid-row: 2; }
html.page-156 .col:has(#P156_MODULENO_CONTAINER) { grid-column: 1; grid-row: 3; }
html.page-156 .col:has(#P156_REMARK_CONTAINER) { grid-column: 2; grid-row: 3; }
html.page-156 .col:has(#P156_NARRATION_CONTAINER) { grid-column: 3 / span 2; grid-row: 3; }
html.page-156 #P156_NARRATION {
  min-height: 78px !important;
}

@media (max-width: 1100px) {
  html.page-156 #R841841470566831271 .row.hspl-semantic-row {
    grid-template-columns: repeat(2, minmax(0, 1fr)) !important;
  }
  html.page-156 #R841841470566831271 .row.hspl-semantic-row > .col {
    grid-column: auto !important;
    grid-row: auto !important;
  }
  html.page-156 .col:has(#P156_NARRATION_CONTAINER) { grid-column: 1 / -1 !important; }
}
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = nvl(inline_css, to_clob('')) || l_css,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 156
     and security_group_id = 4744311978888504
     and nvl(dbms_lob.instr(inline_css, 'P156_VOUCHER_MASTER_THREE_ROWS_V1'), 0) = 0;
  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Voucher Master three-row CSS already exists or Page 156 was not found.');
  end if;
end;
/
commit;

select case when dbms_lob.instr(inline_css, 'P156_VOUCHER_MASTER_THREE_ROWS_V1') > 0
            then 'P156_MASTER_THREE_ROWS_DEPLOYED'
            else 'P156_MASTER_THREE_ROWS_CHECK_FAILED'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;

exit
