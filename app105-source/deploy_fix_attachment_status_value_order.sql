set define off verify off feedback on serveroutput on
whenever sqlerror exit sql.sqlcode rollback
connect -name IMART

declare
  l_count number;
begin
  update apex_260100.wwv_flow_worksheets
     set detail_link = regexp_replace(
           detail_link,
           '#SNO#,' || chr(38) || 'P([0-9]+)_FORMSTATUS[.]$',
           ',' || chr(38) || 'P\1_FORMSTATUS.#SNO#')
   where flow_id = 105
     and security_group_id = 4744311978888504
     and instr(detail_link, 'P1063_PARENT_FORMSTATUS') > 0
     and regexp_like(detail_link, '#SNO#,' || chr(38) || 'P[0-9]+_FORMSTATUS[.]$');
  l_count := sql%rowcount;
  if l_count <> 21 then
    raise_application_error(-20001, 'Expected 21 live legacy #SNO# links, found ' || l_count);
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

select case when count(*) = 0
       then 'ATTACHMENT_STATUS_VALUE_ORDER_FIXED'
       else 'ATTACHMENT_STATUS_VALUE_ORDER_REMAINS'
       end deployment_status
  from apex_260100.wwv_flow_worksheets
 where flow_id = 105
   and security_group_id = 4744311978888504
   and regexp_like(detail_link, '#SNO#,' || chr(38) || 'P[0-9]+_FORMSTATUS[.]$');

exit
