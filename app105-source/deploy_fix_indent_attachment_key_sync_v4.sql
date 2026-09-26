whenever sqlerror exit failure rollback
set define off
set pages 100
set lines 1000
connect -name IMART

/* Page 108 only: use the guaranteed click event and re-apply the key after
   the dialog opener completes its own click handling. */
declare
  l_js clob;
begin
  select javascript_code_onload
    into l_js
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 108
     and security_group_id = 4744311978888504
   for update;

  l_js := replace(l_js, q'~
/* HSPL_INDENT_ATTACHMENT_KEY_SYNC_V3
   Lock the server-allocated new-record key before the attachment dialog
   opens. This prevents the blank form PK source from replacing the key used
   by the dialog, its parent-region refresh, and the final form submit. */
(function () {
    var tno = '&P108_TNO.';

    function syncIndentAttachmentKey() {
        var tnoElement = document.getElementById('P108_TNO');
        if (!tno || !tnoElement) {
            return;
        }
        tnoElement.value = tno;
        apex.item('P108_TNO').setValue(tno, null, true);
    }

    document.addEventListener('pointerdown', function (event) {
        if (event.target.closest('#ADDNEW_1')) {
            syncIndentAttachmentKey();
        }
    }, true);

    apex.gPageContext$.on('apexbeforepagesubmit.hsplIndentAttachmentKey',
        syncIndentAttachmentKey);
})();~', q'~
/* HSPL_INDENT_ATTACHMENT_KEY_SYNC_V4
   Lock the server-allocated new-record key before the attachment dialog
   opens. This prevents the blank form PK source from replacing the key used
   by the dialog, its parent-region refresh, and the final form submit. */
(function () {
    var tno = '&P108_TNO.';

    function syncIndentAttachmentKey() {
        var tnoElement = document.getElementById('P108_TNO');
        if (!tno || !tnoElement) {
            return;
        }
        tnoElement.value = tno;
        apex.item('P108_TNO').setValue(tno, null, true);
    }

    document.addEventListener('click', function (event) {
        if (event.target.closest('#ADDNEW_1')) {
            syncIndentAttachmentKey();
            window.setTimeout(syncIndentAttachmentKey, 0);
        }
    }, true);

    apex.gPageContext$.on('apexbeforepagesubmit.hsplIndentAttachmentKey',
        syncIndentAttachmentKey);
})();~');

  update apex_260100.wwv_flow_steps
     set javascript_code_onload = l_js,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 108
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Expected exactly one Page 108 update.');
  end if;

  commit;
end;
/

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd      => '2026.03.30',
    p_release                 => '26.1.2',
    p_default_workspace_id    => 4744311978888504,
    p_default_application_id  => 105,
    p_default_id_offset       => 7541489808702750,
    p_default_owner           => 'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select case
         when dbms_lob.instr(javascript_code_onload,
                'HSPL_INDENT_ATTACHMENT_KEY_SYNC_V4') > 0
          and dbms_lob.instr(javascript_code_onload,
                'HSPL_INDENT_ATTACHMENT_KEY_SYNC_V3') = 0
         then 'INDENT_ATTACHMENT_KEY_SYNC_V4_DEPLOYED'
         else 'INDENT_ATTACHMENT_KEY_SYNC_V4_MISSING'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 108
   and security_group_id = 4744311978888504;

exit
