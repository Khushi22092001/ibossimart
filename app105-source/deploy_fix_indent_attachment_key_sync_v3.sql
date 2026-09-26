whenever sqlerror exit failure rollback
set define off
set pages 100
set lines 1000
set long 10000
set longchunksize 10000
connect -name IMART

/*
  Page 108 (Indent) only.

  The form region renders its database primary-key item blank for a new row,
  even though the BEFORE HEADER process already allocated the attachment TNO.
  Lock that server value into the hidden item at the user's attachment click,
  before the dialog opens. The existing dialog-close refresh and final page
  submit then serialize the same key.

  Retain the LEFT JOIN used by the attachment report so a valid saved file is
  visible even when its optional Attribute has not been mapped.
*/
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
/* HSPL_INDENT_ATTACHMENT_KEY_SYNC_V1
   The new-record TNO is allocated in session state after form initialization,
   while the form-region primary-key item can still render blank. Keep the
   browser items aligned so attachment refresh and final submit use one key. */
(function () {
    var tno = '&P108_TNO.';
    var formStatus = '&P108_FORMSTATUS.';
    if (!$v('P108_TNO') && tno) {
        apex.item('P108_TNO').setValue(tno, null, true);
    }
    if (!$v('P108_FORMSTATUS') && formStatus) {
        apex.item('P108_FORMSTATUS').setValue(formStatus, null, true);
    }
})();~', '');

  l_js := replace(l_js, q'~
/* HSPL_INDENT_ATTACHMENT_KEY_SYNC_V2
   Force the rendered session key into the real hidden inputs after delayed
   item initialization so AJAX refresh and submit serialize the same TNO. */
(function () {
    var tno = '&P108_TNO.';
    var formStatus = '&P108_FORMSTATUS.';
    function syncIndentAttachmentKey() {
        var tnoElement = document.getElementById('P108_TNO');
        var statusElement = document.getElementById('P108_FORMSTATUS');
        if (tno) {
            apex.item('P108_TNO').setValue(tno, null, true);
            if (tnoElement) tnoElement.value = tno;
        }
        if (formStatus) {
            apex.item('P108_FORMSTATUS').setValue(formStatus, null, true);
            if (statusElement) statusElement.value = formStatus;
        }
    }
    syncIndentAttachmentKey();
    apex.gPageContext$.one('apexreadyend.hsplIndentAttachmentKey', syncIndentAttachmentKey);
})();~', '');

  if dbms_lob.instr(l_js, 'HSPL_INDENT_ATTACHMENT_KEY_SYNC_V3') = 0 then
    l_js := l_js || to_clob(chr(10)) || q'~
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
})();~';
  end if;

  update apex_260100.wwv_flow_steps
     set javascript_code_onload = l_js,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 108
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Expected exactly one Page 108 update.');
  end if;

  update apex_260100.wwv_flow_page_plugs
     set plug_source = q'~select A.TNO,
       A.ATTRIBUTEVALUE,
       A.ATTACHMENTBLOB,
       A.FILENAME,
       A.ATTRIBUTECODE,
       A.MODULETNO,
       A.MODULESNO,
       b.PARTYATTRIBUTEname
  from MODULEATTACHMENT A
  left join partyattribute b
    on a.ATTRIBUTECODE = b.PARTYATTRIBUTECODE
 where A.MODULETNO = :P108_TNO~',
         last_updated_on = sysdate
   where flow_id = 105
     and page_id = 108
     and id = 1126326824023815957
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20002,
      'Expected exactly one Page 108 Attachment region update.');
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
         when dbms_lob.instr(s.javascript_code_onload,
                'HSPL_INDENT_ATTACHMENT_KEY_SYNC_V3') > 0
          and dbms_lob.instr(s.javascript_code_onload,
                'HSPL_INDENT_ATTACHMENT_KEY_SYNC_V1') = 0
          and dbms_lob.instr(s.javascript_code_onload,
                'HSPL_INDENT_ATTACHMENT_KEY_SYNC_V2') = 0
          and dbms_lob.instr(p.plug_source,
                'left join partyattribute') > 0
         then 'INDENT_ATTACHMENT_KEY_SYNC_V3_DEPLOYED'
         else 'INDENT_ATTACHMENT_KEY_SYNC_V3_MISSING'
       end as deployment_status
  from apex_260100.wwv_flow_steps s
  join apex_260100.wwv_flow_page_plugs p
    on p.flow_id = s.flow_id
   and p.page_id = s.id
   and p.id = 1126326824023815957
 where s.flow_id = 105
   and s.id = 108
   and s.security_group_id = 4744311978888504;

exit
