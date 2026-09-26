whenever sqlerror exit failure rollback
set define off
set pages 100
set lines 1000
connect -name IMART

declare
begin
  update apex_260100.wwv_flow_step_buttons
     set button_redirect_url =
           'f?p=&APP_ID.:1063:&SESSION.::&DEBUG.:1063:P1063_MODULETNO:&P108_TNO.',
         last_updated_on = sysdate
   where flow_id = 105
     and flow_step_id = 108
     and id = 38638257909424854
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Expected one Page 108 Add Attachment button.');
  end if;

  update apex_260100.wwv_flow_worksheets
     set detail_link =
           'f?p=&APP_ID.:1063:&SESSION.::&DEBUG.:1063:P1063_MODULESNO,P1063_MODULETNO:#MODULESNO#,#MODULETNO##SNO#'
   where flow_id = 105
     and page_id = 108
     and id = 1126327568598815965
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Expected one Page 108 Attachment worksheet.');
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
                 from apex_260100.wwv_flow_steps
                where flow_id = 105
                  and id = 1063
                  and security_group_id = 4744311978888504) = 1
          and instr(button_redirect_url,
                    ':1063:&SESSION.::&DEBUG.:1063:P1063_MODULETNO:&P108_TNO.') > 0
         then 'INDENT_DEDICATED_ATTACHMENT_DEPLOYED'
         else 'INDENT_DEDICATED_ATTACHMENT_MISSING'
       end deployment_status
  from apex_260100.wwv_flow_step_buttons
 where flow_id = 105
   and flow_step_id = 108
   and id = 38638257909424854
   and security_group_id = 4744311978888504;

exit
