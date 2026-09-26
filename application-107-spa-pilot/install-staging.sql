whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART
declare
  l_count number;
begin
  select count(*) into l_count from apex_260100.wwv_flows where id = 107;
  if l_count > 0 then
    raise_application_error(-20001, 'Staging app 107 already exists');
  end if;
end;
/
begin
  apex_application_install.set_application_id(107);
  apex_application_install.generate_offset;
  apex_application_install.set_application_alias('IMARTSPA107');
  apex_application_install.set_application_name('Imart SPA Pilot 107');
end;
/
@application-107-spa-pilot/f105.sql
exit
