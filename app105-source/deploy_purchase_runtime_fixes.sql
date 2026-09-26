whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on
connect -name IMART
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\deploy_purchase_compatibility_views.sql"
begin
  apex_application_install.set_application_id(105);
  apex_application_install.set_workspace_id(4744311978888504);
  apex_application_install.set_schema('IMART');
  apex_application_install.set_offset(934000000000000000);
end;
/
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\hspl-purchase-parity\p00934.sql"
commit;
prompt PURCHASE_RUNTIME_FIXES_DEPLOYED
exit
