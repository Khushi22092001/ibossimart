whenever sqlerror exit sql.sqlcode
connect -name IMART
begin
  apex_util.set_security_group_id(4744311978888504);
end;
/
apex export -applicationid 105 -dir "C:\Users\shree\Documents\git projects\ibosssagar\application-107-spa-pilot"
exit
