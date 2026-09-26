whenever sqlerror exit failure rollback
set define off
connect -name IMART
apex export -applicationid 107 -split -skipExportDate -dir "C:\Users\shree\Documents\git projects\ibosssagar\app107-sales-lifecycle-export"
exit
