connect -name IMART
set sqlformat csv
set pagesize 50000
spool app105-source/verification/creator-columns-last-20261003.csv
select count(*) ir_audit_columns,count(distinct worksheet_id) ir_regions from imart_auditcol_ir_bak_20261003;
select count(*) ig_audit_columns,count(distinct region_id) ig_regions from imart_auditcol_ig_bak_20261003;
select count(*) visibility_changes from apex_260100.wwv_flow_worksheet_columns c join imart_auditcol_ir_bak_20261003 b on b.id=c.id where decode(c.display_in_default_rpt,b.display_in_default_rpt,0,1)<>0;
select count(*) visibility_changes from apex_260100.wwv_flow_ig_report_columns c join imart_auditcol_igrc_bak_20261003 b on b.id=c.id where decode(c.is_visible,b.is_visible,0,1)<>0;
select r.page_id,r.id,r.report_columns old_columns,c.report_columns new_columns from imart_auditcol_rpt_bak_20261003 r join apex_260100.wwv_flow_worksheet_rpts c on c.id=r.id where r.report_columns<>c.report_columns order by r.page_id;
select p.page_id,p.plug_name,c.column_alias,c.hidden_column from apex_260100.wwv_flow_region_report_column c join apex_260100.wwv_flow_page_plugs p on p.id=c.region_id join apex_260100.wwv_flow_steps s on s.flow_id=p.flow_id and s.id=p.page_id where p.flow_id=105 and p.page_id<800 and p.plug_source_type='NATIVE_SQL_REPORT' and regexp_like(s.name,'register|list|master|report','i') and not regexp_like(s.name,'dashboard|analytics|insights|360|command|control tower|prototype|testing','i') and regexp_replace(upper(c.column_alias),'[^A-Z]','') in ('CREATOR','CREATIONTIME','CREATIONDATE','CREATEDBY','CREATEDON','CREATEDAT');
spool off
exit
