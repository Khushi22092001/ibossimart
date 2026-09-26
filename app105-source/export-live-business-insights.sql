whenever sqlerror exit failure rollback
connect -name IMART
apex export -applicationid 105 -split -skipExportDate -dir "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export"
exit
