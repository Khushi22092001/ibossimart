whenever sqlerror exit failure rollback
set define off
set pages 100
set lines 1000
set long 10000
set longchunksize 10000
connect -name IMART

/*
  Page 108 (Indent) only.

  Keep a dedicated, non-form attachment key because the form-region primary
  key is sourced from the not-yet-inserted database row and therefore renders
  blank for a new Indent. The attachment dialog, report refresh, and master
  insert all use this stable server-generated key.
*/
declare
  l_count number;
begin
  select count(*)
    into l_count
    from apex_260100.wwv_flow_step_items
   where flow_id = 105
     and flow_step_id = 108
     and name = 'P108_ATTACHMENT_TNO'
     and security_group_id = 4744311978888504;

  if l_count = 0 then
    wwv_flow_imp.component_begin(
      p_version_yyyy_mm_dd      => '2026.03.30',
      p_release                 => '26.1.2',
      p_default_workspace_id    => 4744311978888504,
      p_default_application_id  => 105,
      p_default_id_offset       => 7541489808702750,
      p_default_owner           => 'IMART');

    wwv_flow_imp_page.create_page_item(
      p_id                  => 1209000000000108108,
      p_flow_id             => 105,
      p_flow_step_id        => 108,
      p_name                => 'P108_ATTACHMENT_TNO',
      p_item_sequence       => 340,
      p_item_plug_id        => 1054243385060752704,
      p_use_cache_before_default => 'NO',
      p_item_default        => q'~declare
    l_tno number;
begin
    if :P108_TNO is not null then
        return :P108_TNO;
    end if;
    select GlobalTNo.nextval into l_tno from dual;
    return l_tno;
end;~',
      p_item_default_type   => 'FUNCTION_BODY',
      p_item_default_language => 'PLSQL',
      p_display_as          => 'NATIVE_HIDDEN',
      p_is_persistent       => 'N',
      p_attributes          => wwv_flow_t_plugin_attributes(
                                 wwv_flow_t_varchar2(
                                   'value_protected', 'N')).to_clob);

    wwv_flow_imp.component_end;
  elsif l_count <> 1 then
    raise_application_error(-20001,
      'Unexpected P108_ATTACHMENT_TNO item count: ' || l_count);
  end if;

  update apex_260100.wwv_flow_step_items
     set item_default = q'~declare
    l_tno number;
begin
    if :P108_TNO is not null then
        return :P108_TNO;
    end if;
    select GlobalTNo.nextval into l_tno from dual;
    return l_tno;
end;~',
         use_cache_before_default = 'NO',
         item_default_type = 'FUNCTION_BODY',
         item_default_language = 'PLSQL',
         last_updated_on = sysdate
   where flow_id = 105
     and flow_step_id = 108
     and name = 'P108_ATTACHMENT_TNO'
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20007,
      'Expected one Page 108 attachment key item update.');
  end if;

  update apex_260100.wwv_flow_step_processing
     set process_sql_clob = q'~If :P108_TNO is null then
    :P108_TNO := GlobalTNo.nextval;
    :P108_FORMSTATUS := 'NEWRECORD';
else
    :P108_FORMSTATUS := 'EDITRECORD';
End if;

:P108_ATTACHMENT_TNO := :P108_TNO;~',
         last_updated_on = sysdate
   where flow_id = 105
     and flow_step_id = 108
     and id = 38643897086424860
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Expected one Page 108 Get TNo process.');
  end if;

  update apex_260100.wwv_flow_step_processing
     set process_sql_clob = q'~declare
    tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);
    tmp         number ;
begin
     if :P108_Tno is null then
        :P108_Tno := :P108_ATTACHMENT_TNO;
     end if;
     if :P108_Tno is null then
        Select GlobalTno.NextVal into :P108_Tno From Dual;
     end if;
    ----
    if :P108_INDENTNO is null then
            SetDocNoNext(
                    tModuleCode,
                    :global_CompanyCode,
                    :global_FinancialYearCode,
                    :P108_LocationCode,
                    :P108_DocTypeCode,
                    NULL,
                    TO_DATE(:P108_INDENTDATE, 'DD-MM-RRRR')
                );
        :P108_INDENTNO := GetDocNo(
                    tModuleCode,
                    :global_CompanyCode,
                    :global_FinancialYearCode,
                    :P108_LocationCode,
                    :P108_DocTypeCode,
                    NULL,
                    TO_DATE(:P108_INDENTDATE, 'DD-MM-RRRR')
                    );
    end if;
