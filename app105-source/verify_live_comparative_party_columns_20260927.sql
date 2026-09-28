whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd C:/Users/shree/Documents/git projects/ibosssagar/app105-source/deployments/comparative-party-columns-20260927-184000/live-after
apex export-components -applicationid 105 -expcomponents "PAGE:712" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
