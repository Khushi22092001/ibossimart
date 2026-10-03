whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART
select id, name from apex_260100.wwv_flows where id=105 and security_group_id=4744311978888504;
select file_name, id from apex_260100.wwv_flow_static_files where flow_id=105 and (file_name like '%first-paint%' or id in (7712990000000106+7541489808702750,7712990000000107+7541489808702750));
apex export -applicationid 105 -dir app105-source/backups/register-first-paint-before-20260929
exit
