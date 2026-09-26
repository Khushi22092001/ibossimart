whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

/* Page 156: flatten six generated half-width rows into one 4x3 field grid. */
declare
  l_css clob := q'~

/* P156_VOUCHER_MASTER_TRUE_GRID_V2 */
html.page-156 #R841841470566831271 {
  border-radius: 14px !important;
}
html.page-156 #R841841470566831271 > .t-Region-header,
html.page-156 #R803352458305679688 > .t-Region-header,
html.page-156 #VOUCHERDETAIL > .p156-section-header {
  display: flex !important;
  align-items: center !important;
  min-height: 50px !important;
  padding: 0 18px !important;
  background: #fff !important;
  border: 0 !important;
  border-bottom: 1px solid #e5eaf3 !important;
  box-shadow: none !important;
}
html.page-156 #R841841470566831271 .t-Region-title,
html.page-156 #R803352458305679688 .t-Region-title {
  margin: 0 !important;
  padding: 0 !important;
  color: #151b2b !important;
  font-size: 18px !important;
  font-weight: 700 !important;
}
html.page-156 #R803352458305679688 .t-Region-title::before {
  content: '\f15c';
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 32px;
  height: 32px;
  margin-right: 12px;
  border-radius: 9px;
  background: #eef3ff;
  color: #2654c9;
  font-family: FontAwesome;
  font-size: 15px;
  font-weight: normal;
}

html.page-156 #R841841470566831271 .t-Region-body > .container {
  display: grid !important;
  grid-template-columns: repeat(4, minmax(0, 1fr)) !important;
  gap: 12px 18px !important;
}
html.page-156 #R841841470566831271 .t-Region-body > .container > .row.hspl-semantic-row {
  display: contents !important;
  grid-template-columns: none !important;
  gap: 0 !important;
}
html.page-156 #R841841470566831271 .t-Region-body > .container > .row.hspl-semantic-row > .col {
  display: block !important;
  width: auto !important;
  min-width: 0 !important;
  max-width: none !important;
  margin: 0 !important;
  padding: 0 !important;
}

@media (max-width: 1100px) {
  html.page-156 #R841841470566831271 .t-Region-body > .container {
    grid-template-columns: repeat(2, minmax(0, 1fr)) !important;
  }
  html.page-156 #R841841470566831271 .t-Region-body > .container > .row.hspl-semantic-row > .col {
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
     and nvl(dbms_lob.instr(inline_css, 'P156_VOUCHER_MASTER_TRUE_GRID_V2'), 0) = 0;
  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Voucher Master grid CSS already exists or Page 156 was not found.');
  end if;
end;
/
commit;

select case when dbms_lob.instr(inline_css, 'P156_VOUCHER_MASTER_TRUE_GRID_V2') > 0
            then 'P156_MASTER_TRUE_GRID_DEPLOYED'
            else 'P156_MASTER_TRUE_GRID_CHECK_FAILED'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;

exit
