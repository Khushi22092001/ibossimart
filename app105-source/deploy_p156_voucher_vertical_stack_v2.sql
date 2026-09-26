whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

/* Page 156: force the three visible regions into one vertical full-width stack. */
declare
  l_css clob := q'~

/* P156_VERTICAL_SECTION_STACK_V2 */
html.page-156 .row:has(#P156_LOCATIONCODE),
html.page-156 .row:has(#VOUCHERDETAIL),
html.page-156 .row:has(#VOUCHERDETAIL_ig),
html.page-156 .row:has(#R803352458305679688) {
  display: flex !important;
  flex-wrap: wrap !important;
}
html.page-156 .col:has(#P156_LOCATIONCODE),
html.page-156 .col:has(#VOUCHERDETAIL),
html.page-156 .col:has(#VOUCHERDETAIL_ig),
html.page-156 .col:has(#R803352458305679688) {
  flex: 0 0 100% !important;
  width: 100% !important;
  max-width: 100% !important;
  grid-column: 1 / -1 !important;
}
html.page-156 #R841841470566831271,
html.page-156 #VOUCHERDETAIL,
html.page-156 #VOUCHERDETAIL_ig,
html.page-156 #R803352458305679688 {
  width: 100% !important;
  max-width: none !important;
}
~';
  l_js clob := q'~

/* P156_VERTICAL_SECTION_STACK_V2 */
(function () {
  var sections = [
    { ids: ['R841841470566831271'], title: 'Voucher', order: 1 },
    { ids: ['VOUCHERDETAIL', 'VOUCHERDETAIL_ig'], title: 'Voucher Detail', order: 2 },
    { ids: ['R803352458305679688'], title: 'Voucher Created Automatically', order: 3 }
  ];

  function findRegion(ids) {
    for (var i = 0; i < ids.length; i++) {
      var element = document.getElementById(ids[i]);
      if (element) { return element; }
    }
    return null;
  }

  function styleHeader(region) {
    region.classList.add('p156-standard-section');
    var header = region.querySelector(':scope > .t-Region-header, :scope > .p156-section-header');
    if (!header) { return; }
    if (!header.querySelector('.p156-section-icon')) {
      var icon = document.createElement('span');
      icon.className = 'p156-section-icon fa fa-file-o';
      icon.setAttribute('aria-hidden', 'true');
      header.insertBefore(icon, header.firstChild);
    }
  }

  function stackSection(config) {
    var region = findRegion(config.ids);
    if (!region) { return; }
    styleHeader(region);
    region.style.width = '100%';
    region.style.maxWidth = 'none';

    var column = region.closest('.col');
    if (!column) { return; }
    column.style.flex = '0 0 100%';
    column.style.width = '100%';
    column.style.maxWidth = '100%';
    column.style.order = String(config.order);
    var row = column.parentElement;
    if (row && row.classList.contains('row')) {
      row.style.display = 'flex';
      row.style.flexWrap = 'wrap';
    }
  }

  function applyStack() { sections.forEach(stackSection); }
  function schedule() { window.setTimeout(applyStack, 0); }
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', schedule, { once: true });
  } else {
    schedule();
  }
  new MutationObserver(schedule).observe(document.documentElement, { childList: true, subtree: true });
}());
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = nvl(inline_css, to_clob('')) || l_css,
         javascript_code = nvl(javascript_code, to_clob('')) || l_js,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 156
     and security_group_id = 4744311978888504
     and nvl(dbms_lob.instr(inline_css, 'P156_VERTICAL_SECTION_STACK_V2'), 0) = 0;
  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Voucher vertical stack already exists or Page 156 was not found.');
  end if;
end;
/
commit;

select case when dbms_lob.instr(inline_css, 'P156_VERTICAL_SECTION_STACK_V2') > 0
                  and dbms_lob.instr(javascript_code, 'P156_VERTICAL_SECTION_STACK_V2') > 0
            then 'P156_VERTICAL_STACK_DEPLOYED'
            else 'P156_VERTICAL_STACK_CHECK_FAILED'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;

exit
