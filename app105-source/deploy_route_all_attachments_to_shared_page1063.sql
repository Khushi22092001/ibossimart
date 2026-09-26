set define off verify off feedback on serveroutput on
whenever sqlerror exit sql.sqlcode rollback
connect -name IMART

begin
  apex_util.set_security_group_id(4744311978888504);
end;
/

prompt Refreshing the proven shared Attachment Page 1063
@app105-source/export/f105/application/pages/page_01063.sql

declare
  l_count number;
begin
  update apex_260100.wwv_flow_step_buttons
     set button_redirect_url = replace(replace(button_redirect_url, ':63:', ':1063:'), 'P63_', 'P1063_'),
         last_updated_on = sysdate
   where flow_id = 105
     and security_group_id = 4744311978888504
     and (instr(button_redirect_url, ':63:') > 0 or instr(button_redirect_url, 'P63_') > 0);
  l_count := sql%rowcount;
  if l_count <> 34 then
    raise_application_error(-20001, 'Expected 34 attachment button links, found ' || l_count);
  end if;

  update apex_260100.wwv_flow_worksheets
     set detail_link = replace(replace(detail_link, ':63:', ':1063:'), 'P63_', 'P1063_')
   where flow_id = 105
     and security_group_id = 4744311978888504
     and (instr(detail_link, ':63:') > 0 or instr(detail_link, 'P63_') > 0);
  l_count := sql%rowcount;
  if l_count <> 24 then
    raise_application_error(-20002, 'Expected 24 attachment report links, found ' || l_count);
  end if;

  update apex_260100.wwv_flow_region_columns
     set link_target = replace(replace(link_target, ':63:', ':1063:'), 'P63_', 'P1063_')
   where flow_id = 105
     and security_group_id = 4744311978888504
     and (instr(link_target, ':63:') > 0 or instr(link_target, 'P63_') > 0);
  l_count := sql%rowcount;
  if l_count <> 1 then
    raise_application_error(-20003, 'Expected 1 attachment region-column link, found ' || l_count);
  end if;

  update apex_260100.wwv_flow_region_columns
     set default_expression = replace(replace(default_expression, ':63:', ':1063:'), 'P63_', 'P1063_')
   where flow_id = 105
     and security_group_id = 4744311978888504
     and (instr(default_expression, ':63:') > 0 or instr(default_expression, 'P63_') > 0);
  l_count := sql%rowcount;
  if l_count <> 1 then
    raise_application_error(-20004, 'Expected 1 attachment region-column expression, found ' || l_count);
  end if;

  update apex_260100.wwv_flow_page_plugs
     set plug_source = replace(
                         replace(
                           replace(plug_source, 'p_page => ''63''', 'p_page => ''1063'''),
                           ':63:', ':1063:'),
                         'P63_', 'P1063_'),
         last_updated_on = sysdate
   where flow_id = 105
     and page_id <> 63
     and security_group_id = 4744311978888504
     and (dbms_lob.instr(plug_source, 'p_page => ''63''') > 0
          or dbms_lob.instr(plug_source, ':63:') > 0
          or dbms_lob.instr(plug_source, 'P63_') > 0);
  l_count := sql%rowcount;
  if l_count <> 1 then
    raise_application_error(-20005, 'Expected 1 attachment-generating region source, found ' || l_count);
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
       (select count(*) from apex_260100.wwv_flow_step_buttons
         where flow_id = 105 and security_group_id = 4744311978888504
           and (instr(button_redirect_url, ':63:') > 0 or instr(button_redirect_url, 'P63_') > 0)) = 0
   and (select count(*) from apex_260100.wwv_flow_worksheets
         where flow_id = 105 and security_group_id = 4744311978888504
           and (instr(detail_link, ':63:') > 0 or instr(detail_link, 'P63_') > 0)) = 0
   and (select count(*) from apex_260100.wwv_flow_region_columns
         where flow_id = 105 and security_group_id = 4744311978888504
           and ((instr(link_target, ':63:') > 0 or instr(link_target, 'P63_') > 0)
             or (instr(default_expression, ':63:') > 0 or instr(default_expression, 'P63_') > 0))) = 0
  then 'ALL_ATTACHMENT_CALLERS_ROUTED_TO_PAGE_1063'
  else 'OLD_PAGE_63_REFERENCES_REMAIN'
  end deployment_status
from dual;

exit
