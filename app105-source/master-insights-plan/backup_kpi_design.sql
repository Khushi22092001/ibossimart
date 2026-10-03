whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
create table imart_mr_design_backup as select id,static_id,plug_source from apex_260100.wwv_flow_page_plugs where flow_id=105 and static_id like 'mr-kpi-shell-%';
exit
