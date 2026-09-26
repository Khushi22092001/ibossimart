set define off
set serveroutput on

-- Page 146 only: keep the Interactive Grid header aligned with its horizontal bar.
declare
    l_marker constant varchar2(80) := 'GRN_DETAIL_HORIZONTAL_SYNC_V3';
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
        update apex_260100.wwv_flow_steps
           set javascript_code = nvl(javascript_code, to_clob('')) || to_clob(q'~

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
~')
         where flow_id = 105
           and id = 146
           and security_group_id = 4744311978888504;
        dbms_output.put_line('GRN horizontal synchronization added.');
    else
        dbms_output.put_line('GRN horizontal synchronization already present.');
    end if;
end;
/
commit;

select case
         when dbms_lob.instr(javascript_code, 'GRN_DETAIL_HORIZONTAL_SYNC_V3') > 0
           then 'VERIFIED: horizontal synchronization is present'
         else 'ERROR: horizontal synchronization is missing'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 146
   and security_group_id = 4744311978888504;
