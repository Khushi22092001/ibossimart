whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd C:/Users/shree/Documents/git projects/ibosssagar/app105-source/deployments/enquiry-button-layout-20260927/live-after
apex export-components -applicationid 105 -expcomponents "PAGE:708" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
