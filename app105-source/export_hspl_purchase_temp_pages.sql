whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\hspl-purchase-temp-export"
apex export-components -applicationid 1900 -expcomponents "PAGE:682 PAGE:683" -exptype SQL -skipexportdate -exporiginalids -overwrite-files
exit
