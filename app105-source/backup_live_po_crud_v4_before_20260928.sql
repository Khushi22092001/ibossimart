whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd C:/Users/shree/Documents/git projects/ibosssagar/app105-source/backups/po-crud-v4-before-20260928/live-before
apex export-components -applicationid 105 -expcomponents "PAGE:118" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