end;~',
         last_updated_on = sysdate
   where flow_id = 105
     and flow_step_id = 108
     and id = 38645102835424860
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20003,
      'Expected one Page 108 Get Document No process.');
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
 where A.MODULETNO = :P108_ATTACHMENT_TNO~',
         ajax_items_to_submit = 'P108_ATTACHMENT_TNO',
         last_updated_on = sysdate
   where flow_id = 105
     and page_id = 108
     and id = 1126326824023815957
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20004,
      'Expected one Page 108 Attachment region.');
  end if;

  update apex_260100.wwv_flow_step_buttons
     set button_redirect_url =
           'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:63:P63_MODULETNO:&P108_ATTACHMENT_TNO.',
         last_updated_on = sysdate
   where flow_id = 105
     and flow_step_id = 108
     and id = 38638257909424854
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20005,
      'Expected one Page 108 Add Attachment button.');
  end if;

  update apex_260100.wwv_flow_page_da_actions
     set action = 'NATIVE_JAVASCRIPT_CODE',
         affected_elements_type = null,
         affected_region_id = null,
         attributes = json_object(
           'js_code' value q'~(function () {
    var tno = '&P108_ATTACHMENT_TNO.';
    var item = document.getElementById('P108_ATTACHMENT_TNO');
    if (tno && item) {
        item.value = tno;
        apex.item('P108_ATTACHMENT_TNO').setValue(tno, null, true);
    }
    apex.region('Attachment').refresh();
})();~' returning clob),
         last_updated_on = sysdate
   where flow_id = 105
     and id = 38671413895424869
     and event_id = 38670868376424869
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20008,
      'Expected one Page 108 Attachment refresh action.');
  end if;

  update apex_260100.wwv_flow_steps
     set javascript_code_onload = replace(javascript_code_onload, q'~
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
})();~', ''),
         last_updated_on = sysdate
   where flow_id = 105
     and id = 108
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20006, 'Expected one Page 108 page definition.');
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
         when (select count(*)
                 from apex_260100.wwv_flow_step_items i
                where i.flow_id = 105
                  and i.flow_step_id = 108
                  and i.name = 'P108_ATTACHMENT_TNO') = 1
          and dbms_lob.instr(p.plug_source,
                ':P108_ATTACHMENT_TNO') > 0
          and p.ajax_items_to_submit = 'P108_ATTACHMENT_TNO'
          and instr(b.button_redirect_url, '&P108_ATTACHMENT_TNO.') > 0
          and a.action = 'NATIVE_JAVASCRIPT_CODE'
          and dbms_lob.instr(a.attributes,
                'P108_ATTACHMENT_TNO') > 0
          and dbms_lob.instr(s.javascript_code_onload,
                'HSPL_INDENT_ATTACHMENT_KEY_SYNC_V4') = 0
         then 'INDENT_ATTACHMENT_STABLE_KEY_DEPLOYED'
         else 'INDENT_ATTACHMENT_STABLE_KEY_MISSING'
       end as deployment_status
  from apex_260100.wwv_flow_steps s
  join apex_260100.wwv_flow_page_plugs p
    on p.flow_id = s.flow_id
   and p.page_id = s.id
   and p.id = 1126326824023815957
  join apex_260100.wwv_flow_step_buttons b
    on b.flow_id = s.flow_id
   and b.flow_step_id = s.id
   and b.id = 38638257909424854
  join apex_260100.wwv_flow_page_da_actions a
    on a.flow_id = s.flow_id
   and a.id = 38671413895424869
 where s.flow_id = 105
   and s.id = 108
   and s.security_group_id = 4744311978888504;

exit
