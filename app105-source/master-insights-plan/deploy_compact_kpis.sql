whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART
create table imart_mr_compact_backup as select id,plug_source from apex_260100.wwv_flow_page_plugs where flow_id=105 and static_id like 'mr-kpi-shell-%';
@app105-source/master-insights-plan/update_kpi_design.sql
