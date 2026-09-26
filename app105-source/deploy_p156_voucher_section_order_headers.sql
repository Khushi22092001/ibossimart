whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

/* Page 156: Voucher -> Voucher Detail -> Voucher Created Automatically. */
declare
  l_css clob := q'~

/* P156_STANDARD_SECTION_HEADERS_V1 */
html.page-156 .p156-standard-section {
  width: 100% !important;
  max-width: none !important;
  margin-bottom: 16px !important;
  background: #fff !important;
  border: 1px solid #dfe5ef !important;
  border-radius: 14px !important;
  overflow: hidden;
}

/* Replace the dark/pill title treatment with the standard light section header. */
html.page-156 .p156-standard-section > .t-Region-header,
html.page-156 .p156-standard-section > .p156-section-header {
  display: flex !important;
  align-items: center !important;
  min-height: 50px !important;
  padding: 0 18px !important;
  background: #fff !important;
  color: #151b2b !important;
  border: 0 !important;
  border-bottom: 1px solid #e5eaf3 !important;
  border-radius: 0 !important;
  box-shadow: none !important;
}
html.page-156 .p156-standard-section .t-Region-title,
html.page-156 .p156-standard-section .p156-section-title {
  margin: 0 !important;
  padding: 0 !important;
  background: transparent !important;
  color: #151b2b !important;
  font-size: 18px !important;
  font-weight: 700 !important;
  line-height: 1.2 !important;
}
html.page-156 .p156-section-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 32px;
  height: 32px;
  margin-right: 12px;
  border-radius: 9px;
  background: #eef3ff;
  color: #2654c9;
  font-size: 15px;
}
html.page-156 .p156-standard-section > .t-Region-bodyWrap,
html.page-156 .p156-standard-section > .t-Region-body {
  background: #fff !important;
}
~';
  l_js clob := q'~

/* P156_STANDARD_SECTION_HEADERS_V1 */
(function () {
  var sections = [
    { id: 'R841841470566831271', title: 'Voucher' },
    { id: 'VOUCHERDETAIL', title: 'Voucher Detail' },
    { id: 'R803352458305679688', title: 'Voucher Created Automatically' }
  ];

  function addHeader(config) {
    var region = document.getElementById(config.id);
    if (!region) { return; }
    region.classList.add('p156-standard-section');

    var header = region.querySelector(':scope > .t-Region-header');
    if (header) {
      return;
    }
    if (region.querySelector(':scope > .p156-section-header')) {
      return;
    }

    header = document.createElement('div');
    header.className = 'p156-section-header';
    header.innerHTML = '<span class="p156-section-icon fa fa-file-o" aria-hidden="true"></span>' +
                       '<span class="p156-section-title">' + config.title + '</span>';
    region.insertBefore(header, region.firstChild);
  }

  function applyHeaders() {
    sections.forEach(addHeader);
  }

  function schedule() { window.setTimeout(applyHeaders, 0); }
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', schedule, { once: true });
  } else {
    schedule();
  }
  new MutationObserver(schedule).observe(document.documentElement, { childList: true, subtree: true });
}());
~';
begin
  update apex_260100.wwv_flow_page_plugs
     set plug_new_grid_row = 'Y',
         plug_new_grid_column = 'N',
         plug_display_column = 1,
         plug_grid_column_span = 12,
         plug_display_sequence = case plug_name
           when 'Voucher' then 20
           when 'Voucher Detail' then 30
           when 'Voucher Created Automatically' then 40
           when 'Cost Centre' then 50
           when 'Reference' then 60
         end,
         last_updated_on = sysdate
   where flow_id = 105
     and page_id = 156
     and security_group_id = 4744311978888504
     and plug_name in ('Voucher', 'Voucher Detail', 'Voucher Created Automatically', 'Cost Centre', 'Reference');
  if sql%rowcount <> 5 then
    raise_application_error(-20001, 'Expected five Voucher page regions; found ' || sql%rowcount);
  end if;

  update apex_260100.wwv_flow_steps
     set inline_css = nvl(inline_css, to_clob('')) || l_css,
         javascript_code = nvl(javascript_code, to_clob('')) || l_js,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 156
     and security_group_id = 4744311978888504
     and nvl(dbms_lob.instr(inline_css, 'P156_STANDARD_SECTION_HEADERS_V1'), 0) = 0;
  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Voucher header style already exists or page was not found.');
  end if;
end;
/
commit;

select plug_name, plug_display_sequence, plug_new_grid_row, plug_new_grid_column,
       plug_display_column, plug_grid_column_span
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 156
   and security_group_id = 4744311978888504
   and plug_name in ('Voucher', 'Voucher Detail', 'Voucher Created Automatically', 'Cost Centre', 'Reference')
 order by plug_display_sequence;

select case when dbms_lob.instr(inline_css, 'P156_STANDARD_SECTION_HEADERS_V1') > 0
                  and dbms_lob.instr(javascript_code, 'P156_STANDARD_SECTION_HEADERS_V1') > 0
            then 'P156_SECTION_LAYOUT_AND_HEADERS_DEPLOYED'
            else 'P156_DEPLOYMENT_CHECK_FAILED'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;

exit
