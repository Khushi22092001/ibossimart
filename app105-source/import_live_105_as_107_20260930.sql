connect -name IMART
whenever sqlerror exit sql.sqlcode rollback

begin
  apex_application_install.set_workspace_id(4744311978888504);
  apex_application_install.set_application_id(107);
  apex_application_install.set_application_alias('IMARTSPA107');
  apex_application_install.set_application_name('Imart');
  apex_application_install.set_schema('IMART');
  apex_application_install.generate_offset;
end;
/

@"C:\Users\shree\Downloads\f105.sql"
exit
