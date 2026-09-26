set define off
set serveroutput on

-- Page 146 only: replace the earlier pre-Apex listener with a native DOM listener.
declare
    l_marker constant varchar2(80) := 'GRN_DETAIL_HORIZONTAL_SYNC_NATIVE_V5';
    l_js     clob;
begin
    select javascript_code
      into l_js
      from apex_260100.wwv_flow_steps
     where flow_id = 105
       and id = 146
       and security_group_id = 4744311978888504
       for update;

    if l_js is null or dbms_lob.instr(l_js, l_marker) = 0 then
        -- Remove the two earlier listeners, which depend on apex.jQuery before it exists.
        l_js := replace(l_js, to_clob(q'~

/* GRN_DETAIL_HORIZONTAL_SYNC_V3 */
(function ($) {
  function syncGrnDetailHeader() {
    var grid = document.getElementById('GrnDetail_ig');
    if (!grid) { return; }

    var body = grid.querySelector('.a-GV-bdy');
    var header = grid.querySelector('.a-GV-w-hdr');
    if (!body || !header || body.dataset.grnHorizontalSync === 'Y') { return; }

    body.dataset.grnHorizontalSync = 'Y';
    header.scrollLeft = body.scrollLeft;
    body.addEventListener('scroll', function () {
      header.scrollLeft = body.scrollLeft;
    }, { passive: true });
  }

  $(syncGrnDetailHeader);
  $('#GrnDetail_ig').on('apexafterrefresh.grnHorizontalSync', syncGrnDetailHeader);
})(apex.jQuery);
~'), to_clob(''));

        l_js := replace(l_js, to_clob(q'~

/* GRN_DETAIL_HORIZONTAL_SYNC_AFTER_TAB_V4 */
(function ($) {
  function bindGrnDetailHeaderSync() {
    var grid = document.getElementById('GrnDetail_ig');
    if (!grid) { return; }

    var body = grid.querySelector('.a-GV-bdy');
    var header = grid.querySelector('.a-GV-w-hdr');
    if (!body || !header || body.dataset.grnHorizontalSyncV4 === 'Y') { return; }

    body.dataset.grnHorizontalSyncV4 = 'Y';
    header.scrollLeft = body.scrollLeft;
    body.addEventListener('scroll', function () {
      header.scrollLeft = body.scrollLeft;
    }, { passive: true });
  }

  $(function () {
    bindGrnDetailHeaderSync();
    $(document).on('apexafterrefresh.grnHorizontalSyncV4', '#GrnDetail_ig', bindGrnDetailHeaderSync);
    $(document).on('click.grnHorizontalSyncV4', '[role="tab"]', function () {
      window.setTimeout(bindGrnDetailHeaderSync, 0);
    });
  });
})(apex.jQuery);
~'), to_clob(''));

        update apex_260100.wwv_flow_steps
           set javascript_code = nvl(l_js, to_clob('')) || to_clob(q'~

/* GRN_DETAIL_HORIZONTAL_SYNC_NATIVE_V5 */
(function () {
  function bindGrnDetailHeaderSync() {
    var grid = document.getElementById('GrnDetail_ig');
    if (!grid) { return; }

    var body = grid.querySelector('.a-GV-bdy');
    var header = grid.querySelector('.a-GV-w-hdr');
    if (!body || !header || body.dataset.grnHorizontalSyncV5 === 'Y') { return; }

    body.dataset.grnHorizontalSyncV5 = 'Y';
    header.scrollLeft = body.scrollLeft;
    body.addEventListener('scroll', function () {
      header.scrollLeft = body.scrollLeft;
    }, { passive: true });
  }

  function scheduleBinding() {
    window.setTimeout(bindGrnDetailHeaderSync, 0);
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', scheduleBinding, { once: true });
  } else {
    scheduleBinding();
  }

  document.addEventListener('click', function (event) {
    if (event.target.closest('.t-Tabs-link')) { scheduleBinding(); }
  });

  new MutationObserver(scheduleBinding).observe(document.documentElement, {
    childList: true,
    subtree: true
  });
})();
~')
         where flow_id = 105
           and id = 146
           and security_group_id = 4744311978888504;
        dbms_output.put_line('Native GRN horizontal synchronization added.');
    else
        dbms_output.put_line('Native GRN horizontal synchronization already present.');
    end if;
end;
/
commit;

select case
         when dbms_lob.instr(javascript_code, 'GRN_DETAIL_HORIZONTAL_SYNC_NATIVE_V5') > 0
              and dbms_lob.instr(javascript_code, 'GRN_DETAIL_HORIZONTAL_SYNC_V3') = 0
              and dbms_lob.instr(javascript_code, 'GRN_DETAIL_HORIZONTAL_SYNC_AFTER_TAB_V4') = 0
           then 'VERIFIED: native horizontal synchronization is present'
         else 'ERROR: synchronization script cleanup failed'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 146
   and security_group_id = 4744311978888504;
