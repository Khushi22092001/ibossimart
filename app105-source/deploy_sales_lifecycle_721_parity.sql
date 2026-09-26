whenever sqlerror exit sql.sqlcode rollback
set define off
set verify off
set serveroutput on

connect -name IMART

@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\deploy_slc_compatibility_views.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\deploy_slc_unified_fulfilment_views.sql"

connect -name IMART

@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\deploy_dashboard_fast_runtime.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\deploy_dashboard_fast_charts.sql"

connect -name IMART

begin
    apex_util.set_security_group_id(4744311978888504);
end;
/

begin
    apex_application_install.set_application_id(105);
    apex_application_install.set_offset(721000000000000000);
end;
/

@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\hspl_page_00721_parity.sql"

commit;
prompt SALES_LIFECYCLE_721_PARITY_DEPLOYED
exit
