whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

/*
  Standardize only the 15 Home-workflow forms and their 15 register/list
  pages. Existing dedicated fixes on Pages 142, 143 and 146 are preserved.
*/
declare
  l_gap_css clob := q'~

/* WORKFLOW_LAYOUT_STANDARD_GAP_V1 */
/* Keep a clear separation between the title card and tabs/report content. */
#tabcontainer,
#MYID {
  margin-top: 16px !important;
}
~';
begin
  for r in (
    select distinct page_id
      from (
        select pageno as page_id from module
         where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
                              'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
                              'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
        union all
        select entrypageno from module
         where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
                              'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
                              'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
           and entrypageno is not null
      )
  ) loop
    /* Page 142 and 143 already have the same 16px rule from their scoped fixes. */
    if r.page_id not in (142, 143) then
      update apex_260100.wwv_flow_steps
         set inline_css = nvl(inline_css, to_clob('')) || l_gap_css,
             last_updated_on = sysdate
       where flow_id = 105
         and id = r.page_id
         and security_group_id = 4744311978888504
         and nvl(dbms_lob.instr(inline_css, 'WORKFLOW_LAYOUT_STANDARD_GAP_V1'), 0) = 0;
    end if;
  end loop;
end;
/

/* Add horizontal-only scrolling to workflow pages containing Interactive Grids. */
declare
  l_grid_css clob := q'~

/* WORKFLOW_LAYOUT_HORIZONTAL_GRID_SCROLL_V1 */
/* Wide entry grids retain their horizontal track and do not show an inner
   vertical scrollbar. */
.a-IG .a-GV-bdy,
.a-IG .a-GV-scrollBody,
.a-IG .a-GV-w-scroll {
  overflow-x: scroll !important;
  overflow-y: hidden !important;
}
~';
begin
  for r in (
    select distinct p.page_id
      from apex_260100.wwv_flow_page_plugs p
     where p.flow_id = 105
       and p.plug_source_type = 'NATIVE_IG'
       and p.page_id in (
         select pageno from module
          where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
                               'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
                               'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
         union
         select entrypageno from module
          where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
                               'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
                               'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
            and entrypageno is not null
       )
  ) loop
    update apex_260100.wwv_flow_steps
       set inline_css = nvl(inline_css, to_clob('')) || l_grid_css,
           last_updated_on = sysdate
     where flow_id = 105
       and id = r.page_id
       and security_group_id = 4744311978888504
       and nvl(dbms_lob.instr(inline_css, 'overflow-y: hidden'), 0) = 0;
  end loop;
end;
/

/* Synchronize IG headers with the native horizontal track on the new pages. */
declare
  l_grid_js clob := q'~

/* WORKFLOW_LAYOUT_HORIZONTAL_HEADER_SYNC_V1 */
(function () {
  function bindGrid(grid) {
    var body = grid.querySelector('.a-GV-bdy');
    var header = grid.querySelector('.a-GV-w-hdr');
    if (!body || !header || body.dataset.workflowHorizontalSync === 'Y') { return; }

    body.dataset.workflowHorizontalSync = 'Y';
    header.scrollLeft = body.scrollLeft;
    body.addEventListener('scroll', function () {
      header.scrollLeft = body.scrollLeft;
    }, { passive: true });
  }

  function bindAll() {
    Array.prototype.forEach.call(document.querySelectorAll('.a-IG'), bindGrid);
  }

  function scheduleBinding() { window.setTimeout(bindAll, 0); }
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', scheduleBinding, { once: true });
  } else {
    scheduleBinding();
  }
  document.addEventListener('click', scheduleBinding);
  new MutationObserver(scheduleBinding).observe(document.documentElement, {
    childList: true,
    subtree: true
  });
}());
~';
begin
  for r in (
    select distinct p.page_id
      from apex_260100.wwv_flow_page_plugs p
      join apex_260100.wwv_flow_steps s
        on s.flow_id = p.flow_id
       and s.id = p.page_id
       and s.security_group_id = 4744311978888504
     where p.flow_id = 105
       and p.plug_source_type = 'NATIVE_IG'
       and p.page_id in (
         select pageno from module
          where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
                               'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
                               'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
         union
         select entrypageno from module
          where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
                               'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
                               'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
            and entrypageno is not null
       )
       and nvl(dbms_lob.instr(s.javascript_code, 'HORIZONTAL'), 0) = 0
  ) loop
    update apex_260100.wwv_flow_steps
       set javascript_code = nvl(javascript_code, to_clob('')) || l_grid_js,
           last_updated_on = sysdate
     where flow_id = 105
       and id = r.page_id
       and security_group_id = 4744311978888504
       and nvl(dbms_lob.instr(javascript_code, 'WORKFLOW_LAYOUT_HORIZONTAL_HEADER_SYNC_V1'), 0) = 0;
  end loop;
end;
/
commit;

/* Deployment verification. */
with workflow_pages as (
  select pageno as page_id from module
   where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
                        'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
                        'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
  union
  select entrypageno from module
   where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
                        'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
                        'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
     and entrypageno is not null
), grid_pages as (
  select distinct p.page_id
    from apex_260100.wwv_flow_page_plugs p
   where p.flow_id = 105
     and p.plug_source_type = 'NATIVE_IG'
     and p.page_id in (select page_id from workflow_pages)
)
select (select count(*) from workflow_pages) as workflow_pages,
       (select count(*)
          from workflow_pages w join apex_260100.wwv_flow_steps s
            on s.flow_id = 105 and s.id = w.page_id and s.security_group_id = 4744311978888504
         where dbms_lob.instr(nvl(s.inline_css, to_clob('')), 'WORKFLOW_LAYOUT_STANDARD_GAP_V1') > 0
            or dbms_lob.instr(nvl(s.inline_css, to_clob('')), 'P142_PURCHASE_BILL_REPORT_TOOLBAR_GAP_V1') > 0
            or dbms_lob.instr(nvl(s.inline_css, to_clob('')), 'P143_DETAIL_HORIZONTAL_SCROLL_AND_TAB_GAP_V1') > 0) as pages_with_gap,
       (select count(*) from grid_pages) as grid_pages,
       (select count(*)
          from grid_pages g join apex_260100.wwv_flow_steps s
            on s.flow_id = 105 and s.id = g.page_id and s.security_group_id = 4744311978888504
         where dbms_lob.instr(nvl(s.inline_css, to_clob('')), 'overflow-y: hidden') > 0
           and dbms_lob.instr(nvl(s.inline_css, to_clob('')), 'overflow-x: scroll') > 0) as grids_with_horizontal_only_scroll,
       (select count(*)
          from grid_pages g join apex_260100.wwv_flow_steps s
            on s.flow_id = 105 and s.id = g.page_id and s.security_group_id = 4744311978888504
         where dbms_lob.instr(nvl(s.javascript_code, to_clob('')), 'HORIZONTAL') > 0) as grids_with_header_sync
  from dual;

exit
