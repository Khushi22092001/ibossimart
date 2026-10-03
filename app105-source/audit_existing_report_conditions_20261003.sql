whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlformat csv
connect -name IMART
spool app105-source/verification/existing-report-conditions-20261003.csv
select p.id,p.page_id,p.plug_name,p.plug_required_role,p.plug_display_condition_type,p.plug_display_when_condition,p.plug_display_when_cond2,p.function_body_language from apex_260100.wwv_flow_page_plugs p join imart_rkpi_config c on c.region_id=p.id where p.flow_id=105 and (p.plug_required_role is not null or p.plug_display_condition_type is not null);
select s.id,s.name,s.alias,p.id region_id,p.plug_name,p.plug_required_role,p.plug_display_condition_type from apex_260100.wwv_flow_steps s join apex_260100.wwv_flow_page_plugs p on p.flow_id=s.flow_id and p.page_id=s.id where s.flow_id=105 and s.id in(90,103,111,113,115,121,139,201,214,216,219,310,351,375,523,613,617) and p.plug_source_type='NATIVE_IR';
spool off
exit
