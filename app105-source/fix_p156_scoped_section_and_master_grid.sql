whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_css clob;
  l_new clob;
  l_old_at pls_integer;
  l_next_at pls_integer;
  l_tail_len pls_integer;
  l_clean clob := q'~

/* P156_SCOPED_SECTION_AND_MASTER_GRID_V1 */
html.page-156 .container.hspl-card-canvas > .row {
  display: grid !important;
  grid-template-columns: minmax(0, 1fr) !important;
}
html.page-156 .container.hspl-card-canvas > .row > .hspl-form-column-stack {
  display: contents !important;
}
html.page-156 .container.hspl-card-canvas > .row > .hspl-form-column-stack > .col:has(#R841841470566831271),
html.page-156 .container.hspl-card-canvas > .row > .hspl-form-column-stack > .col:has(#VOUCHERDETAIL),
html.page-156 .container.hspl-card-canvas > .row > .hspl-form-column-stack > .col:has(#R803352458305679688) {
  grid-column: 1 / -1 !important;
  width: 100% !important;
  max-width: none !important;
}
html.page-156 .container.hspl-card-canvas > .row > .hspl-form-column-stack > .col:has(#R841841470566831271) { order: 1 !important; }
html.page-156 .container.hspl-card-canvas > .row > .hspl-form-column-stack > .col:has(#VOUCHERDETAIL) { order: 2 !important; }
html.page-156 .container.hspl-card-canvas > .row > .hspl-form-column-stack > .col:has(#R803352458305679688) { order: 3 !important; }

html.page-156 #R841841470566831271 .t-Region-body > .container > .row.hspl-semantic-row > .col:has(#P156_LOCATIONCODE_CONTAINER) { grid-column: 1; grid-row: 1; }
html.page-156 #R841841470566831271 .t-Region-body > .container > .row.hspl-semantic-row > .col:has(#P156_DOCTYPECODE_CONTAINER) { grid-column: 2; grid-row: 1; }
html.page-156 #R841841470566831271 .t-Region-body > .container > .row.hspl-semantic-row > .col:has(#P156_VOUCHERDATE_CONTAINER) { grid-column: 3; grid-row: 1; }
html.page-156 #R841841470566831271 .t-Region-body > .container > .row.hspl-semantic-row > .col:has(#P156_VOUCHERNO_CONTAINER) { grid-column: 4; grid-row: 1; }
html.page-156 #R841841470566831271 .t-Region-body > .container > .row.hspl-semantic-row > .col:has(#P156_REFERENCETNO_CONTAINER) { grid-column: 1; grid-row: 2; }
html.page-156 #R841841470566831271 .t-Region-body > .container > .row.hspl-semantic-row > .col:has(#P156_MONEYTRANSFERMODECODE_CONTAINER) { grid-column: 2; grid-row: 2; }
html.page-156 #R841841470566831271 .t-Region-body > .container > .row.hspl-semantic-row > .col:has(#P156_ACCOUNTCODE_CONTAINER) { grid-column: 3; grid-row: 2; }
html.page-156 #R841841470566831271 .t-Region-body > .container > .row.hspl-semantic-row > .col:has(#P156_MONEYTRANSFERREFERENCENO_CONTAINER) { grid-column: 4; grid-row: 2; }
html.page-156 #R841841470566831271 .t-Region-body > .container > .row.hspl-semantic-row > .col:has(#P156_MODULENO_CONTAINER) { grid-column: 1; grid-row: 3; }
html.page-156 #R841841470566831271 .t-Region-body > .container > .row.hspl-semantic-row > .col:has(#P156_REMARK_CONTAINER) { grid-column: 2; grid-row: 3; }
html.page-156 #R841841470566831271 .t-Region-body > .container > .row.hspl-semantic-row > .col:has(#P156_NARRATION_CONTAINER) { grid-column: 3 / -1 !important; grid-row: 3; }
~';
begin
  select inline_css into l_css
    from apex_260100.wwv_flow_steps
   where flow_id = 105 and id = 156 and security_group_id = 4744311978888504
   for update;

  l_old_at := nvl(dbms_lob.instr(l_css, '/* P156_VOUCHER_MASTER_THREE_ROWS_V1 */'), 0);
  l_next_at := nvl(dbms_lob.instr(l_css, '/* P156_VOUCHER_MASTER_TRUE_GRID_V2 */', l_old_at + 1), 0);
  if l_old_at = 0 or l_next_at = 0 or dbms_lob.instr(l_css, 'P156_SCOPED_SECTION_AND_MASTER_GRID_V1') > 0 then
    raise_application_error(-20001, 'Expected outdated Voucher grid rule was not found.');
  end if;

  dbms_lob.createtemporary(l_new, true);
  dbms_lob.copy(l_new, l_css, l_old_at - 1, 1, 1);
  l_tail_len := dbms_lob.getlength(l_css) - l_next_at + 1;
  dbms_lob.copy(l_new, l_css, l_tail_len, dbms_lob.getlength(l_new) + 1, l_next_at);
  dbms_lob.append(l_new, l_clean);

  update apex_260100.wwv_flow_steps
     set inline_css = l_new,
         last_updated_on = sysdate
   where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;
end;
/
commit;

select case when dbms_lob.instr(inline_css, 'P156_VOUCHER_MASTER_THREE_ROWS_V1') = 0
                  and dbms_lob.instr(inline_css, 'P156_SCOPED_SECTION_AND_MASTER_GRID_V1') > 0
            then 'P156_SCOPED_LAYOUT_DEPLOYED'
            else 'P156_SCOPED_LAYOUT_CHECK_FAILED'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;

exit
