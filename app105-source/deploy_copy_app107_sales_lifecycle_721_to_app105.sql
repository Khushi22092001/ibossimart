whenever sqlerror exit failure rollback
set define off
connect -name IMART
begin
  apex_application_install.set_application_id(105);
  apex_application_install.generate_offset;
end;
/
@"C:\Users\shree\Documents\git projects\ibosssagar\app107-sales-lifecycle-export\f107\application\pages\page_00721.sql"
@"C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\pages\page_00901.sql"
commit;
exit
