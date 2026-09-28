whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd C:/Users/shree/Documents/git projects/ibosssagar/app105-source/deployments/po-crud-repair-20260927/live-after
apex export-components -applicationid 105 -expcomponents "PAGE:118" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
