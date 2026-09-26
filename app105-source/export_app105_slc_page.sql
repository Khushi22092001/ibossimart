whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\slc-live-temp-export"
apex export-components -applicationid 105 -expcomponents "PAGE:721" -exptype SQL -skipexportdate -exporiginalids -overwrite-files
exit
