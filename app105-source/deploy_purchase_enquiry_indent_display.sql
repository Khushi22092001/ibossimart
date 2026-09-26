whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

begin
  update apex_260100.wwv_flow_ig_report_columns
     set is_visible = 'N'
   where id = 180921114715944104
     and view_id = 180919679109944091
     and column_id = 180315930798349670
     and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Purchase Enquiry INDENTTNO report column was not updated');
  end if;

  update apex_260100.wwv_flow_ig_report_columns
     set is_visible = 'Y',
         display_seq = 3,
         width = 492
   where id = 180964828793901701
     and view_id = 180919679109944091
     and column_id = 180945622615655147
     and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Purchase Enquiry INDENTNO report column was not updated');
  end if;
end;
/
commit;

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
exit
