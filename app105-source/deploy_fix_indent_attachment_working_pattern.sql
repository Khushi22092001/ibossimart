whenever sqlerror exit failure rollback
set define off
set pages 100
set lines 1000
set long 10000
set longchunksize 10000
connect -name IMART

/*
  Page 108 (Indent) only.

  Match the proven attachment implementation used by Purchase Bill Page 143:
  use the parent form TNO directly for the dialog, report, AJAX submission,
  and native after-dialog-close refresh.  The experimental second attachment
  key is deliberately removed from the active flow.
*/
declare
begin
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
         ajax_items_to_submit = 'P108_TNO',
         last_updated_on = sysdate
   where flow_id = 105
     and page_id = 108
     and id = 1126326824023815957
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Expected one Page 108 Attachment region.');
  end if;

  update apex_260100.wwv_flow_step_buttons
     set button_redirect_url =
           'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:63:P63_MODULETNO:&P108_TNO.',
         last_updated_on = sysdate
   where flow_id = 105
     and flow_step_id = 108
     and id = 38638257909424854
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Expected one Page 108 Add Attachment button.');
  end if;

  update apex_260100.wwv_flow_page_da_actions
     set action = 'NATIVE_REFRESH',
         affected_elements_type = 'REGION',
         affected_region_id = 1126326824023815957,
         attributes = json_object('maintain_pagination' value 'N' returning clob),
         last_updated_on = sysdate
   where flow_id = 105
     and id = 38671413895424869
     and event_id = 38670868376424869
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20003, 'Expected one Page 108 Attachment refresh action.');
  end if;

  update apex_260100.wwv_flow_step_processing
     set process_sql_clob = q'~If :P108_TNO is null then
    :P108_TNO := GlobalTNo.nextval;
    :P108_FORMSTATUS := 'NEWRECORD';
else
    :P108_FORMSTATUS := 'EDITRECORD';
End if;~',
         last_updated_on = sysdate
   where flow_id = 105
     and flow_step_id = 108
     and id = 38643897086424860
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20004, 'Expected one Page 108 Get TNo process.');
  end if;

  update apex_260100.wwv_flow_step_processing
     set process_sql_clob = replace(process_sql_clob,
       q'~     if :P108_Tno is null then
        :P108_Tno := :P108_ATTACHMENT_TNO;
     end if;
~', ''),
         last_updated_on = sysdate
   where flow_id = 105
     and flow_step_id = 108
     and id = 38645102835424860
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20005, 'Expected one Page 108 Get Document No process.');
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
         when dbms_lob.instr(p.plug_source, ':P108_TNO') > 0
          and dbms_lob.instr(p.plug_source, ':P108_ATTACHMENT_TNO') = 0
          and p.ajax_items_to_submit = 'P108_TNO'
          and instr(b.button_redirect_url, '&P108_TNO.') > 0
          and a.action = 'NATIVE_REFRESH'
          and a.affected_region_id = 1126326824023815957
         then 'INDENT_ATTACHMENT_WORKING_PATTERN_DEPLOYED'
         else 'INDENT_ATTACHMENT_WORKING_PATTERN_MISSING'
       end deployment_status
  from apex_260100.wwv_flow_page_plugs p
  join apex_260100.wwv_flow_step_buttons b
    on b.flow_id = p.flow_id
   and b.flow_step_id = p.page_id
   and b.id = 38638257909424854
  join apex_260100.wwv_flow_page_da_actions a
    on a.flow_id = p.flow_id
   and a.id = 38671413895424869
 where p.flow_id = 105
   and p.page_id = 108
   and p.id = 1126326824023815957
   and p.security_group_id = 4744311978888504;

exit
