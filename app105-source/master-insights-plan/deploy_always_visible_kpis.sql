whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART
create table imart_mr_visible_backup as select id,plug_source from apex_260100.wwv_flow_page_plugs where flow_id=105 and static_id like 'mr-kpi-shell-%';
create table imart_mr_visible_btn_backup as select * from apex_260100.wwv_flow_step_buttons where flow_id=105 and button_name='MASTER_KPI_CARDS' and id between 2026100200000000 and 2026100201000000;
delete from apex_260100.wwv_flow_step_buttons where flow_id=105 and button_name='MASTER_KPI_CARDS' and id between 2026100200000000 and 2026100201000000;
commit;
@app105-source/master-insights-plan/update_kpi_design.sql
