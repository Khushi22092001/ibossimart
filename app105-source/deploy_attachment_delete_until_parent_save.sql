set define off verify off feedback on serveroutput on
whenever sqlerror exit sql.sqlcode rollback
connect -name IMART

begin
  apex_util.set_security_group_id(4744311978888504);
end;
/

prompt Deploying shared attachment delete lock
@app105-source/export/f105/application/pages/page_01063.sql

declare
  l_count number;
begin
  update apex_260100.wwv_flow_worksheets
     set detail_link = regexp_replace(
           detail_link,
           '^(.*:1063:)([^:]+):(.*)$',
           '\1\2,P1063_PARENT_FORMSTATUS:\3,' || chr(38) || 'P' || page_id || '_FORMSTATUS.')
   where flow_id = 105
     and security_group_id = 4744311978888504
     and instr(detail_link, ':1063:') > 0
     and instr(detail_link, 'P1063_PARENT_FORMSTATUS') = 0;
  l_count := sql%rowcount;
  if l_count <> 25 then
    raise_application_error(-20001, 'Expected 25 attachment report links, found ' || l_count);
  end if;

  update apex_260100.wwv_flow_page_plugs
     set plug_source = replace(
           replace(
             plug_source,
             q'~p_items => 'P1063_MODULETNO,P1063_MODULESNO'~',
             q'~p_items => 'P1063_MODULETNO,P1063_MODULESNO,P1063_PARENT_FORMSTATUS'~'),
           q'~p_values => to_char(a.tno) || ',' || to_char(a.sno)~',
           q'~p_values => to_char(a.tno) || ',' || to_char(a.sno) || ',' || V('P660_FORMSTATUS')~'),
         last_updated_on = sysdate
   where flow_id = 105
     and page_id = 660
     and security_group_id = 4744311978888504
     and dbms_lob.instr(plug_source, 'P1063_MODULETNO,P1063_MODULESNO') > 0;
  l_count := sql%rowcount;
  if l_count <> 1 then
    raise_application_error(-20002, 'Expected Page 660 attachment region source, found ' || l_count);
  end if;

  update apex_260100.wwv_flow_region_columns
     set link_target = 'f?p=' || chr(38) || 'APP_ID.:1063:' || chr(38) ||
                       'SESSION.::' || chr(38) || 'DEBUG.:1063:P1063_PARENT_FORMSTATUS:' ||
                       chr(38) || 'P660_FORMSTATUS.',
         default_expression = replace(
           replace(
             default_expression,
             q'~p_items => 'P1063_MODULETNO,P1063_MODULESNO'~',
             q'~p_items => 'P1063_MODULETNO,P1063_MODULESNO,P1063_PARENT_FORMSTATUS'~'),
           q'~p_values => V('P660_TNO') || ',' || V('P660_SNO')~',
           q'~p_values => V('P660_TNO') || ',' || V('P660_SNO') || ',' || V('P660_FORMSTATUS')~'),
         last_updated_on = sysdate
   where flow_id = 105
     and page_id = 660
     and name = 'ATTACHMENT'
     and security_group_id = 4744311978888504;
  l_count := sql%rowcount;
  if l_count <> 1 then
    raise_application_error(-20003, 'Expected Page 660 attachment column, found ' || l_count);
  end if;

  commit;
end;
/

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd     => '2026.03.30',
    p_release                => '26.1.2',
    p_default_workspace_id   => 4744311978888504,
    p_default_application_id => 105,
    p_default_id_offset      => 7541489808702750,
    p_default_owner          => 'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/

select case when
       (select count(*)
          from apex_260100.wwv_flow_worksheets
         where flow_id = 105
           and security_group_id = 4744311978888504
           and instr(detail_link, ':1063:') > 0
           and instr(detail_link, 'P1063_PARENT_FORMSTATUS') = 0) = 0
   and (select count(*)
          from apex_260100.wwv_flow_step_items
         where flow_id = 105
           and flow_step_id = 1063
           and name = 'P1063_PARENT_FORMSTATUS'
           and security_group_id = 4744311978888504) = 1
  then 'ATTACHMENT_DELETE_LOCK_DEPLOYED'
  else 'ATTACHMENT_DELETE_LOCK_INCOMPLETE'
  end deployment_status
from dual;

exit
