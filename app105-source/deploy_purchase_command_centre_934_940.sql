whenever sqlerror exit sql.sqlcode rollback
set define off
set verify off
set serveroutput on

connect -name IMART

@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\deploy_purchase_compatibility_views.sql"

connect -name IMART

begin
    apex_util.set_security_group_id(4744311978888504);
    apex_application_install.set_application_id(105);
    apex_application_install.set_offset(934000000000000000);
end;
/

@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\hspl-purchase-parity\p00934.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\hspl-purchase-parity\p00935.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\hspl-purchase-parity\p00936.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\hspl-purchase-parity\p00937.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\hspl-purchase-parity\p00938.sql"

-- The final two includes are added by the build after recovering the APEXlang
-- pages. Keeping one deployment entry point prevents partial manual imports.
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\hspl-purchase-parity\p00939_p00940.sql"

commit;
prompt PURCHASE_COMMAND_CENTRE_934_940_DEPLOYED
exit
