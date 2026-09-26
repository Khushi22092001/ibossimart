whenever sqlerror exit failure rollback
set define off
set pages 100
set lines 1000
set long 10000
set longchunksize 10000
connect -name IMART

select case
         when i.name = 'P108_ATTACHMENT_TNO'
          and i.item_default_type = 'FUNCTION_BODY'
          and i.use_cache_before_default = 'NO'
          and dbms_lob.instr(p.plug_source,
                ':P108_ATTACHMENT_TNO') > 0
          and p.ajax_items_to_submit = 'P108_ATTACHMENT_TNO'
          and instr(b.button_redirect_url,
                '&P108_ATTACHMENT_TNO.') > 0
          and a.action = 'NATIVE_JAVASCRIPT_CODE'
          and dbms_lob.instr(a.attributes,
                'P108_ATTACHMENT_TNO') > 0
          and dbms_lob.instr(a.attributes,
                'apex.region(''Attachment'').refresh') > 0
          and dbms_lob.instr(t.process_sql_clob,
                ':P108_ATTACHMENT_TNO := :P108_TNO') > 0
          and dbms_lob.instr(d.process_sql_clob,
                ':P108_Tno := :P108_ATTACHMENT_TNO') > 0
          and dbms_lob.instr(p.plug_source,
                'left join partyattribute') > 0
         then 'PASS'
         else 'FAIL'
       end as indent_attachment_fix
  from apex_260100.wwv_flow_step_items i
  join apex_260100.wwv_flow_page_plugs p
    on p.flow_id = i.flow_id
   and p.page_id = i.flow_step_id
   and p.id = 1126326824023815957
  join apex_260100.wwv_flow_step_buttons b
    on b.flow_id = i.flow_id
   and b.flow_step_id = i.flow_step_id
   and b.id = 38638257909424854
  join apex_260100.wwv_flow_page_da_actions a
    on a.flow_id = i.flow_id
   and a.id = 38671413895424869
  join apex_260100.wwv_flow_step_processing t
    on t.flow_id = i.flow_id
   and t.flow_step_id = i.flow_step_id
   and t.id = 38643897086424860
  join apex_260100.wwv_flow_step_processing d
    on d.flow_id = i.flow_id
   and d.flow_step_id = i.flow_step_id
   and d.id = 38645102835424860
 where i.flow_id = 105
   and i.flow_step_id = 108
   and i.name = 'P108_ATTACHMENT_TNO'
   and i.security_group_id = 4744311978888504;

exit
