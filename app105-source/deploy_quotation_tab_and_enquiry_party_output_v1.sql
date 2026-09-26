whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on pagesize 100 linesize 280
connect -name IMART

declare
  l_js    clob;
  l_attrs clob;
  l_obj   json_object_t;
  l_patch clob := q'~
/* HSPL_P710_QUOTATION_TAB_PARTY_OUTPUT_V1 */
(function ($) {
  "use strict";
  $(function () {
    $("#P710_QUOTATIONNO").attr("tabindex", "-1");
  });
})(apex.jQuery);
~';
begin
  select javascript_code
    into l_js
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 710
     and security_group_id = 4744311978888504
   for update;

  if dbms_lob.instr(nvl(l_js, empty_clob()),
       'HSPL_P710_QUOTATION_TAB_PARTY_OUTPUT_V1') = 0 then
    l_js := nvl(l_js, empty_clob()) || chr(10) || l_patch;
  end if;

  update apex_260100.wwv_flow_steps
     set javascript_code = l_js,
         last_updated_on = sysdate,
         last_updated_by = user
   where flow_id = 105
     and id = 710
     and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Page 710 JavaScript update count mismatch');
  end if;

  select attributes
    into l_attrs
    from apex_260100.wwv_flow_step_items
   where id = 364649077254483167
     and flow_id = 105
     and flow_step_id = 710
     and name = 'P710_ENQUIRYTNO'
     and security_group_id = 4744311978888504
   for update;

  l_obj := json_object_t.parse(l_attrs);
  l_obj.put('additional_outputs', 'PARTYCODE:P710_PARTYCODE');
  l_attrs := l_obj.to_clob;

  update apex_260100.wwv_flow_step_items
     set attributes = l_attrs,
         last_updated_on = sysdate,
         last_updated_by = user
   where id = 364649077254483167
     and flow_id = 105
     and flow_step_id = 710
     and name = 'P710_ENQUIRYTNO'
     and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'P710_ENQUIRYTNO update count mismatch');
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

select case when dbms_lob.instr(javascript_code,
       'HSPL_P710_QUOTATION_TAB_PARTY_OUTPUT_V1') > 0
            then 'QUOTATION_TAB_SKIP_OK' else 'QUOTATION_TAB_SKIP_MISSING' end tab_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 710 and security_group_id = 4744311978888504;

select case when json_value(attributes, '$.additional_outputs') =
                     'PARTYCODE:P710_PARTYCODE'
            then 'ENQUIRY_PARTY_OUTPUT_OK' else 'ENQUIRY_PARTY_OUTPUT_MISSING' end party_status
  from apex_260100.wwv_flow_step_items
 where id = 364649077254483167
   and flow_id = 105 and flow_step_id = 710
   and security_group_id = 4744311978888504;

exit
