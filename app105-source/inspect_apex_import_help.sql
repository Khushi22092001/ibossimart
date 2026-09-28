set define off
whenever sqlerror exit sql.sqlcode rollback
connect -name IMART

apex import -help

exit
