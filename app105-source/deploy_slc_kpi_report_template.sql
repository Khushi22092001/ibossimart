whenever sqlerror exit sql.sqlcode rollback
set define off
set verify off
connect -name IMART

begin
    apex_application_install.set_application_id(105);
    apex_application_install.set_offset(0);
end;
/

@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\slc_kpi_report_template.sql"

commit;
prompt SLC_KPI_REPORT_TEMPLATE_DEPLOYED
exit
