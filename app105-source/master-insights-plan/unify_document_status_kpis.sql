whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART
update imart_mr_register r set status_expression=
case when page_id=58 then 'mr_source.STATUS'
when exists(select 1 from apex_260100.wwv_flow_worksheet_columns w where w.flow_id=105 and w.page_id=r.page_id and w.db_column_name='TNO') then
'(select ds.documentstatuscode from documentstatusdetail ds where ds.modulecode='''||replace(r.module_code,'''','''''')||''' and ds.moduletno=mr_source.TNO fetch first 1 row only)' end;
commit;
exit
